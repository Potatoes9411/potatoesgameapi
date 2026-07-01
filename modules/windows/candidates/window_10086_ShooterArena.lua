local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = buildFPSWindow("Shooter Arena", Color3.fromRGB(255, 120, 80))
    w:AddSection("Arena Extras")
    w:AddToggle("Kill Aura", false, function(v) w._aura = v end)
    w:AddSlider("Aura Range", 3, 50, 18, "studs", 0, function(v) w._arange = v end)
    w:AddToggle("Bunny Hop", false, function(v) BunnyHop:Set(v) end)
    w:AddToggle("Auto Reload", false, function(v) AutoReload:Set(v) end)
    task.spawn(function()
        while true do
            task.wait(0.2)
            if w._aura then for _, t in ipairs(getTargetsInRange(w._arange or 18, false, true)) do swingTool() end end
        end
    end)
    return w
end

--==============================================================================
--// MULTIPLAYER MINIGAMES COLLECTION
--==============================================================================
local function MinigamesCollection()
    local w = createWindow("Minigames Collection", "Party Suite", 460, 500, randPos())
    w:AddSection("Auto-Play")
    w:AddToggle("Auto Click", false, function(v) w._click = v end\n    end\nend\n\nreturn M\n
