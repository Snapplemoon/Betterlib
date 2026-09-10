-- loll hax lag crash fps or wtv

local RunService = game:GetService("RunService")

RunService.RenderStepped:Connect(function()
    for _, v in ipairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and v.CanTouch then
            if getconnections then
                for _, c in ipairs(getconnections(v.Touched)) do
                    if c.Fire then
                        pcall(function() c:Fire(v) end)
                    elseif c.func then
                        pcall(function() c.func(v) end)
                    end
                end
            end
        end
    end
end)
