if SERVER then	
	util.AddNetworkString("PPChatPrint")
	local restriction = 5 -- if there are less than or equal to 5 players on the server, bonuses will be given
	local premium = 20 -- points to be added per timedelay (Standard)
	local timeDelay = 120 -- points will be applied after how many seconds 

	local function PPChatPrint(ply, ...)
		local args = {...}
		net.Start("PPChatPrint")
		net.WriteTable(args)
		net.Send(ply)
	end

	local function ApplyBonus() 
		timer.Create("PopulatorPremium", timeDelay, 0, function()
			if #player.GetHumans() <= restriction then
				for k,v in pairs(player.GetHumans()) do 
					v:PS2_AddStandardPoints(premium)
					PPChatPrint(v, "You have been awarded ", Color(0, 255, 174), tostring(premium), Color(255,255,255), " points for populating the server!")
				end
			end
		end)
	end

	hook.Add("InitPostEntity", "PopulatorPremium", function()
		ApplyBonus()
	end)
end

if CLIENT then
	net.Receive("PPChatPrint", function()
		local args = net.ReadTable()
		chat.AddText(Color(255,255,255), "[", Color(0,149,255), "Bonus", Color(255,255,255), "] ", unpack(args))
	end)
end
