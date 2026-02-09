--Initiate
loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local curRoom = workspace.RoomNum.Value
local spawnRoom = curRoom - 5
local nodeRoom = spawnRoom + 1
local entityNodes = workspace.entityNodes
local targetNode = entityNodes[tostring(nodeRoom)]["1"]
local rs = game:GetService("RunService")
local folder = nodeRoom
local isHiding = false
local rebounding = false
local swtOver = false
local waiting = false

--Entity settings

local url = "https://github.com/SomeOriginalCreator/ScriptSources/raw/refs/heads/main/GlitchRush.rbxm" --Url of entity model
local spawnWaitTime = 1 --Wait time for entity to move after spawning
local canKill = true
local rebound = true --Entity will rebound if true (like ambush)
local rebounds = math.random(5, 10) --Amount of rebounds the entity will do
local reboundWaitTime = 1 --Amount of time the entity will wait before rebounding
local audioCue = "1840927187" --put in an audio id to play when the entity spawns 0 means no sound will play
--local flickerLights = false --Will flicker lights when entity spawns
--local flickerDuration = 1 --Duration of light flicker
local entitySpeed = 7 --Speed of entity

--Do the cues

audioCue = "rbxassetid://" .. audioCue

local sound = Instance.new("Sound")
sound.Parent = workspace
local soundPart = Instance.new("Part")
soundPart.Anchored = true
soundPart.CanCollide = false
soundPart.Transparency = 1
soundPart.Position = game.Players.LocalPlayer.Character.Head.CFrame.Position
sound.SoundId = audioCue
sound.Looped = false
wait(0.1)
sound:Play()

--Spawn entity

local entity = LoadCustomInstance(url)
entity.RushNew.CFrame = CFrame.new(workspace.CurrentRooms[tostring(spawnRoom)].Door.Door.CFrame.Position)
entity.Parent = workspace
local cPart = entity.RushNew

--Start entity

wait(spawnWaitTime)
swtOver = true
--Functions
function addY(vect, add)
	local newvec = Vector3.new(vect.x, vect.y + add, vect.z)
	return newvec
end
function getDistance(v1, v2)
	return math.abs((v1 - v2).Magnitude)
end
--Controller
--while wait(0.001) and swtOver do
rs.Heartbeat:Connect(function()
    if swtOver then
    if not rebounding then
    isHiding = false
    --print(getDistance(entity.RushNew.CFrame.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position))
    --[[for i, v in workspace:GetDescendants() do
        if v.Name == "HiddenPlayer" and v:IsA("ObjectValue") then
            if v.Value == game.Players.LocalPlayer.Character then
                isHiding = true
            end
        end
    end]]
    if canKill and workspace.isHiding.Value == false and getDistance(entity.RushNew.CFrame.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position) <= 75 then
        --game.Players.LocalPlayer.Character.Humanoid.Health = 0
        print("in range, raycasting")
        local rayOrigin = cPart.Position
        local rayDest = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
	    local rayDir = (rayDest - rayOrigin).Unit * 75
	    local rayParams = RaycastParams.new()
	    local rayResults = workspace:Raycast(rayOrigin, rayDir, rayParams)
        --print(rayResults)
        if rayResults ~= nil and rayResults.Instance.Parent == game.Players.LocalPlayer.Character then
            print("killing")
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
            --wait(1.2)
            --firesignal(game.ReplicatedStorage.RemotesFolder.DeathHint.OnClientEvent, {"I nate higgers and nape riggers"}, "Blue")
        end
	    --print(rayResults)
    end
    currentRoom = workspace.RoomNum.Value
    spawnRoom = currentRoom - 5
    nodeRoom = spawnRoom + 1
    cPart.CFrame = CFrame.lookAt(cPart.CFrame.Position, addY(targetNode.CFrame.Position, 4))
	cPart.CFrame = cPart.CFrame + cPart.CFrame.LookVector * entitySpeed
    local oldTN = targetNode
    if getDistance(cPart.CFrame.Position, addY(targetNode.CFrame.Position, 4)) <= entitySpeed then
        if targetNode.Name == "500" then
            swtOver = false
            entity:Destroy()
            targetNode:Destroy()
            --error("This isn't an actual error, this is just to stop the script execution.")
            canKill = false
            return
        end
		for i, v in targetNode.Parent:GetChildren() do
		    if tonumber(v.Name) == tonumber(targetNode.Name) + 1 then
		    	targetNode = v
		    end
		end
		if targetNode == oldTN and workspace.entityNodes:FindFirstChild(tostring(folder + 1)) then
            if folder == curRoom then
                if rebound and rebounds >= 1 then
                    wait(reboundWaitTime)
                    rebounding = true
                    if not waiting then
                        rebounds -= 1
                    end
                    waiting = true
                    for i, v in targetNode.Parent:GetChildren() do
		                if tonumber(v.Name) == tonumber(targetNode.Name) - 1 then
		    	            targetNode = v
		                end
		            end
                    if targetNode == oldTN and workspace.entityNodes:FindFirstChild(tostring(folder - 1)) then
                        if folder == curRoom then
                            folder -= 1
                            local hn = -5
                            for i, v in workspace.entityNodes:FindFirstChild(tostring(folder)):GetChildren() do
                                if tonumber(v.Name) > hn then
                                    hn = tonumber(v.Name)
                                end
                            end 
                            targetNode = workspace.entityNodes[tostring(folder)][tostring(hn)]
                        end
                    end
                else
                    sound:Destroy()
                    local ntn = Instance.new("Part")
                    ntn.Anchored = true
                    ntn.Parent = workspace
                    ntn.Name = "500"
                    ntn.CFrame = CFrame.new(addY(targetNode.CFrame.Position, -300))
                    targetNode = ntn
                end
            else
                waiting = false
                folder += 1
			    targetNode = workspace.entityNodes[tostring(folder)]["1"]
            end
		elseif targetNode == oldTN then
            sound:Destroy()
			local ntn = Instance.new("Part")
            ntn.Anchored = true
            ntn.Parent = workspace
            ntn.Name = "50"
            ntn.CFrame = CFrame.new(addY(targetNode.CFrame.Position, -300))
            targetNode = ntn
		end
	end
    
--end)
    else
