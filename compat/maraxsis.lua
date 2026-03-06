if not mods["maraxsis"] then return end

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

-- remove space connections
if data.raw["space-connection"]["vulcanus-maraxsis"] then
    data.raw["space-connection"]["vulcanus-maraxsis"] = nil
end

if data.raw["space-connection"]["fulgora-maraxsis"] and data.raw["planet"]["hyarion"] then
    data.raw["space-connection"]["fulgora-maraxsis"] = nil
end

if data.raw["space-connection"]["maraxsis-arig"] and data.raw["planet"]["arig"] then
    data.raw["space-connection"]["maraxsis-arig"] = nil
end

if data.raw["space-connection"]["maraxsis-hyarion"] and data.raw["planet"]["hyarion"] then
    data.raw["space-connection"]["maraxsis-hyarion"].length = 30000
end

if data.raw["planet"]["maraxsis"] then
    data.raw["planet"]["maraxsis"].orientation = 0.6
end