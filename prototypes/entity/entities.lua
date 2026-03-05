require ("util")
require ("circuit-connector-sprites")
require ("__space-age__/prototypes/entity/circuit-network")
require ("__base__/prototypes/entity/circuit-network")
require ("__planetaris-tellus__/prototypes/entity/circuit-connector-definitions")
require ("__base__/prototypes/entity/pipecovers")
require ("__planetaris-tellus__/prototypes/entity/planetaris-cover-pictures")

local sounds = require("__base__/prototypes/entity/sounds")
local hit_effects = require("__base__/prototypes/entity/hit-effects")
local simulations = require("__base__.prototypes.factoriopedia-simulations")
local planetaris_simulations = require("__planetaris-tellus__.prototypes.factoriopedia-simulations")
local biochamber_pictures = require("__space-age__.prototypes.entity.biochamber-pictures")

data.extend({
{
    type = "container",
    name = "planetaris-logo-16tiles",
    icon = "__base__/graphics/icons/factorio-logo-16tiles.png",
    flags = {"placeable-neutral", "player-creation"},
    hidden = true,
    minable = {mining_time = 0.1},
    max_health = 666,
    collision_box = {{-8+0.15, -1+0.15}, {8-0.15, 1-0.15}},
    selection_box = {{-8, -1}, {8, 1}},
    inventory_size = 1,
    picture =
    {
      filename = "__planetaris-tellus__/graphics/entity/planetaris-logo/planetaris-tellus-logo-16tiles-ng.png",
      priority = "very-low",
      width = 2164,
      height = 295,
      shift = util.by_pixel(8, -5),
      scale = 0.30
    },
    resistances =
    {
      {
        type = "fire",
        decrease = 0,
        percent = 100
      },
      {
        type = "physical",
        decrease = 0,
        percent = 100
      },
      {
        type = "impact",
        decrease = 0,
        percent = 100
      },
      {
        type = "explosion",
        decrease = 0,
        percent = 100
      },
      {
        type = "acid",
        decrease = 0,
        percent = 100
      },
      {
        type = "laser",
        decrease = 0,
        percent = 100
      },
      {
        type = "electric",
        decrease = 0,
        percent = 100
      },
    },
  },
  {
    type = "pump",
    name = "planetaris-root-pump",
    icon = "__planetaris-tellus__/graphics/icons/root-pump.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.2, result = "planetaris-root-pump"},
    max_health = 80,
    fast_replaceable_group = "root",
    corpse = "pump-remnants",
    dying_explosion = "pump-explosion",
    collision_box = {{-0.29, -0.9}, {0.29, 0.9}},
    selection_box = {{-0.5, -1}, {0.5, 1}},
    icon_draw_specification = {scale = 0.5},
    working_sound =
    {
      sound = {filename = "__base__/sound/pump.ogg", volume = 0.3, audible_distance_modifier = 0.5},
      max_sounds_per_prototype = 2
    },
    damaged_trigger_effect = hit_effects.entity(),
    resistances =
    {
      {
        type = "impact",
        percent = 60
      }
    },
    fluid_box =
    {
      volume = 200,
      pipe_covers = planetaris_pump_root_cover_pictures(),
      pipe_connections =
      {
        { direction = defines.direction.north, position = {0, -0.5}, flow_direction = "output", connection_category = "root" },
        { direction = defines.direction.south, position = {0, 0.5}, flow_direction = "input", connection_category = "root" }
      }
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "1kW"
    },
    energy_usage = "25kW",
    pumping_speed = 15,
    impact_category = "metal",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,

    animations =
    {
      north =
      {
        filename = "__planetaris-tellus__/graphics/entity/root-pump/root-pump-north.png",
        width = 103,
        height = 164,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        animation_speed = 0.5,
        shift = util.by_pixel(8, -0.85)
      },
      east =
      {
        filename = "__planetaris-tellus__/graphics/entity/root-pump/root-pump-east.png",
        width = 130,
        height = 109,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        animation_speed = 0.5,
        shift = util.by_pixel(-0.5, 1.75)
      },

      south =
      {
        filename = "__planetaris-tellus__/graphics/entity/root-pump/root-pump-south.png",
        width = 114,
        height = 160,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        animation_speed = 0.5,
        shift = util.by_pixel(12.5, -8)
      },
      west =
      {
        filename = "__planetaris-tellus__/graphics/entity/root-pump/root-pump-west.png",
        width = 131,
        height = 111,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        animation_speed = 0.5,
        shift = util.by_pixel(-0.25, 1.25)
      }
    },

    fluid_wagon_connector_frame_count = 35,
    fluid_wagon_connector_alignment_tolerance = 2.0 / 32.0,

    fluid_wagon_connector_graphics = require("__base__/prototypes/entity/pump-connector"),

    fluid_animation =
    {
      north =
      {
        filename = "__base__/graphics/entity/pump/pump-north-liquid.png",
        apply_runtime_tint = true,
        width = 38,
        height = 22,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        shift = util.by_pixel(-0.250, -16.750)
      },

      east =
      {
        filename = "__base__/graphics/entity/pump/pump-east-liquid.png",
        width = 35,
        height = 46,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        shift = util.by_pixel(6.25, -8.5)
      },

      south =
      {
        filename = "__base__/graphics/entity/pump/pump-south-liquid.png",
        width = 38,
        height = 45,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        shift = util.by_pixel(0.5, -9.25)
      },
      west =
      {
        filename = "__base__/graphics/entity/pump/pump-west-liquid.png",
        width = 35,
        height = 47,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        shift = util.by_pixel(-6.5, -9.5)
      }
    },

    glass_pictures =
    {
      north =
      {
        filename = "__base__/graphics/entity/pump/pump-north-glass.png",
        width = 64,
        height = 128,
        scale = 0.5
      },
      east =
      {
        filename = "__base__/graphics/entity/pump/pump-east-glass.png",
        width = 128,
        height = 192,
        scale = 0.5
      },
      south =
      {
        filename = "__base__/graphics/entity/pump/pump-south-glass.png",
        width = 64,
        height = 128,
        scale = 0.5
      },
      west =
      {
        filename = "__base__/graphics/entity/pump/pump-west-glass.png",
        width = 192,
        height = 192,
        scale = 0.5,
        shift = util.by_pixel(-16, 0)
      }
    },

    circuit_connector = circuit_connector_definitions["pump"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  {
    type = "storage-tank",
    name = "planetaris-root-storage-tank",
    icon = "__planetaris-tellus__/graphics/icons/root-storage-tank.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "planetaris-root-storage-tank"},
    max_health = 500,
    corpse = "storage-tank-remnants",
    dying_explosion = "storage-tank-explosion",
    collision_box = {{-1.3, -1.3}, {1.3, 1.3}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "root-storage-tank",
    damaged_trigger_effect = hit_effects.entity(),
    resistances =
    {
      {
        type = "impact",
        percent = 60
      }
    },
    icon_draw_specification = {scale = 1.5, shift = {0, -0.3}},
    fluid_box =
    {
      volume = 25000,
      --pipe_covers = planetaris_root_cover_pictures(),
      pipe_connections =
      {
        { direction = defines.direction.north, position = {-1, -1}, connection_category = "root" },
        { direction = defines.direction.east, position = {1, 1}, connection_category = "root" },
        { direction = defines.direction.south, position = {1, 1}, connection_category = "root" },
        { direction = defines.direction.west, position = {-1, -1}, connection_category = "root" }
      },
      hide_connection_info = true
    },
    two_direction_only = true,
    window_bounding_box = {{-0.125, 0.6875}, {0.1875, 1.1875}},
    pictures =
    {
      picture =
      {
        sheets =
        {
          {
            filename = "__planetaris-tellus__/graphics/entity/root-storage-tank/root-storage-tank.png",
            priority = "extra-high",
            frames = 2,
            width = 219,
            height = 235,
            shift = util.by_pixel(-0.25, -1.25),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/storage-tank/storage-tank-shadow.png",
            priority = "extra-high",
            frames = 2,
            width = 291,
            height = 153,
            shift = util.by_pixel(29.75, 22.25),
            scale = 0.5,
            draw_as_shadow = true
          }
        }
      },
      fluid_background =
      {
        filename = "__base__/graphics/entity/storage-tank/fluid-background.png",
        priority = "extra-high",
        width = 32,
        height = 15
      },
      window_background =
      {
        filename = "__base__/graphics/entity/storage-tank/window-background.png",
        priority = "extra-high",
        width = 34,
        height = 48,
        scale = 0.5
      },
      flow_sprite =
      {
        filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
        priority = "extra-high",
        width = 160,
        height = 20
      },
      gas_flow =
      {
        filename = "__base__/graphics/entity/pipe/steam.png",
        priority = "extra-high",
        line_length = 10,
        width = 48,
        height = 30,
        frame_count = 60,
        animation_speed = 0.25,
        scale = 0.5
      }
    },
    flow_length_in_ticks = 360,
    impact_category = "metal-large",
    open_sound = sounds.metal_large_open,
    close_sound = sounds.metal_large_close,
    working_sound =
    {
      sound = {filename = "__base__/sound/storage-tank.ogg", volume = 0.6, audible_distance_modifier = 0.5},
      match_volume_to_activity = true,
      max_sounds_per_prototype = 3
    },

    circuit_connector = circuit_connector_definitions["storage-tank"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/storage-tank/storage-tank-reflection.png",
        priority = "extra-high",
        width = 24,
        height = 24,
        shift = util.by_pixel(5, 35),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  {
    type = "storage-tank",
    name = "planetaris-root-filler",
    icon = "__planetaris-tellus__/graphics/icons/root-filler.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "planetaris-root-filler"},
    max_health = 500,
    corpse = "storage-tank-remnants",
    dying_explosion = "storage-tank-explosion",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fast_replaceable_group = "root-filler",
    damaged_trigger_effect = hit_effects.entity(),
    resistances =
    {
      {
        type = "impact",
        percent = 60
      }
    },
    icon_draw_specification = {scale = 1.5, shift = {0, -0.3}},
    fluid_box =
    {
      volume = 2000,
      --pipe_covers = planetaris_root_cover_pictures(),
      pipe_connections =
      {
        { direction = defines.direction.east, position = {0, 0}, connection_category = "root" },
        { direction = defines.direction.west, position = {0, 0},},
      },
      hide_connection_info = false
    },
    two_direction_only = false,
    drawing_box_vertical_extension = 0.3,
    window_bounding_box = {{-0.1, -0.6875}, {0.1625, 0.1875}},
    pictures = {
      picture = make_4way_animation_from_spritesheet({ layers =
      {
        {
          filename = "__planetaris-tellus__/graphics/entity/root-filler/root-filler.png",
          width = 192,
          height = 192,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        },
        {
          filename = "__planetaris-tellus__/graphics/entity/root-filler/root-filler-shadow.png",
          width = 192,
          height = 192,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(0, 0),
          draw_as_shadow = true,
          scale = 0.5
        }
      }}),
      fluid_background =
      {
        filename = "__planetaris-tellus__/graphics/entity/root-filler/fluid-background.png",
        priority = "extra-high",
        width = 20,
        height = 15
      },
      window_background =
      {
        filename = "__planetaris-tellus__/graphics/entity/root-filler/window-background.png",
        priority = "extra-high",
        width = 34,
        height = 48,
        scale = 0.5
      },
      flow_sprite =
      {
        filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
        priority = "extra-high",
        width = 160,
        height = 20
      },
      gas_flow =
      {
        filename = "__base__/graphics/entity/pipe/steam.png",
        priority = "extra-high",
        line_length = 10,
        width = 48,
        height = 30,
        frame_count = 60,
        animation_speed = 0.25,
        scale = 0.5
      }
    },
    flow_length_in_ticks = 360,
    impact_category = "metal-large",
    open_sound = sounds.metal_large_open,
    close_sound = sounds.metal_large_close,
    working_sound =
    {
      sound = {filename = "__base__/sound/storage-tank.ogg", volume = 0.6, audible_distance_modifier = 0.5},
      match_volume_to_activity = true,
      max_sounds_per_prototype = 3
    },

    circuit_connector = circuit_connector_definitions["root-filler"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    water_reflection =
    {
      pictures =
      {
        filename = "__planetaris-tellus__/graphics/entity/root-filler/root-filler-reflection.png",
        priority = "extra-high",
        width = 232,
        height = 232,
        shift = util.by_pixel(0, 35),
        variation_count = 1,
        scale = 0.5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
{
    type = "pipe-to-ground",
    name = "planetaris-root-to-ground",
    icon = "__planetaris-tellus__/graphics/icons/root-to-ground.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "planetaris-root-to-ground"},
    max_health = 150,
    corpse = "pipe-to-ground-remnants",
    dying_explosion = "pipe-to-ground-explosion",
    factoriopedia_simulation = planetaris_simulations.factoriopedia_pipe_to_ground,
    icon_draw_specification = {scale = 0.5},
    resistances =
    {
      {
        type = "impact",
        percent = 60
      }

    },
    fast_replaceable_group = "root",
    collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
    collision_mask = {layers={item=true, object=true, water_tile=true, is_object=true, is_lower_object=true}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fluid_box =
    {
      volume = 100,
      pipe_covers = planetaris_underground_root_cover_pictures(),
      pipe_connections =
      {
        { direction = defines.direction.north, position = {0, 0}, connection_category = "root"  },
        {
          connection_type = "underground",
          direction = defines.direction.south,
          position = {0, 0},
          max_underground_distance = 10,
          connection_category = "root",
        }
      },
      hide_connection_info = true
    },
    impact_category = "metal",
    working_sound = sounds.pipe,
    open_sound = sounds.metal_small_open,
    close_sound = sounds.metal_small_close,
    pictures =
    {
      north =
      {
        filename = "__planetaris-tellus__/graphics/entity/root-to-ground/root-to-ground-up.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        scale = 0.5
      },
      south =
      {
        filename = "__planetaris-tellus__/graphics/entity/root-to-ground/root-to-ground-down.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        scale = 0.5
      },
      west =
      {
        filename = "__planetaris-tellus__/graphics/entity/root-to-ground/root-to-ground-left.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        scale = 0.5
      },
      east =
      {
        filename = "__planetaris-tellus__/graphics/entity/root-to-ground/root-to-ground-right.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        scale = 0.5
      }
    },
    visualization =
    {
      north =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/visualization.png",
        priority = "extra-high",
        x = 64,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      south =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/visualization.png",
        priority = "extra-high",
        x = 192,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      west =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/visualization.png",
        priority = "extra-high",
        x = 256,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      east =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/visualization.png",
        priority = "extra-high",
        x = 128,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
    },
    disabled_visualization =
    {
      north =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/disabled-visualization.png",
        priority = "extra-high",
        x = 64,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      south =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/disabled-visualization.png",
        priority = "extra-high",
        x = 192,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      west =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/disabled-visualization.png",
        priority = "extra-high",
        x = 256,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      east =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/disabled-visualization.png",
        priority = "extra-high",
        x = 128,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
    },
  },
  {
    type = "assembling-machine",
    name = "planetaris-air-purifier",
    icon = "__planetaris-tellus__/graphics/icons/air-purifier.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    subgroup = "tellus-production",
    order = "a-d",
    minable = {mining_time = 1, result = "planetaris-air-purifier", count = 1 },
    max_health = 500,
    corpse = "planetaris-bioassembler-remnant",
    dying_explosion = "assembling-machine-1-explosion",
    icon_draw_specification = {shift = {0, -0.3}},
    resistances =
    {
      {
        type = "impact",
        percent = 50
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    --damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = nil,
    next_upgrade = nil,
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["air-purifier"],
    alert_icon_shift = util.by_pixel(0, -12),
    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__planetaris-tellus__/graphics/entity/air-purifier/air-purifier.png",
            priority="high",
            width = 210,
            height = 280,
            line_length = 10,
            frame_count = 60,
            animation_speed = 1,
            shift = util.by_pixel(0, -12.75),
            scale = 0.45
          },
          {
            filename = "__planetaris-tellus__/graphics/entity/air-purifier/air-purifier-shadow.png",
            priority="high",
            width = 400,
            height = 350,
            repeat_count = 60,
            draw_as_shadow = true,
            shift = util.by_pixel(8.5, -8),
            scale = 0.45
          }
        }
      },
      working_visualisations = {
        {
        fadeout = true,
        animation =
                {
                    filename = "__planetaris-tellus__/graphics/entity/air-purifier/air-purifier-light.png",
                    priority = "high",
                    width = 210,
                    height = 280,
                    shift = util.by_pixel(0, -12.75),
                    frame_count = 60,
                    line_length = 10,
                    animation_speed = 1,
                    scale = 0.45,
                    draw_as_glow= true,
                    blend_mode= "additive",
                    flags = {"no-scale"}
                  }
        },
      },
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__planetaris-tellus__/graphics/entity/bioassembler/bioassembler-reflection.png",
        priority="high",
        width = 296,
        height = 296,
        shift = util.by_pixel(0, 15),
        variation_count = 1,
        scale = 0.5
      },
      rotate = false,
      orientation_to_variation = false
    },
    fixed_recipe = "planetaris-air-cleaning",
    crafting_categories = {"planetaris-air-cleaning"},
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "1MW",
      emissions_per_minute = { spores = -20,
                               pollen = -20 }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = planetaris_purifier_cover_pictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction="input",
            direction = defines.direction.north,
            position = {0, -1}
          }
        }
      },
      {
        production_type = "output",
        pipe_picture = planetaris_purifier_cover_pictures(),
        volume = 100,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.south,
            position = { 0, 1}
          }
        }
      }
    },
    energy_usage = "2MW",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    module_slots = 2,
    allowed_effects = {"speed", "consumption"},
    impact_category = "metal",
    working_sound =
    {
      sound = {filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.5, audible_distance_modifier = 0.5},
      fade_in_ticks = 4,
      fade_out_ticks = 20
    }
  },

    {
    type = "roboport",
    name = "planetaris-robowasp-port",
    icon = "__planetaris-tellus__/graphics/icons/robowasp-port.png",
    flags = {"placeable-player", "player-creation"},
    fast_replaceable_group = "roboport",
    minable = {mining_time = 0.1, result = "planetaris-robowasp-port"},
    max_health = 650,
    corpse = "roboport-remnants",
    dying_explosion = "roboport-explosion",
    collision_box = {{-1.7, -1.7}, {1.7, 1.7}},
    selection_box = {{-2, -2}, {2, 2}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.5,
    resistances =
    {
      {
        type = "fire",
        percent = 10
      },
      {
        type = "impact",
        percent = 80
      }
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      input_flow_limit = "5MW",
      buffer_capacity = "150MJ"
    },
    recharge_minimum = "40MJ",
    energy_usage = "75kW",
    -- per one charge slot
    charging_energy = "700kW",
    logistics_radius = 25 + 19,
    construction_radius = 55 + 19,
    charge_approach_distance = 5,
    robot_slots_count = 10,
    material_slots_count = 10,
    charging_offsets =
    {
      {-1.5, -1}, {1.5, -1}, {1.5, 1}, {-1.5, 1}
    },
    base =
    {
      layers =
      {
        {
          filename = "__planetaris-tellus__/graphics/entity/robowasp-port/robowasp-port.png",
          width = 613,
          height = 613,
          shift = util.by_pixel(0, -7.25),
          scale = 0.3
        },
        {
          filename = "__planetaris-tellus__/graphics/entity/robowasp-port/robowasp-port-shadow.png",
          width = 613,
          height = 295,
          draw_as_shadow = true,
          shift = util.by_pixel(28.5, 19.25),
          scale = 0.3
        }
      }
    },
    base_patch =
    {
      filename = "__planetaris-tellus__/graphics/entity/robowasp-port/robowasp-port-base-patch.png",
      priority = "medium",
      width = 173,
      height = 202,
      shift = util.by_pixel(0, -13),
      scale = 0.3
    },
    base_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-base-animation.png",
      priority = "medium",
      width = 83,
      height = 59,
      frame_count = 8,
      animation_speed = 0.5,
      shift = util.by_pixel(-16, -98.25),
      scale = 0.5
    },
    door_animation_up =
    {
      filename = "__planetaris-tellus__/graphics/entity/robowasp-port/robowasp-port-door-up.png",
      priority = "medium",
      width = 97,
      height = 38,
      frame_count = 16,
      shift = util.by_pixel(-0.25, -69.5 + 17.5),
      scale = 0.5
    },
    door_animation_down =
    {
      filename = "__planetaris-tellus__/graphics/entity/robowasp-port/robowasp-port-door-down.png",
      priority = "medium",
      width = 97,
      height = 41,
      frame_count = 16,
      shift = util.by_pixel(-0.25, -49.75 + 17.5),
      scale = 0.5
    },
    recharging_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
      draw_as_glow = true,
      priority = "high",
      width = 37,
      height = 35,
      frame_count = 16,
      scale = 1.5,
      animation_speed = 0.5,
    },
    impact_category = "metal",
    open_sound = {filename = "__base__/sound/open-close/roboport-open.ogg", volume = 0.5},
    close_sound = {filename = "__base__/sound/open-close/roboport-close.ogg", volume = 0.4},
    working_sound =
    {
      sound = {filename = "__base__/sound/roboport-working.ogg", volume = 0.4, audible_distance_modifier = 0.75},
      max_sounds_per_prototype = 3,
    },
    recharging_light = {intensity = 0.2, size = 3, color = {0.5, 0.5, 1}},
    request_to_open_door_timeout = 15,
    spawn_and_station_height = 0.15,
    stationing_render_layer_swap_height = 0.87,
    stationing_offset = {0, -0.3},
    radar_visualisation_color = {0.059, 0.092, 0.235, 0.275},

    draw_logistic_radius_visualization = true,
    draw_construction_radius_visualization = true,

    open_door_trigger_effect = sounds.roboport_door_open,
    close_door_trigger_effect = sounds.roboport_door_close,

    circuit_connector = circuit_connector_definitions["roboport"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,

    default_available_logistic_output_signal = {type = "virtual", name = "signal-X"},
    default_total_logistic_output_signal = {type = "virtual", name = "signal-Y"},
    default_available_construction_output_signal = {type = "virtual", name = "signal-Z"},
    default_total_construction_output_signal = {type = "virtual", name = "signal-T"},
    default_roboport_count_output_signal = {type = "virtual", name = "signal-R"},

    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/roboport/roboport-reflection.png",
        priority = "extra-high",
        width = 28,
        height = 28,
        shift = util.by_pixel(0, 65),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  {
    type = "inserter",
    name = "planetaris-three-long-handed-inserter",
    icon = "__planetaris-tellus__/graphics/icons/three-long-handed-inserter.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "planetaris-three-long-handed-inserter"},
    max_health = 250,
    corpse = "three-long-handed-inserter-remnants",
    dying_explosion = "long-handed-inserter-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    damaged_trigger_effect = hit_effects.entity(),
    starting_distance = 1.7,
    pickup_position = {0, -3},
    insert_position = {0, 3.2},
    energy_per_movement = "5kJ",
    energy_per_rotation = "5kJ",
    extension_speed = 0.07,
    rotation_speed = 0.025,
    filter_count = 5,
    icon_draw_specification = {scale = 0.5},
    hand_size = 1.5,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "0.4kW"
    },
    fast_replaceable_group = "three-long-handed-inserter",
    impact_category = "metal",
    open_sound = sounds.inserter_open,
    close_sound = sounds.inserter_close,
    working_sound = sounds.inserter_long_handed,
    hand_base_picture =
    {
      filename = "__planetaris-tellus__/graphics/entity/three-long-handed-inserter/three-long-handed-inserter-hand-base.png",
      priority = "extra-high",
      width = 32,
      height = 136,
      scale = 0.25
    },
    hand_closed_picture =
    {
      filename = "__planetaris-tellus__/graphics/entity/three-long-handed-inserter/three-long-handed-inserter-hand-closed.png",
      priority = "extra-high",
      width = 72,
      height = 164,
      scale = 0.25
    },
    hand_open_picture =
    {
      filename = "__planetaris-tellus__/graphics/entity/three-long-handed-inserter/three-long-handed-inserter-hand-open.png",
      priority = "extra-high",
      width = 72,
      height = 164,
      scale = 0.25
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 32,
      height = 132,
      scale = 0.25
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 72,
      height = 164,
      scale = 0.25
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 72,
      height = 164,
      scale = 0.25
    },
    platform_picture =
    {
      sheet =
      {
        filename = "__planetaris-tellus__/graphics/entity/three-long-handed-inserter/three-long-handed-inserter-platform.png",
        priority = "extra-high",
        width = 105,
        height = 79,
        shift = util.by_pixel(1.5, 7.5-1),
        scale = 0.5
      }
    },
    circuit_connector = circuit_connector_definitions["inserter"],
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },

  {
    type = "inserter",
    name = "planetaris-long-stack-inserter",
    icon = "__planetaris-tellus__/graphics/icons/long-stack-inserter.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    stack_size_bonus = 4,
    bulk = true,
    grab_less_to_match_belt_stack = true,
    wait_for_full_hand = true,
    enter_drop_mode_if_held_stack_spoiled = true,
    max_belt_stack_size = 4,
    minable = { mining_time = 0.1, result = "planetaris-long-stack-inserter" },
    max_health = 200,
    corpse = "long-stack-inserter-remnants",
    dying_explosion = "stack-inserter-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    damaged_trigger_effect = hit_effects.entity(),
    starting_distance = 0.85,
    pickup_position = {0, -2},
    insert_position = {0, 2.2},
    energy_per_movement = "60kJ",
    energy_per_rotation = "60kJ",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "1kW"
    },
    heating_energy = "50kW",
    extension_speed = 0.15,
    rotation_speed = 0.09,
    filter_count = 5,
    icon_draw_specification = {scale = 0.5},
    fast_replaceable_group = "inserter",
    open_sound = sounds.inserter_open,
    close_sound = sounds.inserter_close,
    working_sound = sounds.inserter_fast,
    hand_base_picture =
    {
      filename = "__planetaris-tellus__/graphics/entity/long-stack-inserter/long-stack-inserter-hand-base.png",
      priority = "extra-high",
      width = 32,
      height = 136,
      scale = 0.25
    },
    hand_closed_picture =
    {
      filename = "__planetaris-tellus__/graphics/entity/long-stack-inserter/long-stack-inserter-hand-closed.png",
      priority = "extra-high",
      width = 100,
      height = 164,
      scale = 0.25
    },
    hand_open_picture =
    {
      filename = "__planetaris-tellus__/graphics/entity/long-stack-inserter/long-stack-inserter-hand-open.png",
      priority = "extra-high",
      width = 130,
      height = 164,
      scale = 0.25
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 32,
      height = 132,
      scale = 0.25
    },
    hand_closed_shadow =
    {
      filename = "__planetaris-tellus__/graphics/entity/long-stack-inserter/long-stack-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 100,
      height = 164,
      scale = 0.25
    },
    hand_open_shadow =
    {
      filename = "__planetaris-tellus__/graphics/entity/long-stack-inserter/long-stack-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 130,
      height = 164,
      scale = 0.25
    },
    platform_picture =
    {
      sheet =
      {
        filename = "__planetaris-tellus__/graphics/entity/long-stack-inserter/long-stack-inserter-platform.png",
        priority = "extra-high",
        width = 105,
        height = 79,
        shift = util.by_pixel(1.5, 7.5-1),
        scale = 0.5
      }
    },
    circuit_connector = circuit_connector_definitions["inserter"],
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },
})