local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Raft / Ocean Survival", "Survival Suite", 470, 540, randPos())
    w:AddSection("Survival")
    w:AddToggle("Auto Collect Resources", false, function(v) w._res = v end\n    end\nend\n\nreturn M\n
