local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Sport / Skate", "Trick Suite", 450, 480, randPos(450, 480))
    w:AddSection("Movement")
    w:AddToggle("Speed Boost", false, function(v) Movement.WalkSpeed.Enabled = v end\n    end\nend\n\nreturn M\n
