local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Block Sandbox", "Mine & Build Suite", 470, 540, randPos())
    w:AddSection("Mining")
    w:AddToggle("Auto Mine (click)", false, function(v) w._mine = v end\n    end\nend\n\nreturn M\n
