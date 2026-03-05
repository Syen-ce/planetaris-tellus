require("PlanetarisLib")

data:extend({
    {
      type = "technology",
      name = "planet-discovery-tellus",
      icons = PlanetsLib.technology_icon_constant_planet("__planetaris-tellus__/graphics/technology/tellus-discovery.png", 256),
      essential = true,
      effects = {
        {
          type = "unlock-space-location",
          space_location = "tellus",
          use_icon_overlay_constant = true
        }
      },
      prerequisites = {
        "planet-discovery-gleba", "agricultural-science-pack",
      },
      unit = {
        count = 1000,
        ingredients = {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"space-science-pack", 1},
          {"agricultural-science-pack", 1}
        },
        time = 30,
      },
      order = "p-t[tellus]",
    },

  {
    type = "technology",
    name = "planetaris-agriculture",
    icon = "__planetaris-tellus__/graphics/technology/tellus-agriculture.png",
    icon_size = 256,
    essential = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planetaris-tellus-condensing-agricultural-tower"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-magnesium-sheet"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-compost"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-mycelia-compost"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-compost-bioflux"
      },
    },
    prerequisites = {"planet-discovery-tellus"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "planetaris-magnesium-stromatolite"
    }
  },

  {
    type = "technology",
    name = "planetaris-chloroplast",
    icon = "__planetaris-tellus__/graphics/technology/chloroplast.png",
    icon_size = 256,
    essential = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planetaris-chloroplast-processing"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-copper-bacteria"
      },
    },
    prerequisites = {"planetaris-agriculture"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "chloroplast"
    }
  },

  {
    type = "technology",
    name = "planetaris-myceliae",
    icon = "__planetaris-tellus__/graphics/technology/mycelia.png",
    icon_size = 256,
    essential = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planetaris-mycelia-processing"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-magnesium-iron-bacteria"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-copper-bacteria"
      },
    },
    prerequisites = {"planetaris-agriculture"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "myceliae"
    }
  },

    {
    type = "technology",
    name = "planetaris-roots",
    icon = "__planetaris-tellus__/graphics/technology/roots.png",
    icon_size = 256,
    essential = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planetaris-root"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-root-pump"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-root-storage-tank"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-root-filler"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-root-to-ground"
      },
    },
    prerequisites = {"planetaris-agriculture"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "mushell"
    }
  },

  {
    type = "technology",
    name = "planetaris-bioassembler",
    icon = "__planetaris-tellus__/graphics/technology/bioassembler.png",
    icon_size = 256,
    essential = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planetaris-bioassembler-seed"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-nutrients-from-chloroplast-mash"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-nutrients-from-mycelia"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-magnesium-bacteria-cultivation"
      },
    },
    prerequisites = {"planetaris-myceliae", "planetaris-chloroplast", "planetaris-roots"},
    research_trigger =
    {
      type = "craft-item",
      item = "planetaris-myceliae-seed",
    }
  },

  {
    type = "technology",
    name = "planetaris-bioengineering",
    icon = "__planetaris-tellus__/graphics/technology/bioengineering.png",
    icon_size = 256,
    essential = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planetaris-seed-compound"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-mycelia-composite"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-mycelia-plastic"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-chloroplast-lubricant"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-rocket-fuel-from-mash"
      },
    },
    prerequisites = {"planetaris-bioassembler"},
    research_trigger =
    {
      type = "craft-item",
      item = "planetaris-bioassembler-seed",
      amount = 10,
    }
  },

  {
    type = "technology",
    name = "planetaris-purification",
    icon = "__planetaris-tellus__/graphics/technology/air-purifier.png",
    icon_size = 256,
    essential = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planetaris-air-purifier"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-desinfecting-water"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-air-cleaning"
      },
    },
    prerequisites = {"planetaris-bioassembler"},
    research_trigger =
    {
      type = "craft-item",
      item = "planetaris-bioassembler-seed"
    }
  },

  {
    type = "technology",
    name = "planetaris-tellus-artificial-soil",
    icon = "__planetaris-tellus__/graphics/technology/artificial-soil.png",
    icon_size = 256,
    essential = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planetaris-artificial-chlorophyll-soil"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-artificial-mycelia-soil"
      }
    },
    research_trigger =
    {
      type = "craft-fluid",
      fluid = "planetaris-seed-compound",
      amount = 100
    },
    prerequisites = {"planetaris-chloroplast", "planetaris-myceliae"}
  },

  {
    type = "technology",
    name = "planetaris-bioengineering-science-pack",
    icon = "__planetaris-tellus__/graphics/technology/bioengineering-science-pack.png",
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planetaris-bioengineering-science-pack"
      },
    },
    prerequisites = {"planetaris-bioengineering", "planetaris-purification"},
    research_trigger =
    {
      type = "craft-item",
      item = "planetaris-mycelia-composite",
      count = 100
    }
  },

  {
    type = "technology",
    name = "transport-belt-capacity-3",
    localised_description = {"technology-description.belt-capacity"},
    icons = util.technology_icon_constant_stack_size("__space-age__/graphics/technology/transport-belt-capacity.png"),
    effects =
    {
      {
        type = "belt-stack-size-bonus",
        modifier = 1
      },
      {
        type = "inserter-stack-size-bonus",
        modifier = 1
      }
    },
    prerequisites = {"transport-belt-capacity-2", "planetaris-bioengineering-science-pack"},
    unit =
    {
      count = 3000,
      ingredients =
      {
        {"automation-science-pack",      1},
        {"logistic-science-pack",        1},
        {"chemical-science-pack",        1},
        {"production-science-pack",      1},
        {"utility-science-pack",         1},
        {"space-science-pack",           1},
        {"agricultural-science-pack",    1},
        {"planetaris-bioengineering-science-pack",  1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "planetaris-pesticide",
    icon = "__planetaris-tellus__/graphics/technology/pesticide.png",
    icon_size = 256,
    essential = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planetaris-pesticide"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-wasp-egg"
      },
    },
    prerequisites = {"planetaris-bioengineering-science-pack"},
    research_trigger =
    {
      type = "craft-item",
      item = "planetaris-bioengineering-science-pack",
      count = 100
    },
  },
  {
    type = "technology",
    name = "planetaris-tellus-rocket-silo",
    icon = "__planetaris-tellus__/graphics/technology/rocket-silo.png",
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planetaris-tellus-rocket-silo"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-tellus-rocket-part"
      },
    },
    prerequisites = {"planetaris-pesticide"},
    research_trigger =
    {
      type = "craft-item",
      item = "planetaris-pesticide",
      count = 50
    },
  },
  {
    type = "technology",
    name = "planetaris-overgrowth-soil",
    icon = "__planetaris-tellus__/graphics/technology/overgrowth-soil.png",
    icon_size = 256,
    essential = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planetaris-overgrowth-chlorophyll-soil"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-overgrowth-mycelia-soil"
      }
    },
    prerequisites = {"planetaris-tellus-artificial-soil", "planetaris-bioengineering-science-pack"},
    unit =
    {
      count = 2000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"planetaris-bioengineering-science-pack",  1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "planetaris-pathogens",
    icon = "__planetaris-tellus__/graphics/technology/incubator.png",
    icon_size = 256,
    essential = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planetaris-incubator"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-bacteriochlorophyll"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-tellurian-parasite"
      },
    },
    prerequisites = {"planetaris-bioengineering-science-pack"},
    unit =
    {
      count = 800,
      ingredients =
      {
        {"automation-science-pack",      1},
        {"logistic-science-pack",        1},
        {"chemical-science-pack",        1},
        {"production-science-pack",      1},
        {"utility-science-pack",         1},
        {"space-science-pack",           1},
        {"agricultural-science-pack",    1},
        {"planetaris-bioengineering-science-pack",  1}
      },
      time = 60
    },
  },
  {
    type = "technology",
    name = "planetaris-artificial-organisms",
    icon = "__planetaris-tellus__/graphics/technology/artificial-heart.png",
    icon_size = 256,
    essential = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planetaris-polimer-skin"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-artificial-heart"
      },
    },
    prerequisites = {"planetaris-pathogens"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack",      1},
        {"logistic-science-pack",        1},
        {"chemical-science-pack",        1},
        {"production-science-pack",      1},
        {"utility-science-pack",         1},
        {"space-science-pack",           1},
        {"agricultural-science-pack",    1},
        {"planetaris-bioengineering-science-pack",  1}
      },
      time = 30
    },
  },
  {
    type = "technology",
    name = "planetaris-advanced-pathological-research",
    icon = "__planetaris-tellus__/graphics/technology/nauvis-pathologics.png",
    icon_size = 256,
    essential = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planetaris-nauvian-parasite"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-quarantined-nauvian-parasite"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-dequarantined-nauvian-parasite"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-nauvian-parasite-reproduction"
      },
    },
    prerequisites = {"planetaris-pathogens"},
    unit =
    {
      count = 800,
      ingredients =
      {
        {"automation-science-pack",      1},
        {"logistic-science-pack",        1},
        {"chemical-science-pack",        1},
        {"production-science-pack",      1},
        {"utility-science-pack",         1},
        {"space-science-pack",           1},
        {"agricultural-science-pack",    1},
        {"planetaris-bioengineering-science-pack",  1}
      },
      time = 30
    },
  },
  {
    type = "technology",
    name = "planetaris-gleba-pathological-research",
    icon = "__planetaris-tellus__/graphics/technology/gleba-pathologics.png",
    icon_size = 256,
    essential = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planetaris-glebian-parasite"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-quarantined-glebian-parasite"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-dequarantined-glebian-parasite"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-glebian-parasite-reproduction"
      },
    },
    prerequisites = {"planetaris-advanced-pathological-research"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack",      1},
        {"logistic-science-pack",        1},
        {"chemical-science-pack",        1},
        {"production-science-pack",      1},
        {"utility-science-pack",         1},
        {"space-science-pack",           1},
        {"agricultural-science-pack",    1},
        {"planetaris-bioengineering-science-pack",  1}
      },
      time = 30
    },
  },
  {
    type = "technology",
    name = "planetaris-parasite-nest",
    icon = "__planetaris-tellus__/graphics/technology/parasite-nest.png",
    icon_size = 256,
    essential = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planetaris-parasite-nest"
      },
    },
    prerequisites = {"planetaris-artificial-organisms","planetaris-gleba-pathological-research"},
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
        {"planetaris-bioengineering-science-pack",  1}
      },
      time = 30
    },
  },
  {
    type = "technology",
    name = "planetaris-vulcanus-pathological-research",
    icon = "__planetaris-tellus__/graphics/technology/vulcanus-pathologics.png",
    icon_size = 256,
    essential = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planetaris-volcanic-soil"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-carbolyte-melting"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-carbolyte-separation"
      },
    },
    prerequisites = {"planetaris-advanced-pathological-research"},
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
        {"metallurgic-science-pack",     1},
        {"planetaris-bioengineering-science-pack",  1}
      },
      time = 30
    },
  },
  {
    type = "technology",
    name = "planetaris-fulgora-pathological-research",
    icon = "__planetaris-tellus__/graphics/technology/fulgora-pathologics.png",
    icon_size = 256,
    essential = false,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planetaris-dust-soil"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-holmiumnite-pod"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-holmiumnite-electrolysis"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-holmium-bacteria"
      },
    },
    prerequisites = {"planetaris-advanced-pathological-research"},
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
        {"electromagnetic-science-pack", 1},
        {"planetaris-bioengineering-science-pack",  1}
      },
      time = 30
    },
  },
  {
    type = "technology",
    name = "planetaris-pathological-science-pack",
    icon = "__planetaris-tellus__/graphics/technology/pathological-science-pack.png",
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planetaris-pathological-science-pack"
      },
    },
    prerequisites = {"planetaris-advanced-pathological-research", "planetaris-gleba-pathological-research", "planetaris-vulcanus-pathological-research", "planetaris-fulgora-pathological-research", "planetaris-parasite-nest"},
    unit =
    {
      count = 3000,
      ingredients =
      {
        {"automation-science-pack",      1},
        {"logistic-science-pack",        1},
        {"chemical-science-pack",        1},
        {"production-science-pack",      1},
        {"utility-science-pack",         1},
        {"space-science-pack",           1},
        {"agricultural-science-pack",    1},
        {"planetaris-bioengineering-science-pack",  1}
      },
      time = 30
    },
  },
  {
    type = "technology",
    name = "planetaris-robowasps",
    icon = "__planetaris-tellus__/graphics/technology/robowasp.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planetaris-logistic-robowasp"
      },
      {
        type = "unlock-recipe",
        recipe = "planetaris-robowasp-port"
      },
    },
    prerequisites = {"planetaris-pathological-science-pack"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack",                 1},
        {"logistic-science-pack",                   1},
        {"chemical-science-pack",                   1},
        {"production-science-pack",                 1},
        {"utility-science-pack",                    1},
        {"space-science-pack",                      1},
        {"agricultural-science-pack",               1},
        {"planetaris-bioengineering-science-pack",  1},
        {"planetaris-pathological-science-pack",    1},
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "planetaris-three-long-handed-inserter",
    icon = "__planetaris-tellus__/graphics/technology/three-long-handed-inserter.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planetaris-three-long-handed-inserter"
      },
    },
    prerequisites = {"planetaris-pathological-science-pack"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack",                 1},
        {"logistic-science-pack",                   1},
        {"chemical-science-pack",                   1},
        {"production-science-pack",                 1},
        {"utility-science-pack",                    1},
        {"space-science-pack",                      1},
        {"agricultural-science-pack",               1},
        {"planetaris-bioengineering-science-pack",  1},
        {"planetaris-pathological-science-pack",    1},
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "planetaris-long-stack-inserter",
    icon = "__planetaris-tellus__/graphics/technology/long-stack-inserter.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planetaris-long-stack-inserter"
      },
    },
    prerequisites = {"planetaris-pathological-science-pack", "planetaris-three-long-handed-inserter"},
    unit =
    {
      count = 1500,
      ingredients =
      {
        {"automation-science-pack",                 1},
        {"logistic-science-pack",                   1},
        {"chemical-science-pack",                   1},
        {"production-science-pack",                 1},
        {"utility-science-pack",                    1},
        {"space-science-pack",                      1},
        {"agricultural-science-pack",               1},
        {"planetaris-bioengineering-science-pack",  1},
        {"planetaris-pathological-science-pack",    1},
      },
      time = 30
    },
    upgrade = true
  },
})



