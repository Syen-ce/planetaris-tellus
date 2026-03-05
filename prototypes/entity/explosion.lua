local explosion_animations = require("__base__.prototypes.entity.explosion-animations")
local smoke_animations = require("__base__.prototypes.entity.smoke-animations")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require ("__space-age__.prototypes.entity.sounds")
local simulations = require("prototypes.factoriopedia-simulations")

data:extend({
  -----------------------------------------------------------------------------
      {
    type = "explosion",
    name = "planetaris-bioassembler-explosion",
    icon = "__planetaris-tellus__/graphics/icons/bioassembler.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "production-machine-explosions",
    order = "d-e-a",
    height = 0,
    animations = {
                    width = 2024 / 8,
                    height = 1680 / 8,
                    line_length = 8,
                    frame_count = 60,
                    shift = {-0.5, -0.5},
                    priority = "high",
                    animation_speed = 1.2,
                    filename = "__planetaris-tellus__/graphics/particles/bioassembler-smoke.png",
                    flags = { "smoke" },
                    scale = 1
                },
    -- smoke = {
    --             type = "trivial-smoke",
    --             name = "bioassembler-smoke",
    --             color = {1, 1, 1},
    --             duration = 20,
    --             fade_in_duration = 3,
    --             fade_away_duration = 3,
    --             start_scale = 0.05,
    --             end_scale = 0.05,
    --             render_layer = "higher-object-under",
    --             affected_by_wind = true,
    --             cyclic =  true,
    --             animation = {
    --                 width = 2024 / 8,
    --                 height = 1680 / 8,
    --                 line_length = 8,
    --                 frame_count = 60,
    --                 shift = {0, 0},
    --                 priority = "high",
    --                 animation_speed = 0.5,
    --                 filename = "__planetaris-tellus__/graphics/particles/bioassembler-smoke.png",
    --                 flags = { "smoke" },
    --                 scale = 1
    --             }
    --         },
    --smoke_count = 2,
    --smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 18,
            particle_name = "chemical-plant-metal-particle-big",
            offset_deviation = { { -0.6875, -0.6875 }, { 0.6875, 0.6875 } },
            initial_height = 0.2,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 31,
            particle_name = "chemical-plant-metal-particle-medium",
            offset_deviation = { { -0.9805, -0.8945 }, { 0.9805, 0.8945 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.101,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 26,
            particle_name = "chemical-plant-metal-particle-small",
            offset_deviation = { { -0.9961, -0.5938 }, { 0.9961, 0.5938 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.072,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 43,
            particle_name = "chemical-plant-glass-particle-small",
            offsets = { { 0.7109, 0.7578 } },
            offset_deviation = { { -0.5, -0.2969 }, { 0.5, 0.2969 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.096,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 40,
            particle_name = "chemical-plant-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.085,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.06,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },
})