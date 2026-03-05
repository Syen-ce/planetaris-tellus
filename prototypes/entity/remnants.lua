data:extend({
{
    type = "corpse",
    name = "planetaris-bioassembler-remnant",
    icon = "__planetaris-tellus__/graphics/icons/bioassembler-dead.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "production-machine-remnants",
    order = "a-a-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    animation =
      {
        filename = "__planetaris-tellus__/graphics/entity/bioassembler/bioassembler-plant-dead.png",
        priority="high",
        width = 352,
        height = 352,
        shift = util.by_pixel(0, -0.75),
        scale = 0.5
      },
  },
  {
    type = "corpse",
    name = "planetaris-incubator-remnant",
    icon = "__planetaris-tellus__/graphics/icons/incubator-dead.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "production-machine-remnants",
    order = "a-a-b",
    collision_box = {{-3.2, -3.2}, {3.2, 3.2}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    animation =
      {
        filename = "__planetaris-tellus__/graphics/entity/incubator/incubator-remnants.png",
        priority="high",
        width = 504,
        height = 504,
        shift = util.by_pixel(0, -0.75),
        scale = 0.5
      },
  },

  {
    type = "corpse",
    name = "planetaris-logistic-robowasp-remnants",
    icon = "__base__/graphics/icons/logistic-robot.png",
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    hidden_in_factoriopedia = true,
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (3,
    {
      filename = "__base__/graphics/entity/logistic-robot/remnants/logistic-robot-remnants.png",
      line_length = 1,
      width = 116,
      height = 114,
      direction_count = 1,
      shift = util.by_pixel(1, 1),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "three-long-handed-inserter-remnants",
    icon = "__planetaris-tellus__/graphics/icons/three-long-handed-inserter.png",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "inserter-remnants",
    order = "a-c-a-b",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    animation = make_rotated_animation_variations_from_sheet (4,
    {
      filename = "__planetaris-tellus__/graphics/entity/three-long-handed-inserter/remnants/three-long-handed-inserter-remnants.png",
      line_length = 1,
      width = 134,
      height = 94,
      direction_count = 1,
      shift = util.by_pixel(3.5, -2),
      scale = 0.5
    })
  },

  {
    type = "corpse",
    name = "long-stack-inserter-remnants",
    icon = "__planetaris-tellus__/graphics/icons/long-stack-inserter.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "inserter-remnants",
    order = "a-f-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (4,
    {
      filename = "__planetaris-tellus__/graphics/entity/long-stack-inserter/remnants/long-stack-inserter-remnants.png",
      line_length = 1,
      width = 132,
      height = 96,
      direction_count = 1,
      shift = util.by_pixel(3, -1.5),
      scale = 0.5
    })
  },
})