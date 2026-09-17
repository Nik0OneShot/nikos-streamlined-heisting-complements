local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

tweak_data.projectiles.rocket_ray_frag.damage = 5000 -- commando 101
tweak_data.projectiles.rocket_frag.damage = 15000 -- hrl-7

-- black lives matter more code from rrestoration mod for tweakdata

tweak_data.casino = {
	unlock_level = 0,
	entrance_level = {
		14,
		28,
		40,
		45,
		55,
		65,
		75
	},
	entrance_fee = {
		15000,
		15000,
		15000,
		15000,
		15000,
		15000,
		15000
	},
	prefer_cost = 500000,
	prefer_chance = 0.2,
	secure_card_cost = {
		1000000,
		3300000,
		6500000
	},
	secure_card_level = {
		0,
		0,
		0
	},
	infamous_cost = 3000000,
	infamous_chance = 3
}	

tweak_data.experience_manager.stage_failed_multiplier = 0.5
-- From update 34
tweak_data.experience_manager.stage_completion = {
	200,
	250,
	300,
	350,
	425,
	475,
	550
}
tweak_data.experience_manager.job_completion = {
	2000,
	4000,
	10000,
	16000,
	20000,
	28000,
	32000
}

tweak_data.experience_manager.pro_day_multiplier = {
	1,
	1,
	1,
	1,
	1,
	1,
	1
}

-- exp card drops give more xp now
tweak_data.experience_manager.loot_drop_value = {
	xp10 = 8000,
	xp15 = 16000,
	xp20 = 32000,
	xp30 = 64000,
	xp40 = 96000,
	xp50 = 128000,
	xp60 = 192000,
	xp70 = 256000,
	xp80 = 320000,
	xp90 = 384000,
	xp100 = 512000,
	xp_pda9_1 = 250000,
	xp_pda9_2 = 3000000,
}

-- if on one down, add 25% extra xp.
-- if on pro job, give 50% more experience. on death wish and death sentence, give 100%!
if difficulty_index < 8 then
if pro_job then
	tweak_data.experience_manager.pro_job_multiplier = 1.50
	tweak_data.experience_manager.pro_job_new = 1.50
end
else
if pro_job then
	tweak_data.experience_manager.pro_job_multiplier = 2
	tweak_data.experience_manager.pro_job_new = 2
end
end

-- taken from eclipse, flattens XP curve.
-- Clear out the vanilla level table (including hardcoded lvls 1-9)
tweak_data.experience_manager.levels = {}

-- Flatten the curve of experience per level distribution, the exponent is reduced from 3 to 1.5
-- Reduce the total amount of experience required to go through lvl 0-100 from 23.3 mil to 20.2 mil
local multiplier = 1
local exp_step_start = 1
local exp_step_end = 100
local exp_step = 1 / (exp_step_end - exp_step_start)
local exp_step_last_points = 5000
local exp_step_curve = 1.5

for i = exp_step_start, exp_step_end do
	tweak_data.experience_manager.levels[i] = {
		points = math.round((500000 - exp_step_last_points) * math.pow(exp_step * (i - exp_step_start), exp_step_curve) + exp_step_last_points) * multiplier,
	}
end

-- make the limited bonuses bettar because tran wrong
tweak_data.experience_manager.limited_xmas_bonus_multiplier = 1.5

tweak_data:digest_recursive(tweak_data.experience_manager)

-- lets you pick death wish and death sentence off the bat
tweak_data.difficulty_level_locks = { 0, 0, 0, 0, 0, 0, 0, 0, }
