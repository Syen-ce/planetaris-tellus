local rocket_shift = 48

--- @param i integer
local function make_visualization(i)
  return
  {
    filename = "__base__/graphics/entity/pipe/visualization.png",
    priority = "extra-high",
    x = i * 64,
    size = 64,
    scale = 0.5,
    flags = {"icon"},
  }
end

--- @param i integer
local function make_disabled_visualization(i)
  return
  {
    filename = "__base__/graphics/entity/pipe/disabled-visualization.png",
    priority = "extra-high",
    x = i * 64,
    size = 64,
    scale = 0.5,
    flags = {"icon"},
  }
end

telluspipepictures = function()
  return
  {
    straight_vertical_single =
    {
      filename = "__planetaris-tellus__/graphics/entity/replacements/pipe/pipe-straight-vertical-single.png",
      priority = "extra-high",
      width = 160,
      height = 160,
      scale = 0.5
    },
    straight_vertical =
    {
      filename = "__planetaris-tellus__/graphics/entity/replacements/pipe/pipe-straight-vertical.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    straight_vertical_window =
    {
      filename = "__planetaris-tellus__/graphics/entity/replacements/pipe/pipe-straight-vertical-window.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    straight_horizontal_window =
    {
      filename = "__planetaris-tellus__/graphics/entity/replacements/pipe/pipe-straight-horizontal-window.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    straight_horizontal =
    {
      filename = "__planetaris-tellus__/graphics/entity/replacements/pipe/pipe-straight-horizontal.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    corner_up_right =
    {
      filename = "__planetaris-tellus__/graphics/entity/replacements/pipe/pipe-corner-up-right.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    corner_up_left =
    {
      filename = "__planetaris-tellus__/graphics/entity/replacements/pipe/pipe-corner-up-left.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    corner_down_right =
    {
      filename = "__planetaris-tellus__/graphics/entity/replacements/pipe/pipe-corner-down-right.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    corner_down_left =
    {
      filename = "__planetaris-tellus__/graphics/entity/replacements/pipe/pipe-corner-down-left.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    t_up =
    {
      filename = "__planetaris-tellus__/graphics/entity/replacements/pipe/pipe-t-up.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    t_down =
    {
      filename = "__planetaris-tellus__/graphics/entity/replacements/pipe/pipe-t-down.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    t_right =
    {
      filename = "__planetaris-tellus__/graphics/entity/replacements/pipe/pipe-t-right.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    t_left =
    {
      filename = "__planetaris-tellus__/graphics/entity/replacements/pipe/pipe-t-left.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    cross =
    {
      filename = "__planetaris-tellus__/graphics/entity/replacements/pipe/pipe-cross.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    ending_up =
    {
      filename = "__planetaris-tellus__/graphics/entity/replacements/pipe/pipe-ending-up.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    ending_down =
    {
      filename = "__planetaris-tellus__/graphics/entity/replacements/pipe/pipe-ending-down.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    ending_right =
    {
      filename = "__planetaris-tellus__/graphics/entity/replacements/pipe/pipe-ending-right.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    ending_left =
    {
      filename = "__planetaris-tellus__/graphics/entity/replacements/pipe/pipe-ending-left.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    straight_vertical_single_visualization = make_visualization(0),
    straight_vertical_visualization = make_visualization(5),
    straight_vertical_window_visualization = make_visualization(5),
    straight_horizontal_window_visualization = make_visualization(10),
    straight_horizontal_visualization = make_visualization(10),
    corner_up_right_visualization = make_visualization(3),
    corner_up_left_visualization = make_visualization(9),
    corner_down_right_visualization = make_visualization(6),
    corner_down_left_visualization = make_visualization(12),
    t_up_visualization = make_visualization(11),
    t_down_visualization = make_visualization(14),
    t_right_visualization = make_visualization(7),
    t_left_visualization = make_visualization(13),
    cross_visualization = make_visualization(15),
    ending_up_visualization = make_visualization(1),
    ending_down_visualization = make_visualization(4),
    ending_right_visualization = make_visualization(2),
    ending_left_visualization = make_visualization(8),
    straight_vertical_single_disabled_visualization = make_disabled_visualization(0),
    straight_vertical_disabled_visualization = make_disabled_visualization(5),
    straight_vertical_window_disabled_visualization = make_disabled_visualization(5),
    straight_horizontal_window_disabled_visualization = make_disabled_visualization(10),
    straight_horizontal_disabled_visualization = make_disabled_visualization(10),
    corner_up_right_disabled_visualization = make_disabled_visualization(3),
    corner_up_left_disabled_visualization = make_disabled_visualization(9),
    corner_down_right_disabled_visualization = make_disabled_visualization(6),
    corner_down_left_disabled_visualization = make_disabled_visualization(12),
    t_up_disabled_visualization = make_disabled_visualization(11),
    t_down_disabled_visualization = make_disabled_visualization(14),
    t_right_disabled_visualization = make_disabled_visualization(7),
    t_left_disabled_visualization = make_disabled_visualization(13),
    cross_disabled_visualization = make_disabled_visualization(15),
    ending_up_disabled_visualization = make_disabled_visualization(1),
    ending_down_disabled_visualization = make_disabled_visualization(4),
    ending_right_disabled_visualization = make_disabled_visualization(2),
    ending_left_disabled_visualization = make_disabled_visualization(8),
    horizontal_window_background =
    {
      filename = "__planetaris-tellus__/graphics/entity/replacements/pipe/pipe-horizontal-window-background.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    vertical_window_background =
    {
      filename = "__planetaris-tellus__/graphics/entity/replacements/pipe/pipe-vertical-window-background.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    fluid_background =
    {
      filename = "__base__/graphics/entity/pipe/fluid-background.png",
      priority = "extra-high",
      width = 64,
      height = 40,
      scale = 0.5
    },
    low_temperature_flow =
    {
      filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    },
    middle_temperature_flow =
    {
      filename = "__base__/graphics/entity/pipe/fluid-flow-medium-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    },
    high_temperature_flow =
    {
      filename = "__base__/graphics/entity/pipe/fluid-flow-high-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    },
    gas_flow =
    {
      filename = "__base__/graphics/entity/pipe/steam.png",
      priority = "extra-high",
      line_length = 10,
      width = 48,
      height = 30,
      frame_count = 60
    }
  }
end

local beacon_animation =
  {
    module_icons_suppressed = true,

    animation_progress = 1,

    module_tint_mode = "mix", -- "single-module"
    no_modules_tint = {1, 0, 0},
    random_animation_offset = true,

    apply_module_tint = "secondary",

    -- light = { shift = {0, 0}, color = {1, 1, 1}, intensity = 1, size = 3 },
    animation_list =
    {
      {
        render_layer = "floor-mechanics",
        always_draw = true,
        animation =
        {
          layers =
          {
            {
              filename = "__planetaris-tellus__/graphics/entity/replacements/beacon-bottom.png",
              width = 212,
              height = 192,
              scale = 0.5,
              shift = util.by_pixel(0.5, 1)
            },
            {
              filename = "__base__/graphics/entity/beacon/beacon-shadow.png",
              width = 244,
              height = 176,
              scale = 0.5,
              draw_as_shadow = true,
              shift = util.by_pixel(12.5, 0.5)
            }
          }
        }
      },
      {
        render_layer = "object",
        always_draw = true,
        animation =
        {
          filename = "__planetaris-tellus__/graphics/entity/replacements/beacon-top.png",
          width = 96,
          height = 140,
          scale = 0.5,
          repeat_count = 45,
          animation_speed = 0.5,
          shift = util.by_pixel(3, -19)
        }
      },
      {
        render_layer = "object",
        apply_tint = true,
        always_draw = false,
        animation =
        {
          filename = "__base__/graphics/entity/beacon/beacon-light.png",
          line_length = 9,
          width = 110,
          height = 186,
          frame_count = 45,
          animation_speed = 0.5,
          scale = 0.5,
          shift = util.by_pixel(0.5, -18),
          blend_mode = "additive"
        }
      },
      {
        render_layer = "object",
        apply_tint = false, -- light doesn't get tinted
        always_draw = false,
        animation =
        {
          filename = "__base__/graphics/entity/beacon/beacon-light.png",
          line_length = 9,
          width = 110,
          height = 186,
          frame_count = 45,
          animation_speed = 0.5,
          scale = 0.5,
          shift = util.by_pixel(0.5, -18),
          draw_as_light = true,
          blend_mode = "additive"
        }
      }
    },

    module_visualisations =
    {
      -- vanilla art style
      {
        art_style = "vanilla",
        use_for_empty_slots = true,
        tier_offset = 0,
        slots =
        {
          -- slot 1
          {
            {
              has_empty_slot = true,
              render_layer = "lower-object",
              pictures =
              {
                filename = "__base__/graphics/entity/beacon/beacon-module-slot-1.png",
                line_length = 4,
                width = 50,
                height = 66,
                variation_count = 4,
                scale = 0.5,
                shift = util.by_pixel(-16, 14.5)
              }
            },
            {
              apply_module_tint = "primary",
              render_layer = "lower-object",
              pictures =
              {
                filename = "__base__/graphics/entity/beacon/beacon-module-mask-box-1.png",
                line_length = 3,
                width = 36,
                height = 32,
                variation_count = 3,
                scale = 0.5,
                shift = util.by_pixel(-17, 15)
              }
            },
            {
              apply_module_tint = "secondary",
              render_layer = "lower-object-above-shadow",
              pictures =
              {
                filename = "__base__/graphics/entity/beacon/beacon-module-mask-lights-1.png",
                line_length = 3,
                width = 26,
                height = 12,
                variation_count = 3,
                scale = 0.5,
                shift = util.by_pixel(-18.5, 13)
              }
            },
            {
              apply_module_tint = "secondary",
              render_layer = "lower-object-above-shadow",
              pictures =
              {
                filename = "__base__/graphics/entity/beacon/beacon-module-lights-1.png",
                line_length = 3,
                width = 56,
                height = 42,
                variation_count = 3,
                shift = util.by_pixel(-18, 13),
                draw_as_light = true,
                scale = 0.5
              }
            }
          },
          -- slot 2
          {
            {
              has_empty_slot = true,
              render_layer = "lower-object",
              pictures =
              {
                filename = "__base__/graphics/entity/beacon/beacon-module-slot-2.png",
                line_length = 4,
                width = 46,
                height = 44,
                variation_count = 4,
                scale = 0.5,
                shift = util.by_pixel(19, -12)
              }
            },
            {
              apply_module_tint = "primary",
              render_layer = "lower-object",
              pictures =
              {
                filename = "__base__/graphics/entity/beacon/beacon-module-mask-box-2.png",
                line_length = 3,
                width = 36,
                height = 26,
                variation_count = 3,
                scale = 0.5,
                shift = util.by_pixel(20.5, -12)
              }
            },
            {
              apply_module_tint = "secondary",
              render_layer = "lower-object-above-shadow",
              pictures =
              {
                filename = "__base__/graphics/entity/beacon/beacon-module-mask-lights-2.png",
                line_length = 3,
                width = 24,
                height = 14,
                variation_count = 3,
                scale = 0.5,
                shift = util.by_pixel(22, -15.5)
              }
            },
            {
              apply_module_tint = "secondary",
              render_layer = "lower-object-above-shadow",
              pictures =
              {
                filename = "__base__/graphics/entity/beacon/beacon-module-lights-2.png",
                line_length = 3,
                width = 66,
                height = 46,
                variation_count = 3,
                shift = util.by_pixel(22, -16),
                draw_as_light = true,
                scale = 0.5
              }
            }
          }
        }
      } -- end vanilla art style
    }
  }
--end


----------------------------- Tellus graphic variants

-- Electric poles are disable because of the autoplace with the max_wire_distance being bug, the swap on build happens instantly and game cannot detect it.

-- -- SUBSTATIONS
-- local tellus_substation = table.deepcopy(data.raw["electric-pole"]["substation"])

-- tellus_substation.name = "tellus-substation"
-- tellus_substation.subgroup = "pollen-corroded"
-- tellus_substation.factoriopedia_alternative = "substation"
-- tellus_substation.localised_name = {"entity-name.substation"}
-- tellus_substation.localised_description = {"entity-description.substation"}
-- tellus_substation.hidden_in_factoriopedia = true
-- tellus_substation.placeable_by = {item = "substation", count = 1}
-- tellus_substation.maximum_wire_distance = 18 -- same 
-- tellus_substation.supply_area_distance = 9 -- same
-- tellus_substation.track_coverage_during_drag_building = true
-- tellus_substation.track_coverage_during_build_by_moving = true
-- tellus_substation.pictures =
--     {
--       layers =
--       {

--         {
--           filename = "__planetaris-tellus__/graphics/entity/replacements/tellus-substation.png",
--           priority = "high",
--           width = 138,
--           height = 270,
--           direction_count = 4,
--           shift = util.by_pixel(0, 1-32),
--           scale = 0.5
--         },
--         {
--           filename = "__base__/graphics/entity/substation/substation-shadow.png",
--           priority = "high",
--           width = 370,
--           height = 104,
--           direction_count = 4,
--           shift = util.by_pixel(62, 42-32),
--           draw_as_shadow = true,
--           scale = 0.5
--         }
--       }
--     }

-- data:extend({tellus_substation})


-- -- BIG POWER POLES
-- local tellus_big_pole = table.deepcopy(data.raw["electric-pole"]["big-electric-pole"])

-- tellus_big_pole.name = "tellus-big-electric-pole"
-- tellus_big_pole.subgroup = "pollen-corroded"
-- tellus_big_pole.factoriopedia_alternative = "big-electric-pole"
-- tellus_big_pole.localised_name = {"entity-name.big-electric-pole"}
-- tellus_big_pole.localised_description = {"entity-description.big-electric-pole"}
-- tellus_big_pole.hidden_in_factoriopedia = true
-- tellus_big_pole.placeable_by = {item = "big-electric-pole", count = 1}
-- tellus_big_pole.pictures =
--     {
--       layers =
--       {
--         {
--           filename = "__planetaris-tellus__/graphics/entity/replacements/tellus-big-electric-pole.png",
--           priority = "extra-high",
--           width = 148,
--           height = 312,
--           direction_count = 4,
--           shift = util.by_pixel(0, -51),
--           scale = 0.5
--         },
--         {
--           filename = "__base__/graphics/entity/big-electric-pole/big-electric-pole-shadow.png",
--           priority = "extra-high",
--           width = 374,
--           height = 94,
--           direction_count = 4,
--           shift = util.by_pixel(60, 0),
--           draw_as_shadow = true,
--           scale = 0.5
--         }
--       }
--     }

-- data:extend({tellus_big_pole})

-- -- MEDIUM POWER POLES
-- local tellus_medium_pole = table.deepcopy(data.raw["electric-pole"]["medium-electric-pole"])

-- tellus_medium_pole.name = "tellus-medium-electric-pole"
-- tellus_medium_pole.subgroup = "pollen-corroded"
-- tellus_medium_pole.factoriopedia_alternative = "medium-electric-pole"
-- tellus_medium_pole.localised_name = {"entity-name.medium-electric-pole"}
-- tellus_medium_pole.localised_description = {"entity-description.medium-electric-pole"}
-- tellus_medium_pole.hidden_in_factoriopedia = true
-- tellus_medium_pole.placeable_by = {item = "medium-electric-pole", count = 1}
-- -- tellus_medium_pole.pictures =
-- --     {
-- --       layers =
-- --       {
-- --         {
-- --           filename = "__planetaris-tellus__/graphics/entity/replacements/tellus-medium-electric-pole.png",
-- --           priority = "extra-high",
-- --           width = 148,
-- --           height = 312,
-- --           direction_count = 4,
-- --           shift = util.by_pixel(0, -51),
-- --           scale = 0.5
-- --         },
-- --         {
-- --           filename = "__base__/graphics/entity/big-electric-pole/medium-electric-pole-shadow.png",
-- --           priority = "extra-high",
-- --           width = 374,
-- --           height = 94,
-- --           direction_count = 4,
-- --           shift = util.by_pixel(60, 0),
-- --           draw_as_shadow = true,
-- --           scale = 0.5
-- --         }
-- --       }
-- --     }

-- data:extend({tellus_medium_pole})

-- -- SMALL POLE

-- local tellus_small_pole = table.deepcopy(data.raw["electric-pole"]["small-electric-pole"])

-- tellus_small_pole.name = "tellus-small-electric-pole"
-- tellus_small_pole.subgroup = "pollen-corroded"
-- tellus_small_pole.factoriopedia_alternative = "small-electric-pole"
-- tellus_small_pole.localised_name = {"entity-name.small-electric-pole"}
-- tellus_small_pole.localised_description = {"entity-description.small-electric-pole"}
-- tellus_small_pole.hidden_in_factoriopedia = true
-- tellus_small_pole.placeable_by = {item = "small-electric-pole", count = 1}
-- tellus_small_pole.pictures =
--     {
--       layers =
--       {
--         {
--           filename = "__planetaris-tellus__/graphics/entity/replacements/tellus-small-electric-pole.png",
--           priority = "extra-high",
--           width = 72,
--           height = 220,
--           direction_count = 4,
--           shift = util.by_pixel(1.5, -42.5),
--           scale = 0.5
--         },
--         {
--           filename = "__base__/graphics/entity/small-electric-pole/small-electric-pole-shadow.png",
--           priority = "extra-high",
--           width = 256,
--           height = 52,
--           direction_count = 4,
--           shift = util.by_pixel(51, 3),
--           draw_as_shadow = true,
--           scale = 0.5
--         }
--       }
--     }

-- data:extend({tellus_small_pole})

-- ROBOPORT

local tellus_roboport = table.deepcopy(data.raw["roboport"]["roboport"])

tellus_roboport.name = "tellus-roboport"
tellus_roboport.subgroup = "pollen-corroded"
tellus_roboport.factoriopedia_alternative = "tellus-roboport"
-- tellus_roboport.localised_name = {"entity-name.tellus-roboport"}
-- tellus_roboport.localised_description = {"entity-description.tellus-roboport"}
tellus_roboport.hidden_in_factoriopedia = false
tellus_roboport.placeable_by = {item = "roboport", count = 1}
tellus_roboport.base =
    {
      layers =
      {
        {
          filename = "__planetaris-tellus__/graphics/entity/replacements/tellus-roboport-base.png",
          width = 228,
          height = 277,
          shift = util.by_pixel(2, -2.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/roboport/roboport-shadow.png",
          width = 294,
          height = 201,
          draw_as_shadow = true,
          shift = util.by_pixel(28.5, 9.25),
          scale = 0.5
        }
      }
    }
tellus_roboport.base_patch =
    {
      filename = "__planetaris-tellus__/graphics/entity/replacements/tellus-roboport-base-patch.png",
      priority = "medium",
      width = 138,
      height = 100,
      shift = util.by_pixel(1.5, -5),
      scale = 0.5
    }

  tellus_roboport.robot_slots_count = 5 --7
  tellus_roboport.logistics_radius = 20 -- 25
  tellus_roboport.construction_radius = 50 -- 55
  tellus_roboport.energy_usage = "60kW"

data:extend({tellus_roboport})

-- Beacon

local tellus_beacon = table.deepcopy(data.raw["beacon"]["beacon"])

tellus_beacon.name = "tellus-beacon"
tellus_beacon.subgroup = "pollen-corroded"
tellus_beacon.factoriopedia_alternative = "beacon"
tellus_beacon.hidden_in_factoriopedia = true
tellus_beacon.placeable_by = {item = "beacon", count = 1}
tellus_beacon.graphics_set = beacon_animation
tellus_beacon.energy_usage = "700kW"

data:extend({tellus_beacon})

-- Pipes

local tellus_pipe = table.deepcopy(data.raw["pipe"]["pipe"])

tellus_pipe.name = "tellus-pipe"
tellus_pipe.subgroup = "pollen-corroded"
tellus_pipe.factoriopedia_alternative = "pipe"
tellus_pipe.hidden_in_factoriopedia = false
tellus_pipe.placeable_by = {item = "pipe", count = 1}
tellus_pipe.minable = {mining_time = 0.2}
tellus_pipe.max_health = 50
tellus_pipe.resistances =
    {
      {
        type = "fire",
        percent = 20
      },
      {
        type = "impact",
        percent = 10
      }
    }
tellus_pipe.pictures = telluspipepictures()


data:extend({tellus_pipe})

-- Tank

local tellus_storage_tank = table.deepcopy(data.raw["storage-tank"]["storage-tank"])

tellus_storage_tank.name = "tellus-storage-tank"
tellus_storage_tank.subgroup = "pollen-corroded"
tellus_storage_tank.factoriopedia_alternative = "storage-tank"
tellus_storage_tank.hidden_in_factoriopedia = false
tellus_storage_tank.placeable_by = {item = "storage-tank", count = 1}
tellus_storage_tank.minable = {mining_time = 0.2}
tellus_storage_tank.max_health = 100
tellus_storage_tank.resistances =
    {
      {
        type = "fire",
        percent = 20
      },
      {
        type = "impact",
        percent = 10
      }
    }
tellus_storage_tank.fluid_box.volume = 5000
tellus_storage_tank.pictures =
    {
      picture =
      {
        sheets =
        {
          {
            filename = "__planetaris-tellus__/graphics/entity/replacements/storage-tank.png",
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
      }
    }

data:extend({tellus_storage_tank})


-- BIOCHAMBER

-- ROCKET SILO
local tellus_rocket_silo = table.deepcopy(data.raw["rocket-silo"]["rocket-silo"])

tellus_rocket_silo.name = "tellus-rocket-silo"
tellus_rocket_silo.icon = "__planetaris-tellus__/graphics/icons/tellus-rocket-silo.png"
tellus_rocket_silo.factoriopedia_alternative = "rocket-silo"
tellus_rocket_silo.hidden_in_factoriopedia = true
tellus_rocket_silo.rocket_entity = "tellus-rocket-silo-rocket"
tellus_rocket_silo.fixed_recipe = "planetaris-tellus-rocket-part"
tellus_rocket_silo.localised_name = {"entity-name.rocket-silo"}
tellus_rocket_silo.localised_description = {"entity-description.rocket-silo"}
tellus_rocket_silo.placeable_by = {item = "rocket-silo", count = 1}
tellus_rocket_silo.energy_source = {
			type = "fluid",
			burns_fluid = true,
			scale_fluid_usage = true,
      emissions_per_minute = { spores = 15,
                               pollen = 15 },
			light_flicker = {
				color = { 0, 1, 0, 1 },
			},
			fluid_box = {
				pipe_covers = planetaris_root_cover_pictures(),
				always_draw_covers = false,
				volume = 50,
        filter = "planetaris-chlorophyll",
				pipe_connections = {
					{ direction = defines.direction.west, position = { -4, 0 }, connection_category = "root" },
					{ direction = defines.direction.east, position = { 4, 0 }, connection_category = "root" },
          { direction = defines.direction.north, position = { 0, -4 }, connection_category = "root" },
					{ direction = defines.direction.south, position = { 0, 4 }, connection_category = "root" },
				},
				production_type = "input-output",
			},
    }

tellus_rocket_silo.resistances =
    {
      {
        type = "impact",
        percent = 80
      }
    }
tellus_rocket_silo.hole_light_sprite =
    {
      filename = "__planetaris-tellus__/graphics/entity/rocket-silo/01-rocket-silo-hole-light.png",
      width = 400,
      height = 270,
      shift = util.by_pixel(-5, 16),
      tint = {1,1,1,0},
      scale = 0.5
    }
tellus_rocket_silo.rocket_glow_overlay_sprite =
    {
      filename = "__planetaris-tellus__/graphics/entity/rocket-silo/03-rocket-over-glow.png",
      blend_mode = "additive",
      width = 434,
      height = 446,
      shift = util.by_pixel(-3, 36),
      scale = 0.5
    }
tellus_rocket_silo.base_day_sprite =
    {
      filename = "__planetaris-tellus__/graphics/entity/rocket-silo/06-rocket-silo.png",
      dice_y = 3,
      width = 710,
      height = 684,
      shift = util.by_pixel(3, -1),
      scale = 0.5
    }
tellus_rocket_silo.arm_01_back_animation =
    {
      filename = "__planetaris-tellus__/graphics/entity/rocket-silo/08-rocket-silo-arms-back.png",
      priority = "medium",
      width = 128,
      height = 150,
      frame_count = 32,
      line_length = 32,
      animation_speed = 0.3,
      shift = util.by_pixel(-53, -84),
      scale = 0.5
    }

tellus_rocket_silo.arm_02_right_animation =
    {
      filename = "__planetaris-tellus__/graphics/entity/rocket-silo/08-rocket-silo-arms-right.png",
      priority = "medium",
      width = 182,
      height = 188,
      frame_count = 32,
      line_length = 32,
      animation_speed = 0.3,
      shift = util.by_pixel(101, -38),
      scale = 0.5
    }

tellus_rocket_silo.arm_03_front_animation =
    {
      filename = "__planetaris-tellus__/graphics/entity/rocket-silo/13-rocket-silo-arms-front.png",
      priority = "medium",
      width = 126,
      height = 228,
      frame_count = 32,
      line_length = 32,
      animation_speed = 0.3,
      shift = util.by_pixel(-51, 16),
      scale = 0.5
    }
tellus_rocket_silo.base_front_sprite =
    {
      filename = "__planetaris-tellus__/graphics/entity/rocket-silo/14-rocket-silo-front.png",
      width = 582,
      height = 271,
      shift = util.by_pixel(3, 80),
      scale = 0.5
    }



local tellus_rocket = table.deepcopy(data.raw["rocket-silo-rocket"]["rocket-silo-rocket"])
tellus_rocket.name = "tellus-rocket-silo-rocket"

tellus_rocket.rocket_sprite =
    {
    layers =
      {
        util.sprite_load("__planetaris-tellus__/graphics/entity/rocket-silo/rocket-static-pod",
      {
        dice_y = 4,
        shift = util.by_pixel( 0, 17.0+rocket_shift),
        scale = 0.5
      }),
      util.sprite_load("__planetaris-tellus__/graphics/entity/rocket-silo/rocket-static-emission",
      {
        dice_y = 4,
        shift = util.by_pixel( 0, 17+rocket_shift),
        draw_as_glow = true,
        blend_mode = "additive",
        scale = 0.5
      })
    }
    }
tellus_rocket.rocket_flame_animation = util.sprite_load("__planetaris-tellus__/graphics/entity/rocket-silo/rocket-jet",
    {
      shift = util.by_pixel( 0, 17+rocket_shift),
      draw_as_glow = true,
      blend_mode = "additive",
      scale = 0.5,
      frame_count = 8,
      animation_speed = 0.5
    })

data:extend({tellus_rocket, tellus_rocket_silo})

-- OFFSHORE PUMP