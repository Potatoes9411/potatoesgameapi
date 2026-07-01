local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = buildFPSWindow("Battle Royale", Color3.fromRGB(180, 140, 80))
    w:AddSection("BR Extras")
    w:AddToggle("Auto Loot", false, function(v) w._loot = v end)
    w:AddSlider("Loot Range", 20, 300, 80, "studs", 0, function(v) w._range = v end)
    w:AddToggle("Loot ESP", false, function(v) w._lEsp = v; if not v then clearAutoHL() end end)
    w:AddToggle("Zone Alert (edge)", false, function(v) w._zone = v end)
    task.spawn(function()
        while true do
            task.wait(0.4)
            local root = getRoot()
            if root and w._loot then touchNamed(root, { "loot", "weapon", "ammo", "armor", "gun", "chest" }, w._range or 80) end
            if w._lEsp then highlightKeywords({ "loot", "weapon", "ammo", "armor", "gun", "chest", "crate" }, Color3.fromRGB(255, 200, 40)) end
        end
    end)
    return w
end

--==============================================================================
--// BUILD / EDIT GAME (creative)
--==============================================================================
local function BuildGame()
    local w = createWindow("Build / Creative", "Builder Suite", 460, 520, randPos())
    w:AddSection("Build")
    w:AddToggle("Auto Place Blocks", false, function(v) w._place = v end\n    end\nend\n\nreturn M\n
