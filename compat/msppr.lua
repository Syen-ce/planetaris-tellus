local item_tints = require("__base__.prototypes.item-tints")
local item_sounds = require("__base__.prototypes.item_sounds")

if not mods["multi_surface_promethium_plate_recipe"] then return end

data:extend({
    {
        type = "item",
        name = "msppr-tellus",
        icon = "__planetaris-tellus__/graphics/compat/msppr-infected-promethium.png",
        subgroup = "msppr",
        order = "d[promethium]-r[fulgora]-tellus",
        inventory_move_sound = item_sounds.sulfur_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.sulfur_inventory_move,
        stack_size = 100,
        weight = 1 * kg,
        random_tint_color = item_tints.ice_blue,
    },

    {
        type = "recipe",
        name = "msppr-tellus",
        subgroup = "science-pack",
        category = "planetaris-pathologics",
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
            { type = "item",  name = "copper-bacteria",           amount = 1 },
            { type = "item",  name = "planetaris-parasite-nest",  amount = 1 },
            { type = "item",  name = "planetaris-magnesium-dust", amount = 2 },
            { type = "fluid", name = "planetaris-chlorophyll",    amount = 20 },
        },
        energy_required = 10,
        msppr = {
            result = { type = "item", name = "msppr-tellus", amount = 1 },
            recipe_chain_order = "fulgora-arig-hyarion-tellus",
        },
        results = { { type = "item", name = "msppr-tellus", amount = 1 } },
        allow_productivity = false,
        auto_recycle = false,
    },
})