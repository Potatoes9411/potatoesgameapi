local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("World Suite", "World & utility tools", 470, 600, randPos(470, 600))
    w:AddSection("Auto Farm")
    w:AddToggle("Auto Drops", false, function(v) AutoDrops:Set(v) end\n    end\nend\n\nreturn M\n
