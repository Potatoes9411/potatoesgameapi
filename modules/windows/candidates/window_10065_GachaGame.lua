local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Pet Gacha", "Roll Suite", 450, 500, randPos(450, 500))
    w:AddSection("Auto")
    w:AddToggle("Auto Roll/Hatch", false, function(v) w._roll = v end\n    end\nend\n\nreturn M\n
