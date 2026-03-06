local planetaris_menu_simulations = {}

--special variables:
-- sim_planet = current sim surface
-- on_tick = override to do stuff on given tick when timeline_tools are included
local make_simulation = function(duration, planet, filename, script)
  return
  {
    checkboard = false,
    save = "__planetaris-tellus__/menu-simulations/" .. filename,
    length = duration,
    init =
    [[
      local sim_planet = game.surfaces["]] .. planet .. [["]
      local logo = sim_planet.find_entities_filtered{name = "planetaris-logo-red", limit = 1}[1]
      logo.destructible = false
      local center = {logo.position.x, logo.position.y+9.75}
      game.simulation.camera_surface_index = sim_planet.index
      game.simulation.camera_position = center
      game.simulation.camera_zoom = 1
      game.tick_paused = false
    ]]
    ..
    script
  }
end

local timeline_tools =
  [[
    local tick = 0
    local on_tick = function() end
    script.on_nth_tick(1,
      function()
        tick = tick + 1
        on_tick()
      end)
  ]]

planetaris_menu_simulations.tellus_biofactory = make_simulation(60 * 12, "tellus", "menu-simulation-tellus-biofactory.zip", [[]])
planetaris_menu_simulations.tellus_mycelia = make_simulation(60 * 12, "tellus", "menu-simulation-tellus-mycelia.zip", [[]])
planetaris_menu_simulations.tellus_chloroplast_agriculture = make_simulation(60 * 12, "tellus", "menu-simulation-tellus-chloroplast-agriculture.zip", [[]])
planetaris_menu_simulations.tellus_air_cleaning = make_simulation(60 * 12, "tellus", "menu-simulation-tellus-mycelia-air-cleaning.zip", [[]])
planetaris_menu_simulations.tellus_mycelia_nutrients = make_simulation(60 * 12, "tellus", "menu-simulation-tellus-mycelia-nutrients.zip", [[]])

return planetaris_menu_simulations