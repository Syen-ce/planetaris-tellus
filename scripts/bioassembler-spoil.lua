local NUTRIENTS_REQUIRED = 20

local TEXT_OFFSET = {
  destroyed = {x = 0, y = -2},
  progress = {x = 0, y = -1},
  rebuilt = {x = 0, y = -2}
}

-- Mapping of assemblers to corpse variants
local assembler_to_corpse = {
  ["planetaris-bioassembler"] = "planetaris-bioassembler-dead",
  ["planetaris-incubator"] = "planetaris-incubator-dead",
}

local corpse_to_assembler = {
  ["planetaris-bioassembler-dead"] = "planetaris-bioassembler",
  ["planetaris-incubator-dead"] = "planetaris-incubator",
}

-- Helper function to count table entries
local function table_size(t)
  local count = 0
  for _ in pairs(t) do count = count + 1 end
  return count
end

local function init_storage()
  storage.corpse_data = storage.corpse_data or {}
end

-- Update rendering alt-mode settings
local function update_corpse_rendering(entity, corpse_data)
  local show_text = false
  for _, player in pairs(game.players) do
    if player.game_view_settings.show_entity_info then
      show_text = true
      break
    end
  end
  
  if corpse_data.rendering and corpse_data.rendering.valid then
    corpse_data.rendering.destroy()
    corpse_data.rendering = nil
  end
  
  if show_text then
    corpse_data.rendering = rendering.draw_text{
      text = "[item=nutrients] Revival in progress...",
      surface = entity.surface,
      target = {
        entity = entity,
        offset = {TEXT_OFFSET.progress.x, TEXT_OFFSET.progress.y}
      },
      color = {r = 1, g = 1, b = 1},
      scale = 1,
      font = "default-game",
      alignment = "center",
      use_rich_text = true
    }
  end
end

-- Rebuild
local function rebuild_assembler(corpse, data)
  if not corpse or not corpse.valid then return end
  
  local surface = corpse.surface
  local position = corpse.position
  local direction = corpse.direction
  local force = corpse.force
  
  local new_assembler = surface.create_entity{
    name = data.original_assembler,
    position = position,
    direction = direction,
    force = force
  }
  
  if new_assembler and new_assembler.valid then
    if data.recipe then
      new_assembler.set_recipe(data.recipe)
    end
    
    if data.rendering and data.rendering.valid then
      data.rendering.destroy()
    end
    
    -- Transfer modules
    local module_inv_new = new_assembler.get_inventory(defines.inventory.assembling_machine_modules)
    local module_inv_corpse = corpse.get_inventory(defines.inventory.assembling_machine_modules)
    if module_inv_new and module_inv_new.valid and module_inv_corpse and module_inv_corpse.valid then
      local contents = module_inv_corpse.get_contents()
      for _, m in pairs(contents) do
        module_inv_new.insert({ name = m.name, count = m.count, quality = m.quality })
      end
    end
    
    -- Restore control behavior
    if data.control_behavior then
      local control = new_assembler.get_or_create_control_behavior()
      if control then
        
        if data.control_behavior.circuit_enable_disable ~= nil then
          control.circuit_enable_disable = data.control_behavior.circuit_enable_disable
        end
        
        if data.control_behavior.circuit_condition then
          control.circuit_condition = data.control_behavior.circuit_condition
        end
        
        if data.control_behavior.connect_to_logistic_network ~= nil then
          control.connect_to_logistic_network = data.control_behavior.connect_to_logistic_network 
        end
        
        if data.control_behavior.logistic_condition then
          control.logistic_condition = data.control_behavior.logistic_condition
        end
        
        if data.control_behavior.circuit_set_recipe ~= nil then
          control.circuit_set_recipe = data.control_behavior.circuit_set_recipe 
        end

        if data.control_behavior.circuit_read_contents ~= nil then
          control.circuit_read_contents = data.control_behavior.circuit_read_contents

          if data.control_behavior.circuit_read_contents == true and data.control_behavior.include_in_crafting ~= nil then
            control.include_in_crafting = data.control_behavior.include_in_crafting
          end
        end
        
        if data.control_behavior.circuit_read_ingredients ~= nil then
          control.circuit_read_ingredients = data.control_behavior.circuit_read_ingredients 
        end

        if data.control_behavior.circuit_read_recipe_finished ~= nil then
          control.circuit_read_recipe_finished = data.control_behavior.circuit_read_recipe_finished
        end

        if data.control_behavior.circuit_read_recipe_finished == true and data.control_behavior.circuit_recipe_finished_signal then
          control.circuit_recipe_finished_signal = data.control_behavior.circuit_recipe_finished_signal
        end

        if data.control_behavior.circuit_read_working ~= nil then
          control.circuit_read_working = data.control_behavior.circuit_read_working
        end

        if data.control_behavior.circuit_read_working == true and data.control_behavior.circuit_working_signal then
          control.circuit_working_signal = data.control_behavior.circuit_working_signal
        end
      end
    end
    
    -- Restore circuit connections
    if data.circuit_connections and #data.circuit_connections > 0 then
      for _, conn_data in pairs(data.circuit_connections) do
        -- Verify target is valid
        if conn_data.target_entity and conn_data.target_entity.valid then
          -- Get wire connectors for both entities
          local source_connector_id = conn_data.wire_type == defines.wire_type.red 
            and defines.wire_connector_id.circuit_red 
            or defines.wire_connector_id.circuit_green
          
          local source_connector = new_assembler.get_wire_connector(source_connector_id, true)
          local target_connector = conn_data.target_entity.get_wire_connector(conn_data.target_connector_id, true)
          
          -- Connect them if both connectors exist
          if source_connector and target_connector then
            pcall(function()
              source_connector.connect_to(target_connector, false)
            end)
          end
        end
      end
    end
    
    for _, player in pairs(game.players) do
      if player.physical_surface == surface then
        player.create_local_flying_text{
          text = {"assembler-reconstruction.assembler-rebuilt"},
          position = position,
          color = {r = 0, g = 1, b = 0},
          time_to_live = 60,
          speed = 1
        }
      end
    end

    -- if data.recipe then
    --   for _, player in pairs(game.players) do
    --     if player.physical_surface == surface then
    --       player.create_local_flying_text{
    --         text = {"assembler-reconstruction.recipe-restored", data.recipe},
    --         position = {x = position.x, y = position.y + 0.5},
    --         color = {r = 0.5, g = 1, b = 1},
    --         time_to_live = 60,
    --         speed = 1
    --       }
    --     end
    --   end
    -- end
    
    storage.corpse_data[corpse.unit_number] = nil
    corpse.destroy()
  end