data.extend({

    {
    type = "technology",
    name = "planetaris-space-preservation-1",
    localised_description = {"technology-description.planetaris-space-preservation-1", "technology-effect.planetaris-space-preservation-exclusion"},
    icons = PlanetarisLib.technology_icon_constant_preservation("__planetaris-tellus__/graphics/technology/space-preservation.png"),
    effects =
    {
      {
        type = "nothing",
        icon = "__planetaris-tellus__/graphics/icons/space-preservation.png",
        effect_description = {"technology-effect.planetaris-space-preservation-1"},
      },
    },
    prerequisites = {"planetaris-bioengineering-science-pack"},
    unit =
    {
      count = 2000,
      ingredients =
      {
        {"automation-science-pack",      1},
        {"logistic-science-pack",        1},
        {"chemical-science-pack",        1},
        {"production-science-pack",      1},
        {"utility-science-pack",         1},
        {"space-science-pack",           1},
        {"agricultural-science-pack",    1},
        {"planetaris-bioengineering-science-pack",  1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "planetaris-space-preservation-2",
    localised_description = {"technology-description.planetaris-space-preservation-2"},
    icons = PlanetarisLib.technology_icon_constant_preservation("__planetaris-tellus__/graphics/technology/space-preservation.png"),
    effects =
    {
      {
        type = "nothing",
        icon = "__planetaris-tellus__/graphics/icons/space-preservation.png",
        effect_description = {"technology-effect.planetaris-space-preservation-2"},
      },
    },
    prerequisites = {"planetaris-space-preservation-1", "planetaris-pathological-science-pack"},
    unit =
    {
      count = 800,
      ingredients =
      {
        {"automation-science-pack",      1},
        {"logistic-science-pack",        1},
        {"chemical-science-pack",        1},
        {"production-science-pack",      1},
        {"utility-science-pack",         1},
        {"space-science-pack",           1},
        {"agricultural-science-pack",    1},
        {"planetaris-bioengineering-science-pack",  1},
        {"planetaris-pathological-science-pack",    1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "planetaris-space-preservation-3",
    localised_description = {"technology-description.planetaris-space-preservation-3"},
    icons = PlanetarisLib.technology_icon_constant_preservation("__planetaris-tellus__/graphics/technology/space-preservation.png"),
    effects =
    {
      {
        type = "nothing",
        icon = "__planetaris-tellus__/graphics/icons/space-preservation.png",
        effect_description = { "technology-effect.planetaris-space-preservation-3", "technology-effect.planetaris-space-preservation-exclusion" },
      },
    },
    prerequisites = {"planetaris-space-preservation-2"},
    unit =
    {
      count = 5000,
      ingredients =
      {
        {"automation-science-pack",                 1},
        {"logistic-science-pack",                   1},
        {"chemical-science-pack",                   1},
        {"production-science-pack",                 1},
        {"utility-science-pack",                    1},
        {"space-science-pack",                      1},
        {"agricultural-science-pack",               1},
        {"planetaris-bioengineering-science-pack",  1},
        {"planetaris-pathological-science-pack",    1},
        {"promethium-science-pack",                 1}
      },
      time = 60
    },
    upgrade = true
  },

----------------------- Prod Techs

  {
    type = "technology",
    name = "planetaris-bioflux-productivity",
    icons = util.technology_icon_constant_recipe_productivity("__space-age__/graphics/technology/bioflux.png"),
    icon_size = 256,
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "bioflux",
        change = 0.1
      },
      {
        type = "change-recipe-productivity",
        recipe = "planetaris-compost-bioflux",
        change = 0.1
      },
    },
    prerequisites = {"planetaris-pathological-science-pack"},
    unit =
    {
      count_formula = "1.5^L*1000",
      ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
          {"space-science-pack", 1},
          {"agricultural-science-pack",               1},
          {"planetaris-bioengineering-science-pack",  1},
          {"planetaris-pathological-science-pack",    1},
        },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "planetaris-enemy-egg-productivity",
    icons = util.technology_icon_constant_recipe_productivity("__space-age__/graphics/technology/biter-egg-handling.png"),
    icon_size = 256,
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "biter-egg",
        change = 0.1
      },
      {
        type = "change-recipe-productivity",
        recipe = "pentapod-egg",
        change = 0.1
      },
      {
        type = "change-recipe-productivity",
        recipe = "planetaris-wasp-egg",
        change = 0.1
      },
    },
    prerequisites = {"planetaris-pathological-science-pack"},
    unit =
    {
      count_formula = "1.5^L*1000",
      ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
          {"space-science-pack", 1},
          {"agricultural-science-pack",               1},
          {"planetaris-bioengineering-science-pack",  1},
          {"planetaris-pathological-science-pack",    1},
        },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
})