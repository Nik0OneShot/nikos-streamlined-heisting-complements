-- No aim assist
Hooks:PostHook(RaycastWeaponBase, "init", "shc_init", function(self)
	if self._autohit_data then
		self._autohit_current = 0
		self._autohit_data.INIT_RATIO = 0
		self._autohit_data.MIN_RATIO = 0
		self._autohit_data.MAX_RATIO = 0
	end
end)

-- Allow shooting with empty mag during bullet storm
Hooks:PostHook(RaycastWeaponBase, "clip_empty", "shc_clip_empty", function(self)
	if self._setup.user_unit == managers.player:player_unit() and managers.player:has_active_temporary_property("bullet_storm") then
		return false
	end
end)

Hooks:PostHook(RaycastWeaponBase, "out_of_ammo", "shc_out_of_ammo", function(self)
	if self._setup.user_unit == managers.player:player_unit() and managers.player:has_active_temporary_property("bullet_storm") then
		return false
	end
end)

-- Allow friendly fire hits with Revive dart
function ReviveInstantBulletBase:chk_friendly_fire()
	return false
end

function ReviveInstantBulletBase:give_revive_damage(hit_unit, user_unit)
	if not alive(hit_unit) then
		return
	end

	local base_ext = hit_unit:base()
	local dmg_ext = hit_unit:character_damage()
	if not base_ext or not dmg_ext or dmg_ext:dead() then
		return
	end

	local needs_revive
	if base_ext.is_husk_player then
		needs_revive = hit_unit:interaction():active() and hit_unit:movement():need_revive() and hit_unit:movement():current_state_name() ~= "arrested"
	elseif dmg_ext.need_revive then
		needs_revive = hit_unit:interaction() and dmg_ext:need_revive()
	end

	if needs_revive then
		hit_unit:interaction():interact(user_unit)
		return
	end

	if not hit_unit:movement().cool or hit_unit:movement():cool() then
		return
	end

	local char_tweak = base_ext and base_ext.char_tweak and base_ext:char_tweak()
	if not char_tweak or char_tweak.can_be_healed == false then
		return false
	end

	if dmg_ext and dmg_ext.do_medic_heal_and_action then
		dmg_ext:do_medic_heal_and_action(true)
	end
end

-- autofire soundfix, created by darkobalt and 90e, updated by offyerrocker.

--Original mod by 90e, uploaded by DarKobalt.
--Reverb fixed by Doctor Mister Cool, aka Didn'tMeltCables, aka DinoMegaCool
--New version uploaded and maintained by Offyerrocker.

--[[ this is here for debugging reasons, ignore it
local function dbug(...)
	OffyLib:c_log(...)
end
--]]

_G.AutoFireSoundFixBlacklist = {
	["saw"] = true,
	["saw_secondary"] = true,
	["flamethrower_mk2"] = true,
	["m134"] = true,
	["mg42"] = true,
	["shuno"] = true,
	["system"] = true,
	["par"] = true
}

--Allows users/modders to easily edit this blacklist from outside of this mod
Hooks:Register("AFSF2_OnWriteBlacklist")
Hooks:Add("BaseNetworkSessionOnLoadComplete","AFSF2_OnLoadComplete",function()
	Hooks:Call("AFSF2_OnWriteBlacklist",AutoFireSoundFixBlacklist)
end)
--if you would like to edit this blacklist, you can use the following example:
--[[

Hooks:Add("AFSF2_OnWriteBlacklist","PlaceholderHookIdGoesHere",function(blacklist_table)
	blacklist_table.mg42 = false --"nil" (no quotation marks) would also work instead of false
	blacklist_table.peacemaker = true
end)

--]]
--(in this example, i remove the mg42 and add the peacekeeper .45 revolver)
--You can hook this basically anywhere. I recommend "lib/units/weapons/raycastweaponbase" (same as AFSF2) if you don't know where to hook it. You could also change this version and uncomment it here, but then your changes would be removed when you update AFSF2. 

--This blacklist defines which weapons are prevented from playing their single-fire sound in AFSF.
	--Weapons not on this list will repeatedly play their single-fire sound rather than their auto-fire loop.
	--Weapons on this list will play their sound as normal
	-- either due to being an unconventional weapon (saw, flamethrower, other saw, other flamethrower), or lacking a singlefire sound (minigun, mg42, other minigun).
--I could define this in the function but meh	
	

--Check for if AFSF's fix code should apply to this particular weapon
function RaycastWeaponBase:_soundfix_should_play_normal()
	local name_id = self:get_name_id() or "xX69dank420blazermachineXx" --if somehow get_name_id() returns nil, crashing won't be my fault. though i guess you'll have bigger problems in that case. also you'll look dank af B)
	if not self._setup.user_unit == managers.player:player_unit() then
		--don't apply fix for NPCs or other players
		return true
	elseif tweak_data.weapon[name_id].use_fix ~= nil then 
		--for custom weapons
		return tweak_data.weapon[name_id].use_fix
	elseif AutoFireSoundFixBlacklist[name_id] then
		--blacklisted sound
		return true
--	elseif self:gadget_overrides_weapon_functions() then 
--		return true
	elseif not self:weapon_tweak_data().sounds.fire_single then
		--no singlefire sound; should play normal
		return true
	end
	return false
	--else, AFSF2 can apply fix to this weapon
end

--Prevent playing sounds except for blacklisted weapons
local orig_fire_sound = RaycastWeaponBase._fire_sound
function RaycastWeaponBase:_fire_sound(...)
	if self:_soundfix_should_play_normal() then
		return orig_fire_sound(self,...)
	end
end

--Play sounds here instead for fix-applicable weapons; or else if blacklisted, use original function and don't play the fixed single-fire sound
--U200: there goes AFSF2's compatibility with other mods
Hooks:PreHook(RaycastWeaponBase,"fire","autofiresoundfix2_raycastweaponbase_fire",function(self,...)
	if not self:_soundfix_should_play_normal() then
		self._bullets_fired = 0
		self:play_tweak_data_sound(self:weapon_tweak_data().sounds.fire_single,"fire_single")
	end
end)

--stop_shooting is only used for fire sound loops, so playing individual single-fire sounds means it doesn't need to be called
local orig_stop_shooting = RaycastWeaponBase.stop_shooting
function RaycastWeaponBase:stop_shooting(...)
	if self:_soundfix_should_play_normal() then
		return orig_stop_shooting(self,...)
	end
	
	self._shooting = nil
	self._kills_without_releasing_trigger = nil
	self._bullets_fired = nil
	
--	if self._sound_fire then 
--		self._sound_fire:stop() --stops sounds immediately and without a reverb. unfortunately this cuts off the fire sound prematurely because it is VERY immediate.
--	end
end
