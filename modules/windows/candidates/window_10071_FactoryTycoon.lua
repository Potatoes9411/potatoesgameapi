local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Factory Tycoon", "Production Suite", 460, 520, randPos())
    w:AddSection("Auto")
    w:AddToggle("Auto Collect Cash", false, function(v) w._cash = v end\n    end\nend\n\nreturn M\n
