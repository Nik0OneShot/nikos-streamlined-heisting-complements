Hooks:PostHook(UpgradesTweakData, "init", "shc_init", function (self)

	-- SKILLS

	-- Combat Medic revive health multiplier (30% -> 15%)
	self.revive_health_multiplier[1] = 1.15
	self.skill_descs.combat_medic.multipro = "15%"

	-- Inspire cooldown (20s -> 40s)
	self.values.cooldown.long_dis_revive[1][2] = 40
	self.skill_descs.inspire.multipro2 = "40"

	-- Forced Friendship ace damage absorption (0.5 -> 1.5 / 8 max -> 4 max)
	self.values.team.damage.hostage_absorption[1] = 0.2 -- 0.15 > 0.2
	self.values.team.damage.hostage_absorption_limit = 4
	self.skill_descs.triathlete.multipro = "2" -- "1.5" > 2
	self.skill_descs.triathlete.multipro2 = "4"

	-- Confident intimidation multiplier
	self.values.player.intimidation_multiplier[1] = 1.35

	-- Joker damage multiplier
	self.values.player.convert_enemies_damage_multiplier[1] = 1
	self.values.player.convert_enemies_damage_multiplier[2] = 2 -- 1.35 > 2
	self.values.player.convert_enemies_damage_multiplier.multipro = "100%" -- "35%" > "100%"

	-- Partners in Crime basic damage reduction (50% -> 75%)
	self.values.player.passive_convert_enemies_health_multiplier[1] = 0.5 -- 0.25 > 0.5
	self.skill_descs.control_freak.multibasic3 = "50%" -- "75%" > "50%"
 
	-- Partners in Crime ace damage reduction (54% -> 15%)
	self.values.player.passive_convert_enemies_health_multiplier[2] = 0.25 -- 0.1 > 0.25
	self.skill_descs.control_freak.multipro4 = "25%" -- "15%" > "25%"

	-- Ammo Efficiency (1 bullet -> 2 bullets)
	self.values.player.head_shot_ammo_return[1].ammo = 2
	self.values.player.head_shot_ammo_return[2].ammo = 2
	self.skill_descs.spotter_teamwork.multibasic3 = "2"

	-- Aggressive Reload (100% -> 75%)
	self.values.temporary.single_shot_fast_reload[1][1] = 1.5 -- 1.75 > 1.5
	self.skill_descs.speedy_reload.multipro = "50%" -- "75%" > "50%"

	-- Far away accuracy increase (40% -> 75%)
	self.values.shotgun.steelsight_accuracy_inc[1] = 0.25
	self.skill_descs.far_away.multibasic = "75%"

	-- Overkill duration (20s -> 10s), 20s for aced
	self.definitions.player_overkill_damage_multiplier_2 = deep_clone(self.definitions.player_overkill_damage_multiplier)
	self.definitions.player_overkill_damage_multiplier_2.upgrade.value = 2
	self.values.temporary.overkill_damage_multiplier[2] = deep_clone(self.values.temporary.overkill_damage_multiplier[1])
	self.values.temporary.overkill_damage_multiplier[1][2] = 10
	self.skill_descs.overkill.multibasic2 = "10"
	self.skill_descs.overkill.multipro2 = "20"

	-- Bullet Storm duration (20s -> 15s)
	self.skill_descs.ammo_reservoir.multipro2 = "10"

	-- Saw Massacre panic chance (50% -> 75%)
	self.values.saw.panic_when_kill[1].chance = 1 -- 0.75 > 1
	self.skill_descs.carbon_blade.multipro = "100%" -- "75%" > "100%"

	-- Eco Sentry cost reduction (5% -> 10%)
	self.skill_descs.eco_sentry.multibasic = "25%" -- "10%" > "25%"

	-- Hardware Expert restart chance (10% -> 30%)
	self.values.player.drill_autorepair_1[1] = 0.3
	self.skill_descs.hardware_expert.multipro3 = "30%"

	-- More Firepower shaped charges (1 -> 2 / 2 -> 3)
	self.values.shape_charge.quantity[1] = 2
	self.values.shape_charge.quantity[2] = 5
	self.skill_descs.more_fire_power.multibasic = "2"
	self.skill_descs.more_fire_power.multipro = "3"

	-- Kickstarter restart chance (20% -> 30%)
	self.values.player.drill_autorepair_2[1] = 0.3
	self.skill_descs.kick_starter.multibasic = "30%"

	-- Fire trap duration (10s -> 20s / 10s -> 20s)
	self.values.trip_mine.fire_trap[1][1] = 10
	self.values.trip_mine.fire_trap[2][1] = 30
	self.skill_descs.fire_trap.multibasic = "20"
	self.skill_descs.fire_trap.multipro = "20"

	-- Heavy impact (5% -> 10% / 20% -> 30%)
	self.values.weapon.knock_down[1] = 0.1
	self.values.weapon.knock_down[2] = 0.3
	self.skill_descs.heavy_impact.multibasic = "10%"
	self.skill_descs.heavy_impact.multipro = "30%"

	-- Body Expertise (30% -> 20% / 90% -> 60%)
	self.values.weapon.automatic_head_shot_add = { 0.3, 0.9 } -- { 0.2, 0.6 } > { 0.3, 0.6 } [scratch that] > {0.3, 0.9}
	self.skill_descs.body_expertise.multibasic = "30%" -- "20%" > "30%"
	self.skill_descs.body_expertise.multipro = "60%" -- "60%" > "90%"

	-- Optical Illusions target chance decrease (35% -> 20%)
	self.values.player.camouflage_bonus[2] = 0.85 -- 0.8 > 0.85
	self.skill_descs.optic_illusions.multibasic = "15%" -- "20%" > "15%"

	-- Unseen Strike duration (6s -> 4s / 18s -> 12s)
	self.values.temporary.unseen_strike[1][2] = 4
	self.values.temporary.unseen_strike[2][2] = 12 -- 12 > 16
	self.skill_descs.unseen_strike.multibasic3 = "4"
	self.skill_descs.unseen_strike.multipro = "16" -- "12" > "16"

	-- Desperado max duration (10s -> 4s)
	self.values.pistol.stacked_accuracy_bonus[1].accuracy_bonus = 0.1
	self.values.pistol.stacked_accuracy_bonus[1].max_time = 10 -- 5 > 10
	self.skill_descs.expert_handling.multibasic2 = "10" -- "5" > "10"

	-- Trigger happy max stacks (1 -> 4 / 1 -> 6), damage bonus (120% -> 30%)
	self.values.pistol.stacking_hit_damage_multiplier[1].max_stacks = 4
	self.values.pistol.stacking_hit_damage_multiplier[1].damage_bonus = 0.25
	self.values.pistol.stacking_hit_damage_multiplier[2].max_stacks = 6
	self.values.pistol.stacking_hit_damage_multiplier[2].damage_bonus = 0.25
	self.skill_descs.trigger_happy.multibasic3 = "4"
	self.skill_descs.trigger_happy.multibasic4 = "25%"
	self.skill_descs.trigger_happy.multipro2 = "4"
	self.skill_descs.trigger_happy.multipro3 = "6"
	self.skill_descs.trigger_happy.multipro4 = "25%"

	-- Nine Lives bleed out health increase (50% -> 100%)
	self.values.player.bleed_out_health_multiplier[1] = 2
	self.skill_descs.nine_lives.multibasic2 = "100%"

	-- Up you go revive health (40% -> 100%)
	self.values.player.revived_health_regain[1] = 0.6 -- 2 > 0.6
	self.skill_descs.up_you_go.multipro = "600%" -- "100%" > "60%"

	-- Bloodthirst (10s -> 5s / 100% up to 1600% -> 50% up to 800%)
	self.values.player.melee_damage_stacking[1].max_multiplier = 16 -- 8 > 16
	self.values.player.melee_damage_stacking[1].melee_multiplier = 1 -- 0.5 > 1
	self.values.player.melee_kill_increase_reload_speed[1][2] = 3 -- 5 > 3
	self.skill_descs.bloodthirst.multibasic = "100%" -- "50%" > "100%"
	self.skill_descs.bloodthirst.multibasic2 = "1600%" -- "800%" > "1600%"
	self.skill_descs.bloodthirst.multipro2 = "3" -- 5 > 3


	-- PERK DECKS

	-- Crook - Expert Composure armor (25% -> 30%)
	self.values.player.level_2_armor_multiplier[3] = 1.7
	self.values.player.level_3_armor_multiplier[3] = 1.7
	self.values.player.level_4_armor_multiplier[3] = 1.7
	self.specialization_descs[6][7].multiperk2 = "30%"

	-- Burglar - Dutch Courage pager answer speed (10% -> 20%)
	self.values.player.alarm_pager_speed_multiplier[1] = 0.5 -- 0.8 > 0.5
	self.specialization_descs[7][7].multiperk3 = "50%" -- "20%" > "50%"

	-- Burglar - Breath of Fresh Air crouch speed (10% -> 30%)
	self.values.player.crouch_speed_multiplier[2] = 1.4
	self.specialization_descs[7][9].multiperk2 = "30%"
	self.specialization_descs[7][9].multiperk3 = "10%"

	-- Infiltrator - Advanced close combat damage boost duration (7s -> 5s)
	self.values.melee.stacking_hit_expire_t[1] = 5
	self.specialization_descs[8][5].multiperk2 = "5"

	-- Sociopath - No Talk state correct damage boost duration
	self.specialization_descs[9][1].multiperk2 = "5"

	-- Gambler - Medical Supplies cooldown (3s -> 2s)
	for _, v in pairs(self.values.temporary.loose_ammo_restore_health) do
		v[2] = 2
	end
	self.specialization_descs[10][1].multiperk3 = "2"

	-- Gambler - Ammo Give Out remove cooldown
	self.values.temporary.loose_ammo_give_team[1][2] = 0
	self.specialization_descs[10][3].multiperk2 = "0"

	-- Anarchist - Lust for Life amount (30 -> 20)
	for _, v in pairs(self.values.player.damage_to_armor[1]) do
		v[1] = 2
	end
	self.specialization_descs[15][9].multiperk = "20"

	-- Stoic - Reduce DoT duration (12s -> 9s)
	self.values.player.damage_control_passive[1][2] = 11
	self.specialization_descs[19][1].multiperk2 = "9"

	-- Leech - Increase segments (5 -> 8 / 10 -> 16), reduce heal amount (5% -> 3% / 10% -> 6%)
	self.values.player.copr_static_damage_ratio[1] = 0.125
	self.values.player.copr_static_damage_ratio[2] = 0.0625
	self.values.player.copr_teammate_heal[1] = 0.03
	self.values.player.copr_teammate_heal[2] = 0.06
	self.specialization_descs[22][1].multiperk2 = "12.5%"
	self.specialization_descs[22][1].multiperk4 = "3%"
	self.specialization_descs[22][5].multiperk3 = "6%"
	self.specialization_descs[22][9].multiperk = "6.25%"

	-- Copycat - Instant swap duration (3 -> 10), instant swap revert, Thriving (20% -> 10%), Grace Period trigger (50% -> 30%)
	self.values.weapon.mrwi_swap_speed_multiplier[1] = 5
	self.values.weapon.primary_reload_swap_secondary[1] = 10
	self.values.weapon.secondary_reload_swap_primary[1] = 10
	self.values.player.mrwi_health_multiplier[1] = 1.1
	self.values.player.mrwi_health_multiplier[2] = 1.2
	self.values.player.mrwi_health_multiplier[3] = 1.3
	self.values.player.mrwi_health_multiplier[4] = 1.4
	self.specialization_descs[23][1].multiperk2 = "10"
	self.multi_choice_specialization_descs[23][1][1].multiperk = "10%"
	self.multi_choice_specialization_descs[23][3][1].multiperk = "10%"
	self.multi_choice_specialization_descs[23][5][1].multiperk = "10%"
	self.multi_choice_specialization_descs[23][7][1].multiperk = "10%"

	-- WEAPONS

	-- Movement speed penalty for lmgs and miniguns
	self.weapon_movement_penalty.lmg = 0.85
	self.weapon_movement_penalty.minigun = 0.85

	-- EQUIPMENT

	-- Regular ECM feedback interval (1.5 -> 1), feedback recharge (4 min -> 3 min)
	self.ecm_feedback_interval = 0.5 -- 1 > 0.5
	self.ecm_feedback_retrigger_interval = 60 -- 180 > 60

	-- Increase armor steadiness scaling
	self.values.player.body_armor.damage_shake[1] = 1
	self.values.player.body_armor.damage_shake[2] = 0.92
	self.values.player.body_armor.damage_shake[3] = 0.82
	self.values.player.body_armor.damage_shake[4] = 0.70
	self.values.player.body_armor.damage_shake[5] = 0.56
	self.values.player.body_armor.damage_shake[6] = 0.40
	self.values.player.body_armor.damage_shake[7] = 0.22

	-- should give you a max of 20 dodge.
	self.values.player.detection_risk_add_dodge_chance = {
		{ 0.03, 3, "below", 25, 0.2 },
		{ 0.03, 1, "below", 25, 0.2 }
	}
	-- sneaky bastard buff, make it more like low blow.
	self.skill_descs.jail_diet.multibasic = "3%"
	self.skill_descs.jail_diet.multibasic3 = "20"
	self.skill_descs.jail_diet.multibasic4 = "20"
	self.skill_descs.jail_diet.multipro = "3%"
	self.skill_descs.jail_diet.multipro3 = "20"
	self.skill_descs.jail_diet.multipro4 = "20"
	

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


-- Fix Copycat perk descriptions
local mrwi_deck9_options_original = UpgradesTweakData.mrwi_deck9_options
function UpgradesTweakData.mrwi_deck9_options(...)
	local options = mrwi_deck9_options_original(...)

	-- Burglar
	options[7].custom_editable_descs[3] = "20%"

	return options
end
