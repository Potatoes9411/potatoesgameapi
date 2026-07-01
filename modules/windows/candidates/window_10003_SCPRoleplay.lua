local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = buildFPSWindow("SCP Roleplay", Color3.fromRGB(180, 60, 60))
    w:AddSection("SCP Extras")
    w:AddToggle("SCP / Monster ESP", false, function(v) w._sEsp = v; if not v then clearAutoHL() end end)
    w:AddToggle("Keycard ESP", false, function(v) w._kEsp = v; if not v then clearAutoHL() end end)
    task.spawn(function()
        while true do
            task.wait(0.8)
            if w._sEsp then highlightKeywords({ "scp", "monster", "173", "049", "096", "106", "939" }, Color3.fromRGB(255, 40, 50)) end
            if w._kEsp then highlightKeywords({ "keycard", "card", "item", "weapon" }, Color3.fromRGB(255, 200, 40)) end
        end
    end)
    return w
end

--==============================================================================
--// CAMPING (Story)
--==============================================================================
local function Camping()
    local w = createWindow("Camping", "Story Survival Suite", 460, 500, randPos(460, 500))
    w:AddSection("Survival")
    w:AddToggle("Player ESP", false, function(v) ESP.Enable(v) end\n    end\nend\n\nreturn M\n
