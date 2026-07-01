local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    keywords = keywords or { "brainrot", "unit", "pet", "meme", "skibidi", "sigma", "rizz", "gyatt", "ohio", "npc", "entity", "char" }
    local out = {}
    for _, d in ipairs(Workspace:GetDescendants()) do
        if d:IsA("BasePart") and not d:IsDescendantOf(getChar() or Workspace) then
            local n = d.Name:lower()
            for _, kw in ipairs(keywords) do
                if n:find(kw) then table.insert(out, d); break end
            end
        end
    end
    return out
end

-- Bring all matching parts to the local player (the classic "collect all").
local function brainrotBring(keywords)
    local root = getRoot()
    if not root then return 0 end
    local count = 0
    for _, p in ipairs(findBrainrotParts(keywords)) do
        pcall(function() p.CFrame = root.CFrame end)
        count = count + 1
    end
    return count
end

-- Auto-steal: teleport to the nearest other player's brainrot/character and touch it.
local function autoStealNearest(range)
    local root = getRoot()
    if not root then return end
    local best, bestD = nil, range or 9999
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local d = (hrp.Position - root.Position).Magnitude
                if d < bestD then bestD = d; best = hrp end
            end
        end
    end
    if best then
        pcall(function() root.CFrame = best.CFrame * CFrame.new(0, 0, -3) end)
        return true
    end
    return false
end

-- Spawner: rapidly fire all spawn-related remotes (IdiotHub / brainrot spawner style).
local function brainrotSpawn()
    fireRemotes("spawn"); fireRemotes("summon"); fireRemotes("buy"); fireRemotes("egg"); fireRemotes("hatch")
end

-- Anti-steal: when another player gets close, fling them away or teleport up.
local function antiSteal(range)
    local root = getRoot()
    if not root then return end
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local d = (hrp.Position - root.Position).Magnitude
                if d < (range or 15) then
                    pcall(function() root.CFrame = root.CFrame + Vector3.new(0, 20, 0) end)
                end
            end
        end
    end
end

-- Collect all coins/money/cash on the map.
local function collectAllMoney(range)
    local root = getRoot()
    if not root then return 0 end
    local count = 0
    for _, d in ipairs(Workspace:GetDescendants()) do
        if d:IsA("BasePart") then
            local n = d.Name:lower()
            if n:find("coin") or n:find("cash") or n:find("money") or n:find("pickup") or n:find("gem") then
                if (d.Position - root.Position).Magnitude < (range or 9999) then
                    pcall(function() d.CFrame = root.CFrame end)
                    count = count + 1
                end
            end
        end
    end
    return count
end

--==============================================================================
--// STEAL A BRAINROT  (expanded - full IdiotHub/Divine/Pynova feature set)
--==============================================================================
local function StealABrainrotPro()
    local w = createWindow("Steal a Brainrot PRO", "Full brainrot suite", 490, 640, randPos(490, 640))
    w:AddSection("Auto Steal")
    w:AddToggle("Auto Steal (TP to players)", false, function(v) w._autoSteal = v end\n    end\nend\n\nreturn M\n
