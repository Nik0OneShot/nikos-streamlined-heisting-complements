Hooks:PostHook(EquipmentsTweakData, "init", "moar_c4", function(self)
  -- give more tripmines and shaped charges. just one extra, because it lets yoou do transport a little easier w/o skills.
  self.trip_mine.quantity = { 4, 4 }
end)
