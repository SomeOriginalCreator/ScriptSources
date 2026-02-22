local uis = game:GetService("UserInputService")
local dueToA90 = false
print("executed")
uis.InputBegan:Connect(function(inp)
	if inp.KeyCode == Enum.KeyCode.Delete then
		local Damage = 30
		local A90Event = game.ReplicatedStorage.RemotesFolder.A90
		firesignal(game.ReplicatedStorage.RemotesFolder.A90.OnClientEvent)
		wait(1.6)
		--print("Checking")
		if game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Jumpscare.Jumpscare_A90.FaceAngry.Visible == true then
			local ccEffect = Instance.new("ColorCorrectionEffect", game.Lighting)
			ccEffect.Enabled = false
			ccEffect.Brightness = 3
			ccEffect.Contrast = 20
			ccEffect.Saturation = 1.5
			ccEffect.TintColor = Color3.fromRGB(64,64,64)
			local ts = game:GetService("TweenService")
			local goal = {}
			goal.TintColor = Color3.fromRGB(255, 255, 255)
			goal.Brightness = 0
			goal.Contrast = 0
			goal.Saturation = 0
			local tsInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)
			tween = ts:Create(ccEffect, tsInfo, goal)
			--print("moved")
			wait(0.8)
			game.Players.LocalPlayer.Character.Humanoid.Health -= Damage
			task.spawn(function()
				if game.Players.LocalPlayer.Character.Health <= 0 then
					dueToA90 = true
					
				end
			end)
			ccEffect.Enabled = true
			tween:Play()
			wait(1)
			ccEffect:Destroy()
		end
	end
end)
game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
	if dueToA90 then
		wait(1.2)
		firesignal(game.ReplicatedStorage.RemotesFolder.DeathHint.OnClientEvent, {"What did you die to?", "", "", "", "", "", "Cya."}, "Yellow")
	end
end)
