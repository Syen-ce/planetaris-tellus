local tile_trigger_effects = require("__space-age__/prototypes/tile/tile-trigger-effects")
local tile_pollution = require("__planetaris-tellus__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local base_sounds = require("__base__/prototypes/entity/sounds")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local tile_lightening = 28

tellus_tile_offset = 65
tellus_lowland_tile_offset = 32

local lava_to_out_of_map_transition = space_age_tiles_util.lava_to_out_of_map_transition
local lava_stone_transitions_between_transitions = space_age_tiles_util.lava_stone_transitions_between_transitions

data:extend({
  {
    type = "item-subgroup",
    name = "tellus-tiles",
    group = "tiles",
    order = "c-c"
  }
})

local function lowland_tile_variations_template_with_transitions_and_puddle_transitions(high_res_picture, options)
  local result = tile_variations_template_with_transitions(high_res_picture, options)

  if result.transition then
    result.transition.auxiliary_effect_mask_layout =
    {
      spritesheet = "__base__/graphics/terrain/masks/transition-1.png",
      scale = 0.5,
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count = 8,
      u_transition_count = 1,
      o_transition_count = 1,
      u_transition_line_length = 1,
      o_transition_line_length = 2,
      inner_corner_x = 0,
      outer_corner_x = 576,
      side_x = 1152,
      u_transition_x = 1728,
      o_transition_x = 2304
    }
    result.transition.effect_map_layout =
    {
      spritesheet =  "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
      scale = 0.5,
      x = 0,
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count         = 8,
      u_transition_count = 1,
      o_transition_count = 1,
      inner_corner_y = 0,
      outer_corner_y = 576,
      side_y = 1152,
      u_transition_y = 1728,
      o_transition_y = 2304,
      inner_corner_tile_height = 2,
      outer_corner_tile_height = 2,
      side_tile_height = 2,
      u_transition_tile_height = 2,
    }
  end

  return result
end

data:extend({
  {
    type = "tile",
    name = "artificial-mycelia-soil",
    order = "d[mycelia]-d[artificial-mycelia-soil]",
    subgroup = "tellus-tiles",
    minable = {mining_time = 0.5, result = "planetaris-artificial-mycelia-soil"},
    mined_sound = base_sounds.deconstruct_bricks(0.8),
    is_foundation = true,
    collision_mask = tile_collision_masks.ground(),
    layer = tellus_tile_offset + 22,
    searchable = true,

    transitions = data.raw["tile"]["landfill"].transitions,
    transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
    trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

    variants = tile_variations_template_with_transitions_and_effect_map(
      "__planetaris-tellus__/graphics/terrain/artificial-mycelia-soil.png",
      "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),

    walking_sound = tile_sounds.walking.semi_wet,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = tile_sounds.driving.wetland,
    build_sound = base_tile_sounds.building.landfill,
    map_color={204, 183, 6},
    scorch_mark_color = {r = 0.329, g = 0.242*2, b = 0.177, a = 1.000}
  },
  {
    type = "tile",
    name = "overgrowth-mycelia-soil",
    order = "d[mycelia]-e[overgrowth-mycelia-soil]",
    subgroup = "tellus-tiles",
    minable = {mining_time = 0.5, result = "planetaris-overgrowth-mycelia-soil"},
    mined_sound = base_sounds.deconstruct_bricks(0.8),
    is_foundation = true,
    collision_mask = tile_collision_masks.ground(),
    layer = tellus_tile_offset + 24,
    searchable = true,

    transitions = data.raw["tile"]["landfill"].transitions,
    transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
    trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

    variants = tile_variations_template_with_transitions_and_effect_map(
      "__planetaris-tellus__/graphics/terrain/overgrowth-mycelia-soil.png",
      "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),

    walking_sound = tile_sounds.walking.semi_wet,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = tile_sounds.driving.wetland,
    build_sound = base_tile_sounds.building.landfill,
    map_color={204, 183, 6},
    scorch_mark_color = {r = 0.329, g = 0.242*2, b = 0.177, a = 1.000}
  },
  {
    type = "tile",
    name = "natural-mycelia-soil",
    order = "d[mycelia]-c[natural-mycelia-soil]",
    subgroup = "tellus-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = "tellus_fertile_solid * 50000 - 40000 - tellus_biome_mask_green * 1000000"},
    layer_group = "ground-natural",
    layer = tellus_tile_offset + 20,
    searchable = true,

    transitions = lava_stone_transitions,
    transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
    trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

    variants = tile_variations_template_with_transitions_and_effect_map(
      "__planetaris-tellus__/graphics/terrain/natural-mycelia-soil.png",
      "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),

    walking_sound = tile_sounds.walking.semi_wet,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    build_sound = base_tile_sounds.building.landfill,
    map_color={185, 166, 5},
    scorch_mark_color = {r = 0.329, g = 0.242*2, b = 0.177, a = 1.000}
  },
    {
    type = "tile",
    name = "artificial-chlorophyll-soil",
    order = "d[mycelia]-d[artificial-chlorophyll-soil]",
    subgroup = "tellus-tiles",
    minable = {mining_time = 0.5, result = "planetaris-artificial-chlorophyll-soil"},
    mined_sound = base_sounds.deconstruct_bricks(0.8),
    is_foundation = true,
    collision_mask = tile_collision_masks.ground(),
    layer = tellus_tile_offset + 22,
    searchable = true,

    transitions = data.raw["tile"]["landfill"].transitions,
    transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
    trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

    variants = tile_variations_template_with_transitions_and_effect_map(
      "__planetaris-tellus__/graphics/terrain/artificial-chlorophyll-soil.png",
      "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),

    walking_sound = tile_sounds.walking.semi_wet,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = tile_sounds.driving.wetland,
    build_sound = base_tile_sounds.building.landfill,
    map_color={85, 204, 6},
    scorch_mark_color = {r = 0.329, g = 0.242*2, b = 0.177, a = 1.000}
  },
  {
    type = "tile",
    name = "overgrowth-chlorophyll-soil",
    order = "d[mycelia]-e[overgrowth-chlorophyll-soil]",
    subgroup = "tellus-tiles",
    minable = {mining_time = 0.5, result = "planetaris-overgrowth-chlorophyll-soil"},
    mined_sound = base_sounds.deconstruct_bricks(0.8),
    is_foundation = true,
    collision_mask = tile_collision_masks.ground(),
    layer = tellus_tile_offset + 24,
    searchable = true,

    transitions = data.raw["tile"]["landfill"].transitions,
    transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
    trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

    variants = tile_variations_template_with_transitions_and_effect_map(
      "__planetaris-tellus__/graphics/terrain/overgrowth-chlorophyll-soil.png",
      "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),

    walking_sound = tile_sounds.walking.semi_wet,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = tile_sounds.driving.wetland,
    build_sound = base_tile_sounds.building.landfill,
    map_color={56, 204, 6},
    scorch_mark_color = {r = 0.204, g = 0.569, b = 0.569, a = 1.000}
  },
  {
    type = "tile",
    name = "natural-chlorophyll-soil",
    order = "d[mycelia]-c[natural-chlorophyll-soil]",
    subgroup = "tellus-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = "gleba_fertile_solid * 50000 - 40000 - gleba_biome_mask_red * 1000000"},
    layer_group = "ground-natural",
    layer = tellus_tile_offset + 20,
    searchable = true,

    transitions = lava_stone_transitions,
    transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
    trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

    variants = tile_variations_template_with_transitions_and_effect_map(
      "__planetaris-tellus__/graphics/terrain/natural-chlorophyll-soil.png",
      "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),

    walking_sound = tile_sounds.walking.semi_wet,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    build_sound = base_tile_sounds.building.landfill,
    map_color={80, 185, 5},
    scorch_mark_color = {r = 0.329, g = 0.242*2, b = 0.177, a = 1.000}
  },

  -------------
  ---
    {
    type = "tile",
    name = "planetaris-dust-soil",
    order = "d[mycelia]-g",
    subgroup = "tellus-tiles",
    minable = {mining_time = 0.5, result = "planetaris-dust-soil"},
    mined_sound = base_sounds.deconstruct_bricks(0.8),
    is_foundation = true,
    collision_mask = tile_collision_masks.ground(),
    layer = tellus_tile_offset + 23,
    decorative_removal_probability = 100,
    searchable = true,

    transitions = data.raw["tile"]["landfill"].transitions,
    transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
    trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

    variants = tile_variations_template_with_transitions_and_effect_map(
      "__planetaris-tellus__/graphics/terrain/dust-soil.png",
      "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),

    walking_sound = tile_sounds.walking.semi_wet,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = tile_sounds.driving.wetland,
    build_sound = base_tile_sounds.building.landfill,
    map_color={204, 183, 6},
    scorch_mark_color = {r = 0.329, g = 0.242*2, b = 0.177, a = 1.000}
  },

  {
    type = "tile",
    name = "planetaris-volcanic-soil",
    order = "d[mycelia]-g",
    subgroup = "tellus-tiles",
    minable = {mining_time = 0.5, result = "planetaris-volcanic-soil"},
    mined_sound = base_sounds.deconstruct_bricks(0.8),
    is_foundation = true,
    collision_mask = tile_collision_masks.ground(),
    layer = tellus_tile_offset + 24,
    decorative_removal_probability = 100,
    searchable = true,

    transitions = data.raw["tile"]["landfill"].transitions,
    transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
    trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

    variants = tile_variations_template_with_transitions_and_effect_map(
      "__planetaris-tellus__/graphics/terrain/volcanic-soil.png",
      "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),

    walking_sound = tile_sounds.walking.semi_wet,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = tile_sounds.driving.wetland,
    build_sound = base_tile_sounds.building.landfill,
    map_color={204, 183, 6},
    scorch_mark_color = {r = 0.329, g = 0.242*2, b = 0.177, a = 1.000}
  },
})

data:extend({
  ---- LAND
    ---- Lowland
      ----------- Olive Blubber
      {
        type = "tile",
        name = "lowland-cyan-blubber",
        order = "c-z[tellus-land-tiles]-a[lowland-cyan-blubber]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "water-overlay",
        layer = tellus_lowland_tile_offset+4,
        lowland_fog = true,
        effect = "wetland-tellus-light-green-puddle",
        effect_is_opaque = false,
        effect_color = {50,66,66},
        effect_color_secondary = {14, 80, 69},
        -- sprite_usage_surface = "tellus",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__planetaris-tellus__/graphics/terrain/tellus/lowland-cyan-blubber.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0, 0.4, 0.005, 0, 1) + 0.1 * gleba_select(gleba_temperature_normalised, 0.3, 0.8, 0.005, 0, 1)"},
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = tile_sounds.walking.semi_wet,
        landing_steps_sound = tile_sounds.landing.semi_wet,
        map_color={11, 82, 70},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.tellus_water,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "lowland-cyan-blubber-2", -- weird
        order = "c-z[tellus-land-tiles]-a[lowland-cyan-blubber]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "water-overlay",
        layer = tellus_lowland_tile_offset+3,
        lowland_fog = true,
        effect = "wetland-tellus-light-green-puddle",
        effect_is_opaque = false,
        effect_color = {44, 66, 64},
        effect_color_secondary = {14, 80, 69},
        -- sprite_usage_surface = "tellus",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__planetaris-tellus__/graphics/terrain/tellus/lowland-cyan-blubber-2.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0, 0.2, 0.005, 0, 1) + 0.1 * gleba_select(gleba_temperature_normalised, 0, 0.4, 0.005, 0, 1)"},
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = tile_sounds.walking.semi_wet,
        landing_steps_sound = tile_sounds.landing.semi_wet,
        map_color={11, 82, 69},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.tellus_water,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "lowland-cyan-blubber-3", -- bright
        order = "c-z[tellus-land-tiles]-a[lowland-cyan-blubber]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "water-overlay",
        layer = tellus_lowland_tile_offset+8,
        lowland_fog = true,
        effect = "wetland-tellus-light-green-puddle",
        effect_is_opaque = false,
        effect_color = {50, 69, 66},
        effect_color_secondary = {14, 80, 68},
        -- sprite_usage_surface = "tellus",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__planetaris-tellus__/graphics/terrain/tellus/lowland-cyan-blubber-3.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0, 0.4, 0.005, 0, 1) + 0.1 * gleba_select(gleba_temperature_normalised, 0.8, 1, 0.005, 0, 1)"},
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = tile_sounds.walking.semi_wet,
        landing_steps_sound = tile_sounds.landing.semi_wet,
        map_color={11, 82, 70},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.tellus_water,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "lowland-blue-blubber",
        order = "c-z[tellus-land-tiles]-a[lowland-blue-blubber]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "water-overlay",
        layer = tellus_lowland_tile_offset+1,
        lowland_fog = true,
        effect = "wetland-tellus-light-green-puddle",
        effect_is_opaque = false,
        effect_color = {50, 61, 66},
        effect_color_secondary = {49, 80, 14},
        -- sprite_usage_surface = "tellus",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__planetaris-tellus__/graphics/terrain/tellus/lowland-blue-blubber.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0, 0.4, 0.005, 0, 1) + 0.1 * (gleba_plants_noise_b - 0.8)"},
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = tile_sounds.walking.semi_wet,
        landing_steps_sound = tile_sounds.landing.semi_wet,
        map_color={66, 82, 11},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.tellus_water,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "lowland-pale-cyan",
        order = "c-z[tellus-land-tiles]-a[lowland-cyan-blubber]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "water-overlay",
        layer = tellus_lowland_tile_offset+2,
        lowland_fog = true,
        effect = "wetland-tellus-light-green-puddle",
        effect_is_opaque = false,
        effect_color = {50,66,66},
        effect_color_secondary = {14, 73, 80},
        -- sprite_usage_surface = "tellus",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__planetaris-tellus__/graphics/terrain/tellus/lowland-pale-cyan.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0.2, 0.4, 0.005, 0, 1) + 0.1 * gleba_select(gleba_temperature_normalised, 0, 0.3, 0.005, 0, 1)"},
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = tile_sounds.walking.semi_wet,
        landing_steps_sound = tile_sounds.landing.semi_wet,
        map_color={14, 97, 94},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.tellus_water,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      ----------- Cauliflower
      {
        type = "tile",
        name = "lowland-infected-mold-2",
        order = "c-z[tellus-land-tiles]-a[lowland-infected-mold]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0.3, 0.45, 0.005, 0, 1) + 0.1 * gleba_select(gleba_temperature_normalised, -0.2, 1, 0.005, 0, 1)"},
        layer_group = "water-overlay",
        layer = tellus_lowland_tile_offset+7,
        lowland_fog = true,
        effect = "wetland-tellus-light-green-puddle",
        effect_is_opaque = false,
        effect_color = {70, 74, 79},
        effect_color_secondary = {70, 72, 79},
        -- sprite_usage_surface = "tellus",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__planetaris-tellus__/graphics/terrain/tellus/infected-mold-2.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        transitions = {lava_to_out_of_map_transition},
        transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
        walking_sound = tile_sounds.walking.semi_wet,
        landing_steps_sound = tile_sounds.landing.semi_wet,
        map_color={88, 93, 95},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.tellus_water,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "lowland-infected-mold",
        order = "c-z[tellus-land-tiles]-a[lowland-infected-mold]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0.45, 0.65, 0.005, 0, 1) + 0.1 * gleba_select(gleba_temperature_normalised, -0.2, 1, 0.005, 0, 1)"},
        layer_group = "water-overlay",
        layer = tellus_lowland_tile_offset+8,
        lowland_fog = true,
        effect = "wetland-tellus-light-green-puddle",
        effect_is_opaque = false,
        effect_color = {70, 76, 79},
        effect_color_secondary = {70, 77, 79},
        -- sprite_usage_surface = "tellus",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__planetaris-tellus__/graphics/terrain/tellus/infected-mold.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = tile_sounds.walking.semi_wet,
        landing_steps_sound = tile_sounds.landing.semi_wet,
        map_color={78, 93, 97},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.tellus_water,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "lowland-parasitic-dead-skin",
        order = "c-z[tellus-land-tiles]-a[lowland-parasitic-dead-skin]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0.45, 0.65, 0.005, 0, 1) + 0.1 * gleba_select(gleba_temperature_normalised, -1, -0.2, 0.005, 0, 1)"},
        layer_group = "water-overlay",
        layer = tellus_lowland_tile_offset+5,
        lowland_fog = true,
        effect = "wetland-tellus-light-green-puddle",
        effect_is_opaque = false,
        effect_color = {68, 84, 79},
        effect_color_secondary = {56, 79, 72},
        -- sprite_usage_surface = "tellus",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__planetaris-tellus__/graphics/terrain/tellus/lowland-parasitic-dead-skin.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = tile_sounds.walking.semi_wet,
        landing_steps_sound = tile_sounds.landing.semi_wet,
        map_color={82, 102, 94},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.tellus_water,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "lowland-parasitic-dead-skin-2",
        order = "c-z[tellus-land-tiles]-a[lowland-parasitic-dead-skin]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0.3, 0.45, 0.005, 0, 1) + 0.1 * gleba_select(gleba_temperature_normalised, -1, -0.2, 0.005, 0, 1)"},
        layer_group = "water-overlay",
        layer = tellus_lowland_tile_offset+6,
        lowland_fog = true,
        effect = "wetland-tellus-light-green-puddle",
        effect_is_opaque = false,
        effect_color = {70, 79, 76},
        effect_color_secondary = {70, 79, 77},
        -- sprite_usage_surface = "tellus",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__planetaris-tellus__/graphics/terrain/tellus/lowland-parasitic-dead-skin-2.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = tile_sounds.walking.semi_wet,
        landing_steps_sound = tile_sounds.landing.semi_wet,
        map_color={88, 95, 93},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.tellus_water,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "lowland-cream-green",
        order = "c-z[tellus-land-tiles]-a[lowland-cream-green]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0.62, 0.77, 0.005, 0, 1) * gleba_select(gleba_temperature_normalised, 0.25, 1, 0.005, 0, 1)"},
        layer_group = "water-overlay",
        layer = tellus_lowland_tile_offset+11,
        lowland_fog = true,
        effect = "wetland-tellus-light-green-puddle",
        effect_is_opaque = false,
        effect_color = {60, 77, 67},
        effect_color_secondary = {70, 79, 72},
        -- sprite_usage_surface = "tellus",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__planetaris-tellus__/graphics/terrain/tellus/lowland-cream-green.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = tile_sounds.walking.semi_wet,
        landing_steps_sound = tile_sounds.landing.semi_wet,
        map_color={71, 97, 76},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.tellus_water,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      ----------- Red vein
      {
        type = "tile",
        name = "lowland-green-vein-2", -- bulges
        order = "c-z[tellus-land-tiles]-a[lowland-green-vein]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "water-overlay",
        layer = tellus_lowland_tile_offset+12,
        lowland_fog = true,
        effect = "wetland-tellus-light-green-puddle",
        effect_is_opaque = false,
        effect_color = {58, 92, 56},
        effect_color_secondary = {38, 80, 14},
        -- sprite_usage_surface = "tellus",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__planetaris-tellus__/graphics/terrain/tellus/lowland-green-vein-2.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0.75, 1, 0.005, 0, 1) + 0.1 * (gleba_plants_noise_b - 1)"},
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = tile_sounds.walking.semi_wet,
        landing_steps_sound = tile_sounds.landing.semi_wet,
        map_color={55, 115, 53},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.tellus_water,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "lowland-green-vein", -- sanguine
        order = "c-z[tellus-land-tiles]-a[lowland-green-vein]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "water-overlay",
        layer = tellus_lowland_tile_offset+13,
        lowland_fog = true,
        effect = "wetland-tellus-light-green-puddle",
        effect_is_opaque = false,
        effect_color = {56, 92, 56},
        effect_color_secondary = { 49, 80, 14 },
        -- sprite_usage_surface = "tellus",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__planetaris-tellus__/graphics/terrain/tellus/lowland-green-vein.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0.7, 1, 0.005, 0, 1) * gleba_select(gleba_temperature_normalised, 0.45, 0.75, 0.005, 0, 1)"},
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = tile_sounds.walking.semi_wet,
        landing_steps_sound = tile_sounds.landing.rock,
        map_color={69, 115, 53},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.tellus_water,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "lowland-green-vein-3", -- dull
        order = "c-z[tellus-land-tiles]-a[lowland-green-vein]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "water-overlay",
        layer = tellus_lowland_tile_offset+14,
        effect = "wetland-tellus-light-green-puddle",
        effect_is_opaque = false,
        effect_color = {56, 92, 56},
        effect_color_secondary = {49, 80, 14},
        -- sprite_usage_surface = "tellus",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__planetaris-tellus__/graphics/terrain/tellus/lowland-green-vein-3.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0.7, 1, 0.005, 0, 1) * gleba_select(gleba_temperature_normalised, 0.25, 0.45, 0.005, 0, 1)"},
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = tile_sounds.walking.semi_wet,
        map_color={59, 115, 53},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.tellus_water,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "lowland-green-vein-4", -- bright
        order = "c-z[tellus-land-tiles]-a[lowland-green-vein]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "water-overlay",
        layer = tellus_lowland_tile_offset+15,
        effect = "wetland-tellus-light-green-puddle",
        effect_is_opaque = false,
        effect_color = {62, 92, 56},
        effect_color_secondary = {43, 80, 14},
        -- sprite_usage_surface = "tellus",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__planetaris-tellus__/graphics/terrain/tellus/lowland-green-vein-4.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0.7, 1, 0.005, 0, 1) * gleba_select(gleba_temperature_normalised, 0.75, 1, 0.005, 0, 1)"},
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = tile_sounds.walking.semi_wet,
        map_color={61, 115, 53},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.tellus_water,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "lowland-green-vein-dead",
        order = "c-z[tellus-land-tiles]-a[lowland-green-vein]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "water-overlay",
        layer = tellus_lowland_tile_offset+7,
        lowland_fog = true,
        effect = "wetland-tellus-light-green-puddle",
        effect_is_opaque = false,
        effect_color = {57, 92, 56},
        effect_color_secondary = { 49, 80, 14 },
        -- sprite_usage_surface = "tellus",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__planetaris-tellus__/graphics/terrain/tellus/lowland-green-vein-dead.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0.6, 1, 0.005, 0, 1) * gleba_select(gleba_temperature_normalised, 0, 0.25, 0.005, 0, 1)"},
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = tile_sounds.walking.semi_wet,
        landing_steps_sound = tile_sounds.landing.semi_wet,
        map_color={115, 53, 66},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.tellus_water,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "lowland-green-infection",
        order = "c-z[tellus-land-tiles]-a[lowland-green-vein]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "water-overlay",
        layer = tellus_lowland_tile_offset+16,
        effect = "wetland-tellus-light-green-puddle",
        effect_is_opaque = false,
        effect_color = {66, 92, 56},
        effect_color_secondary = { 49, 80, 14 },
        -- sprite_usage_surface = "tellus",
        variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions(
          "__planetaris-tellus__/graphics/terrain/tellus/lowland-green-infection.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        autoplace = {probability_expression = "gleba_lowland * gleba_select(gleba_aux, 0.7, 1, 0.05, 0, 1) + 0.1 * (gleba_plants_noise - 1)"},
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = tile_sounds.walking.semi_wet,
        map_color={53, 115, 56},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.tellus_water,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
    ---- MidLand
      ----------- Cracked
      {
        type = "tile",
        name = "midland-tellus-cracked-lichen",
        order = "c-z[tellus-land-tiles]-a[midland-yellow-crust]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "ground-natural",
        layer = tellus_tile_offset + 8,
        autoplace = {probability_expression = "gleba_midland * gleba_select(gleba_aux, 0.55, 0.65, 0.15, 0, 1) - 0.2 * gleba_temperature_normalised"},
        -- sprite_usage_surface = "tellus",
        variants = tile_variations_template_with_transitions_and_effect_map(
          "__planetaris-tellus__/graphics/terrain/tellus/cracked-lichen.png",
          "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = tile_sounds.walking.soft_bark,
        landing_steps_sound = tile_sounds.landing.bark,
        map_color={81, 44, 58},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.tellus,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "midland-tellus-cracked-lichen-dull",
        order = "c-z[tellus-land-tiles]-a[midland-yellow-crust]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "ground-natural",
        layer = tellus_tile_offset + 9,
        autoplace = {probability_expression = "gleba_midland * gleba_select(gleba_aux, 0.45, 0.55, 0.15, 0, 1) + 0.2 * gleba_temperature_normalised"},
        -- sprite_usage_surface = "tellus",
        variants = tile_variations_template_with_transitions_and_effect_map(
          "__planetaris-tellus__/graphics/terrain/tellus/cracked-lichen-dull.png",
          "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = tile_sounds.walking.soft_bark,
        landing_steps_sound = tile_sounds.landing.bark,
        map_color={71, 40, 61},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.tellus,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "midland-tellus-cracked-lichen-dark",
        order = "c-z[tellus-land-tiles]-a[midland-yellow-crust]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "ground-natural",
        layer = tellus_tile_offset,
        autoplace = {probability_expression = "max(1.08 * gleba_midland * gleba_select(gleba_aux, 0, 0.55, 0.1, 0, 1), 1.15 * gleba_highland) + 0.3 * (gleba_plants_noise_b - 0.7)"},
        -- sprite_usage_surface = "tellus",
        variants = tile_variations_template_with_transitions_and_effect_map(
          "__planetaris-tellus__/graphics/terrain/tellus/cracked-lichen-dark.png",
          "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = tile_sounds.walking.soft_bark,
        landing_steps_sound = tile_sounds.landing.bark,
        map_color={61, 30, 30},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.tellus,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      ----------- Turqoise Bark
      {
        type = "tile",
        name = "midland-purple-bark-2",
        order = "c-z[tellus-land-tiles]-a[midland-purple-bark]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer = tellus_tile_offset + 10,
        -- sprite_usage_surface = "tellus",
        variants = tile_variations_template_with_transitions_and_effect_map(
          "__planetaris-tellus__/graphics/terrain/tellus/midland-purple-bark-2.png",
          "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        autoplace = {probability_expression = "gleba_midland * gleba_select(gleba_aux, 0.05, 0.4, 0.2, 0, 1) - 0.2 * gleba_temperature_normalised"},
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = tile_sounds.walking.soft_bark,
        landing_steps_sound = tile_sounds.landing.bark,
        map_color={61, 46, 68},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.tellus,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "midland-purple-bark",
        order = "c-z[tellus-land-tiles]-a[midland-purple-bark]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer = tellus_tile_offset + 11,
        -- sprite_usage_surface = "tellus",
        variants = tile_variations_template_with_transitions_and_effect_map(
          "__planetaris-tellus__/graphics/terrain/tellus/midland-purple-bark.png",
          "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        autoplace = {probability_expression = "gleba_midland * gleba_select(gleba_aux, 0, 0.35, 0.2, 0, 1) + 0.2 * gleba_temperature_normalised"},
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = tile_sounds.walking.soft_bark,
        landing_steps_sound = tile_sounds.landing.bark,
        map_color={57, 46, 68},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.tellus,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
            ----------- Starburst
      {
        type = "tile",
        name = "midland-red-crust-3", -- beige
        order = "c-z[tellus-land-tiles]-a[midland-red-crust]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "ground-natural",
        layer = tellus_tile_offset + 12,
        autoplace = {probability_expression = "gleba_midland * gleba_select(gleba_aux, 0.65, 1, 0.1, 0, 1)"},
        sprite_usage_surface = "gleba",
        variants = tile_variations_template_with_transitions_and_effect_map(
          "__planetaris-tellus__/graphics/terrain/tellus/starburst-lichen-3.png",
          "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = tile_sounds.walking.dry_rock,
        landing_steps_sound = tile_sounds.landing.rock,
        map_color={114, 78, 40},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.tellus,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "midland-red-crust-2", -- orange
        order = "c-z[tellus-land-tiles]-a[midland-red-crust]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "ground-natural",
        layer = tellus_tile_offset + 13,
        autoplace = {probability_expression = "gleba_midland * gleba_select(gleba_aux, 0.8, 1, 0.15, 0, 1) * (0.93 + 0.1 * gleba_select(gleba_moisture, 0.5, 0.5, 0.25, 0, 1) - 0.1 * gleba_temperature_normalised)"},
        sprite_usage_surface = "gleba",
        variants = tile_variations_template_with_transitions_and_effect_map(
          "__planetaris-tellus__/graphics/terrain/tellus/starburst-lichen-2.png",
          "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = tile_sounds.walking.dry_rock,
        landing_steps_sound = tile_sounds.landing.rock,
        map_color={114, 66, 40},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.tellus,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "midland-red-crust", -- main
        order = "c-z[tellus-land-tiles]-a[midland-red-crust]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "ground-natural",
        layer = tellus_tile_offset + 14,
        autoplace = {probability_expression = "gleba_midland * gleba_select(gleba_aux, 0.7, 1, 0.1, 0, 1) * (1 + 0.1 * (gleba_aux - 0.75) + 0.05 * gleba_plants_noise_b)"},
        sprite_usage_surface = "gleba",
        variants = tile_variations_template_with_transitions_and_effect_map(
          "__planetaris-tellus__/graphics/terrain/tellus/starburst-lichen.png",
          "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = tile_sounds.walking.dry_rock,
        landing_steps_sound = tile_sounds.landing.rock,
        map_color={114, 40, 42},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.tellus,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
      {
        type = "tile",
        name = "midland-red-crust-4", -- yellow
        order = "c-z[tellus-land-tiles]-a[midland-yellow-crust]",
        subgroup = "gleba-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "ground-natural",
        layer = tellus_tile_offset + 15,
        autoplace = {probability_expression = "gleba_midland * gleba_select(gleba_aux, 0.8, 1, 0.15, 0, 1) * (0.9 + 0.1 * gleba_select(gleba_moisture, 0.25, 0.25, 0.25, 0, 1) + 0.1 * gleba_temperature_normalised)"},
        sprite_usage_surface = "gleba",
        variants = tile_variations_template_with_transitions_and_effect_map(
          "__planetaris-tellus__/graphics/terrain/tellus/starburst-lichen-4.png",
          "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
          }
        ),
        transitions = lava_stone_transitions,
        transitions_between_transitions = lava_stone_transitions_between_transitions,
        walking_sound = tile_sounds.walking.dry_rock,
        landing_steps_sound = tile_sounds.landing.rock,
        map_color={114, 40, 40},
        walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        absorptions_per_second = tile_pollution.tellus,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
      },
})

table.insert(water_tile_type_names, "wetland-tellus-light-dead-skin")
table.insert(water_tile_type_names, "wetland-tellus-dead-skin")
table.insert(water_tile_type_names, "wetland-light-cyan-slime")
table.insert(water_tile_type_names, "wetland-cyan-slime")
table.insert(water_tile_type_names, "wetland-tellus-brown-slime")
table.insert(water_tile_type_names, "wetland-tellus-light-green-tentacle")
table.insert(water_tile_type_names, "wetland-tellus-green-tentacle")
table.insert(water_tile_type_names, "wetland-blue-slime")
table.insert(water_tile_type_names, "tellus-deep-lake")


data:extend({
  {
    type = "tile",
    name = "wetland-mycelia",
    icon = "__space-age__/graphics/icons/wetland-yumako.png",
    order = "c[resource]-a[wetland-mycelia]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "gleba_fertile_spots_coastal * 5000 * (1 - gleba_biome_mask_green) * gleba_above_deep_water_mask"},
    default_cover_tile = "landfill",
    lowland_fog = true,
    effect = "wetland-tellus-cyan",
    fluid = "planetaris-infected-water",
    effect_color = {38, 73, 74},
    effect_color_secondary = {20, 125, 125},
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer_group = "water-overlay",
    layer = 3,
    -- sprite_usage_surface = "tellus",
    variants =
    {
      main =
      {
        {
          picture = "__planetaris-tellus__/graphics/terrain/tellus/wetland-dead-skin.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    map_color={7, 132, 124},
    absorptions_per_second = tile_pollution.tellus_water,

    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,

    walking_sound = base_tile_sounds.walking.shallow_water,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds = tile_sounds.ambient.insects_deep_mud({max_entity_count = 30, average_pause_seconds = 8}),

    trigger_effect = tile_trigger_effects.water_mud_trigger_effect(),
  },
  {
    type = "tile",
    name = "wetland-chlorophyll",
    icon = "__space-age__/graphics/icons/wetland-jellynut.png",
    order = "c[resource]-b[wetland-chlorophyll]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "gleba_fertile_spots_coastal * 5000 * (1 - gleba_biome_mask_red) * gleba_above_deep_water_mask"},
    default_cover_tile = "landfill",
    fluid = "planetaris-infected-water",
    lowland_fog = true,
    effect = "wetland-tellus-green",
    effect_color = {75, 99, 71},
    effect_color_secondary = {68, 79, 48},
    layer_group = "water-overlay",
    particle_tints = tile_graphics.gleba_mud_water_particle_tints,
    layer_group = "water",
    layer = 3,
    -- sprite_usage_surface = "tellus",
    variants =
    {
      main =
      {
        {
          picture = "__planetaris-tellus__/graphics/terrain/tellus/wetland-chlorophyll-tentacle.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    map_color={49, 132, 7},
    absorptions_per_second = tile_pollution.tellus_water,

    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,

    walking_sound = base_tile_sounds.walking.shallow_water,
    landing_steps_sound = tile_sounds.landing.wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds =
    {
      tile_sounds.ambient.insects_deep_mud({max_entity_count = 30, average_pause_seconds = 8}),
      tile_sounds.ambient.night_frogs,
    },

    trigger_effect = tile_trigger_effects.water_mud_trigger_effect(),
  },
  {
    type = "tile",
    name = "wetland-tellus-dead-skin",
    order = "b[wetland]-d[wetland-dead-skin]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "gleba_shallows_aux_2 + 2 * min(gleba_select(gleba_aux, 0.3, 0.7, 0.005, 0, 1), gleba_rockpools_shallow)"},
    lowland_fog = true,
    effect = "wetland-tellus-cyan",
    --effect_color = { 76, 70, 79 },
    --effect_color_secondary = { 76, 70, 79 },
    effect_color = {57, 73, 73},
    effect_color_secondary = {71, 79, 70},
    map_color = {r = 46, g = 45, b = 51},
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 7,
    layer_group = "water-overlay",
    -- sprite_usage_surface = "tellus",
    variants =
    {
      main =
      {
        {
          picture = "__planetaris-tellus__/graphics/terrain/tellus/wetland-dead-skin.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = tile_sounds.walking.wetland,
    landing_steps_sound = tile_sounds.landing.wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds =
    {
      tile_sounds.ambient.insects_deep_mud({}),
      tile_sounds.ambient.night_insects,
    },
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "planetaris-infected-water",
    absorptions_per_second = tile_pollution.tellus_water,
  },
  {
    type = "tile",
    name = "wetland-tellus-light-dead-skin",
    order = "b[wetland]-c[wetland-light-dead-skin]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "gleba_shallows_edge_aux_2 + 2 * min(gleba_select(gleba_aux, 0.3, 0.7, 0.005, 0, 1), gleba_rockpools_shallow)"},
    lowland_fog = true,
    effect = "wetland-tellus-cyan",
    effect_color = { 78, 75, 86 },
    effect_color_secondary = { 76, 70, 79 },
    map_color = {r = 51, g = 50, b = 56},
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 7,
    layer_group = "water-overlay",
    -- sprite_usage_surface = "tellus",
    variants =
    {
      main =
      {
        {
          picture = "__planetaris-tellus__/graphics/terrain/tellus/wetland-dead-skin.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = tile_sounds.walking.wetland,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds =
    {
      tile_sounds.ambient.insects_deep_mud({}),
      tile_sounds.ambient.night_insects,
    },
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "planetaris-infected-water",
    absorptions_per_second = tile_pollution.tellus_water,
  },
  {
    type = "tile",
    name = "wetland-cyan-slime",
    order = "b[wetland]-b[wetland-cyan-slime]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "gleba_shallows_aux_1 + 2 * min(gleba_select(gleba_aux, 0, 0.3, 0.005, 0, 1), gleba_rockpools_shallow)"},
    lowland_fog = true,
    effect = "wetland-tellus-cyan",
    --effect_color = {50,66,66},
    --effect_color_secondary = { 49, 80, 14 },
    effect_color = {29, 64, 64},
    effect_color_secondary = {6, 92, 80},
    map_color = {25, 53, 25},
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 6,
    layer_group = "water-overlay",
    -- sprite_usage_surface = "tellus",
    variants =
    {
      main =
      {
        {
          picture = "__planetaris-tellus__/graphics/terrain/tellus/wetland-cyan-slime.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = tile_sounds.walking.slime,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds =
    {
      tile_sounds.ambient.insects_deep_mud({}),
      tile_sounds.ambient.night_frogs,
    },
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "planetaris-infected-water",
    absorptions_per_second = tile_pollution.tellus_water,
  },
  {
    type = "tile",
    name = "wetland-light-cyan-slime",
    order = "b[wetland]-a[wetland-light-cyan-slime]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "gleba_shallows_edge_aux_1 + 2 * min(gleba_select(gleba_aux, 0, 0.3, 0.005, 0, 1), gleba_rockpools_shallow)"},
    lowland_fog = true,
    effect = "wetland-tellus-cyan",
    effect_color = {35, 74, 69},
    effect_color_secondary = {9, 102, 65},
    map_color = {35, 63, 35},
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 6,
    layer_group = "water-overlay",
    -- sprite_usage_surface = "tellus",
    variants =
    {
      main =
      {
        {
          picture = "__planetaris-tellus__/graphics/terrain/tellus/wetland-cyan-slime.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = tile_sounds.walking.slime,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds =
    {
      tile_sounds.ambient.insects_deep_mud({}),
      tile_sounds.ambient.night_frogs,
    },
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "planetaris-infected-water",
    absorptions_per_second = tile_pollution.tellus_water,
  },
  {
    type = "tile",
    name = "wetland-tellus-green-tentacle",
    order = "b[wetland]-f[wetland-tellus-green-tentacle]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "gleba_shallows_aux_3 + 2 * min(gleba_select(gleba_aux, 0.7, 2, 0.005, 0, 1), gleba_rockpools_shallow)"},
    lowland_fog = true,
    effect = "wetland-tellus-green",
    effect_color = {70, 82, 55},
    effect_color_secondary = {52, 61, 35},
    map_color = {33, 79, 27},
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 5,
    layer_group = "water-overlay",
    -- sprite_usage_surface = "tellus",
    variants =
    {
      main =
      {
        {
          picture = "__planetaris-tellus__/graphics/terrain/tellus/wetland-chlorophyll-tentacle.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = tile_sounds.walking.wetland,
    landing_steps_sound = tile_sounds.landing.wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds = tile_sounds.ambient.insects_deep_mud({}),
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "planetaris-infected-water",
    absorptions_per_second = tile_pollution.tellus_water,
  },
  {
    type = "tile",
    name = "wetland-tellus-light-green-tentacle",
    order = "b[wetland]-e[wetland-pink-tentacle]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "gleba_shallows_edge_aux_3"},
    lowland_fog = true,
    effect = "wetland-tellus-green",
    effect_color = {95, 112, 76},
    effect_color_secondary = {52, 61, 35},
    map_color = {59, 71, 29},
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 5,
    layer_group = "water-overlay",
    -- sprite_usage_surface = "tellus",
    variants =
    {
      main =
      {
        {
          picture = "__planetaris-tellus__/graphics/terrain/tellus/wetland-chlorophyll-tentacle.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = tile_sounds.walking.wetland,
    landing_steps_sound = tile_sounds.landing.wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds = tile_sounds.ambient.insects_deep_mud({}),
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "planetaris-infected-water",
    absorptions_per_second = tile_pollution.tellus_water,
  },
  {
    type = "tile",
    name = "wetland-tellus-brown-slime",
    order = "b[wetland]-a[wetland-blue-slime]",
    subgroup = "gleba-water-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "6 * gleba_select(gleba_elevation, gleba_deep_water_level, -4, 0.5, 0, 1) + 5 * gleba_rockpools_bluewater"},
    lowland_fog = true,
    effect = "wetland-blue-slime",
    effect_color = {59, 97, 70},
    effect_color_secondary = {63, 99, 80},
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 1,
    layer_group = "water-overlay",
    -- sprite_usage_surface = "tellus",
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/water/water1.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      empty_transitions=true,
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = sound_variations("__base__/sound/walking/shallow-water", 7, 1),
    landing_steps_sound = tile_sounds.landing.wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds =
    {
      tile_sounds.ambient.waterlap,
      tile_sounds.ambient.rain_on_water,
    },
    map_color = {25, 58, 48},
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "planetaris-infected-water",
    absorptions_per_second = tile_pollution.tellus_water,
  },
  {
    type = "tile",
    name = "tellus-deep-lake",
    order = "a[deep]",
    subgroup = "gleba-water-tiles",
    collision_mask =  tile_collision_masks.water(),
    autoplace = {probability_expression = "10 * gleba_select(elevation, -500, gleba_deep_water_level, 0.5, 0, 1) + 10 * gleba_rockpools_deepwater"},
    lowland_fog = false,
    effect = "wetland-blue-slime",
    effect_color = {43, 77, 53},
    effect_color_secondary = {51, 84, 67},
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 1,
    layer_group = "water-overlay",
    -- sprite_usage_surface = "tellus",
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/deepwater/deepwater1.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      empty_transitions=true,
   },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = sound_variations("__base__/sound/walking/shallow-water", 7, 1),
    landing_steps_sound = tile_sounds.landing.wet,
    ambient_sounds =
    {
      tile_sounds.ambient.waterlap,
      tile_sounds.ambient.rain_on_water,
    },
    map_color = {18, 51, 39},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "planetaris-infected-water",
    absorptions_per_second = tile_pollution.tellus_water,
  }
})

data:extend({
  {
    type = "tile-effect",
    name = "wetland-tellus-cyan",
    shader = "water",
    water =
    {
      shader_variation = "wetland-water",
      lightmap_alpha = 0, -- needed for water mask
      textures =
      {
        {
          filename = "__space-age__/graphics/terrain/gleba/watercaustics.png",
          width = 512,
          height = 512
        },
        {
          filename = "__planetaris-tellus__/graphics/terrain/tellus/wetland-cyan-slime-shader.png",
          width = 512 * 4,
          height = 512 * 2
        }
      },
      texture_variations_columns = 1,
      texture_variations_rows = 1,
      secondary_texture_variations_columns = 4,
      secondary_texture_variations_rows = 2,


      animation_speed = 1.5,
      animation_scale = { 0.8, 0.8 },
      tick_scale = 6,

      specular_lightness = { 11, 26, 5 },
      foam_color = { 21, 4, 4 },
      foam_color_multiplier = 1,

      dark_threshold = { 0.1, 0.1 },
      reflection_threshold = { 1, 1 },
      specular_threshold = { 0.19, 0.25 },

      near_zoom = 1 / 16,
      far_zoom = 1 / 16,
    }
  },
  {
    type = "tile-effect",
    name = "wetland-tellus-green",
    shader = "water",
    water =
    {
      shader_variation = "wetland-water",
      lightmap_alpha = 0, -- needed for water mask
      textures =
      {
        {
          filename = "__space-age__/graphics/terrain/gleba/watercaustics.png",
          width = 512,
          height = 512
        },
        {
          filename = "__planetaris-tellus__/graphics/terrain/tellus/wetland-green-tentacle-shader.png",
          width = 512 * 4,
          height = 512 * 2
        }
      },
      texture_variations_columns = 1,
      texture_variations_rows = 1,
      secondary_texture_variations_columns = 4,
      secondary_texture_variations_rows = 2,


      animation_speed = 1.5,
      animation_scale = { 0.75, 0.75 },
      tick_scale = 6,

      specular_lightness = { 11, 26, 5 },
      foam_color = { 21, 4, 4 },
      foam_color_multiplier = 1,

      dark_threshold = { 0.1, 0.1 },
      reflection_threshold = { 1, 1 },
      specular_threshold = { 0.19, 0.25 },

      near_zoom = 1 / 16,
      far_zoom = 1 / 16,
    }
  },
  {
    type = "tile-effect",
    name = "wetland-blue-slime",
    shader = "water",
    water =
    {
      shader_variation = "wetland-water",
      lightmap_alpha = 0, -- needed for water mask
      textures =
      {
        {
          filename = "__space-age__/graphics/terrain/gleba/watercaustics.png",
          width = 512,
          height = 512
        },
        {
          filename = "__planetaris-tellus__/graphics/terrain/tellus/wetland-dead-skin-shader.png",
          width = 512 * 4,
          height = 512 * 2
        }
      },
      texture_variations_columns = 1,
      texture_variations_rows = 1,
      secondary_texture_variations_columns = 4,
      secondary_texture_variations_rows = 2,

      animation_speed = 1.5,
      animation_scale = { 1.5, 1.5 },
      tick_scale = 6,

      specular_lightness = { 11, 26, 5 },
      foam_color = { 21, 4, 4 },
      foam_color_multiplier = 1,

      dark_threshold = { 0.6, 0.6 },
      reflection_threshold = { 1, 1 },
      specular_threshold = { 0.19, 0.25 },

      near_zoom = 1 / 16,
      far_zoom = 1 / 16,
    }
  },
  {
    type = "tile-effect",
    name = "wetland-tellus-light-green-puddle",
    shader = "puddle",
    puddle =
    {
      puddle_noise_texture =
      {
        filename = "__space-age__/graphics/terrain/gleba/puddle-noise.png",
        size = 512
      },
      water_effect = "wetland-tellus-green"
    }
  },
})
