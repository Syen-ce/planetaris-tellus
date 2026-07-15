local NUTRIENTS_REQUIRED = 20

-- Mapping of assemblers to corpse variants
local assembler_to_corpse = {
  ["planetaris-bioassembler"] = "planetaris-bioassembler-dead",
  ["planetaris-incubator"] = "planetaris-incubator-dead",
}

local corpse_to_assembler = {
  ["planetaris-bioassembler-dead"] = "planetaris-bioassembler",
  ["planetaris-incubator-dead"] = "planetaris-incubator",
}

-- Storage integrity
local function ensure_storage_integrity()
  storage.corpse_data = storage.corpse_data or {}
end

local function on_init(event)
  ensure_storage_integrity()
end
script.on_init(on_init)

-- One-time migration
local function on_configuration_changed(event)
  ensure_storage_integrity()

  if next(storage.corpse_data) then return end

  for _, surface in pairs(game.surfaces) do
    local entities = surface.find_entities_filtered{
      name = { "planetaris-bioassembler-dead", "planetaris-incubator-dead" }
    }
    for _, entity in pairs(entities) do
      if not storage.corpse_data[entity.unit_number] then
        storage.corpse_data[entity.unit_number] = {
          recipe = nil,
          original_assembler = corpse_to_assembler[entity.name],
          rendering = nil,
          last_products_finished = entity.products_finished or 0,
          control_behavior = nil,
          circuit_connections = {},
          entity = entity,
          ingredients = {},
          products = {},
        }
      end
    end
  end
end

-- Rebuild
local function rebuild_assembler(corpse, data)
  if not corpse or not corpse.valid then return end

  local surface = corpse.surface
  local position = corpse.position
  local direction = corpse.direction
  local mirroring = corpse.mirroring
  local force = corpse.force
  local quality = corpse.quality

  local new_assembler = surface.create_entity{
    name = data.original_assembler,
    position = position,
    direction = direction,
    mirroring = mirroring,
    force = force,
    quality = quality
  }

  if new_assembler and new_assembler.valid then
    if data.recipe then
      new_assembler.set_recipe(data.recipe, data.recipe_quality or "normal")
    end

    if data.rendering and data.rendering.valid then
      data.rendering.destroy()
    end

        -- Transfer modules
    local module_inv_new = new_assembler.get_inventory(defines.inventory.crafter_modules)
    local module_inv_corpse = corpse.get_inventory(defines.inventory.crafter_modules)
    if module_inv_new and module_inv_new.valid and module_inv_corpse and module_inv_corpse.valid then
      for _, m in pairs(module_inv_corpse.get_contents()) do
        module_inv_new.insert({ name = m.name, count = m.count, quality = m.quality })
      end
    end

        -- Restore ingredients
    if data.ingredients then
      local input_inv = new_assembler.get_inventory(defines.inventory.crafter_input)
      if input_inv and input_inv.valid then
        for _, ingredient in pairs(data.ingredients) do
          input_inv.insert({ name = ingredient.name, count = ingredient.count, quality = ingredient.quality })
        end
      end
    end

        -- Restore products
    if data.products then
      local output_inv = new_assembler.get_inventory(defines.inventory.crafter_output)
      if output_inv and output_inv.valid then
        for _, product in pairs(data.products) do
          output_inv.insert({ name = product.name, count = product.count, quality = product.quality })
        end
      end
    end

        -- Restore control behavior
    if data.control_behavior then
      local control = new_assembler.get_or_create_control_behavior()
      if control then
        local cb = data.control_behavior
        if cb.circuit_enable_disable ~= nil then control.circuit_enable_disable = cb.circuit_enable_disable end
        if cb.circuit_condition then control.circuit_condition = cb.circuit_condition end
        if cb.connect_to_logistic_network ~= nil then control.connect_to_logistic_network = cb.connect_to_logistic_network end
        if cb.logistic_condition then control.logistic_condition = cb.logistic_condition end
        if cb.circuit_set_recipe ~= nil then control.circuit_set_recipe = cb.circuit_set_recipe end
        if cb.circuit_read_contents ~= nil then
          control.circuit_read_contents = cb.circuit_read_contents
          if cb.circuit_read_contents == true and cb.include_in_crafting ~= nil then
            control.include_in_crafting = cb.include_in_crafting
          end
        end
        if cb.circuit_read_ingredients ~= nil then control.circuit_read_ingredients = cb.circuit_read_ingredients end
        if cb.circuit_read_recipe_finished ~= nil then
          control.circuit_read_recipe_finished = cb.circuit_read_recipe_finished
          if cb.circuit_read_recipe_finished == true and cb.circuit_recipe_finished_signal then
            control.circuit_recipe_finished_signal = cb.circuit_recipe_finished_signal
          end
        end
        if cb.circuit_read_working ~= nil then
          control.circuit_read_working = cb.circuit_read_working
          if cb.circuit_read_working == true and cb.circuit_working_signal then
            control.circuit_working_signal = cb.circuit_working_signal
          end
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
            pcall(function() source_connector.connect_to(target_connector, false) end)
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

    storage.corpse_data[corpse.unit_number] = nil
    corpse.destroy()
  end
