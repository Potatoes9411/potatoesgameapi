local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Fish Game", "Survival Suite", 460, 520, randPos())
    w:AddSection("Minigames")
    w:AddToggle("Red Light Green Light Helper", false, function(v) w._rlgl = v end\n    end\nend\n\nreturn M\n
