local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = buildFPSWindow("Strucid", Color3.fromRGB(120, 180, 255))
    w:AddSection("Strucid Extras")
    w:AddToggle("Auto Build / Place", false, function(v) w._build = v end)
    w:AddToggle("Bunny Hop", false, function(v) w._bhop = v end)
    w:AddToggle("Kill Aura", false, function(v) w._aura = v end)
    w:AddSlider("Aura Range", 3, 40, 18, "studs", 0, function(v) w._arange = v end)
    task.spawn(function()
        while true do
            task.wait(0.2)
            if w._build then swingTool(); fireRemotes("place"); fireRemotes("build") end
            if w._bhop then
                local h = getHum(); local r = getRoot()
                if h and r and h.FloorMaterial ~= Enum.Material.Air then h:ChangeState(Enum.HumanoidStateType.Jumping) end
            end
            if w._aura then for _, t in ipairs(getTargetsInRange(w._arange or 18, false, true)) do swingTool() end end
        end
    end)
    return w
end

--===== APOCALYPSE RISING =====
local function ApocalypseRising()
    local w = buildFPSWindow("Apocalypse Rising", Color3.fromRGB(120, 140, 90))
    w:AddSection("Survival Extras")
    w:AddToggle("Loot ESP", false, function(v) w._lEsp = v; if not v then clearAutoHL() end end)
    w:AddToggle("Zombie ESP", false, function(v) w._zEsp = v; if not v then clearAutoHL() end end)
    w:AddToggle("Auto Loot Nearby", false, function(v) w._loot = v end)
    w:AddSlider("Loot Range", 20, 300, 80, "studs", 0, function(v) w._range = v end)
    task.spawn(function()
        while true do
            task.wait(0.4)
            local root = getRoot()
            if w._lEsp then highlightKeywords({ "loot", "weapon", "ammo", "item", "food", "medical" }, Color3.fromRGB(255, 200, 40)) end
            if w._zEsp then highlightKeywords({ "zombie", "enemy", "npc", "infected" }, Color3.fromRGB(255, 60, 60)) end
            if root and w._loot then touchNamed(root, { "loot", "weapon", "ammo", "item", "food" }, w._range or 80) end
        end
    end)
    return w
end

--===== VEHICLE LEGENDS =====
local function VehicleLegends()
    local w = createWindow("Vehicle Legends", "Drive Suite", 460, 520, randPos())
    w:AddSection("Driving")
    w:AddToggle("Auto Drive (W)", false, function(v) w._drive = v end\n    end\nend\n\nreturn M\n
