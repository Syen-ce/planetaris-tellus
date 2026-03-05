if not mods["planetaris-arig"] then return end

local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

-- Update tech

table.insert(data.raw["technology"]["planet-discovery-tellus"].prerequisites, "planetaris-compression-science")
table.insert(data.raw["technology"]["planet-discovery-tellus"].unit.ingredients, {"planetaris-compression-science-pack",  1})

-- Update recipes

table.insert(data.raw["recipe"]["planetaris-pathological-science-pack"].ingredients, {type = "item",  name = "planetaris-arigian-bacteria",  amount = 2})

data.extend({
  {
    type = "technology",
    name = "planetaris-arig-pathological-research",
    icon = "__planetaris-tellus__/graphics/technology/arig-pathologics.png",
    icon_size = 256,
    essential = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planetaris-cactus-mash"
      },
    },
    prerequisites = {"planetaris-vulcanus-pathological-research"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"automation-science-pack",      1},
        {"logistic-science-pack",        1},
        {"chemical-science-pack",        1},
        {"production-science-pack",      1},
        {"utility-science-pack",         1},
        {"space-science-pack",           1},
        {"agricultural-science-pack",    1},
        {"metallurgic-science-pack", 1},
        {"planetaris-compression-science-pack",  1},
        {"planetaris-bioengineering-science-pack",  1}
      },
      time = 30
    },
  },
})

table.insert(data.raw["technology"]["planetaris-pathological-science-pack"].prerequisites, "planetaris-arig-pathological-research")


-- Items

data.extend({

  {
    type = "item",
    name = "planetaris-cactus-mash",
    icon = "__planetaris-tellus__/graphics/icons/cactus-mash.png",
    subgroup = "tellus-other-planet-agriculture",
    order = "c[arig]-a[seed]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 10,
    default_import_location = "tellus",
    weight = 10 * kg,
    fuel_category = "chemical",
    fuel_value = "1MJ",
    spoil_ticks = 15 * minute,
    spoil_result = "planetaris-arigian-bacteria",
  },
  {
    type = "item",
    name = "planetaris-arigian-bacteria",
    icon = "__planetaris-tellus__/graphics/icons/arigian-bacteria.png",
    pictures =
    {
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/arigian-bacteria.png",   scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/arigian-bacteria-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/arigian-bacteria-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-tellus__/graphics/icons/arigian-bacteria-3.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "tellus-other-planet-agriculture",
    order = "c[arig]-c[bacteria]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "tellus",
    weight = 1 * kg,
    spoil_ticks = 5 * minute,
    spoil_result = "spoilage",
  },



-- Recipes

  {
    type = "recipe",
    name = "planetaris-cactus-mash",
    localised_name={"item-name.planetaris-cactus-mash"},
    localised_description={"item-description.planetaris-cactus-mash"},
    icon = "__planetaris-tellus__/graphics/icons/cactus-mashing.png",
    category = "compressing",
    subgroup = "tellus-other-planet-agriculture",
    order = "c[arig]-b[mash]-b",
    energy_required = 2,
    surface_conditions =
    {
      {
        property = "planetaris-dust-concentration",
        min = 50,
        max = 100,
      }
    },
    enabled = false,
    ingredients = {
      {type = "item",   name = "planetaris-cactus", amount = 1},
      {type = "fluid",  name = "water", amount = 20},
    },
    results =
    {
      {type = "item", name = "planetaris-cactus-seeds", amount = 1, probability = 0.02},
      {type = "item", name = "planetaris-cactus-mash", amount = 1},
    },
    crafting_machine_tint =
    {
      primary = {0.929, 0.549, 0.737, 1},
      secondary = {0.929, 0.549, 0.737, 1},
    }
  },

})