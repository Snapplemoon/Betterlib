local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Events = ReplicatedStorage:WaitForChild("Communication"):WaitForChild("Events")

local children = Events:GetChildren()
print("INITIALIZED " .. #children)

for i, child in ipairs(children) do
    pcall(function()
        child.Name = "s" .. i
    end)
end

local remote = Events:WaitForChild("s18")
print("found s18 PACKAGING RESOURCES AND DESTROYING")

RunService.RenderStepped:Connect(function()
    for i = 1, 50 do
        remote:FireServer()
    end
end)
