local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Pet Collection", "Pet Suite", 460, 520, randPos())
    w:AddSection("Auto")
    w:AddToggle("Auto Hatch Eggs", false, function(v) w._hatch = v end\n    end\nend\n\nreturn M\n
