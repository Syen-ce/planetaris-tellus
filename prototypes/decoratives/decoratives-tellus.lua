local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local base_sounds = require ("__base__.prototypes.entity.sounds")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local decorative_trigger_effects = require("__base__.prototypes.decorative.decorative-trigger-effects")



local decal_tile_layer = 255
local decal_opacity_over_water = 0.4
local water_decal_opacity_over_water = 0.7

-- All tellus tiles must be in the land or water lists. (Shallow water is water)
-- they must be global scope for a later test.
-- Used for tile restrictions
tellus_water_tiles = {
  "wetland-chlorophyll",
  "wetland-mycelia",
  "wetland-tellus-brown-slime",
  "wetland-light-cyan-slime",
  "wetland-cyan-slime",
  "wetland-tellus-light-dead-skin",
  "wetland-tellus-dead-skin",
  "wetland-tellus-green-tentacle",
  "wetland-tellus-light-green-tentacle",
  "tellus-deep-lake",
}
tellus_land_tiles = {
  "natural-yumako-soil",
  "natural-jellynut-soil",
  "lowland-blue-blubber",
  "lowland-cyan-blubber",
  "lowland-cyan-blubber-2",
  "lowland-cyan-blubber-3",
  "lowland-pale-cyan",
  "lowland-infected-mold",
  "lowland-infected-mold-2",
  "lowland-parasitic-dead-skin",
  "lowland-parasitic-dead-skin-2",
  "lowland-cream-green",
  "lowland-green-vein",
  "lowland-green-vein-2",
  "lowland-green-vein-3",
  "lowland-green-vein-4",
  "lowland-green-vein-dead",
  "lowland-green-infection",
  "midland-purple-bark",
  "midland-purple-bark-2",
  "midland-tellus-cracked-lichen",
  "midland-tellus-cracked-lichen-dull",
  "midland-tellus-cracked-lichen-dark",
  "midland-red-crust",
  "midland-red-crust-2",
  "midland-red-crust-3",
  "midland-red-crust-4",
  "highland-dark-rock",
  "highland-dark-rock-2",
  "highland-yellow-rock",
  "pit-rock"
}

 -- different from the normal decorative default in that it has colliding_with_tiles_only=true
local function dec_default_collision()
  return {layers={doodad=true}, colliding_with_tiles_only=true, not_colliding_with_itself=true}
end

 -- collides with cliffs. Only use for things that render in object layer and shouldn't grow on cliff edges.
local function dec_cliff_collision()
  return {layers={doodad=true, cliff=true}, not_colliding_with_itself=true}
end

 -- collides with shallow water. Only use for things that would obscure the shore too much.
local function dec_shallow_collision()
  return {layers={doodad=true, water_tile=true}, colliding_with_tiles_only=true, not_colliding_with_itself=true}
end

-- collides with land.
local function dec_land_collision()
 return {layers={doodad=true, ground_tile=true}, colliding_with_tiles_only=true, not_colliding_with_itself=true}
end

-- collides with cliff and water
local function dec_shallow_cliff_collision()
  return {layers={doodad=true, water_tile=true, cliff=true}, not_colliding_with_itself=true}
end

local function autoplaceable(prototype)
  prototype.autoplace = prototype.autoplace or { probability_expression = 0 }
end
autoplaceable(data.raw["optimized-decorative"]["lichen-decal"])
autoplaceable(data.raw["optimized-decorative"]["shroom-decal"])

local function decorative_pictures(data)
  local file_path = data.file_path
  local count = data.count or 1
  local tint_as_overlay = data.tint_as_overlay or false
  local tint = data.tint or {1,1,1,1}
  local pictures = {}
  for i = 1, count do
    table.insert(pictures,
      util.sprite_load(file_path .. '-' .. string.format("%02i", i),
        {
          tint = tint,
          tint_as_overlay = tint_as_overlay,
          scale = 0.5
        }
      )
    )
  end
  return pictures
end

