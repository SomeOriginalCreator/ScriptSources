loadstring(game:HttpGet("https://github.com/RegularVynixu/Utilities/raw/refs/heads/main/Functions.lua"))()
local isDoors = false
local isHotel = false
local hardcoreStarted = false
local allowA90 = false
local allowEntities = false
local allowTimedRooms = false
local seed = game.ReplicatedStorage.GameData.GameSeed.Value
local timedRooms = {false, false, false, false}
local roomTimer = {}
math.randomseed(seed)

--[[function spawnTimer(room)
	local t = LoadCustomInstance("https://github.com/SomeOriginalCreator/ScriptSources/raw/refs/heads/main/HardcoreExclusive/DoorTimer.rbxm")
	t.Parent = workspace
	t.Origin.Anchored = true
	t.Origin.Red.Anchored = true
	t.Origin.Black.Anchored = true
	t.PrimaryPart = t.Origin
	t.Origin.CFrame = CFrame.new(workspace.CurrentRooms[tostring(room)].Door.Door.CFrame.Position)
	t.Origin.Rotation = workspace.CurrentRooms[tostring(room)].Door.Door.Rotation
	t.Origin.Red.Rotation = t.Origin.Rotation
	t.Origin.Black.Rotation = t.Origin.Rotation
	t.Origin.Red.Position = t.Origin.CFrame.Position + Vector3.new(0, -1.95, 0.05)
	t.Origin.Black.Position = t.Origin.Red.Position + Vector3.new(0, 0, 0.01)
	return t
end
function startTimer(timer)
	task.spawn(function()
		local times = 10
		local oldRot = timer.Rotation
		timer.Origin.Black.SurfaceGui.TextLabel.Text = "00:10"
		local done = false
		while wait(1) and not done do
			times -= 1
			if times >= 0 then
				timer.Origin.Black.SurfaceGui.TextLabel.Text = "00:0" .. tostring(times)
			elseif times < 0 then
				game.Players.LocalPlayer.Character.Humanoid.Health -= 30
			end
			if not timer.Origin.Rotation == oldRot then
				done = true
			end
		end
	end)
end]]

if game.GameId == 2440500124 then
	isDoors = true
	if not workspace:FindFirstChild("entityNodes") then
		
	end
	if game.PlaceId == 6839171747 then
		isHotel = true
	else
		firesignal(game.ReplicatedStorage.RemotesFolder.Caption.OnClientEvent, "Hardcore will still run but is not supported outside of the hotel.")
	end
	if not #workspace.CurrentRooms:GetChildren() <= 2 then
		isDoors = false
		firesignal(game.ReplicatedStorage.RemotesFolder.Caption.OnClientEvent, "Please execute in the elevator or before opening the first door.")
	end
end
local currentRooms
local curRoom
if isDoors then
	currentRooms = workspace.CurrentRooms
	curRoom = workspace.RoomNum.Value
end

currentRooms.ChildAdded:Connect(function(child)
	timedRooms[tonumber(child.Name) + 1] = false
	if child.Name == "2" then
		hardcoreStarted = true
		firesignal(game.ReplicatedStorage.RemotesFolder.Caption.OnClientEvent, "Hardcore by Tranquin started.")
	elseif child.Name == "6" then
		allowEntities = true
	elseif child.Name == "15" then
		allowA90 = true
		task.spawn(function()
			math.randomseed(seed)
			local randomNum = -5
			local cooldown = -5
			while wait(1) do
				cooldown -= 1
				if cooldown <= 0 then
					randomNum = math.random(1, 100)
					if randomNum == 50 then
						loadstring(game:HttpGet("https://github.com/SomeOriginalCreator/ScriptSources/raw/refs/heads/main/A90SpawnWithDamage.lua"))()
					end
				end
			end
		end)
		allowTimedRooms = true
	end
	--[[if allowedTimedRooms then
		local rng = math.random(1, 30)
		local notKey = true
		for i, v in child:GetDescendants() do
			if v.Name == "KeyObtain" then
				notKey = false
				print(v)
				break;
			end
		end
		if child.Name == "50" then
			notKey = false
		end
		if tonumber(child.Name) >= 80 then
			notKey = false
		end
		rng = 16
		if rng == 16 and notKey then
			timedRooms[tonumber(child.Name)] = true
			roomTimer[tonumber(child.Name)] = spawnTimer(tonumber(child.Name))
		end
	end
	if timedRooms[tonumber(child.Name) - 1] then
		startTimer(roomTimer[tonumber(child.Name - 1)])
	end]]
end)
