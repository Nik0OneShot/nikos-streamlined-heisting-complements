-- taken from "additional loot XP".

local level = Global.level_data and Global.level_data.level_id or ""

local heist_xp = {
  branchbank = 400, -- Bank Heist
  jewelry_store = 400, -- Jewelry Store
  firestarter_1 = 300, -- Firestarter day 1
  firestarter_3 = 500, -- Firestarter day 3
  watchdogs_1 = 200, -- Watchdogs day 1
  alex_2 = 300, -- Rats day 2
  alex_3 = 500, -- Rats day 3
  welcome_to_the_jungle_1 = 400, -- Big Oil day 1
  welcome_to_the_jungle_1_night = 400, -- Big Oil day 1 - night
  election_day_2 = 500, -- Election Day day 2 (Swing Vote)
  election_day_3 = 500, -- Election Day day 2 (Breaking Ballot)
  mallcrasher = 500, -- Mallcrasher
  ukrainian_job = 600, -- Ukrainian Job
  four_stores = 1000, -- Four Stores
  kenaz = 500, -- Golden Grin Casino
  pex = 800, -- Breakfast in Tijuana
  short1 = 1000, -- Flash Drive
  short2 = 1000, -- Get the Coke
  escape_cafe = 300, -- Cafe Escape
  escape_cafe_day = 300, -- Cafe Escape
  escape_garage = 300, -- Garage Escape
  escape_overpass = 300, -- Overpass Escape
  escape_overpass_night = 300, -- overpass escape but night
  escape_park = 300, -- Park Escape
  escape_park_day = 300, -- Park Escape
  escape_street = 300, -- Street Escape
}
local bag_spec_xp = {
  dinner = { din_pig = 1000 }, -- Slaughterhouse
  family = { money = 1000 }, -- Diamond Store
  flat = { toothbrush = 1000 }, -- Panic Room
  framing_frame_3 = { old_wine = 1000 }, -- Framing Frame day 3
}
local bag_limit_xp = { 
  kosugi = { limit = 16, xp = 500 },
  mia_2 = { limit = 10, xp = 1000 },
  chas = { limit = 14, xp = 1000 },
}
local small_loot_xp = {
  gen_atm = 250, -- ATM, Money Counter
  slot_machine_payout = 250, -- Winning Slip
  spawn_bucket_of_money = 250, -- Au Ticket
  ring_band = 50, -- ??? Ring
  federali_medal = 50, -- Federali Medal
  money_bundle = 20, -- Money Bundle, Casino Chips, Phone, Tablet
  diamondheist_vault_bust = 20, -- Necklace
  diamondheist_vault_diamond = 20, -- Jewelry, Jewels
  diamondheist_big_diamond = 20, -- Saphire, Tiara
  mus_small_artifact = 20, -- Small Artifact
  vault_loot_chest = 20, -- Chest
  vault_loot_diamond_chest = 20, -- Diamond Chest
  vault_loot_banknotes = 20, -- Banknotes
  vault_loot_silver = 20, -- Silver
  vault_loot_diamond_collection = 20, -- Diamond Collection
  vault_loot_trophy = 20, -- Trophy
  vault_loot_gold = 20, -- Gold Bar
  vault_loot_cash = 20, -- Money Roll
  vault_loot_coins = 20, -- Coins
  vault_loot_ring = 20, -- Ring
  vault_loot_jewels = 20, -- Diamonds
}
local last_timestamp = 0

Hooks:PostHook(LootManager, "sync_secure_loot", "AddLootXP_LM_sync_secure_loot", function(self, carry_id, multiplier_level, silent, peer_id)
  if tweak_data.carry[carry_id] then
    local add_xp = heist_xp[level] or bag_spec_xp[level] and bag_spec_xp[level][carry_id] or 0

    if bag_limit_xp[level] then
      local secured = self:get_secured_mandatory_bags_amount() + self:get_secured_bonus_bags_amount()
      add_xp = secured > bag_limit_xp[level].limit and bag_limit_xp[level].xp or add_xp
    end

    managers.experience:mission_xp_award(add_xp)
  else
    local add_xp = small_loot_xp[carry_id] or 0
    local my_id = managers.network:session():local_peer():id()
    local cur_time = TimerManager:game():time()

    if Network:is_client() and peer_id == my_id and last_timestamp == cur_time then
      add_xp = 0
    end

    last_timestamp = cur_time
    managers.experience:mission_xp_award(add_xp)
  end
end)
