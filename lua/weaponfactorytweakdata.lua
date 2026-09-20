Hooks:PostHook(WeaponFactoryTweakData, "init", "shc_init", function(self)

	-- Reduce buckshot rays
	self.parts.wpn_fps_upg_a_custom.custom_stats.rays = 9
	self.parts.wpn_fps_upg_a_custom_free.custom_stats.rays = 9

	-- Rework tombstone
	self.parts.wpn_fps_upg_a_rip.custom_stats.rays = 9

	-- Increase AP slug accuracy
	self.parts.wpn_fps_upg_a_slug.stats.moving_spread = 6
	self.parts.wpn_fps_upg_a_slug.stats.spread = 6

	-- Give military laser module same stability as LED combo
	self.parts.wpn_fps_upg_fl_ass_peq15.stats.recoil = 2

	-- AK family suppressors
	self.parts.wpn_fps_upg_ns_ass_pbs1.stats.spread = 1
	self.parts.wpn_fps_upg_ns_ass_pbs1.stats.spread_moving = 1
	self.parts.wpn_fps_upg_ns_ass_pbs1.stats.recoil = 2
	self.parts.wpn_fps_upg_ns_ass_pbs1.stats.concealment = -4

	self.parts.wpn_fps_upg_ak_ns_tgp.stats.spread = 2
	self.parts.wpn_fps_upg_ak_ns_tgp.stats.spread_moving = 2

	-- Tweak pickup multipliers for conversion kits
	self.parts.wpn_fps_ammo_type.custom_stats.ammo_pickup_max_mul = 0.5
	self.parts.wpn_fps_ammo_type.custom_stats.ammo_pickup_min_mul = 0.5

	self.parts.wpn_fps_lmg_hcar_body_conversionkit.custom_stats.ammo_pickup_max_mul = 1.5
	self.parts.wpn_fps_lmg_hcar_body_conversionkit.custom_stats.ammo_pickup_min_mul = 1.5

	self.parts.wpn_fps_ass_g3_b_short.custom_stats.ammo_pickup_max_mul = 1.75
	self.parts.wpn_fps_ass_g3_b_short.custom_stats.ammo_pickup_min_mul = 1.75
	self.parts.wpn_fps_ass_g3_b_sniper.custom_stats = self.parts.wpn_fps_ass_g3_b_sniper.custom_stats or {}
	self.parts.wpn_fps_ass_g3_b_sniper.custom_stats.ammo_pickup_max_mul = 0.8
	self.parts.wpn_fps_ass_g3_b_sniper.custom_stats.ammo_pickup_min_mul = 0.8

	self.parts.wpn_fps_pis_c96_b_long.custom_stats.ammo_pickup_max_mul = 0.5
	self.parts.wpn_fps_pis_c96_b_long.custom_stats.ammo_pickup_min_mul = 0.5

	self.parts.wpn_fps_upg_ass_ak_b_zastava.custom_stats.ammo_pickup_max_mul = 0.5
	self.parts.wpn_fps_upg_ass_ak_b_zastava.custom_stats.ammo_pickup_min_mul = 0.5

	self.parts.wpn_fps_ass_shak12_body_vks.custom_stats.ammo_pickup_max_mul = 0.5
	self.parts.wpn_fps_ass_shak12_body_vks.custom_stats.ammo_pickup_min_mul = 0.5

	self.parts.wpn_fps_lmg_kacchainsaw_conversionkit.custom_stats.ammo_pickup_max_mul = 2.5
	self.parts.wpn_fps_lmg_kacchainsaw_conversionkit.custom_stats.ammo_pickup_min_mul = 2.5

	self.parts.wpn_fps_lmg_hcar_barrel_dmr.custom_stats = self.parts.wpn_fps_lmg_hcar_barrel_dmr.custom_stats or {}
	self.parts.wpn_fps_lmg_hcar_barrel_dmr.custom_stats.ammo_pickup_max_mul = 0.8
	self.parts.wpn_fps_lmg_hcar_barrel_dmr.custom_stats.ammo_pickup_min_mul = 0.8

	self.parts.wpn_fps_upg_a_flun_flare.custom_stats.ammo_pickup_max_mul = 0.8
	self.parts.wpn_fps_upg_a_flun_flare.custom_stats.ammo_pickup_min_mul = 0.8
	self.parts.wpn_fps_upg_a_flun_shell.custom_stats.ammo_pickup_max_mul = 2.2
	self.parts.wpn_fps_upg_a_flun_shell.custom_stats.ammo_pickup_min_mul = 2.2
	self.wpn_fps_spe_flun.override.wpn_fps_upg_a_piercing.custom_stats.ammo_pickup_max_mul = 2.2
	self.wpn_fps_spe_flun.override.wpn_fps_upg_a_piercing.custom_stats.ammo_pickup_min_mul = 2.2
	self.wpn_fps_spe_flun.override.wpn_fps_upg_a_slug.custom_stats.ammo_pickup_max_mul = 2.2
	self.wpn_fps_spe_flun.override.wpn_fps_upg_a_slug.custom_stats.ammo_pickup_min_mul = 2.2

	-- Comando 553
	self.parts.wpn_fps_ass_s552_fg_standard_green.stats.spread = 5
	self.parts.wpn_fps_ass_s552_fg_standard_green.stats.spread_moving = 5
	self.parts.wpn_fps_ass_s552_fg_railed.stats.recoil = 3
	self.parts.wpn_fps_ass_s552_fg_railed.stats.concealment = nil

	-- Reinfeld 880
	self.parts.wpn_fps_shot_r870_body_rack.stats.reload = 2
	self.parts.wpn_fps_shot_r870_fg_wood.custom_stats = self.parts.wpn_fps_shot_r870_fg_wood.custom_stats or {}
	self.parts.wpn_fps_shot_r870_fg_wood.custom_stats.fire_rate_multiplier = 1.2
	self.parts.wpn_fps_shot_r870_fg_wood.stats.concealment = -1
	self.parts.wpn_fps_shot_r870_fg_wood.stats.recoil = nil

	-- Campbell 74
	self.parts.wpn_fps_lmg_kacchainsaw_sling.stats.recoil = 2
	self.parts.wpn_fps_lmg_kacchainsaw_sling.stats.spread = nil
	self.parts.wpn_fps_lmg_kacchainsaw_conversionkit.custom_stats.fire_rate_multiplier = 1.6

	-- Compact-5
	self.parts.wpn_fps_smg_mp5_fg_mp5sd.stats.spread = 2
	self.parts.wpn_fps_smg_mp5_fg_mp5sd.stats.spread_moving = 2
	self.parts.wpn_fps_smg_mp5_fg_mp5sd.stats.recoil = 2

	-- Kobus 90
	self.parts.wpn_fps_smg_p90_b_ninja.stats.spread = 1
	self.parts.wpn_fps_smg_p90_b_ninja.stats.spread_moving = 1

	-- JP36
	self.parts.wpn_fps_ass_g36_s_kv.stats.recoil = 2
	self.parts.wpn_fps_ass_g36_s_kv.stats.concealment = -1
	self.parts.wpn_fps_ass_g36_s_sl8.stats.spread = 2
	self.parts.wpn_fps_ass_g36_s_sl8.stats.spread_moving = 2
	self.parts.wpn_fps_ass_g36_s_sl8.stats.concealment = -5

	-- Amaroq
	self.parts.wpn_fps_snp_awp_conversion_wildlands.stats.total_ammo_mod = 5
	self.parts.wpn_fps_snp_awp_ext_shellrack.stats.total_ammo_mod = 3

	-- Car-4 family foregrips
	self.parts.wpn_fps_upg_ass_m16_fg_stag.stats.recoil = nil
	self.parts.wpn_fps_upg_ass_m16_fg_stag.stats.spread = 2
	self.parts.wpn_fps_uupg_fg_radian.stats.recoil = 1
	self.parts.wpn_fps_uupg_fg_radian.stats.spread = 1
	self.parts.wpn_fps_uupg_fg_radian.stats.concealment = nil
	self.parts.wpn_fps_upg_ass_m4_fg_moe.stats.damage = nil
	self.parts.wpn_fps_upg_fg_smr.stats.damage = 3
	self.parts.wpn_fps_upg_fg_smr.stats.recoil = 2
	self.parts.wpn_fps_upg_fg_smr.stats.spread = nil
	self.parts.wpn_fps_m4_uupg_fg_lr300.stats.recoil = nil
	self.parts.wpn_fps_m4_uupg_fg_lr300.stats.concealment = 3

	-- Car-4 family lower receivers
	self.parts.wpn_fps_m4_uupg_lower_radian.stats.concealment = -2

	-- Car-4 family magazines
	self.parts.wpn_fps_m4_uupg_m_strike.stats.concealment = -2
	self.parts.wpn_fps_upg_m4_m_pmag.stats.reload = 1
	self.wpn_fps_smg_x_hajk.override.wpn_fps_upg_m4_m_pmag.stats.reload = 1
	self.wpn_fps_smg_x_olympic.override.wpn_fps_upg_m4_m_pmag.stats.reload = 1

	-- speedpull mag rework. reduce concealment by a fuck ton due to it being a big fuckoff orange thing.
	-- JP36
	self.parts.wpn_fps_ass_g36_m_quick.stats.concealment = -5
	self.parts.wpn_fps_ass_g36_m_quick.stats.recoil = 0
	self.parts.wpn_fps_ass_g36_m_quick.stats.spread = 0
	-- UAR
	self.parts.wpn_fps_ass_aug_m_quick.stats.concealment = -5
	self.parts.wpn_fps_ass_aug_m_quick.stats.recoil = 0
	self.parts.wpn_fps_ass_aug_m_quick.stats.spread = 0
	-- AKs
	self.parts.wpn_fps_upg_ak_m_quick.stats.concealment = -5
	self.parts.wpn_fps_upg_ak_m_quick.stats.recoil = 0
	self.parts.wpn_fps_upg_ak_m_quick.stats.spread = 0
	-- CARs
	self.parts.wpn_fps_m4_upg_m_quick.stats.concealment = -5
	self.parts.wpn_fps_m4_upg_m_quick.stats.recoil = 0
	self.parts.wpn_fps_m4_upg_m_quick.stats.spread = 0
	-- heather SMG
	self.parts.wpn_fps_smg_sr2_m_quick.stats.concealment = -5
	self.parts.wpn_fps_smg_sr2_m_quick.stats.recoil = 0
	self.parts.wpn_fps_smg_sr2_m_quick.stats.spread = 0
	-- mark 10 SMG
	self.parts.wpn_fps_smg_mac10_m_quick.stats.concealment = -5
	self.parts.wpn_fps_smg_mac10_m_quick.stats.recoil = 0
	self.parts.wpn_fps_smg_mac10_m_quick.stats.spread = 0
	-- kobus 90 SMG
	self.parts.wpn_fps_smg_p90_m_strap.stats.concealment = -5
	self.parts.wpn_fps_smg_p90_m_strap.stats.recoil = 0
	self.parts.wpn_fps_smg_p90_m_strap.stats.spread = 0

	-- freebie mods
	-- tactical pistol light
	self.parts.wpn_fps_upg_fl_pis_tlr1.stats.concealment = 0

	-- skold micro reflex sight
	self.parts.wpn_fps_upg_o_rms.stats.recoil = 0

	-- assault light
	self.parts.wpn_fps_upg_fl_ass_smg_sho_surefire.stats.concealment = 0

	-- shit that should be reworked
	-- pocket laser
	self.parts.wpn_fps_upg_fl_pis_laser.stats.recoil = 1
	self.parts.wpn_fps_upg_fl_pis_laser.stats.concealment = -1

	-- medved R4 laser sight
	self.parts.wpn_fps_upg_fl_pis_perst.stats.spread = 1
	self.parts.wpn_fps_upg_fl_pis_perst.stats.recoil = 0
	self.parts.wpn_fps_upg_fl_pis_perst.stats.concealment = -1

	-- combined module
	self.parts.wpn_fps_upg_fl_pis_x400v.stats.concealment = -4
	self.parts.wpn_fps_upg_fl_pis_x400v.stats.recoil = 3

	-- laser grip
	self.parts.wpn_fps_pis_g26_g_laser.stats.concealment = -3
	self.parts.wpn_fps_pis_g26_g_laser.stats.spread = 2

	-- platypus grip
	self.parts.wpn_fps_pis_g26_g_gripforce.stats.concealment = -3
	self.parts.wpn_fps_pis_g26_g_gripforce.stats.recoil = 2

	-- budget suppressor - my intent with this is to make the "you start out with this" option for stealth heists. its still got good stats, but its going to tarnish your concealment quite a bit.
	self.parts.wpn_fps_upg_ns_ass_filter.stats.concealment = -5
	self.parts.wpn_fps_upg_ns_ass_filter.stats.recoil = 3
	self.parts.wpn_fps_upg_ns_ass_filter.stats.spread = -2
	self.parts.wpn_fps_upg_ns_ass_filter.stats.damage = 0

	-- medved r4 suppressor - basically the same idea as the budget suppressor, i'll be making it free soon and as such this'll be balanced around the idea that it is. this is a different version, except it focuses on accuracy over stability.
	self.parts.wpn_fps_upg_ns_pis_putnik.stats.concealment = -5
	self.parts.wpn_fps_upg_ns_pis_putnik.stats.recoil = -2
	self.parts.wpn_fps_upg_ns_pis_putnik.stats.spread = 3
	self.parts.wpn_fps_upg_ns_pis_putnik.stats.damage = 0
		
	-- Set lowest alert range for all suppressors
	-- Tweak Sting grenade pickup
	for _, v in pairs(self.parts) do
		if v.perks and table.contains(v.perks, "silencer") then
			v.stats = v.stats or {}
			v.stats.alert_size = 20
		elseif v.sub_type == "ammo_hornet" and v.custom_stats then
			v.custom_stats.ammo_pickup_max_mul = 5
			v.custom_stats.ammo_pickup_min_mul = 5
		end
	end

	for _, v in pairs(self) do
		if type(v) == "table" and v.override then
			if v.override.wpn_fps_upg_a_underbarrel_hornet then
				v.override.wpn_fps_upg_a_underbarrel_hornet.custom_stats.ammo_pickup_max_mul = 5
				v.override.wpn_fps_upg_a_underbarrel_hornet.custom_stats.ammo_pickup_min_mul = 5
			end

			if v.override.wpn_fps_upg_a_grenade_launcher_hornet then
				v.override.wpn_fps_upg_a_grenade_launcher_hornet.custom_stats.ammo_pickup_max_mul = 5
				v.override.wpn_fps_upg_a_grenade_launcher_hornet.custom_stats.ammo_pickup_min_mul = 5
			end
		end
	end

end)
