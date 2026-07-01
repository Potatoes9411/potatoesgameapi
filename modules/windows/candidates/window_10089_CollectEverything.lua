local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Collect Everything", "Magnet Suite", 460, 500, randPos(460, 500))
    w:AddSection("Collect")
    w:AddToggle("Magnet (bring all to you)", false, function(v) w._mag = v end\n    end\nend\n\nreturn M\n
