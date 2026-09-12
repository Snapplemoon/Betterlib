local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SelectTeam = ReplicatedStorage:WaitForChild("Events"):WaitForChild("SelectTeam")

local RedArgs = { "Team Red" }
local BlueArgs = { "Team Blue" }

RunService.RenderStepped:Connect(function()
    for i = 1, 50 do
        SelectTeam:InvokeServer(unpack(RedArgs))
    end
    for i = 1, 50 do
        SelectTeam:InvokeServer(unpack(BlueArgs))
    end
end)
