local effects = require("__core__.lualib.surface-render-parameter-effects")
local planet_catalogue_tellus = require("__planetaris-tellus__/prototypes/planets/procession-catalogue-tellus")
local planet_map_gen = require("__planetaris-tellus__/prototypes/planets/planet_map_gen")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:extend({
{
        type = "planet",
        name = "tellus",
        orbit = {
            parent = {
                type = "space-location",
                name = "star",
            },
            distance = 17.5,
            orientation = 0.52,
        },
        subgroup = "planets",
        label_orientation = 0.55,
        icon = "__planetaris-tellus__/graphics/icons/tellus.png",
        icon_size = 64,
        starmap_icon = "__planetaris-tellus__/graphics/icons/starmap-planet-tellus.png",
        starmap_icon_size = 500,
        map_gen_settings = planet_map_gen.tellus(),
        gravity_pull = 15,
        draw_orbit = true,
        magnitude = 0.8,
        order = "f[arig]-c",
        solar_power_in_space = 250,
        pollutant_type = "pollen",
        procession_graphic_catalogue = planet_catalogue_tellus,
        platform_procession_set = {
            arrival = {"planet-to-platform-b"},
            departure = {"platform-to-planet-a"}
        },
        planet_procession_set = {
            arrival = {"platform-to-planet-b"},
            departure = {"planet-to-platform-a"}
        },
        surface_properties = {
          ["day-night-cycle"] = 10 * minute,
          ["magnetic-field"] = 35,
          ["solar-power"] = 100,
          pressure = 2000,
          gravity = 20
        },
        surface_render_parameters=
        {
          fog =
          {
            fog_type = "gleba",
            shape_noise_texture =
            {
              filename = "__core__/graphics/clouds-noise.png",
              size = 2048
            },
            detail_noise_texture =
            {
              filename = "__core__/graphics/clouds-detail-noise.png",
              size = 2048
            },
            color1 = {139, 255, 224, 1.0},
            color2 = {169, 216, 255, 1.0},
            tick_factor = 0.000001,
          },
          clouds = effects.default_clouds_effect_properties(),

          -- Should be based on the default day/night times, ie
          -- sun starts to set at 0.25
          -- sun fully set at 0.45
          -- sun starts to rise at 0.55
          -- sun fully risen at 0.75
          day_night_cycle_color_lookup =
          {
            {0.00, "__space-age__/graphics/lut/gleba-1-noon.png"},
            {0.15, "__space-age__/graphics/lut/gleba-2-afternoon.png"},
            {0.25, "__space-age__/graphics/lut/gleba-3-late-afternoon.png"},
            {0.35, "__space-age__/graphics/lut/gleba-4-sunset.png"},
            {0.45, "__space-age__/graphics/lut/gleba-5-after-sunset.png"},
            {0.55, "__space-age__/graphics/lut/gleba-6-before-dawn.png"},
            {0.65, "__space-age__/graphics/lut/gleba-7-dawn.png"},
            {0.75, "__space-age__/graphics/lut/gleba-8-morning.png"},
          },

          terrain_tint_effect =
          {
            noise_texture =
            {
              filename = "__space-age__/graphics/terrain/vulcanus/tint-noise.png",
              size = 4096
            },

            offset = { 0.2, 0, 0.4, 0.8 },
            intensity = { 0.2, 0.4, 0.3, 0.15 },
            scale_u = { 1.85, 1.85, 1.85, 1.85 },
            scale_v = { 1, 1, 1, 1 },

            global_intensity = 0.5,
            global_scale = 0.4,
            zoom_factor = 3.8,
            zoom_intensity = 0.75
          }
        },
        persistent_ambient_sounds =
        {
          base_ambience =
          {
            {sound = {filename = "__space-age__/sound/wind/base-wind-gleba-night.ogg", volume = 0.8, advanced_volume_control = {darkness_threshold = 0.85}}},
            {sound = {filename = "__space-age__/sound/wind/base-wind-gleba-day.ogg", volume = 0.8, advanced_volume_control = {darkness_threshold = -0.7}}}
          },
          wind = {filename = "__space-age__/sound/wind/wind-gleba.ogg", volume = 0.8},
          crossfade =
          {
            order = {"wind", "base_ambience"},
            curve_type = "cosine",
            from = {control = 0.35, volume_percentage = 0.2},
            to = {control = 2, volume_percentage = 100.0}
          },
          semi_persistent =
          {
            {
              sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/wind-gust", 6, 0.4)},
              delay_mean_seconds = 10,
              delay_variance_seconds = 5
            },
            {
              sound =
                {
                  filename = "__space-age__/sound/world/weather/rain.ogg", volume = 0.25,
                  advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.2, volume_percentage = 0.6}, to = {1.2, 100.0 }}}}
                }
            },
            {
              sound =
                {
                  variations = sound_variations("__space-age__/sound/world/semi-persistent/night-birds", 14, 0.4),
                  advanced_volume_control =
                  {
                    fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}},
                    darkness_threshold = 0.85
                  }
                },
                delay_mean_seconds = 10,
                delay_variance_seconds = 5
            },
            {
              sound =
                {
                  variations = sound_variations("__planetaris-tellus__/sound/world/semi-persistent/not-creepy-birds", 5, 0.8),
                  advanced_volume_control =
                  {
                    fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 50.0}, to = {1.5, 100.0}}},
                  }
                },
                delay_mean_seconds = 10,
                delay_variance_seconds = 5
            },
            {
              sound =
                {
                  variations = sound_variations("__planetaris-tellus__/sound/world/semi-persistent/tellus-swamp", 11, 0.8),
                  advanced_volume_control =
                  {
                    fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 50.0}, to = {1.5, 100.0}}},
                    darkness_threshold = -0.3 -- Day only
                  }
                },
                delay_mean_seconds = 10,
                delay_variance_seconds = 5
            }
          }
        },
        asteroid_spawn_influence = 1,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_gleba, 0.9),
        player_effects =
    { -- TODO: replace with shader & find a way to have rain appear and disappear with weather system.
      type = "cluster",
      cluster_count = 10,
      distance = 8,
      distance_deviation = 8,
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          type = "create-trivial-smoke",
          smoke_name = "gleba-raindrops",
          speed = {-0.05, 0.5},
          initial_height = 1,
          speed_multiplier = 2,
          speed_multiplier_deviation = 0.05,
          starting_frame = 2,
          starting_frame_deviation = 2,
          offset_deviation = {{-96, -56}, {96, 40}},
          speed_from_center = 0.01,
          speed_from_center_deviation = 0.02
        }
      }
    },
    ticks_between_player_effects = 1
    },
})

if data.raw["planet"]["arig"] then
  data:extend({
      {
          type = "space-connection",
          name = "arig-tellus",
          subgroup = "planet-connections",
          from = "arig",
          to = "tellus", 
          length = 15000,
          icon_size = 64,
          order = "d-c",
          asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo),
      },
  })
end

if data.raw["planet"]["hyarion"] then
  data:extend({
          {
          type = "space-connection",
          name = "hyarion-tellus",
          subgroup = "planet-connections",
          from = "hyarion",
          to = "tellus", 
          length = 15000,
          icon_size = 64,
          order = "d-c",
          asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo),
      },
  })
end

if data.raw["planet"]["maraxsis"] then
  data:extend({
      {
          type = "space-connection",
          name = "maraxsis-tellus",
          subgroup = "planet-connections",
          from = "maraxsis",
          to = "tellus", 
          length = 15000,
          icon_size = 64,
          order = "d-b",
          asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
      }
  })
end

PlanetsLib.borrow_music(data.raw["planet"]["gleba"], data.raw["planet"]["tellus"])