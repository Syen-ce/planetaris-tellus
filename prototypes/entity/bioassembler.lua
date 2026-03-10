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
    name = "planetaris-bioassembler",
    icon = "__planetaris-tellus__/graphics/icons/bioassembler.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation", "not-repairable"},
    subgroup = "tellus-production",
    order = "a-a",
    minable = {mining_time = 0.2, result = "planetaris-bioassembler-seed", count = 1, transfer_entity_health_to_products = false },
    placeable_by = {item = "planetaris-bioassembler-seed", count = 1},
    create_ghost_on_death = false,
    max_health = 350,
    icon_draw_specification = {shift = {0, -0.3}},
    resistances =
    {
      {
        type = "fire",
        percent = 50
      }
    },
    surface_conditions =
    {
      {
        property = "gravity",
        min = 1,
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    --damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = "bioassembler",
    dying_explosion = "planetaris-bioassembler-explosion",
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
            filename = "__planetaris-tellus__/graphics/entity/bioassembler/bioassembler.png",
            priority="high",
            width = 256,
            height = 256,
            line_length = 10,
            frame_count = 60,
            animation_speed = 1,
            shift = util.by_pixel(0, -0.75),
            scale = 0.5
          },
          {
            filename = "__planetaris-tellus__/graphics/entity/bioassembler/bioassembler-shadow.png",
            priority="high",
            width = 256,
            height = 256,
            repeat_count = 60,
            draw_as_shadow = true,
            shift = util.by_pixel(8.5, 5),
            scale = 0.5
          }
        }
      },
      working_visualisations = {
        {
        apply_recipe_tint = "primary",
        fadeout = true,
        animation ={
                    filename = "__planetaris-tellus__/graphics/entity/bioassembler/bioassembler-mask.png",
                    priority = "high",
                    width = 256,
                    height = 256,
                    shift = util.by_pixel(0, -0.75),
                    frame_count = 60,
                    line_length = 10,
                    animation_speed = 1,
                    scale = 0.5,
                    apply_recipe_tint = "primary",
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
    crafting_categories = {"organic-or-hand-crafting", "planetaris-bioassembling", "planetaris-bioassembling-or-organic", "planetaris-bioassembling-or-assembling", "planetaris-bioassembling-or-organic-or-hand-crafting"},
    crafting_speed = 2,
    effect_receiver = { base_effect = { productivity = 0.75 }},
    production_health_effect =
    {
      not_producing = -3 / 60,
      producing =     -1 / 60
    },
    energy_source = {
			type = "fluid",
			burns_fluid = true,
			scale_fluid_usage = true,
      emissions_per_minute = { spores = 4,
                               pollen = 4 },
			light_flicker = {
				color = { 0, 1, 0, 1 },
			},
			fluid_box = {
				pipe_covers = planetaris_root_cover_pictures(),
				always_draw_covers = false,
				volume = 20,
        filter = "planetaris-chlorophyll",
				pipe_connections = {
					{ direction = defines.direction.west, position = { -1, 0 }, connection_category = "root" },
					{ direction = defines.direction.east, position = { 1, 0 }, connection_category = "root" },
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
            position = {0, -1}
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
            position = { 0, 1}
          }
        }
      }
    },
    energy_usage = "1MW",
    module_slots = 4,
    allowed_effects = {"speed", "consumption", "pollution", "productivity"},
    impact_category = "metal",
    open_sound = {filename = "__base__/sound/open-close/fluid-open.ogg", volume = 0.55},
    close_sound = {filename = "__base__/sound/open-close/fluid-close.ogg", volume = 0.54},
    working_sound =
    {
      sound = {filename = "__space-age__/sound/entity/biochamber/biochamber-loop.ogg", volume = 0.4},
      max_sounds_per_prototype = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
  },
})


-- Create a custom corpse entity for each assembling machine tier
local function create_assembler_corpse(base_name, tier)
  local corpse_name = base_name .. "-corpse-repairable"
  
  data:extend({
    {
      type = "container",
      name = corpse_name,
      icon = "__planetaris-tellus__/graphics/icons/" .. base_name .. ".png",
      icon_size = 64,
      flags = {"placeable-neutral", "player-creation"},
      minable = {mining_time = 0.5, result = "nutrients", count = 0},
      max_health = 100,
      corpse = "small-remnants",
      collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
      selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
      inventory_size = 2,
      picture = {
        filename = "__planetaris-tellus__/graphics/entity/" .. base_name .. "/" .. base_name .. ".png",
        priority = "extra-high",
        width = 108,
        height = 114,
        shift = {0, 0},
        tint = {r = 0.5, g = 0.5, b = 0.5, a = 0.8} -- Darker/damaged look
      },
      vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
      open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.85},
      close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.75}
    }
  })
end

  data:extend({
    {
      type = "assembling-machine",
      name = "planetaris-bioassembler-dead",
      icon = "__planetaris-tellus__/graphics/icons/bioassembler-dead.png",
      icon_size = 64,
      flags = {"placeable-neutral", "player-creation", "not-repairable"},
      minable = {mining_time = 0.5, result = "planetaris-compost", count = 10, transfer_entity_health_to_products = false},
      max_health = 100,
      corpse = "planetaris-bioassembler-remnant",
      dying_explosion = "planetaris-bioassembler-explosion",
      collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
      selection_box = {{-1.5, -1.5}, {1.5, 1.5}},

      crafting_categories = { "planetaris-reviving" },
      fixed_recipe = "planetaris-revive-bioassembler",
      factoriopedia_alternative = "planetaris-bioassembler",
      crafting_speed = 1,

      return_ingredients_on_change = true,
        production_health_effect =
    {
      not_producing = -4 / 60,
    },

      energy_source = {
        type = "fluid",
        burns_fluid = true,
        scale_fluid_usage = true,
        light_flicker = {
          color = { 0, 1, 0, 1 },
        },
        emissions_per_minute = { spores = 4,
                                 pollen = 4 },
        fluid_box = {
          pipe_covers = planetaris_root_cover_pictures(),
          always_draw_covers = false,
          volume = 20,
          filter = "planetaris-chlorophyll",
          pipe_connections = {
            { direction = defines.direction.west, position = { -1, 0 }, connection_category = "root" },
            { direction = defines.direction.east, position = { 1, 0 }, connection_category = "root" },
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
            position = {0, -1}
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
            position = { 0, 1}
          }
        }
      }
    },
      energy_usage = "5MW",
      module_slots = 4,
      allowed_effects = {"speed", "consumption", "pollution", "productivity"},
      graphics_set =
      {
        animation =
        {
          layers =
          {
            {
              filename = "__planetaris-tellus__/graphics/entity/bioassembler/bioassembler-dead.png",
              priority="high",
              width = 256,
              height = 256,
              shift = util.by_pixel(0, -0.75),
              scale = 0.5
            },
            {
              filename = "__planetaris-tellus__/graphics/entity/bioassembler/bioassembler-shadow.png",
              priority="high",
              width = 256,
              height = 256,
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
    name = "planetaris-revive-bioassembler",
    icon = "__planetaris-tellus__/graphics/icons/bioassembler-revive.png",
    icon_size = 64,
    category = "planetaris-reviving",
    enabled = false,
    hide_from_player_crafting = true,
    energy_required = 1,
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

-- Create corpses for all three assembling machine tiers
--create_assembler_corpse("planetaris-bioassembler", 1)
--create_assembler_corpse("assembling-machine-2", 2)
--create_assembler_corpse("assembling-machine-3", 3)