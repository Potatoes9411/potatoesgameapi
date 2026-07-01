local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Tornado Alley", "Survival Suite", 460, 520, randPos())
    w:AddSection("Survival")
    w:AddToggle("Auto Fly to Safety", false, function(v) w._safe = v end\n    end\nend\n\nreturn M\n
