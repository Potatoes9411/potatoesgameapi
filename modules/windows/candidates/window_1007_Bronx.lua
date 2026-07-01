local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = buildFPSWindow("Bronx", Color3.fromRGB(200, 120, 80))
    w:AddSection("Bronx Extras")
    w:AddToggle("Silent Aim", false, function(v) SilentAim:Set(v) end)
    w:AddToggle("Infinite Ammo (best-effort)", false, function(v) InfiniteAmmo:Set(v) end)
    w:AddToggle("No Recoil", false, function(v) NoSpread:Set(v) end)
    w:AddToggle("Auto Reload", false, function(v) AutoReload:Set(v) end)
    w:AddToggle("Bunny Hop", false, function(v) BunnyHop:Set(v) end)
    w:AddToggle("Aim Assist", false, function(v) AimAssist:Set(v) end)
    w:AddToggle("Wallbang", false, function(v) Wallbang:Set(v) end)
    w:AddToggle("Anti Aim", false, function(v) AntiAim:Set(v) end)
    w:AddSection("Visuals")
    w:AddToggle("Damage Numbers", false, function(v) DamageNumbers:Set(v) end)
    w:AddToggle("Hit Indicator", false, function(v) HitIndicator:Set(v) end)
    w:AddToggle("Box ESP", false, function(v) BoxESP:Set(v) end)
    w:AddToggle("Crosshair", false, function(v) setCrosshair(v) end)
    w:AddToggle("Radar", false, function(v) Radar:Set(v) end)
    w:AddToggle("Fullbright", false, function(v) Fullbright:Set(v) end)
    w:AddSection("Movement")
    w:AddToggle("Walk Speed", false, function(v) Movement.WalkSpeed.Enabled = v end)
    w:AddSlider("Speed", 16, 100, 25, "", 0, function(v) Movement.WalkSpeed.Value = v end)
    w:AddToggle("Fly", false, function(v) Movement.Fly.Enabled = v end)
    w:AddToggle("Noclip", false, function(v) Movement.Noclip = v end)
    w:AddSection("Server")
    w:AddButton("Rejoin", function() pcall(function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end) end)
    w:AddButton("Server Hop", function() ServerHop.hop() end, Theme.Yellow)
    return w
end

--==============================================================================
--// PLACEID AUTO-DETECT + AUTO-LOAD  (Nazuro-style loader)
--   Mirrors the Nazuro loader: maps game.PlaceId -> feature window name,
--   with a universal fallback. Used by the Auto-Detect button + startup.
--==============================================================================
local PlaceIdMap = {
    [142823291]         = "Murder Mystery 2",   -- MM2
    [79546208627805]    = "99 Nights",
    [109983668079237]   = "Steal a Brainrot",   -- sab
    [131623223084840]   = "Escape",
    [116495829188952]   = "Dead Rails",
    [16472538603]       = "Bronx",
    -- extra common mappings
    [286090429]         = "Arsenal",
    [18604265823]       = "Rivals",
    [606849621]         = "Jailbreak",
    [1962086868]        = "Tower of Hell",
    [2788229376]        = "Da Hood",
    [189707]            = "Natural Disasters",
    [1537690962]        = "Bee Swarm Simulator",
    [5071324506]        = "Flee the Facility",
    [13721349979]       = "Blade Ball",
    [6516141723]        = "Doors",
    [9273180877]        = "Pressure",
    [4924922222]        = "Brookhaven",
    [2753915549]        = "Blox Fruits",
    [6405393098]        = "Slap Battles",
    [8737602449]        = "Pls Donate",
    [6284583030]        = "Pet Sim X",
}

local function autoDetectGame()
    local pid = game.PlaceId
    local name = PlaceIdMap[pid]
    if not name then return nil end
    -- find the registered builder
    for _, entry in ipairs(GameList) do
        if entry.name == name then return entry end
    end
    return nil
end

