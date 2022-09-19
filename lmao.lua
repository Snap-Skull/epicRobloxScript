while true do
    wait()
    game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", "Red Orb", "City")
    game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", "Orange Orb", "City")
    game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", "Yellow Orb", "City")
    game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", "Blue Orb", "City")
    game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", "Gem", "City")
end
