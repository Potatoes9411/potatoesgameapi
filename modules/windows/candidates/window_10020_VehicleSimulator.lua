local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Vehicle Simulator", "Drive Suite", 460, 520, randPos())
    w:AddSection("Driving")
    w:AddToggle("Auto Drive (W)", false, function(v) w._drive = v end\n    end\nend\n\nreturn M\n
