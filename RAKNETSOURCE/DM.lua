local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local PlaceDomino = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Events"):WaitForChild("PlaceDomino")

local connection
connection = RunService.RenderStepped:Connect(function()
	for i = 1, 50 do
		local args = {
			"Domino",
			CFrame.new(64.00118255615234, 4, 7.166782379150391, -0.17280127108097076, -1.3248667940501946e-08, -0.984956681728363, 1.2463750032054577e-08, 1, -1.5637661832101912e-08, 0.984956681728363, -1.4978462914427837e-08, -0.17280127108097076)
		}
		PlaceDomino:FireServer(unpack(args))
	end
end)
