local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
local simulations = require("__base__.prototypes.factoriopedia-simulations")
local planetaris_simulations = require("__planetaris-tellus__.prototypes.factoriopedia-simulations")

local robot_animations = {}

robot_animations.sparks =
{
  {
    filename = "__base__/graphics/entity/sparks/sparks-01.png",
    draw_as_glow = true,
    width = 39,
    height = 34,
    frame_count = 19,
    line_length = 19,
    shift = {-0.109375, 0.3125},
    tint = {1.0, 0.9, 0.0, 1.0},
    animation_speed = 0.3
  },
  {
    filename = "__base__/graphics/entity/sparks/sparks-02.png",
    draw_as_glow = true,
    width = 36,
    height = 32,
    frame_count = 19,
    line_length = 19,
    shift = {0.03125, 0.125},
    tint = {1.0, 0.9, 0.0, 1.0},
    animation_speed = 0.3
  },
  {
    filename = "__base__/graphics/entity/sparks/sparks-03.png",
    draw_as_glow = true,
    width = 42,
    height = 29,
    frame_count = 19,
    line_length = 19,
    shift = {-0.0625, 0.203125},
    tint = {1.0, 0.9, 0.0, 1.0},
    animation_speed = 0.3
  },
  {
    filename = "__base__/graphics/entity/sparks/sparks-04.png",
    draw_as_glow = true,
    width = 40,
    height = 35,
    frame_count = 19,
    line_length = 19,
    shift = {-0.0625, 0.234375},
    tint = {1.0, 0.9, 0.0, 1.0},
    animation_speed = 0.3
  },
  {
    filename = "__base__/graphics/entity/sparks/sparks-05.png",
    draw_as_glow = true,
    width = 39,
    height = 29,
    frame_count = 19,
    line_length = 19,
    shift = {-0.109375, 0.171875},
    tint = {1.0, 0.9, 0.0, 1.0},
    animation_speed = 0.3
  },
  {
    filename = "__base__/graphics/entity/sparks/sparks-06.png",
    draw_as_glow = true,
    width = 44,
    height = 36,
    frame_count = 19,
    line_length = 19,
    shift = {0.03125, 0.3125},
    tint = {1.0, 0.9, 0.0, 1.0},
    animation_speed = 0.3
  }
}

robot_animations.logistic_robowasp =
{
  idle =
  {
    filename = "__planetaris-tellus__/graphics/entity/logistic-robowasp/logistic-robowasp.png",
    priority = "high",
    line_length = 16,
    width = 192,
    height = 192,
    shift = util.by_pixel(0, -3),
    direction_count = 16,
    y = 0,
    scale = 0.25
  },
  idle_with_cargo =
  {
    filename = "__planetaris-tellus__/graphics/entity/logistic-robowasp/logistic-robowasp.png",
    priority = "high",
    line_length = 16,
    width = 192,
    height = 192,
    shift = util.by_pixel(0, -3),
    direction_count = 16,
    y = 192 * 1,
    scale = 0.25
  },
  in_motion =
  {
    filename = "__planetaris-tellus__/graphics/entity/logistic-robowasp/logistic-robowasp.png",
    priority = "high",
    line_length = 16,
    width = 192,
    height = 192,
    shift = util.by_pixel(0, -3),
    direction_count = 16,
    y = 192 * 2,
    scale = 0.25
  },
  in_motion_with_cargo =
  {
    filename = "__planetaris-tellus__/graphics/entity/logistic-robowasp/logistic-robowasp.png",
    priority = "high",
    line_length = 16,
    width = 192,
    height = 192,
    shift = util.by_pixel(0, -3),
    direction_count = 16,
    y = 192 * 3,
    scale = 0.25
  },
  shadow_idle =
  {
    filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 115,
    height = 57,
    shift = util.by_pixel(31.75, 19.75),
    direction_count = 16,
    y = 57,
    scale = 0.5,
    draw_as_shadow = true
  },
  shadow_idle_with_cargo =
  {
    filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 115,
    height = 57,
    shift = util.by_pixel(31.75, 19.75),
    direction_count = 16,
    scale = 0.5,
    draw_as_shadow = true
  },
  shadow_in_motion =
  {
    filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 115,
    height = 57,
    shift = util.by_pixel(31.75, 19.75),
    direction_count = 16,
    y = 57*3,
    scale = 0.5,
    draw_as_shadow = true
  },
  shadow_in_motion_with_cargo =
  {
    filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 115,
    height = 57,
    shift = util.by_pixel(31.75, 19.75),
    direction_count = 16,
    y = 114,
    scale = 0.5,
    draw_as_shadow = true
  }
}

function robot_reflection(scale)
  return
  {
    pictures =
    {
      filename = "__base__/graphics/entity/construction-robot/construction-robot-reflection.png",
      priority = "extra-high",
      width = 12,
      height = 12,
      shift = util.by_pixel(0, 105),
      variation_count = 1,
      scale = 5 * scale
    },
    rotate = false,
    orientation_to_variation = false
  }
end


