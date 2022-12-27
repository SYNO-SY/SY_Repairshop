ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('carfixstation:costRepair')
AddEventHandler('carfixstation:costRepair', function(cost)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer.getMoney() >= Config.cost then		
		xPlayer.removeMoney(Config.cost)
		TriggerClientEvent('carfixstation:fixCar', _source)
		sendNotification(_U('cost_repair',Config.cost),'info',true,source,5000)
	else
            sendNotification(_U('not_enough_money'),'error',true,source,5000)
	end
end)

