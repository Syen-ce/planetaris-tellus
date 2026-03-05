local base_tile_pollution_values = require("__space-age__/prototypes/tile/tile-pollution-values")
local planetaris_tile_pollution_values =
{
  tellus =      { pollen    = 0.000010 },
  tellus_water ={ pollen    = 0.000030 },
}
return util.merge{base_tile_pollution_values, planetaris_tile_pollution_values}
