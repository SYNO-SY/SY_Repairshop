ESX = exports["es_extended"]:getSharedObject()
local fixing = false
local lastZone, currentAction

CreateThread(function()
	while true do
		Wait(0)
		if not IsPedInAnyVehicle(PlayerPedId(), false) then
			Wait(1000)
		end
		if IsPedInAnyVehicle(PlayerPedId(), false) then
			local playerPed = PlayerPedId()
			local pos = GetEntityCoords(playerPed, true)
			local isInMarker, currentZone, letSleep = false, nil, true
			local PedInVehicle = GetVehiclePedIsIn(playerPed, false)
			for k, v in pairs(Config.Stations) do
				if not fixing then
					if (Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) < 15) then
						letSleep = false
						if IsPedInAnyVehicle(playerPed, false) then
							isInMarker, currentZone = true, k
						end
					end
				end
			end
			if (isInMarker and not hasAlreadyEnteredMarker) or (isInMarker and lastZone ~= currentZone) then
				hasAlreadyEnteredMarker, lastZone = true, currentZone
				if GetPedInVehicleSeat(PedInVehicle, -1) then
					showtextui()
				end
				TriggerEvent('sy_repairshop:hasEnteredMarker', currentZone)
			end

			if not isInMarker and hasAlreadyEnteredMarker then
				hasAlreadyEnteredMarker = false
				hidetextui()
				currentAction = nil
			end
			if letSleep then
				Wait(500)
			end
		end
	end
	Wait(1000)
end)


CreateThread(function()
	while true do
		Wait(0)
		if currentAction then
			if IsControlJustReleased(0, 38) then
				if currentAction == 'dorepair' then
					TriggerServerEvent('carfixstation:costRepair', Config.cost)
				end

				currentAction = nil
			end
		else
			Wait(500)
		end
	end
end)

AddEventHandler('sy_repairshop:hasEnteredMarker', function(zone)
	currentAction = 'dorepair'
end)


RegisterNetEvent('carfixstation:fixCar')
AddEventHandler('carfixstation:fixCar', function()
	local playerPed = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed, false)
	local fixing = true
	TriggerEvent('carfixstation:markAnimation')
	FreezeEntityPosition(vehicle, true)
	sendNotification(_U('repair_processing'), 'info', false, nil, Config.RepairTime - 700)
	if Config.EnableSoundEffect then
		TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5.0, 'car_repair', 0.7)
	end
	DoorControl(4)
	if Config.progressBar == 'ESX' then
		ESX.Progressbar(_U('repair_processing'), Config.RepairTime)
	elseif Config.progressBar == 'ox' then
		lib.progressBar({
			duration = Config.RepairTime,
			label = _U('repair_processing'),
			useWhileDead = false,
			canCancel = false,
			disable = {
				car = true,
			},
		})
	end
	sendNotification(_U('repair_finish'), "success", false, nil, 5000)
	local fixing = false
	SetVehicleFixed(vehicle)
	SetVehicleDeformationFixed(vehicle)
	FreezeEntityPosition(vehicle, false)
end)

function DoorControl(door)
	local playerPed = PlayerPedId()
	if (IsPedSittingInAnyVehicle(playerPed)) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if GetVehicleDoorAngleRatio(vehicle, door) > 0.0 then
			SetVehicleDoorShut(vehicle, door, false)
		else
			SetVehicleDoorOpen(vehicle, door, false)
		end
	end
end

if Config.Blips then
	CreateThread(function()
		for i = 1, #Config.Stations, 1 do
			local blip = AddBlipForCoord(Config.Stations[i].x, Config.Stations[i].y, Config.Stations[i].z)

			SetBlipSprite(blip, 643)
			SetBlipDisplay(blip, 4)
			SetBlipScale(blip, 0.6)
			SetBlipColour(blip, 45)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentSubstringPlayerName(_U('blips_name'))
			EndTextCommandSetBlipName(blip)
		end
	end)
end
