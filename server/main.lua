ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('carfixstation:costRepair')
AddEventHandler('carfixstation:costRepair', function(cost)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer.getMoney() >= Config.cost then		
		xPlayer.removeMoney(Config.cost)
		TriggerClientEvent('carfixstation:fixCar', _source)
		--TriggerClientEvent('esx:showNotification', _source, _U('cost_repair', Config.cost))
		TriggerClientEvent('SY_Notify:Alert', _source, "Reapir Station", _U('cost_repair', Config.cost), 5000, 'info')
	else
		TriggerClientEvent('SY_Notify:Alert', _source, "Reapir Station", _U('not_enough_money'), 5000, 'error')
		--TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
	end
end)

