local players = game:GetService("Players")
local pStatsModule = require(game.ReplicatedStorage.playerStats)

game.Players.PlayerAdded:Connect(function(plr)
	pStatsModule:Add(plr)
	plr.CharacterAdded:Connect(function(char)
		pStatsModule:Add(plr)
	end)
end)

game.Players.PlayerRemoving:Connect(function(plr)
	pStatsModule:Remove(plr)
end)