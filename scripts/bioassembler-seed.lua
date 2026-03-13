local function init_storage()
  storage.growing_plants = storage.growing_plants or {}
end

local function on_built(event)
  init_storage()
  local entity = event.created_entity or event.entity
  
  if not entity or not entity.valid then return end
  
  local name = entity.name
  
  if name == "planetaris-bioassembler-plant-ghost" then
    -- Replace the ghost with plant
    local surface = entity.surface
    local position = entity.position
    local force = entity.force
    local quality = entity.quality
    
    entity.destroy()
    
    local plant = surface.create_entity{
      name = "planetaris-bioassembler-plant",
      position = position,
      force = force
    }
    
    if plant and plant.valid then
      table.insert(storage.growing_plants, {
        entity = plant,
        created_tick = game.tick,
        quality = quality,
      })
    end

    elseif name == "planetaris-bioassembler-plant" then
      table.insert(storage.growing_plants, {
        entity = entity,
        created_tick = game.tick,
        quality = quality,
      })
    end
end

-- Check fully grown plants
local function check_growth(event)
  init_storage()
  
  local plants = storage.growing_plants
  if #plants == 0 then return end
  
  local growth_ticks = 600
  local current_tick = game.tick
  
  -- Process in reverse to safely remove items
  for i = #plants, 1, -1 do
    local plant_data = plants[i]
    local entity = plant_data.entity
    local quality = plant_data.quality
    
    if not entity.valid then
      table.remove(plants, i)
    else
      local age = current_tick - plant_data.created_tick
      
      if age >= growth_ticks then
        local surface = entity.surface
        local position = entity.position
        
        entity.destroy()
        
        surface.create_entity{
          name = "planetaris-bioassembler",
          position = position,
          force = "player",
          quality = quality
        }
        
        surface.create_entity{
          name = "planetaris-bioassembler-explosion",
          position = position
        }
        
        table.remove(plants, i)
      end
    end
  end
end
return {
  init_storage = init_storage,
  on_built = on_built,
  check_growth = check_growth
}