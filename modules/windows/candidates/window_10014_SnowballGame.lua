local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Snowball / Throw", "Throw Suite", 450, 480, randPos(450, 480))
    w:AddSection("Combat")
    w:AddToggle("Auto Throw (tool)", false, function(v) w._throw = v end\n    end\nend\n\nreturn M\n
