data:extend(
{
  {
    type = "airborne-pollutant",
    name = "pollen",
    chart_color = {r = 255, g = 195, b = 0, a = 149},
    icon =
    {
      filename = "__planetaris-tellus__/graphics/icons/pollen.png",
      priority = "high",
      size = 64,
      mipmap_count = 4,
      flags = {"gui-icon"}
    },
    affects_evolution = true,
    affects_water_tint = false,
    damages_trees = false,
  },
  {
    type = "sprite",
    name = "pollen-icon",
    filename = "__planetaris-tellus__/graphics/icons/pollen.png",
    priority = "extra-high-no-scale",
    width = 64,
    height = 64,
    flags = {"gui-icon"},
    mipmap_count = 4,
    scale = 0.5
  },
})
