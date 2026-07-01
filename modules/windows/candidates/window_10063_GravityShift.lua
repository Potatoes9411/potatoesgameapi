local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Gravity Shift", "Movement Suite", 460, 500, randPos(460, 500))
    addMovement(w, 200, 400)
    w:AddSection("Gravity")
    w:AddToggle("Low Gravity", false, function(v) GravityMod:Set(v); if v then GravityMod.Settings.Mult = 0.3 end\n    end\nend\n\nreturn M\n
