Hooks:PostHook(SkillTreeTweakData, "init", "shc_init", function (self)

	-- give infamy 1 skilltree mult universally

	local function digest(value)
		return Application:digest_value(value, true)
	end

	self.tier_unlocks = {
		digest(0),
		digest(1),
		digest(3),
		digest(16)
	}
	self.costs = {
		unlock_tree = digest(0),
		default = digest(1),
		pro = digest(3),
		hightier = digest(4),
		hightierpro = digest(8)
	}

	-- Move civilian intimidation duration from Confident to Stockholm Syndrome
	table.delete(self.skills.cable_guy[1].upgrades, "player_civ_intimidation_mul")
	table.insert(self.skills.stockholm_syndrome[1].upgrades, "player_civ_intimidation_mul")

	-- Swap basic and pro of Far Away
	self.skills.far_away[1].upgrades[1] = "shotgun_steelsight_range_inc_1"
	self.skills.far_away[2].upgrades[1] = "shotgun_steelsight_accuracy_inc_1"

	-- Add 20s duration to Overkill Ace
	table.insert(self.skills.overkill[2].upgrades, "player_overkill_damage_multiplier_2")

	-- Swap basic and pro of Bloodthirst
	self.skills.bloodthirst[1].upgrades[1] = "player_temp_melee_kill_increase_reload_speed_1"
	self.skills.bloodthirst[2].upgrades[1] = "player_melee_damage_stacking_1"

	-- swap stockholm syndrome and joker
	self.trees[2].tiers[2][2] = "stockholm_syndrome"
	self.trees[2].tiers[3][1] = "joker"

	-- swap far away and shotgun CQB.
	self.trees[4].tiers[2][1] = "far_away"
	self.trees[4].tiers[3][1] = "shotgun_cqb"
		
	-- swap die hard and shock and awe.
	self.trees[5].tiers[2][1] = "iron_man"
	self.trees[5].tiers[3][1] = "show_of_force"

	-- swap saw masscare and bulletstorm
	self.trees[6].tiers[2][1] = "carbon_blade"
	self.trees[6].tiers[3][2] = "ammo_reservoir"

	-- swap nimble and sixth sense
	self.trees[10].tiers[2][2] = "second_chances"
	self.trees[10].tiers[3][1] = "chameleon"

	-- swap low blow and unseen strike
	self.trees[12].tiers[3][1] = "unseen_strike"
	self.trees[12].tiers[4][1] = "backstab"

	-- Swap Frenzy and Berserker
	self.trees[15].tiers[3][2] = "frenzy"
	self.trees[15].tiers[4][1] = "wolverine"

	-- swap counterstrike and bloodthirst
	self.trees[15].tiers[2][1] = "drop_soap"
	self.trees[15].tiers[3][1] = "bloodthirst"

	-- Add melee damage boost duriation to first perk of Sociopath
	table.insert(self.specializations[9][1].upgrades, "melee_stacking_hit_expire_t")

	-- Remove passive dodge bonus from Hacker - Botnet
	table.delete(self.specializations[21][9].upgrades, "player_passive_dodge_chance_2")

	-- add default skills
	self.default_upgrades = {
		"player_mask_off_pickup", -- lets you pick things up in stealth even w/o chameleon aced.
		"player_can_free_run", -- just like PDTH.
		"player_fall_damage_multiplier",
		"player_fall_health_damage_multiplier",
		"player_silent_kill",
		"player_primary_weapon_when_downed",
		"player_intimidate_enemies",
		"player_special_enemy_highlight",
		"player_hostage_trade",
		"player_sec_camera_highlight",
		"player_corpse_dispose",
		"player_corpse_dispose_amount_1",
		"player_civ_harmless_melee",
		"player_walk_speed_multiplier",
		"player_steelsight_when_downed",
		"player_crouch_speed_multiplier",
		"carry_interact_speed_multiplier_1",
		"carry_interact_speed_multiplier_2",
		"carry_movement_speed_multiplier",
		"trip_mine_sensor_toggle",
		"trip_mine_sensor_highlight",
		"trip_mine_can_switch_on_off",
		"ecm_jammer_can_activate_feedback",
		"ecm_jammer_interaction_speed_multiplier",
		"ecm_jammer_can_retrigger",
		"ecm_jammer_affects_cameras",
		"striker_reload_speed_default",
		"temporary_first_aid_damage_reduction",
		"temporary_passive_revive_damage_reduction_2",
		"akimbo_recoil_index_addend_1",
		"doctor_bag",
		"ammo_bag",
		"trip_mine",
		"ecm_jammer",
		"first_aid_kit",
		"sentry_gun",
		"bodybags_bag",
		"saw",
		"cable_tie",
		"jowi",
		"x_1911",
		"x_b92fs",
		"x_deagle",
		"x_g22c",
		"x_g17",
		"x_usp",
		"x_sr2",
		"x_mp5",
		"x_akmsu",
		"x_packrat",
		"x_p226",
		"x_m45",
		"x_mp7",
		"x_ppk"
	}
end)
