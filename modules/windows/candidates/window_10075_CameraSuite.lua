local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = createWindow("Camera Suite", "Camera & visuals", 460, 560, randPos(460, 560))
    w:AddSection("Field of View")
    w:AddToggle("Custom FOV", false, function(v) CameraFOV.Enabled = v end\n    end\nend\n\nreturn M\n
