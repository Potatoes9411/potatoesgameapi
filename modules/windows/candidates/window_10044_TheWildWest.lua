local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = buildFPSWindow("The Wild West", Color3.fromRGB(200, 150, 80))
    w:AddSection("Wild West Extras")
    w:AddToggle("Horse ESP", false, function(v) w._hEsp = v; if not v then clearAutoHL() end end)
    w:AddToggle("Gold / Item ESP", false, function(v) w._gEsp = v; if not v then clearAutoHL() end end)
    w:AddToggle("Rob Bank (best-effort)", false, function(v) w._rob = v end)
    task.spawn(function()
        while true do
            task.wait(0.8)
            if w._hEsp then highlightKeywords({ "horse", "mount" }, Color3.fromRGB(150, 100, 60)) end
            if w._gEsp then highlightKeywords({ "gold", "money", "bar", "safe", "cash" }, Color3.fromRGB(255, 200, 40)) end
            if w._rob then fireRemotes("rob"); fireRemotes("steal") end
        end
    end)
    return w
end

--==============================================================================
--// LOOMIAN LEGACY
--==============================================================================
local function LoomianLegacy()
    local w = createWindow("Loomian Legacy", "Battle Suite", 460, 520, randPos())
    w:AddSection("Auto Battle")
    w:AddToggle("Auto Battle Wild", false, function(v) w._battle = v end\n    end\nend\n\nreturn M\n