end

local function create_ghost(entity)
  local original_name = corpse_to_assembler[entity.name]
  if not original_name then return end

  local corpse_data = storage.corpse_data[entity.unit_number]

  local ghost = entity.surface.create_entity{
    name = "entity-ghost",
    position = entity.position,
    direction = corpse_data and corpse_data.direction or entity.direction,
    mirroring = corpse_data and corpse_data.mirroring or nil,
    force = entity.force,
    inner_name = original_name,
    quality = corpse_data and corpse_data.quality or "normal",
    recipe = corpse_data and corpse_data.recipe or nil,
    recipe_quality = corpse_data and corpse_data.recipe_quality or nil,
    expires = false,
  }

  if not ghost or not ghost.valid or not corpse_data then return end

  -- Restore control behavior
  if corpse_data.control_behavior then
    local control = ghost.get_or_create_control_behavior()
    if control then
      local cb = corpse_data.control_behavior
      if cb.circuit_enable_disable ~= nil then control.circuit_enable_disable = cb.circuit_enable_disable end
      if cb.circuit_condition then control.circuit_condition = cb.circuit_condition end
      if cb.connect_to_logistic_network ~= nil then control.connect_to_logistic_network = cb.connect_to_logistic_network end
      if cb.logistic_condition then control.logistic_condition = cb.logistic_condition end
      if cb.circuit_set_recipe ~= nil then control.circuit_set_recipe = cb.circuit_set_recipe end
      if cb.circuit_read_contents ~= nil then
        control.circuit_read_contents = cb.circuit_read_contents
        if cb.circuit_read_contents == true and cb.include_in_crafting ~= nil then
          control.include_in_crafting = cb.include_in_crafting
        end
      end
      if cb.circuit_read_ingredients ~= nil then control.circuit_read_ingredients = cb.circuit_read_ingredients end
      if cb.circuit_read_recipe_finished ~= nil then
        control.circuit_read_recipe_finished = cb.circuit_read_recipe_finished
        if cb.circuit_read_recipe_finished == true and cb.circuit_recipe_finished_signal then
          control.circuit_recipe_finished_signal = cb.circuit_recipe_finished_signal
        end
      end
      if cb.circuit_read_working ~= nil then
        control.circuit_read_working = cb.circuit_read_working
        if cb.circuit_read_working == true and cb.circuit_working_signal then
          control.circuit_working_signal = cb.circuit_working_signal
        end
      end
    end
  end

  -- Restore circuit connections
  if corpse_data.circuit_connections and #corpse_data.circuit_connections > 0 then
    for _, conn_data in pairs(corpse_data.circuit_connections) do
      if conn_data.target_entity and conn_data.target_entity.valid then
        local source_connector_id = conn_data.wire_type == defines.wire_type.red
          and defines.wire_connector_id.circuit_red
          or defines.wire_connector_id.circuit_green
        local source_connector = ghost.get_wire_connector(source_connector_id, true)
        local target_connector = conn_data.target_entity.get_wire_connector(conn_data.target_connector_id, true)
        if source_connector and target_connector then
          pcall(function() source_connector.connect_to(target_connector, false) end)
        end
      end
    end
  end
end

