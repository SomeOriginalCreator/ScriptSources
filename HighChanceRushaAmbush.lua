local currentRooms = workspace.CurrentRooms
currentRooms.ChildAdded:Connect(function(child)
    local hidable = false
    for i, v in currentRooms[tostring(tonumber(child.Name) - 1)]:GetDescendants() do
        if v.Name == "HiddenPlayer" and v:IsA("ObjectValue") then
            hidable = true
            break
        end
    end
    if hidable then
        local rng = math.random(1, 2)
        if rng == 1 then
            local eRng = math.random(1, 5)
            if eRng == 3 then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/SomeOriginalCreator/ScriptSources/refs/heads/main/AmbushSpawn.lua"))()
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/SomeOriginalCreator/ScriptSources/refs/heads/main/RushSpawn.lua"))()
            end
        end
    end
end)