end

-- When destroyed, create a corpse, save recipe and modules
local function on_entity_died(event)
  init_storage()
  local entity = event.entity
  if not entity or not entity.valid then return end
  
  if corpse_to_assembler[entity.name] then
    local corpse_data = storage.corpse_data[entity.unit_number]
    if corpse_data then
      
      if corpse_data.rendering and corpse_data.rendering.valid then
        corpse_data.rendering.destroy()
      end

      storage.corpse_data[entity.unit_number] = nil
    end
    return
  end
  
  local corpse_name = assembler_to_corpse[entity.name]
  if not corpse_name then return end
  
  -- Save the recipe
  local recipe = entity.get_recipe()
  local recipe_name = recipe and recipe.name or nil
  
  -- Corpse
  local surface = entity.surface
  local position = entity.position
  local direction = entity.direction
  local force = entity.force
  
  local corpse = surface.create_entity{
    name = corpse_name,
    position = position,
    direction = direction,
    force = force
  }
  
  if corpse and corpse.valid then
    -- Save control behavior
    local control_behavior = nil
    local control = entity.get_or_create_control_behavior()
    if control then
      control_behavior = {}
      
      if control.circuit_enable_disable ~= nil then
        control_behavior.circuit_enable_disable = control.circuit_enable_disable
      end
      
      if control.circuit_condition then
        control_behavior.circuit_condition = control.circuit_condition
      end
      
      if control.connect_to_logistic_network ~= nil then
        control_behavior.connect_to_logistic_network = control.connect_to_logistic_network
      end
      
      if control.logistic_condition then
        control_behavior.logistic_condition = control.logistic_condition
      end
      
      if control.circuit_set_recipe ~= nil then
        control_behavior.circuit_set_recipe = control.circuit_set_recipe
      end

      if control.circuit_read_contents ~= nil then
        control_behavior.circuit_read_contents = control.circuit_read_contents

        if control.circuit_read_contents == true and control.include_in_crafting ~= nil then
          control_behavior.include_in_crafting = control.include_in_crafting
        end
      end
      
      if control.circuit_read_ingredients ~= nil then
        control_behavior.circuit_read_ingredients = control.circuit_read_ingredients
      end

      if control.circuit_read_recipe_finished ~= nil then
        control_behavior.circuit_read_recipe_finished = control.circuit_read_recipe_finished
      end

      if control.circuit_read_recipe_finished == true and control.circuit_recipe_finished_signal then
        control_behavior.circuit_recipe_finished_signal = control.circuit_recipe_finished_signal
      end

      if control.circuit_read_working ~= nil then
        control_behavior.circuit_read_working = control.circuit_read_working
      end

      if control.circuit_read_working == true and control.circuit_working_signal then
        control_behavior.circuit_working_signal = control.circuit_working_signal
      end
      
      success, value = pcall(function() return control.circuit_read_resources end)
      if success and value ~= nil then
        --game.print("Found circuit_read_resources: " .. tostring(value))
        control_behavior.circuit_read_resources = value
      end
    end
    
    -- Save circuit connections
    local circuit_connections = {}
    
    -- Try to get wire connector
    local wire_connector = entity.get_wire_connector(defines.wire_connector_id.circuit_red, true)
    if wire_connector and wire_connector.connections then
      for _, connection in pairs(wire_connector.connections) do
        if connection.target and connection.target.owner and connection.target.owner.valid then
          table.insert(circuit_connections, {
            wire_type = defines.wire_type.red,
            target_entity = connection.target.owner,
            target_connector_id = connection.target.wire_connector_id
          })
        end
      end
    end
    
    -- Green wire
    wire_connector = entity.get_wire_connector(defines.wire_connector_id.circuit_green, true)
    if wire_connector and wire_connector.connections then
      for _, connection in pairs(wire_connector.connections) do
        if connection.target and connection.target.owner and connection.target.owner.valid then
          table.insert(circuit_connections, {
            wire_type = defines.wire_type.green,
            target_entity = connection.target.owner,
            target_connector_id = connection.target.wire_connector_id
          })
        end
      end
    end
    
    storage.corpse_data[corpse.unit_number] = {
      recipe = recipe_name,
      original_assembler = entity.name,
      rendering = nil,
      last_products_finished = 0,
      control_behavior = control_behavior,
      circuit_connections = circuit_connections,
      entity = corpse  -- Cache reference
    }

    -- Code from cerys - transfer modules to corpse
    local module_inv = entity.get_inventory(defines.inventory.assembling_machine_modules)
    local module_inv_corpse = corpse.get_inventory(defines.inventory.assembling_machine_modules)
    if module_inv and module_inv.valid and module_inv_corpse and module_inv_corpse.valid then
      local contents = module_inv.get_contents()
      for _, c in pairs(contents) do
        module_inv_corpse.insert({ name = c.name, count = c.count, quality = c.quality })
      end
    end
    
    for _, player in pairs(game.players) do
      if player.physical_surface == surface then
        player.create_local_flying_text{
          text = {"assembler-reconstruction.assembler-destroyed", NUTRIENTS_REQUIRED},
          position = position,
          color = {r = 1, g = 0.5, b = 0},
          time_to_live = 90,
          speed = 1
        }
      end
    end
  end
