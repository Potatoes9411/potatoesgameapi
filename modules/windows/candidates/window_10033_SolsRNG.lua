local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Sols RNG", "Auto Roll Suite", 460, 520, randPos())
    w:AddSection("Auto")
    w:AddToggle("Auto Roll", false, function(v) w._roll = v end\n    end\nend\n\nreturn M\n
