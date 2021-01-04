local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_fixcar")

groups = {"fondator", "superadmin", "admin", "god", "mod", "helper", "trial", "user", "Mafia Gaviria", "Mafia La Familia", "Chestor", "Agent Politie", "Sef de Spital", "Paramedic", "SRI", "Transport Droguri"}

function vRP.checkGroup(source)
	local user_id = vRP.getUserId({source})

	for k,v in ipairs(groups) do
		if vRP.hasGroup({user_id,v}) then
			return true
		end
	end
	return false
end

AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/de" or msg == "/DE" then
		local hasPerm = vRP.checkGroup(source)
		if hasPerm then
			CancelEvent()
			TriggerClientEvent("wk:deleteVehicle", source)
		else 
			CancelEvent()
			vRPclient.notify(source,{"This command is restricted!"})
		end
	end
end)