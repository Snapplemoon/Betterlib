-- yn made this on bro its op for the fling things and animals game everyone freezed👀
local RunService = game:GetService("RunService")

local remote = game:GetService("ReplicatedStorage"):WaitForChild("Menu"):WaitForChild("SpawnToyRemoteFunction")

local pos = Vector3.new(0, 110, 0)

local rot1 = { -0.3301357328891754, 0.4080073833465576, -0.8511995077133179, 0, 0.9017580151557922, 0.43224164843559265, 0.9439335465431213, 0.14269840717315674, -0.29770249128341675 }
local rot2 = { 0.5390556454658508, -0.0987488180398941, 0.8364613652229309, 0, 0.9931033849716187, 0.1172412782907486, -0.8422700762748718, -0.06319957226514816, 0.5353380441665649 }
local rot3 = { 0.9299685955047607, -0.07268060743808746, 0.3603830337524414, 0, 0.9802634716033936, 0.19769561290740967, -0.3676389455795288, -0.1838507056236267, 0.9116142988204956 }

local function cf(rot)
	return CFrame.new(pos.X, pos.Y, pos.Z, unpack(rot))
end

local toys = {
	{ "Pallet",         cf(rot1), 10.904857635498047, nil, 1 },
	{ "SantaSleigh",    cf(rot2), 24.780364990234375, nil, 2 },
	{ "Ladder",         cf(rot3), 23.009653091430664, nil, 3 },
	{ "RollerPlatform", cf(rot3), 23.009653091430664, nil, 4 },
	{ "FactoryCabinet", cf(rot3), 22.932050704956055, nil, 5 },
	{ "FactoryCouch",   cf(rot3), 3.2262237071990967,  nil, 6 },
	{ "FactoryChair",   cf(rot3), 3.019665241241455,   nil, 7 },
}

RunService.RenderStepped:Connect(function(deltaTime)
	for i = 1, 50 do
		for _, args in ipairs(toys) do
			remote:InvokeServer(unpack(args))
		end
	end
end)
