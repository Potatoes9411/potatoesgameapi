local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Delivery / Job", "Work Suite", 450, 480, randPos(450, 480))
    w:AddSection("Auto")
    w:AddToggle("Auto Deliver (touch)", false, function(v) w._deliver = v end\n    end\nend\n\nreturn M\n
