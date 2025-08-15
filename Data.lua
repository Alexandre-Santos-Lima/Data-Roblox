game.Players.PlayerAdded:Connect(function(Plr)
	local Status = Instance.new("Folder", Plr)
		Status.Name  = "Data"
		
	--- Level System
	local Levels = Instance.new("IntValue", Status) 
		Levels.Name  = "Levels"
		Levels.Value = 1
	local Exp = Instance.new("IntValue", Status)
		Exp.Name  = "Exp"
		Exp.Value = 0
	local ExpNeed = Instance.new("IntValue", Status)
		ExpNeed.Name  = "ExpNeed"
		ExpNeed.Value = 100
	--- Money System
	local Beli = Instance.new("IntValue", Status)
		Beli.Name  = "Gold"
		Beli.Value = 0
		
	--- Stats Text
	local DefenseP = Instance.new("IntValue", Status)
		DefenseP.Name  = "DefenseP"
		DefenseP.Value = 1
	local SwordP = Instance.new("IntValue", Status)
		SwordP.Name  = "SwordP"
		SwordP.Value = 1
	local LuckP = Instance.new("IntValue", Status)
		LuckP.Name  = "LuckP"
		LuckP.Value = 1
	local SpecialP = Instance.new("IntValue", Status)
		SpecialP.Name  = "SpecialP"
		SpecialP.Value = 1
		
	--- Stats System
	local Points = Instance.new("IntValue", Status)
		Points.Name  = "Points"
		Points.Value = 0
	local PointsS = Instance.new("IntValue", Status)
		PointsS.Name  = "PointsS"
		PointsS.Value = 1
	local Defense = Instance.new("IntValue", Status)
		Defense.Name  = "Defense"
		Defense.Value = 0
	local Sword = Instance.new("IntValue", Status)
		Sword.Name  = "Sword"
		Sword.Value = 0
	local Luck = Instance.new("IntValue", Status)
		Luck.Name  = "Luck"
		Luck.Value = 0
	local Special = Instance.new("IntValue", Status)
		Special.Name  = "Special"
		Special.Value = 0
end)

game.Players.PlayerAdded:Connect(function(plr)
	wait(1)
	local Exp     = plr.Data.Exp
	local Levels  = plr.Data.Levels
	local ExpNeed = plr.Data.ExpNeed
	local Points  = plr.Data.Points
	
	while wait() do
		if Exp.Value >= (100 * (Levels.Value + 1)) and Levels.Value <= 399 then
			Levels.Value  = Levels.Value  + 1
			Points.Value  = Points.Value  + 3
			Exp.Value     = Exp.Value     - ExpNeed.Value
			ExpNeed.Value = ExpNeed.Value + 100
			game.ReplicatedStorage.LevelSystem.LevelUpGui:FireClient(plr)
		end
	end
end)