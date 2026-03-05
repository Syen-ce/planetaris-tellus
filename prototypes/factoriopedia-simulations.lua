require("__base__/prototypes/factoriopedia-util");
local planetaris_simulations = {}

-----------////////////////////////////////////////////////////////////// ENEMIES

local make_enemy = function(name, zoom)
  return
    [[
    game.simulation.camera_zoom = ]]..zoom..[[
    game.simulation.camera_position = {0, 0}
    game.surfaces[1].build_checkerboard{{-40, -40}, {40, 40}}

    enemy = game.surfaces[1].create_entity{name = "]]..name..[[", position = {0, 0}}

    step_0 = function()
      if enemy.valid then
          game.simulation.camera_position = {enemy.position.x, enemy.position.y - 0.5}
      end

      script.on_nth_tick(1, function()
          step_0()
      end)
    end

    step_0()
  ]]
end

planetaris_simulations.factoriopedia_tellus_enemy_small_wasp    = { init = make_enemy("small-wasp", 1.2) }
planetaris_simulations.factoriopedia_tellus_enemy_medium_wasp   = { init = make_enemy("medium-wasp", 1.1) }
planetaris_simulations.factoriopedia_tellus_enemy_big_wasp      = { init = make_enemy("big-wasp", 1.0) }
planetaris_simulations.factoriopedia_tellus_enemy_behemoth_wasp = { init = make_enemy("behemoth-wasp", 1.0) }

-----------////////////////////////////////////////////////////////////// LOGISTICS

planetaris_simulations.factoriopedia_pipe_to_ground =
{
  init =
  [[
    game.simulation.camera_position = {0.5, 0.5}
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqdkN0KgzAMRt8l11VWtWPtq4wx/AkS0FTaOibSd1/Vi12MMdhlko9zyLdCM8w4OeIAZgVqLXsw1xU89VwP247rEcHANNSMoXbkM2dtyILNemdn7iAKIO7wCUbGmwDkQIHwwOzDcud5bNClgPiNEzBZnwiWN3uilrkSsIApdK6SqyOH7XGWRRQfjuIfh/wuqbanKOCYiO+yBDzQ+T2gzoWutFYXWWp9qmJ8AaXQch0=",
      position = {0, 0}
    }
  ]]
}

planetaris_simulations.factoriopedia_logistic_robowasp =
{
  init =
  [[
    game.simulation.camera_position = {0, -1}
    game.surfaces[1].create_entity{name = "logistic-robowasp", position = {0, 0}}
  ]]
}

-----------////////////////////////////////////////////////////////////// PLANTS

local make_tellus_plant_simulation = function(tile, name)
  return
    [[
    game.simulation.camera_zoom = 1.4
    game.simulation.camera_position = {-0.5, 0}
    for x = -10, 9, 1 do
      for y = -4, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "]]..tile..[["}}
      end
    end

    game.surfaces[1].create_entity{name = "]]..name..[[", position = {x=-2.54, y=-0.76}, tick_grown = 1}
    game.surfaces[1].create_entity{name = "]]..name..[[", position = {x=2.87, y=-0.37}, tick_grown = 8000}
    game.surfaces[1].create_entity{name = "]]..name..[[", position = {x=-4.68, y=1.83}, tick_grown = 1000}
    game.surfaces[1].create_entity{name = "]]..name..[[", position = {x=-0.10, y=0.67}, tick_grown = 10000}
    game.surfaces[1].create_entity{name = "]]..name..[[", position = {x=4.80, y=1.69}, tick_grown = 1}
  ]]
end

planetaris_simulations.factoriopedia_chloroplasts_plant = {planet = "tellus", init = make_tellus_plant_simulation("natural-chlorophyll-soil", "chloroplast"), hide_factoriopedia_gradient = true}
planetaris_simulations.factoriopedia_myceliae_plant = {planet = "tellus", init = make_tellus_plant_simulation("natural-mycelia-soil", "myceliae"), hide_factoriopedia_gradient = true}
planetaris_simulations.factoriopedia_mushell_plant = {planet = "tellus", init = make_tellus_plant_simulation("midland-purple-bark", "mushell"), hide_factoriopedia_gradient = true}
planetaris_simulations.factoriopedia_chloronack_plant = {planet = "tellus", init = make_tellus_plant_simulation("wetland-cyan-slime", "chloronack"), hide_factoriopedia_gradient = true}
planetaris_simulations.factoriopedia_bacteriotrunk_plant = {planet = "tellus", init = make_tellus_plant_simulation("midland-red-crust", "bacteriotrunk"), hide_factoriopedia_gradient = true}
planetaris_simulations.factoriopedia_moldant_plant = {planet = "tellus", init = make_tellus_plant_simulation("midland-red-crust", "moldant"), hide_factoriopedia_gradient = true}
--
planetaris_simulations.factoriopedia_holmiumnite_plant = {planet = "tellus", init = make_tellus_plant_simulation("planetaris-dust-soil", "holmiumnite"), hide_factoriopedia_gradient = true}
planetaris_simulations.factoriopedia_carbolyte_plant = {planet = "tellus", init = make_tellus_plant_simulation("planetaris-volcanic-soil", "carbolyte"), hide_factoriopedia_gradient = true}

if mods["planetaris-hyarion"] then
planetaris_simulations.factoriopedia_big_charged_crystal_plant = {planet = "tellus", init = make_tellus_plant_simulation("hyarion-crystal-flats", "planetaris-big-charged-crystal"), hide_factoriopedia_gradient = true}
end

return planetaris_simulations