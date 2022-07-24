local localCharacter = game.Players.LocalPlayer.Character
local HRP = "HumanoidRootPart"
local newPartsFolder = Instance.new("Folder")
newPartsFolder.Parent = game.Workspace
newPartsFolder.Name = "newPartsFolder"
function createNewPart()
    local newPart = Instance.new("Part")
    newPart.Anchored = true
    newPart.Archivable = true
    newPart.BackParamA = -0.5
    newPart.BackParamB = 0.5
    newPart.BackSurface = "Smooth"
    newPart.BackSurfaceInput = "NoInput"
    newPart.BottomParamA = -0.5
    newPart.BottomParamB = 0.5
    newPart.BottomSurface = "Inlet"
    newPart.BottomSurfaceInput = "NoInput"
    newPart.BrickColor = BrickColor.new("Institutional white")
    newPart.CFrame = localCharacter[HRP].CFrame * CFrame.new(0, 0, -5)
    newPart.CanCollide = true
    newPart.CollisionGroupId = 0
    newPart.Color = Color3.fromRGB(255, 255, 255)
    newPart.CustomPhysicalProperties = nil
    newPart.FrontParamA = -0.5
    newPart.FrontParamB = 0.5
    newPart.FrontSurfaceInput = "NoInput"
    newPart.LeftParamA = -0.5
    newPart.LeftParamB = 0.5
    newPart.LeftSurface = "Smooth"
    newPart.LeftSurfaceInput = "NoInput"
    newPart.Locked = false
    newPart.Material = Enum.Material.SmoothPlastic
    newPart.Name = "newPart"
    newPart.Parent = newPartsFolder
    newPart.Reflectance = 0
    newPart.RightParamA = -0.5
    newPart.RightParamB = 0.5
    newPart.RightSurfaceInput = "NoInput"
    newPart.RobloxLocked = false
    newPart.RotVelocity = Vector3.new(0, 0, 0)
    newPart.Shape = "Block"
    newPart.Size = Vector3.new(6, 1, 6)
    newPart.TopParamA = -0.5
    newPart.TopParamB = 0.5
    newPart.TopSurface = "Studs"
    newPart.TopSurfaceInput = "NoInput"
    newPart.Transparency = 0
    newPart.Velocity = Vector3.new(0, 0, 0)
end
if game.Workspace:FindFirstChild("autoDeleteOresEnabled") then
    game.Workspace.autoDeleteOresEnabled:Destroy()
end
if game.Players.LocalPlayer.PlayerGui.ScreenGui.HUD.Left:FindFirstChild("DestroyOres") then
    game.Players.LocalPlayer.PlayerGui.ScreenGui.HUD.Left.DestroyOres:Destroy()
end
local destroyOresFrame = Instance.new("Frame")
local destroyOresFrameCorner = game.Players.LocalPlayer.PlayerGui.ScreenGui.HUD.Left.Coins.UICorner:Clone()
local backgroundImage = Instance.new("ImageLabel")
local labelText = Instance.new("TextLabel")
local frameStroke = game.Players.LocalPlayer.PlayerGui.ScreenGui.HUD.Left.Coins.UIStroke:Clone()
local textStroke = game.Players.LocalPlayer.PlayerGui.ScreenGui.HUD.Left.Coins.Label.UIStroke:Clone()
destroyOresFrame.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui.HUD.Left
destroyOresFrame.Name = "DestroyOres"
destroyOresFrame.Position = UDim2.new(0, 0, 0, 918)
destroyOresFrame.Size = UDim2.new(0, 350, 0, 60)
destroyOresFrame.BackgroundColor3 = Color3.fromRGB(0, 179, 255)
destroyOresFrameCorner.Parent = destroyOresFrame
backgroundImage.Parent = destroyOresFrame
backgroundImage.Name = "Background"
backgroundImage.ImageColor3 = Color3.fromRGB(0, 0, 0)
backgroundImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
backgroundImage.ImageTransparency = 0.93
labelText.Parent = destroyOresFrame
labelText.Name = "Label"
labelText.Size = UDim2.new(1, -110, 1, -10)
labelText.Position = UDim2.new(0, 70, 0, 0)
labelText.Font = "FredokaOne"
labelText.TextSize = 33
labelText.TextColor3 = Color3.fromRGB(200, 200, 200)
labelText.BackgroundTransparency = 1
labelText.TextXAlignment = "Left"
labelText.Text = "Deleting Ores Off"
frameStroke.Parent = destroyOresFrame
textStroke.Parent = labelText
local autoDeleteOresEnabled = Instance.new("BoolValue")
autoDeleteOresEnabled.Parent = game.Workspace
autoDeleteOresEnabled.Name = "autoDeleteOresEnabled"
local UserInputService = game:GetService("UserInputService")
local toggleKey = Enum.KeyCode.T
local createNewPartKey = Enum.KeyCode.V
local destroyAllNewPartsKey = Enum.KeyCode.R
UserInputService.InputBegan:Connect(function(InputObject, GameProcessedEvent)
    if GameProcessedEvent then
        return
    end
    if InputObject.KeyCode == toggleKey and autoDeleteOresEnabled.Value == false then
        isDeleteOresEnabled = true
        autoDeleteOresEnabled.Value = true
        labelText.Text = "Deleting Ores On"
    elseif InputObject.KeyCode == toggleKey and autoDeleteOresEnabled.Value == true then
        isDeleteOresEnabled = false
        autoDeleteOresEnabled.Value = false
        labelText.Text = "Deleting Ores Off"
    end
    if InputObject.KeyCode == createNewPartKey then
        createNewPart()
    end
    if InputObject.KeyCode == destroyAllNewPartsKey then
        for _,allNewPartsFolderChildren in pairs(game.Workspace.newPartsFolder:GetChildren()) do
            if allNewPartsFolderChildren.Name == "newPart" and allNewPartsFolderChildren.ClassName == "Part" then
                allNewPartsFolderChildren:Destroy()
            end
        end
    end
end)
local oresToDelete = {
    [1] = {
        [1] = "stone",
        [2] = "dirt",
        [3] = "coal",
        [4] = "h_stone"
    }
}
while true do
    wait()
    if autoDeleteOresEnabled.Value == true then
        game:GetService("ReplicatedStorage").Events.MultiDeleteOres:FireServer(unpack(oresToDelete))
    end
end
