local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Combat Suite", "All combat features", 480, 620, randPos(480, 620))
    w:AddSection("Aimbot")
    w:AddToggle("Aimbot", false, function(v) Aimbot.Config.Enabled = v end\n    end\nend\n\nreturn M\n
