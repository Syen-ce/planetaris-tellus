
data:extend({
  -- Hardwood
  -- {
  --   type = "recipe",
  --   name = "planetaris-hardwood",
  --   category = "crafting",
  --   enabled = false,
  --   ingredients = {{type = "item", name = "wood", amount = 5}},
  --   energy_required = 2,
  --   results =
  --   {
  --     {type = "item", name = "planetaris-hardwood", amount = 1}
  --   },
  --   crafting_machine_tint =
  --   {
  --     primary = {r = 0.45, g = 0.98, b = 0.008, a = 1.000},
  --     secondary = {r = 0.635, g = 0.8, b = 0.294, a = 1.000},
  --   }
  -- },
  -- COMPOST
  {
    type = "recipe",
    name = "planetaris-compost",
    order = "a[natural]-a[basic]-b[compost]",
    category = "planetaris-bioassembling-or-organic-or-hand-crafting",
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    auto_recycle = false,
    allow_productivity = true,
    reset_freshness_on_craft = true,
    energy_required = 4,
    ingredients =
    {
      {type = "item", name = "spoilage", amount = 1},
      {type = "item", name = "nutrients", amount = 1}
    },
    results =
    {
      {type = "item", name = "planetaris-compost", amount = 1}
    },
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.457, b = 0.000, a = 1.000},
      secondary = {r = 1.000, g = 0.196, b = 0.000, a = 1.000},
    },
    show_amount_in_title = false
  },
  {
    type = "recipe",
    name = "planetaris-mycelia-compost",
    icons = {
        {icon="__planetaris-tellus__/graphics/icons/compost.png", draw_background=false},
        {icon="__planetaris-tellus__/graphics/icons/mycelia.png",  shift={12, 12}, scale=0.5},
      },
    order = "a[natural]-a[basic]-b[compost]-b",
    category = "planetaris-bioassembling",
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    allow_productivity = true,
    reset_freshness_on_craft = true,
    auto_recycle = false,
    energy_required = 4,
    ingredients =
    {
      {type = "item", name = "planetaris-mycelia", amount = 2},
      {type = "item", name = "nutrients", amount = 1}
    },
    results =
    {
      {type = "item", name = "planetaris-compost", amount = 3}
    },
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.457, b = 0.000, a = 1.000},
      secondary = {r = 1.000, g = 0.196, b = 0.000, a = 1.000},
    },
    show_amount_in_title = false
  },
  -- Magnesium
  {
    type = "recipe",
    name = "planetaris-magnesium-sheet",
    category = "smelting",
    enabled = false,
    auto_recycle = false,
    ingredients = {{type = "item", name = "planetaris-magnesium-dust", amount = 1}},
    energy_required = 2,
    results =
    {
      {type = "item", name = "planetaris-magnesium-sheet", amount = 1}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.647, g = 0.957, b = 1, a = 1.000},
      secondary = {r = 0.647, g = 0.957, b = 1, a = 1.000},
    }
  },
  {
    type = "recipe",
    name = "planetaris-magnesium-bacteria-cultivation",
    icon = "__planetaris-tellus__/graphics/icons/magnesium-bacteria-cultivation.png",
    category = "planetaris-bioassembling",
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    subgroup = "tellus-basic-processes",
    order = "a[natural]-b[magnesium]-a[magnesium-bacteria]-b",
    enabled = false,
    auto_recycle = false,
    allow_productivity = true,
    reset_freshness_on_craft = true,
    energy_required = 4,
    ingredients =
    {
      {type = "item", name = "planetaris-magnesium-bacteria", amount = 1},
      {type = "item", name = "iron-bacteria", amount = 1},
      {type = "item", name = "nutrients", amount = 1}
    },
    results =
    {
      {type = "item", name = "planetaris-magnesium-bacteria", amount = 4}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.647, g = 0.957, b = 1, a = 1.000},
      secondary = {r = 0.647, g = 0.957, b = 1, a = 1.000},
    },
    show_amount_in_title = false
  },

  -- Bioassembler

  {
    type = "recipe",
    name = "planetaris-bioassembler-seed",
    category = "planetaris-bioassembling-or-assembling",
    energy_required = 4,
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    auto_recycle = false,
      ingredients =
      {
        {type = "item", name = "planetaris-magnesium-sheet", amount = 10},
        {type = "item", name = "electronic-circuit", amount = 5},
        {type = "item", name = "planetaris-myceliae-seed", amount = 1},
        {type = "item", name = "planetaris-chloroplast-seed", amount = 1},
      },
    results = {{type="item", name="planetaris-bioassembler-seed", amount=1}}
  },
  -- WATER
  {
    type = "recipe",
    name = "planetaris-desinfecting-water",
    icons = {
        {icon="__planetaris-tellus__/graphics/icons/fluids/infected-water.png", draw_background=false},
        {icon="__planetaris-tellus__/graphics/icons/magnesium-bacteria.png",  shift={12, 12}, scale=0.5},
    },
    category = "planetaris-bioassembling-or-organic",
    subgroup = "tellus-basic-processes",
    order = "a[natural]-a[basic]-c[water]",
    energy_required = 2,
    enabled = false,
    auto_recycle = false,
    emissions_multiplier = 5,
    ingredients = {
      {type = "fluid", name = "planetaris-infected-water", amount = 50},
      {type = "item", name = "planetaris-magnesium-bacteria", amount = 3}
    },
    results =
    {
      {type = "fluid", name = "water", amount = 50},
    },
    crafting_machine_tint =
    {
      primary = {r = 0.647, g = 0.824, b = 1, a = 1.000},
      secondary = {r = 0.647, g = 0.824, b = 1, a = 1.000},
    }
  },

  -- CONDENSING AGRI TOWER

  {
    type = "recipe",
    name = "planetaris-tellus-condensing-agricultural-tower",
    localised_name = {"", {"entity-name.condensing-agricultural-tower"}, " (", {"space-location-name.tellus"}, ")"},
    category = "advanced-crafting",
    auto_recycle = false,
    enabled = false,
    energy_required = 5,
    ingredients =
    {
      {type = "item", name = "storage-tank", amount = 1},
      {type = "item", name = "planetaris-magnesium-sheet", amount = 5},
      {type = "item", name = "agricultural-tower", amount = 1},
      {type = "item", name = "advanced-circuit", amount = 3}
    },
    results = {{type="item", name="condensing-agricultural-tower", amount=1}},
},

  -- AIR CLEANING

  {
    type = "recipe",
    name = "planetaris-air-purifier",
    category = "advanced-crafting",
    auto_recycle = false,
    enabled = false,
    energy_required = 5,
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    ingredients =
    {
      {type = "item",  name = "planetaris-magnesium-sheet", amount = 10},
      {type = "item",  name = "steel-plate", amount = 10},
      {type = "item",  name = "plastic-bar", amount = 5},
      {type = "item",  name = "engine-unit", amount = 5},
      {type = "item",  name = "advanced-circuit", amount = 5},
    },
    results =
    {
      {type = "item", name = "planetaris-air-purifier", amount = 1}
    },
    crafting_machine_tint =
    {
      primary = {120, 204, 183, 1},
      secondary = {120, 204, 183, 1},
    }
  },
  
 -- AIR CLEANING

  {
    type = "recipe",
    name = "planetaris-air-cleaning",
    icon= "__planetaris-tellus__/graphics/icons/air-cleaning.png",
    category = "planetaris-air-cleaning",
    subgroup = "tellus-basic-processes",
    order = "a[natural]-a[basic]-c[water]-b",
    auto_recycle = false,
    enabled = false,
    energy_required = 5,
    ingredients =
    {
      {type = "fluid", name = "water", amount = 60},
    },
    results =
    {
      {type = "fluid", name = "planetaris-infected-water", amount = 40}
    },
    crafting_machine_tint =
    {
      primary = {r = 45, g = 129, b = 86, a = 1.000},
      secondary = {r = 122, g = 75, b = 156, a = 1.000},
    }
  },

  -- Fruit / cap processing
  {
    type = "recipe",
    name = "planetaris-chloroplast-processing",
    icon = "__planetaris-tellus__/graphics/icons/chloroplast-processing.png",
    category = "planetaris-bioassembling-or-assembling",
    subgroup = "tellus-basic-processes",
    order = "a[natural]-c[Chlorophyll]-b-b[fruit]",
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    auto_recycle = false,
    allow_productivity = false,
    energy_required = 1,
    ingredients = {{type = "item", name = "planetaris-chloroplast-fruit", amount = 1}},
    results =
    {
      {type = "item", name = "planetaris-chloroplast-seed", amount = 1, probability = 0.02},
      {type = "item", name = "planetaris-chloroplast-mash", amount = 2}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.45, g = 0.98, b = 0.008, a = 0.500},
      secondary = {r = 0.635, g = 0.8, b = 0.294, a = 0.500},
    }
  },
  {
    type = "recipe",
    name = "planetaris-mycelia-processing",
    icon = "__planetaris-tellus__/graphics/icons/mycelia-processing.png",
    category = "planetaris-bioassembling-or-assembling",
    subgroup = "tellus-basic-processes",
    order = "a[natural]-d[funji]-b-b[mushroom-cap]",
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    auto_recycle = false,
    energy_required = 1,
    ingredients = {{type = "item", name = "planetaris-mushroom-cap", amount = 1}},
    results =
    {
      {type = "item", name = "planetaris-myceliae-seed", amount = 1, probability = 0.02},
      {type = "item", name = "planetaris-mycelia", amount = 2}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.008, g = 0.98, b = 0.855, a = 1.000},
      secondary = {r = 0.294, g = 0.608, b = 0.8, a = 1.000},
    }
  },

  -- NUTRIENTS

  {
    type = "recipe",
    name = "planetaris-nutrients-from-chloroplast-mash",
    icon = "__planetaris-tellus__/graphics/icons/nutrients-from-chloroplast-mash.png",
    category = "planetaris-bioassembling-or-organic-or-hand-crafting",
    subgroup = "tellus-basic-processes",
    enabled = false,
    auto_recycle = false,
    allow_productivity = true,
    order = "a[natural]-e[nutrients]-a",
    energy_required = 4,
    ingredients = {{type = "item", name = "planetaris-chloroplast-mash", amount = 4}},
    results = {{type="item", name="nutrients", amount=6}},
    crafting_machine_tint =
    {
      primary = {r = 0.8, g = 0.9, b = 1, a = 1.000},
      secondary = {r = 0.8, g = 0.2, b = 0.0, a = 1.000},
    }
  },
  {
    type = "recipe",
    name = "planetaris-nutrients-from-mycelia",
    icon = "__planetaris-tellus__/graphics/icons/nutrients-from-mycelia.png",
    category = "planetaris-bioassembling-or-organic-or-hand-crafting",
    subgroup = "tellus-basic-processes",
    enabled = false,
    auto_recycle = false,
    allow_productivity = true,
    order = "a[natural]-e[nutrients]-b",
    energy_required = 4,
    ingredients = {{type = "item", name = "planetaris-mycelia", amount = 4}},
    results = {{type="item", name="nutrients", amount=6}},
    crafting_machine_tint =
    {
      primary = {r = 0.8, g = 0.9, b = 1, a = 1.000},
      secondary = {r = 0.8, g = 0.2, b = 0.0, a = 1.000},
    }
  },

  -- Mycelia compost

  {
    type = "recipe",
    name = "planetaris-mycelia-composite",
    category = "planetaris-bioassembling",
    subgroup = "tellus-basic-processes",
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    auto_recycle = false,
    energy_required = 8,
    ingredients = {
      {type = "fluid", name = "water", amount = 10},
      {type = "item",  name = "planetaris-mycelia", amount = 5},
      {type = "item",  name = "wood", amount = 2},
    },
    results =
    {
      {type = "item", name = "planetaris-mycelia-composite", amount = 2}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.008, g = 0.98, b = 0.855, a = 1.000},
      secondary = {r = 0.294, g = 0.608, b = 0.8, a = 1.000},
    }
  },

  -- SEED COMPOUND

  {
    type = "recipe",
    name = "planetaris-seed-compound",
    category = "planetaris-bioassembling",
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    auto_recycle = false,
    energy_required = 8,
    ingredients = {
      {type = "fluid", name = "water", amount = 10},
      {type = "item", name = "planetaris-chloroplast-mash", amount = 5},
      {type = "item", name = "planetaris-compost", amount = 2}
    },
    results =
    {
      {type = "fluid", name = "planetaris-seed-compound", amount = 20},
    },
    crafting_machine_tint =
    {
      primary = {r = 0.45, g = 0.98, b = 0.008, a = 1.000},
      secondary = {r = 0.635, g = 0.8, b = 0.294, a = 1.000},
    }
  },

  -- bioengineering science pack

    {
    type = "recipe",
    name = "planetaris-bioengineering-science-pack",
    category = "planetaris-bioassembling",
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    auto_recycle = false,
    energy_required = 4,
    ingredients = {
      {type = "fluid", name = "planetaris-seed-compound", amount = 15},
      {type = "item",  name = "planetaris-magnesium-sheet", amount = 2},
      {type = "item",  name = "planetaris-mycelia-composite", amount = 5}
    },
    results =
    {
      {type = "item",  name = "planetaris-bioengineering-science-pack", amount = 2},
    },
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 0.79, g = 0.98, b = 0.008, a = 1.000},
      secondary = {r = 0.635, g = 0.8, b = 0.294, a = 1.000},
    }
  },

  -- BACTERIOCHLOROPHYLL

    {
    type = "recipe",
    name = "planetaris-bacteriochlorophyll",
    category = "planetaris-bioassembling",
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    auto_recycle = false,
    energy_required = 8,
    emissions_multiplier = 5,
    ingredients = {
      {type = "fluid", name = "planetaris-chlorophyll", amount = 10},
      {type = "item",  name = "planetaris-magnesium-bacteria", amount = 5},
      {type = "item",  name = "planetaris-wasp-egg", amount = 1},
    },
    results =
    {
      {type = "fluid", name = "planetaris-bacteriochlorophyll", amount = 10},
    },
    crafting_machine_tint =
    {
      primary = {r = 0.831, g = 0.639, b = 0.859, a = 1.000},
      secondary = {r = 0.831, g = 0.639, b = 0.859, a = 1.000},
    }
  },
