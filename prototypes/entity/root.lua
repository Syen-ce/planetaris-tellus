require ("__planetaris-tellus__/prototypes/entity/planetaris-cover-pictures")

local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require ("__space-age__.prototypes.entity.sounds")

local function make_visualization(i)
  return
  {
    filename = "__planetaris-tellus__/graphics/entity/root/visualization.png",
    priority = "extra-high",
    x = i * 64,
    size = 64,
    scale = 0.5,
    flags = {"icon"},
  }
end

local function make_disabled_visualization(i)
  return
  {
    filename = "__planetaris-tellus__/graphics/entity/root/disabled-visualization.png",
    priority = "extra-high",
    x = i * 64,
    size = 64,
    scale = 0.5,
    flags = {"icon"},
  }
end

planetaris_root_pictures = function()
  local layers =
  {
    straight_vertical_single =
    {
      filename = "__planetaris-tellus__/graphics/entity/root/root-straight-vertical-single.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      scale = 0.5,
    },
    straight_vertical =
    {
      filename = "__planetaris-tellus__/graphics/entity/root/root-straight-vertical.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      scale = 0.5,

    },
    straight_vertical_window =
    {
      filename = "__planetaris-tellus__/graphics/entity/root/root-straight-vertical.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      scale = 0.5,

    },
    straight_horizontal_window =
    {
      filename = "__planetaris-tellus__/graphics/entity/root/root-straight-horizontal.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      scale = 0.5,

    },
    straight_horizontal =
    {
      filename = "__planetaris-tellus__/graphics/entity/root/root-straight-horizontal.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      scale = 0.5,

    },
    corner_up_right =
    {
      filename = "__planetaris-tellus__/graphics/entity/root/root-corner-up-right.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      scale = 0.5,

    },
    corner_up_left =
    {
      filename = "__planetaris-tellus__/graphics/entity/root/root-corner-up-left.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      scale = 0.5,

    },
    corner_down_right =
    {
      filename = "__planetaris-tellus__/graphics/entity/root/root-corner-down-right.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      scale = 0.5,

    },
    corner_down_left =
    {
      filename = "__planetaris-tellus__/graphics/entity/root/root-corner-down-left.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      scale = 0.5,

    },
    t_up =
    {
      filename = "__planetaris-tellus__/graphics/entity/root/root-t-up.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      scale = 0.5,

    },
    t_down =
    {
      filename = "__planetaris-tellus__/graphics/entity/root/root-t-down.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      scale = 0.5,

    },
    t_right =
    {
      filename = "__planetaris-tellus__/graphics/entity/root/root-t-right.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      scale = 0.5,

    },
    t_left =
    {
      filename = "__planetaris-tellus__/graphics/entity/root/root-t-left.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      scale = 0.5,

    },
    cross =
    {
      filename = "__planetaris-tellus__/graphics/entity/root/root-t.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      scale = 0.5,

    },
    ending_up =
    {
      filename = "__planetaris-tellus__/graphics/entity/root/root-ending-down.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      scale = 0.5,

    },
    ending_down =
    {
      filename = "__planetaris-tellus__/graphics/entity/root/root-ending-up.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      scale = 0.5,
    },
    ending_right =
    {
      filename = "__planetaris-tellus__/graphics/entity/root/root-ending-left.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      scale = 0.5,

    },
    ending_left =
    {
      filename = "__planetaris-tellus__/graphics/entity/root/root-ending-right.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      scale = 0.5,

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
      filename = "__planetaris-tellus__/graphics/entity/root/root-horizontal-window-background-1.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      scale = 0.5,

    },
    vertical_window_background =
    {
      filename = "__planetaris-tellus__/graphics/entity/root/root-vertical-window-background-1.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      scale = 0.5,

    },
    fluid_background =
    {
      filename = "__planetaris-tellus__/graphics/entity/root/fluid-background-1.png",
      priority = "extra-high",
      width = 64,
      height = 40,
      scale = 3.5,

    },
    low_temperature_flow =
    {
      filename = "__planetaris-tellus__/graphics/entity/root/fluid-flow-low-temperature.png",
      priority = "extra-high",
      width = 160,
      scale = 8.5,
      height = 18,

    },
    middle_temperature_flow =
    {
      filename = "__planetaris-tellus__/graphics/entity/root/fluid-flow-medium-temperature.png",
      priority = "extra-high",
      width = 160,
      scale = 8.5,
      height = 18,

    },
    high_temperature_flow =
    {
      filename = "__planetaris-tellus__/graphics/entity/root/fluid-flow-high-temperature.png",
      priority = "extra-high",
      width = 160,
      scale = 8.5,
      height = 18,

    },
    gas_flow =
    {
      filename = "__planetaris-tellus__/graphics/entity/root/steam-1.png",
      priority = "extra-high",
      scale = 0,
      line_length = 10,
      width = 48,
      height = 30,
      frame_count = 60,

    }
  }
    return layers
end

data.extend({  
{
    type = "corpse",
    name = "planetaris-root-remnants",
    icon = "__planetaris-tellus__/graphics/icons/root.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "energy-remnants",
    order = "a-f-b",
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (3,
    {
      filename = "__planetaris-tellus__/graphics/entity/root/remnants/root-remnants.png",
      line_length = 1,
      width = 64,
      height = 64,
      direction_count = 1,
      shift = util.by_pixel(0.5, -1.5),
      scale = 0.5
    })
  },
  {
    type = "pipe",
    name = "planetaris-root",
    icon = "__planetaris-tellus__/graphics/icons/root.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "planetaris-root"},
    max_health = 80,
    corpse = "planetaris-root-remnants",
    dying_explosion = "heat-pipe-explosion",
    random_corpse_variation = true,
    icon_draw_specification = {scale = 0.5},
    resistances =
    {
      {
        type = "impact",
        percent = 60
      }
    },
    fast_replaceable_group = "root",
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    collision_mask = {layers={item=true, object=true, water_tile=true, is_object=true, is_lower_object=true}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fluid_box =
    {
      volume = 10,
      pipe_covers = planetaris_root_cover_pictures(), -- in case a real pipe is connected to a ghost
      pipe_connections =
      {
        { direction = defines.direction.north, position = {0, 0}, connection_category = "root" },
        { direction = defines.direction.east,  position = {0, 0}, connection_category = "root" },
        { direction = defines.direction.south, position = {0, 0}, connection_category = "root" },
        { direction = defines.direction.west,  position = {0, 0}, connection_category = "root" }
      },
      hide_connection_info = true,
      max_pipeline_extent = 100,
    },
    -- filter = {"planetaris-chlorophyll"},
    pictures = planetaris_root_pictures(),
    impact_category = "metal",
    working_sound =
    {
      sound = { filename = "__base__/sound/heat-pipe.ogg", volume = 0.4 },
      match_volume_to_activity = true,
      max_sounds_per_prototype = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    open_sound = sounds.metal_small_open,
    close_sound = sounds.metal_small_close,

    horizontal_window_bounding_box = {{-0.25, -0.28125}, {0.25, 0.15625}},
    vertical_window_bounding_box = {{-0.28125, -0.5}, {0.03125, 0.125}}
  },
})