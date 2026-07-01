local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Defense Game", "Auto-Play Suite", 460, 520, randPos())
    w:AddSection("Auto")
    w:AddToggle("Auto Place Towers", false, function(v) w._place = v end\n    end\nend\n\nreturn M\n
