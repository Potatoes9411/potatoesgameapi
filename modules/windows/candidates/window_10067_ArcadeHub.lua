local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Arcade / Minigames", "Auto-Play Suite", 460, 500, randPos())
    w:AddSection("Auto-Play")
    w:AddToggle("Auto Click Minigames", false, function(v) w._click = v end\n    end\nend\n\nreturn M\n
