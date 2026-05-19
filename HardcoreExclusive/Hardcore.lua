print("started")
loadstring(game:HttpGet("https://github.com/RegularVynixu/Utilities/raw/refs/heads/main/Functions.lua"))()
print("loaded utils")
local isDoors = false
local isHotel = false
local hardcoreStarted = false
local allowA90 = false
local allowEntities = false
local seed = game.ReplicatedStorage.GameData.GameSeed.Value
math.randomseed(seed)

if game.GameId == 2440500124 then
	isDoors = true
	if not workspace:FindFirstChild("entityNodes") then
		print("indexer not started")
		print("starting...")
		loadstring(game:HttpGet("https://github.com/SomeOriginalCreator/ScriptSources/raw/refs/heads/main/DoorsEntityNodeIndexer.lua"))()
		print("started indexer")
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
	end
	--Entity RNG
	if allowEntities then
		local rng = math.random(1, 2)
        local rng2 = math.random(1, 1000)
        local cancelReg = false
        if rng2 == 6 and rng == 2 then
            cancelReg = true
            loadstring(game:HttpGet("https://raw.githubusercontent.com/SomeOriginalCreator/ScriptSources/refs/heads/main/GlitchAmbushSpawn.lua"))()
        elseif rng2 <= 5 then
            cancelReg = true
            loadstring(game:HttpGet("https://raw.githubusercontent.com/SomeOriginalCreator/ScriptSources/refs/heads/main/GlitchRushSpawn.lua"))()
        end
        if rng == 1 and not cancelReg then
            local eRng = math.random(1, 5)
            if eRng == 3 then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/SomeOriginalCreator/ScriptSources/refs/heads/main/AmbushSpawn.lua"))()
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/SomeOriginalCreator/ScriptSources/refs/heads/main/RushSpawn.lua"))()
            end
        end
	end
	--HC Seek
	if child:FindFirstChild("TriggerEventCollision") then
		child:FindFirstChild("TriggerEventCollision"):FindFirstChild("Collision").Name = Collision2
		c1 = room.TriggerEventCollision.Collision
		c2 = room.TriggerEventCollision.Collision2
		c1.Touched:Connect(function(hit)
			if hit.Parent == game.Players.LocalPlayer.Character then
				loadstring(game:HttpGet("https://raw.githubusercontent.com/SomeOriginalCreator/ScriptSources/refs/heads/main/SeekSpawn.lua"))()
				task.spawn(function()
					local rs = game:GetService("RunService")
					rs.Heartbeat:Connect(function()
						if workspace:FindFirstChild("SeekMovingNewClone") then
							workspace:FindFirstChild("SeekMovingNewClone"):Destroy()
						end
					end)
				end)
			end
		end)
		c1.Touched:Connect(function(hit)
			if hit.Parent == game.Players.LocalPlayer.Character then
				loadstring(game:HttpGet("https://raw.githubusercontent.com/SomeOriginalCreator/ScriptSources/refs/heads/main/SeekSpawn.lua"))()
				task.spawn(function()
					local rs = game:GetService("RunService")
					rs.Heartbeat:Connect(function()
						if workspace:FindFirstChild("SeekMovingNewClone") then
							workspace:FindFirstChild("SeekMovingNewClone"):Destroy()
						end
					end)
				end)
			end
		end)
	end

end)
