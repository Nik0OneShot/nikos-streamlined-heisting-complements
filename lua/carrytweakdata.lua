Hooks:PostHook(CarryTweakData, "init", "run with everything lol", function(self)
-- use eclipse code to modify bag move speed and jump mods
    for _, v in pairs(self.types) do
	    v.move_speed_modifier = math.min(v.move_speed_modifier + 0.15, 1)
	    v.jump_modifier = math.min(v.jump_modifier + 0.25, 1)
    end
end)
