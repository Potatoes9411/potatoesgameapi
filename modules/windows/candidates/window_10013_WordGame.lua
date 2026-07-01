local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Word / Typing Game", "Auto Type Suite", 450, 480, randPos(450, 480))
    w:AddSection("Auto")
    w:AddToggle("Auto Type Common Words", false, function(v) w._type = v end\n    end\nend\n\nreturn M\n
