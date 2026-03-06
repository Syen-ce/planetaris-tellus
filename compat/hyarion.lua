if not mods["planetaris-hyarion"] then return end

local planetaris_simulations = require("__planetaris-tellus__.prototypes.factoriopedia-simulations")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local plant_flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"}
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

local pointy_crystal = {
      {
        filename = "__planetaris-tellus__/graphics/entity/plant/charged-crystal/hyarion-charged-crystal-1.png",
        priority = "high",
        width = 256,
        height = 256,
        shift = {0 , -0.5},
        scale = 0.8,
      },
            {
        filename = "__planetaris-tellus__/graphics/entity/plant/charged-crystal/hyarion-charged-crystal-2.png",
        priority = "high",
        width = 256,
        height = 256,
        shift = {0 , -0.5},
        scale = 0.8,
      },
            {
        filename = "__planetaris-tellus__/graphics/entity/plant/charged-crystal/hyarion-charged-crystal-3.png",
        priority = "high",
        width = 256,
        height = 256,
        shift = {0 , -0.5},
        scale = 0.8,
      },
            {
        filename = "__planetaris-tellus__/graphics/entity/plant/charged-crystal/hyarion-charged-crystal-4.png",
        priority = "high",
        width = 256,
        height = 256,
        shift = {0 , -0.5},
        scale = 0.8,
      },
            {
        filename = "__planetaris-tellus__/graphics/entity/plant/charged-crystal/hyarion-charged-crystal-5.png",
        priority = "high",
        width = 256,
        height = 256,
        shift = {0 , -0.5},
        scale = 0.8,
      },
            {
        filename = "__planetaris-tellus__/graphics/entity/plant/charged-crystal/hyarion-charged-crystal-6.png",
        priority = "high",
        width = 256,
        height = 256,
        shift = {0 , -0.5},
        scale = 0.8,
      },
            {
        filename = "__planetaris-tellus__/graphics/entity/plant/charged-crystal/hyarion-charged-crystal-7.png",
        priority = "high",
        width = 256,
        height = 256,
        shift = {0 , -0.5},
        scale = 0.8,
      },
            {
        filename = "__planetaris-tellus__/graphics/entity/plant/charged-crystal/hyarion-charged-crystal-8.png",
        priority = "high",
        width = 256,
        height = 256,
        shift = {0 , -0.5},
        scale = 0.8,
      },
            {
        filename = "__planetaris-tellus__/graphics/entity/plant/charged-crystal/hyarion-charged-crystal-9.png",
        priority = "high",
        width = 256,
        height = 256,
        shift = {0 , -0.5},
        scale = 0.8,
      },
      {
        filename = "__planetaris-tellus__/graphics/entity/plant/charged-crystal/hyarion-charged-crystal-10.png",
        priority = "high",
        width = 256,
        height = 256,
        shift = {0 , -0.5},
        scale = 0.8,
      },
}

-- Update tech

table.insert(data.raw["technology"]["planet-discovery-tellus"].prerequisites, "planetaris-refraction-science-pack")
table.insert(data.raw["technology"]["planet-discovery-tellus"].unit.ingredients, {"planetaris-refraction-science-pack",  1})


-- Update recipes

table.insert(data.raw["recipe"]["planetaris-pathological-science-pack"].ingredients, {type = "item",  name = "planetaris-unstable-bacteria",  amount = 2})

-- Pathologics Tech

data.extend({
  {
    type = "technology",
    name = "planetaris-hyarion-pathological-research",
    icon = "__planetaris-tellus__/graphics/technology/hyarion-pathologics.png",
    icon_size = 256,
    essential = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planetaris-unstable-crystalizer"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-unstable-crystal-manipulation"
      },
    },
    prerequisites = {"planetaris-fulgora-pathological-research"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"automation-science-pack",      1},
        {"logistic-science-pack",        1},
        {"chemical-science-pack",        1},
        {"production-science-pack",      1},
        {"utility-science-pack",         1},
        {"space-science-pack",           1},
        {"agricultural-science-pack",    1},
        {"electromagnetic-science-pack", 1},
        {"planetaris-polishing-science-pack",  1},
        {"planetaris-refraction-science-pack",  1},
        {"planetaris-bioengineering-science-pack",  1}
      },
      time = 30
    },
  },
})

