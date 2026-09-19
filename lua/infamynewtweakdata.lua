-- remove skilltree multiplier for infamy 1
Hooks:PostHook(InfamyTweakData, "init", "fuckoff with that shit", function(self)
    self.items.infamy_root.upgrades.skilltree.multiplier = 1
end)
