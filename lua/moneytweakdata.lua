local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

Hooks:PostHook(MoneyTweakData, "init", "50/50 split", function (self)
	self.offshore_rate = 0.50
	self.mandatory_mult = 0.50

  -- increase the money you get from the card cash shit.
	self.loot_drop_cash = { cash10 = 100000, cash20 = 150000, cash30 = 200000, cash40 = 250000, cash50 = 300000, cash60 = 350000, cash70 = 400000, 
                          cash80 = 450000, cash90 = 500000, cash100 = 600000, cash_preorder = 800000 }

	-- make pro jobs give you 50% money. on death wish and death sentence, this is increased to 100%!
	if difficulty_index < 7 then
	self.pro_job_new = 0
	if Global.game_settings and Global.game_settings.one_down then
		self.pro_job_new = 1.50
	end
	else
	self.pro_job_new = 0
	if Global.game_settings and Global.game_settings.one_down then
		self.pro_job_new = 2
	end
	end
end)