table.insert(data.raw["technology"]["planetaris-pathological-science-pack"].prerequisites, "planetaris-hyarion-pathological-research")

-- Items

data.extend({

  {
    type = "item",
    name = "planetaris-unstable-crystalizer",
    icon = "__planetaris-tellus__/graphics/icons/unstable-seed.png",
    pictures =
    {
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/unstable-seed.png",   scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/unstable-seed-4.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/unstable-seed-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/unstable-seed-3.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "tellus-other-planet-agriculture",
    order = "d[hyarion]-a[seed]",
    plant_result = "planetaris-big-charged-crystal",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 10,
    default_import_location = "tellus",
    weight = 10 * kg,
    fuel_category = "chemical",
    spoil_ticks = 60 * minute,
    spoil_to_trigger_result =
    {
      items_per_trigger = 25,
      trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "create-entity",
                entity_name = "medium-explosion"
              },
              {
                type = "create-entity",
                entity_name = "small-scorchmark-tintable",
                check_buildability = true
              },
              {
                type = "invoke-tile-trigger",
                repeat_count = 1
              },
              {
                type = "destroy-decoratives",
                from_render_layer = "decorative",
                to_render_layer = "object",
                include_soft_decoratives = true,
                include_decals = false,
                invoke_decorative_trigger = true,
                decoratives_with_trigger_only = false, 
                radius = 1.25
              }
            }
          }
        },
        {
          type = "area",
          radius = 1,
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "damage",
                damage = {amount = 170, type = "explosion"}
              },
              {
                type = "create-entity",
                entity_name = "explosion"
              }
            }
          }
        }
      }
    },
    fuel_value = "1MJ"
  },
  {
    type = "item",
    name = "planetaris-unstable-crystal",
    icon = "__planetaris-tellus__/graphics/icons/unstable-crystal.png",
    subgroup = "tellus-other-planet-agriculture",
    order = "d[hyarion]-b[crystal]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 10,
    default_import_location = "tellus",
    weight = 10 * kg,
    spoil_ticks = 15 * minute,
    spoil_to_trigger_result =
    {
      items_per_trigger = 25,
      trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "create-entity",
                entity_name = "medium-explosion"
              },
              {
                type = "create-entity",
                entity_name = "small-scorchmark-tintable",
                check_buildability = true
              },
              {
                type = "invoke-tile-trigger",
                repeat_count = 1
              },
              {
                type = "destroy-decoratives",
                from_render_layer = "decorative",
                to_render_layer = "object",
                include_soft_decoratives = true,
                include_decals = false,
                invoke_decorative_trigger = true,
                decoratives_with_trigger_only = false, 
                radius = 1.25
              }
            }
          }
        },
        {
          type = "area",
          radius = 1,
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "damage",
                damage = {amount = 170, type = "explosion"}
              },
              {
                type = "create-entity",
                entity_name = "explosion"
              }
            }
          }
        }
      }
    },
  },
  {
    type = "item",
    name = "planetaris-unstable-bacteria",
    icon = "__planetaris-tellus__/graphics/icons/unstable-bacteria.png",
    pictures =
    {
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/unstable-bacteria.png",   scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/unstable-bacteria-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/unstable-bacteria-3.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "tellus-other-planet-agriculture",
    order = "d[hyarion]-c[bacteria]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "tellus",
    weight = 1 * kg,
    spoil_ticks = 15 * minute,
    spoil_to_trigger_result =
    {
      items_per_trigger = 25,
      trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "create-entity",
                entity_name = "medium-explosion"
              },
              {
                type = "create-entity",
                entity_name = "small-scorchmark-tintable",
                check_buildability = true
              },
              {
                type = "invoke-tile-trigger",
                repeat_count = 1
              },
              {
                type = "destroy-decoratives",
                from_render_layer = "decorative",
                to_render_layer = "object",
                include_soft_decoratives = true,
                include_decals = false,
                invoke_decorative_trigger = true,
                decoratives_with_trigger_only = false, 
                radius = 1.25
              }
            }
          }
        },
        {
          type = "area",
          radius = 1,
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "damage",
                damage = {amount = 170, type = "explosion"}
              },
              {
                type = "create-entity",
                entity_name = "explosion"
              }
            }
          }
        }
      }
    },
  },



