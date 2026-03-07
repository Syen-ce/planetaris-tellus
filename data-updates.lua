--------------------- Compat

require("PlanetarisLib")


table.insert(data.raw.item.landfill.place_as_tile.tile_condition, "wetland-tellus-light-dead-skin")
table.insert(data.raw.item.landfill.place_as_tile.tile_condition, "wetland-tellus-dead-skin")
table.insert(data.raw.item.landfill.place_as_tile.tile_condition, "wetland-light-cyan-slime")
table.insert(data.raw.item.landfill.place_as_tile.tile_condition, "wetland-cyan-slime")
table.insert(data.raw.item.landfill.place_as_tile.tile_condition, "wetland-tellus-brown-slime")
table.insert(data.raw.item.landfill.place_as_tile.tile_condition, "wetland-tellus-light-green-tentacle")
table.insert(data.raw.item.landfill.place_as_tile.tile_condition, "wetland-tellus-green-tentacle")
table.insert(data.raw.item.landfill.place_as_tile.tile_condition, "wetland-blue-slime")
table.insert(data.raw.item.landfill.place_as_tile.tile_condition, "wetland-chlorophyll")
table.insert(data.raw.item.landfill.place_as_tile.tile_condition, "wetland-mycelia");
table.insert(data.raw.item.landfill.place_as_tile.tile_condition, "tellus-deep-lake");

-- Adding science packs
table.insert(data.raw.lab["lab"].inputs, "planetaris-bioengineering-science-pack")
table.insert(data.raw.lab["lab"].inputs, "planetaris-pathological-science-pack")

-- New category to Biochamber
table.insert(data.raw["assembling-machine"]["biochamber"].crafting_categories, "planetaris-bioassembling-or-organic-or-hand-crafting")

-- Add carbolite to demolishers
table.insert(data.raw["simple-entity"]["small-demolisher-corpse"].minable.results, {type = "item", name = "planetaris-carbolyte-pod", amount_min = 0, amount_max = 2})
table.insert(data.raw["simple-entity"]["medium-demolisher-corpse"].minable.results, {type = "item", name = "planetaris-carbolyte-pod", amount_min = 1, amount_max = 2})
table.insert(data.raw["simple-entity"]["big-demolisher-corpse"].minable.results, {type = "item", name = "planetaris-carbolyte-pod", amount_min = 2, amount_max = 3})

if settings.startup["tellus-no-enemies"].value == true then
    table.insert(data.raw["simple-entity"]["vulcanus-chimney-faded"].minable.results, {type = "item", name = "planetaris-carbolyte-pod", amount_min = 1, amount_max = 2})
    table.insert(data.raw["simple-entity"]["vulcanus-chimney-short"].minable.results, {type = "item", name = "planetaris-carbolyte-pod", amount_min = 1, amount_max = 2})
    table.insert(data.raw["simple-entity"]["vulcanus-chimney"].minable.results, {type = "item", name = "planetaris-carbolyte-pod", amount_min = 1, amount_max = 2})
end

-- Add Pollen to machines
data.raw["assembling-machine"]["biochamber"].energy_source.emissions_per_minute = { pollution = -1, pollen = -1 }

-- Add new recipe category

table.insert(data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories, "planetaris-bioassembling-or-assembling")
table.insert(data.raw["assembling-machine"]["assembling-machine-2"].crafting_categories, "planetaris-bioassembling-or-assembling")
table.insert(data.raw["assembling-machine"]["assembling-machine-3"].crafting_categories, "planetaris-bioassembling-or-assembling")

table.insert(data.raw.character.character.crafting_categories, "planetaris-bioassembling-or-organic-or-hand-crafting")
table.insert(data.raw["god-controller"].default.crafting_categories, "planetaris-bioassembling-or-organic-or-hand-crafting")

-- Add rocket fuel productivity
PlanetarisLib.add_tech_effect("rocket-fuel-productivity", {type = "change-recipe-productivity", recipe = "planetaris-rocket-fuel-from-mash", change = 0.1})

-- Update Base techs with new packs
if settings.startup["tellus-packs-for-aquilo"].value == true then
    PlanetarisLib.add_tech_ingredient_if_missing("planet-discovery-aquilo", "planetaris-bioengineering-science-pack")
    PlanetarisLib.add_tech_prerequisite_if_missing("planet-discovery-aquilo", "planetaris-bioengineering-science-pack")

    PlanetarisLib.add_tech_ingredient_if_missing("planet-discovery-aquilo", "planetaris-pathological-science-pack")
    PlanetarisLib.add_tech_prerequisite_if_missing("planet-discovery-aquilo", "planetaris-pathological-science-pack")
end

if settings.startup["tellus-packs-for-promethium"].value == true then
    PlanetarisLib.add_tech_ingredient_if_missing("promethium-science-pack", "planetaris-bioengineering-science-pack")
    PlanetarisLib.add_tech_prerequisite_if_missing("promethium-science-pack", "planetaris-bioengineering-science-pack")
    PlanetarisLib.add_tech_ingredient_if_missing("research-productivity", "planetaris-bioengineering-science-pack")
    PlanetarisLib.add_tech_prerequisite_if_missing("research-productivity", "planetaris-bioengineering-science-pack")

    PlanetarisLib.add_tech_ingredient_if_missing("promethium-science-pack", "planetaris-pathological-science-pack")
    PlanetarisLib.add_tech_prerequisite_if_missing("promethium-science-pack", "planetaris-pathological-science-pack")
    PlanetarisLib.add_tech_ingredient_if_missing("research-productivity", "planetaris-pathological-science-pack")
    PlanetarisLib.add_tech_prerequisite_if_missing("research-productivity", "planetaris-pathological-science-pack")
end