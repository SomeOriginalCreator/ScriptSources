
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/SomeOriginalCreator/ScriptSources/refs/heads/main/Spawner.lua"))()
spawner.changeSettings(
	"https://github.com/SomeOriginalCreator/ScriptSources/raw/refs/heads/main/SeekYellow%20.rbxm", --EntityModelUrl
	1, --Spawn wait time
	true, --Can kill
	false,--Will rebound
	2, --Amount of rebounds
	1, --Rebound wait time
	"0", --AudioCue soundid
	1,-- EntitySpeed
	false, --FlickerLights
	1, --FlickerDuration
function()
	local entity = spawner.entityModel()
	entity.Figure.Footsteps:Play()
	entity.Figure.FootstepsFar:Play()
	entity.SeekMusic.TimePosition = 0
	task.spawn(function() -- New thread for seek animation
	if getgenv()["Animator"] == nil then
		print("Running animator api")
    	loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
	end
	--local animator = entity.SeekRig.AnimationController.Animator
	local animations = entity.SeekRig.Animations
	local runTrack = Animator.new(entity.SeekRig, 10729087054)
	runTrack.Looped = true
	runTrack:Play()
end)
end, function()
	local entity = spawner.entityModel()
	entity.Figure.Footsteps:Stop()
	entity.Figure.FootstepsFar:Stop()
	entity.SeekMusic.TimePosition = 92.5
end)
spawner.changeMainPartName("Figure")
spawner.spawn()
