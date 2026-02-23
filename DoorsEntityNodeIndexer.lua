--index nodes
local isDoors = false
local entityNodes
local currentRoom
local isHiding
local firstNodes
local panic
if game.PlaceId == 6839171747 then
	print("Game is doors and place is")
	entityNodes = Instance.new("Folder")
	entityNodes.Parent = workspace
	entityNodes.Name = "entityNodes"
	currentRoom = Instance.new("IntValue")
	currentRoom.Value = 0
	currentRoom.Name = "RoomNum"
	currentRoom.Parent = workspace
	isHiding = Instance.new("BoolValue")
	isHiding.Name = "isHiding"
	isHiding.Value = false
	isHiding.Parent = workspace
	panic = Instance.new("BoolValue", game.ReplicatedStorage)
	panic.Name = "Panic"

	if workspace.CurrentRooms:FindFirstChild("1") and workspace.CurrentRooms:FindFirstChild("1"):FindFirstChild("PathfindNodes") then
    print("Executed at good time.")
    firstNodes = workspace.CurrentRooms:FindFirstChild("1"):FindFirstChild("PathfindNodes"):Clone()
    firstNodes.Name = workspace.CurrentRooms:FindFirstChild("1"):FindFirstChild("PathfindNodes").Parent.Name
    firstNodes.Parent = entityNodes
	end
	print("Indexer started")
	isDoors = true
	firesignal(game.ReplicatedStorage.RemotesFolder.Caption.OnClientEvent, "Node indexer loaded.")
else
	isDoors = false
end



workspace.CurrentRooms.ChildAdded:Connect(function(child)
	if isDoors then
    local nodes = child:WaitForChild("PathfindNodes"):Clone()
    nodes.Name = child.Name
    nodes.Parent = entityNodes
    currentRoom.Value += 1
	end
end)
workspace.CurrentRooms.ChildRemoved:Connect(function(child)
	if isDoors then
    entityNodes[child.Name]:Destroy()
	end
end)
while wait(0.1) and isDoors do
	if Panic then
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
	end
    local tempBool = false
    for i, v in workspace:GetDescendants() do
        if v.Name == "HiddenPlayer" and v:IsA("ObjectValue") then
            if v.Value == game.Players.LocalPlayer.Character then
                tempBool = true
            end
        end
    end
    isHiding.Value = tempBool
end