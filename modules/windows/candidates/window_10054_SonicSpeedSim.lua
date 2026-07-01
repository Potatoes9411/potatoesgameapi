local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Sonic Speed Simulator", "Speed Farm Suite", 460, 520, randPos())
    w:AddSection("Auto")
    w:AddToggle("Auto Collect Rings", false, function(v) w._rings = v end\n    end\nend\n\nreturn M\n
