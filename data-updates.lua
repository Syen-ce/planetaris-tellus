
--------------------- Compat

PlanetarisLib = require("PlanetarisLib")

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
PlanetarisLib.add_science_pack("lab", "planetaris-bioengineering-science-pack")
PlanetarisLib.add_science_pack("lab", "planetaris-pathological-science-pack")

PlanetarisLib.add_science_pack("biolab", "planetaris-bioengineering-science-pack")
PlanetarisLib.add_science_pack("biolab", "planetaris-pathological-science-pack")

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

if settings.startup["tellus-easy-not-damage-while-stop"].value == true then
    if data.raw["assembling-machine"]["planetaris-bioassembler"] then
        data.raw["assembling-machine"]["planetaris-bioassembler"].production_health_effect = {producing = -2 / 60}
    end

    if data.raw["assembling-machine"]["planetaris-incubator"] then
        data.raw["assembling-machine"]["planetaris-incubator"].production_health_effect = {producing = -2 / 60}
    end
end

if settings.startup["tellus-easy-longer-spoiling"].value == true then

    local tellus_subgroups = {
        ["tellus-basic-processes"] = true,
        ["tellus-pathological-processes"] = true,
        ["tellus-other-planet-agriculture"] = true,
        ["tellus-advanced-processes"] = true
    }

    for _, spoilable in pairs(data.raw.item) do
        if tellus_subgroups[spoilable.subgroup] and spoilable.spoil_ticks ~= nil then
            spoilable.spoil_ticks = spoilable.spoil_ticks * 1.5
        end
    end

end

if settings.startup["tellus-hard-disable-refresh"].value == true then
    data.raw.recipe["planetaris-nauvian-parasite-reproduction"].reset_freshness_on_craft = false
    data.raw.recipe["planetaris-nauvian-parasite-reproduction"].reset_freshness_on_craft = false
end

if settings.startup["tellus-easy-spoiling-enemies"].value == true then

    local one_medium_premature_wasp = {
                type = "direct",
                action_delivery =
                {
                type = "instant",
                source_effects =
                {
                    {
                    type = "create-entity",
                    entity_name = "medium-wasp-premature",
                    repeat_count = 1,
                    affects_target = true,
                    show_in_tooltip = true,
                    as_enemy = true,
                    find_non_colliding_position = true,
                    abort_if_over_space = true,
                    offset_deviation = {{-5, -5}, {5, 5}},
                    non_colliding_fail_result =
                    {
                        type = "direct",
                        action_delivery =
                        {
                        type = "instant",
                        source_effects =
                        {
                            {
                            type = "create-entity",
                            entity_name = "medium-wasp-premature",
                            affects_target = true,
                            show_in_tooltip = false,
                            as_enemy = true,
                            offset_deviation = {{-1, -1}, {1, 1}},
                            }
                        }
                      }
                    }
                  }
                }
              }
            }

    local two_medium_premature_wasp = {
                type = "direct",
                action_delivery =
                {
                type = "instant",
                source_effects =
                {
                    {
                    type = "create-entity",
                    entity_name = "medium-wasp-premature",
                    repeat_count = 2,
                    affects_target = true,
                    show_in_tooltip = true,
                    as_enemy = true,
                    find_non_colliding_position = true,
                    abort_if_over_space = true,
                    offset_deviation = {{-5, -5}, {5, 5}},
                    non_colliding_fail_result =
                    {
                        type = "direct",
                        action_delivery =
                        {
                        type = "instant",
                        source_effects =
                        {
                            {
                            type = "create-entity",
                            entity_name = "medium-wasp-premature",
                            affects_target = true,
                            show_in_tooltip = false,
                            as_enemy = true,
                            offset_deviation = {{-1, -1}, {1, 1}},
                            }
                        }
                      }
                    }
                  }
                }
              }
            }

    local one_medium_biter = {
                type = "direct",
                action_delivery =
                {
                type = "instant",
                source_effects =
                {
                    type = "create-entity",
                    entity_name = "medium-biter",
                    repeat_count = 1,
                    affects_target = true,
                    show_in_tooltip = true,
                    as_enemy = true,
                    find_non_colliding_position = true,
                    abort_if_over_space = true,
                    offset_deviation = {{-5, -5}, {5, 5}},
                    non_colliding_fail_result =
                    {
                        type = "direct",
                        action_delivery =
                        {
                        type = "instant",
                        source_effects =
                        {
                            {
                            type = "create-entity",
                            entity_name = "medium-biter",
                            affects_target = true,
                            show_in_tooltip = false,
                            as_enemy = true,
                            offset_deviation = {{-1, -1}, {1, 1}},
                            }
                          }
                        }
                      }
                    }
                  }
                }

    local one_big_wriggler_pentapod_premature = {
                type = "direct",
                action_delivery =
                {
                type = "instant",
                source_effects =
                {
                    {
                    type = "create-entity",
                    entity_name = "big-wriggler-pentapod-premature",
                    repeat_count = 1,
                    affects_target = true,
                    show_in_tooltip = true,
                    as_enemy = true,
                    find_non_colliding_position = true,
                    abort_if_over_space = true,
                    offset_deviation = {{-5, -5}, {5, 5}},
                    non_colliding_fail_result =
                    {
                        type = "direct",
                        action_delivery =
                        {
                        type = "instant",
                        source_effects =
                        {
                            {
                            type = "create-entity",
                            entity_name = "big-wriggler-pentapod-premature",
                            affects_target = true,
                            show_in_tooltip = false,
                            as_enemy = true,
                            offset_deviation = {{-1, -1}, {1, 1}},
                            }
                          }
                        }
                      }
                    }
                }
            }
        }

    if data.raw["tool"]["planetaris-pathological-science-pack"] then
        data.raw["tool"]["planetaris-pathological-science-pack"].spoil_to_trigger_result =
            {
            items_per_trigger = 1,
            trigger = two_medium_premature_wasp
            }
    end

    if data.raw["item"]["planetaris-parasite-nest"] then
        data.raw["item"]["planetaris-parasite-nest"].spoil_to_trigger_result =
            {
            items_per_trigger = 1,
            trigger = {one_medium_premature_wasp, one_medium_biter, one_big_wriggler_pentapod_premature}
            }
    end

    if data.raw["item"]["planetaris-wasp-egg"] then
        data.raw["item"]["planetaris-wasp-egg"].spoil_to_trigger_result =
            {
            items_per_trigger = 1,
            trigger = one_medium_premature_wasp
          }
    end

    if data.raw["item"]["planetaris-tellurian-parasite"] then
        data.raw["item"]["planetaris-tellurian-parasite"].spoil_to_trigger_result =
            {
            items_per_trigger = 1,
            trigger = one_medium_premature_wasp
          }
    end

    if data.raw["item"]["planetaris-nauvian-parasite"] then
        data.raw["item"]["planetaris-nauvian-parasite"].spoil_to_trigger_result =
            {
            items_per_trigger = 1,
            trigger = one_medium_biter
          }
    end

if data.raw["item"]["planetaris-glebian-parasite"] then
        data.raw["item"]["planetaris-glebian-parasite"].spoil_to_trigger_result =
            {
            items_per_trigger = 1,
            trigger = one_big_wriggler_pentapod_premature
          }
    end 
end