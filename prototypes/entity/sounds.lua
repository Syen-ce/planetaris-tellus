require("sound-util")
local planetaris_sounds = {}

--enemies

planetaris_sounds.wasp_fly_small = function(min_volume, max_volume)
  return
  {
    aggregation =
    {
      max_count = 3,
      remove = true,
      count_already_playing = true
    },
    variations = sound_variations_with_volume_variations("__planetaris-tellus__/sound/creatures/wasp-flying-small", 1, min_volume, max_volume or min_volume, volume_multiplier("main-menu", 1.8)),
    priority = 192
  }
end

planetaris_sounds.wasp_fly_medium = function(min_volume, max_volume)
  return
  {
    aggregation =
    {
      max_count = 3,
      remove = true,
      count_already_playing = true
    },
    variations = sound_variations_with_volume_variations("__planetaris-tellus__/sound/creatures/wasp-flying-medium", 1, min_volume, max_volume or min_volume, volume_multiplier("main-menu", 1.8)),
    priority = 192
  }
end

planetaris_sounds.wasp_fly_big = function(min_volume, max_volume)
  return
  {
    aggregation =
    {
      max_count = 3,
      remove = true,
      count_already_playing = true
    },
    variations = sound_variations_with_volume_variations("__planetaris-tellus__/sound/creatures/wasp-flying-big", 1, min_volume, max_volume or min_volume, volume_multiplier("main-menu", 0.6)),
    priority = 192
  }
end

planetaris_sounds.wasp_fly_behemoth = function(min_volume, max_volume)
  return
  {
    aggregation =
    {
      max_count = 3,
      remove = true,
      count_already_playing = true
    },
    variations = sound_variations_with_volume_variations("__planetaris-tellus__/sound/creatures/wasp-flying-behemoth", 1, min_volume, max_volume or min_volume, volume_multiplier("main-menu", 1.8)),
    priority = 192
  }
end

return planetaris_sounds