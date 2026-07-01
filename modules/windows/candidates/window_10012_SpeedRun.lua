local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Speed Run / Dash", "Speed Suite", 460, 500, randPos(460, 500))
    w:AddSection("Movement")
    w:AddToggle("Walk Speed", false, function(v) Movement.WalkSpeed.Enabled = v end\n    end\nend\n\nreturn M\n