--------------------------------------------------------------------------- Vanilla materials
  -- Plastic

  {
    type = "recipe",
    name = "planetaris-mycelia-plastic",
    icons = {
        {icon="__planetaris-tellus__/graphics/icons/mycelia.png", draw_background=false},
        {icon="__base__/graphics/icons/plastic-bar.png",  shift={12, 12}, scale=0.5},
      },
    category = "planetaris-bioassembling",
    subgroup = "tellus-basic-processes",
    order = "c[other]-a",
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    auto_recycle = false,
    energy_required = 2,
    ingredients = {
      {type = "fluid", name = "water", amount = 10},
      {type = "item",  name = "planetaris-mycelia", amount = 3},
      {type = "item",  name = "planetaris-magnesium-dust", amount = 1},
    },
    results =
    {
      {type = "item", name = "plastic-bar", amount = 2}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.008, g = 0.98, b = 0.855, a = 1.000},
      secondary = {r = 0.294, g = 0.608, b = 0.8, a = 1.000},
    }
  },

  -- LUBRICANT

  {
    type = "recipe",
    name = "planetaris-chloroplast-lubricant",
    icon = "__planetaris-tellus__/graphics/icons/fluids/chloroplast-lubricant.png",
    category = "planetaris-bioassembling",
    subgroup = "tellus-basic-processes",
    order = "a[natural]-c[Chlorophyll]-c[mash]-b",
    energy_required = 2,
    enabled = false,
    auto_recycle = false,
    ingredients =
    {
      {type = "item", name = "planetaris-chloroplast-mash", amount = 60}
    },
    results =
    {
      {type = "fluid", name="lubricant", amount = 20}
    },
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 0, g = 1, b = 0, a = 1.000},
      secondary = {r = 0.3, g = 1, b = 0.3, a = 1.000},
    }
  },

  -- COPPER BACTERIA

  {
    type = "recipe",
    name = "planetaris-copper-bacteria",
    icons = {
        {icon="__planetaris-tellus__/graphics/icons/mushroom-cap.png", draw_background=false},
        {icon="__space-age__/graphics/icons/copper-bacteria.png",  shift={12, 12}, scale=0.5},
    },
    localised_name = {"item-name.copper-bacteria"},
    localised_description = {"item-description.copper-description"},
    category = "organic",
    subgroup = "tellus-basic-processes",
    order = "c[other]-c",
    auto_recycle = false,
    energy_required = 1,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "planetaris-mycelia", amount = 1},
      {type = "item", name = "planetaris-mushroom-cap", amount = 1}
    },
    results =
    {
      {type = "item", name="copper-bacteria", amount = 1}
    },
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 0, g = 1, b = 0, a = 1.000},
      secondary = {r = 0.3, g = 1, b = 0.3, a = 1.000},
    }
  },

  -- Magnesium Iron BACTERIA

  {
    type = "recipe",
    name = "planetaris-magnesium-iron-bacteria",
    icons = {
        {icon="__planetaris-tellus__/graphics/icons/magnesium-bacteria.png", draw_background=false},
        {icon="__space-age__/graphics/icons/iron-bacteria.png",  shift={12, 12}, scale=0.5},
    },
    category = "organic",
    subgroup = "tellus-basic-processes",
    order = "c[other]-d",
    auto_recycle = false,
    energy_required = 1,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "planetaris-chloroplast-mash", amount = 3},
    },
    results =
    {
      {type = "item", name="iron-bacteria", amount = 1},
      {type = "item", name="planetaris-magnesium-bacteria", amount = 1}
    },
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 0.647, g = 0.957, b = 1, a = 1.000},
      secondary = {r = 0.647, g = 0.957, b = 1, a = 1.000},
    }
  },

  {
    type = "recipe",
    name = "planetaris-rocket-fuel-from-mash",
    icon = "__planetaris-tellus__/graphics/icons/rocket-fuel-from-mash.png",
    category = "organic",
    subgroup = "tellus-basic-processes",
    order = "c[other]-e",
    auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 10,
    ingredients =
    {
      {type = "fluid", name = "water", amount = 30},
      {type = "item", name =  "planetaris-chloroplast-mash", amount = 30},
      {type = "item", name = "bioflux", amount = 2}
    },
    results = {{type="item", name="rocket-fuel", amount=1}},
    crafting_machine_tint =
    {
      primary = {r = 151, g = 66, b = 0, a = 1.000},
      secondary = {r = 0.3, g = 0.9, b = 0.3, a = 1.000},
    }
  },
