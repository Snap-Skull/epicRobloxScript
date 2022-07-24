game.StarterGui.ScreenGui.HUD.Left.Coins.Position = UDim2.new(0, 0, 0, 598)
game.StarterGui.ScreenGui.HUD.Left.Gems.Position = UDim2.new(0, 0, 0, 678)
if game.StarterGui.ScreenGui.HUD.Left:FindFirstChild("Bundles") then
    game.StarterGui.ScreenGui.HUD.Left.Bundles:Destroy()
end
if game.Players.LocalPlayer.PlayerGui.ScreenGui.HUD.Left:FindFirstChild("Bundles") then
    game.Players.LocalPlayer.PlayerGui.ScreenGui.HUD.Left.Bundles:Destroy()
end
if game.Players.LocalPlayer.PlayerGui.ScreenGui.HUD.Left:FindFirstChild("Mythril") then
    game.Players.LocalPlayer.PlayerGui.ScreenGui.HUD.Left.Mythril:Destroy()
end
if game.Players.LocalPlayer.PlayerGui.ScreenGui.HUD.Left:FindFirstChild("FireShards") then
    game.Players.LocalPlayer.PlayerGui.ScreenGui.HUD.Left.FireShards:Destroy()
end
local epicCoinsPositionCheck = game.Players.LocalPlayer.PlayerGui.ScreenGui.HUD.Left.Coins:Clone()
if game.Players.LocalPlayer.PlayerGui.ScreenGui.HUD.Left.Coins.Position == epicCoinsPositionCheck.Position then
    epicCoinsPositionCheck:Destroy()
    game.Players.LocalPlayer.PlayerGui.ScreenGui.HUD.Left.Coins.Position = UDim2.new(0, 0, 0, 598)
end
local epicGemPositionCheck = game.Players.LocalPlayer.PlayerGui.ScreenGui.HUD.Left.Gems:Clone()
if game.Players.LocalPlayer.PlayerGui.ScreenGui.HUD.Left.Gems.Position == epicGemPositionCheck.Position then
    epicGemPositionCheck:Destroy()
    game.Players.LocalPlayer.PlayerGui.ScreenGui.HUD.Left.Gems.Position = UDim2.new(0, 0, 0, 678)
end
local mythrilCounter = game.Players.LocalPlayer.PlayerGui.ScreenGui.HUD.Left.Coins:Clone()
local fireshardCounter = game.Players.LocalPlayer.PlayerGui.ScreenGui.HUD.Left.Gems:Clone()
mythrilCounter.Buy:Destroy()
mythrilCounter.Icon.Image = "rbxassetid://10183093606"
mythrilCounter.Background.Image = ""
mythrilCounter.Position = UDim2.new(0, 0, 0, 758)
mythrilCounter.Label.TextColor3 = Color3.fromRGB(41, 255, 194)
mythrilCounter.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui.HUD.Left
mythrilCounter.Name = "Mythril"
fireshardCounter.Buy:Destroy()
fireshardCounter.Icon.Image = "rbxassetid://10183092721"
fireshardCounter.Background.Image = ""
fireshardCounter.Position = UDim2.new(0, 0, 0, 838)
fireshardCounter.Label.TextColor3 = Color3.fromRGB(254, 136, 17)
fireshardCounter.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui.HUD.Left
fireshardCounter.Name = "FireShards"
while true do
    wait()
    mythrilCounter.Label.Text = game.Players.LocalPlayer.PlayerGui.ScreenGui.Inventory.Frame.Container.Ores.Content.Frame.Items.mythril.Frame.Amount.Text
    fireshardCounter.Label.Text = game.Players.LocalPlayer.PlayerGui.ScreenGui.Inventory.Frame.Container.Ores.Content.Frame.Items.fireshard.Frame.Amount.Text
end
