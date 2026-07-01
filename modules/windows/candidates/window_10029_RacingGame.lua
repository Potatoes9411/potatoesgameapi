local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Racing Game", "Drive Suite", 460, 500, randPos(460, 500))
    w:AddSection("Driving")
    w:AddToggle("Auto Accelerate (W)", false, function(v) w._accel = v end\n    end\nend\n\nreturn M\n
