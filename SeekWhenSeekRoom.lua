game.workspace.ChildAdded:Connect(function(child)
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
