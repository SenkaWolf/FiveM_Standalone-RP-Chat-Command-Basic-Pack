--					 ==========================
--					 Copyright © 2020 SenkaWolf
--					 ==========================

Citizen.CreateThread(function()

    TriggerEvent('chat:addSuggestion', '/jail', 'Jails the specified ID for the specified for the specified length of time.', {
      { name="Jail Password", help="Jail Password."},
		  { name="Subject Server ID", help="Server ID for the person getting jailed."},
		  { name="Time in Seconds", help="Length of time in seconds that the subject needs to be jailed for."},
		  { name="Reason for Jailing", help="Reason for the jailing of the subject."}
    })

    TriggerEvent('chat:addSuggestion', '/jailme', 'Jails yourself for the specified time.', {
		  { name="Time in Seconds", help="Length of time in seconds that you're jailing yourself for."},
		  { name="Reason for Jailing", help="Reason for jailing yourself."}
	  })

	TriggerEvent('chat:addSuggestion', '/unjail', 'Unjails the specified ID.', {
      { name="Jail Password", help="Jail Password."},
		  { name="Subject Server ID", help="Server ID for the person getting unjailed."},
    })

end)

local cJ = false
local eJE = false

RegisterNetEvent("JP")
AddEventHandler("JP", function(jT)
	if cJ == true then
		return
	end
	local pP = GetPlayerPed(-1)
	if DoesEntityExist(pP) then

		Citizen.CreateThread(function()
			local playerOldLoc = GetEntityCoords(pP, true)
			SetEntityCoords(pP, 1677.233, 2658.618, 45.216)
			cJ = true
			eJE = false
			while jT > 0 and not eJE do
				pP = GetPlayerPed(-1)
				RemoveAllPedWeapons(pP, true)
				SetEntityInvincible(pP, true)
				if IsPedInAnyVehicle(pP, false) then
					ClearPedTasksImmediately(pP)
				end
				if jT % 30 == 0 then
					TriggerEvent('chatMessage', 'SYSTEM', { 0, 0, 0 }, jT .." more seconds until release.")
				end
				Citizen.Wait(500)
				local pL = GetEntityCoords(pP, true)
				local D = Vdist(1677.233, 2658.618, 45.216, pL['x'], pL['y'], pL['z'])
				if D > 90 then
					SetEntityCoords(pP, 1677.233, 2658.618, 45.216)
					if D > 100 then
						jT = jT + 60
						if jT > 1500 then
							jT = 1500
						end
						TriggerEvent('chatMessage', 'JUDGE', { 0, 0, 0 }, "Your jail time was extended for an unlawful escape attempt.")
					end
				end
				jT = jT - 0.5
			end
			TriggerServerEvent('chatMessageEntered', "SYSTEM", { 0, 0, 0 }, GetPlayerName(PlayerId()) .." was released from jail.")
			SetEntityCoords(pP, 1855.807, 2601.949, 45.323)
			cJ = false
			SetEntityInvincible(pP, false)
		end)
	end
end)

RegisterNetEvent("UnJP")
AddEventHandler("UnJP", function()
	eJE = true
end)
