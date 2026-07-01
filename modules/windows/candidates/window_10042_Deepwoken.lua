local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Deepwoken", "Survival RPG Suite", 470, 540, randPos())
    w:AddSection("Combat")
    w:AddToggle("Auto Farm Mobs", false, function(v) w._farm = v end\n    end\nend\n\nreturn M\n
