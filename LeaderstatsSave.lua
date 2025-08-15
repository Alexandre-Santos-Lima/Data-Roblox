local AUTO_SAVE          = true --Salva Automaticamente
local TIME_BETWEEN_SAVES = 60   --Tempo entre um save e outro
local SAFE_SAVE          = true --Salvamento de segurança
local players            = game:GetService("Players")
local dataStoreService   = game:GetService("DataStoreService")
local leaderboardData    = dataStoreService:GetDataStore("LeaderStats")

--Salvando os Satus do player
local function SaveData(player)
	
	if player.userId < 0 then return end
	
	player:WaitForChild("leaderstats")
	
	wait()
	
	local leaderstats = {}
	
	for i, stat in pairs(player.leaderstats:GetChildren()) do
		table.insert(leaderstats, {stat.Name, stat.Value})
	end
	
	leaderboardData:SetAsync(player.userId, leaderstats)
	
	print("Saved "..player.Name.."'s data")
end

--Carregando o Save do Player
local function LoadData(player)
	
	if player.userId < 0 then return end
	
	player:WaitForChild("leaderstats")
	
	wait()
	
	local leaderboardStats = leaderboardData:GetAsync(player.UserId)
	
	for i, stat in pairs(leaderboardStats) do
		local currentStat = player.leaderstats:FindFirstChild(stat[1])
		if not currentStat then return end
		currentStat.Value = stat[2]
	end
	
	print("Loaded "..player.Name.."'s data")
end

players.PlayerAdded:connect(LoadData)
players.PlayerRemoving:connect(SaveData)

---------------------------------------------------------------------------------------------------------------------------------------
--Salvamento de Segurança
if SAFE_SAVE then
	game.OnClose = function()
		for i, player in pairs(players:GetChildren()) do
			SaveData(player)
		end
		wait(1)
	end
end

--Salvamento Automático
while AUTO_SAVE do
	wait(TIME_BETWEEN_SAVES)
	for i, player in pairs(players:GetChildren()) do
		SaveData(player)
	end
end