-- from restoration mod

function MoneyManager:get_secured_bonus_bag_value(carry_id, multiplier)
	local carry_value = managers.money:get_bag_value(carry_id, multiplier)
	local bag_value = 0
	local bag_risk = 0
	local bag_skill_bonus = managers.player:upgrade_value("player", "secured_bags_money_multiplier", 1)

	if managers.loot:is_bonus_bag(carry_id) then
		local job_id = managers.job:current_job_id()
		local stars = managers.job:has_active_job() and managers.job:current_difficulty_stars() or 0
		local money_multiplier = self:get_contract_difficulty_multiplier(stars)
		local total_stages = job_id and #tweak_data.narrative:job_chain(job_id) or 1
		local pro_job_bonus = self:get_tweak_value("money_manager", "pro_job_new") or 1
		bag_value = carry_value
		bag_risk = math.round(bag_value * money_multiplier)

		if pro_job_bonus > 1 then
			bag_value = bag_value * pro_job_bonus
			bag_risk = bag_risk * pro_job_bonus
		end
	else
		bag_value = carry_value
	end

	return math.round((bag_value + bag_risk) * bag_skill_bonus / self:get_tweak_value("money_manager", "offshore_rate"))
end
