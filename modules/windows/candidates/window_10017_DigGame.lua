local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Dig / Mine Game", "Dig Suite", 450, 500, randPos(450, 500))
    w:AddSection("Auto")
    w:AddToggle("Auto Dig (click)", false, function(v) w._dig = v end\n    end\nend\n\nreturn M\n
