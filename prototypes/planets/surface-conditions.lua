-- Code from Rubia mod

-- Defining surface condition
data:extend({
  {
    type = "surface-property",
    name = "planetaris-pollen-corrosion",
    default_value = 0, --0%
    order = "f[arig]-c",
  }
})

-- Pollen Planets
local function set_corrosion(planet_name,corrosion)
  if (data.raw["planet"][planet_name]) then 
    data.raw["planet"][planet_name].surface_properties["planetaris-pollen-corrosion"] = corrosion end
end
set_corrosion("arig", 0)
set_corrosion("hyarion", 0)
set_corrosion("tellus", 50)
set_corrosion("nauvis", 20)
set_corrosion("fulgora", 0)
set_corrosion("vulcanus", 0)
set_corrosion("gleba", 40)
set_corrosion("aquilo", 5)

--Mod planets. Keep it roughly alphabetical
set_corrosion("cerys", 0)
set_corrosion("corrundum", 0)
set_corrosion("cubium", 0)
set_corrosion("frozeta", 0)
set_corrosion("igrys", 0)
set_corrosion("jahtra", 0)
set_corrosion("lignumis", 20)
set_corrosion("maraxsis", 0)
set_corrosion("moshine", 10)
set_corrosion("muluna", 0)
set_corrosion("paracelsin", 0)
set_corrosion("rubia", 0)
set_corrosion("tenebris", 10)