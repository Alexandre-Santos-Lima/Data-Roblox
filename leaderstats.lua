game.Players.PlayerAdded:Connect(function(player)
	local ls           = Instance.new("Folder")
	ls.Name            = "leaderstats"
	ls.Parent          = player
	
	local dinheiros    = Instance.new("IntValue")
	dinheiros.Value    = 0
	dinheiros.Name     = "??Rúpias"
	dinheiros.Parent   = ls
	
	local contrabando  = Instance.new("IntValue")
	contrabando.Value  = 0
	contrabando.Name   = "??Dobrões"
	contrabando.Parent = ls	
end)