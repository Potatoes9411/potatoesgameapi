local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Type Soul", "Farm & Raid Suite", 470, 540, randPos())
    w:AddSection("Combat")
    w:AddToggle("Auto Farm NPCs", false, function(v) w._farm = v end\n    end\nend\n\nreturn M\n