local robots =
{
  {
    type = "logistic-robot",
    name = "planetaris-logistic-robowasp",
    icon = "__planetaris-tellus__/graphics/icons/logistic-robowasp.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {mining_time = 0.1, result = "planetaris-logistic-robowasp"},
    is_military_target = false,
    resistances =
    {
      {
        type = "fire",
        percent = 85
      }
    },
    max_health = 250,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    hit_visualization_box = {{-0.1, -1.1}, {0.1, -1.0}},
    damaged_trigger_effect = hit_effects.flying_robot(),
    dying_explosion = "logistic-robot-explosion",
    factoriopedia_simulation = planetaris_simulations.factoriopedia_logistic_robot,
    max_payload_size = 3,
    speed = 0.075, -- 0.05 
    max_energy = "2.5MJ", -- 1.5
    energy_per_tick = "0.045kJ", -- 0.05
    speed_multiplier_when_out_of_energy = 0.25,
    energy_per_move = "5kJ",
    min_to_charge = 0.2,
    max_to_charge = 0.95,
    working_sound = sounds.flying_robot(0.48),
    charging_sound = sounds.robot_charging,
    icon_draw_specification = {shift = {0, -0.2}, scale = 0.5, render_layer = "air-entity-info-icon"},
    water_reflection = robot_reflection(1),
    idle = robot_animations.logistic_robowasp.idle,
    idle_with_cargo = robot_animations.logistic_robowasp.idle_with_cargo,
    in_motion = robot_animations.logistic_robowasp.in_motion,
    in_motion_with_cargo = robot_animations.logistic_robowasp.in_motion_with_cargo,
    shadow_idle = robot_animations.logistic_robowasp.shadow_idle,
    shadow_idle_with_cargo = robot_animations.logistic_robowasp.shadow_idle_with_cargo,
    shadow_in_motion = robot_animations.logistic_robowasp.shadow_in_motion,
    shadow_in_motion_with_cargo = robot_animations.logistic_robowasp.shadow_in_motion_with_cargo
  },    
}

data:extend(robots)

local shadow_shift = {-0.75, -0.40}
local animation_shift = {0, 0}

local adjust_animation = function(animation)

  local animation = util.copy(animation)
  local layers = animation.layers or {animation}

  for k, layer in pairs (layers) do
    layer.frame_count = layer.direction_count
    layer.direction_count = nil
    layer.animation_speed = 1
    layer.shift = util.add_shift(layer.shift, animation_shift)
  end

  return animation
end

local adjust_shadow = function(shadow_animation)

  local shadow_animation = util.copy(shadow_animation)
  local layers = shadow_animation.layers or {shadow_animation}

  for k, layer in pairs (layers) do
    layer.frame_count = layer.direction_count
    layer.direction_count = nil
    layer.animation_speed = 1
    layer.shift = util.add_shift(layer.shift, shadow_shift)
  end

  return shadow_animation
end

local reversed = function(animation)
  local animation = util.copy(animation)
  local layers = animation.layers or {animation}

  for k, layer in pairs (layers) do
    layer.run_mode = "backward"
  end

  return animation
end

local make_robot_particle = function(prototype)

  local particle_name = prototype.name.."-dying-particle"

  if not prototype.in_motion then return end
  local animation = adjust_animation(prototype.in_motion)
  if not prototype.shadow_in_motion then return end
  local shadow_animation = adjust_shadow(prototype.shadow_in_motion)

  local particle =
  {
    type = "optimized-particle",
    name = particle_name,
    pictures = {animation, reversed(animation)},
    shadows = {shadow_animation, reversed(shadow_animation)},
    movement_modifier = 0.95,
    life_time = 1000,
    regular_trigger_effect_frequency = 2,
    regular_trigger_effect =
    {
      {
        type = "create-trivial-smoke",
        smoke_name = "smoke-fast",
        starting_frame_deviation = 5,
        probability = 0.5
      },
      {
        type = "create-particle",
        particle_name = "spark-particle",
        tail_length = 10,
        tail_length_deviation = 5,
        tail_width = 5,
        probability = 0.2,
        initial_height = 0.2,
        initial_vertical_speed = 0.15,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.1,
        speed_from_center_deviation = 0.05,
        offset_deviation = {{-0.25, -0.25},{0.25, 0.25}}
      }
    },
    ended_on_ground_trigger_effect =
    {
      {
      type = "create-entity",
      entity_name = prototype.name.."-remnants",
      offsets = {{0, 0}}
      },
      {
        type = "play-sound",
        sound = sounds.robot_die_impact
      }
    }
  }

  data:extend{particle}

  prototype.dying_trigger_effect =
  {
    {
      type = "create-particle",
      particle_name = particle_name,
      initial_height = 1.8,
      initial_vertical_speed = 0,
      frame_speed = 1,
      frame_speed_deviation = 0.5,
      speed_from_center = 0,
      speed_from_center_deviation = 0.2,
      offset_deviation = {{-0.01, -0.01},{0.01, 0.01}},
      offsets = {{0, 0.5}}
    },
    {
      type = "play-sound",
      sound = sounds.robot_die_whoosh
    },
    {
      type = "play-sound",
      sound = sounds.robot_die_vox
    }
  }

  if prototype.type == "construction-robot" or prototype.type == "logistic-robot" then return end

  prototype.destroy_action =
  {
    type = "direct",
    action_delivery =
    {
      type = "instant",
      source_effects =
      {
        {
          type = "create-particle",
          particle_name = particle_name,
          initial_height = 1.8,
          initial_vertical_speed = 0,
          frame_speed = 0.5,
          frame_speed_deviation = 0.5,
          speed_from_center = 0,
          speed_from_center_deviation = 0.1,
          offset_deviation = {{-0.01, -0.01},{0.01, 0.01}},
          offsets = {{0, 0.5}}
        },
        {
          type = "play-sound",
          sound = sounds.robot_die_whoosh
        },
        {
          type = "play-sound",
          sound = sounds.robot_die_vox
        },
        {
          type = "play-sound",
          sound = sounds.robot_selfdestruct
        }
      }
    }
  }

end

for k, robot in pairs (robots) do
  make_robot_particle(robot)
end