--rs.Heartbeat:Connect(function()
    isHiding = false
    --print(getDistance(entity.RushNew.CFrame.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position))
    --[[for i, v in workspace:GetDescendants() do
        if v.Name == "HiddenPlayer" and v:IsA("ObjectValue") then
            if v.Value == game.Players.LocalPlayer.Character then
                isHiding = true
            end
        end
    end]]
    if canKill and workspace.isHiding.Value == false and getDistance(entity.RushNew.CFrame.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position) <= 75 then
        --game.Players.LocalPlayer.Character.Humanoid.Health = 0
        print("in range, raycasting")
        local rayOrigin = cPart.Position
        local rayDest = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
	    local rayDir = (rayDest - rayOrigin).Unit * 75
	    local rayParams = RaycastParams.new()
	    local rayResults = workspace:Raycast(rayOrigin, rayDir, rayParams)
        --print(rayResults)
        if rayResults ~= nil and rayResults.Instance.Parent == game.Players.LocalPlayer.Character then
            print("killing")
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
            --wait(1.2)
            --firesignal(game.ReplicatedStorage.RemotesFolder.DeathHint.OnClientEvent, {""}, "Blue")
        end
	    --print(rayResults)
    end
    currentRoom = workspace.RoomNum.Value
    spawnRoom = currentRoom - 5
    nodeRoom = spawnRoom + 1
    cPart.CFrame = CFrame.lookAt(cPart.CFrame.Position, addY(targetNode.CFrame.Position, 4))
	cPart.CFrame = cPart.CFrame + cPart.CFrame.LookVector * entitySpeed
    local oldTN = targetNode
    if getDistance(cPart.CFrame.Position, addY(targetNode.CFrame.Position, 4)) <= entitySpeed then
        if targetNode.Name == "500" then
            swtOver = false
            entity:Destroy()
            --error("This isn't an actual error, this is just to stop the script execution.")
            canKill = false
            return
        end
        if targetNode.Name == "1" then
            if tonumber(targetNode.Parent.Name) == nodeRoom then
                wait(reboundWaitTime)
                folder = nodeRoom
                rebounding = false
                targetNode = workspace.entityNodes[tostring(folder)]["1"]
            else
                folder -= 1
                local ln = -5
                for i, v in workspace.entityNodes[tostring(folder)]:GetChildren() do
                    if tonumber(v.Name) > ln then
                        ln = tonumber(v.Name)
                    end
                end
			    targetNode = workspace.entityNodes[tostring(folder)][tostring(ln)]
            end
        else
            for i, v in targetNode.Parent:GetChildren() do
		        if tonumber(v.Name) == tonumber(targetNode.Name) - 1 then
		        	targetNode = v
		        end
		    end
        end
	end
--end)
    end
    end
--end
end)
