local preservation_tech = {}

local preservation_data = require("__planetaris-tellus__/lib")
local config = preservation_data.config
local blacklist_array = preservation_data.blacklist

local SPOILAGE_BLACKLIST = {}

-- rebuild the blacklist
local function rebuild_blacklist()
  SPOILAGE_BLACKLIST = {}
  for _, item_name in pairs(blacklist_array) do
    SPOILAGE_BLACKLIST[item_name] = true
  end
  
  -- Debug: Print blacklist
  log("Space Preservation Blacklist rebuilt:")
  for item_name, _ in pairs(SPOILAGE_BLACKLIST) do
    log("  - " .. item_name)
  end
end

-- Preservation data
local space_spoilage_data = {
  enabled = false,
  multiplier = 1.0,
  current_tier = 0
}

-- Track last spoil_tick for each item to calculate the adjusted rate
local item_spoil_tracking = {}

-- Initialize preservation data
function preservation_tech.on_init()
  storage.space_spoilage_data = storage.space_spoilage_data or space_spoilage_data
  storage.item_spoil_tracking = storage.item_spoil_tracking or {}
  
  log("CONTROL ON_INIT - preservation_data.blacklist:")
  for _, item in ipairs(preservation_data.blacklist) do
    log("  - " .. item)
  end

  rebuild_blacklist()
end

function preservation_tech.on_configuration_changed()
  storage.space_spoilage_data = storage.space_spoilage_data or space_spoilage_data
  storage.item_spoil_tracking = storage.item_spoil_tracking or {}
  
  -- Rebuild blacklist on config change
  rebuild_blacklist()
  
  -- Recalculate from researched technologies
  for _, force in pairs(game.forces) do
    local best_tier = 0
    for tier, _ in pairs(config) do
      if force.technologies["planetaris-space-preservation-" .. tier] and 
         force.technologies["planetaris-space-preservation-" .. tier].researched then
        best_tier = math.max(best_tier, tier)
      end
    end
    
    if best_tier > 0 then
      storage.space_spoilage_data.enabled = true
      storage.space_spoilage_data.multiplier = config[best_tier].multiplier
      storage.space_spoilage_data.current_tier = best_tier
    end
  end
  
  space_spoilage_data = storage.space_spoilage_data
  item_spoil_tracking = storage.item_spoil_tracking
end

-- Handle research finished
function preservation_tech.on_research_finished(event)
  local tech_name = event.research.name
  
  -- Check each tier
  for tier, values in pairs(config) do
    if tech_name == "planetaris-space-preservation-" .. tier then
      -- Only update if this is a higher tier than current
      if tier > (storage.space_spoilage_data.current_tier or 0) then
        storage.space_spoilage_data.enabled = true
        storage.space_spoilage_data.multiplier = values.multiplier
        storage.space_spoilage_data.current_tier = tier
        
        game.print("Space preservation technology researched! Materials spoil " .. values.new .. "% slower in space.")
        
        -- Clear tracking since multiplier changed
        storage.item_spoil_tracking = {}
      end
      break
    end
  end
  
  -- Update local reference
  space_spoilage_data = storage.space_spoilage_data
  item_spoil_tracking = storage.item_spoil_tracking
end

-- Process all cargo bay entities on space platforms
function preservation_tech.process_preservation(event)
  -- Load from storage in case it was updated
  if storage.space_spoilage_data then
    space_spoilage_data = storage.space_spoilage_data
  end
  if storage.item_spoil_tracking then
    item_spoil_tracking = storage.item_spoil_tracking
  end
  
  if not space_spoilage_data.enabled then return end
  if space_spoilage_data.multiplier >= 1 then return end
  
  -- How many ticks to restore based on multiplier
  -- If multiplier is 0.5, we restore 30 ticks for every 60 that pass
  local ticks_to_restore = math.floor(60 * (1 - space_spoilage_data.multiplier))
  
  for _, surface in pairs(game.surfaces) do
    if surface.platform then
      -- Get all cargo-bay type entities
      local cargo_entities = surface.find_entities_filtered({
        type = "cargo-bay"
      })
      
      -- Also get space platform hubs
      local hubs = surface.find_entities_filtered({
        name = "space-platform-hub"
      })
      
      -- Combine both tables
      for _, hub in pairs(hubs) do
        table.insert(cargo_entities, hub)
      end
      
      -- Process all cargo entities
      for _, entity in pairs(cargo_entities) do
        local inv = entity.get_inventory(defines.inventory.chest)
        
        if inv then
          for i = 1, #inv do
            local stack = inv[i]
            if stack.valid_for_read and stack.spoil_tick then
              -- Check if item is blacklisted
              local is_blacklisted = SPOILAGE_BLACKLIST[stack.name]
              
              -- Apply preservation only if NOT blacklisted
              if not is_blacklisted then
                -- Try to add ticks, let Factorio clamp to max automatically
                pcall(function()
                  stack.spoil_tick = stack.spoil_tick + ticks_to_restore
                end)
              end
            end
          end
        end
      end
    end
  end
end

return preservation_tech