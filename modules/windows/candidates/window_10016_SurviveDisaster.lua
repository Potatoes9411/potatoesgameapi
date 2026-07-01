local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Survive Disaster", "Survival Suite", 460, 520, randPos())
    w:AddSection("Survival")
    w:AddToggle("Auto Fly Up", false, function(v) w._fly = v end\n    end\nend\n\nreturn M\n
