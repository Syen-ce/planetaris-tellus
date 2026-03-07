if not mods["Krastorio2-spaced-out"] then return end

require("PlanetarisLib")

local data_util = require("__Krastorio2-spaced-out__/data-util")

local function add_light(item)
	local card = data.raw.tool[item]
	card.pictures = {
		layers = {
			{
				filename = card.icon,
				size = 64,
				scale = 0.5,
			},
			{
				filename = "__k2so-assets__/icons/cards/tech-card-light.png",
				size = 64,
				scale = 0.5,
				draw_as_light = true,
			},
		},
	}
end

------------- bioengineering tech data

data.extend({
	{
		type = "item",
		name = "kr-bioengineering-research-data",
		icon = "__planetaris-tellus__/graphics/compat/k2so/icons/bioengineering-research-data.png",
		subgroup = "science-pack",
		order = "a05[agricultural-research-data]-p-a",
		stack_size = 200,
		weight = 1 * kg,
		spoil_result = "spoilage",
		spoil_ticks = 54000,
		default_import_location = "tellus",
	},
	{
		type = "recipe",
		name = "kr-bioengineering-research-data",
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
        energy_required = 4,
        ingredients = {
            {type = "fluid", name = "planetaris-seed-compound", amount = 15},
            {type = "item",  name = "planetaris-magnesium-sheet", amount = 2},
            {type = "item",  name = "planetaris-mycelia-composite", amount = 5}
        },
        results =
        {
            {type = "item",  name = "kr-bioengineering-research-data", amount = 1},
        },
        allow_productivity = true,
        crafting_machine_tint =
        {
            primary = {r = 0.79, g = 0.98, b = 0.008, a = 1.000},
            secondary = {r = 0.635, g = 0.8, b = 0.294, a = 1.000},
        }
    },
})

--
data_util.set_icon(data.raw.tool["planetaris-bioengineering-science-pack"], "__planetaris-tellus__/graphics/compat/k2so/icons/bioengineering-tech-card.png")
data.raw.tool["planetaris-bioengineering-science-pack"].localised_name = { "item-name.kr-bioengineering-tech-card" }
add_light("planetaris-bioengineering-science-pack")

data_util.make_tech_card("planetaris-bioengineering-science-pack", {
	{ type = "item", name = "kr-bioengineering-research-data", amount = 5 },
})
data_util.add_recipe_unlock("planetaris-bioengineering-science-pack", "kr-bioengineering-research-data")
data.raw.technology["planetaris-bioengineering-science-pack"].localised_name = { "item-name.kr-bioengineering-research-data" }
data_util.set_icon(data.raw.technology["planetaris-bioengineering-science-pack"],"__planetaris-tellus__/graphics/compat/k2so/technology/bioengineering-tech-card.png",256)

------------- pathological tech data

data.extend({
	{
		type = "item",
		name = "kr-pathological-research-data",
		icon = "__planetaris-tellus__/graphics/compat/k2so/icons/pathological-research-data.png",
		subgroup = "science-pack",
		order = "a05[agricultural-research-data]-p-b",
		stack_size = 200,
		weight = 1 * kg,
		spoil_ticks = 54000,
		default_import_location = "tellus",
        spoil_to_trigger_result =
            {
            items_per_trigger = 1,
            trigger =
            {
                type = "direct",
                action_delivery =
                {
                type = "instant",
                source_effects =
                {
                    {
                    type = "create-entity",
                    entity_name = "big-wasp",
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
                            entity_name = "big-wasp",
                            affects_target = true,
                            show_in_tooltip = false,
                            as_enemy = true,
                            offset_deviation = {{-1, -1}, {1, 1}},
                            }
                        }
                        }
                    }
                    },
                }
                }
            }
        }
    },
    {
    type = "recipe",
    name = "kr-pathological-research-data",
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
    energy_required = 8,
    ingredients = {
      {type = "item",  name = "planetaris-parasite-nest",      amount = 1},
      {type = "item",  name = "planetaris-carbolyte-bacteria", amount = 2},
      {type = "item",  name = "planetaris-fulgoran-bacteria",  amount = 2},
    },
    results =
    {
      {type = "item",  name = "kr-pathological-research-data", amount = 1},
    },
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 0.45, g = 0.98, b = 0.008, a = 1.000},
      secondary = {r = 0.635, g = 0.8, b = 0.294, a = 1.000},
    }
  },
})

--

data_util.set_icon(data.raw.tool["planetaris-pathological-science-pack"], "__planetaris-tellus__/graphics/compat/k2so/icons/pathological-tech-card.png")
data.raw.tool["planetaris-pathological-science-pack"].localised_name = { "item-name.kr-pathological-tech-card" }
add_light("planetaris-pathological-science-pack")

data_util.make_tech_card("planetaris-pathological-science-pack", {
	{ type = "item", name = "kr-pathological-research-data", amount = 5 },
})
data_util.add_recipe_unlock("planetaris-pathological-science-pack", "kr-pathological-research-data")
data.raw.technology["planetaris-pathological-science-pack"].localised_name = { "item-name.kr-pathological-research-data" }
data_util.set_icon(data.raw.technology["planetaris-pathological-science-pack"],"__planetaris-tellus__/graphics/compat/k2so/technology/pathological-tech-card.png",256)

if mods["planetaris-arig"] then
    table.insert(data.raw["recipe"]["kr-pathological-research-data"].ingredients, {type = "item",  name = "planetaris-arigian-bacteria",  amount = 2})
end

