local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Escape", "Escape Suite", 470, 560, randPos())
    w:AddSection("ESP / Info")
    w:AddToggle("Player ESP", false, function(v) ESP.Enable(v) end\n    end\nend\n\nreturn M\n
