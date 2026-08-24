--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FEAnimations"
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 220, 0, 250)
mainFrame.Position = UDim2.new(0.35, 0, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.Text = "FE Animations"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Parent = mainFrame

local function makeBtn(txt, yPos)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(0.8, 0, 0, 40)
	b.Position = UDim2.new(0.1, 0, yPos, 0)
	b.Text = txt
	b.Parent = mainFrame
	return b
end

local seraphicBtn = makeBtn("FE Seraphics Anim", 0.18)
local fighterBtn = makeBtn("FE Fighter R6", 0.38)
local mjBtn = makeBtn("Michael Jackson", 0.58)
local feAudioBtn = makeBtn("FE Audio", 0.78)

local function playAnim(animId)
	local char = LocalPlayer.Character
	if not char then return end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum then
		local anim = Instance.new("Animation")
		anim.AnimationId = "rbxassetid://"..animId
		local track = hum:LoadAnimation(anim)
		track:Play()
		return track
	end
end

seraphicBtn.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://pastefy.app/59mJGQGe/raw"))()
end)

fighterBtn.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Fe-ProjectR/FE-Files/refs/heads/main/Fe%20gale.lua"))("cool")
end)

local currentTrack = nil
mjBtn.MouseButton1Click:Connect(function()
	local tool = Instance.new("Tool")
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Name = "MichaelAnim"
	tool.Parent = LocalPlayer.Backpack

	tool.Equipped:Connect(function()
		local char = tool.Parent
		local hrp = char:FindFirstChild("HumanoidRootPart")
		local hum = char:FindFirstChildOfClass("Humanoid")
		if hrp and hum then
			hum.WalkSpeed = 2
			hum.AutoRotate = false
			local gyro = Instance.new("BodyGyro")
			gyro.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
			gyro.P = 1e5
			gyro.CFrame = hrp.CFrame * CFrame.Angles(math.rad(-35), 0, 0)
			gyro.Name = "MJ_Lean"
			gyro.Parent = hrp
			local pos = Instance.new("BodyPosition")
			pos.MaxForce = Vector3.new(1e5, 1e5, 1e5)
			pos.P = 5e4
			pos.Position = hrp.Position
			pos.Name = "MJ_Fix"
			pos.Parent = hrp
			currentTrack = playAnim("242307417")
		end
	end)

	tool.Unequipped:Connect(function()
		local char = LocalPlayer.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		if hrp and hum then
			hum.WalkSpeed = 16
			hum.AutoRotate = true
			if hrp:FindFirstChild("MJ_Lean") then hrp.MJ_Lean:Destroy() end
			if hrp:FindFirstChild("MJ_Fix") then hrp.MJ_Fix:Destroy() end
			if currentTrack then
				currentTrack:Stop()
				currentTrack = nil
			end
		end
	end)
end)

feAudioBtn.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/nmalka01/nmalka01/refs/heads/main/Brookhaven_audio"))()
end)