-- Open (or focus) the auto-detected game window. Returns the entry or nil.
local function autoLoadDetected()
    local entry = autoDetectGame()
    if not entry then
        notify("Auto-Detect", "Current game (" .. game.PlaceId .. ") not mapped. Open Universal.", 4, Theme.Yellow)
        return nil
    end
    if OpenWindows[entry.name] and not OpenWindows[entry.name]._destroyed then
        OpenWindows[entry.name].Root.Visible = true
        bringToFront(OpenWindows[entry.name].Root)
    else
        local ok, win = pcall(entry.builder)
        if ok and win then OpenWindows[entry.name] = win end
    end
    notify("Auto-Detect", "Detected: " .. entry.name, 4, Theme.Green)
    return entry
end

--==============================================================================
--// FANCY LOADING SCREEN  (DaraHub-style boot animation)
--==============================================================================
local LoadingScreen = { _gui = nil }
function LoadingScreen:Show(text, duration)
    duration = duration or 2.5
    text = text or "Loading"
    -- remove old
    if self._gui then pcall(function() self._gui:Destroy() end) end
    local g = Instance.new("ScreenGui")
    g.Name = "HubLoadingScreen"
    g.IgnoreGuiInset = true
    g.DisplayOrder = 99999
    g.ResetOnSpawn = false
    g.Parent = getGuiParent()
    self._gui = g
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Theme.BackgroundDark
    bg.BorderSizePixel = 0
    bg.ZIndex = 1
    bg.Parent = g
    local logo = Instance.new("Frame")
    logo.Size = UDim2.new(0, 80, 0, 80)
    logo.Position = UDim2.new(0.5, -40, 0.5, -80)
    logo.BackgroundColor3 = Theme.Accent
    logo.BorderSizePixel = 0
    logo.ZIndex = 2
    logo.Parent = bg
    corner(logo, UDim.new(0, 20))
    gradient(logo, Theme.AccentBright, Theme.AccentDark, 45)
    local logoTxt = Instance.new("TextLabel")
    logoTxt.BackgroundTransparency = 1
    logoTxt.Size = UDim2.new(1, 0, 1, 0)
    logoTxt.Font = Theme.FontBold
    logoTxt.TextSize = 40
    logoTxt.TextColor3 = Color3.fromRGB(255, 255, 255)
    logoTxt.Text = "P"
    logoTxt.ZIndex = 3
    logoTxt.Parent = logo
    -- spin the logo
    local spinConn = RunService.RenderStepped:Connect(function(dt)
        logo.Rotation = logo.Rotation + dt * 180
    end)
    local title = Instance.new("TextLabel")
    title.BackgroundTransparency = 1
    title.Position = UDim2.new(0.5, -150, 0.5, 10)
    title.Size = UDim2.new(0, 300, 0, 26)
    title.Font = Theme.FontBold
    title.TextSize = 22
    title.TextColor3 = Theme.Text
    title.Text = "Potatools"
    title.ZIndex = 3
    title.Parent = bg
    local sub = Instance.new("TextLabel")
    sub.BackgroundTransparency = 1
    sub.Position = UDim2.new(0.5, -150, 0.5, 38)
    sub.Size = UDim2.new(0, 300, 0, 18)
    sub.Font = Theme.Font
    sub.TextSize = 13
    sub.TextColor3 = Theme.AccentBright
    sub.Text = text
    sub.ZIndex = 3
    sub.Parent = bg
    -- progress bar
    local barBg = Instance.new("Frame")
    barBg.Size = UDim2.new(0, 260, 0, 6)
    barBg.Position = UDim2.new(0.5, -130, 0.5, 68)
    barBg.BackgroundColor3 = Theme.Element
    barBg.BorderSizePixel = 0
    barBg.ZIndex = 3
    barBg.Parent = bg
    corner(barBg, UDim.new(1, 0))
    local barFill = Instance.new("Frame")
    barFill.Size = UDim2.new(0, 0, 1, 0)
    barFill.BackgroundColor3 = Theme.Accent
    barFill.BorderSizePixel = 0
    barFill.ZIndex = 4
    barFill.Parent = barBg
    corner(barFill, UDim.new(1, 0))
    gradient(barFill, Theme.AccentBright, Theme.AccentDark, 0)
    local dots = { ".", "..", "..." }
    local i = 0
    local conn = RunService.Heartbeat:Connect(function()
        barFill.Size = UDim2.new(math.clamp((tick() % duration) / duration, 0, 1), 0, 1, 0)
        i = i + 1
        sub.Text = text .. " " .. dots[(math.floor(i / 8) % 3) + 1]
    end)
    task.delay(duration, function()
        if conn then conn:Disconnect() end
        if spinConn then spinConn:Disconnect() end
        local us = Instance.new("UIScale"); us.Scale = 1; us.Parent = bg
        tween(bg, 0.4, { BackgroundTransparency = 1 })
        tween(us, 0.4, { Scale = 1.1 })
        for _, d in ipairs(bg:GetDescendants()) do
            if d:IsA("TextLabel") or d:IsA("ImageLabel") then
                tween(d, 0.4, { TextTransparency = 1, ImageTransparency = 1 })
            elseif d:IsA("Frame") then
                tween(d, 0.4, { BackgroundTransparency = 1 })
            end
        end
        task.wait(0.45)
        pcall(function() g:Destroy() end)
        self._gui = nil
    end)