-- on_entity_died
local function on_entity_died(event)
  ensure_storage_integrity()
  local entity = event.entity
  if not entity or not entity.valid then return end

  -- Drop modules and clean up
  if corpse_to_assembler[entity.name] then
    local corpse_data = storage.corpse_data[entity.unit_number]
    if corpse_data then
      local module_inv = entity.get_inventory(defines.inventory.crafter_modules)
      if module_inv and module_inv.valid and not module_inv.is_empty() then
        for _, item_with_quality in pairs(module_inv.get_contents()) do
          entity.surface.spill_item_stack{
            position = entity.position,
            stack = { name = item_with_quality.name, count = item_with_quality.count, quality = item_with_quality.quality },
            enable_looted = true,
            force = entity.force,
            allow_belts = false
          }
        end
      end
      if corpse_data.rendering and corpse_data.rendering.valid then
        corpse_data.rendering.destroy()
      end
      create_ghost(entity)
      storage.corpse_data[entity.unit_number] = nil
    end
    return
  end

  local corpse_name = assembler_to_corpse[entity.name]
  if not corpse_name then return end

  local recipe, recipe_quality = entity.get_recipe()
  local surface = entity.surface
  local position = entity.position

  local corpse = surface.create_entity{
    name = corpse_name,
    position = position,
    direction = entity.direction,
    mirroring = entity.mirroring,
    force = entity.force,
    quality = entity.quality,
  }

  if corpse and corpse.valid then
    local ingredients, products = {}, {}

    local input_inv = entity.get_inventory(defines.inventory.crafter_input)
    if input_inv and input_inv.valid then
      for i = 1, #input_inv do
        local stack = input_inv[i]
        if stack and stack.valid_for_read then
          table.insert(ingredients, { name = stack.name, count = stack.count, quality = stack.quality })
        end
      end
    end

    local output_inv = entity.get_inventory(defines.inventory.crafter_output)
    if output_inv and output_inv.valid then
      for i = 1, #output_inv do
        local stack = output_inv[i]
        if stack and stack.valid_for_read then
          table.insert(products, { name = stack.name, count = stack.count, quality = stack.quality })
        end
      end
    end

    local control_behavior = nil
    local control = entity.get_or_create_control_behavior()
    if control then
      control_behavior = {}
      if control.circuit_enable_disable ~= nil then control_behavior.circuit_enable_disable = control.circuit_enable_disable end
      if control.circuit_condition then control_behavior.circuit_condition = control.circuit_condition end
      if control.connect_to_logistic_network ~= nil then control_behavior.connect_to_logistic_network = control.connect_to_logistic_network end
      if control.logistic_condition then control_behavior.logistic_condition = control.logistic_condition end
      if control.circuit_set_recipe ~= nil then control_behavior.circuit_set_recipe = control.circuit_set_recipe end
      if control.circuit_read_contents ~= nil then
        control_behavior.circuit_read_contents = control.circuit_read_contents
        if control.circuit_read_contents == true and control.include_in_crafting ~= nil then
          control_behavior.include_in_crafting = control.include_in_crafting
        end
      end
      if control.circuit_read_ingredients ~= nil then control_behavior.circuit_read_ingredients = control.circuit_read_ingredients end
      if control.circuit_read_recipe_finished ~= nil then
        control_behavior.circuit_read_recipe_finished = control.circuit_read_recipe_finished
        if control.circuit_read_recipe_finished == true and control.circuit_recipe_finished_signal then
          control_behavior.circuit_recipe_finished_signal = control.circuit_recipe_finished_signal
        end
      end
      if control.circuit_read_working ~= nil then
        control_behavior.circuit_read_working = control.circuit_read_working
        if control.circuit_read_working == true and control.circuit_working_signal then
          control_behavior.circuit_working_signal = control.circuit_working_signal
        end
      end
      local ok, val = pcall(function() return control.circuit_read_resources end)
      if ok and val ~= nil then control_behavior.circuit_read_resources = val end
    end

    local circuit_connections = {}
    for _, wire_id in ipairs{ defines.wire_connector_id.circuit_red, defines.wire_connector_id.circuit_green } do
      local connector = entity.get_wire_connector(wire_id, true)
      if connector and connector.connections then
        for _, connection in pairs(connector.connections) do
          if connection.target and connection.target.owner and connection.target.owner.valid then
            table.insert(circuit_connections, {
              wire_type = wire_id == defines.wire_connector_id.circuit_red and defines.wire_type.red or defines.wire_type.green,
              target_entity = connection.target.owner,
              target_connector_id = connection.target.wire_connector_id
            })
          end
        end
      end
    end

    -- Store with direct entity reference
    storage.corpse_data[corpse.unit_number] = {
      recipe = recipe and recipe.name or nil,
      recipe_quality = recipe_quality and recipe_quality.name or nil,
      original_assembler = entity.name,
      rendering = nil,
      last_products_finished = corpse.products_finished or 0,
      control_behavior = control_behavior,
      circuit_connections = circuit_connections,
      entity = corpse,
      ingredients = ingredients,
      products = products,
      quality = entity.quality.name,
      direction = entity.direction,
      mirroring = entity.mirroring,
    }

    local module_inv = entity.get_inventory(defines.inventory.crafter_modules)
    local module_inv_corpse = corpse.get_inventory(defines.inventory.crafter_modules)
    if module_inv and module_inv.valid and module_inv_corpse and module_inv_corpse.valid then
      for _, c in pairs(module_inv.get_contents()) do
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
  if not storage.corpse_data or not next(storage.corpse_data) then return end

  for unit_number, corpse_data in pairs(storage.corpse_data) do
    local entity = corpse_data.entity

    if not entity or not entity.valid then
      -- Entity is gone, just clean up — no search needed, storage is the source of truth
      if corpse_data.rendering and corpse_data.rendering.valid then
        corpse_data.rendering.destroy()
      end
      storage.corpse_data[unit_number] = nil

    else
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

-- on_pre_player_mined_item
local function on_pre_player_mined_item(event)
  ensure_storage_integrity()
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

return {
  on_entity_died = on_entity_died,
  on_pre_player_mined_item = on_pre_player_mined_item,
  revive_bioassembler = revive_bioassembler,
  on_init = on_init,
  on_configuration_changed = on_configuration_changed,
}