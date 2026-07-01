local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Anime Defenders", "Auto-Play Suite", 470, 540, randPos())
    w:AddSection("Auto")
    w:AddToggle("Auto Place Units", false, function(v) w._place = v end\n    end\nend\n\nreturn M\n
