local planet_map_gen = require("__base__/prototypes/planet/planet-map-gen")

planet_map_gen.tellus = function()
  return
  {
    cliff_settings =
    {
      name = "cliff-gleba",
      control = "tellus_cliff",
      cliff_elevation_0 = 40,
      cliff_elevation_interval = 60,
      richness = 0.80,
      cliff_smoothing = 0
    },
    property_expression_names =
    {
      elevation = "tellus_elevation",
      aux = "tellus_aux",
      moisture = "tellus_moisture",
      temperature = "tellus_temperature",
      cliffiness = "tellus_cliffiness",
      cliff_elevation = "cliff_elevation_from_elevation",
      enemy_base_radius = "tellus_enemy_base_radius",
      enemy_base_frequency = "tellus_enemy_base_frequency",
      ["entity:stone:richness"] = "tellus_stone_richness",
      ["entity:stone:probability"] = "tellus_stone_probability",

      ["decorative:red-desert-bush:probability"] = "tellus_red_desert_bush_probability",
      ["decorative:white-desert-bush:probability"] = "tellus_white_desert_bush_probability",
      ["decorative:red-pita:probability"] = "tellus_red_pita_probability",
      ["decorative:green-bush-mini:probability"] = "tellus_green_bush_probability",
      ["decorative:green-croton:probability"] = "tellus_green_cronton_probability",
      ["decorative:green-pita:probability"] = "tellus_green_pita_probability",
      ["decorative:green-pita-mini:probability"] = "tellus_green_pita_mini_probability",
      ["decorative:lichen-decal:probability"] = "tellus_orange_lichen_probability",
      ["decorative:shroom-decal:probability"] = "tellus_carpet_shroom_probability",
      ["decorative:cracked-mud-decal:probability"] = "tellus_cracked_mud_probability",
      ["decorative:light-mud-decal:probability"] = "tellus_light_mud_probability",
      ["decorative:dark-mud-decal:probability"] = "tellus_dark_mud_probability",
      ["decorative:green-carpet-grass:probability"] = "tellus_green_carpet_grass_probability",
      ["decorative:green-hairy-grass:probability"] = "tellus_green_hairy_grass_probability"
    },
    autoplace_controls =
    {
      ["tellus_stone"] = {},
      ["tellus_plants"] = {},
      ["tellus_enemy_base"] = {},
      ["tellus_water"] = {},
      ["tellus_cliff"] = {},
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          ["natural-mycelia-soil"] = {},
          ["natural-chlorophyll-soil"] = {},
          ["wetland-mycelia"] = {},
          ["wetland-chlorophyll"] = {},
          ["wetland-tellus-brown-slime"] = {},
          ["wetland-light-cyan-slime"] = {},
          ["wetland-cyan-slime"] = {},
          ["wetland-tellus-light-dead-skin"] = {},
          ["wetland-tellus-dead-skin"] = {},
          ["wetland-tellus-light-green-tentacle"] = {},
          ["wetland-tellus-green-tentacle"] = {},
          ["tellus-deep-lake"] = {},
          ["lowland-blue-blubber"] = {},
          ["lowland-cyan-blubber"] = {},
          ["lowland-cyan-blubber-2"] = {},
          ["lowland-cyan-blubber-3"] = {},
          ["lowland-pale-cyan"] = {},
          ["lowland-infected-mold"] = {},
          ["lowland-infected-mold-2"] = {},
          ["lowland-parasitic-dead-skin"] = {},
          ["lowland-parasitic-dead-skin-2"] = {},
          ["lowland-cream-green"] = {},
          ["lowland-green-vein"] = {},
          ["lowland-green-vein-2"] = {},
          ["lowland-green-vein-3"] = {},
          ["lowland-green-vein-4"] = {},
          ["lowland-green-vein-dead"] = {},
          ["lowland-green-infection"] = {},
          ["midland-purple-bark"] = {},
          ["midland-purple-bark-2"] = {},
          ["midland-tellus-cracked-lichen"] = {},
          ["midland-tellus-cracked-lichen-dull"] = {},
          ["midland-tellus-cracked-lichen-dark"] = {},
          ["midland-red-crust"] = {},
          ["midland-red-crust-2"] = {},
          ["midland-red-crust-3"] = {},
          ["midland-red-crust-4"] = {},
          ["highland-dark-rock"] = {},
          ["highland-dark-rock-2"] = {},
          ["highland-yellow-rock"] = {},
          ["pit-rock"] = {}
        }

      },
      ["decorative"] =
      {
        settings =
        {
          ["red-lettuce-lichen-1x1"] = {},
          ["red-lettuce-lichen-3x3"] = {},
          ["red-lettuce-lichen-6x6"] = {},
          ["red-lettuce-lichen-cups-1x1"] = {},
          ["red-lettuce-lichen-cups-3x3"] = {},
          ["red-lettuce-lichen-cups-6x6"] = {},
          ["green-lettuce-lichen-1x1"] = {},
          ["green-lettuce-lichen-3x3"] = {},
          ["green-lettuce-lichen-6x6"] = {},
          ["green-lettuce-lichen-water-1x1"] = {},
          ["green-lettuce-lichen-water-3x3"] = {},
          ["green-lettuce-lichen-water-6x6"] = {},
          ["honeycomb-fungus"] = {},
          ["honeycomb-fungus-1x1"] = {},
          ["honeycomb-fungus-decayed"] = {},
          ["split-gill-1x1"] = {},
          ["split-gill-2x2"] = {},
          ["split-gill-dying-1x1"] = {},
          ["split-gill-dying-2x2"] = {},
          ["split-gill-red-1x1"] = {},
          ["split-gill-red-2x2"] = {},
          ["veins"] = {},
          ["veins-small"] = {},
          ["mycelium"] = {},
          ["tellus-coral-water"] = {},
          ["tellus-coral-land"] = {},
          ["black-sceptre"] = {},
          ["pink-phalanges"] = {},
          ["pink-lichen-decal"] = {},
          ["red-lichen-decal"] = {},
          ["blue-cup"] = {},
          ["brown-cup"] = {},
          ["blood-grape"] = {},
          ["blood-grape-vibrant"] = {},
          ["brambles"] = {},
          ["tellus-polycephalum-slime"] = {},
          ["tellus-polycephalum-balloon"] = {},
          ["fuchsia-pita"] = {},
          ["wispy-lichen"] = {},
          ["grey-cracked-mud-decal"] = {},
          ["barnacles-decal"] = {},
          ["tellus-coral-stunted"] = {},
          ["coral-stunted-grey"] = {},
          ["red-nerve-roots-veins-dense"] = {},
          ["red-nerve-roots-veins-sparse"] = {},
          ["purple-nerve-roots-veins-dense"] = {},
          ["purple-nerve-roots-veins-sparse"] = {},
          ["cream-nerve-roots-veins-dense"] = {},
          ["cream-nerve-roots-veins-sparse"] = {},
          ["yellow-coral"] = {},
          ["solo-barnacle"] = {},
          ["curly-roots-orange"] = {},
          ["knobbly-roots"] = {},
          ["knobbly-roots-orange"] = {},
          ["matches-small"] = {},
          ["cyan-lettuce-lichen-cups-1x1"] = {},
          ["cyan-lettuce-lichen-cups-3x3"] = {},
          ["cyan-lettuce-lichen-cups-6x6"] = {},
          ["pale-lettuce-lichen-1x1"] = {},
          ["pale-lettuce-lichen-3x3"] = {},
          ["pale-lettuce-lichen-6x6"] = {},
          ["pale-lettuce-lichen-water-1x1"] = {},
          ["pale-lettuce-lichen-water-3x3"] = {},
          ["pale-lettuce-lichen-water-6x6"] = {},
          ["white-carpet-grass"] = {},
          ["green-carpet-grass"] = {},
          ["green-hairy-grass"] = {},

          --shared
          ["light-mud-decal"] = {},
          ["dark-mud-decal"] = {},
          ["cracked-mud-decal"] = {},
          ["red-desert-bush"] = {},
          ["white-desert-bush"] = {},
          ["red-pita"] = {},
          ["green-bush-mini"] = {},
          ["green-croton"] = {},
          ["green-pita"] = {},
          ["green-pita-mini"] = {},
          ["lichen-decal"] = {},
          ["shroom-decal"] = {}
        }
      },
      ["entity"] =
      {
        settings =
        {
          ["stone"] = {},
          ["planetaris-magnesium-stromatolite"] = {},
          ["copper-stromatolite"] = {},
          --["iron-stromatolite"] = {}
        }
      }
    }
  }
end

return planet_map_gen