if mods["planetaris-hyarion"] then
    table.insert(data.raw["recipe"]["kr-pathological-research-data"].ingredients, {type = "item",  name = "planetaris-unstable-bacteria",  amount = 2})
end

----------- Block steel pipes to force player to use roots

PlanetarisLib.add_entity_surface_condition("kr-steel-pipe", "planetaris-pollen-corrosion", 40, 0)
PlanetarisLib.add_entity_surface_condition("kr-steel-pipe-to-ground", "planetaris-pollen-corrosion", 40, 0)
PlanetarisLib.add_entity_surface_condition("kr-steel-pump", "planetaris-pollen-corrosion", 40, 0)
PlanetarisLib.add_entity_surface_condition("kr-big-storage-tank", "planetaris-pollen-corrosion", 40, 0)
PlanetarisLib.add_entity_surface_condition("kr-huge-storage-tank", "planetaris-pollen-corrosion", 40, 0)

-- K2SO items to crafting

PlanetarisLib.add_or_replace_recipe_ingredient("planetaris-bioassembler-seed", "electronic-circuit", {type = "item", name = "kr-automation-core", amount = 2})
PlanetarisLib.add_or_replace_recipe_ingredient("planetaris-incubator", "", {type = "item", name = "kr-glass", amount = 10})
PlanetarisLib.add_or_replace_recipe_ingredient("planetaris-air-purifier", "steel-plate", {type = "item", name = "kr-steel-gear-wheel", amount = 10})

-- add plants to greenhouse

data:extend({
	{
		type = "recipe",
		name = "kr-chloroplast-fruit",
		localised_name = { "item-name.planetaris-chloroplast-fruit" },
		icon = "__planetaris-tellus__/graphics/icons/chloroplast-fruit.png",
		subgroup = "raw-resource",
		order = "p-a",
		enabled = false,
		category = "kr-growing",
		energy_required = 300,
		emissions_multiplier = 6,
		surface_conditions ={{ property = "planetaris-pollen-corrosion", min = 50, max = 100 }},
		ingredients = {
			{ type = "fluid", name = "water", amount = 3000 },
			{ type = "item", name = "kr-fertilizer", amount = 6 },
			{ type = "item", name = "planetaris-chloroplast-seed", amount = 6 },
		},
		results = {
			{ type = "item", name = "planetaris-chloroplast-fruit", amount = 300 },
		},
		auto_recycle = false,
		result_is_always_fresh = true,
		main_product = "planetaris-chloroplast-fruit",
	},
    {
		type = "recipe",
		name = "kr-mushroom-cap",
		localised_name = { "item-name.planetaris-mushroom-cap" },
		icon = "__planetaris-tellus__/graphics/icons/mushroom-cap.png",
		subgroup = "raw-resource",
		order = "p-b",
		enabled = false,
		category = "kr-growing",
		energy_required = 300,
		emissions_multiplier = 6,
		surface_conditions ={{ property = "planetaris-pollen-corrosion", min = 50, max = 100 }},
		ingredients = {
			{ type = "fluid", name = "water", amount = 3000 },
			{ type = "item", name = "kr-fertilizer", amount = 6 },
			{ type = "item", name = "planetaris-myceliae-seed", amount = 6 },
		},
		results = {
			{ type = "item", name = "planetaris-mushroom-cap", amount = 300 },
		},
		auto_recycle = false,
		result_is_always_fresh = true,
		main_product = "planetaris-mushroom-cap",
	},
})

-- Add biomass recipe

data:extend({
	{
		type = "recipe",
		name = "kr-wasp-biomass",
		enabled = false,
		category = "kr-crushing",
		energy_required = 1,
		icons = {
			{ icon = "__Krastorio2Assets__/icons/items/biomass.png", scale = 1, shift = { 8, 8 } },
			{ icon = "__planetaris-tellus__/graphics/icons/wasp-egg.png", scale = 1, shift = { -8, -16 } },
		},
		ingredients = {
			{ type = "item", name = "planetaris-wasp-egg", amount = 1 },
		},
		results = {
			{ type = "item", name = "kr-biomass", amount_min = 3, amount_max = 5 },
		},
		allow_as_intermediate = false,
		allow_intermediates = false,
		allow_productivity = true,
		always_show_made_in = true,
		always_show_products = true,
		hide_from_signal_gui = false,
	},
      {
        type = "recipe",
        name = "kr-filter-rare-metal-ore-from-infected-water",
        category = "kr-fluid-filtration",
        icons = {
            { icon = "__planetaris-tellus__/graphics/icons/fluids/infected-water.png" },
            {
                icon = "__Krastorio2Assets__/icons/items/rare-metal-ore.png",
                scale = 0.20,
                shift = { 0, 4 },
            },
        },
        subgroup = "raw-material",
        order = "w013[filter-rare-metal-ore-from-dirty-water]-p",
        enabled = false,
        energy_required = 2,
        ingredients = {
            { type = "fluid", name = "planetaris-infected-water", amount = 100 },
        },
        results = {
            { type = "fluid", name = "water", amount = 20, ignored_by_productivity = 20},
            { type = "item", name = "stone", probability = 0.30, amount = 1 },
            { type = "item", name = "kr-rare-metal-ore", probability = 0.05, amount = 1 },
        },
        allow_as_intermediate = false,
        always_show_made_in = true,
        always_show_products = true,
        crafting_machine_tint = {
        primary = { r = 0.60, g = 0.20, b = 0, a = 0.6 }, -- Dirty
        secondary = { r = 1.0, g = 0.843, b = 0.0, a = 0.9 }, -- Clear
        },
    },
})