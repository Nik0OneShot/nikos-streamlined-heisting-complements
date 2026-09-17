Hooks:PostHook( NarrativeTweakData, "init", "SC_Narratives", function(self)
-- black lives matter restoration mod code cuz im lazy and fat and as the white man would say "based and pill red"

	self.jobs.mex.jc = 60
	self.jobs.mex_cooking.jc = 60
	
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
    
end)
