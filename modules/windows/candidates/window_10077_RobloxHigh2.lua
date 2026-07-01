local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Roblox High School 2", "Campus Suite", 460, 500, randPos(460, 500))
    addMovement(w, 200, 350)
    w:AddSection("Visuals")
    w:AddToggle("Player ESP", false, function(v) ESP.Enable(v) end\n    end\nend\n\nreturn M\n