end

-- When finished recipe rebuild
local function revive_bioassembler(event)
  init_storage()
  
  if not next(storage.corpse_data) then return end
  
  for unit_number, corpse_data in pairs(storage.corpse_data) do
    if not corpse_data.entity or not corpse_data.entity.valid then
      local found = false
      for _, surface in pairs(game.surfaces) do
        local entities = surface.find_entities_filtered{
          name = {
            "planetaris-bioassembler-dead",
            "planetaris-incubator-dead"
          }
        }
        
        for _, entity in pairs(entities) do
          if entity.unit_number == unit_number then
            corpse_data.entity = entity  -- Cache the entity reference
            found = true
            break
          end
        end
        if found then break end
      end
      
      -- Clean up if still not found
      if not found then
        if corpse_data.rendering and corpse_data.rendering.valid then
          corpse_data.rendering.destroy()
        end
        storage.corpse_data[unit_number] = nil
      end
    end
    
    -- Check crafting progress (entity is now cached)
    if corpse_data.entity and corpse_data.entity.valid then
      local entity = corpse_data.entity
      local products_finished = entity.products_finished or 0
      
      if not corpse_data.last_products_finished then
        corpse_data.last_products_finished = products_finished
      end
      
      if products_finished > corpse_data.last_products_finished then
        rebuild_assembler(entity, corpse_data)
      else
        corpse_data.last_products_finished = products_finished
      end
    end
  end
end

-- Clean up data and rendering when corpse is mined
local function on_pre_player_mined_item(event)
  init_storage()
  local entity = event.entity
  if entity and entity.valid and corpse_to_assembler[entity.name] then
    local corpse_data = storage.corpse_data[entity.unit_number]
    if corpse_data then

      if corpse_data.rendering and corpse_data.rendering.valid then
        corpse_data.rendering.destroy()
      end

      storage.corpse_data[entity.unit_number] = nil
    end
  end
end

-- alt-mode toggle
local function on_player_toggled_alt_mode(event)
  init_storage()
  local player = game.get_player(event.player_index)
  if not player then return end
  
  for unit_number, corpse_data in pairs(storage.corpse_data) do
    for _, surface in pairs(game.surfaces) do
      local entities = surface.find_entities_filtered{
        name = {
          "planetaris-bioassembler-dead",
          "planetaris-incubator-dead"
        }
      }
      
      for _, entity in pairs(entities) do
        if entity.unit_number == unit_number then
          update_corpse_rendering(entity, corpse_data)
          break
        end
      end
    end
  end
end

return {
  on_entity_died = on_entity_died,
  on_pre_player_mined_item = on_pre_player_mined_item,
  --on_player_toggled_alt_mode = on_player_toggled_alt_mode,
  revive_bioassembler = revive_bioassembler
}