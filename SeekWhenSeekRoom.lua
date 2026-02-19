loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/refs/heads/main/Functions.lua"))()
local collision1 = Instance.new("Part", workspace)
collision1.Position = Vector3.new(99999, 99999, 99999)
collision1.Anchored = true
local collision2 = Instance.new("Part", workspace)
collision2.Position = Vector3.new(99999, 99999, 99999)
collision2.Anchored = true
function collisionTriggered()
	local oldSeek = workspace:WaitForChild("SeekMovingNewClone")
	loadstring(game:HttpGet("https://raw.githubusercontent.com/SomeOriginalCreator/ScriptSources/refs/heads/main/SeekSpawn.lua"))()
end

collision1.Touched:Connect(function(hit)
	if hit.Parent == game.Players.LocalPlayer.Character then
		collisionTriggered()
	end
end)

collision1.Touched:Connect(function(hit)
	if hit.Parent == game.Players.LocalPlayer.Character then
		collisionTriggered()
	end
end)
game.workspace.ChildAdded:Connect(function(child)
	if child:FindFirstChild("TriggerEventCollision") then
		child:FindFirstChild("TriggerEventCollision"):FindFirstChild("Collision").Name = Collision2
		local collision1 = room.TriggerEventCollision.Collision
		local collision2 = room.TriggerEventCollision.Collision2
	end
end)
