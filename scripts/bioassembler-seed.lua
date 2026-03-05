local function init_storage()
  storage.growing_plants = storage.growing_plants or {}
end

local function on_built(event)
  init_storage()
  local entity = event.created_entity or event.entity
  
  -- Check if a ghost was placed by construction bots
  
  if entity and entity.valid and entity.name == "planetaris-bioassembler-plant-ghost" then
    -- Replace the ghost
    local surface = entity.surface
    local position = entity.position
    local force = entity.force
    
    entity.destroy()
    
    local plant = surface.create_entity{
      name = "planetaris-bioassembler-plant",
      position = position,
      force = force
    }
    
    if plant and plant.valid then
      table.insert(storage.growing_plants, {
        entity = plant,
        unit_number = plant.unit_number,
        created_tick = game.tick
      })
    end
  -- Check if a real plant was placed directly
  elseif entity and entity.valid and entity.name == "planetaris-bioassembler-plant" then
    table.insert(storage.growing_plants, {
      entity = entity,
      unit_number = entity.unit_number,
      created_tick = game.tick
    })
  end
end

-- Check fully grown plants
local function check_growth(event)
  init_storage()
  if #storage.growing_plants == 0 then return end
  
  local growth_ticks = 600
  
  for i = #storage.growing_plants, 1, -1 do
    local plant_data = storage.growing_plants[i]
    
    if not plant_data.entity.valid then
      table.remove(storage.growing_plants, i)
    else
      local age = game.tick - plant_data.created_tick
      
      if age >= growth_ticks then
        local surface = plant_data.entity.surface
        local position = plant_data.entity.position
        local force = plant_data.entity.force
        
        plant_data.entity.destroy()
        
        local machine = surface.create_entity{
          name = "planetaris-bioassembler",
          position = position,
          force = "player"
        }
        
        if machine then
          surface.create_entity{
            name = "planetaris-bioassembler-explosion",
            position = position
          }
        end
        
        table.remove(storage.growing_plants, i)
      end
    end
  end
end

return {
  init_storage = init_storage,
  on_built = on_built,
  check_growth = check_growth
}