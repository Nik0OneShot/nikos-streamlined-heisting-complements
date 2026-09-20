-- Hacky way to revert copycat weapon swap functionality, replace the instant swap with increased swap speed
local upgrade_value_original = PlayerManager.upgrade_value
function PlayerManager:upgrade_value(category, upgrade, ...)
	if category == "weapon" and upgrade == "mrwi_swap_speed_multiplier" then
		if self._temporary_properties:has_active_property("intant_swap_to_secondary") or self._temporary_properties:has_active_property("intant_swap_to_primary") then
			-- Called twice, once on unequip once on equip, so track that
			if self._mrwi_swap_speed_multiplier_called then
				self:remove_temporary_property("intant_swap_to_secondary")
				self:remove_temporary_property("intant_swap_to_primary")
				self._mrwi_swap_speed_multiplier_called = false
			else
				self._mrwi_swap_speed_multiplier_called = true
			end
			return tweak_data.upgrades.values.weapon.mrwi_swap_speed_multiplier[1]
		end
	end

	return upgrade_value_original(self, category, upgrade, ...)
end

local has_active_temporary_property_original = PlayerManager.has_active_temporary_property
function PlayerManager:has_active_temporary_property(name, ...)
	if name ~= "intant_swap_to_secondary" and name ~= "intant_swap_to_primary" then
		return has_active_temporary_property_original(self, name, ...)
	end
end

-- Prevent healing with Copycat when Berserker is active
local on_headshot_dealt_original = PlayerManager.on_headshot_dealt
function PlayerManager:on_headshot_dealt(...)
	PlayerDamage.force_chk_health_ratio = true
	on_headshot_dealt_original(self, ...)
	PlayerDamage.force_chk_health_ratio = false
end

-- for use in the ECM jammer rework
-- if using jack of all trades and the ECM jammer is your secondary, force the minimum amount of EMP jammers to 2.

Hooks:PreHook(PlayerManager, "_add_equipment", "EMPJammer_PlayerManager_Pre", function(self, params)
	ecm_was_present = params and params.equipment == "ecm_jammer" and self:has_equipment("ecm_jammer")
end)

Hooks:PostHook(PlayerManager, "_add_equipment", "EMPJammer_PlayerManager_Post", function(self, params)
	if ecm_was_present or not params or params.equipment ~= "ecm_jammer" or not params.slot or params.slot < 2 then return end

	local before = self:get_equipment_amount("ecm_jammer", 2)
	if before < 2 then self:set_equipment_amount("ecm_jammer", 2, 2) end
end)
