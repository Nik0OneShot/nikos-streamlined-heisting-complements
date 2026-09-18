Hooks:PreHook(EquipmentsTweakData, "init", "singleplayer_boons", function(self)
local is_singleplayer = Global.game_settings and Global.game_settings.single_player then

	-- taken from restoration mod, hold more items in singleplayer.
	self.specials = {} -- see if this fixes that crash...
	if is_singleplayer then
		self.specials.acid.max_quantity=4
		self.specials.caustic_soda.max_quantity=4
		self.specials.hydrogen_chloride.max_quantity=4
		self.specials.boards.max_quantity=4
		self.specials.planks.max_quantity=4
		self.specials.thermite_paste.max_quantity=4
		self.specials.acid.quantity=1
		self.specials.caustic_soda.quantity=1
		self.specials.hydrogen_chloride.quantity=1
		self.specials.boards.quantity=1
		self.specials.planks.quantity=1
		self.specials.bank_manager_key.quantity = 1
		self.specials.bank_manager_key.max_quantity=4
		self.specials.thermite_paste.quantity=1
		self.specials.gas.max_quantity=4
		self.specials.gas.quantity=1
		self.specials.harddrive.max_quantity=4
		self.specials.harddrive.quantity=1
		self.specials.c4.quantity=8
		self.specials.c4.max_quantity=8
		self.specials.printer_ink.quantity=1
		self.specials.printer_ink.max_quantity=4
		self.specials.paper_roll.quantity=1
		self.specials.paper_roll.max_quantity=4
		self.specials.crowbar.quantity=1
		self.specials.crowbar.max_quantity=4
		self.specials.crowbar_stack.quantity=1
		self.specials.crowbar_stack.max_quantity=4
		self.specials.liquid_nitrogen.quantity=1
		self.specials.liquid_nitrogen.max_quantity=4
		self.specials.thermite.quantity=1
		self.specials.thermite.max_quantity=4	
		self.specials.blood_sample.quantity=1
		self.specials.blood_sample.max_quantity=4		
		self.specials.blood_sample_verified.quantity=1
		self.specials.blood_sample_verified.max_quantity=4	
		self.specials.mayan_gold_bar.quantity=4
		self.specials.mayan_gold_bar.max_quantity=4		
		self.specials.lance_part.quantity=4
		self.specials.lance_part.max_quantity=4
		self.specials.stock.quantity=1
		self.specials.stock.max_quantity=4	
		self.specials.barrel.quantity=1		
		self.specials.barrel.max_quantity=4			
		self.specials.receiver.quantity=1		
		self.specials.receiver.max_quantity=4		
		self.specials.ranc_acid.quantity=1		
		self.specials.ranc_acid.max_quantity=4				
	end
end)

Hooks:PostHook(EquipmentsTweakData, "init", "moar_c4", function(self)
  -- give more tripmines and shaped charges. just one extra, because it lets yoou do transport a little easier w/o skills.
  self.trip_mine.quantity = { 4, 4 }
end)
