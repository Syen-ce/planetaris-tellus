local pollen_corrosion = {}

local POLLUTION_THRESHOLD = 50  -- Pollen above this level causes damage
local DAMAGE_PER_TICK = 1
local CHECK_INTERVAL = 10
local SURFACE_NAME = "tellus"
local DAMAGE_TYPE = "acid" 

-- Dammage prototypes
local DAMAGE_PROTOTYPES = {
    "electric-pole",
    "accumulator",
}

-- Damage specific entities
local HAND_PICKED_ENTITIES = {
    "radar",
    "roboport",
    "tellus-roboport",
    "pipe",
    "tellus-pipe",
    "pipe-to-ground",
}

-- Convert to sets
local prototype_set = {}
for _, type_name in pairs(DAMAGE_PROTOTYPES) do
    prototype_set[type_name] = true
end

local hand_picked_set = {}
for _, name in pairs(HAND_PICKED_ENTITIES) do
    hand_picked_set[name] = true
end

-- Check if a chunk is polluted
local function is_chunk_polluted(surface, chunk_position)
    local world_x = chunk_position.x * 32 + 16
    local world_y = chunk_position.y * 32 + 16
    
    local pollution = surface.get_pollution({world_x, world_y})
    
    return pollution > POLLUTION_THRESHOLD, pollution
end

-- Damage entities
local function damage_entities_in_chunk(surface, chunk_position, pollution_value)
    local left_top = {
        x = chunk_position.x * 32,
        y = chunk_position.y * 32
    }
    local right_bottom = {
        x = left_top.x + 32,
        y = left_top.y + 32
    }
    
    -- Find all entities in the chunk
    local entities = surface.find_entities_filtered{
        area = {left_top, right_bottom}
    }
    
    local damaged_count = 0
    
    for _, entity in pairs(entities) do
        if entity.valid then
            local has_health = entity.health ~= nil
            local in_list = prototype_set[entity.type] or hand_picked_set[entity.name]
            
            if has_health and in_list then
                entity.damage(DAMAGE_PER_TICK, game.forces.neutral, DAMAGE_TYPE)
                damaged_count = damaged_count + 1
            end
        end
    end
    
    return damaged_count
end

function pollen_corrosion.process_corrosion(event)
    local surface = game.surfaces[SURFACE_NAME]
    
    if not surface then
        return
    end
    
    local total_damaged = 0
    local polluted_chunks = 0
    
    -- Check all chunks and damage entities in polluted ones
    for chunk in surface.get_chunks() do
        local is_polluted, pollution_value = is_chunk_polluted(surface, chunk)
        
        if is_polluted then
            polluted_chunks = polluted_chunks + 1
            local damaged = damage_entities_in_chunk(surface, chunk, pollution_value)
            total_damaged = total_damaged + damaged
        end
    end
    
    if total_damaged > 0 then
        -- game.print("[Pollen Corrosion] Damaged " .. total_damaged .. " entities across " .. polluted_chunks .. " polluted chunks")
    end
end

return pollen_corrosion