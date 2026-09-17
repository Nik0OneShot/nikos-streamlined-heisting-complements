Hooks:PostHook( NarrativeTweakData, "init", "SC_Narratives", function(self)
-- black lives matter restoration mod code cuz im lazy and fat and as the white man would say "based and pill red"
		
	--Heat multipliers, set to be consistent with each other
	self.HEATED_MAX_XP_MUL = 1.3
	self.FREEZING_MAX_XP_MUL = 0.7	
	
	--Golden Grin Casino
	self.jobs.kenaz.payout = {			
		250000,
		300000,
		450000,
		550000,
		850000,
		850000,
		850000
		}
	self.jobs.kenaz.contract_cost = {			
		54000,
		108000,
		270000,
		540000,
		700000,
		700000,
		700000
		}
	
	--Black Cat
	self.jobs.chca.payout = {			
		100000,
		200000,
		500000,
		1000000,
		1300000,
		1300000,
		1300000
	}
	self.jobs.chca.contract_cost = {
		105000,
		150000,
		550000,
		800000,
		1000000,
		1000000,
		1000000
	}	

	--Border Crystals (it's basically Cook Off but in Mexico)
	self.jobs.mex_cooking.payout = {			
		90000,
		135000,
		180000,
		310000,
		380000,
		380000,
		380000
	}
	self.jobs.mex_cooking.contract_cost = {
		47000,
		94000,
		235000,
		470000,
		600000,
		600000,
		600000
	}	
	

	--Border Crossing
	self.jobs.mex.payout = {			
		90000,
		135000,
		180000,
		310000,
		380000,
		380000,
		380000
	}
	self.jobs.mex.contract_cost = {
		47000,
		94000,
		235000,
		470000,
		600000,
		600000,
		600000
	}	

	--San Martin Bank
	self.jobs.bex.payout = {			
		60000,
		150000,
		300000,
		600000,
		750000,
		750000,
		750000
	}
	self.jobs.bex.contract_cost = {			
		54000,
		108000,
		270000,
		540000,
		700000,
		700000,
		700000
	}
	
	--Almir Breakout
	self.jobs.pex.payout = {			
		58000,
		78000,
		88000,
		98000,
		130000,
		130000,
		130000
	}
	self.jobs.pex.contract_cost = {			
		200000,
		300000,
		400000,
		450000,
		550000,
		550000,
		550000
	}
	
	--Mexican Scarface Mansion
	self.jobs.fex.payout = {			
		70000,
		100000,
		300000,
		500000,
		650000,
		650000,
		650000
	}
	self.jobs.fex.contract_cost = {			
		45000,
		108000,
		200000,
		350000,
		500000,
		500000,
		500000
	}
	
	--Dragon Heist
	self.jobs.chas.payout = {			
		62500,
		100000,
		200000,
		250000,
		300000,
		300000,
		300000
	}
	self.jobs.chas.contract_cost = {			
		100000,
		200000,
		400000,
		600000,
		800000,
		800000,
		800000
	}
	
	--Vlad Breakout
	self.jobs.sand.payout = {			
		55000,
		100000,
		200000,
		400000,
		400000,
		400000,
		400000
	}
	self.jobs.sand.contract_cost = {			
		100000,
		200000,
		480000,
		650000,
		850000,
		850000,
		850000
	}
	
	--Mountain Master
	self.jobs.pent.payout = {			
		68000,
		100000,
		200000,
		400000,
		400000,
		400000,
		400000
	}
	self.jobs.pent.contract_cost = {			
		182000,
		308000,
		500000,
		600000,
		870000,
		870000,
		870000
	}
	
	--White House
	self.jobs.vit.payout = {			
		220000,
		350000,
		450000,
		650000,
		1000000,
		1000000,
		1000000
	}
	
	self.jobs.vit.contract_cost = {			
		54000,
		108000,
		270000,
		540000,
		700000,
		700000,
		700000
	}
	
	--Undercover
	self.jobs.man.payout = {			
		286000,
		399990,
		550000,
		650000,
		1000000,
		1000000,
		1000000
	}
	
	self.jobs.man.contract_cost = {			
		54000,
		108000,
		270000,
		540000,
		700000,
		700000,
		700000
	}
	
	--Midland Ranch
	self.jobs.ranc.payout = {			
		79000,
		200000,
		500000,
		1000000,
		1100000,
		1100000,
		1100000
	}
	self.jobs.ranc.contract_cost = {
		30000,
		100000,
		350000,
		550000,
		800000,
		800000,
		800000
	}
	
	--Lost In Transit
	self.jobs.trai.payout = {			
		95000,
		200000,
		700000,
		1000000,
		1100000,
		1100000,
		1100000
	}
	self.jobs.trai.contract_cost = {
		80000,
		400000,
		500000,
		600000,
		670000,
		670000,
		670000
	}
	
	--Hostile Takeover
	self.jobs.corp.payout = {			
		68500,
		200000,
		500000,
		850000,
		1200000,
		1200000,
		1200000
	}
	self.jobs.corp.contract_cost = {
		89000,
		170000,
		320000,
		470000,
		630000,
		630000,
		630000
	}
	
	--Crude Awakening
	self.jobs.deep.payout = {			
		72500,
		200000,
		500000,
		850000,
		1000000,
		1000000,
		1000000
	}
	self.jobs.deep.contract_cost = {			
		54000,
		108000,
		270000,
		540000,
		700000,
		700000,
		700000
	}

	-- black lives matter eclipse code now
NarrativeTweakData.jc_presets = { ["very_common"] = 10, ["slightly_very_common"] = 20, ["common"] = 30, ["slightly_rare"] = 40, ["rare"] = 50, ["slightly_very_rare"] = 60, ["very_rare"] = 70, ["extremely_rare"] = 80, }

NarrativeTweakData.heist_jc_presets = {
	-- very_common, jc = 10.
	branchbank = "very_common", branchbank_cash = "very_common", branchbank_deposit = "very_common", branchbank_prof = "very_common", chill = "very_common", family = "very_common",
	four_stores = "very_common", gallery = "very_common", jewelry_store = "very_common", mallcrasher = "very_common", nightclub = "very_common", safehouse = "very_common", short = "very_common",
	ukrainian_job = "very_common", ukrainian_job_prof = "very_common",

	-- slightly_very_common, jc = 20.
	arm_cro = "slightly_very_common", arm_fac = "slightly_very_common", arm_hcm = "slightly_very_common", arm_par = "slightly_very_common", arm_und = "slightly_very_common", arm_wrapper = "slightly_very_common",
	branchbank_gold = "slightly_very_common", branchbank_gold_prof = "slightly_very_common", dark = "slightly_very_common", fish = "slightly_very_common", kosugi = "slightly_very_common", moon = "slightly_very_common",
	spa = "slightly_very_common",

	-- common, jc = 30.
	cage = "common", cane = "common", crime_spree = "common", help = "common", hvh = "common", mex_cooking = "common", pines = "common", rat = "common", skm_big2 = "common", skm_bex = "common", skm_cas = "common",
	skm_red2 = "common", skm_mallcrasher = "common", skm_mus = "common", skm_watchdogs_stage2 = "common",

	-- slightly_rare, jc = 40.
	alex = "slightly_rare", election_day = "slightly_rare", firestarter = "slightly_rare", framing_frame = "slightly_rare", roberts = "slightly_rare", watchdogs = "slightly_rare", watchdogs_night = "slightly_rare",
	watchdogs_wrapper = "slightly_rare",

	-- rare, jc = 50.
	bex = "rare", born = "rare", bph = "rare", brb = "rare", chas = "rare", chca = "rare", jolly = "rare", mex = "rare",mus = "rare", pex = "rare", ranc = "rare", sah = "rare", sand = "rare", tag = "rare", wwh = "rare",
	chill_combat = "rare",

	-- slightly_very_rare, jc = 60.
	auc = "slightly_very_rare", arena = "slightly_very_rare", big = "slightly_very_rare", crojob1 = "slightly_very_rare", crojob_wrapper = "slightly_very_rare", dah = "slightly_very_rare", dinner = "slightly_very_rare",
	fex = "slightly_very_rare", flat = "slightly_very_rare", friend = "slightly_very_rare", glace = "slightly_very_rare", hox = "slightly_very_rare", hox_3 = "slightly_very_rare", man = "slightly_very_rare", mia = "slightly_very_rare",
	nmh = "slightly_very_rare", pal = "slightly_very_rare", pent = "slightly_very_rare", red2 = "slightly_very_rare", run = "slightly_very_rare", trai = "slightly_very_rare",

	-- very_rare, jc = 70.
	arm_for = "very_rare", des = "very_rare", corp = "very_rare", crojob2 = "very_rare", crojob2_night = "very_rare", haunted = "very_rare", kenaz = "very_rare", mad = "very_rare", nail = "very_rare", pbr = "very_rare", pbr2 = "very_rare",
	peta = "very_rare", rvd = "very_rare", shoutout_raid = "very_rare", welcome_to_the_jungle_prof = "very_rare", welcome_to_the_jungle_night_prof = "very_rare", welcome_to_the_jungle_wrapper = "very_rare", welcome_to_the_jungle_wrapper_prof = "very_rare",

	-- extremely_rare, jc = 80.
	deep = "extremely_rare", vit = "extremely_rare",
}

Hooks:PostHook(NarrativeTweakData, "init", "eclipse-narrativetweakdata-code-here", function(self)
	self.STARS = {
		{
			jcs = { 30, 20, 10, },
		},
		{
			jcs = { 40, 30, 20, 10, },
		},
		{
			jcs = { 50, 40, 30, 20, 10, },
		},
		{
			jcs = { 60, 50, 40, 30, 20, 10, },
		},
		{
			jcs = { 70, 60, 50, 40, 30, 20, 10, },
		},
		{
			jcs = { 80, 70, 60, 50, 40, 30, 20, 10, },
		},
		{
			jcs = { 90, 80, 70, 60, 50, 40, 30, 20, 10, },
		},
		{
			jcs = { 100, 90, 80, 70, 60, 50, 40, 30, 20, 10, },
		},
		{
			jcs = { 100, 90, 80, 70, 60, 50, 40, 30, 20, 10, },
		},
		{
			jcs = { 100, 90, 80, 70, 60, 50, 40, 30, 20, 10, },
		},
	}
    
end)
