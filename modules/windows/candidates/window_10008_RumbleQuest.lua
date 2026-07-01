local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = buildFPSWindow("Rumble Quest", Color3.fromRGB(150, 120, 255))
    w:AddSection("Rumble Extras")
    w:AddToggle("Kill Aura", false, function(v) w._aura = v end)
    w:AddSlider("Aura Range", 5, 60, 22, "studs", 0, function(v) w._arange = v end)
    task.spawn(function()
        while true do
            task.wait(0.2)
            if w._aura then for _, t in ipairs(getTargetsInRange(w._arange or 22, true, true)) do swingTool() end end
        end
    end)
    return w
end

--==============================================================================
--// RO-BIO / ROBLOX HIGH (extra RP)
--==============================================================================
local function RoCitizens()
    local w = createWindow("RoCitizens", "RP Suite", 470, 540, randPos(470, 540))
    w:AddSection("Movement")
    addMovement(w, 200, 400)
    w:AddSection("Visuals")
    w:AddToggle("Player ESP", false, function(v) ESP.Enable(v) end\n    end\nend\n\nreturn M\n
