--Initiate
loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local entity = LoadCustomInstance("https://github.com/SomeOriginalCreator/ScriptSources/raw/refs/heads/main/Ruh.rbxm")
local curRoom = workspace.RoomNum.Value
local spawnRoom = curRoom - 5
local nodeRoom = spawnRoom + 1
entity.RushNew.CFrame = CFrame.new(workspace.CurrentRooms[tostring(spawnRoom)].Door.Door.CFrame.Position)
entity.Parent = workspace
local cPart = entity.RushNew
local entityNodes = workspace.entityNodes
local targetNode = entityNodes[tostring(nodeRoom)]["1"]
local rs = game:GetService("RunService")
local folder = nodeRoom
local isHiding = false
local canKill = true
--Functions
function addY(vect, add)
	local newvec = Vector3.new(vect.x, vect.y + add, vect.z)
	return newvec
end
function getDistance(v1, v2)
	return math.abs((v1 - v2).Magnitude)
end
--Controller
while wait(0.001) do
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
            wait(1.2)
            firesignal(game.ReplicatedStorage.RemotesFolder.DeathHint.OnClientEvent, {"I nate higgers and nape riggers"}, "Blue")
        end
	    --print(rayResults)
    end
    currentRoom = workspace.RoomNum.Value
    spawnRoom = currentRoom - 5
    nodeRoom = spawnRoom + 1
    cPart.CFrame = CFrame.lookAt(cPart.CFrame.Position, addY(targetNode.CFrame.Position, 4))
	cPart.CFrame = cPart.CFrame + cPart.CFrame.LookVector * 5
    local oldTN = targetNode
    if getDistance(cPart.CFrame.Position, addY(targetNode.CFrame.Position, 4)) <= 5 then
        if targetNode.Name == "500" then
            entity:Destroy()
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
                local ntn = Instance.new("Part")
                ntn.Anchored = true
                ntn.Parent = workspace
                ntn.Name = "500"
                ntn.CFrame = CFrame.new(addY(targetNode.CFrame.Position, -300))
                targetNode = ntn
            else
                folder += 1
			    targetNode = workspace.entityNodes[tostring(folder)]["1"]
            end
		elseif targetNode == oldTN then
			local ntn = Instance.new("Part")
            ntn.Anchored = true
            ntn.Parent = workspace
            ntn.Name = "50"
            ntn.CFrame = CFrame.new(addY(targetNode.CFrame.Position, -300))
            targetNode = ntn
		end
	end
--end)
end