end

--==============================================================================
--// BRAINROT TOOLKIT (shared helpers for all brainrot games)
--   Comprehensive auto-steal / spawner / collector suite. These games revolve
--   around spawning brainrots, stealing them from other players, collecting
--   money/coins, buying eggs, and defending your own brainrots.
--==============================================================================

--==== EXTRA BRAINROT HELPERS (advanced) ====

-- Track the value/rarity of brainrots by scanning descendant attribute names.
local function scanBrainrotValues()
    local values = {}
    for _, d in ipairs(Workspace:GetDescendants()) do
        if d:IsA("Model") or d:IsA("BasePart") then
            local n = d.Name:lower()
            if n:find("brainrot") or n:find("unit") or n:find("pet") or n:find("meme") then
                local val = d:GetAttribute("Value") or d:GetAttribute("Rarity") or d:GetAttribute("Price") or "unknown"
                table.insert(values, { name = d.Name, value = tostring(val), part = d })
            end
        end
    end
    table.sort(values, function(a, b)
        local av, bv = tonumber(a.value) or 0, tonumber(b.value) or 0
        return av > bv
    end)
    return values
end

-- Teleport to and steal the HIGHEST value brainrot on the map.
local function stealHighestValue()
    local root = getRoot()
    if not root then return false end
    local values = scanBrainrotValues()
    if #values > 0 then
        local part = values[1].part
        if part:IsA("Model") then part = part.PrimaryPart or part:FindFirstChildWhichIsA("BasePart") end
        if part then
            pcall(function() root.CFrame = part.CFrame + Vector3.new(0, 3, 0) end)
            return true, values[1].name, values[1].value
        end
    end
    return false
end

-- Follow a target player at a set distance (orbit / stalk).
local function followPlayer(plr, distance)
    local root = getRoot()
    if not (root and plr and plr.Character) then return end
    local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        pcall(function() root.CFrame = hrp.CFrame * CFrame.new(0, 0, distance or -5) end)
    end
end

-- Spam every ProximityPrompt on the map (many brainrot games use these).
local function fireAllPrompts()
    pcall(function()
        for _, d in ipairs(Workspace:GetDescendants()) do
            if d:IsA("ProximityPrompt") then
                fireproximityprompt(d)
            end
        end
    end)
end

-- Polyfill fireproximityprompt for Studio.
if not fireproximityprompt then
    fireproximityprompt = function(prompt)
        pcall(function()
            if prompt and prompt.Parent then
                prompt.HoldDuration = 0
                prompt:InputHoldBegin()
                task.wait()
                prompt:InputHoldEnd()
            end
        end)
    end
end

-- Auto-rebirth with configurable threshold.
local function autoRebirthLoop(delay, enabled)
    task.spawn(function()
        while enabled() do
            fireRemotes("rebirth")
            task.wait(delay or 2)
        end
    end)
