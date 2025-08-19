-- Fake Secret Brainrot Spawn Predictor
-- Put this in StarterPlayer > StarterPlayerScripts (LocalScript)

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Customize the secret names
local secrets = {
    "La Vacca Saturno Saturnita",
    "Galactic Moo",
    "Rainbow Saturnita",
    "??? (Unknown Secret)"
}

-- Function to announce a "fake spawn"
local function announceSecret()
    local secret = secrets[math.random(1, #secrets)]
    local countdown = math.random(15, 60) -- random countdown seconds

    -- Create a screen GUI
    local screenGui = Instance.new("ScreenGui", player.PlayerGui)
    local label = Instance.new("TextLabel", screenGui)

    label.Size = UDim2.new(1, 0, 0.2, 0)
    label.Position = UDim2.new(0, 0, 0.4, 0)
    label.BackgroundTransparency = 0.5
    label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    label.TextColor3 = Color3.fromRGB(255, 255, 0)
    label.TextScaled = true
    label.Font = Enum.Font.Fantasy

    -- Countdown
    for i = countdown, 0, -1 do
        label.Text = "⚡ SECRET INCOMING ⚡\n" ..
            secret .. " spawns in " .. i .. " seconds!"
        wait(1)
    end

    -- Final "spawned" message
    label.Text = "🚨 SECRET SPAWNED: " .. secret .. " 🚨"
    wait(3)
    screenGui:Destroy()
end

-- Loop troll every few minutes
while true do
    wait(math.random(30, 90)) -- wait before next "prediction"
    announceSecret()
end
