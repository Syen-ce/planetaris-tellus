local seed = require("scripts.bioassembler-seed")
local spoil = require("scripts.bioassembler-spoil")
local replacement = require("scripts.replace-graphics")
local preservation_tech = require("scripts.space-preservation")
-- local pollen_corrosion = require("scripts.pollen-corrosion")

----------

script.on_init(function()
  storage.growing_plants = {}
  storage.corpse_data = {}
  seed.init_storage()
  preservation_tech.on_init()
  replacement.replace_all_existing()
end)

script.on_configuration_changed(function()
  storage.growing_plants = storage.growing_plants or {}
  storage.corpse_data = storage.corpse_data or {}
  preservation_tech.on_configuration_changed()
  replacement.replace_all_existing()
end)

script.on_event(defines.events.on_built_entity, function(event)
  seed.on_built(event)
  replacement.on_built(event)
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
  seed.on_built(event)
  replacement.on_built(event)
end)

script.on_event(defines.events.on_entity_cloned, function(event)
  replacement.on_entity_cloned(event)
end)

-- Handle cursor stack changed (for building preview)
--script.on_event(defines.events.on_player_cursor_stack_changed, function(event)
--   replacement.on_player_cursor_stack_changed(event)
--end)

script.on_event(defines.events.on_player_setup_blueprint, function(event)
  replacement.on_player_setup_blueprint(event)
end)

script.on_event(defines.events.on_player_configured_blueprint, function(event)
  replacement.on_player_configured_blueprint(event)
end)

script.on_event(defines.events.on_entity_died, function(event)
  spoil.on_entity_died(event)
end)

script.on_event(defines.events.on_pre_player_mined_item, function(event)
  spoil.on_pre_player_mined_item(event)
end)

script.on_event(defines.events.on_player_pipette, function(event)
  replacement.on_player_pipette(event)
end)

script.on_event(defines.events.on_player_cursor_stack_changed, function(event)
  replacement.on_cursor_stack_changed(event)
end)

-- script.on_event(defines.events.on_player_toggled_alt_mode, spoil.on_player_toggled_alt_mode)

script.on_event(defines.events.on_research_finished, function(event)
  preservation_tech.on_research_finished(event)
end)

script.on_nth_tick(60, function(event)
  seed.check_growth(event)
  spoil.revive_bioassembler(event)
  preservation_tech.process_preservation(event)
end)

script.on_nth_tick(10, function(event)
  -- pollen_corrosion.process_corrosion(event)
end)