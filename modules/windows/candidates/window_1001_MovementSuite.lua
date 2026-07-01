local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Movement Suite", "Advanced movement", 470, 620, randPos(470, 620))
    w:AddSection("Basic")
    w:AddToggle("Walk Speed", false, function(v) Movement.WalkSpeed.Enabled = v end\n    end\nend\n\nreturn M\n
