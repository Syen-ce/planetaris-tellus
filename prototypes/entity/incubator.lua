require ("util")
require ("__space-age__/prototypes/entity/circuit-network")
require ("__base__/prototypes/entity/circuit-network")
require ("__base__/prototypes/entity/pipecovers")
require ("__planetaris-tellus__/prototypes/entity/planetaris-cover-pictures")


local simulations = require("__base__/prototypes/factoriopedia-simulations")
local sounds = require("__base__/prototypes/entity/sounds")
local hit_effects = require("__base__/prototypes/entity/hit-effects")

data.extend({
  {
    type = "assembling-machine",
    name = "planetaris-incubator",
    icon = "__planetaris-tellus__/graphics/icons/incubator.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation", "not-repairable"},
    subgroup = "tellus-production",
    order = "a-b",
    minable = {mining_time = 1, result = "planetaris-incubator", count = 1, transfer_entity_health_to_products = false },
    max_health = 400,
    --corpse = "planetaris-bioassembler-remnant",
    dying_explosion = "assembling-machine-1-explosion",
    icon_draw_specification = {shift = {0, -0.3}},
    create_ghost_on_death = false,
    resistances =
    {
      {
        type = "fire",
        percent = 50
      }
    },
    collision_box = {{-3.2, -3.2}, {3.2, 3.2}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    --damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = "incubator",
    next_upgrade = nil,
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["assembling-machine"],
    alert_icon_shift = util.by_pixel(0, -12),
    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__planetaris-tellus__/graphics/entity/incubator/incubator.png",
            priority="high",
            width = 500,
            height = 500,
            line_length = 8,
            frame_count = 60,
            animation_speed = 1,
            shift = util.by_pixel(0, -0.75),
            scale = 0.5
          },
          {
            filename = "__planetaris-tellus__/graphics/entity/incubator/incubator-shadow.png",
            priority="high",
            width = 900,
            height = 700,
            repeat_count = 60,
            draw_as_shadow = true,
            shift = util.by_pixel(8.5, 5),
            scale = 0.5
          }
        }
      },
      working_visualisations = {
        {
        fadeout = true,
        animation =
                {
                    filename = "__planetaris-tellus__/graphics/entity/incubator/incubator-light.png",
                    priority = "high",
                    width = 500,
                    height = 500,
                    shift = util.by_pixel(0, -0.75),
                    frame_count = 60,
                    line_length = 8,
                    animation_speed = 1,
                    scale = 0.5,
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
        scale = 1
      },
      rotate = false,
      orientation_to_variation = false
    },
    crafting_categories = {"planetaris-pathologics"},
    crafting_speed = 1,
    production_health_effect =
    {
      not_producing = -3 / 60,
      producing =     -1 / 60
    },
    energy_source = {
			type = "fluid",
			burns_fluid = true,
			scale_fluid_usage = true,
			light_flicker = {
				color = { 0, 1, 0, 1 },
			},
      emissions_per_minute = { spores = 8,
                                 pollen = 8},
			fluid_box = {
				pipe_covers = planetaris_root_cover_pictures(),
				always_draw_covers = false,
				volume = 100,
                filter = "planetaris-bacteriochlorophyll",
				pipe_connections = {
					{ direction = defines.direction.west, position = { -3, 0 }, connection_category = "root" },
					{ direction = defines.direction.east, position = { 3, 0 }, connection_category = "root" },
				},
				production_type = "input-output",
			},
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_covers = planetaris_root_cover_pictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction="input",
            direction = defines.direction.north,
            connection_category = "root",
            position = {0, -3}
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = planetaris_root_cover_pictures(),
        volume = 100,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.south,
            connection_category = "root",
            position = { 0, 3}
          }
        }
      }
    },
    energy_usage = "5MW",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    module_slots = 4,
    allowed_effects = {"speed", "consumption", "pollution"},
    impact_category = "metal",
    working_sound =
    {
      sound = {filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.5, audible_distance_modifier = 0.5},
      fade_in_ticks = 4,
      fade_out_ticks = 20
    }
  },
})

  data:extend({
    {
      type = "assembling-machine",
      name = "planetaris-incubator-dead",
      icon = "__planetaris-tellus__/graphics/icons/incubator-dead.png",
      icon_size = 64,
      flags = {"placeable-neutral", "player-creation", "not-repairable"},
      minable = {mining_time = 0.5, result = "planetaris-compost", count = 10},
      max_health = 100,
      corpse = "planetaris-incubator-remnant",
      dying_explosion = "assembling-machine-1-explosion",
      collision_box = {{-3.2, -3.2}, {3.2, 3.2}},
      selection_box = {{-3.5, -3.5}, {3.5, 3.5}},

      crafting_categories = { "planetaris-reviving" },
      fixed_recipe = "planetaris-revive-incubator",
      factoriopedia_alternative = "planetaris-incubator",
      crafting_speed = 5,

      return_ingredients_on_change = true,
        production_health_effect =
        {
        not_producing = -5 / 60,
        producing =     -3 / 60
        },

      energy_source = {
        type = "fluid",
        burns_fluid = true,
        scale_fluid_usage = true,
        emissions_per_minute = { spores = 4,
                                 pollen = 4 },
        light_flicker = {
          color = { 1, 0, 0, 1 },
        },
        fluid_box = {
          pipe_covers = planetaris_root_cover_pictures(),
          always_draw_covers = false,
          volume = 20,
          filter = "planetaris-bacteriochlorophyll",
          pipe_connections = {
            { direction = defines.direction.west, position = { -3, 0 }, connection_category = "root" },
            { direction = defines.direction.east, position = { 3, 0 }, connection_category = "root" },
          },
          production_type = "input-output",
        },
      },
      energy_usage = "5MW",
      module_slots = 4,
      allowed_effects = {"speed", "consumption", "pollution"},
      effect_receiver = { base_effect = { productivity = 0.5 }},
      graphics_set =
      {
        animation =
        {
          layers =
          {
            {
              filename = "__planetaris-tellus__/graphics/entity/incubator/incubator-dead.png",
              priority="high",
              width = 500,
              height = 500,
              shift = util.by_pixel(0, -0.75),
              scale = 0.5
            },
            {
              filename = "__planetaris-tellus__/graphics/entity/incubator/incubator-shadow.png",
              priority="high",
              width = 900,
              height = 700,
              draw_as_shadow = true,
              shift = util.by_pixel(8.5, 5),
              scale = 0.5
            }
          }
        }
      },
      vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
      open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.85},
      close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.75}
    }
  })

data:extend({
  {
    type = "recipe",
    name = "planetaris-revive-incubator",
    icon = "__planetaris-tellus__/graphics/icons/incubator-revive.png",
    icon_size = 64,
    category = "planetaris-reviving",
    enabled = false,
    hide_from_player_crafting = true,
    energy_required = 5,
    overload_multiplier = 1,
    ingredients =
      {
        {type = "item", name = "nutrients", amount = 20},
      },
    results = {},
		allow_quality = false,
		allow_productivity = false,
		hide_from_signal_gui = true,
  },
})