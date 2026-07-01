local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Muscle Legends", "Train Suite", 460, 500, randPos(460, 500))
    w:AddSection("Auto")
    w:AddToggle("Auto Lift (click)", false, function(v) w._lift = v end\n    end\nend\n\nreturn M\n
