-- Casing Movement by Jugger
-- The casing-state jump and crouch function names are reversed in PAYDAY 2.
--
-- NOTE: the previous "world interaction routing" block (which force-routed
-- any nearby interactable through PlayerStandard's interact system) has
-- been removed. It was breaking rope/rappel interactions at heists like
-- Mountain Master, and could leave a flag stuck true that silently blocked
-- crouch/jump for the rest of the casing session. casing_interactions.lua
-- already achieves "interact regardless of mask" at the tweak-data level,
-- which is safer and doesn't touch the input/animation pipeline at all.
--
-- Instant Mask has also moved out to its own standalone mod.

local SPRINT_SUSPICION_MULTIPLIER = 2
local CROUCH_SUSPICION_MULTIPLIER = 1.5
local SUSPICION_REASON = "casing_movement"

local function update_movement_suspicion(self)
    local multiplier = 1
    if self._running then multiplier = SPRINT_SUSPICION_MULTIPLIER
    elseif self._state_data.ducking then multiplier = CROUCH_SUSPICION_MULTIPLIER end
    local player_base = self._unit:base()
    player_base:set_suspicion_multiplier(SUSPICION_REASON, multiplier)
    player_base:set_detection_multiplier(SUSPICION_REASON, multiplier)
end

Hooks:OverrideFunction(PlayerMaskOff, "_upd_attention", function(self)
    update_movement_suspicion(self)
    self._ext_movement:set_attention_settings(self._mask_off_attention_settings)
end)

Hooks:PostHook(PlayerMaskOff, "enter", "CasingMovementEnter", function(self)
    self:_upd_attention()
end)

Hooks:PostHook(PlayerMaskOff, "exit", "CasingMovementExit", function(self)
    local player_base = self._unit:base()
    player_base:set_suspicion_multiplier(SUSPICION_REASON, 1)
    player_base:set_detection_multiplier(SUSPICION_REASON, 1)
end)

Hooks:PostHook(PlayerMaskOff, "_update_check_actions", "CasingMovement_InjectActions", function(self, t, dt)
    local input = self:_get_input(t, dt)

    if not self:_interacting() then
        self:_check_action_jump(t, input)
        self:_check_action_duck(t, input)
        self:_check_action_run(t, input)
    end
end)

-- Despite its name, PlayerMaskOff:_check_action_jump receives crouch input.
Hooks:OverrideFunction(PlayerMaskOff, "_check_action_jump", function(self, t, input) return PlayerStandard._check_action_duck(self, t, input) end)

-- Likewise, PlayerMaskOff:_check_action_duck receives jump input.
Hooks:OverrideFunction(PlayerMaskOff, "_check_action_duck", function(self, t, input) return PlayerStandard._check_action_jump(self, t, input) end)

local function stop_running(self, t)
    if self._running then
        self:_end_action_running(t)
        self:set_running(false)
        self:_upd_attention()
    end
end

Hooks:OverrideFunction(PlayerMaskOff, "_check_action_run", function(self, t, input)
    if (self._setting_hold_to_run and input.btn_run_release) or (self._running and not self._move_dir) then
        self._running_wanted = false
        stop_running(self, t)
    elseif (not self._setting_hold_to_run and input.btn_run_release and not self._move_dir) then
        self._running_wanted = false
        stop_running(self, t)
    elseif input.btn_run_press or self._running_wanted then
        if not self._running or self._end_running_expire_t then
            self:_start_action_running(t)
        elseif self._running and not self._setting_hold_to_run then
            stop_running(self, t)
        end
    end
end)

Hooks:OverrideFunction(PlayerMaskOff, "_start_action_running", function(self, t)
    if not self._move_dir then return end
    if self:on_ladder() or self:_on_zipline() then return end
    if self._state_data.ducking and not self:_can_stand() then return end
    if not self:_can_run_directional() or managers.player:get_player_rule("no_run") then return end
    if not self._unit:movement():is_above_stamina_threshold() then return end

    self._running_wanted = false
    self:set_running(true)
    self._end_running_expire_t = nil
    self._start_running_t = t
    self._play_stop_running_anim = nil
    self:_interupt_action_ducking(t)
    self:_upd_attention()
end)

Hooks:OverrideFunction(PlayerMaskOff, "_end_action_running", function(self, t)
    if not self._end_running_expire_t then self._end_running_expire_t = t + 0.4 end
end)
