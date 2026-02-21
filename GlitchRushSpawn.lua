local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/SomeOriginalCreator/ScriptSources/refs/heads/main/Spawner.lua"))()
spawner.changeSettings("https://github.com/SomeOriginalCreator/ScriptSources/raw/refs/heads/main/GlitchRush.rbxm", 1, true, true, math.random(5, 10), 1, "1840927187", 7, true, 1, function()
	--Visual cue code goes in here
        --ccGoal (Color Correction Goal) = {Brightness, Contrast, Saturation, Color}
        local ccGoal = {5, 10, 0, Color3.fromRGB(0, 26, 123)}
        local ccEffect = Instance.new("ColorCorrectionEffect")
        local ccFade = true
        local ccFadeTime = 1
        game.ReplicatedStorage.Panic.Value = true
        ccEffect.Name = "EntityEffect"
        local rs = game:GetService("RunService")
        ccEffect.TintColor = ccGoal[4]
        ccEffect.Brightness = ccGoal[1]
        ccEffect.Contrast = ccGoal[2]
        ccEffect.Saturation = ccGoal[3]
        ccEffect.Parent = game.Lighting
        while wait(0.01) and ccEffect.Brightness >= 0.1 or ccEffect.Contrast >= 0.1 do
            --Fade script
            if ccEffect.Brightness >= 0.1 then
                ccEffect.Brightness -= 0.1
                if ccEffect.Contrast >= 0.1 then
                    ccEffect.Contrast -= 0.2
                end
            else
                ccEffect.Contrast -= 0.2
            end
        end
end, function()
	local effect = game.Lighting.EntityEffect
    local tweenOver = false
    local ts = game:GetService("TweenService")
    local Info = TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
    ts:Create(effect, Info, {TintColor = Color3.fromRGB(255,255,255)}):Play()
    while effect.TintColor == Color3.fromRGB(255,255,255) do
        tweenOver = true
        effect:Destroy()
    end
end)
spawner.changeGuidingLight({"what did you die to this time?", "", "", "", "", "", "", "Good luck next time.", "You can do it."}, "Yellow")
spawner.spawn()