-------------------------------------------------------------------------------------------

-------------------------------------------PARASITES

  -- Tellurian parasite

  {
    type = "recipe",
    name = "planetaris-tellurian-parasite",
    category = "planetaris-pathologics",
    energy_required = 2,
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    auto_recycle = false,
    emissions_multiplier = 5,
    ingredients = {
      {type = "item", name = "planetaris-wasp-egg", amount = 2},
      {type = "item",  name = "copper-bacteria", amount = 1},
      {type = "item",  name = "iron-bacteria", amount = 1},
    },
    results =
    {
      {type = "item", name = "planetaris-tellurian-parasite", amount = 1},
    },
    crafting_machine_tint =
    {
      primary = {r = 0.45, g = 0.98, b = 0.008, a = 1.000},
      secondary = {r = 0.635, g = 0.8, b = 0.294, a = 1.000},
    }
  },
  {
    type = "recipe",
    name = "planetaris-nauvian-parasite",
    category = "organic",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 1000,
        max = 1000
      },
      {
        property = "gravity",
        min = 10,
        max = 10
      },
    },
    enabled = false,
    auto_recycle = false,
    emissions_multiplier = 10,
    ingredients = {
      {type = "item",  name = "biter-egg", amount = 2},
      {type = "item",  name = "spoilage", amount = 50},
      {type = "item",  name = "raw-fish", amount = 10},
    },
    results =
    {
      {type = "item", name = "planetaris-nauvian-parasite", amount = 1},
    },
    crafting_machine_tint =
    {
      primary = {r = 0.878, g = 0.843, b = 0.545, a = 1.000},
      secondary = {r = 0.878, g = 0.843, b = 0.545, a = 1.000},
    }
  },
  {
    type = "recipe",
    name = "planetaris-glebian-parasite",
    category = "organic",

    surface_conditions =
    {
      {
        property = "pressure",
        min = 2000,
        max = 2000
      },
      {
        property = "gravity",
        min = 20,
        max = 20
      },
      {
        property = "planetaris-pollen-corrosion",
        min = 30,
        max = 40
      },
    },
    enabled = false,
    auto_recycle = false,
    emissions_multiplier = 10,
    ingredients = {
      {type = "item",  name = "pentapod-egg", amount = 5},
      {type = "item",  name = "jellynut", amount = 5},
      {type = "item",  name = "nutrients", amount = 50},
    },
    results =
    {
      {type = "item", name = "planetaris-glebian-parasite", amount = 1},
    },
    crafting_machine_tint =
    {
      primary = {r = 0.698, g = 0.91, b = 0.608, a = 1.000},
      secondary = {r = 0.698, g = 0.91, b = 0.608, a = 1.000},
    }
  },

  ----------------------------- QUARANTINED

    {
    type = "recipe",
    name = "planetaris-quarantined-nauvian-parasite",
    category = "advanced-crafting",
    energy_required = 2,
    surface_conditions =
    {
      {
        property = "pressure",
        min = 1000,
        max = 1000
      },
      {
        property = "gravity",
        min = 10,
        max = 10
      },
    },
    enabled = false,
    auto_recycle = false,
    emissions_multiplier = 2,
    ingredients = {
      {type = "item",  name = "planetaris-nauvian-parasite", amount = 1},
      {type = "item",  name = "barrel", amount = 1},
    },
    results =
    {
      {type = "item", name = "planetaris-quarantined-nauvian-parasite", amount = 1},
    },
    crafting_machine_tint =
    {
      primary = {r = 0.878, g = 0.843, b = 0.545, a = 1.000},
      secondary = {r = 0.878, g = 0.843, b = 0.545, a = 1.000},
    }
  },
  {
    type = "recipe",
    name = "planetaris-quarantined-glebian-parasite",
    category = "advanced-crafting",
    energy_required = 2,
    surface_conditions =
    {
      {
        property = "pressure",
        min = 2000,
        max = 2000
      },
      {
        property = "gravity",
        min = 20,
        max = 20
      },
    },
    enabled = false,
    auto_recycle = false,
    ingredients = {
      {type = "item",  name = "planetaris-glebian-parasite", amount = 1},
      {type = "item",  name = "barrel", amount = 1},
    },
    results =
    {
      {type = "item", name = "planetaris-quarantined-glebian-parasite", amount = 1},
    },
    crafting_machine_tint =
    {
      primary = {r = 0.878, g = 0.843, b = 0.545, a = 1.000},
      secondary = {r = 0.878, g = 0.843, b = 0.545, a = 1.000},
    }
  },

  ----------------------------- DEQUARANTINED

  {
    type = "recipe",
    name = "planetaris-dequarantined-nauvian-parasite",
    icon = "__planetaris-tellus__/graphics/icons/dequarantined-nauvian-parasite.png",
    category = "advanced-crafting",
    energy_required = 2,
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    auto_recycle = false,
    emissions_multiplier = 2,
    ingredients = {
      {type = "item",  name = "planetaris-nauvian-parasite", amount = 1},
      {type = "item",  name = "barrel", amount = 1},
    },
    results =
    {
      {type = "item", name = "planetaris-quarantined-nauvian-parasite", amount = 1},
    },
    crafting_machine_tint =
    {
      primary = {r = 0.878, g = 0.843, b = 0.545, a = 1.000},
      secondary = {r = 0.878, g = 0.843, b = 0.545, a = 1.000},
    }
  },
  {
    type = "recipe",
    name = "planetaris-dequarantined-glebian-parasite",
    icon = "__planetaris-tellus__/graphics/icons/dequarantined-glebian-parasite.png",
    category = "advanced-crafting",
    energy_required = 2,
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    auto_recycle = false,
    ingredients = {
      {type = "item",  name = "planetaris-glebian-parasite", amount = 1},
      {type = "item",  name = "barrel", amount = 1},
    },
    results =
    {
      {type = "item", name = "planetaris-quarantined-glebian-parasite", amount = 2},
    },
    crafting_machine_tint =
    {
      primary = {r = 0.878, g = 0.843, b = 0.545, a = 1.000},
      secondary = {r = 0.878, g = 0.843, b = 0.545, a = 1.000},
    }
  },

  -- BIOFLUX

  {
    type = "recipe",
    name = "planetaris-compost-bioflux",
    icons = {
        {icon="__space-age__/graphics/icons/bioflux.png", draw_background=false},
        {icon="__planetaris-tellus__/graphics/icons/compost.png",  shift={12, 12}, scale=0.5},
    },
    category = "organic",
    subgroup = "agriculture-products",
    order = "a[organic-products]-g[bioflux]-b",
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 6,
    ingredients =
    {
      {type = "item", name = "planetaris-compost", amount = 12},
      {type = "item", name = "planetaris-chloroplast-mash", amount = 12}
    },
    results = {{type="item", name="bioflux", amount=4}},
    crafting_machine_tint =
    {
      primary = {r = 0.3, g = 0.9, b = 0.8, a = 1.000},
      secondary = {r = 0.8, g = 0.5, b = 0.3, a = 1.000},
    }
  },

  ------------------------- Reproduction

  {
    type = "recipe",
    name = "planetaris-nauvian-parasite-reproduction",
    icon = "__planetaris-tellus__/graphics/icons/nauvian-parasite-reproduction.png",
    category = "planetaris-pathologics",
    subgroup = "tellus-pathological-processes",
    order = "b[nauvis]-a[parasite]-d",
    energy_required = 2,
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    auto_recycle = false,
    emissions_multiplier = 2,
    ingredients = {
      {type = "item",  name = "planetaris-nauvian-parasite", amount = 1},
      {type = "item",  name = "spoilage", amount = 10},
      {type = "item",  name = "iron-bacteria", amount = 2},
    },
    results =
    {
      {type = "item", name = "planetaris-nauvian-parasite", amount = 2},
    },
    crafting_machine_tint =
    {
      primary = {r = 0.45, g = 0.98, b = 0.008, a = 1.000},
      secondary = {r = 0.635, g = 0.8, b = 0.294, a = 1.000},
    }
  },
  {
    type = "recipe",
    name = "planetaris-glebian-parasite-reproduction",
    icon = "__planetaris-tellus__/graphics/icons/glebian-parasite-reproduction.png",
    category = "planetaris-pathologics",
    subgroup = "tellus-pathological-processes",
    order = "c[gleba]-a[parasite]-d",
    energy_required = 2,
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    auto_recycle = false,
    emissions_multiplier = 2,
    ingredients = {
      {type = "item",  name = "planetaris-glebian-parasite", amount = 1},
      {type = "item",  name = "planetaris-mycelia", amount = 10},
      {type = "item",  name = "copper-bacteria", amount = 2},
    },
    results =
    {
      {type = "item", name = "planetaris-glebian-parasite", amount = 2},
    },
    crafting_machine_tint =
    {
      primary = {r = 0.45, g = 0.98, b = 0.008, a = 1.000},
      secondary = {r = 0.635, g = 0.8, b = 0.294, a = 1.000},
    }
  },

  -------------------- NEST
    {
    type = "recipe",
    name = "planetaris-parasite-nest",
    category = "planetaris-pathologics",
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    auto_recycle = false,
    enabled = false,
    emissions_multiplier = 5,
    allow_productivity = true,
    reset_freshness_on_craft = true,
    hide_from_signal_gui = true,
    energy_required = 8,
    ingredients =
    {
      {type = "item", name = "planetaris-tellurian-parasite", amount = 1, ignored_by_stats = 1},
      {type = "item", name = "planetaris-nauvian-parasite", amount = 1, ignored_by_stats = 1},
      {type = "item", name = "planetaris-glebian-parasite", amount = 1, ignored_by_stats = 1},
      {type = "item", name = "planetaris-polimer-skin", amount = 5},
      {type = "fluid", name = "water", amount = 60}
    },
    results =
    {
      {type = "item", name = "planetaris-parasite-nest", amount = 2, ignored_by_stats = 1, ignored_by_productivity = 1}
    },
    crafting_machine_tint =
    {
      primary = {r = 45, g = 129, b = 86, a = 1.000},
      secondary = {r = 122, g = 75, b = 156, a = 1.000},
    }
  },
  --------------------------------------------------------------------------------------

  -- PESTICIDE

  {
    type = "recipe",
    name = "planetaris-pesticide",
    category = "planetaris-bioassembling",
    energy_required = 8,
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    auto_recycle = false,
    ingredients = {
      {type = "item", name = "planetaris-wasp-egg", amount = 1},
      {type = "item",  name = "planetaris-magnesium-dust", amount = 5},
      {type = "item",  name = "plastic-bar", amount = 2}
    },
    results =
    {
      {type = "item", name = "planetaris-pesticide", amount = 3},
    },
    crafting_machine_tint =
    {
      primary = {r = 0.68, g = 0.88, b = 0.82, a = 1.000},
      secondary = {r = 0.68, g = 0.88, b = 0.82, a = 1.000},
    }
  },

  -- ROOTS 

  {
    type = "recipe",
    name = "planetaris-root",
    category = "organic-or-hand-crafting",
    energy_required = 1,
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    auto_recycle = false,
    ingredients = {
      {type = "item",  name = "wood", amount = 1},
      {type = "item",  name = "planetaris-magnesium-dust", amount = 1},
    },
    results =
    {
      {type = "item", name = "planetaris-root", amount = 1},
    },
    crafting_machine_tint =
    {
      primary = {r = 0.62, g = 0.416, b = 0.263, a = 1.000},
      secondary = {r = 0.62, g = 0.416, b = 0.263, a = 1.000},
    }
  },
  {
    type = "recipe",
    name = "planetaris-root-pump",
    category = "organic-or-hand-crafting",
    energy_required = 2,
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    ingredients = {
      {type = "item",  name = "planetaris-root", amount = 2},
      {type = "item",  name = "engine-unit", amount = 1},
      {type = "item",  name = "planetaris-magnesium-sheet", amount = 1},
    },
    results =
    {
      {type = "item", name = "planetaris-root-pump", amount = 1},
    },
    crafting_machine_tint =
    {
      primary = {r = 0.62, g = 0.416, b = 0.263, a = 1.000},
      secondary = {r = 0.62, g = 0.416, b = 0.263, a = 1.000},
    }
  },
  {
    type = "recipe",
    name = "planetaris-root-storage-tank",
    category = "organic-or-hand-crafting",
    energy_required = 4,
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    ingredients = {
      {type = "item",  name = "planetaris-root", amount = 2},
      {type = "item",  name = "storage-tank", amount = 1},
    },
    results =
    {
      {type = "item", name = "planetaris-root-storage-tank", amount = 1},
    },
    crafting_machine_tint =
    {
      primary = {r = 0.62, g = 0.416, b = 0.263, a = 1.000},
      secondary = {r = 0.62, g = 0.416, b = 0.263, a = 1.000},
    }
  },
  {
    type = "recipe",
    name = "planetaris-root-filler",
    category = "organic-or-hand-crafting",
    energy_required = 2,
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    ingredients = {
      {type = "item",  name = "planetaris-root", amount = 2},
      {type = "item",  name = "engine-unit", amount = 1},
      {type = "item",  name = "planetaris-magnesium-sheet", amount = 3},
    },
    results =
    {
      {type = "item", name = "planetaris-root-filler", amount = 1},
    },
    crafting_machine_tint =
    {
      primary = {r = 0.62, g = 0.416, b = 0.263, a = 1.000},
      secondary = {r = 0.62, g = 0.416, b = 0.263, a = 1.000},
    }
  },
  {
    type = "recipe",
    name = "planetaris-root-to-ground",
    category = "organic-or-hand-crafting",
    energy_required = 2,
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    ingredients = {
      {type = "item",  name = "planetaris-root", amount = 10},
    },
    results =
    {
      {type = "item", name = "planetaris-root-to-ground", amount = 2},
    },
    crafting_machine_tint =
    {
      primary = {r = 0.62, g = 0.416, b = 0.263, a = 1.000},
      secondary = {r = 0.62, g = 0.416, b = 0.263, a = 1.000},
    }
  },

  -------------------------------------------------- OTHER PLANETS
  {
    type = "recipe",
    name = "planetaris-volcanic-soil",
    category = "planetaris-bioassembling",
    energy_required = 4,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      {type = "item",  name = "planetaris-carbolyte-pod", amount = 1},
      {type = "item",  name = "landfill", amount = 5},
      {type = "fluid", name = "planetaris-seed-compound", amount = 20},
    },
    results =
    {
      {type = "item", name = "planetaris-volcanic-soil", amount = 10},
    },
    crafting_machine_tint =
    {
      primary = {0.89, 0.843, 0.282, 1},
      secondary = {0.89, 0.843, 0.282, 1},
    }
  },
  {
    type = "recipe",
    name = "planetaris-carbolyte-melting",
    icon = "__planetaris-tellus__/graphics/icons/carbolyte-melt.png",
    category = "metallurgy",
    subgroup = "tellus-other-planet-agriculture",
    order = "a[vulcanus]-b[crust]-b",
    energy_required = 2,
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    auto_recycle = false,
    ingredients = {
      {type = "item",  name = "planetaris-carbolyte-crust", amount = 1},
    },
    results =
    {
      {type = "item", name = "planetaris-carbolyte-pod", amount = 1, probability = 0.02},
      {type = "item", name = "planetaris-carbolyte-bacteria", amount = 1},
      {type = "item", name = "stone", amount = 2},
    },
    crafting_machine_tint =
    {
      primary = {0.89, 0.843, 0.282, 1},
      secondary = {0.89, 0.843, 0.282, 1},
    }
  },
  {
    type = "recipe",
    name = "planetaris-carbolyte-separation",
    icon = "__planetaris-tellus__/graphics/icons/carbolyte-separation.png",
    category = "planetaris-bioassembling-or-organic",
    subgroup = "tellus-other-planet-agriculture",
    order = "a[vulcanus]-b[crust]-b",
    energy_required = 4,
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    auto_recycle = false,
    ingredients = {
      {type = "item",  name = "planetaris-carbolyte-crust", amount = 1},
    },
    results =
    {
      {type = "item", name = "planetaris-carbolyte-pod", amount = 1, probability = 0.02},
      {type = "item", name = "planetaris-carbolyte-bacteria", amount = 1},
      {type = "item", name = "stone", amount = 2},
    },
    crafting_machine_tint =
    {
      primary = {0.89, 0.843, 0.282, 1},
      secondary = {0.89, 0.843, 0.282, 1},
    }
  },
  ---------------- FULGORA
  ---
  {
    type = "recipe",
    name = "planetaris-dust-soil",
    category = "planetaris-bioassembling",
    energy_required = 4,
    enabled = false,
    auto_recycle = false,
    ingredients = {
      {type = "item",  name = "planetaris-holmiumnite-pod", amount = 1},
      {type = "item",  name = "landfill", amount = 5},
      {type = "fluid", name = "planetaris-seed-compound", amount = 20},
    },
    results =
    {
      {type = "item", name = "planetaris-dust-soil", amount = 10},
    },
    crafting_machine_tint =
    {
      primary = {0.929, 0.549, 0.737, 1},
      secondary = {0.929, 0.549, 0.737, 1},
    }
  },
  {
    type = "recipe",
    name = "planetaris-holmiumnite-pod",
    category = "electronics-with-fluid",
    energy_required = 4,
    surface_conditions =
    {
      {
        property = "magnetic-field",
        min = 99,
        max = 99
      }
    },
    enabled = false,
    auto_recycle = false,
    ingredients = {
      {type = "item",   name = "holmium-ore", amount = 20},
      {type = "item",   name = "stone",       amount = 50},
      {type = "fluid",  name = "electrolyte", amount = 50},
    },
    results =
    {
      {type = "item", name = "planetaris-holmiumnite-pod", amount = 1},
    },
    crafting_machine_tint =
    {
      primary = {0.929, 0.549, 0.737, 1},
      secondary = {0.929, 0.549, 0.737, 1},
    }
  },
  {
    type = "recipe",
    name = "planetaris-holmiumnite-electrolysis",
    icon = "__planetaris-tellus__/graphics/icons/homiumnite-electrolysis.png",
    category = "electromagnetics",
    subgroup = "tellus-other-planet-agriculture",
    order = "b[fulgora]-b[bulb]-b",
    energy_required = 2,
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    auto_recycle = false,
    ingredients = {
      {type = "item",  name = "planetaris-holmiumnite-bulb", amount = 1},
      {type = "fluid",  name = "water", amount = 10},
    },
    results =
    {
      {type = "item", name = "planetaris-holmiumnite-pod", amount = 1, probability = 0.02},
      {type = "item", name = "planetaris-fulgoran-bacteria", amount = 1},
    },
    crafting_machine_tint =
    {
      primary = {0.929, 0.549, 0.737, 1},
      secondary = {0.929, 0.549, 0.737, 1},
    }
  },
  {
    type = "recipe",
    name = "planetaris-holmium-bacteria",
    category = "electromagnetics",
    subgroup = "tellus-other-planet-agriculture",
    order = "b[fulgora]-b-b",
    energy_required = 2,
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    auto_recycle = false,
    ingredients = {
      {type = "item",  name = "planetaris-fulgoran-bacteria", amount = 10},
    },
    results =
    {
      {type = "item", name = "holmium-ore", amount = 1},
    },
    crafting_machine_tint =
    {
      primary = {0.929, 0.549, 0.737, 1},
      secondary = {0.929, 0.549, 0.737, 1},
    }
  },

    -- Polimer skin

  {
    type = "recipe",
    name = "planetaris-polimer-skin",
    category = "planetaris-pathologics",
    energy_required = 8,
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    emissions_multiplier = 3,
    ingredients = {
      {type = "item",  name = "planetaris-mycelia-composite", amount = 2},
      {type = "item",  name = "nutrients", amount = 5},
      {type = "item",  name = "plastic-bar", amount = 1},
    },
    results =
    {
      {type = "item", name = "planetaris-polimer-skin", amount = 1},
    },
    crafting_machine_tint =
    {
      primary = {r = 0.45, g = 0.98, b = 0.008, a = 1.000},
      secondary = {r = 0.635, g = 0.8, b = 0.294, a = 1.000},
    }
  },

  -- Artificial heart

  {
    type = "recipe",
    name = "planetaris-artificial-heart",
    category = "planetaris-pathologics",
    energy_required = 12,
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    auto_recycle = false,
    emissions_multiplier = 5,
    ingredients = {
      {type = "item",  name = "planetaris-polimer-skin", amount = 5},
      {type = "item",  name = "nutrients", amount = 5},
      {type = "item",  name = "planetaris-magnesium-bacteria", amount = 3},
      {type = "item",  name = "planetaris-tellurian-parasite", amount = 1}
    },
    results =
    {
      {type = "item", name = "planetaris-artificial-heart", amount = 1},
    },
    crafting_machine_tint =
    {
      primary = {r = 0.45, g = 0.98, b = 0.008, a = 1.000},
      secondary = {r = 0.635, g = 0.8, b = 0.294, a = 1.000},
    }
  },

  {
    type = "recipe",
    name = "planetaris-artificial-chlorophyll-soil",
    category = "planetaris-bioassembling",
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    allow_productivity = true,
    energy_required = 4,
    ingredients =
    {
      {type = "item",  name = "planetaris-chloroplast-seed", amount = 2},
      {type = "fluid", name = "planetaris-seed-compound", amount = 20},
      {type = "item",  name = "landfill", amount = 5}
    },
    results = {{type="item", name="planetaris-artificial-chlorophyll-soil", amount=10}}
  },

  {
    type = "recipe",
    name = "planetaris-overgrowth-chlorophyll-soil",
    category = "planetaris-bioassembling",
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    allow_productivity = true,
    energy_required = 16,
    ingredients =
    {
      {type = "item", name = "planetaris-artificial-chlorophyll-soil", amount = 2},
      {type = "item", name = "planetaris-chloroplast-seed", amount = 5},
      {type = "item", name = "planetaris-wasp-egg", amount = 10},
      {type = "item", name = "planetaris-magnesium-dust", amount = 50},
      {type=  "fluid", name= "planetaris-chlorophyll", amount=100}
    },
    results = {{type="item", name="planetaris-overgrowth-chlorophyll-soil", amount=1}}
  },

    {
    type = "recipe",
    name = "planetaris-artificial-mycelia-soil",
    category = "planetaris-bioassembling",
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    allow_productivity = true,
    energy_required = 4,
    ingredients =
    {
      {type = "item", name = "planetaris-myceliae-seed", amount = 2},
      {type = "fluid", name = "planetaris-seed-compound", amount = 20},
      {type = "item", name = "landfill", amount = 5}
    },
    results = {{type="item", name="planetaris-artificial-mycelia-soil", amount=10}}
  },

  {
    type = "recipe",
    name = "planetaris-overgrowth-mycelia-soil",
    category = "planetaris-bioassembling",
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    allow_productivity = true,
    energy_required = 16,
    ingredients =
    {
      {type = "item", name = "planetaris-artificial-mycelia-soil", amount = 2},
      {type = "item", name = "planetaris-myceliae-seed", amount = 5},
      {type = "item", name = "planetaris-wasp-egg", amount = 10},
      {type = "item", name = "planetaris-magnesium-dust", amount = 50},
      {type=  "fluid", name= "water", amount=100}
    },
    results = {{type="item", name="planetaris-overgrowth-mycelia-soil", amount=1}}
  },

  -- pathological science pack

    {
    type = "recipe",
    name = "planetaris-pathological-science-pack",
    category = "planetaris-pathologics",
    emissions_multiplier = 5,
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    auto_recycle = false,
    result_is_always_fresh = true,
    reset_freshness_on_craft = true,
    energy_required = 8,
    ingredients = {
      {type = "item",  name = "planetaris-parasite-nest",      amount = 1},
      {type = "item",  name = "planetaris-carbolyte-bacteria", amount = 2},
      {type = "item",  name = "planetaris-fulgoran-bacteria",  amount = 2},
    },
    results =
    {
      {type = "item",  name = "planetaris-pathological-science-pack", amount = 2},
    },
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 0.45, g = 0.98, b = 0.008, a = 1.000},
      secondary = {r = 0.635, g = 0.8, b = 0.294, a = 1.000},
    }
  },

  -- Bioassembler

  {
    type = "recipe",
    name = "planetaris-incubator",
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    emissions_multiplier = 3,
    ingredients =
      {
        {type = "item", name = "biochamber", amount = 1},
        {type = "item", name = "advanced-circuit", amount = 5},
        {type = "item", name = "planetaris-magnesium-sheet", amount = 10},
        {type = "item", name = "planetaris-root", amount = 10},
      },
    results = {{type="item", name="planetaris-incubator", amount=1}}
  },
  {
    type = "recipe",
    name = "planetaris-wasp-egg",
    category = "planetaris-bioassembling",
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    subgroup = "agriculture-products",
    order = "c[eggs]-c[wasp-egg]-b",
    auto_recycle = false,
    enabled = false,
    emissions_multiplier = 5,
    allow_productivity = true,
    reset_freshness_on_craft = true,
    hide_from_signal_gui = true,
    energy_required = 15,
    ingredients =
    {
      {type = "item", name = "planetaris-wasp-egg", amount = 1, ignored_by_stats = 1},
      {type = "item", name = "nutrients", amount = 30},
      {type = "fluid", name = "water", amount = 60}
    },
    results =
    {
      {type = "item", name = "planetaris-wasp-egg", amount = 2, ignored_by_stats = 1, ignored_by_productivity = 1}
    },
    crafting_machine_tint =
    {
      primary = {r = 45, g = 129, b = 86, a = 1.000},
      secondary = {r = 122, g = 75, b = 156, a = 1.000},
    }
  },

  -- Wasps bots
  {
    type = "recipe",
    name = "planetaris-robowasp-port",
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    ingredients =
      {
        {type = "item", name = "roboport", amount = 1},
        {type = "item", name = "planetaris-tellurian-parasite", amount = 1},
        {type = "item", name = "planetaris-artificial-heart", amount = 1},
        {type = "item", name = "planetaris-polimer-skin", amount = 20},
      },
    results = {{type="item", name="planetaris-robowasp-port", amount=1}}
  },
  {
    type = "recipe",
    name = "planetaris-logistic-robowasp",
    surface_conditions =
    {
      {
        property = "planetaris-pollen-corrosion",
        min = 50,
        max = 100
      }
    },
    enabled = false,
    ingredients =
      {
        {type = "item", name = "logistic-robot", amount = 1},
        {type = "item", name = "planetaris-artificial-heart", amount = 1},
        {type = "item", name = "planetaris-magnesium-sheet", amount = 5},
      },
    results = {{type="item", name="planetaris-logistic-robowasp", amount=1}}
  },

