local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Tycoon Helper", "Auto Tycoon", 460, 520, randPos())
    w:AddSection("Auto")
    w:AddToggle("Auto Collect Drops", false, function(v) w._collect = v end\n    end\nend\n\nreturn M\n
