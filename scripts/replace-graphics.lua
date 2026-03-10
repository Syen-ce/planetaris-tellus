local replacement = {}

local SURFACE_NAME = "tellus"

-- [standard_entity] = graphics_variant
local REPLACEMENTS = {
    --["substation"] = "tellus-substation",
    ["rocket-silo"] = "tellus-rocket-silo",
    --["big-electric-pole"] = "tellus-big-electric-pole",
    --["medium-electric-pole"] = "tellus-medium-electric-pole",
    --["small-electric-pole"] = "tellus-small-electric-pole",
    ["roboport"] = "tellus-roboport",
    ["beacon"] = "tellus-beacon",
    ["pipe"] = "tellus-pipe",
    ["storage-tank"] = "tellus-storage-tank",
}

-- Create reverse lookup table for blueprints
local REVERSE_REPLACEMENTS = {}
for standard, variant in pairs(REPLACEMENTS) do
    REVERSE_REPLACEMENTS[variant] = standard
end

-- Replace an existing entity
local function replace_entity(entity)
    if not entity or not entity.valid then return end
    if entity.surface.name ~= SURFACE_NAME then return end
    
    local new_entity_name = REPLACEMENTS[entity.name]
    if not new_entity_name then return end
    
    -- Validate entity is still valid before replacement (multiplayer safety)
    if not entity.valid then return end
    
    local surface = entity.surface
    local position = entity.position
    local force = entity.force
    local direction = entity.direction
    local last_user = entity.last_user
    local quality = entity.quality
    
    entity.destroy({raise_destroy = false})
    
    -- Create with create_entity which is deterministic
    local new_entity = surface.create_entity{
        name = new_entity_name,
        position = position,
        force = force,
        direction = direction,
        quality = quality,
        raise_built = false
    }
    
    if new_entity and last_user then
        new_entity.last_user = last_user
    end
    
    return new_entity
end

-- Replace a ghost entity (for blueprint placement)
local function replace_ghost(ghost)
    if not ghost or not ghost.valid then return end
    if ghost.surface.name ~= SURFACE_NAME then return end
    
    local new_entity_name = REPLACEMENTS[ghost.ghost_name]
    if not new_entity_name then return end
    
    local surface = ghost.surface
    local position = ghost.position
    local force = ghost.force
    local direction = ghost.direction
    local player = ghost.last_user
    local quality = ghost.quality
    
    ghost.destroy({raise_destroy = false})
    
    local new_ghost = surface.create_entity{
        name = "entity-ghost",
        position = position,
        force = force,
        direction = direction,
        inner_name = new_entity_name,
        quality = quality
    }
    
    if new_ghost and player then
        new_ghost.last_user = player
    end
    
    return new_ghost
end

-- Entity built events
function replacement.on_built(event)
    if not event.entity or not event.entity.valid then return end
    if event.entity.surface.name ~= SURFACE_NAME then return end
    
    if REPLACEMENTS[event.entity.name] then
        replace_entity(event.entity)
        return
    end
    
    if event.entity.name == "entity-ghost" then
        local ghost_name = event.entity.ghost_name
        
        -- Convert variant ghosts to standard ghosts (from blueprints created on Tellus)
        if REVERSE_REPLACEMENTS[ghost_name] then
            local standard_name = REVERSE_REPLACEMENTS[ghost_name]
            
            local surface = event.entity.surface
            local position = event.entity.position
            local force = event.entity.force
            local direction = event.entity.direction
            local player = event.entity.last_user
            local quality = event.entity.quality
            
            event.entity.destroy({raise_destroy = false})
            
            surface.create_entity{
                name = "entity-ghost",
                position = position,
                force = force,
                direction = direction,
                inner_name = standard_name,
                quality = quality,
                player = player
            }
        end
    end
end

-- Handle entity cloned events
function replacement.on_entity_cloned(event)
    if not event.destination or not event.destination.valid then return end
    if event.destination.surface.name ~= SURFACE_NAME then return end
    
    if REPLACEMENTS[event.destination.name] then
        replace_entity(event.destination)
        return
    end
    
    if event.destination.name == "entity-ghost" then
        local ghost_name = event.destination.ghost_name
        
        -- Check if this is a ghost of a variant entity that should be reverted to standard
        if REVERSE_REPLACEMENTS[ghost_name] then
            local standard_name = REVERSE_REPLACEMENTS[ghost_name]
            
            local surface = event.destination.surface
            local position = event.destination.position
            local force = event.destination.force
            local direction = event.destination.direction
            local player = event.destination.last_user
            local quality = event.destination.quality
            
            event.destination.destroy({raise_destroy = false})
            
            surface.create_entity{
                name = "entity-ghost",
                position = position,
                force = force,
                direction = direction,
                inner_name = standard_name,
                quality = quality,
                player = player
            }
        end
    end
end

