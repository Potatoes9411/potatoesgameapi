local M = {}\n\nfunction M.build(env)\n    local createWindow = env.createWindow\n    local Theme = env.Theme\n    return function()\n    local w = buildFPSWindow("Blood & Iron", Color3.fromRGB(160, 60, 60))
    w:AddSection("Extras")
    w:AddToggle("Bayonet Reach", false, function(v) Reach2:Set(v) end)
    w:AddDropdown("Reach Mode", { "Resize", "TouchInterest" }, "Resize", function(v) Reach2.Settings.Mode = v end)
    return w
end

--==============================================================================
--// WELCOME TO BLOXBURG
--==============================================================================
local function Bloxburg()
    local w = createWindow("Welcome to Bloxburg", "Build & Job Suite", 470, 540, randPos())
    w:AddSection("Jobs")
    w:AddToggle("Auto Work (click)", false, function(v) w._work = v end\n    end\nend\n\nreturn M\n
