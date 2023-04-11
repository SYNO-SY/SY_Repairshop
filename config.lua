Config = {}
Config.Locale = 'en'                -- en(currently only in english)
Config.RepairTime = 9000            -- time to repair the vehicle.
Config.EnableSoundEffect = true     -- enables repair sound if true.
Config.Blips = true                 -- show blip if true.
Config.cost = 500                   -- cost for repairing.
Config.textui = "ESX"               -- ESX,OX,okok.
Config.progressBar = "ESX"          -- ESX,OX.
Config.Notification = "ESX"         -- ESX,okok,custom.

Config.Stations = {
	{x = -216.8, y = 6200.39, z = 31.06},
	{x = 1532.37, y = 782.2, z = 77.44},
	{x = 481.31, y = -1279.83, z = 28.96},
	{x = 1362.93, y = 3592.48, z = 34.33},
	{x = -214.71, y = -1392.66, z = 30.68},
	{x = -1657.64, y = -245.83, z = 54.37},
	{x = 539.24, y = -177.01, z = 54.48},
	{x = 1151.11, y = -775.85, z = 57.03},
	{x = -2185.34, y = -410.91, z = 12.5},
	{x = 1024.9, y = 2656.52, z = 38.96},
	{x = 387.64,  y = 3590.0,  z = 33.2},
	{x = 2005.89, y = 3798.56, z = 31.59},
	{x = -2195.78, y = 4246.5, z = 47.25},
	{x = 2524.16, y = 4193.85, z = 39.37},
	{x = 2661.81, y = 3276.8, z = 54.65},
	{x = 1692.69, y = 6426.63, z = 32.02},
	{x = -1014.63, y = -2692.12, z = 13.39},
	{x = 173.9, y = -1736.69, z = 28.94},
	{x = 479.45, y = -1890.17, z = 25.74},

}

--TextUI
function showtextui()
	if Config.textui == "ESX" then
		ESX.TextUI(_U('press_repair'), "info")
	elseif Config.textui == "okok" then
	    exports['okokTextUI']:Open(_U('press_repair'), 'darkblue', 'left')
	elseif Config.textui == "ox" then
		lib.showTextUI(_U('press_repair'), {
			position = "right-center",
			icon = 'repair',
			style = {
				borderRadius = 20,
				backgroundColor = '#3399ff',
				color = 'white'
			}
		})
	end
end

function hidetextui()
	if Config.textui == "ESX" then
		ESX.HideUI()
	elseif Config.textui == "okok" then
	    exports['okokTextUI']:Close()
	elseif Config.textui == "ox" then
		lib.hideTextUI()
	end
end
--end of TextUI


--notification
sendNotification = function(text,msgtype,IsServer,src,time)
    if IsServer then
		if Config.Notification == "ESX" then
			TriggerClientEvent('esx:showNotification', source, text, msgtype, time)
		elseif Config.Notification == "okok" then
			TriggerClientEvent('okokNotify:Alert', source, "Repairshop", text, time, msgtype )
		elseif Config.Notification == "custom"  then
			TriggerClientEvent('SY_Notify:Alert', source, "Repairshop", text, time, msgtype )
		end
    else
		if Config.Notification == "ESX" then
			ESX.ShowNotification(text, time, msgtype)
		elseif Config.Notification == "okok" then
			exports['okokNotify']:Alert("Repairshop", text, 5000, msgtype)
		elseif Config.Notification == "custom"  then
			exports['SY_Notify']:Alert("Repairshop", text, 5000, msgtype)
		end
    end
end
