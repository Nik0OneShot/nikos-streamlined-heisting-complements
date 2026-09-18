-- change movement speed values + height

Hooks:PostHook(PlayerTweakData, "init", "shc_init", function (self)
	self.put_on_mask_time = 0
	self.gravity = -982 
	self.terminal_velocity = -7000 --these numbers are never used afaik, but just to be safe...
  
	self.movement_state.standard.movement.speed.STANDARD_MAX = 300
	self.movement_state.standard.movement.speed.RUNNING_MAX = 800
	self.movement_state.standard.movement.speed.CROUCHING_MAX = 200
	self.movement_state.standard.movement.speed.STEELSIGHT_MAX = 200
	self.movement_state.standard.movement.speed.INAIR_MAX = 200
	self.movement_state.standard.movement.speed.CLIMBING_MAX = 200
	self.movement_state.standard.movement.jump_velocity.z = 500
	self.movement_state.standard.movement.jump_velocity.xy.run = self.movement_state.standard.movement.speed.RUNNING_MAX * 1.2
	self.movement_state.standard.movement.jump_velocity.xy.walk = self.movement_state.standard.movement.speed.STANDARD_MAX * 1.2
	self.movement_state.standard.gravity = 982 --used in the calculation in playerstandard for applying correct damping, does not actually change gravity
	self.movement_state.standard.terminal_velocity = 7000 --used in the calculation in playerstandard for proper falling, change as you will it

  -- height changes because of tran wrong

	local pivot_head_translation = Vector3()
	local pivot_head_rotation = Rotation()
	local pivot_shoulder_translation = Vector3()
	local pivot_shoulder_rotation = Rotation()

	self.stances.default.standard.head.translation = Vector3(0, 0, 153)
	self.stances.default.mask_off.head.translation = Vector3(0, 0, 169)
	self.stances.default.crouched.head.translation = Vector3(0, 0, 75)
	self.stances.default.player_turret.head.translation = Vector3(0, 0, 161)
	self.stances.jowi.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.jowi.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.jowi.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
end)
