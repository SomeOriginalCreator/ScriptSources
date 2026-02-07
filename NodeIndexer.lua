--index nodes
local games = true
if game.GameId ~= 2440500124 then
  error("This game is not doors vro.")
  games = false
  return
end
if games then
local entityNodes = Instance.new("Folder")
entityNodes.Parent = workspace
entityNodes.Name = "entityNodes"
local currentRoom = Instance.new("IntValue")
currentRoom.Value = 0
currentRoom.Name = "RoomNum"
currentRoom.Parent = workspace
local isHiding = Instance.new("BoolValue")
isHiding.Name = "isHiding"
isHiding.Value = false
isHiding.Parent = workspace
end
if workspace.CurrentRooms:FindFirstChild("1") and workspace.CurrentRooms:FindFirstChild("1"):FindFirstChild("PathfindNodes") and games then
    print("Executed at good time.")
    local firstNodes = workspace.CurrentRooms:FindFirstChild("1"):FindFirstChild("PathfindNodes"):Clone()
    firstNodes.Name = workspace.CurrentRooms:FindFirstChild("1"):FindFirstChild("PathfindNodes").Parent.Name
    firstNodes.Parent = entityNodes
end
print("Indexer started")
workspace.CurrentRooms.ChildAdded:Connect(function(child)
    if games == false then return end
    local nodes = child:WaitForChild("PathfindNodes"):Clone()
    nodes.Name = child.Name
    nodes.Parent = entityNodes
    currentRoom.Value += 1
end)
workspace.CurrentRooms.ChildRemoved:Connect(function(child)
    if games = false then return end
    entityNodes[child.Name]:Destroy()
end)
while wait(0.1) and games do
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
