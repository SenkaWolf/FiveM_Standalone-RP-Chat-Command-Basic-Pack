--					 ==========================
--					 Copyright © 2020 SenkaWolf
--					 ==========================

--/dv Command
if EnableDVCommand == true then
	Citizen.CreateThread(function()

	    TriggerEvent('chat:addSuggestion', '/dv', 'Delete a vehicle you are in or near.', {})
			TriggerEvent('chat:addSuggestion', '/delveh', 'Delete a vehicle you are in or near.', {})

	end)

	RegisterNetEvent("DVCommand")
	AddEventHandler("DVCommand", function()
		Citizen.Trace("HI")
		local ped = GetPlayerPed(-1)
		if (IsPedSittingInAnyVehicle(ped)) then
			local vehicle = GetVehiclePedIsIn(ped, false)
			if (GetPedInVehicleSeat(vehicle, -1) == ped) then
				SetEntityAsMissionEntity(vehicle, true, true)
				deleteVehicle(vehicle)
			else
				ShowNotification("~r~Error: ~w~You must be the driver of the vehicle.")
			end
		else
			local position = GetEntityCoords(ped)
			local inFront = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 2.0, 0.0)
			local vehicle = GetVehicleInDirection(position, inFront)
			if (DoesEntityExist(vehicle)) then
				SetEntityAsMissionEntity(vehicle, true, true)
				deleteVehicle(vehicle)
			else
				ShowNotification("~r~Error: ~w~You must be close to or in a vehicle.")
			end
		end
	end)

	function deleteVehicle(vehicle)
		Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(vehicle))
		if not (DoesEntityExist(vehicle)) then
			ShowNotification("~g~Success: ~w~Vehicle Deleted.")
		end
	end

	function ShowNotification( text )
		SetNotificationTextEntry( "STRING" )
		AddTextComponentString( text )
		DrawNotification( false, false )
	end

	function GetVehicleInDirection( coordFrom, coordTo )
		local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed( -1 ), 0)
		local _, _, _, _, vehicle = GetRaycastResult(rayHandle)
		return vehicle
	end
end

-------------------------------------------------------------------------------

--/hood Command
Citizen.CreateThread(function()

    TriggerEvent('chat:addSuggestion', '/hood', 'When in a vehicle opens up your hood/bonnet.', {})

end)

RegisterCommand("hood", function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 4) > 0 then
            SetVehicleDoorShut(veh, 4, false)
        else
            SetVehicleDoorOpen(veh, 4, false, false)
        end
    end
end, false)

-------------------------------------------------------------------------------

--/trunk Command
Citizen.CreateThread(function()

    TriggerEvent('chat:addSuggestion', '/trunk', 'When in a vehicle opens up your trunk/boot.', {})

end)

RegisterCommand("trunk", function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 5) > 0 then
            SetVehicleDoorShut(veh, 5, false)
        else
            SetVehicleDoorOpen(veh, 5, false, false)
        end
    end
end, false)
