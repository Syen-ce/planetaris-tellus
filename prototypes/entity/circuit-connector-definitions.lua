

circuit_connector_definitions["root-filler"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {
    { variation = 27, main_offset = util.by_pixel(6, 2),  shadow_offset = util.by_pixel(10, 4), show_shadow = false },
    { variation = 25, main_offset = util.by_pixel(-16, 2), shadow_offset = util.by_pixel(-12, 4), show_shadow = false },
    { variation = 27, main_offset = util.by_pixel(6, 2),  shadow_offset = util.by_pixel(10, 4), show_shadow = false },
    { variation = 25, main_offset = util.by_pixel(-16, 2), shadow_offset = util.by_pixel(-12, 4), show_shadow = false }
  }
)

circuit_connector_definitions["air-purifier"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {
    { variation = 17, main_offset = util.by_pixel( -37, 24), shadow_offset = util.by_pixel( -29, 28), show_shadow = false },
    { variation = 17, main_offset = util.by_pixel( -37, 24), shadow_offset = util.by_pixel( -29, 28), show_shadow = false },
    { variation = 17, main_offset = util.by_pixel( -37, 24), shadow_offset = util.by_pixel( -29, 28), show_shadow = false },
    { variation = 17, main_offset = util.by_pixel( -37, 24), shadow_offset = util.by_pixel( -29, 28), show_shadow = false },
  }
)