-- Handle blueprint setup
function replacement.on_player_setup_blueprint(event)
    local player = game.get_player(event.player_index)
    if not player then return end
    
    local blueprint = player.blueprint_to_setup
    if not blueprint or not blueprint.valid_for_read then
        blueprint = player.cursor_stack
    end
    
    if not blueprint or not blueprint.valid_for_read or not blueprint.is_blueprint then
        return
    end
    
    local entities = blueprint.get_blueprint_entities()
    if not entities then return end
    
    local modified = false
    for i, entity in pairs(entities) do
        local standard_name = REVERSE_REPLACEMENTS[entity.name]
        if standard_name then
            entities[i].name = standard_name
            modified = true
        end
    end
    
    if modified then
        blueprint.set_blueprint_entities(entities)
    end
end

-- When player configures a blueprint
function replacement.on_player_configured_blueprint(event)
    local player = game.get_player(event.player_index)
    if not player then return end
    
    local item = player.cursor_stack
    if not item or not item.valid_for_read or not item.is_blueprint then
        return
    end
    
    local entities = item.get_blueprint_entities()
    if not entities then return end
    
    local modified = false
    for i, entity in pairs(entities) do
        local standard_name = REVERSE_REPLACEMENTS[entity.name]
        if standard_name then
            entities[i].name = standard_name
            modified = true
        end
    end
    
    if modified then
        item.set_blueprint_entities(entities)
    end
end

-- Handle cursor stack changes to swap variant items with standard items
function replacement.on_cursor_stack_changed(event)
    local player = game.get_player(event.player_index)
    if not player then return end
    
    local cursor_stack = player.cursor_stack
    if not cursor_stack or not cursor_stack.valid_for_read then return end
    
    -- Handle regular items that place variant entities
    local place_result = cursor_stack.prototype.place_result
    if place_result then
        local entity_name = place_result.name
        local standard_name = REVERSE_REPLACEMENTS[entity_name]
        
        if standard_name then
            -- This item places a variant entity, swap it for the standard item
            local count = cursor_stack.count
            local proto = prototypes.entity[standard_name]
            
            if proto and proto.items_to_place_this and proto.items_to_place_this[1] then
                local standard_item = proto.items_to_place_this[1].name
                cursor_stack.clear()
                cursor_stack.set_stack{name = standard_item, count = count}
            end
        end
    end
end

-- Handle when player uses pipette tool
function replacement.on_player_pipette(event)
    local player = game.get_player(event.player_index)
    if not player then return end
    
    local selected = player.selected
    if not selected or not selected.valid then return end
    
    -- Check if selected entity is a variant
    local standard_name = REVERSE_REPLACEMENTS[selected.name]
    if not standard_name then return end
    
    -- Player is trying to pipette a variant entity
    -- Get the standard item
    local proto = prototypes.entity[standard_name]
    if not proto or not proto.items_to_place_this or not proto.items_to_place_this[1] then return end
    
    local standard_item = proto.items_to_place_this[1].name
    
    -- Check if in map editor mode
    if player.controller_type == defines.controllers.editor or player.controller_type == defines.controllers.god then
        -- Map editor or god mode - give standard item which places standard ghosts
        player.cursor_stack.clear()
        player.cursor_stack.set_stack{name = standard_item, count = 1}
    elseif player.controller_type == defines.controllers.character then
        -- Survival mode - check if player has the item
        local main_inventory = player.get_main_inventory()
        if main_inventory and main_inventory.get_item_count(standard_item) > 0 then
            -- Player has the item in inventory, give it to cursor
            player.cursor_stack.clear()
            player.cursor_stack.set_stack{name = standard_item, count = 1}
        end
        -- If player doesn't have the item, do nothing (vanilla behavior)
    end
end

-- Replace all existing entities on surface
function replacement.replace_all_existing()
    local surface = game.surfaces[SURFACE_NAME]
    if not surface then return end
    
    local total_entities = 0
    local total_ghosts = 0
    
    for old_name, new_name in pairs(REPLACEMENTS) do
        -- Check if replacement entity exists before attempting replacement
        if prototypes.entity[new_name] then
            local entities = surface.find_entities_filtered{name = old_name}
            for _, entity in pairs(entities) do
                replace_entity(entity)
            end
            total_entities = total_entities + #entities
            
            -- Replace ghosts
            local ghosts = surface.find_entities_filtered{
                name = "entity-ghost",
                ghost_name = old_name
            }
            for _, ghost in pairs(ghosts) do
                replace_ghost(ghost)
            end
            total_ghosts = total_ghosts + #ghosts
        end
    end
    
    --if total_entities > 0 or total_ghosts > 0 then
    --    game.print("Applied graphical variants to " .. total_entities .. " entities and " .. total_ghosts .. " ghosts on '" .. SURFACE_NAME .. "'")
    --end
end

return replacement