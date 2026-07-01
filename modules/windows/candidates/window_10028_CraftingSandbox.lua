local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Survival Sandbox", "Craft Suite", 460, 520, randPos())
    w:AddSection("Auto")
    w:AddToggle("Auto Gather", false, function(v) w._gather = v end\n    end\nend\n\nreturn M\n
