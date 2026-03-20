local base_sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local base_item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local item_effects = require("__space-age__.prototypes.item-effects")
local meld = require("meld")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")

data:extend({

-- Hardwood

  -- {
  --   type = "item",
  --   name = "planetaris-hardwood",
  --   icon = "__planetaris-tellus__/graphics/icons/hardwood.png",
  --   subgroup = "tellus-basic-processes",
  --   order = "a[natural]-a[basic]-a[hardwood]",
  --   inventory_move_sound = base_item_sounds.wood_inventory_move,
  --   pick_sound = base_item_sounds.wood_inventory_pickup,
  --   drop_sound = base_item_sounds.wood_inventory_move,
  --   stack_size = 50,
  --   default_import_location = "tellus",
  --   weight = 1 * kg,
  -- },
  {
  type = "item",
  name = "planetaris-compost",
  icon = "__planetaris-tellus__/graphics/icons/compost.png",
  subgroup = "tellus-basic-processes",
  order = "a[natural]-a[basic]-b[compost]",
  inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
  pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
  drop_sound = space_age_item_sounds.agriculture_inventory_move,
  stack_size = 100,
  weight = 1 * kg,
  spoil_ticks = 120 * minute,
  spoil_result = "spoilage",
  default_import_location = "tellus",
  },
  {
    type = "item",
    name = "planetaris-mushell-seed",
    icon = "__planetaris-tellus__/graphics/icons/mushell-seed.png",
    pictures =
    {
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/mushell-seed-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/mushell-seed-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/mushell-seed-3.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/mushell-seed-4.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "tellus-basic-processes",
    order = "a[natural]-a-a[seed]",
    plant_result = "mushell-plant",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 10,
    default_import_location = "tellus",
    weight = 10 * kg,
    fuel_category = "chemical",
    fuel_value = "4MJ"
  },
  
-- Magnesium

  {
    type = "item",
    name = "planetaris-magnesium-bacteria",
    icon = "__planetaris-tellus__/graphics/icons/magnesium-bacteria.png",
    pictures =
    {
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/magnesium-bacteria.png",   scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/magnesium-bacteria-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/magnesium-bacteria-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/magnesium-bacteria-3.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "tellus-basic-processes",
    order = "a[natural]-b[magnesium]-a[magnesium-bacteria]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "tellus",
    weight = 1 * kg,
    spoil_ticks = 5 * minute,
    spoil_result = "planetaris-magnesium-dust"
  },
  {
    type = "item",
    name = "planetaris-magnesium-dust",
    icon = "__planetaris-tellus__/graphics/icons/magnesium-dust.png",
    subgroup = "tellus-basic-processes",
    order = "a[natural]-b[magnesium]-b[magnesium-dust]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    weight = 1 * kg,
    default_import_location = "tellus",
  },
  {
    type = "item",
    name = "planetaris-magnesium-sheet",
    icon = "__planetaris-tellus__/graphics/icons/magnesium-sheet.png",
    subgroup = "tellus-basic-processes",
    order = "a[natural]-b[magnesium]-c[magnesium-sheet]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 100,
    weight = 4 * kg,
    default_import_location = "tellus",
  },

-- Chlorophyll

  {
    type = "item",
    name = "planetaris-chloroplast-seed",
    icon = "__planetaris-tellus__/graphics/icons/chloroplast-seed.png",
    pictures =
    {
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/chloroplast-seed-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/chloroplast-seed-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/chloroplast-seed-3.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/chloroplast-seed-4.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "tellus-basic-processes",
    order = "a[natural]-c[Chlorophyll]-a[seed]",
    plant_result = "chloroplast",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 10,
    default_import_location = "tellus",
    weight = 10 * kg,
    fuel_category = "chemical",
    fuel_value = "4MJ"
  },
  {
    type = "capsule",
    name = "planetaris-chloroplast-fruit",
    icon = "__planetaris-tellus__/graphics/icons/chloroplast-fruit.png",
    pictures =
    {
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/chloroplast-fruit.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/chloroplast-fruit-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/chloroplast-fruit-2.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "tellus-basic-processes",
    order = "a[natural]-c[Chlorophyll]-b-a[fruit]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    fuel_category = "chemical",
    fuel_value = "2MJ",
    stack_size = 50,
    default_import_location = "tellus",
    weight = 1 * kg,
    spoil_ticks = 60 * minute,
    spoil_result = "spoilage",
    capsule_action = item_effects.yumako_regen
  },
  {
    type = "capsule",
    name = "planetaris-chloroplast-mash",
    icon = "__planetaris-tellus__/graphics/icons/chloroplast-mash.png",
    subgroup = "tellus-basic-processes",
    order = "a[natural]-c[Chlorophyll]-c[mash]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    fuel_category = "chemical",
    fuel_value = "1MJ",
    stack_size = 100,
    default_import_location = "tellus",
    spoil_ticks = 3 * minute,
    spoil_result = "spoilage",
    weight = 0.5 * kg,
    capsule_action = item_effects.yumako_regen
  },

-- Mycelia
  {
    type = "item",
    name = "planetaris-myceliae-seed",
    icon = "__planetaris-tellus__/graphics/icons/myceliae-seed.png",
    pictures =
    {
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/myceliae-seed-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/myceliae-seed-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/myceliae-seed-3.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/myceliae-seed-4.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "tellus-basic-processes",
    order = "a[natural]-d[funji]-a[mushroom-seed]",
    plant_result = "myceliae",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 10,
    default_import_location = "tellus",
    weight = 10 * kg,
    fuel_category = "chemical",
    fuel_value = "4MJ"
  },
  {
    type = "item",
    name = "planetaris-mushroom-cap",
    icon = "__planetaris-tellus__/graphics/icons/mushroom-cap.png",
    pictures =
    {
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/mushroom-cap-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/mushroom-cap-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/mushroom-cap-3.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/mushroom-cap.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "tellus-basic-processes",
    order = "a[natural]-d[funji]-b-a[mushroom-cap]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    fuel_category = "chemical",
    fuel_value = "2MJ",
    stack_size = 50,
    default_import_location = "tellus",
    weight = 1 * kg,
    spoil_ticks = 60 * minute,
    spoil_result = "spoilage"
  },
  {
    type = "item",
    name = "planetaris-mycelia",
    icon = "__planetaris-tellus__/graphics/icons/mycelia.png",
    subgroup = "tellus-basic-processes",
    order = "a[natural]-d[funji]-c[mycelia]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    fuel_category = "chemical",
    fuel_value = "2MJ",
    stack_size = 50,
    default_import_location = "tellus",
    weight = 1 * kg,
    spoil_ticks = 15 * minute,
    spoil_result = "spoilage"
  },
  {
    type = "item",
    name = "planetaris-mycelia-composite",
    icon = "__planetaris-tellus__/graphics/icons/mycelia-composite.png",
    subgroup = "tellus-basic-processes",
    order = "a[natural]-d[funji]-c[mycelia]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 100,
    weight = 4 * kg,
    default_import_location = "tellus",
  },
-- ROOTS
  {
    type = "item",
    name = "planetaris-root",
    localised_name = {"entity-name.planetaris-root"},
    localised_description = {"entity-description.planetaris-root"},
    icon = "__planetaris-tellus__/graphics/icons/root.png",
    subgroup = "root-distribution",
    order = "a",
    place_result = "planetaris-root",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    fuel_category = "chemical",
    fuel_value = "2MJ",
    stack_size = 100,
    default_import_location = "tellus",
    weight = 1 * kg,
  },
    {
    type = "item",
    name = "planetaris-root-pump",
    localised_name = {"entity-name.planetaris-root-pump"},
    localised_description = {"entity-description.planetaris-root-pump"},
    icon = "__planetaris-tellus__/graphics/icons/root-pump.png",
    subgroup = "root-distribution",
    order = "b",
    place_result = "planetaris-root-pump",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "tellus",
    weight = 4 * kg,
  },
    {
    type = "item",
    name = "planetaris-root-storage-tank",
    localised_name = {"entity-name.planetaris-root-storage-tank"},
    localised_description = {"entity-description.planetaris-root-storage-tank"},
    icon = "__planetaris-tellus__/graphics/icons/root-storage-tank.png",
    subgroup = "root-distribution",
    order = "c",
    place_result = "planetaris-root-storage-tank",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "tellus",
    weight = 10 * kg,
  },
  {
    type = "item",
    name = "planetaris-root-filler",
    localised_name = {"entity-name.planetaris-root-filler"},
    localised_description = {"entity-description.planetaris-root-filler"},
    icon = "__planetaris-tellus__/graphics/icons/root-filler.png",
    subgroup = "root-distribution",
    order = "d",
    place_result = "planetaris-root-filler",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "tellus",
    weight = 10 * kg,
  },
  {
    type = "item",
    name = "planetaris-root-to-ground",
    localised_name = {"entity-name.planetaris-root-to-ground"},
    localised_description = {"entity-description.planetaris-root-to-ground"},
    icon = "__planetaris-tellus__/graphics/icons/root-to-ground.png",
    subgroup = "root-distribution",
    order = "a-b",
    place_result = "planetaris-root-to-ground",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "tellus",
    weight = 2 * kg,
  },

-- Bio Machines

  {
    type = "item",
    name = "planetaris-bioassembler-seed",
    icon = "__planetaris-tellus__/graphics/icons/bioassembler-seed.png",
    icon_size = 64,
    subgroup = "tellus-production",
    order = "a-a",
    place_result = "planetaris-bioassembler-plant-ghost",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "tellus",
    weight = 20 * kg,
  },

  {
    type = "item",
    name = "planetaris-incubator",
    localised_name = {"entity-name.planetaris-incubator"},
    localised_description = {"entity-description.planetaris-incubator"},
    icon = "__planetaris-tellus__/graphics/icons/incubator.png",
    subgroup = "tellus-production",
    order = "a-b",
    place_result = "planetaris-incubator",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "tellus",
    weight = 20 * kg,
  },

-- Cleaning

  {
    type = "item",
    name = "planetaris-air-purifier",
    localised_name = {"entity-name.planetaris-air-purifier"},
    localised_description = {"entity-description.planetaris-air-purifier"},
    icon = "__planetaris-tellus__/graphics/icons/air-purifier.png",
    subgroup = "tellus-production",
    order = "a-c",
    place_result = "planetaris-air-purifier",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "tellus",
    weight = 20 * kg,
  },

-- Eggs

{
    type = "item",
    name = "planetaris-wasp-egg",
    icon = "__planetaris-tellus__/graphics/icons/wasp-egg.png",
    pictures =
    {
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/wasp-egg.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/wasp-egg-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/wasp-egg-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/wasp-egg-3.png", scale = 0.5, mipmap_count = 4 },
    },
    fuel_category = "chemical",
    fuel_value = "5MJ",
    subgroup = "agriculture-products",
    order = "c[eggs]-c[wasp-egg]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 20,
    default_import_location = "tellus",
    weight = 5 * kg,
    spoil_ticks = 15 * minute,
    spoil_to_trigger_result =
    {
      items_per_trigger = 1,
      trigger =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            {
              type = "create-entity",
              entity_name = "big-wasp",
              affects_target = true,
              show_in_tooltip = true,
              as_enemy = true,
              find_non_colliding_position = true,
              abort_if_over_space = true,
              offset_deviation = {{-5, -5}, {5, 5}},
              non_colliding_fail_result =
              {
                type = "direct",
                action_delivery =
                {
                  type = "instant",
                  source_effects =
                  {
                    {
                      type = "create-entity",
                      entity_name = "big-wasp",
                      affects_target = true,
                      show_in_tooltip = false,
                      as_enemy = true,
                      offset_deviation = {{-1, -1}, {1, 1}},
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  },

  -- PARASITE

  {
    type = "item",
    name = "planetaris-tellurian-parasite",
    icon = "__planetaris-tellus__/graphics/icons/tellus-parasite.png",
    subgroup = "tellus-pathological-processes",
    order = "a[tellus]-d[parasite]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 20,
    default_import_location = "tellus",
    weight = 5 * kg,
    spoil_ticks = 15 * minute,
    spoil_to_trigger_result =
    {
      items_per_trigger = 1,
      trigger =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            {
              type = "create-entity",
              entity_name = "behemoth-wasp",
              repeat_count = 2,
              affects_target = true,
              show_in_tooltip = true,
              as_enemy = true,
              find_non_colliding_position = true,
              abort_if_over_space = true,
              offset_deviation = {{-5, -5}, {5, 5}},
              non_colliding_fail_result =
              {
                type = "direct",
                action_delivery =
                {
                  type = "instant",
                  source_effects =
                  {
                    {
                      type = "create-entity",
                      entity_name = "behemoth-wasp",
                      affects_target = true,
                      show_in_tooltip = false,
                      as_enemy = true,
                      offset_deviation = {{-1, -1}, {1, 1}},
                    }
                  }
                }
              }
            },
          }
        }
      }
    }
  },
  {
    type = "item",
    name = "planetaris-nauvian-parasite",
    icon = "__planetaris-tellus__/graphics/icons/nauvian-parasite.png",
    subgroup = "tellus-pathological-processes",
    order = "b[nauvis]-a[parasite]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 20,
    default_import_location = "tellus",
    weight = 5 * kg,
    spoil_ticks = 15 * minute,
    spoil_to_trigger_result =
    {
      items_per_trigger = 1,
      trigger =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            {
              type = "create-entity",
              entity_name = "behemoth-biter",
              repeat_count = 2,
              affects_target = true,
              show_in_tooltip = true,
              as_enemy = true,
              find_non_colliding_position = true,
              abort_if_over_space = true,
              offset_deviation = {{-5, -5}, {5, 5}},
              non_colliding_fail_result =
              {
                type = "direct",
                action_delivery =
                {
                  type = "instant",
                  source_effects =
                  {
                    {
                      type = "create-entity",
                      entity_name = "behemoth-biter",
                      affects_target = true,
                      show_in_tooltip = false,
                      as_enemy = true,
                      offset_deviation = {{-1, -1}, {1, 1}},
                    }
                  }
                }
              }
            },
          }
        }
      }
    }
  },
  {
    type = "item",
    name = "planetaris-glebian-parasite",
    icon = "__planetaris-tellus__/graphics/icons/glebian-parasite.png",
    subgroup = "tellus-pathological-processes",
    order = "c[gleba]-a[parasite]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 20,
    default_import_location = "tellus",
    weight = 5 * kg,
    spoil_ticks = 15 * minute,
    spoil_to_trigger_result =
    {
      items_per_trigger = 1,
      trigger =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            {
              type = "create-entity",
              entity_name = "big-strafer-pentapod",
              repeat_count = 2,
              affects_target = true,
              show_in_tooltip = true,
              as_enemy = true,
              find_non_colliding_position = true,
              abort_if_over_space = true,
              offset_deviation = {{-5, -5}, {5, 5}},
              non_colliding_fail_result =
              {
                type = "direct",
                action_delivery =
                {
                  type = "instant",
                  source_effects =
                  {
                    {
                      type = "create-entity",
                      entity_name = "big-strafer-pentapod",
                      affects_target = true,
                      show_in_tooltip = false,
                      as_enemy = true,
                      offset_deviation = {{-1, -1}, {1, 1}},
                    }
                  }
                }
              }
            },
          }
        }
      }
    }
  },

  {
    type = "item",
    name = "planetaris-parasite-nest",
    icon = "__planetaris-tellus__/graphics/icons/parasite-nest.png",
    subgroup = "tellus-pathological-processes",
    order = "d[nest]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 20,
    default_import_location = "tellus",
    weight = 10 * kg,
    spoil_ticks = 10 * minute,
    spoil_to_trigger_result =
    {
      items_per_trigger = 1,
      trigger =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            {
              type = "create-entity",
              entity_name = "behemoth-wasp",
              repeat_count = 1,
              affects_target = true,
              show_in_tooltip = true,
              as_enemy = true,
              find_non_colliding_position = true,
              abort_if_over_space = true,
              offset_deviation = {{-5, -5}, {5, 5}},
              non_colliding_fail_result =
              {
                type = "direct",
                action_delivery =
                {
                  type = "instant",
                  source_effects =
                  {
                    {
                      type = "create-entity",
                      entity_name = "behemoth-wasp",
                      affects_target = true,
                      show_in_tooltip = false,
                      as_enemy = true,
                      offset_deviation = {{-1, -1}, {1, 1}},
                    }
                  }
                }
              }
            },
            {
              type = "create-entity",
              entity_name = "behemoth-biter",
              repeat_count = 1,
              affects_target = true,
              show_in_tooltip = true,
              as_enemy = true,
              find_non_colliding_position = true,
              abort_if_over_space = true,
              offset_deviation = {{-5, -5}, {5, 5}},
              non_colliding_fail_result =
              {
                type = "direct",
                action_delivery =
                {
                  type = "instant",
                  source_effects =
                  {
                    {
                      type = "create-entity",
                      entity_name = "behemoth-biter",
                      affects_target = true,
                      show_in_tooltip = false,
                      as_enemy = true,
                      offset_deviation = {{-1, -1}, {1, 1}},
                    }
                  }
                }
              }
            },
            {
              type = "create-entity",
              entity_name = "big-strafer-pentapod",
              repeat_count = 1,
              affects_target = true,
              show_in_tooltip = true,
              as_enemy = true,
              find_non_colliding_position = true,
              abort_if_over_space = true,
              offset_deviation = {{-5, -5}, {5, 5}},
              non_colliding_fail_result =
              {
                type = "direct",
                action_delivery =
                {
                  type = "instant",
                  source_effects =
                  {
                    {
                      type = "create-entity",
                      entity_name = "big-strafer-pentapod",
                      affects_target = true,
                      show_in_tooltip = false,
                      as_enemy = true,
                      offset_deviation = {{-1, -1}, {1, 1}},
                    }
                  }
                }
              }
            },
          }
        }
      }
    }
  },

  -- QUARANTINED

  {
    type = "item",
    name = "planetaris-quarantined-nauvian-parasite",
    icon = "__planetaris-tellus__/graphics/icons/quarantined-nauvian-parasite.png",
    subgroup = "tellus-pathological-processes",
    order = "b[nauvis]-a[parasite]-b",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 5,
    weight = 200 * kg,
    default_import_location = "tellus",
    spoil_ticks = 60 * minute,
    spoil_result = "planetaris-nauvian-parasite"
  },
  {
    type = "item",
    name = "planetaris-quarantined-glebian-parasite",
    icon = "__planetaris-tellus__/graphics/icons/quarantined-glebian-parasite.png",
    subgroup = "tellus-pathological-processes",
    order = "c[gleba]-a[parasite]-b",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 5,
    weight = 200 * kg,
    default_import_location = "tellus",
    spoil_ticks = 60 * minute,
    spoil_result = "planetaris-glebian-parasite"
  },

  -- FULGORA

    {
    type = "item",
    name = "planetaris-holmiumnite-pod",
    icon = "__planetaris-tellus__/graphics/icons/holmiumnite-pod.png",
    pictures =
    {
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/holmiumnite-pod.png",   scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/holmiumnite-pod-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/holmiumnite-pod-3.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "tellus-other-planet-agriculture",
    order = "b[fulgora]-a[seed]",
    plant_result = "holmiumnite",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 10,
    default_import_location = "tellus",
    weight = 10 * kg,
    fuel_category = "chemical",
    fuel_value = "4MJ"
  },
    {
    type = "item",
    name = "planetaris-holmiumnite-bulb",
    icon = "__planetaris-tellus__/graphics/icons/holmiumnite-bulb.png",
    subgroup = "tellus-other-planet-agriculture",
    order = "b[fulgora]-b[bulb]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 10,
    default_import_location = "tellus",
    weight = 10 * kg,
    spoil_ticks = 15 * minute,
    spoil_result = "stone"
  },
  {
    type = "item",
    name = "planetaris-fulgoran-bacteria",
    icon = "__planetaris-tellus__/graphics/icons/fulgoran-bacteria.png",
    pictures =
    {
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/fulgoran-bacteria.png",   scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/fulgoran-bacteria-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/fulgoran-bacteria-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/fulgoran-bacteria-3.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "tellus-other-planet-agriculture",
    order = "b[fulgora]-c[bacteria]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "tellus",
    weight = 1 * kg,
    spoil_ticks = 1 * minute,
    spoil_result = "stone"
  },

    -- Vulcanus

  {
    type = "item",
    name = "planetaris-carbolyte-pod",
    icon = "__planetaris-tellus__/graphics/icons/carbolyte-pod.png",
    subgroup = "tellus-other-planet-agriculture",
    order = "a[vulcanus]-a[seed]",
    plant_result = "carbolyte",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 10,
    default_import_location = "tellus",
    weight = 10 * kg,
    fuel_category = "chemical",
    fuel_value = "1MJ"
  },
  {
    type = "item",
    name = "planetaris-carbolyte-crust",
    icon = "__planetaris-tellus__/graphics/icons/carbolyte-crust.png",
    pictures =
    {
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/carbolyte-crust.png",   scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/carbolyte-crust-4.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/carbolyte-crust-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/carbolyte-crust-3.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "tellus-other-planet-agriculture",
    order = "a[vulcanus]-b[crust]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 10,
    default_import_location = "tellus",
    weight = 10 * kg,
    spoil_ticks = 15 * minute,
    spoil_result = "stone"
  },
  {
    type = "item",
    name = "planetaris-carbolyte-bacteria",
    icon = "__planetaris-tellus__/graphics/icons/carbolyte-bacteria.png",
    pictures =
    {
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/carbolyte-bacteria.png",   scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/carbolyte-bacteria-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/carbolyte-bacteria-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/carbolyte-bacteria-3.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "tellus-other-planet-agriculture",
    order = "a[vulcanus]-c[bacteria]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "tellus",
    weight = 1 * kg,
    spoil_ticks = 1 * minute,
    spoil_result = "sulfur"
  },

  -- SCIENCE

  {
    type = "tool",
    name = "planetaris-bioengineering-science-pack",
    localised_description = {"item-description.planetaris-bioengineering-science-pack"},
    icon = "__planetaris-tellus__/graphics/icons/bioengineering-science-pack.png",
    subgroup = "science-pack",
    color_hint = { text = "G" },
    order = "i-p-a",
    inventory_move_sound = base_item_sounds.science_inventory_move,
    pick_sound = base_item_sounds.science_inventory_pickup,
    drop_sound = base_item_sounds.science_inventory_move,
    stack_size = 200,
    default_import_location = "tellus",
    weight = 1*kg,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    spoil_ticks = 1 * hour,
    spoil_result = "spoilage",
    random_tint_color = item_tints.bluish_science
  },
    {
    type = "tool",
    name = "planetaris-pathological-science-pack",
    localised_description = {"item-description.planetaris-pathological-science-pack"},
    icon = "__planetaris-tellus__/graphics/icons/pathological-science-pack.png",
    subgroup = "science-pack",
    color_hint = { text = "G" },
    order = "i-p-b",
    inventory_move_sound = base_item_sounds.science_inventory_move,
    pick_sound = base_item_sounds.science_inventory_pickup,
    drop_sound = base_item_sounds.science_inventory_move,
    stack_size = 200,
    default_import_location = "tellus",
    weight = 1*kg,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    spoil_ticks = 30 * minute,
    spoil_to_trigger_result =
    {
      items_per_trigger = 1,
      trigger =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            {
              type = "create-entity",
              entity_name = "behemoth-wasp",
              repeat_count = 3,
              affects_target = true,
              show_in_tooltip = true,
              as_enemy = true,
              find_non_colliding_position = true,
              abort_if_over_space = true,
              offset_deviation = {{-5, -5}, {5, 5}},
              non_colliding_fail_result =
              {
                type = "direct",
                action_delivery =
                {
                  type = "instant",
                  source_effects =
                  {
                    {
                      type = "create-entity",
                      entity_name = "behemoth-wasp",
                      affects_target = true,
                      show_in_tooltip = false,
                      as_enemy = true,
                      offset_deviation = {{-1, -1}, {1, 1}},
                    }
                  }
                }
              }
            },
          }
        }
      }
    }
  },
  --------------
  {
    type = "item",
    name = "planetaris-pesticide",
    icon = "__planetaris-tellus__/graphics/icons/pesticide.png",
    subgroup = "tellus-advanced-processes",
    order = "a[telllus]-b-a[pesticide]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 100,
    default_import_location = "tellus",
    weight = 2 * kg,
  },
  {
    type = "item",
    name = "planetaris-polimer-skin",
    icon = "__planetaris-tellus__/graphics/icons/polimer-skin.png",
    subgroup = "tellus-advanced-processes",
    order = "a[telllus]-c[artificial]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 100,
    default_import_location = "tellus",
    weight = 2 * kg,
  },
  {
    type = "item",
    name = "planetaris-artificial-heart",
    icon = "__planetaris-tellus__/graphics/icons/artificial-heart.png",
    subgroup = "tellus-advanced-processes",
    order = "a[telllus]-c[artificial]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 100,
    default_import_location = "tellus",
    weight = 4 * kg,
  },

  -- TILES

  {
    type = "item",
    name = "planetaris-artificial-chlorophyll-soil",
    localised_name = {"tile-name.planetaris-artificial-chlorophyll-soil"},
    localised_description = {"tile-description.planetaris-artificial-chlorophyll-soil"},
    icon = "__planetaris-tellus__/graphics/icons/artificial-chlorophyll-soil.png",
    subgroup = "terrain",
    order = "c[landfill]-f-a[artificial-chlorophyll-soil]",
    inventory_move_sound = base_item_sounds.landfill_inventory_move,
    pick_sound = base_item_sounds.landfill_inventory_pickup,
    drop_sound = base_item_sounds.landfill_inventory_move,
    stack_size = 100,
    default_import_location = "tellus",
    place_as_tile =
    {
      result = "artificial-chlorophyll-soil",
      condition_size = 1,
      condition = {layers={ground_tile=true}},
      tile_condition = {"wetland-chlorophyll"}
    }
  },

  {
    type = "item",
    name = "planetaris-overgrowth-chlorophyll-soil",
    icon = "__planetaris-tellus__/graphics/icons/overgrowth-chlorophyll-soil.png",
    localised_name = {"tile-name.planetaris-overgrowth-chlorophyll-soil"},
    localised_description = {"tile-description.planetaris-overgrowth-chlorophyll-soil"},
    subgroup = "terrain",
    order = "c[landfill]-f-b[overgrowth-chlorophyll-soil]",
    inventory_move_sound = base_item_sounds.landfill_inventory_move,
    pick_sound = base_item_sounds.landfill_inventory_pickup,
    drop_sound = base_item_sounds.landfill_inventory_move,
    stack_size = 100,
    default_import_location = "tellus",
    place_as_tile =
    {
      result = "overgrowth-chlorophyll-soil",
      condition_size = 1,
      condition = {layers={}},
      tile_condition = {
        "wetland-light-cyan-slime",
        "wetland-cyan-slime",
        "wetland-chlorophyll",
        "lowland-cyan-blubber",
        "lowland-cyan-blubber-2",
        "lowland-cyan-blubber-3",
        "lowland-blue-blubber",
        "lowland-pale-cyan"
      }
    }
  },

  {
    type = "item",
    name = "planetaris-artificial-mycelia-soil",
    localised_name = {"tile-name.planetaris-artificial-mycelia-soil"},
    localised_description = {"tile-description.planetaris-artificial-mycelia-soil"},
    icon = "__planetaris-tellus__/graphics/icons/artificial-mycelia-soil.png",
    subgroup = "terrain",
    order = "c[landfill]-f-c[artificial-mycelia-soil]",
    inventory_move_sound = base_item_sounds.landfill_inventory_move,
    pick_sound = base_item_sounds.landfill_inventory_pickup,
    drop_sound = base_item_sounds.landfill_inventory_move,
    stack_size = 100,
    default_import_location = "tellus",
    place_as_tile =
    {
      result = "artificial-mycelia-soil",
      condition_size = 1,
      condition = {layers={ground_tile=true}},
      tile_condition = {"wetland-mycelia"}
    }
  },

  {
    type = "item",
    name = "planetaris-overgrowth-mycelia-soil",
    localised_name = {"tile-name.planetaris-overgrowth-mycelia-soil"},
    localised_description = {"tile-description.planetaris-overgrowth-mycelia-soil"},
    icon = "__planetaris-tellus__/graphics/icons/overgrowth-mycelia-soil.png",
    subgroup = "terrain",
    order = "c[landfill]-f-d[artificial-mycelia-soil]",
    inventory_move_sound = base_item_sounds.landfill_inventory_move,
    pick_sound = base_item_sounds.landfill_inventory_pickup,
    drop_sound = base_item_sounds.landfill_inventory_move,
    stack_size = 100,
    default_import_location = "tellus",
    place_as_tile =
    {
      result = "overgrowth-mycelia-soil",
      condition_size = 1,
      condition = {layers={}},
      tile_condition = {
        "wetland-tellus-green-tentacle",
        "wetland-tellus-light-green-tentacle",
        "wetland-mycelia",
        "lowland-green-vein",
        "lowland-green-vein-2",
        "lowland-green-vein-3",
        "lowland-green-vein-4",
        "lowland-green-vein-dead",
        "lowland-green-infection",
        "lowland-cream-green"
      }
    }
  },

  {
    type = "item",
    name = "planetaris-dust-soil",
    localised_name = {"tile-name.planetaris-dust-soil"},
    localised_description = {"tile-description.planetaris-dust-soil"},
    icon = "__planetaris-tellus__/graphics/icons/dust-soil.png",
    subgroup = "terrain",
    order = "c[landfill]-f-b-b",
    inventory_move_sound = base_item_sounds.landfill_inventory_move,
    pick_sound = base_item_sounds.landfill_inventory_pickup,
    drop_sound = base_item_sounds.landfill_inventory_move,
    stack_size = 100,
    default_import_location = "tellus",
    place_as_tile =
    {
      result = "planetaris-dust-soil",
      condition_size = 1,
      condition = {layers={ground_tile=true}},
      tile_condition = {
        "wetland-tellus-green-tentacle",
        "wetland-tellus-light-green-tentacle",
        "wetland-mycelia",
        "lowland-green-vein",
        "lowland-green-vein-2",
        "lowland-green-vein-3",
        "lowland-green-vein-4",
        "lowland-green-vein-dead",
        "lowland-green-infection",
        "lowland-cream-green",
        "wetland-light-cyan-slime",
        "wetland-cyan-slime",
        "wetland-tellus-brown-slime",
        "wetland-chlorophyll",
        "wetland-tellus-dead-skin",
        "wetland-tellus-light-dead-skin",
        "lowland-cyan-blubber",
        "lowland-cyan-blubber-2",
        "lowland-cyan-blubber-3",
        "lowland-blue-blubber",
        "lowland-pale-cyan",
      }
    }
  },

  {
    type = "item",
    name = "planetaris-volcanic-soil",
    localised_name = {"tile-name.planetaris-volcanic-soil"},
    localised_description = {"tile-description.planetaris-volcanic-soil"},
    icon = "__planetaris-tellus__/graphics/icons/volcanic-soil.png",
    subgroup = "terrain",
    order = "c[landfill]-f-b-a",
    inventory_move_sound = base_item_sounds.landfill_inventory_move,
    pick_sound = base_item_sounds.landfill_inventory_pickup,
    drop_sound = base_item_sounds.landfill_inventory_move,
    stack_size = 100,
    default_import_location = "tellus",
    place_as_tile =
    {
      result = "planetaris-volcanic-soil",
      condition_size = 1,
      condition = {layers={ground_tile=true}},
      tile_condition = {
        "wetland-tellus-green-tentacle",
        "wetland-tellus-light-green-tentacle",
        "wetland-mycelia",
        "lowland-green-vein",
        "lowland-green-vein-2",
        "lowland-green-vein-3",
        "lowland-green-vein-4",
        "lowland-green-vein-dead",
        "lowland-green-infection",
        "lowland-cream-green",
        "wetland-light-cyan-slime",
        "wetland-cyan-slime",
        "wetland-tellus-brown-slime",
        "wetland-chlorophyll",
        "wetland-tellus-dead-skin",
        "wetland-tellus-light-dead-skin",
        "lowland-cyan-blubber",
        "lowland-cyan-blubber-2",
        "lowland-cyan-blubber-3",
        "lowland-blue-blubber",
        "lowland-pale-cyan",
      }
    }
  },

  ----------------------------

    {
    type = "item",
    name = "planetaris-robowasp-port",
    localised_name = {"entity-name.planetaris-robowasp-port"},
    localised_description = {"entity-description.planetaris-robowasp-port"},
    icon = "__planetaris-tellus__/graphics/icons/robowasp-port.png",
    subgroup = "logistic-network",
    order = "c[signal]-a[roboport]-b",
    inventory_move_sound = base_item_sounds.roboport_inventory_move,
    pick_sound = base_item_sounds.roboport_inventory_pickup,
    drop_sound = base_item_sounds.roboport_inventory_move,
    place_result = "planetaris-robowasp-port",
    stack_size = 10,
    weight = 20*kg,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "planetaris-logistic-robowasp",
    localised_name = {"entity-name.planetaris-logistic-robowasp"},
    localised_description = {"entity-description.planetaris-logistic-robowasp"},
    icon = "__planetaris-tellus__/graphics/icons/logistic-robowasp.png",
    subgroup = "logistic-network",
    order = "a[robot]-p-a[logistic-robowasp]",
    inventory_move_sound = base_item_sounds.robotic_inventory_move,
    pick_sound = base_item_sounds.robotic_inventory_pickup,
    drop_sound = base_item_sounds.robotic_inventory_move,
    place_result = "planetaris-logistic-robowasp",
    stack_size = 50,
    weight = 2*kg,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "planetaris-three-long-handed-inserter",
    localised_name = {"entity-name.planetaris-three-long-handed-inserter"},
    localised_description = {"entity-name.planetaris-three-long-handed-inserter"},
    icon = "__planetaris-tellus__/graphics/icons/three-long-handed-inserter.png",
    subgroup = "inserter",
    color_hint = { text = "L" },
    order = "c[long-handed-inserter]-b",
    inventory_move_sound = base_item_sounds.inserter_inventory_move,
    pick_sound = base_item_sounds.inserter_inventory_pickup,
    drop_sound = base_item_sounds.inserter_inventory_move,
    place_result = "planetaris-three-long-handed-inserter",
    stack_size = 50,
    weight = 20*kg
  },
  {
    type = "item",
    name = "planetaris-long-stack-inserter",
    localised_name = {"entity-name.planetaris-long-stack-inserter"},
    localised_description = {"entity-name.planetaris-long-stack-inserter"},
    icon = "__planetaris-tellus__/graphics/icons/long-stack-inserter.png",
    subgroup = "inserter",
    color_hint = { text = "B" },
    order = "f[bulk-inserter]-b",
    inventory_move_sound = base_item_sounds.inserter_inventory_move,
    pick_sound = base_item_sounds.inserter_inventory_pickup,
    drop_sound = base_item_sounds.inserter_inventory_move,
    place_result = "planetaris-long-stack-inserter",
    stack_size = 50,
    weight = 20*kg,
  },
})