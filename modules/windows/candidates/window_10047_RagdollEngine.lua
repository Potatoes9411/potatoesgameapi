local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Ragdoll Engine", "Fun Suite", 460, 500, randPos(460, 500))
    w:AddSection("Fun")
    w:AddToggle("Auto Fling Everyone", false, function(v) w._fling = v end\n    end\nend\n\nreturn M\n
