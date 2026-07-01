local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Social / Hangout", "Social Suite", 460, 500, randPos(460, 500))
    w:AddSection("Social")
    w:AddToggle("Auto Chat", false, function(v) w._chat = v end\n    end\nend\n\nreturn M\n