local function decorative_pictures_spritesheet(data)
  local sprite_data = require(data.path)
  local pictures = {}
  for i = 1, data.count or 1 do
    table.insert(pictures,
      util.sprite_load(data.path,
        {
          tint = data.tint,
          tint_as_overlay = data.tint_as_overlay,
          scale = data.scale or 0.5,
          x = (i-1) % sprite_data.line_length * sprite_data.width,
          y = math.floor((i-1) / sprite_data.line_length) * sprite_data.height
        }
      )
    )
  end
  return pictures
end



data.extend({
     -- magnesium stromatolite
  {
    name = "planetaris-magnesium-stromatolite",
    type = "simple-entity",
    flags = {"placeable-neutral", "placeable-off-grid"},
    icon = "__planetaris-tellus__/graphics/icons/magnesium-stromatolite.png",
    subgroup = "grass",
    order = "b[decorative]-l[rock]-c-z[tellus]-b[magnesium-stromatolite]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.7, -0.7}, {0.7, 0.7}},
    collision_mask = {layers={player=true, ground_tile=true, train=true, is_object=true, is_lower_object=true}},
    damaged_trigger_effect = hit_effects.rock(),
    render_layer = "object",
    max_health = 200,
    autoplace = {
      probability_expression = "tellus_select(tellus_iron_stromatolite - clamp(tellus_decorative_knockout, 0, 1), 1.3, 2, 0.2, 0, 1)"
    },
    dying_trigger_effect = decorative_trigger_effects.big_rock(),
    minable =
    {
      mining_particle = "iron-ore-particle",
      mining_time = 0.4,
      results = {
        {type = "item", name = "stone", amount_min = 3, amount_max = 7},
        {type = "item", name = "planetaris-magnesium-bacteria", amount_min = 13, amount_max = 24},
        {type = "item", name = "iron-bacteria", amount_min = 10, amount_max = 18}
      }
    },
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    map_color = {129, 105, 78},
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = base_sounds.deconstruct_bricks(1.0),
    impact_category = "stone",
    pictures =
    {
      {
        filename = "__planetaris-tellus__/graphics/entity/stromatolite/magnesium/stromatolite-01.png",
        width = 209,
        height = 138,
        shift = {0.304688, -0.4},
        scale = 0.4
      },
      {
        filename = "__planetaris-tellus__/graphics/entity/stromatolite/magnesium/stromatolite-02.png",
        width = 165,
        height = 129,
        shift = {0.0, 0.0390625},
        scale = 0.4
      },
      {
        filename = "__planetaris-tellus__/graphics/entity/stromatolite/magnesium/stromatolite-03.png",
        width = 151,
        height = 139,
        shift = {0.151562, 0.0},
        scale = 0.4
      },
      {
        filename = "__planetaris-tellus__/graphics/entity/stromatolite/magnesium/stromatolite-04.png",
        width = 216,
        height = 110,
        shift = {0.30625, 0.0},
        scale = 0.4
      },
      {
        filename = "__planetaris-tellus__/graphics/entity/stromatolite/magnesium/stromatolite-05.png",
        width = 154,
        height = 147,
        shift = {0.328125, 0.0703125},
        scale = 0.4
      },
      {
        filename = "__planetaris-tellus__/graphics/entity/stromatolite/magnesium/stromatolite-06.png",
        width = 154,
        height = 132,
        shift = {0.16875, -0.1},
        scale = 0.4
      },
      {
        filename = "__planetaris-tellus__/graphics/entity/stromatolite/magnesium/stromatolite-07.png",
        width = 193,
        height = 130,
        shift = {0.3, -0.2},
        scale = 0.4
      },
      {
        filename = "__planetaris-tellus__/graphics/entity/stromatolite/magnesium/stromatolite-08.png",
        width = 136,
        height = 117,
        shift = {0.0, 0.0},
        scale = 0.4
      },
      {
        filename = "__planetaris-tellus__/graphics/entity/stromatolite/magnesium/stromatolite-09.png",
        width = 157,
        height = 115,
        shift = {0.1, 0.0},
        scale = 0.4
      },
      {
        filename = "__planetaris-tellus__/graphics/entity/stromatolite/magnesium/stromatolite-10.png",
        width = 198,
        height = 153,
        shift = {0.325, -0.1},
        scale = 0.4
      },
      {
        filename = "__planetaris-tellus__/graphics/entity/stromatolite/magnesium/stromatolite-11.png",
        width = 190,
        height = 115,
        shift = {0.453125, 0.0},
        scale = 0.4
      },
      {
        filename = "__planetaris-tellus__/graphics/entity/stromatolite/magnesium/stromatolite-12.png",
        width = 229,
        height = 126,
        shift = {0.539062, -0.015625},
        scale = 0.4
      },
      {
        filename = "__planetaris-tellus__/graphics/entity/stromatolite/magnesium/stromatolite-13.png",
        width = 151,
        height = 125,
        shift = {0.0703125, 0.179688},
        scale = 0.4
      },
      {
        filename = "__planetaris-tellus__/graphics/entity/stromatolite/magnesium/stromatolite-14.png",
        width = 137,
        height = 117,
        shift = {0.160938, 0.0},
        scale = 0.4
      },
      {
        filename = "__planetaris-tellus__/graphics/entity/stromatolite/magnesium/stromatolite-15.png",
        width = 201,
        height = 141,
        shift = {0.242188, -0.195312},
        scale = 0.4
      },
      {
        filename = "__planetaris-tellus__/graphics/entity/stromatolite/magnesium/stromatolite-16.png",
        width = 209,
        height = 154,
        shift = {0.351562, -0.1},
        scale = 0.4
      }
    },
    water_reflection =
    {
      pictures =
        {
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-01-effect-map.png",
            width = 96,
            height = 92,
            shift = {0.304688, -0.3},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-02-effect-map.png",
            width = 78,
            height = 92,
            shift = {0.0, 0.3},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-03-effect-map.png",
            width = 70,
            height = 91,
            shift = {0.151562, 0.1},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-04-effect-map.png",
            width = 88,
            height = 94,
            shift = {0.390625, 0.3},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-05-effect-map.png",
            width = 77,
            height = 92,
            shift = {0.328125, 0.0703125},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-06-effect-map.png",
            width = 77,
            height = 92,
            shift = {0.16875, 0.1},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-07-effect-map.png",
            width = 94,
            height = 93,
            shift = {0.3, 0.0},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-08-effect-map.png",
            width = 63,
            height = 93,
            shift = {0.0, 0.2},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-09-effect-map.png",
            width = 79,
            height = 93,
            shift = {0.1, 0.2},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-10-effect-map.png",
            width = 93,
            height = 93,
            shift = {0.325, -0.1},
            scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-11-effect-map.png",
            width = 95,
            height = 93,
            shift = {0.453125, 0.2},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-12-effect-map.png",
            width = 92,
            height = 92,
            shift = {0.3, 0.1},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-13-effect-map.png",
            width = 76,
            height = 93,
            shift = {0.0703125, 0.3},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-14-effect-map.png",
            width = 63,
            height = 93,
            shift = {0.160938, 0.2},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-15-effect-map.png",
            width = 101,
            height = 92,
            shift = {0.242188, -0.1},
          scale = 0.8
          },
          {
            filename = "__space-age__/graphics/entity/stromatolite/copper/stromatolite-16-effect-map.png",
            width = 88,
            height = 92,
            shift = {0.1, -0.1},
          scale = 0.8
          }
        }
    }
  },
   -- PALE LETTUCE CUPS 1X1
  {
    name = "cyan-lettuce-lichen-cups-1x1",
    type = "optimized-decorative",
    order = "b[cover]-a[yellow-lichen-cups]-c[1]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    collision_mask = dec_default_collision(),
    walking_sound = base_tile_sounds.walking.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    opacity_over_water = decal_opacity_over_water,
    autoplace =
    {
      order = "d[decorative]-c[trivial]-d[cups]-c[outer]",
      placement_density = 2,
      probability_expression = "grpi(0.3) + tellus_water_plant_ramp * tellus_select(tellus_purple_cups - 0.7 * clamp(tellus_decorative_knockout, 0, 1), -0.5, -0.1, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 11, file_path = "__planetaris-tellus__/graphics/decorative/tellus-pale-lettuce-lichen-cups/tellus-pale-lettuce-lichen-cups-1x1"})
  },
 -- PALE LETTUCE CUPS 3X3
  {
    name = "cyan-lettuce-lichen-cups-3x3",
    type = "optimized-decorative",
    order = "b[cover]-a[yellow-lichen-cups]-b[3]",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    collision_mask = dec_default_collision(),
    walking_sound = base_tile_sounds.walking.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    opacity_over_water = decal_opacity_over_water,
    autoplace =
    {
      order = "d[decorative]-c[trivial]-d[cups]-b[mid-ring]",
      probability_expression = "grpi(0.2) + tellus_water_plant_ramp * tellus_select(tellus_purple_cups - 0.8 * clamp(tellus_decorative_knockout, 0, 1), -0.1, 0.2, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 12, file_path = "__planetaris-tellus__/graphics/decorative/tellus-pale-lettuce-lichen-cups/tellus-pale-lettuce-lichen-cups-3x3"})
  },
 -- PALE LETTUCE CUPS 6X6
  {
    name = "cyan-lettuce-lichen-cups-6x6",
    type = "optimized-decorative",
    order = "b[cover]-a[yellow-lichen-cups]-a[6]",
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    collision_mask = dec_default_collision(),
    walking_sound = base_tile_sounds.walking.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    opacity_over_water = decal_opacity_over_water,
    autoplace =
    {
      order = "d[decorative]-c[trivial]-d[cups]-a[inner]",
      probability_expression = "grpi(0.1) + tellus_water_plant_ramp * tellus_select(tellus_purple_cups - 0.9 * clamp(tellus_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 12, file_path = "__planetaris-tellus__/graphics/decorative/tellus-pale-lettuce-lichen-cups/tellus-pale-lettuce-lichen-cups-6x6"})
  },
    {
    name = "blue-cup",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    collision_mask = dec_shallow_cliff_collision(),
    walking_sound = base_tile_sounds.walking.small_bush,
    render_layer = "object",
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace =
    {
      placement_density = 2,
      probability_expression = "grpi(0.6) + tellus_select(tellus_green_cup - clamp(tellus_decorative_knockout, 0, 1), 0.2, 2, 0.2, 0, 1)"
    },
    pictures = util.spritesheets_to_pictures({{path = "__planetaris-tellus__/graphics/decorative/blue-cup/blue-cup", frame_count = 14}}),
  },
{
    name = "tellus-polycephalum-slime",
    type = "optimized-decorative",
    order = "a[polycephalum]-a[slime]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    collision_mask = dec_shallow_collision(),
    walking_sound = base_tile_sounds.walking.mud,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace = {
      order = "d[decorative]-c[trivial]-c[cover]-c[outer]",
      probability_expression = "tellus_select(tellus_polycephalum - clamp(-tellus_decorative_knockout, 0, 1), 0.9, 2, 0.2, 0, 1)"
    },
    pictures = decorative_pictures_spritesheet{path = "__planetaris-tellus__/graphics/decorative/polycephalum/polycephalum-slime", count = 17}
  },
  {
    name = "tellus-polycephalum-balloon",
    type = "optimized-decorative",
    order = "a[polycephalum]-b[balloon]",
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    collision_mask = dec_shallow_cliff_collision(),
    walking_sound = base_tile_sounds.walking.plant,
    render_layer = "object",
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace = {
      order = "d[decorative]-c[trivial]-b[bush]-a[inner]",
      probability_expression = "grpi(0.6) + tellus_select(tellus_polycephalum - clamp(-tellus_decorative_knockout, 0, 1), 1, 2, 0.2, 0, 1)"
    },
    pictures = decorative_pictures_spritesheet{path = "__space-age__/graphics/decorative/polycephalum/polycephalum-balloon", count = 13, scale = 0.7}
  },
   -- NERVE ROOTS DENSE
  {
    name = "tellus-nerve-roots-dense",
    type = "optimized-decorative",
    order = "b[decorative]-b[red-desert-decal]",
    collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
    collision_mask = dec_default_collision(),
    walking_sound = base_tile_sounds.walking.plant,
    render_layer = "decals",
    tile_layer = decal_tile_layer - 1,
    opacity_over_water = decal_opacity_over_water,
    autoplace = {
      probability_expression = 0
    },
    pictures =
    {
      --NERVE-dense
      {
        filename = "__planetaris-tellus__/graphics/decorative/nerve-roots/nerve-root-dense-01.png",
        width = 1536,
        height = 990,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__planetaris-tellus__/graphics/decorative/nerve-roots/nerve-root-dense-02.png",
        width = 1536,
        height = 990,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__planetaris-tellus__/graphics/decorative/nerve-roots/nerve-root-dense-03.png",
        width = 1536,
        height = 990,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },
      {
        filename = "__planetaris-tellus__/graphics/decorative/nerve-roots/nerve-root-dense-04.png",
        width = 1536,
        height = 990,
        shift = util.by_pixel(0, -0.25),
        scale = 0.5
      },

    }
  },
  -- CORAL
    {
    name = "tellus-coral-land",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    collision_mask = dec_shallow_collision(),
    walking_sound = base_tile_sounds.walking.small_bush,
    render_layer = "object",
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace =
    {
      placement_density = 2,
      probability_expression = "grpi(0.5) + tellus_select(tellus_corals - clamp(tellus_decorative_knockout, 0, 1), 0.3, 2, 0.1, 0, 1)"
    },
    pictures = util.spritesheets_to_pictures({{path = "__planetaris-tellus__/graphics/decorative/coral/coral", frame_count = 12}}),
  },
  {
    name = "tellus-coral-water",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    collision_mask = dec_land_collision(),
    walking_sound = base_tile_sounds.walking.mud,
    render_layer = "object",
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace =
    {
      placement_density = 2,
      probability_expression = "grpi(0.7) + tellus_water_plant_ramp * tellus_select(tellus_corals - clamp(tellus_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
    },
    pictures = util.spritesheets_to_pictures({{path = "__planetaris-tellus__/graphics/decorative/coral-water/coral-water", frame_count = 15}}),
  },
   -- CORAL STUNTED
  {
    name = "tellus-coral-stunted",
    type = "optimized-decorative",
    order = "b[decorative]-b[red-desert-decal]",
    collision_box = {{-3.375, -2.3125}, {3.25, 2.3125}},
    -- don't collide with water so can overlap shallows, but tile restricturion means it cannot be placed directly on shallows
    collision_mask = dec_default_collision(),
    walking_sound = base_tile_sounds.walking.mud,
    render_layer = "decals",
    tile_layer = decal_tile_layer - 1,
    opacity_over_water = decal_opacity_over_water,
    autoplace = {
      tile_restriction = tellus_land_tiles,
      probability_expression = "min(0.2, tellus_coral_stunted)"
    },
    pictures =
    {
      --lightDecal
      {
        filename = "__planetaris-tellus__/graphics/decorative/coral-stunted/coral-stunted-00.png",
        width = 400,
        height = 299,
        shift = util.by_pixel(4.5, -2.25),
        scale = 0.5
      },
      {
        filename = "__planetaris-tellus__/graphics/decorative/coral-stunted/coral-stunted-01.png",
        width = 419,
        height = 320,
        shift = util.by_pixel(-0.75, 2),
        scale = 0.5
      },
      {
        filename = "__planetaris-tellus__/graphics/decorative/coral-stunted/coral-stunted-02.png",
        width = 417,
        height = 287,
        shift = util.by_pixel(-1.25, 1.25),
        scale = 0.5
      },
      {
        filename = "__planetaris-tellus__/graphics/decorative/coral-stunted/coral-stunted-03.png",
        width = 421,
        height = 298,
        shift = util.by_pixel(-0.25, 5.5),
        scale = 0.5
      },
      {
        filename = "__planetaris-tellus__/graphics/decorative/coral-stunted/coral-stunted-04.png",
        width = 396,
        height = 302,
        shift = util.by_pixel(6, 4),
        scale = 0.5
      },
      {
        filename = "__planetaris-tellus__/graphics/decorative/coral-stunted/coral-stunted-05.png",
        width = 408,
        height = 295,
        shift = util.by_pixel(-2.5, 7.75),
        scale = 0.5
      },
      {
        filename = "__planetaris-tellus__/graphics/decorative/coral-stunted/coral-stunted-06.png",
        width = 417,
        height = 317,
        shift = util.by_pixel(-1.25, 3.25),
        scale = 0.5
      },
      {
        filename = "__planetaris-tellus__/graphics/decorative/coral-stunted/coral-stunted-07.png",
        width = 419,
        height = 312,
        shift = util.by_pixel(0.75, 2.5),
        scale = 0.5
      },
      {
        filename = "__planetaris-tellus__/graphics/decorative/coral-stunted/coral-stunted-08.png",
        width = 413,
        height = 317,
        shift = util.by_pixel(-2.25, 2.25),
        scale = 0.5
      },
      {
        filename = "__planetaris-tellus__/graphics/decorative/coral-stunted/coral-stunted-09.png",
        width = 403,
        height = 310,
        shift = util.by_pixel(0.25, 1.5),
        scale = 0.5
      },
      {
        filename = "__planetaris-tellus__/graphics/decorative/coral-stunted/coral-stunted-10.png",
        width = 411,
        height = 307,
        shift = util.by_pixel(-0.75, 1.75),
        scale = 0.5
      },
      {
        filename = "__planetaris-tellus__/graphics/decorative/coral-stunted/coral-stunted-11.png",
        width = 421,
        height = 295,
        shift = util.by_pixel(-0.25, -0.75),
        scale = 0.5
      }
    }
  },
  {
    name = "red-lettuce-lichen-1x1",
    type = "optimized-decorative",
    order = "b[cover]-b[yellow-lichen]-c[1]",
    collision_box = {{-0.5, -0.4}, {0.5, 0.4}},
    collision_mask = dec_shallow_collision(),
    walking_sound = base_tile_sounds.walking.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    opacity_over_water = decal_opacity_over_water,
    autoplace =
    { -- process: survival_chance + subtype_selection_band_of: (region_box - small_scale_knockout)
      order = "d[decorative]-c[trivial]-c[cover]-c[outer]",
      probability_expression = "grpi(0.5) + tellus_select(tellus_yellow_lettuce - 0.6 * clamp(tellus_decorative_knockout, 0, 1), -0.6, -0.1, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 11, file_path = "__planetaris-tellus__/graphics/decorative/tellus-red-lettuce-lichen/tellus-red-lettuce-lichen-1x1"})
  },
  {
    name = "red-lettuce-lichen-3x3",
    type = "optimized-decorative",
    order = "b[cover]-b[yellow-lichen]-b[3]",
    collision_box = {{-1, -0.8}, {1, 0.8}},
    collision_mask = dec_shallow_collision(),
    walking_sound = base_tile_sounds.walking.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    opacity_over_water = decal_opacity_over_water,
    autoplace =
    {
      order = "d[decorative]-c[trivial]-c[cover]-b[mid-ring]",
      probability_expression = "grpi(0.5) + tellus_select(tellus_yellow_lettuce - 0.7 * clamp(tellus_decorative_knockout, 0, 1), 0.-0.1, 0.3, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 12, file_path = "__planetaris-tellus__/graphics/decorative/tellus-red-lettuce-lichen/tellus-red-lettuce-lichen-3x3"})
  },
  {
    name = "red-lettuce-lichen-6x6",
    type = "optimized-decorative",
    order = "b[cover]-b[yellow-lichen]-a[6]",
    collision_box = {{-2, -1.6}, {2, 1.6}},
    collision_mask = dec_shallow_collision(),
    walking_sound = base_tile_sounds.walking.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    opacity_over_water = decal_opacity_over_water,
    autoplace =
    {
      order = "d[decorative]-c[trivial]-c[cover]-a[inner]",
      probability_expression = "grpi(0.5) + tellus_select(tellus_yellow_lettuce - 0.8 * clamp(tellus_decorative_knockout, 0, 1), 0.3, 10, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 12, file_path = "__planetaris-tellus__/graphics/decorative/tellus-red-lettuce-lichen/tellus-red-lettuce-lichen-6x6"})
  },
  {
    name = "red-lettuce-lichen-cups-1x1",
    type = "optimized-decorative",
    order = "b[cover]-a[yellow-lichen-cups]-c[1]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    walking_sound = base_tile_sounds.walking.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    opacity_over_water = decal_opacity_over_water,
    autoplace =
    {
      order = "d[decorative]-c[trivial]-d[cups]-c[outer]",
      probability_expression = "grpi(0.3) + tellus_select(tellus_yellow_lettuce_cups - 0.7 * clamp(tellus_decorative_knockout, 0, 1), -0.5, -0.2, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 11, file_path = "__planetaris-tellus__/graphics/decorative/tellus-red-lettuce-lichen-cups/tellus-red-lettuce-lichen-cups-1x1"})
  },
  {
    name = "red-lettuce-lichen-cups-3x3",
    type = "optimized-decorative",
    order = "b[cover]-a[yellow-lichen-cups]-b[3]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    walking_sound = base_tile_sounds.walking.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    opacity_over_water = decal_opacity_over_water,
    autoplace =
    {
      order = "d[decorative]-c[trivial]-d[cups]-b[mid-ring]",
      probability_expression = "grpi(0.2) + tellus_select(tellus_yellow_lettuce_cups - 0.8 * clamp(tellus_decorative_knockout, 0, 1), -0.2, 0.2, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 12, file_path = "__planetaris-tellus__/graphics/decorative/tellus-red-lettuce-lichen-cups/tellus-red-lettuce-lichen-cups-3x3"})
  },
  {
    name = "red-lettuce-lichen-cups-6x6",
    type = "optimized-decorative",
    order = "b[cover]-a[yellow-lichen-cups]-a[6]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    walking_sound = base_tile_sounds.walking.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    opacity_over_water = decal_opacity_over_water,
    autoplace =
    {
      order = "d[decorative]-c[trivial]-d[cups]-a[inner]",
      probability_expression = "grpi(0.1) + tellus_select(tellus_yellow_lettuce_cups - 0.9 * clamp(tellus_decorative_knockout, 0, 1), 0.2, 0.5, 0.1, 0, 1)"
    },
    pictures = decorative_pictures({count = 12, file_path = "__planetaris-tellus__/graphics/decorative/tellus-red-lettuce-lichen-cups/tellus-red-lettuce-lichen-cups-6x6"})
  },
-- SPAWNER SLIME
  {
    name = "tellus-spawner-slime",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_mask = {layers={ground_tile=true}, colliding_with_tiles_only=true}, -- allow on deeper water (which has doodad=true)
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    render_layer = "decals",
    tile_layer = 10, -- above water tiles, blow land tiles
    -- opacity_over_water = decal_opacity_over_water,
    pictures =
    {
      {
        filename = "__planetaris-tellus__/graphics/decorative/tellus-spawner-slime/spawning-foam-0000.png",
        width = 768,
        height = 768,
        shift = util.by_pixel(0, 0),
        scale = 0.5
      },
      {
      filename = "__planetaris-tellus__/graphics/decorative/tellus-spawner-slime/spawning-foam-0001.png",
      width = 768,
      height = 768,
      shift = util.by_pixel(0, 0),
      scale = 0.5
    },
    {
      filename = "__planetaris-tellus__/graphics/decorative/tellus-spawner-slime/spawning-foam-0002.png",
      width = 768,
      height = 768,
      shift = util.by_pixel(0, 0),
      scale = 0.5
    },
    {
      filename = "__planetaris-tellus__/graphics/decorative/tellus-spawner-slime/spawning-foam-0003.png",
      width = 768,
      height = 768,
      shift = util.by_pixel(0, 0),
      scale = 0.5
    },
    {
      filename = "__planetaris-tellus__/graphics/decorative/tellus-spawner-slime/spawning-foam-0004.png",
      width = 768,
      height = 768,
      shift = util.by_pixel(0, 0),
      scale = 0.5
    },
    {
      filename = "__planetaris-tellus__/graphics/decorative/tellus-spawner-slime/spawning-foam-0005.png",
      width = 768,
      height = 768,
      shift = util.by_pixel(0, 0),
      scale = 0.5
    },
    {
      filename = "__planetaris-tellus__/graphics/decorative/tellus-spawner-slime/spawning-foam-0006.png",
      width = 768,
      height = 768,
      shift = util.by_pixel(0, 0),
      scale = 0.5
    },
    }
  },
})