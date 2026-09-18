Hooks:PostHook(InteractionTweakData, "init", "gage packages xd xd xd uwuwuwwuwuwuwuwuwuwuwuwuwuwuwuwuw and other stuff too #goon", function(self)
	--Increase default interaction distance resulting from being slightly taller in Resmod, just in case. (sorry mang i stole your shit its not resmod anymore eits mymod now)
	self.INTERACT_DISTANCE = 215

	self.gage_assignment.timer = 0
    self.requires_ecm_jammer_atm.timer = 8
    self.requires_ecm_jammer_double.timer = 4
    self.shaped_sharge.timer = 2 -- wait its actually named "shaped_sharge"
	self.pick_lock_hard.timer = 30
	self.pick_lock_hard.upgrade_timer_multipliers = {
		{ upgrade = "pick_lock_easy_speed_multiplier", category = "player" },
		{ upgrade = "pick_lock_speed_multiplier", category = "player" }
	}
    self.hack_ipad.timer = 3
	self.c4.timer = 2
	self.c4_special.timer = 2
	self.c4_bag.timer = 4
	self.c4_x1_bag.timer = 4
	self.shape_charge_plantable.timer = 2
	self.hack_ipad_jammed.timer = 10
	self.hack_suburbia.timer = 5
	self.hack_suburbia_outline.timer = 5
	self.hack_suburbia_jammed.timer = 5
	self.security_station.timer = 3
	self.security_station_keyboard.timer = 6
	self.big_computer_hackable.timer = 6
	self.big_computer_not_hackable.timer = 6
	self.big_computer_server.timer = 6
	self.security_station_jammed.timer = 10
	self.hack_numpad.timer = 15
	self.votingmachine2.timer = 5
	self.votingmachine2_jammed.timer = 5
	self.sc_tape_loop.timer = 2
	self.hack_electric_box.timer = 6
	self.hack_ship_control.timer = 6
	self.timelock_hack.timer = 6
	self.mcm_laptop.timer = 3
	self.hack_skylight_barrier.timer = 6
	self.drk_hold_hack_computer.timer = 10
	self.hold_start_scan.timer = 3
	self.hold_new_hack.timer = 3
	self.hold_type_in_password.timer = 5
	self.ranc_hold_enter_turret.timer = 0.5
	self.take_pardons.timer = 0
end)

-- black lives matter juggers code for use in my mod. lets you interact with things in casing mode.

Hooks:PostHook(InteractionTweakData, "init", "AllowAllCasingInteractions", function(self)
    -- Loop through every single interaction in the game
    for id, data in pairs(self) do
        if type(data) == "table" then
            -- Remove the mask requirement
            if data.requires_mask then
                data.requires_mask = false
            end
            
            -- Force the game to show the prompt in casing mode
            data.can_interact_in_civilian = true
        end
    end
end)
