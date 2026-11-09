if not data.raw["planet"]["maraxsis"] then return end

if mods["Better-Planets"] or mods["AsteroidBelt"] then return end

if settings.startup["adjust-maraxsis"].value == true then
    -- remove space connections
    if data.raw["space-connection"]["vulcanus-maraxsis"] then
        data.raw["space-connection"]["vulcanus-maraxsis"] = nil
    end

    if data.raw["space-connection"]["fulgora-maraxsis"] then
        data.raw["space-connection"]["fulgora-maraxsis"] = nil
    end

    if data.raw["space-connection"]["maraxsis-hyarion"] and data.raw["planet"]["hyarion"] then
        data.raw["space-connection"]["maraxsis-hyarion"].length = 30000
    end

    if data.raw["planet"]["maraxsis"] then
        data.raw["planet"]["maraxsis"].orientation = 0.6
    end

end