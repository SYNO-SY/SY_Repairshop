Config = {}
Config.Locale = 'en' --en, tw

Config.RepairTime = 9000
Config.EnableSoundEffect = true
Config.Blips = true
Config.cost = 500

Config.Stations = {

	{x = -216.8, y = 6200.39, z = 31.06},
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

function sendNotification(message, messageType, messageTimeout)
	exports['SY_Notify']:Alert("Repair Station", message, 5000, 'info') -- you can change the notification as what you are using on server.
end