end

-- Mass-collect every pickup-type part and teleport them to a set position.
local function massCollectTo(pos)
    local count = 0
    for _, d in ipairs(Workspace:GetDescendants()) do
        if d:IsA("BasePart") then
            local n = d.Name:lower()
            if n:find("coin") or n:find("cash") or n:find("money") or n:find("gem") or n:find("drop") or n:find("pickup") then
                pcall(function() d.CFrame = CFrame.new(pos) end)
                count = count + 1
            end
        end
    end
    return count
end

-- Sell all: rapidly fire every sell-related remote + touch sell parts.
local function sellEverything()
    fireRemotes("sell")
    local root = getRoot()
    if root then touchNamed(root, { "sell", "shop", "merchant", "npc" }, 9999) end
end

-- Egg spawner: mass-fire all egg/hatch remotes with all egg types.
local eggTypes = { "common", "rare", "epic", "legendary", "mythic", "gold", "rainbow", "cracked", "fertilized", "bug" }
local function massHatchEggs()
    fireRemotes("hatch"); fireRemotes("egg"); fireRemotes("open")
    for _, et in ipairs(eggTypes) do
        fireRemotes("hatch" .. et)
    end
end

-- Auto-equip: equip the best/highest-value tool or unit.
local function equipBestTool()
    pcall(function()
        local bp = LocalPlayer:FindFirstChildOfClass("Backpack")
        local char = getChar()
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if not (bp and hum) then return end
        local best, bestScore = nil, -1
        for _, t in ipairs(bp:GetChildren()) do
            if t:IsA("Tool") then
                local score = t:GetAttribute("Value") or t:GetAttribute("Damage") or 1
                score = tonumber(score) or 1
                if score > bestScore then bestScore = score; best = t end
            end
        end
        if best then hum:EquipTool(best) end
    end)
end

--==== BRAINROT AUTO-FARM CONTROLLER (master loop for brainrot games) ====
local BrainrotFarm = {
    Enabled = false,
    Mode = "Steal",      -- "Steal" | "Collect" | "Spawner" | "Mixed"
    Delay = 0.5,
    Range = 500,
    AutoRebirth = false,
    AutoSell = false,
    AutoHatch = false,
    AutoEquip = false,
    AntiSteal = false,
    Prompts = false,
}
RunService.Heartbeat:Connect(function()
    if not BrainrotFarm.Enabled then return end
    if BrainrotFarm._t and tick() - BrainrotFarm._t < BrainrotFarm.Delay then return end
    BrainrotFarm._t = tick()
    local root = getRoot()
    if not root then return end
    if BrainrotFarm.Mode == "Steal" or BrainrotFarm.Mode == "Mixed" then
        autoStealNearest(BrainrotFarm.Range)
    end
    if BrainrotFarm.Mode == "Collect" or BrainrotFarm.Mode == "Mixed" then
        collectAllMoney(BrainrotFarm.Range)
    end
    if BrainrotFarm.Mode == "Spawner" or BrainrotFarm.Mode == "Mixed" then
        brainrotSpawn()
    end
    if BrainrotFarm.AutoRebirth then fireRemotes("rebirth") end
    if BrainrotFarm.AutoSell then sellEverything() end
    if BrainrotFarm.AutoHatch then massHatchEggs() end
    if BrainrotFarm.AutoEquip then equipBestTool() end
    if BrainrotFarm.AntiSteal then antiSteal(15) end
    if BrainrotFarm.Prompts then fireAllPrompts() end
end)

--==== BRAINROT MASTER WINDOW (controls the shared farm controller) ====
local function BrainrotMaster()
    local w = createWindow("Brainrot Master", "Universal brainrot farm", 490, 640, randPos(490, 640))
    w:AddSection("Master Farm")
    w:AddToggle("Enable Brainrot Farm", false, function(v) BrainrotFarm.Enabled = v end\n    end\nend\n\nreturn M\n
