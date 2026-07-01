local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Endless Obby", "Auto-Climb Suite", 460, 540, randPos())
    w:AddSection("Auto-Climb")
    w:AddToggle("Auto Skip (loop up)", false, function(v) w._skip = v end\n    end\nend\n\nreturn M\n
