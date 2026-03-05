local lib = require("lib")
require("prototypes.achievements")
require("prototypes.categories.recipe-category")
require("prototypes.decoratives.decoratives-tellus")
require("prototypes.entity.bioassembler")
require("prototypes.entity.enemies")
require("prototypes.entity.entities")
require("prototypes.entity.explosion")
require("prototypes.entity.flying-robot")
require("prototypes.entity.incubator")
require("prototypes.entity.plants")
require("prototypes.entity.remnants")
require("prototypes.entity.replacements")
require("prototypes.entity.root")
require("prototypes.planets.planet_map_gen")
require("prototypes.planets.planet-tellus-map-gen")
require("prototypes.planets.planet")
require("prototypes.planets.procession-catalogue-tellus")
require("prototypes.planets.surface-conditions")
require("prototypes.tile.tiles-tellus")
require("prototypes.autoplace-controls")
require("prototypes.particles")
require("prototypes.fluid")
require("prototypes.item-groups")
require("prototypes.item")
require("prototypes.pollen")
require("prototypes.recipe")
require("prototypes.technology")
require("prototypes.tips-and-tricks")

--------------------- Compat

require("compat.arig")
require("compat.hyarion")
require("compat.msppr")


lib.add_to_blacklist("nutrients")

local replace_base_game_simulations = false
local planetaris_menu_simulations = require("__planetaris-tellus__/menu-simulations/menu-simulations")
if not data.raw["utility-constants"]["default"].main_menu_simulations or replace_base_game_simulations then
  data.raw["utility-constants"]["default"].main_menu_simulations = {}
end
local main_menu_simulations = data.raw["utility-constants"]["default"].main_menu_simulations
main_menu_simulations.tellus_biofactory = planetaris_menu_simulations.tellus_biofactory
main_menu_simulations.tellus_mycelia = planetaris_menu_simulations.tellus_mycelia
main_menu_simulations.tellus_chloroplast_agriculture = planetaris_menu_simulations.tellus_chloroplast_agriculture