-- Recipes
{
    type = "recipe",
    name = "planetaris-unstable-crystalizer",
    category = "particle-manipulation",
    energy_required = 4,
    surface_conditions =
    {
      {
        property = "planetaris-crystalization-resistance",
        min = 50,
        max = 100,
      }
    },
    enabled = false,
    ingredients = {
      {type = "fluid",  name = "planetaris-aluminium", amount = 50},
      {type = "item",   name = "planetaris-unstable-shard", amount = 10},
    },
    results =
    {
      {type = "item", name = "planetaris-unstable-crystalizer", amount = 1},
    },
    crafting_machine_tint =
    {
      primary = {0.929, 0.549, 0.737, 1},
      secondary = {0.929, 0.549, 0.737, 1},
    }
  },
  {
    type = "recipe",
    name = "planetaris-unstable-crystal-manipulation",
    icon = "__planetaris-tellus__/graphics/icons/unstable-crystal-manipulation.png",
    category = "particle-manipulation",
    subgroup = "tellus-other-planet-agriculture",
    order = "d[hyarion]-b[crystal]-b",
    energy_required = 2,
    surface_conditions =
    {
      {
        property = "planetaris-crystalization-resistance",
        min = 50,
        max = 100,
      }
    },
    enabled = false,
    ingredients = {
      {type = "item",   name = "planetaris-unstable-crystal", amount = 1},
      {type = "item",  name = "planetaris-charged-fluorite", amount = 1},
    },
    results =
    {
      {type = "item", name = "planetaris-unstable-crystalizer", amount = 1, probability = 0.02},
      {type = "item", name = "planetaris-unstable-bacteria", amount = 1},
    },
    crafting_machine_tint =
    {
      primary = {0.929, 0.549, 0.737, 1},
      secondary = {0.929, 0.549, 0.737, 1},
    }
  },

})
-- Plant

data.extend({

  {
    type = "plant",
    name = "planetaris-big-charged-crystal",
    icon = "__planetaris-tellus__/graphics/icons/charged-crystal.png",
    flags = plant_flags,
    minable =
    {
      mining_particle = "jellystem-mining-particle",
      mining_time = 0.5,
      results =
      {
        {type = "fluid", name = "planetaris-aluminium", amount = 300},
        {type = "item",  name = "planetaris-unstable-crystal", amount = 50}
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-ashland-lichen-tree", 5, 0.4),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-ashland-lichen-tree", 5, 0.4),
    growth_ticks = 5 * minute,
    --harvest_emissions = plant_harvest_emissions,
    --emissions_per_second = plant_emissions,    
    max_health = 50,
    collision_box = {{-0.5, -0.6}, {0.5, 0.4}},
    selection_box = {{-0.9, -2.4}, {0.9, 0.3}},
    collision_mask = {layers={player=true, water_tile=true, train=true, is_object=true, is_lower_object=true}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "trees",
    order = "a[tree]-c-z[tellus]-b[normal]-a[Chloronack]",
    impact_category = "tree",
    factoriopedia_simulation = planetaris_simulations.factoriopedia_big_charged_crystal_plant,
    autoplace =
    {
      probability_expression = "0",
      tile_restriction = {"hyarion-crystal-dark", "hyarion-crystal-flats", "hyarion-crystal-light", "hyarion-pumice-stones", "hyarion-crystal-soil",}
    },
    pictures = pointy_crystal,
    map_color = {255, 255, 255},
  },

})

-- Space connection

data:extend({
      {
          type = "space-connection",
          name = "hyarion-tellus",
          subgroup = "planet-connections",
          from = "hyarion",
          to = "tellus", 
          length = 15000,
          icon_size = 64,
          order = "d-c",
          asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo),
      },
})

if data.raw["space-connection"]["fulgora-tellus"] then
  data.raw["space-connection"]["fulgora-tellus"] = nil
end