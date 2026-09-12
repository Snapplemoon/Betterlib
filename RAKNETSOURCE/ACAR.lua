local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local PlayEvent = ReplicatedStorage:WaitForChild("GameEvents"):WaitForChild("Play")

RunService.RenderStepped:Connect(function()
    for i = 1, 50 do
        local args = {
            2
        }
        PlayEvent:FireServer(unpack(args))
    end
end)
