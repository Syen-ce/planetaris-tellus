---------------------------------------------------------------------------
------------------------- Preservation tech
---------------------------------------------------------------------------


-- Blacklist of items that should NOT be preserved
if not space_preservation_blacklist then
  space_preservation_blacklist = {
    "planetaris-unstable-shard",
    "planetaris-unstable-gem",
  }
end

-- Utility function to check if item exists
local function table_contains(tbl, value)
    for _, v in ipairs(tbl) do
        if v == value then return true end
    end
    return false
end

-- Log what's in the blacklist (this runs when the file is required)
log("LIB LOADED - Blacklist contents:")
for _, item in ipairs(space_preservation_blacklist) do
  log("  - " .. item)
end


-- Function for other mods to add items (doesnt work lol)
function add_to_space_preservation_blacklist(item_name)
    if not table_contains(space_preservation_blacklist, item_name) then
        table.insert(space_preservation_blacklist, item_name)
    end
end

-- Preservation tier configuration
if not space_preservation_multipliers then
  space_preservation_multipliers = {
    0.90,  -- Tier 1: 90% of normal spoilage = 10% slower
    0.75,  -- Tier 2: 75% of normal spoilage = 25% slower
    0.50   -- Tier 3: 50% of normal spoilage = 50% slower
  }
end

-- calculate percentage
local function calculate_config()
  local config = {}
  local previous_percent = 0

  for tier, multiplier in ipairs(space_preservation_multipliers) do
    local new_percent = math.floor((1 - multiplier) * 100)
    config[tier] = {
      old = previous_percent,
      new = new_percent,
      multiplier = multiplier
    }
    previous_percent = new_percent
  end

  return config
end

---------------------------------------------------------------------------

return {
  blacklist = space_preservation_blacklist,
  multipliers = space_preservation_multipliers,
  config = calculate_config(),
  add_to_blacklist = add_to_space_preservation_blacklist  -- Return the function
}