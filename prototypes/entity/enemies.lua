require ("__base__.prototypes.entity.enemy-constants")
require ("__base__.prototypes.entity.biter-animations")
require ("__base__.prototypes.entity.spitter-animations")
require ("__base__.prototypes.entity.spawner-animation")

require ("__planetaris-tellus__/prototypes/entity/wasp-animations")

local biter_ai_settings = require ("__base__.prototypes.entity.biter-ai-settings")
local enemy_autoplace = require ("__base__.prototypes.entity.enemy-autoplace-utils")
local sounds = require ("__base__.prototypes.entity.sounds")
local planetaris_sounds = require ("__planetaris-tellus__/prototypes/entity/sounds")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local simulations = require("__base__.prototypes.factoriopedia-simulations")

local small_biter_scale = 0.5
local small_biter_tint1 = {0.60, 0.58, 0.51, 1}
local small_biter_tint2 = {0.62, 0.55, 0.2, 0.7}

local medium_biter_scale = 0.7
local medium_biter_tint1 = {0.49, 0.46, 0.51, 1}
local medium_biter_tint2 = {0.6, 0.36, 0.36, 0.7}

local big_biter_scale = 1.0
local big_biter_tint1 = {0.37, 0.40, 0.72, 1}
local big_biter_tint2 = {0.15, 0.55, 0.5, 0.7}

local behemoth_biter_scale = 1.2
local behemoth_biter_tint1 = {0.2, 0.25, 0.2, 1}
local behemoth_biter_tint2 = {0.45, 0.82, 0.1, 0.7}

local make_unit_melee_ammo_type = function(damage_value)
  return
  {
    target_type = "entity",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = { amount = damage_value , type = "physical"}
        }
      }
    }
  }
end

local base_sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local planetaris_enemy_autoplace = require ("__planetaris-tellus__.prototypes.entity.planetaris-enemy-autoplace-utils")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local decorative_trigger_effects = require("__base__.prototypes.decorative.decorative-trigger-effects")
local explosion_animations = require("__space-age__.prototypes.entity.explosion-animations")
local gleba_enemy_animations = require("__space-age__.prototypes.entity.gleba-enemy-animations")
local gleba_ai_settings = require ("__space-age__.prototypes.entity.gleba-ai-settings")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")
local particle_animations = require("__space-age__/prototypes/particle-animations")

local function lerp_color(a, b, amount)
  return
  {
    a[1] + amount * (b[1] - a[1]),
    a[2] + amount * (b[2] - a[2]),
    a[3] + amount * (b[3] - a[3]),
    a[4] + amount * (b[4] - a[4]),
  }
end

local function fade(tint, amount) -- fades to minimal opacity grey. Low opacity is good for the mask to let the base layer show htough (instead of having a grey mask)
  return lerp_color(tint, {1, 1, 1, 2}, amount)
end

local function grey_overlay(tint, amount) -- fades to opaque grey. Full opacity is required for body.
  return lerp_color(tint, {127, 127, 127, 255}, amount)
end

data.raw["unit-spawner"]["biter-spawner"].captured_spawner_entity = "captive-biter-spawner"
data.raw["unit-spawner"]["spitter-spawner"].captured_spawner_entity = "captive-biter-spawner"

-- should be moved to shared util for include
local default_ended_in_water_trigger_effect = function()
  return
  {

    {
      type = "create-particle",
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "tintable-water-particle",
      apply_tile_tint = "secondary",
      offset_deviation = { { -0.05, -0.05 }, { 0.05, 0.05 } },
      initial_height = 0,
      initial_height_deviation = 0.02,
      initial_vertical_speed = 0.05,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.006,
      frame_speed = 1,
      frame_speed_deviation = 0,
      tail_length = 2,
      tail_length_deviation = 1,
      tail_width = 3
    },
    {
      type = "create-particle",
      repeat_count = 10,
      repeat_count_deviation = 6,
      probability = 0.03,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "tintable-water-particle",
      apply_tile_tint = "primary",
      offsets =
      {
        { 0, 0 },
        { 0.01563, -0.09375 },
        { 0.0625, 0.09375 },
        { -0.1094, 0.0625 }
      },
      offset_deviation = { { -0.2969, -0.1992 }, { 0.2969, 0.1992 } },
      initial_height = 0,
      initial_height_deviation = 0.02,
      initial_vertical_speed = 0.053,
      initial_vertical_speed_deviation = 0.005,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.006,
      frame_speed = 1,
      frame_speed_deviation = 0,
      tail_length = 9,
      tail_length_deviation = 0,
      tail_width = 1
    },
    {
      type = "play-sound",
      sound = base_sounds.small_splash
    }
  }

