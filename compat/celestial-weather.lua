-- Code from the celestial wheather mod

local cluster_particles = {
  type = "cluster",
  distance = 8,
  distance_deviation = 8,
  action_delivery = {
    type = "instant",
    source_effects = {
      type = "create-trivial-smoke",
      initial_height = 0.6,
      speed_multiplier_deviation = 0.2,
      starting_frame = 512,
      starting_frame_deviation = 1024,
      offset_deviation = {{-96, -48}, {96, 48}},
      speed_from_center = 0,
      speed_from_center_deviation = 0
    }
  }
}

------ direct particles ------
local direct_particles = {
  type = "direct",
  action_delivery = {
    type = "instant",
    source_effects = {
      type = "create-trivial-smoke",
      initial_height = 0.4,
      speed_multiplier_deviation = 0.2,
      starting_frame = 512,
      starting_frame_deviation = 1024,
      offset_deviation = {{-96, -48}, {96, 48}},
      speed_from_center = 0,
      speed_from_center_deviation = 0
    }
  }
}

------ fog ------
local fog = {
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
  color1 = {227, 113, 132, 1.0},
  color2 = {222, 91, 64, 1.0},
  tick_factor = 0.000001,
}

if mods["celestial-weather"] and settings.startup["enable-tellus-weather"].value then

tellus_effects = {}

----- Dust
  local tellus_dust_particle = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
  tellus_dust_particle.name = "tellus_dust_particle"
  tellus_dust_particle.color = {0.941, 0.576, 0.404}
  tellus_dust_particle.animation.filename = "__celestial-weather__/graphics/entity/sand-particles.png",
  data:extend({tellus_dust_particle})

  local tellus_weather_d = table.deepcopy(cluster_particles)
  tellus_weather_d.cluster_count = 2
  tellus_weather_d.action_delivery.source_effects.smoke_name= "tellus_dust_particle"
  tellus_weather_d.action_delivery.source_effects.speed = {0.32, 0}
  tellus_weather_d.action_delivery.source_effects.speed_multiplier  = settings.startup["tellus-dust-particle-speed"].value

-- Bugs particles
  local tellus_bugs = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
  tellus_bugs.name = "tellus-bugs"
  tellus_bugs.color = {0.2, 0.184, 0.176, 1}
  tellus_bugs.animation.filename = "__celestial-weather__/graphics/entity/fire-particles.png"
  data:extend({tellus_bugs})

  local tellus_weather_bugs = table.deepcopy(cluster_particles)
  tellus_weather_bugs.cluster_count = settings.startup["tellus-bugs-particle-amount"].value
  tellus_weather_bugs.action_delivery.source_effects.smoke_name= "tellus-bugs"
  tellus_weather_bugs.action_delivery.source_effects.speed = {-0.5, -0.4}
  tellus_weather_bugs.action_delivery.source_effects.speed_multiplier = settings.startup["tellus-bugs-particle-speed"].value

  table.insert(tellus_effects, tellus_weather_bugs) 
  table.insert(tellus_effects, tellus_weather_d)

  -- Fog

  local tellus_fog = table.deepcopy(fog)
  tellus_fog.color1 = {0.929, 0.812, 0.553, 1.0}
  tellus_fog.color2 = {1, 0.929, 0.722, 1.0}
  tellus_fog.tick_factor = 0.0003
  tellus_fog.detail_noise_texture.filename = "__celestial-weather__/graphics/entity/dense-clouds.png"

-- implement
if #tellus_effects > 0 then
    data.raw["planet"]["tellus"].ticks_between_player_effects = 1
    data.raw["planet"]["tellus"].player_effects =  tellus_effects
    data.raw["planet"]["tellus"].surface_render_parameters = data.raw["planet"]["tellus"]["surface_render_parameters"] or {}
    data.raw["planet"]["tellus"].surface_render_parameters["fog"] = tellus_fog
  end

end