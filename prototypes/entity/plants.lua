local util = require('util')
local sounds = require("__base__.prototypes.entity.sounds")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")
local planetaris_simulations = require("__planetaris-tellus__.prototypes.factoriopedia-simulations")

local seconds = 60
local minutes = 60*seconds

local bioassembler_emissions = { pollen = 0.1 }
local plant_emissions = { pollen = -0.001 }
local plant_harvest_emissions = { pollen = 15 }
local plant_flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"}
local max_brightness = 0.6

local gleba_tree_static_influence = -0.8
local gleba_tree_probability_multiplier = 0.3

local leaf_sound = sounds.tree_leaves
local spoilage_sound = sound_variations("__space-age__/sound/mining/spoilage", 3, 0) --at zero vol until the correct particle fx are in place



local holiumnite_pictures = {
  {
    layers =
    {
      util.sprite_load("__planetaris-tellus__/graphics/entity/plant/holmiumnite/holmiumnite_00",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_00",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__planetaris-tellus__/graphics/entity/plant/holmiumnite/holmiumnite_01",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_01",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__planetaris-tellus__/graphics/entity/plant/holmiumnite/holmiumnite_02",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_02",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__planetaris-tellus__/graphics/entity/plant/holmiumnite/holmiumnite_03",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_03",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__planetaris-tellus__/graphics/entity/plant/holmiumnite/holmiumnite_04",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_04",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__planetaris-tellus__/graphics/entity/plant/holmiumnite/holmiumnite_05",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_05",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__planetaris-tellus__/graphics/entity/plant/holmiumnite/holmiumnite_06",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_06",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__planetaris-tellus__/graphics/entity/plant/holmiumnite/holmiumnite_07",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_07",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__planetaris-tellus__/graphics/entity/plant/holmiumnite/holmiumnite_08",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_08",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__planetaris-tellus__/graphics/entity/plant/holmiumnite/holmiumnite_09",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_09",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
}

local function lerp_color(a, b, amount)
  return {
    r = a.r + (b.r - a.r) * amount,
    g = a.g + (b.g - a.g) * amount,
    b = a.b + (b.b - a.b) * amount
  }
end

local function lerp_colors(a_set, b, amount)
  local new_colors = {}
  for i, a in pairs(a_set) do
    new_colors[i] = lerp_color(a, b, amount)
  end
  return new_colors
end

local function tree_stateless_visualisation(positions)
  -- high intensity so overlapping doesn't have much effect
  -- low max brightness to keep effect restrained.
  local max_brightness = 0.6
  return
  {
    min_count = 1,
    max_count = 2,
    offset_x = { -0.05, 0.05 }, -- will be random from range -0.05 to 0.05
    offset_y = { -0.05, 0.05 },
    positions = positions,

    render_layer = "object",
    adjust_animation_speed_by_base_scale = true,
    scale = { 0.2, 0.6 },

    light =
    {
      intensity = 0.7,
      size = 32,
      color = {0.5 * max_brightness, 0.75 * max_brightness, 1 * max_brightness},
      flicker_interval = 90,
      flicker_min_modifier = 0.8,
      flicker_max_modifier = 1.2,
      offset_flicker = true
    },
  }
end
local function make_offsets_on_tree(origin_x, origin_y, pixel_coords)
  local result = {}
  for i,coord in pairs(pixel_coords) do
    table.insert(result, { (coord[1] - origin_x) / 64, (coord[2] - origin_y) / 64 }) -- assumes high res -> 64 pixels per tile
  end
  return result
end

local leaf_sound_trigger =
{
  {
    type = "play-sound",
    sound = leaf_sound,
    damage_type_filters = "fire"
  }
}

local spoilage_sound_trigger =
{
  {
    type = "play-sound",
    sound = spoilage_sound,
    damage_type_filters = "fire"
  }
}

local tellus_tree_particle_effects =
{
  ["bioassembler"] =  { crop_3 = "bioassembler-leaf-particle",
                        trunk_3 = "bioassembler-branch-particle"
                      },
  ["chloronack"] =    { slime = "slipstack-leaf-particle",
                        spongy = "slipstack-branch-particle"
                      },
  ["myceliae"] =      { crop_3 = "boompuff-leaf-particle",
                        trunk_1 = "teflilly-branch-particle"
                      },
  ["chloroplast"] =      { crop_3 = "boompuff-leaf-particle",
                        trunk_1 = "teflilly-branch-particle"
                      },
  ["bacteriotrunk"] = { crop_3 = "boompuff-leaf-particle",
                        trunk_3 = "boompuff-branch-particle"
                      },
  ["tellus-water-cane"] = { water_cane_top = "water-cane-branch-particle",
                        water_cane = "water-cane-branch-particle"
                      },
  ["moldant"] =     { crop_4 = "cuttlepop-leaf-particle",
                        spongy = "cuttlepop-branch-particle"
                      },
  ["mushell"] =   { crop_1 = "funneltrunk-leaf-particle",
                        spongy = "funneltrunk-branch-particle"
                      },
  ["carbolyte"] =     { crop_1 = "sunnycomb-leaf-particle",
                        spongy = "sunnycomb-branch-particle"
                      },
}

local function tellus_tree_variations(name, variation_count, per_row, scale_multiplier, width, height, shift, reflection_shift)
  variation_count = variation_count or 5
  per_row = per_row or 5
  scale_multiplier = scale_multiplier or 1
  local width = width or 640
  local height = height or 560
  local variations = {}
  local reflection_shift = reflection_shift or util.by_pixel(52, 80)
  local shift = shift or util.by_pixel(52, -40)
 -- local reflection_shift = {shift[0], shift[1]} --or util.by_pixel(52, 40)

  local sap_particle = tellus_tree_particle_effects[name] and tellus_tree_particle_effects[name].sap
  local leaf_particle_1 = tellus_tree_particle_effects[name] and tellus_tree_particle_effects[name].leaf_1
  local leaf_particle_2 = tellus_tree_particle_effects[name] and tellus_tree_particle_effects[name].leaf_2
  local leaf_particle_3 = tellus_tree_particle_effects[name] and tellus_tree_particle_effects[name].leaf_3
  local crop_particle_1 = tellus_tree_particle_effects[name] and tellus_tree_particle_effects[name].crop_1
  local crop_particle_2 = tellus_tree_particle_effects[name] and tellus_tree_particle_effects[name].crop_2
  local crop_particle_3 = tellus_tree_particle_effects[name] and tellus_tree_particle_effects[name].crop_3
  local crop_particle_4 = tellus_tree_particle_effects[name] and tellus_tree_particle_effects[name].crop_4
  local slime_particle = tellus_tree_particle_effects[name] and tellus_tree_particle_effects[name].slime
  local trunk_particle_1 = tellus_tree_particle_effects[name] and tellus_tree_particle_effects[name].trunk_1
  local trunk_particle_2 = tellus_tree_particle_effects[name] and tellus_tree_particle_effects[name].trunk_2
  local trunk_particle_3 = tellus_tree_particle_effects[name] and tellus_tree_particle_effects[name].trunk_3
  local spongy_particle = tellus_tree_particle_effects[name] and tellus_tree_particle_effects[name].spongy
  local water_cane_particle = tellus_tree_particle_effects[name] and tellus_tree_particle_effects[name].water_cane
  local water_cane_top_particle = tellus_tree_particle_effects[name] and tellus_tree_particle_effects[name].water_cane_top
  local jellystem_particle = tellus_tree_particle_effects[name] and tellus_tree_particle_effects[name].jellystem

  for i = 1, variation_count do
    local x = ((i - 1) % per_row) * width
    local y = math.floor((i-1)/per_row) * height
    local variation = {
      trunk = {
        filename = "__planetaris-tellus__/graphics/entity/plant/"..name.."/"..name.."-trunk.png",
        flags = { "mipmap" },
        surface = "any",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      leaves = {
        filename = "__planetaris-tellus__/graphics/entity/plant/"..name.."/"..name.."-harvest.png",
        flags = { "mipmap" },
        surface = "any",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      normal = {
        filename = "__planetaris-tellus__/graphics/entity/plant/"..name.."/"..name.."-normal.png",
        surface = "any",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      shadow = {
        frame_count = 2,
        lines_per_file = 1,
        line_length = 1,
        flags = { "mipmap", "shadow" },
        surface = "any",
        filenames =
        {
          "__planetaris-tellus__/graphics/entity/plant/"..name.."/"..name.."-harvest-shadow.png",
          "__planetaris-tellus__/graphics/entity/plant/"..name.."/"..name.."-shadow.png"
        },
        width = width,
        height = height,
        x = x,
        y = y,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },

      water_reflection = {
        pictures = {
        filename = "__planetaris-tellus__/graphics/entity/plant/"..name.."/"..name.."-effect-map.png",
        --flags = { "mipmap" },
        surface = "any",
        width = width,
        height = height,
        x = x,
        y = y,
        --frame_count = 1,
        shift = reflection_shift,
        scale = 0.33 * scale_multiplier
        }
      } or nil,

      leaf_generation = {},
      branch_generation = {},

      leaves_when_damaged = 100,
      leaves_when_destroyed = 35,
      leaves_when_mined_manually = 40,
      leaves_when_mined_automatically = 16,
      branches_when_damaged = 20,
      branches_when_destroyed = 16,
      branches_when_mined_manually = 15,
      branches_when_mined_automatically = 8
    }

    if sap_particle then -- jellystem
      variation.leaf_generation = {
        type = "create-particle",
        particle_name = sap_particle,
        offset_deviation =
        {
          {-0.8, -1.2},
          {0.8, 1.2}
        },
        initial_height = 1.5,
        initial_height_deviation = 0.5,
        initial_vertical_speed = 0.06 ,
        initial_vertical_speed_deviation = 0.15,
        speed_from_center = 0.025 ,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0.5,
        tail_length = 10,
        tail_length_deviation = 5,
        tail_width = 5,
        rotate_offsets = false,
        only_when_visible = true
      }
      variation.leaves_when_damaged = 50
      variation.leaves_when_destroyed = 35
      variation.leaves_when_mined_manually = 40
      variation.leaves_when_mined_automatically = 16
    end

    if slime_particle then -- slipstack
      variation.leaf_generation = {
        type = "create-particle",
        particle_name = slime_particle,
        offset_deviation =
        {
          {-0.6, -0.6},
          {0.6, 0.6}
        },
        initial_height = 2.3,
        initial_height_deviation = 0.05,
        initial_vertical_speed = 0.14 ,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.013 ,
        speed_from_center_deviation = 0.02,
        frame_speed = 1,
        frame_speed_deviation = 0,
        only_when_visible = true
      }
    end

    if leaf_particle_1 then -- teflilly
      variation.leaf_generation = {
        type = "create-particle",
        particle_name = leaf_particle_1,
        offset_deviation = {{-1, -0.8}, {1, 0.8}},
        initial_height = 2.8,
        initial_height_deviation = 0.035,
        initial_vertical_speed = 0.025,
        initial_vertical_speed_deviation = 0.13,
        speed_from_center = 0.015,
        speed_from_center_deviation = 0.025,
        frame_speed = 0.6,
        only_when_visible = true
      }
      variation.leaves_when_damaged = 15
      variation.leaves_when_destroyed = 40
      variation.leaves_when_mined_manually = 35
      variation.leaves_when_mined_automatically = 25
    end

    if leaf_particle_2 then -- stingfrond
      variation.leaf_generation = {
        type = "create-particle",
        particle_name = leaf_particle_2,
        offset_deviation = {{-0.8, -0.6}, {0.8, 0.6}},
        initial_height = 2,
        initial_height_deviation = 0.035,
        initial_vertical_speed = 0.025,
        initial_vertical_speed_deviation = 0.13,
        speed_from_center = 0.015,
        speed_from_center_deviation = 0.025,
        frame_speed = 0.6,
        only_when_visible = true
      }
      variation.leaves_when_damaged = 20
      variation.leaves_when_destroyed = 40
      variation.leaves_when_mined_manually = 40
      variation.leaves_when_mined_automatically = 20
    end

    if leaf_particle_3 then -- hairy-clubnub
      variation.leaf_generation = {
        type = "create-particle",
        particle_name = leaf_particle_3,
        offset_deviation = {{-1.2, -1}, {1.2, 1}},
        initial_height = 2.7,
        initial_height_deviation = 0.035,
        initial_vertical_speed = 0.025,
        initial_vertical_speed_deviation = 0.13,
        speed_from_center = 0.005,
        speed_from_center_deviation = 0.025,
        frame_speed = 0.6,
        only_when_visible = true
      }
      variation.leaves_when_damaged = 30
      variation.leaves_when_destroyed = 40
      variation.leaves_when_mined_manually = 35
      variation.leaves_when_mined_automatically = 20
    end

    if crop_particle_1 then -- funneltrunk, lickmaw, sunnycomb
      variation.leaf_generation = {
        type = "create-particle",
        particle_name = crop_particle_1,
        repeat_count = 16,
        offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
        initial_height = 3,
        initial_height_deviation = 0.035,
        initial_vertical_speed = 0.025,
        initial_vertical_speed_deviation = 0.15,
        speed_from_center = 0.02,
        speed_from_center_deviation = 0.045,
        only_when_visible = true
      }
      if name == "funneltrunk" then
        variation.leaves_when_damaged = 50
      else
        variation.leaves_when_damaged = 30
      end
      variation.leaves_when_destroyed = 40
      variation.leaves_when_mined_manually = 40
      variation.leaves_when_mined_automatically = 20
    end

    if crop_particle_2 then -- yumako
      variation.leaf_generation = {
        type = "create-particle",
        particle_name = crop_particle_2,
        offset_deviation = {{-1, -1}, {1, 1}},
        initial_height = 2.5,
        initial_height_deviation = 0.035,
        initial_vertical_speed = 0.025,
        initial_vertical_speed_deviation = 0.15,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.045,
        only_when_visible = true
      }
      variation.leaves_when_damaged = 25
      variation.leaves_when_destroyed = 35
      variation.leaves_when_mined_manually = 40
      variation.leaves_when_mined_automatically = 16
    end

    if crop_particle_3 then -- boompuff
      variation.leaf_generation = {
        type = "create-particle",
        particle_name = crop_particle_3,
        offset_deviation = {{-0.8, -0.8}, {0.8, 0.8}},
        initial_height = 2,
        initial_height_deviation = 0.035,
        initial_vertical_speed = 0.025,
        initial_vertical_speed_deviation = 0.15,
        speed_from_center = 0.05,
        speed_from_center_deviation = 0.065,
        only_when_visible = true
      }
      variation.leaves_when_damaged = 18
      variation.leaves_when_destroyed = 35
      variation.leaves_when_mined_manually = 40
      variation.leaves_when_mined_automatically = 16
    end

    if crop_particle_4 then -- cuttlepop
      variation.leaf_generation = {
        type = "create-particle",
        particle_name = crop_particle_4,
        offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
        initial_height = 2.2,
        initial_height_deviation = 0.035,
        initial_vertical_speed = 0.025,
        initial_vertical_speed_deviation = 0.15,
        speed_from_center = 0.02,
        speed_from_center_deviation = 0.045,
        only_when_visible = true
      }
      variation.leaves_when_damaged = 30
      variation.leaves_when_destroyed = 40
      variation.leaves_when_mined_manually = 35
      variation.leaves_when_mined_automatically = 25
    end

    if trunk_particle_1 then -- teflilly, stingfrond
      variation.branch_generation = {
        type = "create-particle",
        particle_name = trunk_particle_1,
        offset_deviation = {{-0.4, -0.8}, {0.4, 0.8}},
        initial_height = 1.5,
        initial_height_deviation = 1.5,
        initial_vertical_speed = 0.01,
        initial_vertical_speed_deviation = 0.15,
        speed_from_center = 0.035,
        speed_from_center_deviation = 0.015,
        frame_speed = 0.8,
        only_when_visible = true
      }
      variation.branches_when_damaged = 30
      variation.branches_when_destroyed = 40
      variation.branches_when_mined_manually = 35
      variation.branches_when_mined_automatically = 8
    end

    if trunk_particle_2 then -- yumako, hairyclubnub
      variation.branch_generation = {
        type = "create-particle",
        particle_name = trunk_particle_2,
        offset_deviation = {{-0.8, -1.4}, {0.8, 1.4}},
        initial_height = 1.7,
        initial_height_deviation = 1.5,
        initial_vertical_speed = 0.025,
        initial_vertical_speed_deviation = 0.15,
        speed_from_center = 0.035,
        speed_from_center_deviation = 0.02,
        only_when_visible = true
      }
      variation.branches_when_damaged = 40
      variation.branches_when_destroyed = 50
      variation.branches_when_mined_manually = 40
      variation.branches_when_mined_automatically = 20
    end

    if trunk_particle_3 then -- boompuff
      variation.branch_generation = {
        type = "create-particle",
        particle_name = trunk_particle_3,
        offset_deviation = {{-0.8, -0.8}, {0.8, 0.8}},
        initial_height = 1.3,
        initial_height_deviation = 2,
        initial_vertical_speed = 0.01,
        initial_vertical_speed_deviation = 0.15,
        speed_from_center = 0.045,
        speed_from_center_deviation = 0.02,
        only_when_visible = true
      }
      variation.branches_when_damaged = 30
      variation.branches_when_destroyed = 30
      variation.branches_when_mined_manually = 30
      variation.branches_when_mined_automatically = 15
    end

    if jellystem_particle then -- jellystem
      variation.branch_generation = {
        type = "create-particle",
        particle_name = jellystem_particle,
        offset_deviation = {{-0.65, -1}, {0.65, 1}},
        initial_height = 1.7,
        initial_height_deviation = 0.8,
        initial_vertical_speed = 0.025,
        initial_vertical_speed_deviation = 0.15,
        speed_from_center = 0.035,
        speed_from_center_deviation = 0.02,
        frame_speed = 0.8,
        only_when_visible = true
      }
      variation.branches_when_damaged = 30
      variation.branches_when_destroyed = 40
      variation.branches_when_mined_manually = 35
      variation.branches_when_mined_automatically = 8
    end

    if spongy_particle then -- cuttlepop, slipstack, funneltrunk, lickmaw, sunnycomb
      variation.branch_generation = {
        type = "create-particle",
        particle_name = spongy_particle,
        offset_deviation = {{-0.8, -1.5}, {0.8, 1.5}},
        initial_height = 1.7,
        initial_height_deviation = 0.6,
        initial_vertical_speed = 0.02,
        initial_vertical_speed_deviation = 0.15,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.04,
        frame_speed = 0.8,
        only_when_visible = true
      }
      if name == "funneltrunk" then
        variation.branches_when_damaged = 60
        variation.branches_when_mined_automatically = 25
      else
        variation.branches_when_damaged = 40
        variation.branches_when_mined_automatically = 16
      end
      variation.branches_when_destroyed = 40
      variation.branches_when_mined_manually = 35
    end

    if water_cane_top_particle then -- water-cane
      variation.leaf_generation = {
        type = "create-particle",
        particle_name = water_cane_top_particle,
        initial_height = 0.6,
        probability = 0.01,
        offset_deviation = {{-0.15, -0.4}, {0.15, 0.4}},
        initial_height = 1,
        initial_height_deviation = 0.01,
        initial_vertical_speed = 0.015,
        initial_vertical_speed_deviation = 0.055,
        speed_from_center = 0.025,
        speed_from_center_deviation = 0.05,
        frame_speed = 0.8,
        only_when_visible = true
      }
      variation.leaves_when_damaged = 4
      variation.leaves_when_destroyed = 2
      variation.leaves_when_mined_manually = 2
      variation.leaves_when_mined_automatically = 1
    end

    if water_cane_particle then -- water-cane
      variation.branch_generation = {
        type = "create-particle",
        particle_name = water_cane_particle,
        initial_height = 0.6,
        only_when_visible = true
      }
      variation.branches_when_damaged = 2
      variation.branches_when_destroyed = 1
      variation.branches_when_mined_manually = 1
      variation.branches_when_mined_automatically = 1
    end

    if(name == "stingfrond") then
      variation.leaves =
      {
        layers =
        {
          variation.leaves,
          {
            filename = "__planetaris-tellus__/graphics/entity/plant/"..name.."/"..name.."-harvest-glow.png",
            flags = { "mipmap" },
            surface = "any",
            width = width,
            height = height,
            x = x,
            y = y,
            frame_count = 1,
            shift = shift,
            scale = 0.33 * scale_multiplier,
            draw_as_light = true
          }
        }
      }
    end
    table.insert(variations, variation)
  end
  return variations
end

local function lerp_color(a, b, amount)
  return {
    r = a.r + (b.r - a.r) * amount,
    g = a.g + (b.g - a.g) * amount,
    b = a.b + (b.b - a.b) * amount
  }
end

local function lerp_colors(a_set, b, amount)
  local new_colors = {}
  for i, a in pairs(a_set) do
    new_colors[i] = lerp_color(a, b, amount)
  end
  return new_colors
end

local function minor_tints() -- Only for leaves where most if the colour is baked in.
  return {
    {r = 255, g = 255, b =  255},
    {r = 220, g = 255, b =  255},
    {r = 255, g = 220, b =  255},
    {r = 255, g = 255, b =  220},
    {r = 220, g = 220, b =  255},
    {r = 255, g = 220, b =  220},
    {r = 220, g = 255, b =  220},
  }
end



data.extend({
  {
    type = "noise-expression",
    name = "tellus_plants_noise",
    expression = "abs(multioctave_noise{x = x, y = y, persistence = 0.8, seed0 = map_seed, seed1 = 700000, octaves = 3, input_scale = 1/20 * control:tellus_plants:frequency }\z
                      * multioctave_noise{x = x, y = y, persistence = 0.8, seed0 = map_seed, seed1 = 200000, octaves = 3, input_scale = 1/6 * control:tellus_plants:frequency })"
  },
  {
    type = "noise-expression",
    name = "tellus_plants_noise_b",
    expression = "abs(multioctave_noise{x = x, y = y, persistence = 0.8, seed0 = map_seed, seed1 = 750000, octaves = 3, input_scale = 1/20 * control:tellus_plants:frequency }\z
                      * multioctave_noise{x = x, y = y, persistence = 0.8, seed0 = map_seed, seed1 = 250000, octaves = 3, input_scale = 1/6 * control:tellus_plants:frequency })"
  },
  --------------------------------------------------------------- Tellus plants
    {
    type = "plant",
    name = "myceliae", -- food
    icon = "__planetaris-tellus__/graphics/icons/myceliae.png",
    flags = plant_flags,
    minable =
    {
      mining_particle = "yumako-mining-particle",
      mining_time = 0.5,
      results = {
        {type = "item", name = "planetaris-mushroom-cap", amount = 50},
        {type = "fluid", name = "water", amount = 300}
      },
      mining_trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              target_effects = leaf_sound_trigger
            }
          }
        }
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-yumako-tree", 5, 0.6),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-yumako-tree", 6, 0.3),
    growth_ticks = 5 * minutes,
    harvest_emissions = plant_harvest_emissions,
    emissions_per_second = plant_emissions,
    max_health = 30,
    collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
    --collision_mask = {layers={player=true, ground_tile=true, train=true}},
    selection_box = {{-1, -3}, {1, 0.8}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "trees",
    order = "a[tree]-c[tellus]-a[seedable]-a[yumako-tree]",
    impact_category = "tree",
    factoriopedia_simulation = planetaris_simulations.factoriopedia_myceliae_plant,
    autoplace =
    {
      control = "tellus_plants",
      order = "a[tree]-b[forest]-a",
      probability_expression = "min(0.2, 0.3 * (1 - tellus_plants_noise) * control:tellus_plants:size)",
      richness_expression = "random_penalty_at(3, 1)",
      tile_restriction = {"natural-mycelia-soil", "artificial-mycelia-soil", "overgrowth-mycelia-soil"}
    },
    variations = tellus_tree_variations("myceliae", 10, 5, 1.3, 640, 575, util.by_pixel(52, -73)),
    stateless_visualisation_variations= {
      tree_stateless_visualisation(make_offsets_on_tree(320, 280, {{306, 250}, {306, 250}})),
    },
    colors = minor_tints(),
    agricultural_tower_tint =
    {
      primary = {r = 0.22, g = 0.416, b = 0.550, a = 1.000}, -- #8c3737ff
      secondary = {r = 0.31, g = 0.573, b = 0.612, a = 1.000}, -- #8f4f4eff
    },
    -- tile_buildability_rules = { {area = {{-0.55, -0.55}, {0.55, 0.55}}, required_tiles = {"natural-yumako-soil", "artificial-yumako-soil"}, remove_on_collision = true} },
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/yumako-tree", 6, 0.5),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 2,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.2,
      average_pause_seconds = 8
    },
    map_color = {255, 255, 255},
  },
  {
    type = "plant",
    name = "chloroplast",
    icon = "__planetaris-tellus__/graphics/icons/chloroplast.png",
    flags = plant_flags,
    minable =
    {
      mining_particle = "jellystem-mining-particle",
      mining_time = 0.5,
      results = {{type = "item",  name = "planetaris-chloroplast-fruit", amount = 50},
                 {type = "fluid", name = "planetaris-chlorophyll", amount = 300}},
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-jellystem", 5, 0.4),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-jellystem", 6, 0.35),
    growth_ticks = 5 * minutes,
    emissions_per_second = plant_emissions,
    harvest_emissions = plant_harvest_emissions,
    max_health = 50,
    collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
    --collision_mask = {layers={player=true, ground_tile=true, train=true}},
    selection_box = {{-1, -3}, {1, 0.8}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "trees",
    order = "a[tree]-c[tellus]-a[seedable]-b[chloroplast]",
    impact_category = "tree",
    factoriopedia_simulation = planetaris_simulations.factoriopedia_chloroplasts_plant,
    autoplace =
    {
      control = "tellus_plants",
      order = "a[tree]-b[forest]-b",
      probability_expression = "min(0.2, 0.3 * (1 - tellus_plants_noise) * control:tellus_plants:size)",
      richness_expression = "random_penalty_at(3, 1)",
      tile_restriction = {"natural-chlorophyll-soil", "artificial-chlorophyll-soil", "overgrowth-chlorophyll-soil"}
    },
    variations = tellus_tree_variations("chloroplast", 10, 5, 1.3, 640, 560, util.by_pixel(52, -73)),
    colors = {
      {r = 255, g = 255, b =  255},
      {r = 233, g = 218, b =  225},
      --{r = 207, g = 202, b =  235},
      {r = 255, g = 235, b =  235},
      {r = 230, g = 217, b =  235},
      {r = 242, g = 202, b =  235},
      {r = 230, g = 235, b =  235},
      --{r = 194, g = 165, b  =  208},
      --{r = 215, g = 185, b =  208},
      --{r = 194, g = 185, b =  208},
      {r = 252, g = 186, b =  209}
    },
    agricultural_tower_tint =
    {
      primary = {r = 0.620, g = 0.307, b = 0.461, a = 1.000}, -- #eac1f5ff
      secondary = {r = 0.336, g = 0.624, b = 0.340, a = 1.000}, -- #885289ff
    },
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/jellystem", 8, 0.5),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 2,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.5,
      average_pause_seconds = 7
    },
    map_color = {255, 255, 255},
    -- tile_buildability_rules = { {area = {{-0.55, -0.55}, {0.55, 0.55}}, required_tiles = {"natural-jellynut-soil", "artificial-jellynut-soil"}, remove_on_collision = true} },
  },
  {
    type = "simple-entity-with-owner",
    name = "planetaris-bioassembler-plant-ghost",
    localised_name = {"entity-name.planetaris-bioassembler-plant"},
    localised_description = {"entity-name.planetaris-bioassembler-plant"},
    icon = "__planetaris-tellus__/graphics/icons/bioassembler-seed.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    hidden_in_factoriopedia = true,
    factoriopedia_alternative = "planetaris-bioassembler-plant",
    minable = {mining_time = 0.1, result = "planetaris-bioassembler-seed", count = 1},
    max_health = 10,
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    collision_mask = {
      layers = {
        item = true,
        object = true,
        player = true,
        water_tile = true
      }
    },
    surface_conditions =
    {
      {
        property = "gravity",
        min = 1,
      }
    },
    pictures = {
      {
              filename = "__planetaris-tellus__/graphics/entity/plant/bioassembler/bioassembler-plant.png",
              priority = "extra-high",
              width = 352,
              height = 352,
              x = 0,
              y = 0,
              frame_count = 1,
              shift = util.by_pixel(0, 0),
              scale = 0.5,
        tint = {r = 0.5, g = 0.5, b = 0.5, a = 0.5}
      }
    }
  },
  {
    type = "plant",
    name = "planetaris-bioassembler-plant",
    icon = "__planetaris-tellus__/graphics/icons/bioassembler-seed.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "breaths-air"},
    minable = {mining_time = 0.5, result = "planetaris-bioassembler-seed", count = 1},
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-boompuff", 5, 0.6),
    max_health = 50,
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    drawing_box = {{-1.5, -2.5}, {1.5, 1.5}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "trees",
    order = "a[tree]-d[tellus]-b[normal]-g[boompuff]",
    impact_category = "tree",
    emissions_per_second = bioassembler_emissions,
    harvest_emissions = plant_harvest_emissions,
    collision_mask = {
      layers = {
        item = true,
        object = true,
        player = true,
        water_tile = true
      }
    },
    surface_conditions =
    {
      {
        property = "gravity",
        min = 1,
      }
    },
    growth_ticks = 600, -- 25 seconds to full growth
    pictures={
        {
          layers= {
            {
              filename = "__planetaris-tellus__/graphics/entity/plant/bioassembler/bioassembler-plant.png",
              priority = "extra-high",
              width = 352,
              height = 352,
              x = 0,
              y = 0,
              frame_count = 1,
              shift = util.by_pixel(0, 0),
              scale = 0.5
            },
            {
              filename = "__planetaris-tellus__/graphics/entity/plant/bioassembler/bioassembler-plant-shadow.png",
              priority = "extra-high",
              width = 352,
              height = 352,
              x = 0,
              y = 0,
              frame_count = 1,
              shift = util.by_pixel(20, 0),
              scale = 0.5,
              draw_as_shadow = true
            },
          },
        },
        {
          layers= {
            {
              filename = "__planetaris-tellus__/graphics/entity/plant/bioassembler/bioassembler-plant.png",
              priority = "extra-high",
              width = 352,
              height = 352,
              x = 352,
              y = 0,
              frame_count = 1,
              shift = util.by_pixel(0, 0),
              scale = 0.5
            },
            {
              filename = "__planetaris-tellus__/graphics/entity/plant/bioassembler/bioassembler-plant-shadow.png",
              priority = "extra-high",
              width = 352,
              height = 352,
              x = 352,
              y = 0,
              frame_count = 1,
              shift = util.by_pixel(20, 0),
              scale = 0.5,
              draw_as_shadow = true
            },
          },
        },
        {
          layers= {
            {
              filename = "__planetaris-tellus__/graphics/entity/plant/bioassembler/bioassembler-plant.png",
              priority = "extra-high",
              width = 352,
              height = 352,
              x = 352 * 2,
              y = 0,
              frame_count = 1,
              shift = util.by_pixel(0, 0),
              scale = 0.5
            },
            {
              filename = "__planetaris-tellus__/graphics/entity/plant/bioassembler/bioassembler-plant-shadow.png",
              priority = "extra-high",
              width = 352,
              height = 352,
              x = 352 * 2,
              y = 0,
              frame_count = 1,
              shift = util.by_pixel(20, 0),
              scale = 0.5,
              draw_as_shadow = true
            },
          },
        },
        ------
                {
          layers= {
            {
              filename = "__planetaris-tellus__/graphics/entity/plant/bioassembler/bioassembler-plant.png",
              priority = "extra-high",
              width = 352,
              height = 352,
              x = 0,
              y = 352,
              frame_count = 1,
              shift = util.by_pixel(0, 0),
              scale = 0.5
            },
            {
              filename = "__planetaris-tellus__/graphics/entity/plant/bioassembler/bioassembler-plant-shadow.png",
              priority = "extra-high",
              width = 352,
              height = 352,
              x = 0,
              y = 352,
              frame_count = 1,
              shift = util.by_pixel(20, 0),
              scale = 0.5,
              draw_as_shadow = true
            },
          },
        },
        {
          layers= {
            {
              filename = "__planetaris-tellus__/graphics/entity/plant/bioassembler/bioassembler-plant.png",
              priority = "extra-high",
              width = 352,
              height = 352,
              x = 352,
              y = 352,
              frame_count = 1,
              shift = util.by_pixel(0, 0),
              scale = 0.5
            },
            {
              filename = "__planetaris-tellus__/graphics/entity/plant/bioassembler/bioassembler-plant-shadow.png",
              priority = "extra-high",
              width = 352,
              height = 352,
              x = 352,
              y = 352,
              frame_count = 1,
              shift = util.by_pixel(20, 0),
              scale = 0.5,
              draw_as_shadow = true
            },
          },
        },
        {
          layers= {
            {
              filename = "__planetaris-tellus__/graphics/entity/plant/bioassembler/bioassembler-plant.png",
              priority = "extra-high",
              width = 352,
              height = 352,
              x = 352 * 2,
              y = 352,
              frame_count = 1,
              shift = util.by_pixel(0, 0),
              scale = 0.5
            },
            {
              filename = "__planetaris-tellus__/graphics/entity/plant/bioassembler/bioassembler-plant-shadow.png",
              priority = "extra-high",
              width = 352,
              height = 352,
              x = 352 * 2,
              y = 352,
              frame_count = 1,
              shift = util.by_pixel(20, 0),
              scale = 0.5,
              draw_as_shadow = true
            },
          },
        },
      },
    colors = lerp_colors({
      {r = 255, g = 255, b =  255},
      {r = 220, g = 255, b =  255},
      {r = 255, g = 220, b =  255},
      {r = 255, g = 255, b =  220},
      {r = 255, g = 220, b =  220},
      {r = 255, g = 200, b =  200},
      {r = 255, g = 200, b =  180},
      {r = 230, g = 230, b =  230},
      {r = 240, g = 200, b =  200},
      {r = 220, g = 150, b =  180},
      {r = 230, g = 190, b =  240},
    }, {r = 255, g = 255, b = 255}, 0.5),
  },

  --------------------------------------------------------------- Plants
  
  {
    type = "tree",
    name = "chloronack",
    icon = "__planetaris-tellus__/graphics/icons/chloronack.png",
    flags = plant_flags,
    minable =
    {
      mining_particle = "slipstack-mining-particle",
      mining_time = 0.5,
      results =
      {
        {type = "item", name = "spoilage", amount = 6},
        {type = "item", name = "stone", amount = 4}
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-slipstack", 5, 0.5),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-slipstack", 7, 0.4),
    emissions_per_second = plant_emissions,
    max_health = 100,
    collision_box = {{-0.8, -0.6}, {0.8, 0.6}},
    collision_mask = {layers={player=true, ground_tile=true, train=true, is_object=true, is_lower_object=true}},
    selection_box = {{-1, -2.7}, {1, 0.6}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "trees",
    order = "a[tree]-c-z[tellus]-b[normal]-a[Chloronack]",
    impact_category = "tree",
    factoriopedia_simulation = planetaris_simulations.factoriopedia_chloronack_plant,
    autoplace =
    {
      control = "tellus_plants",
      order = "a[tree]-b[forest]-i",
      probability_expression = "main_probability",
      richness_expression = "random_penalty_at(3, 1)",
      local_expressions = {
        main_box = "tellus_select(tellus_aux, 0.7, 1, 0.1, -10, 1) - 1",
        main_probability = "min(0.02, tellus_water_plant_ramp * 0.2 * (main_box + tellus_plants_noise - 0.2) * control:tellus_plants:size)"
      }
    },
    variations = tellus_tree_variations("chloronack", 8, 5, nil, 640, 560, util.by_pixel(52, -65)),
    colors = minor_tints(),
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/slipstack", 9, 0.6),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 2,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.3,
      average_pause_seconds = 7
    },
    created_effect = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "create-decorative",
            decorative = "tellus-coral-stunted",
            spawn_min = 1,
            spawn_max = 1,
            spawn_min_radius = 0,
            spawn_max_radius = 0.5
          },
          {
            type = "create-decorative",
            decorative = "tellus-coral-water",
            spawn_min = 1,
            spawn_max = 5,
            spawn_min_radius = 0,
            spawn_max_radius = 3
          },
          {
            type = "create-decorative",
            decorative = "tellus-coral-land",
            spawn_min = 1,
            spawn_max = 5,
            spawn_min_radius = 0,
            spawn_max_radius = 3
          }
        }
      }
    }
  },
  {
    type = "tree",
    name = "bacteriotrunk",
    icon = "__planetaris-tellus__/graphics/icons/bacteriotrunk.png",
    flags = plant_flags,
    minable =
    {
      mining_particle = "boompuff-mining-particle",
      mining_time = 0.5,
      results =
      {
        {type = "item", name = "spoilage", amount = 8},
        {type = "item", name = "wood", amount = 2}
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-stingfrond", 5, 0.5),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-stingfrond", 5, 0.4),
    emissions_per_second = plant_emissions,
    max_health = 50,
    collision_box = {{-0.6, -0.4}, {0.6, 0.6}},
    selection_box = {{-1, -3}, {1, 0.6}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "trees",
    order = "a[tree]-c-t[tellus]-b[normal]-f[stingfrond]",
    impact_category = "tree",
    factoriopedia_simulation = planetaris_simulations.factoriopedia_bacteriotrunk_plant,
    autoplace = {
      control = "tellus_plants",
      order = "a[tree]-b[forest]-d",
      tile_restriction = {"midland-red-crust","midland-red-crust-2","midland-red-crust-3","midland-red-crust-4"},
      probability_expression = "tellus_bacteriotrunk_region",
      richness_expression = "random_penalty_at(3, 1)"
    },
    stateless_visualisation_variations =
    {
      tree_stateless_visualisation(make_offsets_on_tree(320, 280, {{306, 197}, {306, 197}})),
      tree_stateless_visualisation(make_offsets_on_tree(320, 260, {{306, 210}, {306, 210}})),
      tree_stateless_visualisation(make_offsets_on_tree(300, 265, {{290, 196}, {290, 196}})),
      tree_stateless_visualisation(make_offsets_on_tree(320, 280, {{305, 210}, {305, 210}})),
      tree_stateless_visualisation(make_offsets_on_tree(280, 280, {{305, 194}, {305, 194}})),
      tree_stateless_visualisation(make_offsets_on_tree(280, 290, {{297, 199}, {297, 199}})),
      tree_stateless_visualisation(make_offsets_on_tree(320, 230, {{295, 197}, {295, 197}})),
      tree_stateless_visualisation(make_offsets_on_tree(320, 240, {{303, 200}, {303, 200}})),
      tree_stateless_visualisation(make_offsets_on_tree(280, 260, {{292, 197}, {292, 197}})),
      tree_stateless_visualisation(make_offsets_on_tree(320, 240, {{294, 191}, {294, 191}})),
    },
    variations = tellus_tree_variations("bacteriotrunk", 10, 5, 1.1, nil, nil, util.by_pixel(52, -60)),
    colors = {
      {r = 255, g = 255, b =  255},
      {r = 240, g = 255, b =  255},
      {r = 255, g = 240, b =  255},
      {r = 240, g = 240, b =  255},
      {r = 240, g = 255, b =  240},
    },
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/stingfrond", 7, 0.7),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 2,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.3,
      average_pause_seconds = 8
    },
    created_effect = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "create-decorative",
            decorative = "white-carpet-grass",
            spawn_min = 1,
            spawn_max = 1,
            spawn_min_radius = 0,
            spawn_max_radius = 1,
            probability = 0.4
          },
          {
            type = "create-decorative",
            decorative = "wispy-lichen",
            spawn_min = 1,
            spawn_max = 4,
            spawn_min_radius = 0,
            spawn_max_radius = 2
          },
          {
            type = "create-decorative",
            decorative = "mycelium",
            spawn_min = 0,
            spawn_max = 3,
            spawn_min_radius = 0,
            spawn_max_radius = 4
          }
        }
      }
    }
  },
  {
    type = "plant",
    name = "mushell", -- wood
    icon = "__planetaris-tellus__/graphics/icons/mushell.png",
    flags = plant_flags,
    minable =
    {
      mining_particle = "funneltrunk-mining-particle",
      mining_time = 0.5,
      results =
      {
        {type = "item", name = "wood", amount = 10},
        {type = "item", name = "planetaris-mushell-seed", amount_min = 1, amount_max = 3}
      },
      mining_trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              target_effects = leaf_sound_trigger
            }
          }
        }
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-funneltrunk", 5, 0.9),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-funneltrunk", 5, 0.7),
    growth_ticks = 5 * minutes,
    harvest_emissions = plant_harvest_emissions,
    emissions_per_second = plant_emissions,
    max_health = 200,
    collision_box = {{-0.6, -0.5}, {0.6, 0.5}},
    selection_box = {{-1, -3}, {1, 0.5}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "trees",
    order = "a[tree]-c-t[tellus]-b[normal]-b[funneltrunk]",
    impact_category = "tree",
    factoriopedia_simulation = planetaris_simulations.factoriopedia_mushell_plant,
    autoplace = {
      control = "tellus_plants",
      order = "a[tree]-b[forest]",
      tile_restriction = {"midland-purple-bark", "midland-purple-bark-2"},
      probability_expression = "clamp((tellus_plants_noise - 0.5) * control:tellus_plants:size, 0.001, 0.05)", -- more uniform canopy
      richness_expression = "random_penalty_at(3, 1)"
    },
    variations = tellus_tree_variations("mushell", 5, 4, nil, 640, 560, util.by_pixel(52, -65)),
    colors = minor_tints(),
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/funneltrunk", 7, 0.5),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 3,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.5,
      average_pause_seconds = 12
    },
    created_effect = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "create-decorative",
            decorative = "nerve-roots-dense",
            spawn_min = 1,
            spawn_max = 1,
            spawn_min_radius = 0,
            spawn_max_radius = 0.5
          },
          {
            type = "create-decorative",
            decorative = "knobbly-roots",
            spawn_min = 1,
            spawn_max = 3,
            spawn_min_radius = 0,
            spawn_max_radius = 2
          }
        }
      }
    }
  },
  {
    type = "plant",
    name = "mushell-plant", -- no decorations
    localised_name = {"entity-name.mushell"},
    localised_description = {"entity-description.mushell"},
    icon = "__planetaris-tellus__/graphics/icons/mushell.png",
    flags = plant_flags,
    minable =
    {
      mining_particle = "funneltrunk-mining-particle",
      mining_time = 0.5,
      results =
      {
        {type = "item", name = "wood", amount = 10},
        {type = "item", name = "planetaris-mushell-seed", amount_min = 1, amount_max = 3}
      },
      mining_trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              target_effects = leaf_sound_trigger
            }
          }
        }
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-funneltrunk", 5, 0.9),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-funneltrunk", 5, 0.7),
    growth_ticks = 5 * minutes,
    harvest_emissions = plant_harvest_emissions,
    emissions_per_second = plant_emissions,
    max_health = 200,
    collision_box = {{-0.6, -0.5}, {0.6, 0.5}},
    selection_box = {{-1, -3}, {1, 0.5}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "trees",
    order = "a[tree]-c-t[tellus]-b[normal]-b[funneltrunk]",
    impact_category = "tree",
    factoriopedia_simulation = planetaris_simulations.factoriopedia_mushell_plant,
    autoplace = {
      control = "tellus_plants",
      order = "a[tree]-b[forest]",
      tile_restriction = {"midland-purple-bark", "midland-purple-bark-2"},
      probability_expression = "clamp((tellus_plants_noise - 0.5) * control:tellus_plants:size, 0.001, 0.05)", -- more uniform canopy
      richness_expression = "random_penalty_at(3, 1)"
    },
    variations = tellus_tree_variations("mushell", 5, 4, nil, 640, 560, util.by_pixel(52, -65)),
    colors = minor_tints(),
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/funneltrunk", 7, 0.5),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 3,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.5,
      average_pause_seconds = 12
    },
  },
  {
    type = "tree",
    name = "moldant",
    icon = "__planetaris-tellus__/graphics/icons/moldant.png",
    flags = plant_flags,
    minable =
    {
      mining_particle = "cuttlepop-mining-particle",
      mining_time = 0.5,
      results =
      {
        {type = "item", name = "spoilage", amount = 5},
        {type = "item", name = "wood", amount = 5}
      },
      mining_trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              target_effects = spoilage_sound_trigger
            }
          }
        }
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-teflilly", 5, 0.5),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-teflilly", 5, 0.5),
    emissions_per_second = plant_emissions,
    max_health = 50,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-1, -3}, {1, 0.5}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "trees",
    order = "a[tree]-c-t[tellus]-b[normal]-d",
    impact_category = "tree",
    factoriopedia_simulation = planetaris_simulations.factoriopedia_moldant_plant,
    autoplace =
    {
      control = "tellus_plants",
      order = "a[tree]-b[forest]-g",
      probability_expression = "tellus_teflilly_region",
      richness_expression = "random_penalty_at(3, 1)"
    },
    variations = tellus_tree_variations("moldant", 5, 4),
    colors = {
      {r = 255, g = 255, b =  255},
      {r = 220, g = 255, b =  255},
      {r = 255, g = 220, b =  255},
      {r = 255, g = 255, b =  220},
      {r = 220, g = 220, b =  255},
      {r = 255, g = 220, b =  220},
      {r = 220, g = 255, b =  220},
      {r = 200, g = 200, b =  255},
      {r = 200, g = 220, b =  255},
      {r = 220, g = 200, b =  255},
    },
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/teflilly", 8, 0.7),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 2,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.3,
      average_pause_seconds = 8
    },
    created_effect = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "create-decorative",
            decorative = "curly-roots-grey",
            spawn_min = 1,
            spawn_max = 1,
            spawn_min_radius = 0,
            spawn_max_radius = 0.5
          },
          {
            type = "create-decorative",
            decorative = "pale-lettuce-lichen-cups-3x3",
            spawn_min = 1,
            spawn_max = 3,
            spawn_min_radius = 1,
            spawn_max_radius = 3
          }
        }
      }
    }
  },
  {
    type = "tree",
    name = "tellus-water-cane", -- wood
    icon = "__space-age__/graphics/icons/water-cane.png",
    flags = plant_flags,
    minable =
    {
      count = 1,
      mining_particle = "wooden-particle",
      mining_time = 0.1,
      result = "wood",
      mining_trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              target_effects = spoilage_sound_trigger
            }
          }
        }
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-teflilly", 5, 0.8),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-teflilly", 5, 0.8),
    emissions_per_second = plant_emissions,
    max_health = 10,
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.3, -1}, {0.3, 0.3}},
    collision_mask = {layers={ground_tile=true, train=true, is_object=true, is_lower_object=true}}, -- not player
    protected_from_tile_building = false,
    drawing_box_vertical_extension = 0.8,
    subgroup = "trees",
    order = "a[tree]-c-t[tellus]-c[decorative]-a[water-cane]",
    impact_category = "tree",
    autoplace =
    {
      control = "tellus_plants",
      order = "a[tree]-d[decorative]-a[water-cane]",
      probability_expression = "min(0.8, (min(1, 1.5 * tellus_water_plant_ramp) + 0.5 * tellus_decal_noise - tellus_plants_noise - 0.5 * tellus_select(tellus_aux, 0.45, 0.55, 0.2, 0, 1) - 0.7) * control:tellus_plants:size)",
      richness_expression = 1,
    },
    variations = tellus_tree_variations("tellus-water-cane", 16, 3, 1, 340, 290, util.by_pixel(30, -28), util.by_pixel(30, -20)),
    colors = minor_tints(),
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/sunnycomb", 8, 0.7),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 2,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.3,
      average_pause_seconds = 10
    }
  },

  -- OTHER PLANET

    {
    type = "plant",
    name = "holmiumnite", -- chlorophyll
    icon = "__planetaris-tellus__/graphics/icons/holmiumnite.png",
    flags = plant_flags,
    minable =
    {
      mining_particle = "jellystem-mining-particle",
      mining_time = 0.5,
      results =
      {
        {type = "fluid", name = "light-oil", amount = 600},
        {type = "item", name = "planetaris-holmiumnite-bulb", amount = 50}
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-jellystem", 5, 0.4),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-jellystem", 6, 0.35),
    growth_ticks = 5 * minutes,
    harvest_emissions = plant_harvest_emissions,
    emissions_per_second = plant_emissions,
    max_health = 30,
    collision_box = {{-0.8, -0.6}, {0.8, 0.6}},
    collision_mask = {layers={player=true, water_tile=true, train=true, is_object=true, is_lower_object=true}},
    selection_box = {{-1, -2.7}, {1, 0.6}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "trees",
    order = "a[tree]-c-z[tellus]-b[normal]-a[Chloronack]",
    impact_category = "tree",
    factoriopedia_simulation = planetaris_simulations.factoriopedia_holmiumnite_plant,
    autoplace =
    {
      probability_expression = "0",
      tile_restriction = {"planetaris-dust-soil"}
    },
    pictures = holiumnite_pictures,
    colors = minor_tints(),
    map_color = {255, 255, 255},
  },

  {
    type = "plant",
    name = "carbolyte",
    icon = "__planetaris-tellus__/graphics/icons/carbolyte-plant.png",
    flags = plant_flags,
    minable =
    {
      mining_particle = "jellystem-mining-particle",
      mining_time = 0.5,
      results =
      {
        {type = "fluid", name = "sulfuric-acid", amount = 600},
        {type = "item", name = "planetaris-carbolyte-crust", amount = 50}
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-ashland-lichen-tree", 5, 0.4),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-ashland-lichen-tree", 5, 0.4),
    variations = tellus_tree_variations("carbolyte", 10, 5, nil, 3200/5, 1120/2, util.by_pixel(52, -60)),
    growth_ticks = 5 * minutes,
    harvest_emissions = plant_harvest_emissions,
    emissions_per_second = plant_emissions,    
    max_health = 50,
    collision_box = {{-0.5, -0.6}, {0.5, 0.4}},
    selection_box = {{-0.9, -2.4}, {0.9, 0.3}},
    collision_mask = {layers={player=true, water_tile=true, train=true, is_object=true, is_lower_object=true}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "trees",
    order = "a[tree]-c-z[tellus]-b[normal]-a[Chloronack]",
    impact_category = "tree",
    factoriopedia_simulation = planetaris_simulations.factoriopedia_carbolyte_plant,
    autoplace =
    {
      probability_expression = "0",
      tile_restriction = {"planetaris-volcanic-soil"}
    },
    pictures = holiumnite_pictures,
    colors = minor_tints(),
    map_color = {255, 255, 255},
  },
})