end

local particle_ended_in_water_trigger_effect = function()
  return
  {
    type = "create-particle",
    repeat_count = 5,
    repeat_count_deviation = 4,
    probability = 0.2,
    affects_target = false,
    show_in_tooltip = false,
    particle_name = "tintable-water-particle",
    apply_tile_tint = "secondary",
    offsets = { { 0, 0 } },
    offset_deviation = { { -0.2969, -0.2969 }, { 0.2969, 0.2969 } },
    tile_collision_mask = nil,
    initial_height = 0.1,
    initial_height_deviation = 0.1,
    initial_vertical_speed = 0.06,
    initial_vertical_speed_deviation = 0.069,
    speed_from_center = 0.02,
    speed_from_center_deviation = 0.05,
    frame_speed = 1,
    frame_speed_deviation = 0,
    tail_length = 9,
    tail_length_deviation = 8,
    tail_width = 1
  }
end

local make_particle = function(params)

  if not params then error("No params given to make_particle function") end
  local name = params.name or error("No name given")

  local ended_in_water_trigger_effect = params.ended_in_water_trigger_effect or default_ended_in_water_trigger_effect()
  if params.ended_in_water_trigger_effect == false then
    ended_in_water_trigger_effect = nil
  end

  local particle =
  {

    type = "optimized-particle",
    name = name,

    life_time = params.life_time or (60 * 15),
    fade_away_duration = params.fade_away_duration,

    render_layer = params.render_layer or "projectile",
    render_layer_when_on_ground = params.render_layer_when_on_ground or "corpse",

    regular_trigger_effect_frequency = params.regular_trigger_effect_frequency or 2,
    regular_trigger_effect = params.regular_trigger_effect,
    ended_in_water_trigger_effect = ended_in_water_trigger_effect,

    pictures = params.pictures,
    shadows = params.shadows,
    draw_shadow_when_on_ground = params.draw_shadow_when_on_ground,

    movement_modifier_when_on_ground = params.movement_modifier_when_on_ground,
    movement_modifier = params.movement_modifier,
    vertical_acceleration = params.vertical_acceleration,

    mining_particle_frame_speed = params.mining_particle_frame_speed,

  }

  return particle

end

function gleba_hit_effects(offset_deviation, offset)
  local offset = offset or {0, 0}
  return
  {
    type = "create-entity",
    entity_name = "gleba-enemy-damaged-explosion",
    offset_deviation = offset_deviation or {{-0.5, -0.5}, {0.5, 0.5}},
    offsets = {offset},
    damage_type_filters = "fire"
  }
end

local function gleba_spawner_variations(data)
  local animations  = {}
  local line_length = data.line_length or 8
  local width = data.width or 256
  local height = data.height or 256
  for i = 1, data.count or 1 do
    table.insert(animations,
      {
        filename = data.path .. ".png",
        width = width,
        height = height,
        line_length = line_length,
        shift = data.shift,
        frame_count = 1,
        tint = data.tint,
        scale = data.scale or 0.5,
        x = (i-1) % line_length * width,
        y = (data.y or 0) + math.floor((i-1) / line_length) * height,
        surface = "any",
        usage = "enemy"
      }
    )
  end
  return animations
end

