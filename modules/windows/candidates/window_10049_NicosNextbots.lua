local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Nico's Nextbots", "Survival Suite", 460, 520, randPos())
    w:AddSection("Nextbots")
    w:AddToggle("Nextbot ESP (Red)", false, function(v) w._nEsp = v; if not v then clearAutoHL() end\n    end\nend\n\nreturn M\n
