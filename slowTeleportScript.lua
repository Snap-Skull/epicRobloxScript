-- _____ __  __   __           ______                    _ _______ _ _   _____ _     _    _ _ _ _ 
--|_   _/ _| \ \ / /           | ___ \                  ( | ) ___ ( | ) |_   _| |   | |  | (_) | |
--  | || |_   \ V /___  _   _  | |_/ / __ ___  ___ ___   V V| |_/ /V V    | | | |_  | |  | |_| | |
--  | ||  _|   \ // _ \| | | | |  __/ '__/ _ \/ __/ __|     |    /        | | | __| | |/\| | | | |
-- _| || |     | | (_) | |_| | | |  | | |  __/\__ \__ \     | |\ \       _| |_| |_  \  /\  / | | |
-- \___/_|     \_/\___/ \__,_| \_|  |_|  \___||___/___/     \_| \_|      \___/ \__|  \/  \/|_|_|_| 
--___  ___      _         __   __           ______     _       _                 ______  __  
--|  \/  |     | |        \ \ / /           | ___ \   (_)     (_)                | ___ \ \ \ 
--| .  . | __ _| | _____   \ V /___  _   _  | |_/ /___ _  ___  _ _ __            | |_/ /  | |
--| |\/| |/ _` | |/ / _ \   \ // _ \| | | | |    // _ \ |/ _ \| | '_ \           | ___ \  | |
--| |  | | (_| |   <  __/   | | (_) | |_| | | |\ \  __/ | (_) | | | | |          | |_/ /  | |
--\_|  |_/\__,_|_|\_\___|   \_/\___/ \__,_| \_| \_\___| |\___/|_|_| |_|          \____/   | |
--                                                   _/ |                                /_/ 
--                                                  |__/        

teleportService = game:GetService("TeleportService")
thePlayers = game:GetService("Players")
theKeyCode = Enum.KeyCode
valtomove = 1.5
isNoClipActivated = false
isCharacterMoving = true
localHumanoidRootPart = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart

function teleportTo(x, y, z)
    if x < localHumanoidRootPart.Position.X then
        while x < localHumanoidRootPart.Position.X do
            wait()
            localHumanoidRootPart.CFrame =
                CFrame.new(
                Vector3.new(
                    localHumanoidRootPart.Position.X - valtomove,
                    localHumanoidRootPart.Position.Y,
                    localHumanoidRootPart.Position.Z
                )
            )
        end
    end
    if z < localHumanoidRootPart.Position.Z then
        while z < localHumanoidRootPart.Position.Z do
            wait()
            localHumanoidRootPart.CFrame =
                CFrame.new(
                Vector3.new(
                    localHumanoidRootPart.Position.X,
                    localHumanoidRootPart.Position.Y,
                    localHumanoidRootPart.Position.Z - valtomove
                )
            )
        end
    end
    if x > localHumanoidRootPart.Position.X then
        while x > localHumanoidRootPart.Position.X do
            wait()
            localHumanoidRootPart.CFrame =
                CFrame.new(
                Vector3.new(
                    localHumanoidRootPart.Position.X + valtomove,
                    localHumanoidRootPart.Position.Y,
                    localHumanoidRootPart.Position.Z
                )
            )
        end
    end
    if z > localHumanoidRootPart.Position.Z then
        while z > localHumanoidRootPart.Position.Z do
            wait()
            localHumanoidRootPart.CFrame =
                CFrame.new(
                Vector3.new(
                    localHumanoidRootPart.Position.X,
                    localHumanoidRootPart.Position.Y,
                    localHumanoidRootPart.Position.Z + valtomove
                )
            )
        end
    end
    if y < localHumanoidRootPart.Position.Y then
        while y < localHumanoidRootPart.Position.Y do
            wait()
            localHumanoidRootPart.CFrame =
                CFrame.new(
                Vector3.new(
                    localHumanoidRootPart.Position.X,
                    localHumanoidRootPart.Position.Y - valtomove,
                    localHumanoidRootPart.Position.Z
                )
            )
        end
    end
    if y > localHumanoidRootPart.Position.Y then
        while y > localHumanoidRootPart.Position.Y do
            wait()
            localHumanoidRootPart.CFrame =
                CFrame.new(
                Vector3.new(
                    localHumanoidRootPart.Position.X,
                    localHumanoidRootPart.Position.Y + valtomove,
                    localHumanoidRootPart.Position.Z
                )
            )
        end
    end
    isCharacterMoving = false
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(x, y, z))
end
spawn(function()
    game:getService("RunService"):BindToRenderStep("", 0,
            function()
                if not game.Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid") then
                    return
                end
                if isCharacterMoving == true then
                    if isNoClipActivated == true then
                        game.Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
                    end
                end
        end)
end)
function onKeyPress(inputObject, gameProcessedEvent)
    if inputObject.KeyCode == theKeyCode.R then
        teleportService:Teleport(game.PlaceId, thePlayers.LocalPlayer)
    end
end
game:GetService("UserInputService").InputBegan:connect(onKeyPress)
teleportTo() --Put The Position Inside The Parentheses, Also There's No Need For Quotation Marks.
