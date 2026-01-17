local SeverStorage = game:GetService("ServerStorage")
local taw = script.Parent

local meet1 = "meet1"
local lodo = "lodo1"

local prompt = Instance.new("ProximityPrompt")
prompt.Parent = taw
prompt.ActionText = "วาง"
prompt.ObjectText = "หม้อ"
prompt.HoldDuration = 0.5

local nofood = nil

prompt.Triggered:Connect(function(player)
	
	if nofood ~= nil then
		local cooked = SeverStorage:FindFirstChild(lodo)
		if cooked then
			local toolcooked = cooked:Clone()
			toolcooked.Parent = player.Backpack
			
			local human = player.Character:FindFirstChild("Humanoid")
			if human then human:EquipTool(cooked) end
			
			nofood:Destroy()
			nofood = nil
			prompt.ActionText = "วาง"
		end
		return
	end
	
	local meet1 = player.Character:FindFirstChild(meet1)
	if meet1 then
		local handle = meet1:FindFirstChild("Handle")
		
		if handle then
			local OnStove = handle:Clone()
			OnStove.Parent = workspace
			OnStove.CFrame = taw.CFrame * CFrame.new(0, 0.5, 0)
			OnStove.Anchored = true
			OnStove.CanCollide = false
			
			meet1:Destroy()
			nofood = OnStove
			
			prompt.Enabled = false
			task.wait(3)
			
			if nofood then nofood:Destroy() end
			
			local cooked1 = SeverStorage:FindFirstChild(lodo)
			if cooked1 then
				local cookedPart = cooked1.Handle:Clone()
				cookedPart.Parent = workspace
				cookedPart.CFrame = taw.CFrame * CFrame.new(0, 0.5, 0)
				cookedPart.Anchored = true
				cookedPart.CanCollide = false
				
				nofood = cookedPart
			end
			prompt.Enabled = true
			prompt.ActionText = "หยิบ"
		end
	end
end)