---------------------------------------

  {
    type = "recipe",
    name = "planetaris-three-long-handed-inserter",
    enabled = false,
    ingredients =
    {
      {type = "item", name = "iron-gear-wheel", amount = 3},
      {type = "item", name = "steel-plate", amount = 1},
      {type = "item", name = "planetaris-magnesium-sheet", amount = 3},
      {type = "item", name = "long-handed-inserter", amount = 1}
    },
    results = {{type="item", name="planetaris-three-long-handed-inserter", amount=1}}
  },
  {
    type = "recipe",
    name = "planetaris-long-stack-inserter",
    enabled = false,
    ingredients =
    {
      {type = "item", name = "planetaris-magnesium-sheet", amount = 15},
      {type = "item", name = "advanced-circuit", amount = 5},
      {type = "item", name = "processing-unit", amount = 1},
      {type = "item", name = "bulk-inserter", amount = 1}
    },
    results = {{type="item", name="planetaris-long-stack-inserter", amount=1}}
  },

-- ROCKET

  {
    type = "recipe",
    name = "planetaris-tellus-rocket-silo",
    icon = "__planetaris-tellus__/graphics/icons/tellus-rocket-silo.png",
    enabled = false,
    auto_recycle = false,
    ingredients =
    {
      {type = "item", name = "planetaris-magnesium-sheet", amount = 500},
      {type = "item", name = "concrete", amount = 1000},
      {type = "item", name = "planetaris-root", amount = 100},
      {type = "item", name = "advanced-circuit", amount = 200},
      {type = "item", name = "electric-engine-unit", amount = 200}
    },
    energy_required = 30,
    results = {{type="item", name="rocket-silo", amount=1}},
    requester_paste_multiplier = 1
  },
{
      type = "recipe",
      name = "planetaris-tellus-rocket-part",
      localised_name = {"", {"item-name.rocket-part"}," (", {"space-location-name.tellus"}, ")"},
      icon = "__planetaris-tellus__/graphics/icons/rocket-part.png",
      localised_description = {"item-description.rocket-part"},
      energy_required = 2,
      enabled = false,
      surface_conditions =
      {
        {
          property = "planetaris-pollen-corrosion",
          min = 50,
          max = 100
        }
      },
      hide_from_player_crafting = true,
      auto_recycle = false,
      category = "rocket-building",
      ingredients =
      {
        {type = "item", name = "planetaris-chlorophyll-barrel", amount = 5},
        {type = "item", name = "planetaris-pesticide", amount = 1},
        {type = "item", name = "planetaris-mycelia-composite", amount = 5},
        {type = "item", name = "planetaris-magnesium-sheet", amount = 5}
      },
      results = {{type="item", name="rocket-part", amount=1}},
      allow_productivity = true
    },
})

PlanetsLib.assign_rocket_part_recipe("tellus","planetaris-tellus-rocket-part")