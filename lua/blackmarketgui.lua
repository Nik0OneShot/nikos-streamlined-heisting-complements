-- Fix melee weapon stat display
Hooks:PreHook(BlackMarketGui, "reload", "shc_reload", function(self)
	self._shc_patch = nil
end)

Hooks:PreHook(BlackMarketGui, "on_slot_selected", "shc_on_slot_selected", function(self)
	if self._shc_patch then
		return
	end
	for _, v in pairs(self._mweapon_stats_shown) do
		if v.name == "damage_effect" then
			v.multiple_of = nil
			self._shc_patch = true
			return
		end
	end
end)

Hooks:PostHook(BlackMarketGui, "_setup", "shc__setup", function(self)
	if not self._mweapon_stats_shown then
		return
	end

	for _, stat in ipairs(self._mweapon_stats_shown) do
		for column_name, text in pairs(self._mweapon_stats_texts[stat.name]) do
			if column_name ~= "name" then
				text:set_font_size(text:font_size() * 0.9)
				text:set_vertical("center")
			end
		end
	end
end)

-- claude code to make spending cash be used over continental coins for buying weapon mods.
-- i'll be honest, i'm shocked claude got it right first try. i tweaked it a tiny bit manually, but dear lord thats scary. code works, so im gonna use it.
local UNLOCK_MULTIPLIER = 2
local EXPENSIVE_WEAPON_PRICE = 700000
local EXPENSIVE_FALLBACK_MUL = 0.5
local CHEAP_FALLBACK_MUL = 1.2


local function get_weapon_id(data)
	local crafted = managers.blackmarket and managers.blackmarket:get_crafted_category(data.category)
	local entry = crafted and crafted[data.slot]

	return entry and entry.weapon_id
end

local function get_unlock_cost(data)
	if not data or not data.name then
		return nil
	end

	local weapon_id = get_weapon_id(data)

	if not weapon_id then
		return nil
	end

	local money = managers.money
	local mod_price = money:get_weapon_modify_price(weapon_id, data.name, data.global_value)

	if mod_price and mod_price > 0 then
		local cost = math.round(mod_price * UNLOCK_MULTIPLIER)
		return cost
	end

	local weapon_price = money:get_weapon_price(weapon_id)

	if not weapon_price or weapon_price <= 0 then
		return nil
	end

	local expensive = weapon_price >= EXPENSIVE_WEAPON_PRICE
	local mul = expensive and EXPENSIVE_FALLBACK_MUL or CHEAP_FALLBACK_MUL
	local cost = math.round(weapon_price * mul)
	return cost
end

local function show_ok_dialog(title, text)
	local dialog_data = {}

	dialog_data.title = title
	dialog_data.text = text

	local ok_button = {}

	ok_button.text = managers.localization:text("dialog_ok")
	dialog_data.button_list = {
		ok_button
	}

	managers.system_menu:show(dialog_data)
end

function BlackMarketGui:purchase_weapon_mod_callback(data)
	local cost = get_unlock_cost(data)

	if not cost then
		return
	end

	data.cash_cost = cost

	local item_name = data.name_localized or data.name
	local money_text = managers.experience:cash_string(cost)
	local weapon_mod_tweak = tweak_data.weapon.factory.parts[data.name]

	-- Locked event mods still can't be bought
	if weapon_mod_tweak and weapon_mod_tweak.is_event_mod and (not data.unlocked or data.unlocked < 1) then
		local params = {}

		params.name = item_name
		params.category = data.category
		params.slot = data.slot
		params.money = money_text
		params.unlock_text = managers.localization:text(weapon_mod_tweak.is_event_mod)

		show_ok_dialog(managers.localization:text("dialog_bm_purchase_mod_locked_title"), managers.localization:text("dialog_bm_purchase_mod_locked", params))

		return
	end

	if managers.money:total() < cost then
		show_ok_dialog(managers.localization:text("buyweaponmod_reject_title"), managers.localization:text("buyweaponmod_reject", {
			item = item_name,
			money = money_text
		}))

		return
	end

	local dialog_data = {}

	dialog_data.title = managers.localization:text("buyweaponmod_title")
	dialog_data.text = managers.localization:text("buyweaponmod_description", {
		item = item_name,
		money = money_text
	})
	dialog_data.focus_button = 2

	local yes_button = {}

	yes_button.text = managers.localization:text("dialog_yes")
	yes_button.callback_func = callback(self, self, "_dialog_yes", callback(self, self, "_confirm_purchase_weapon_mod_callback", data))

	local no_button = {}

	no_button.text = managers.localization:text("dialog_no")
	no_button.callback_func = callback(self, self, "_dialog_no")
	no_button.cancel_button = true
	dialog_data.button_list = {
		yes_button,
		no_button
	}

	managers.system_menu:show(dialog_data)
end

function BlackMarketGui:_confirm_purchase_weapon_mod_callback(data)
	local cost = data.cash_cost

	-- Cash may have changed while the dialog was open
	if not cost or managers.money:total() < cost then
		return
	end

	local origin = TelemetryConst and TelemetryConst.economy_origin and TelemetryConst.economy_origin.purchase_weapon_mod or "purchase_weapon_mod"

	managers.menu_component:post_event("item_sell")
	managers.blackmarket:add_to_inventory(data.global_value, "weapon_mods", data.name, true)
	managers.money:deduct_from_total(cost, origin .. data.name)
	self:reload()
end