data:extend(
{
  {
    type = "sticker",
    name = "strafer-sticker",
    hidden = true,
    animation =
    {
      filename = "__base__/graphics/entity/slowdown-sticker/slowdown-sticker.png",
      line_length = 5,
      width = 42,
      height = 48,
      frame_count = 50,
      animation_speed = 0.5,
      tint = {0.63, 0.62, 0.47, 0.7}, -- a29f7a
      shift = util.by_pixel(2, -0.5),
      scale = 0.5
    },
    duration_in_ticks = 40,
    target_movement_modifier = 0.5
  },
  {
    type = "unit-spawner",
    name = "tellus-spawner",
    icon = "__planetaris-tellus__/graphics/icons/tellus-spawner.png",
    flags = {"placeable-player", "placeable-enemy", "not-repairable", "placeable-off-grid"},
    max_health = 500,
    order="s-d-b",
    subgroup="enemies",
    working_sound =
    {
      sound = {category = "enemy", filename = "__planetaris-tellus__/sound/creatures/wasp-big-nest.ogg", volume = 0.8, modifiers = volume_multiplier("main-menu", 0.7) },
      max_sounds_per_prototype = 3,
    },
    dying_sound = sound_variations("__base__/sound/creatures/spawner-death", 5, 0.7, volume_multiplier("main-menu", 1.21) ),
    impact_category = "organic",
    resistances =
    {
      {
        type = "physical",
        decrease = 2,
        percent = 15
      },
      {
        type = "explosion",
        decrease = 5,
        percent = 15
      },
      {
        type = "fire",
        decrease = 3,
        percent = 60
      }
    },
    healing_per_tick = 10/60,
    collision_box = {{-2.35, -2.35}, {2.35, 2.35}},
    collision_mask = {layers={player=true, object=true, ground_tile=true, is_object=true, is_lower_object=true}}, -- can go in shallow water
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    hit_visualization_box = {{-1, -0.75}, {1, 0.75}},
    absorptions_per_second = { spores = { absolute = 20, proportional = 0.01 } },
    corpse = "tellus-spawner-corpse",
    dying_explosion = "spitter-spawner-die",
    dying_trigger_effect =
    {
      {
        type = "create-entity",
        entity_name = "medium-wasp",
        as_enemy = true,
        offsets =
        {
          util.rotate_position({0,1}, 0.1),
          util.rotate_position({0,1}, 0.3),
          util.rotate_position({0,1}, 0.5),
          util.rotate_position({0,1}, 0.7),
          util.rotate_position({0,1}, 0.9),
          util.rotate_position({0,2}, 0.0),
          util.rotate_position({0,2}, 0.05),
          util.rotate_position({0,2}, 0.1),
          util.rotate_position({0,2}, 0.15),
          util.rotate_position({0,2}, 0.2),
          util.rotate_position({0,2}, 0.25),
          util.rotate_position({0,2}, 0.3),
          util.rotate_position({0,2}, 0.35),
          util.rotate_position({0,2}, 0.4),
          util.rotate_position({0,2}, 0.45),
          util.rotate_position({0,2}, 0.5),
          util.rotate_position({0,2}, 0.55),
          util.rotate_position({0,2}, 0.6),
          util.rotate_position({0,2}, 0.65),
          util.rotate_position({0,2}, 0.7),
          util.rotate_position({0,2}, 0.75),
          util.rotate_position({0,2}, 0.8),
          util.rotate_position({0,2}, 0.85),
          util.rotate_position({0,2}, 0.9),
          util.rotate_position({0,2}, 0.95),
        }
      }
    },
    damaged_trigger_effect = gleba_hit_effects(),
    max_count_of_owned_units = 2,
    max_count_of_owned_defensive_units = 1,
    max_friends_around_to_spawn = 3,
    max_defensive_friends_around_to_spawn = 2,
    graphics_set =
    {
      animations =
      {
        {
          layers =
          {
            util.sprite_load("__planetaris-tellus__/graphics/entity/tellus-spawner/spawner-upper-1",
            {
              frame_count = 16,
              scale = 0.5,
              animation_speed = 0.1,
              run_mode = "forward-then-backward",
              shift = util.by_pixel(12, -20)
            }),
            util.sprite_load("__planetaris-tellus__/graphics/entity/tellus-spawner/spawner-shadow-1",
            {
              frame_count = 16,
              scale = 0.5,
              animation_speed = 0.1,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
              shift = util.by_pixel(12, -20)
            }),
          }
        },
       --[[ {
          layers =
          {
            util.sprite_load("__planetaris-tellus__/graphics/entity/tellus-spawner/spawner-upper-2",
            {
              frame_count = 16,
              scale = 0.5,
              animation_speed = 0.1,
              run_mode = "forward-then-backward",
            }),
            util.sprite_load("__planetaris-tellus__/graphics/entity/tellus-spawner/spawner-shadow-2",
            {
              frame_count = 16,
              scale = 0.5,
              animation_speed = 0.1,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
            }),
          }
        },]]
        {
          layers =
          {
            util.sprite_load("__planetaris-tellus__/graphics/entity/tellus-spawner/spawner-upper-3",
            {
              frame_count = 16,
              scale = 0.5,
              animation_speed = 0.1,
              run_mode = "forward-then-backward",
              shift = util.by_pixel(0, -8)
            }),
            util.sprite_load("__planetaris-tellus__/graphics/entity/tellus-spawner/spawner-shadow-3",
            {
              frame_count = 16,
              scale = 0.5,
              animation_speed = 0.1,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
              shift = util.by_pixel(0, -8)
            }),
          }
        },
        {
          layers =
          {
            util.sprite_load("__planetaris-tellus__/graphics/entity/tellus-spawner/spawner-upper-4",
            {
              frame_count = 16,
              scale = 0.5,
              animation_speed = 0.1,
              run_mode = "forward-then-backward",
              shift = util.by_pixel(28, 32)
            }),
            util.sprite_load("__planetaris-tellus__/graphics/entity/tellus-spawner/spawner-shadow-4",
            {
              frame_count = 16,
              scale = 0.5,
              animation_speed = 0.1,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
              shift = util.by_pixel(28, 32)
            }),
          }
        },
      },
      underwater_animations =
      {
        util.sprite_load("__planetaris-tellus__/graphics/entity/tellus-spawner/spawner-patch-1",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 0.1,
          run_mode = "forward-then-backward",
            shift = util.by_pixel(12, -20)
        }),
        --[[
        util.sprite_load("__planetaris-tellus__/graphics/entity/tellus-spawner/spawner-patch-2",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 0.1,
          run_mode = "forward-then-backward",
        }),
        ]]
        util.sprite_load("__planetaris-tellus__/graphics/entity/tellus-spawner/spawner-patch-3",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 0.1,
          run_mode = "forward-then-backward",
          shift = util.by_pixel(0, -8)
        }),
        util.sprite_load("__planetaris-tellus__/graphics/entity/tellus-spawner/spawner-patch-4",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 0.1,
          run_mode = "forward-then-backward",
          shift = util.by_pixel(28, 32)
        }),
      },
      water_effect_map_animations =
      {
        util.sprite_load("__planetaris-tellus__/graphics/entity/tellus-spawner/spawner-effect-map-1",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 0.1,
          run_mode = "forward-then-backward",
          shift = util.by_pixel(12, -20)
          --shift = util.by_pixel( -0.0, 64.0),
          --tint = tint,
          --flags = { "mask" },
          --y = variation * 230 * 2,
        }),
        --[[
        util.sprite_load("__planetaris-tellus__/graphics/entity/tellus-spawner/spawner-effect-map-2",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 0.1,
          run_mode = "forward-then-backward",
        }),]]
        util.sprite_load("__planetaris-tellus__/graphics/entity/tellus-spawner/spawner-effect-map-3",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 0.1,
          run_mode = "forward-then-backward",
          shift = util.by_pixel(0, -8)
        }),
        util.sprite_load("__planetaris-tellus__/graphics/entity/tellus-spawner/spawner-effect-map-4",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 0.1,
          run_mode = "forward-then-backward",
            shift = util.by_pixel(28, 32)
        }),
      },

      --[[
      water_reflection =
      {
        pictures =
        {
          {
            filename = "__planetaris-tellus__/graphics/entity/tellus-spawner/spawner-effect-map-3.png",
            width = 364,
            height = 266,
            shift = util.by_pixel( -0.0,  0.0),
            scale = 0.5
          },
          {
            filename = "__planetaris-tellus__/graphics/entity/tellus-spawner/spawner-effect-map-3.png",
            width = 364,
            height = 266,
            shift = util.by_pixel( -0.0, 0.0),
            scale = 0.5
          },
          util.sprite_load("__planetaris-tellus__/graphics/entity/tellus-spawner/spawner-effect-map-3",
          {
            frame_count = 16,
            scale = 0.5,
            animation_speed = 0.1,
            run_mode = "forward-then-backward",
            shift = util.by_pixel( -0.0, 64.0),
            --tint = tint,
            --flags = { "mask" },
            --y = variation * 230 * 2,
          }
          ),
          {
            filename = "__planetaris-tellus__/graphics/entity/tellus-spawner/spawner-effect-map-3.png",
            width = 364,
            height = 266,
            shift = util.by_pixel( -0.0, 0.0),
            scale = 0.5
          },
        }
      }
      --]]
    },
    result_units =
    {
      {"small-wasp", {{0.0, 0.3}, {0.35, 0}}},
      {"small-wasp", {{0.25, 0.0}, {0.5, 0.3}, {0.7, 0.0}}},
      {"medium-wasp", {{0.4, 0.0}, {0.7, 0.3}, {0.9, 0.1}}},
      {"big-wasp", {{0.5, 0.0}, {1.0, 0.4}}},
      {"behemoth-wasp", {{0.9, 0.0}, {1.0, 0.3}}},
    },
    -- With zero evolution the spawn rate is 6 seconds, with max evolution it is 2.5 seconds
    spawning_cooldown = {360, 150},
    spawning_radius = 10,
    spawning_spacing = 3,
    max_spawn_shift = 0,
    max_richness_for_spawn_shift = 100,
    call_for_help_radius = 50,
    spawn_decorations_on_expansion = true,
    spawn_decoration =
    {
      {
        decorative = "tellus-spawner-slime",
        spawn_min = 3,
        spawn_max = 3,
        spawn_min_radius = 0,
        spawn_max_radius = 6
      }
    },
    -- also add to yumako areas
    autoplace = planetaris_enemy_autoplace.tellus_spawner_autoplace("tellus_spawner", "b[enemy]-c[spawner]-a[large]"),
    loot = {{item = "planetaris-wasp-egg", probability = 1, count_min = 9, count_max = 9}}
  },
  {
    type = "unit-spawner",
    name = "tellus-spawner-small",
    icon = "__planetaris-tellus__/graphics/icons/tellus-spawner-small.png",
    flags = {"placeable-player", "placeable-enemy", "not-repairable", "placeable-off-grid"},
    max_health = 100,
    order="s-d-b",
    subgroup="enemies",
    working_sound =
    {
      sound = {category = "enemy", filename = "__planetaris-tellus__/sound/creatures/wasp-small-nest.ogg", volume = 0.7, modifiers = volume_multiplier("main-menu", 0.7) },
      max_sounds_per_prototype = 3,
    },
    dying_sound = sound_variations("__base__/sound/creatures/spawner-death", 5, 0.7, volume_multiplier("main-menu", 1.21) ),
    impact_category = "organic",
    resistances =
    {
      {
        type = "physical",
        decrease = 2,
        percent = 15
      },
      {
        type = "explosion",
        decrease = 5,
        percent = 15
      },
      {
        type = "fire",
        decrease = 3,
        percent = 60
      }
    },
    healing_per_tick = 5/60,
    map_generator_bounding_box = {{-2.35, -2.35}, {2.35, 2.35}}, -- stop shallows bias
    collision_box = {{-1.35, -1.35}, {1.35, 1.35}},
    collision_mask = {layers={player=true, object=true, ground_tile=true, is_object=true, is_lower_object=true}}, -- can go in shallow water
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    hit_visualization_box = {{-0.5, -0.25}, {0.5, 0.25}},
    --absorptions_per_second = { spores = { absolute = 4, proportional = 0.002 } }, -- can't use pollution if all possible units can't join attack groups
    corpse = "tellus-spawner-corpse-small",
    dying_explosion = "spitter-spawner-die",
    dying_trigger_effect =
    {
      {
        type = "create-entity",
        entity_name = "medium-wasp",
        as_enemy = true,
        offsets =
        {
          util.rotate_position({0,1}, 0.1),
          util.rotate_position({0,1}, 0.3),
          util.rotate_position({0,1}, 0.5),
          util.rotate_position({0,1}, 0.7),
          util.rotate_position({0,1}, 0.9),
        }
      }
    },
    damaged_trigger_effect = gleba_hit_effects(),
    max_count_of_owned_units = 1,
    max_friends_around_to_spawn = 2,
    graphics_set =
    {
      animations =
      {
        {
          layers =
          {
            util.sprite_load("__planetaris-tellus__/graphics/entity/tellus-spawner/small/spawner-upper-small-1",
            {
              frame_count = 16,
              scale = 0.5,
              animation_speed = 0.1,
              run_mode = "forward-then-backward",
              shift = util.by_pixel(8, 0)
            }),
            util.sprite_load("__planetaris-tellus__/graphics/entity/tellus-spawner/small/spawner-shadow-small-1",
            {
              frame_count = 16,
              scale = 0.5,
              animation_speed = 0.1,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
              shift = util.by_pixel(8, 0)
            })
          }
        },
        {
          layers =
          {
            util.sprite_load("__planetaris-tellus__/graphics/entity/tellus-spawner/small/spawner-upper-small-2",
            {
              frame_count = 16,
              scale = 0.5,
              animation_speed = 0.1,
              run_mode = "forward-then-backward",
            }),
            util.sprite_load("__planetaris-tellus__/graphics/entity/tellus-spawner/small/spawner-shadow-small-2",
            {
              frame_count = 16,
              scale = 0.5,
              animation_speed = 0.1,
              run_mode = "forward-then-backward",
              draw_as_shadow = true,
            })
          },
        },
      },
      underwater_animations =
      {
        util.sprite_load("__planetaris-tellus__/graphics/entity/tellus-spawner/small/spawner-patch-small-1",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 0.1,
          run_mode = "forward-then-backward",
          shift = util.by_pixel(8, 0)
        }),
        util.sprite_load("__planetaris-tellus__/graphics/entity/tellus-spawner/small/spawner-patch-small-2",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 0.1,
          run_mode = "forward-then-backward",
        }),
      },
      water_effect_map_animations =
      {
        util.sprite_load("__planetaris-tellus__/graphics/entity/tellus-spawner/small/spawner-effect-map-small-1",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 0.1,
          run_mode = "forward-then-backward",
          shift = util.by_pixel(8, 0)
          --shift = util.by_pixel( -0.0, 64.0),
          --tint = tint,
          --flags = { "mask" },
          --y = variation * 230 * 2,
        }),
        util.sprite_load("__planetaris-tellus__/graphics/entity/tellus-spawner/small/spawner-effect-map-small-2",
        {
          frame_count = 16,
          scale = 0.5,
          animation_speed = 0.1,
          run_mode = "forward-then-backward",
          --shift = util.by_pixel( -0.0, 64.0),
          --tint = tint,
          --flags = { "mask" },
          --y = variation * 230 * 2,
        }),
      },
    },
    result_units =
    { -- allowes to spawn close to starting area so prevent strafer and stomper from spawning
      {"small-wasp",  {{0.0, 0.9}, {0.1, 0.9}, {0.6, 0}}},
      {"medium-wasp", {{0.1, 0}, {0.6, 0.9}, {0.95, 0}}},
      {"big-wasp",    {{0.6, 0}, {0.95, 0.9}, {1, 0.9}}},
    },
    -- With zero evolution the spawn rate is 6 seconds, with max evolution it is 2.5 seconds
    spawning_cooldown = {360, 150},
    spawning_radius = 10,
    spawning_spacing = 3,
    max_spawn_shift = 0,
    max_richness_for_spawn_shift = 100,
    call_for_help_radius = 50,
    spawn_decorations_on_expansion = true,
    spawn_decoration =
    {
      {
        decorative = "tellus-spawner-slime",
        spawn_min = 2,
        spawn_max = 2,
        spawn_min_radius = 0,
        spawn_max_radius = 4
      }
    },
    -- also add to yumako areas
    autoplace = planetaris_enemy_autoplace.tellus_spawner_autoplace("tellus_spawner_small", "b[enemy]-c[spawner]-b[small]"),
    loot = {{item = "planetaris-wasp-egg", probability = 1, count_min = 1, count_max = 3}}
  },

  {
    type = "corpse",
    name = "tellus-spawner-corpse",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    icon = "__planetaris-tellus__/graphics/icons/tellus-spawner.png",
    collision_box = {{-1.35, -1.35}, {1.35, 1.35}},
    collision_mask = {layers={}, colliding_with_tiles_only=true}, -- can go in water
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    selectable_in_game = false,
    dying_speed = 0.015,
    time_before_removed = 15 * 60 * 60,
    subgroup="corpses",
    order = "c[corpse]-d[tellus-enemies-corpses]-a[spawner]",
    animation =
    {
      filename = "__planetaris-tellus__/graphics/entity/tellus-spawner/tellus-spawner-corpse.png",
      frame_count = 1,
      direction_count = 1,
      width = 448,
      height = 448,
      scale = 0.9
    }
  },
  {
    type = "corpse",
    name = "tellus-spawner-corpse-small",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    icon = "__planetaris-tellus__/graphics/icons/tellus-spawner.png",
    collision_box = {{-1.35, -1.35}, {1.35, 1.35}},
    collision_mask = {layers={}, colliding_with_tiles_only=true}, -- can go in water
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    selectable_in_game = false,
    dying_speed = 0.015,
    time_before_removed = 15 * 60 * 60,
    subgroup="corpses",
    order = "c[corpse]-d[tellus-enemies-corpses]-a[spawner]-a[small]",
    animation =
    {
      filename = "__planetaris-tellus__/graphics/entity/tellus-spawner/tellus-spawner-corpse.png",
      frame_count = 1,
      direction_count = 1,
      width = 448,
      height = 448,
      scale = 0.4,
      surface = "any",
      usage = "corpse-decay"
    }
  },
  make_particle
  {
    name = "pentapod-entrails-particle-small",
    life_time = 300,
    pictures = particle_animations.get_pentpod_entrails_particles({ scale = 0.6}),
    shadows = particle_animations.get_pentpod_entrails_particles({ scale = 0.6, tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow",
  },
  make_particle
  {
    name = "pentapod-entrails-particle-medium",
    life_time = 300,
    pictures = particle_animations.get_pentpod_entrails_particles({ scale = 0.8}),
    shadows = particle_animations.get_pentpod_entrails_particles({ scale = 0.8, tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow"
  },
  make_particle
  {
    name = "pentapod-entrails-particle-big",
    life_time = 300,
    pictures = particle_animations.get_pentpod_entrails_particles({ scale = 1}),
    shadows = particle_animations.get_pentpod_entrails_particles({ scale = 1, tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow"
  }
})



----------------- Wasp



data:extend(
{
  {
    type = "unit",
    name = "small-wasp",
    icon = "__planetaris-tellus__/graphics/icons/small-wasp.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "not-repairable", "breaths-air"},
    max_health = 375,
    order = "t-a",
    subgroup = "enemies",
    factoriopedia_simulation = simulations.factoriopedia_small_biter,
    resistances = {},
    healing_per_tick = 0.03,
    collision_mask = {layers={player=true, train=true, is_object=true, is_lower_object=true}},
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.4, -0.7}, {0.4, 0.4}},
    damaged_trigger_effect = hit_effects.biter(),
    attack_parameters =
    {
      type = "projectile",
      range = 0.5,
      cooldown = 35,
      cooldown_deviation = 0.15,
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(30),
      sound = sounds.biter_roars(0.35),
      animation = waspattackanimation(small_biter_scale),
      range_mode = "bounding-box-to-bounding-box"
    },
    has_belt_immunity = true,
    impact_category = "organic",
    vision_distance = 30,
    movement_speed = 0.2,
    distance_per_frame = 0.125,
    absorptions_to_join_attack = { pollen = 4 },
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    corpse = "small-wasp-corpse",
    dying_explosion = "small-strafer-pentapod-die",
    dying_sound = sounds.biter_dying(0.5),
    working_sound = sounds.biter_calls(0.4, 0.75),
    run_animation = Wasprunanimation(small_biter_scale),
    running_sound_animation_positions = {2,},
    walking_sound = planetaris_sounds.wasp_fly_small(0.4, 0.6),
    ai_settings = biter_ai_settings,
    water_reflection = biter_water_reflection(small_biter_scale)
  },
  {
    type = "unit",
    name = "medium-wasp",
    icon = "__planetaris-tellus__/graphics/icons/medium-wasp.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 900,
    order = "t-b",
    subgroup = "enemies",
    factoriopedia_simulation = simulations.factoriopedia_medium_biter,
    resistances =
    {
      {
        type = "physical",
        decrease = 2,
        percent = 10
      },
      {
        type = "laser",
        percent = 50
      },
      {
        type = "impact",
        percent = 30
      }
    },
    has_belt_immunity = true,
    impact_category = "organic",
    healing_per_tick = 0.02,
    collision_mask = {layers={train=true}},
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.7, -1.5}, {0.7, 0.3}},
    damaged_trigger_effect = hit_effects.biter(),
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(60),
      range = 1,
      cooldown = 35,
      cooldown_deviation = 0.15,
      sound = sounds.biter_roars_mid(0.73),
      animation = waspattackanimation(medium_biter_scale),
      range_mode = "bounding-box-to-bounding-box"
    },
    vision_distance = 35,
    movement_speed = 0.24,
    distance_per_frame = 0.188,
    -- in pu
    absorptions_to_join_attack = { pollen = 20 },
    corpse = "medium-wasp-corpse",
    dying_explosion = "medium-strafer-pentapod-die",
    working_sound = sounds.biter_calls(0.4, 0.9),
    dying_sound = sounds.biter_dying(0.6),
    run_animation = Wasprunanimation(medium_biter_scale),
    running_sound_animation_positions = {2,},
    walking_sound = planetaris_sounds.wasp_fly_medium(0.5, 0.7),
    ai_settings = biter_ai_settings,
    water_reflection = biter_water_reflection(medium_biter_scale)
  },

  {
    type = "unit",
    name = "big-wasp",
    order="t-c",
    icon = "__planetaris-tellus__/graphics/icons/big-wasp.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 2000,
    subgroup = "enemies",
    factoriopedia_simulation = simulations.factoriopedia_big_biter,
    impact_category = "organic",
    resistances =
    {
      {
        type = "physical",
        decrease = 2,
        percent = 10
      },
      {
        type = "laser",
        percent = 60
      },
      {
        type = "impact",
        percent = 40
      },
      {
        type = "fire",
        decrease = 2,
        percent = 10
      }
    },
    has_belt_immunity = true,
    spawning_time_modifier = 3,
    healing_per_tick = 0.02,
    collision_mask = {layers={train=true}},
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.7, -1.5}, {0.7, 0.3}},
    damaged_trigger_effect = hit_effects.biter(),
    sticker_box = {{-0.6, -0.8}, {0.6, 0}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    attack_parameters =
    {
      type = "projectile",
      range = 1.5,
      cooldown = 35,
      cooldown_deviation = 0.15,
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(90),
      sound =  sounds.biter_roars_big(0.37),
      animation = waspattackanimation(big_biter_scale),
      range_mode = "bounding-box-to-bounding-box"
    },
    vision_distance = 40,
    movement_speed = 0.23,
    distance_per_frame = 0.30,
    -- in pu
    absorptions_to_join_attack = { pollen = 80 },
    corpse = "big-wasp-corpse",
    dying_explosion = "big-strafer-pentapod-die",
    working_sound = sounds.biter_calls_big(0.4, 0.7),
    dying_sound = sounds.biter_dying_big(0.45),
    run_animation = Wasprunanimation(big_biter_scale),
    running_sound_animation_positions = {2,},
    walking_sound = planetaris_sounds.wasp_fly_big(0.6, 0.8),
    ai_settings = biter_ai_settings,
    water_reflection = biter_water_reflection(big_biter_scale)
  },

  {
    type = "unit",
    name = "behemoth-wasp",
    order="t-d",
    icon = "__planetaris-tellus__/graphics/icons/behemoth-wasp.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 4000,
    subgroup = "enemies",
    factoriopedia_simulation = simulations.factoriopedia_behemoth_biter,
    resistances =
    {
      {
        type = "physical",
        decrease = 2,
        percent = 10
      },
      {
        type = "laser",
        percent = 75
      },
      {
        type = "impact",
        percent = 50
      },
      {
        type = "fire",
        decrease = 2,
        percent = 20
      }
    },
    impact_category = "organic",
    has_belt_immunity = true,
    spawning_time_modifier = 12,
    healing_per_tick = 0.05,
    collision_mask = {layers={train=true}},
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.7, -1.5}, {0.7, 0.3}},
    damaged_trigger_effect = hit_effects.biter(),
    sticker_box = {{-0.6, -0.8}, {0.6, 0}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    attack_parameters =
    {
      type = "projectile",
      range = 1.5,
      cooldown = 35,
      cooldown_deviation = 0.15,
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(120),
      sound =  sounds.biter_roars_behemoth(0.65),
      animation = waspattackanimation(behemoth_biter_scale),
      range_mode = "bounding-box-to-bounding-box"
    },
    vision_distance = 45,
    movement_speed = 0.3,
    distance_per_frame = 0.32,
    -- in pu
    absorptions_to_join_attack = { pollen = 400 },
    corpse = "behemoth-wasp-corpse",
    dying_explosion = "big-strafer-pentapod-die",
    working_sound = sounds.biter_calls_behemoth(0.5, 0.9),
    dying_sound = sounds.biter_dying_big(0.52),
    run_animation = Wasprunanimation(behemoth_biter_scale),
    running_sound_animation_positions = {2,},
    walking_sound = planetaris_sounds.wasp_fly_behemoth(0.6, 0.8),
    ai_settings = biter_ai_settings,
    water_reflection = biter_water_reflection(behemoth_biter_scale)
  },
  add_wasp_die_animation(small_biter_scale,
  {
    type = "corpse",
    name = "small-wasp-corpse",
    icon = "__base__/graphics/icons/small-biter-corpse.png",
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selectable_in_game = false,
    hidden_in_factoriopedia = true,
    subgroup="corpses",
    order = "c[corpse]-a[biter]-a[small]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"}
  }),
  add_wasp_die_animation(medium_biter_scale,
  {
    type = "corpse",
    name = "medium-wasp-corpse",
    icon = "__base__/graphics/icons/small-biter-corpse.png",
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selectable_in_game = false,
    hidden_in_factoriopedia = true,
    subgroup="corpses",
    order = "c[corpse]-a[biter]-a[small]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"}
  }),
  add_wasp_die_animation(big_biter_scale,
  {
    type = "corpse",
    name = "big-wasp-corpse",
    icon = "__base__/graphics/icons/small-biter-corpse.png",
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selectable_in_game = false,
    hidden_in_factoriopedia = true,
    subgroup="corpses",
    order = "c[corpse]-a[biter]-a[small]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"}
  }),
  add_wasp_die_animation(behemoth_biter_scale,
  {
    type = "corpse",
    name = "behemoth-wasp-corpse",
    icon = "__base__/graphics/icons/small-biter-corpse.png",
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selectable_in_game = false,
    hidden_in_factoriopedia = true,
    subgroup="corpses",
    order = "c[corpse]-a[biter]-a[small]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"}
  }),
})