local base_item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local item_effects = require("__space-age__.prototypes.item-effects")

local function build_preservation_icons(preserved_item, spoilable_item)
  if spoilable_item.icon then
    preserved_item.icons = {
      {icon="__planetaris-tellus__/graphics/icons/preservation-item.png", draw_background=false, scale=0.5},
      {icon=spoilable_item.icon, scale=0.3},
      {icon="__planetaris-tellus__/graphics/icons/preservation-item-top.png", scale=0.5}
    }
    preserved_item.icon = nil
  end
  if spoilable_item.icons then
    local new_icons = {
      {icon="__planetaris-tellus__/graphics/icons/preservation-item.png", draw_background=false, scale=0.5}
    }
    for _, icons_table in pairs(spoilable_item.icons) do
      local copy = {}
      for k, v in pairs(icons_table) do
        copy[k] = v
      end
      copy.scale = 0.3
      table.insert(new_icons, copy)
    end
    table.insert(new_icons, {icon="__planetaris-tellus__/graphics/icons/preservation-item-top.png", scale=0.5})
    preserved_item.icons = new_icons
  end
end

add_preservation_blacklist = {
  "planetaris-unstable-shard",
  "planetaris-unstable-gem",
  "planetaris-unstable-crystallizer",
  "planetaris-unstable-crystal",
  "planetaris-unstable-bacteria",
  "planetaris-quarantined-nauvian-parasite",
  "planetaris-quarantined-glebian-parasite",
}

add_spoilable_subgroups = {
    "tellus-basic-processes",
    "tellus-pathological-processes",
    "tellus-other-planet-agriculture",
    "tellus-advanced-processes",
    "agriculture-processes",
    "agriculture-products",
    "science-pack",
}

PlanetarisLib.table_merge(preservation_blacklist, add_preservation_blacklist)
PlanetarisLib.table_merge(spoilable_subgroups, add_spoilable_subgroups)

local p_blacklist = {}
for _, item_name in pairs(preservation_blacklist) do
  p_blacklist[item_name] = true
end

local whitelist_subgroup = {}
for _, subgroup_name in pairs(spoilable_subgroups) do
  whitelist_subgroup[subgroup_name] = true
end

for _, spoilable_item in pairs(data.raw.item) do
  if whitelist_subgroup[spoilable_item.subgroup] and spoilable_item.spoil_ticks ~= nil then
    table.insert(preservation_whitelist, spoilable_item)
  end
end

for _, spoilable_capsule in pairs(data.raw.capsule) do
  if whitelist_subgroup[spoilable_capsule.subgroup] and spoilable_capsule.spoil_ticks ~= nil then
    table.insert(preservation_whitelist, spoilable_capsule)
  end
end

--for _, spoilable_tool in pairs(data.raw.tool) do
--  if whitelist_subgroup[spoilable_tool.subgroup] and spoilable_tool.spoil_ticks ~= nil then
--    table.insert(preservation_whitelist, spoilable_tool)
--  end
--end

for _, spoilable_item in pairs(preservation_whitelist) do
    if not p_blacklist[spoilable_item.name] then

      -- Create preserved copy of the item
      local preserved_item = PlanetarisLib.deep_copy(spoilable_item)

      preserved_item.name = spoilable_item.name.."-preserved"
      preserved_item.localised_name = {"", spoilable_item.localised_name or {"item-name."..spoilable_item.name}, " ", {"preservation-name.preserved"}}
      preserved_item.localised_description = {"preservation-description.preserved"}
      build_preservation_icons(preserved_item, spoilable_item)
      if preserved_item.plant_result then preserved_item.plant_result = nil end
      if preserved_item.place_result then preserved_item.place_result = nil end
      if preserved_item.place_as_tile then preserved_item.place_as_tile = nil end
      preserved_item.pictures = nil
      preserved_item.spoil_ticks = math.min(4294967295, preserved_item.spoil_ticks * 1.5)
      preserved_item.fuel_category = nil
      preserved_item.fuel_value = nil
      preserved_item.fuel_acceleration_multiplier = nil
      preserved_item.fuel_top_speed_multiplier = nil
      preserved_item.fuel_emissions_multiplier = nil
      preserved_item.fuel_glow_color = nil
      preserved_item.hidden_in_factoriopedia = settings.startup["hide-preserved-items"].value
      if preserved_item.weight then preserved_item.weight = 100 * kg end
      preserved_item.subgroup = "tellus-preserved"

      data.extend({preserved_item})

      data.extend({
        {
          type = "recipe",

          name = preserved_item.name,
          localised_name = {"", spoilable_item.localised_name or {"item-name."..spoilable_item.name}, " ", {"preservation-name.preservation"}},
          subgroup = "tellus-preserved-recipe",
          order = "a",
          categories = {"preserving"},
          surface_conditions =
          {
            {
              property = "gravity",
              max = 0
            }
          },
          enabled = true,
          hidden_in_factoriopedia = settings.startup["hide-preserved-recipes"].value,
          auto_recycle = false,
          allow_productivity = false,
          hide_from_player_crafting = true,
          energy_required = 0.2,
          ingredients =
          {
            {type = "item", name = spoilable_item.name, amount = 1},
          },
          results =
          {
            {type = "item", name = preserved_item.name, amount = 1, reset_freshness_on_craft = false}
          },
          show_amount_in_title = false
        },
        {
          type = "recipe",
          name = spoilable_item.name.. "-depreservation",
          localised_name = {"", spoilable_item.localised_name or {"item-name."..spoilable_item.name}, " ", {"preservation-name.depreservation"}},
          icons = spoilable_item.icons or {{icon=spoilable_item.icon}},
          subgroup = "tellus-depreserved-recipe",
          order = "a",
          categories = {"preserving"},
          surface_conditions =
          {
            {
              property = "gravity",
              max = 0
            }
          },
          enabled = true,
          hidden_in_factoriopedia = settings.startup["hide-preserved-recipes"].value,
          auto_recycle = false,
          allow_productivity = false,
          hide_from_player_crafting = true,
          energy_required = 0.2,
          ingredients =
          {
            {type = "item", name = preserved_item.name, amount = 1},
          },
          results =
          {
            {type = "item", name = spoilable_item.name, amount = 1, reset_freshness_on_craft = false}
          },
          show_amount_in_title = false
        },
      })
      -- Add icon
        table.insert(data.raw.recipe[spoilable_item.name.. "-depreservation"].icons, {
            icon = "__planetaris-tellus__/graphics/icons/constant-preservation.png",
            icon_size = 128,
            scale = 0.18,
            shift = {10, 10},
            floating = true
            })
    end
end