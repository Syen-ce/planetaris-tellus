local sounds = require("__base__.prototypes.entity.sounds")
local particle_animations = require("__space-age__/prototypes/particle-animations")


local small_dust_smoke_trigger_effect = function()
  return
  {
    type = "create-trivial-smoke",
    smoke_name = "smoke-explosion-particle-stone-small",
    starting_frame_deviation = 0,
    offset_deviation = {{-0.03, -0.03}, {0.03, 0.03}},
    speed_from_center = nil
  }
end

local gleba_tree_pink_smoke_trigger_effect = function()
  return
  {
    type = "create-trivial-smoke",
    smoke_name = "gleba-tree-particle-smoke-pink",
    starting_frame_deviation = 0,
    offset_deviation = {{-0.03, -0.03}, {0.03, 0.03}},
    speed_from_center = nil
  }
end

local gleba_tree_red_smoke_trigger_effect = function()
  return
  {
    type = "create-trivial-smoke",
    smoke_name = "gleba-tree-particle-smoke-red",
    starting_frame_deviation = 0,
    offset_deviation = {{-0.03, -0.03}, {0.03, 0.03}},
    speed_from_center = nil
  }
end

local gleba_tree_blue_smoke_trigger_effect = function()
  return
  {
    type = "create-trivial-smoke",
    smoke_name = "gleba-tree-particle-smoke-blue",
    starting_frame_deviation = 0,
    offset_deviation = {{-0.03, -0.03}, {0.03, 0.03}},
    speed_from_center = nil
  }
end

local gleba_tree_orange_smoke_trigger_effect = function()
  return
  {
    type = "create-trivial-smoke",
    smoke_name = "gleba-tree-particle-smoke-orange",
    starting_frame_deviation = 0,
    offset_deviation = {{-0.03, -0.03}, {0.03, 0.03}},
    speed_from_center = nil
  }
end

local gleba_tree_grey_sap_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      probability = 0.5,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "gleba-tree-sap-particle-trigger-grey",
      offset_deviation = { { -0.02, -0.02 }, { 0.02, 0.02 } },
      initial_height = 0,
      initial_height_deviation = 0.01,
      initial_vertical_speed = 0,
      initial_vertical_speed_deviation = 0.00,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0,
      tail_length = 2,
      tail_length_deviation = 1,
      tail_width = 4,
      only_when_visible = true
    }
  }
end

local gleba_tree_red_sap_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      probability = 0.5,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "gleba-tree-sap-particle-trigger-red",
      offset_deviation = { { -0.02, -0.02 }, { 0.02, 0.02 } },
      initial_height = 0,
      initial_height_deviation = 0.01,
      initial_vertical_speed = 0,
      initial_vertical_speed_deviation = 0.00,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0,
      tail_length = 2,
      tail_length_deviation = 1,
      tail_width = 4,
      only_when_visible = true
    }
  }
end

local gleba_tree_blue_sap_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      probability = 0.4,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "gleba-tree-sap-particle-trigger-blue",
      offset_deviation = { { -0.001, -0.001 }, { 0.001, 0.001 } },
      initial_height = 0,
      initial_height_deviation = 0.001,
      initial_vertical_speed = 0,
      initial_vertical_speed_deviation = 0.00,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0,
      frame_speed = 1,
      frame_speed_deviation = 0,
      tail_length = 2,
      tail_length_deviation = 0,
      tail_width = 1,
      only_when_visible = true
    }
  }
end

local gleba_tree_green_sap_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      probability = 0.5,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "gleba-tree-sap-particle-trigger-green",
      offset_deviation = { { -0.02, -0.02 }, { 0.02, 0.02 } },
      initial_height = 0,
      initial_height_deviation = 0.01,
      initial_vertical_speed = 0,
      initial_vertical_speed_deviation = 0.00,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0,
      tail_length = 2,
      tail_length_deviation = 1,
      tail_width = 4,
      only_when_visible = true
    }
  }
end

local gleba_tree_leaf_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      probability = 0.1,
      repeat_count = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "gleba-tree-leaf-particle-trigger",
      offset_deviation = { { -0.02, -0.02 }, { 0.02, 0.02 } },
      initial_height = 0,
      initial_height_deviation = 0.01,
      initial_vertical_speed = 0,
      initial_vertical_speed_deviation = 0.00,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0.5,
      tail_length = 1,
      tail_length_deviation = 1,
      tail_width = 1,
      only_when_visible = true
    }
  }
end

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
      tail_width = 3,
      only_when_visible = true
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
      tail_width = 1,
      only_when_visible = true
    },
    {
      type = "play-sound",
      sound = sounds.small_splash
    }
  }

end

local particle_ended_in_water_trigger_effect = function()
  return
  {
    type = "create-particle",
    repeat_count = 5,
    repeat_count_deviation = 4,
    probability = 0.05,
    affects_target = false,
    show_in_tooltip = false,
    particle_name = "tintable-water-particle",
    apply_tile_tint = "secondary",
    offsets = { { 0, 0 } },
    offset_deviation = { { -0.2969, -0.2969 }, { 0.2969, 0.2969 } },
    tile_collision_mask = nil,
    initial_height = 0.1,
    initial_height_deviation = 0.5,
    initial_vertical_speed = 0.06,
    initial_vertical_speed_deviation = 0.069,
    speed_from_center = 0.02,
    speed_from_center_deviation = 0.05,
    frame_speed = 1,
    frame_speed_deviation = 0,
    tail_length = 9,
    tail_length_deviation = 8,
    tail_width = 1,
    only_when_visible = true
  }
end

local make_particle = function(params)

  if not params then error("No params given to make_particle function") end
  local name = params.name or error("No name given")

  local ended_in_water_trigger_effect = params.ended_in_water_trigger_effect or default_ended_in_water_trigger_effect()
  if params.ended_in_water_trigger_effect == false then
    ended_in_water_trigger_effect = nil
  end

  local tellus_particles =
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

  return tellus_particles

end

local tellus_particles =
{

  make_particle
  {
    name = "bioassembler-leaf-particle",
    life_time = 120,
    pictures = particle_animations.get_gleba_tree_spongy_particle_pictures({tint = {0.7451, 0.3882, 0.149, 1.0}, tint_as_overlay = true, scale = 1}),
    shadows = particle_animations.get_gleba_tree_spongy_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0), scale = 1}),
    regular_trigger_effect = gleba_tree_orange_smoke_trigger_effect(),
    ended_in_water_trigger_effect = particle_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "bioassembler-branch-particle",
    life_time = 120,
    pictures = particle_animations.get_gleba_tree_wooden_particle_pictures({tint = {0.6706, 0.5255, 0.3451, 1.0}, tint_as_overlay = true, scale = 1.2}),
    shadows = particle_animations.get_gleba_tree_wooden_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0), scale = 1.2}),
    regular_trigger_effect = small_dust_smoke_trigger_effect(),
    ended_in_water_trigger_effect = particle_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "bioassembler-mining-particle",
    life_time = 120,
    pictures = particle_animations.get_gleba_tree_wooden_particle_pictures({tint = {0.6706, 0.5255, 0.3451, 1.0}, tint_as_overlay = true, scale = 0.5}),
    shadows = particle_animations.get_gleba_tree_wooden_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0), scale = 0.5}),
    regular_trigger_effect = small_dust_smoke_trigger_effect(),
    ended_in_water_trigger_effect = particle_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

}

data:extend(tellus_particles)