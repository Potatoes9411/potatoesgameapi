local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = buildFPSWindow("Paintball", Color3.fromRGB(120, 200, 255))
    w:AddSection("Paintball Extras")
    w:AddToggle("Auto Reload", false, function(v) w._reload = v end)
    task.spawn(function()
        while true do
            task.wait(1)
            if w._reload then
                pcall(function()
                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.R, false, game)
                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.R, false, game)
                end)
            end
        end
    end)
    return w
end

--==============================================================================
--// OBBY 2 / DIFFICULT PARKOUR
--==============================================================================
local function ParkourObby()
    local w = createWindow("Difficult Parkour", "Obby Suite", 460, 540, randPos())
    w:AddSection("Movement")
    w:AddToggle("Noclip", false, function(v) Movement.Noclip = v end\n    end\nend\n\nreturn M\n
