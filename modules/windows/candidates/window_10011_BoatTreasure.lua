local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Build A Boat (Treasure)", "Sail Suite", 460, 520, randPos())
    w:AddSection("Sail")
    w:AddToggle("Auto Sail Forward", false, function(v) w._sail = v end\n    end\nend\n\nreturn M\n
