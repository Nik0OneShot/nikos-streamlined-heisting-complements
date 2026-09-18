Hooks:PostHook(CarryTweakData, "init", "run with everything lol", function(self)
-- use eclipse code to modify bag move speed and jump mods, then apply my own changes.
    for _, v in pairs(self.types) do
		v.can_run = true
	    v.move_speed_modifier = math.min(v.move_speed_modifier + 0.15, 1)
	    v.jump_modifier = math.min(v.jump_modifier + 0.25, 1)
	    v.throw_distance_multiplier = math.min(v.throw_distance_multiplier + 0.25, 1)
    end
end)
