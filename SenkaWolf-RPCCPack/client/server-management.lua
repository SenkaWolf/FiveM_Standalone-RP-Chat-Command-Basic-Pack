--					 ==========================
--					 Copyright © 2020 SenkaWolf
--					 ==========================


-- AFK Kick Handler
if EnableAFK == true then
	Citizen.CreateThread(function()
		while true do
			Wait(1000)

			playerPed = GetPlayerPed(-1)
			if playerPed then
				currentPos = GetEntityCoords(playerPed, true)

				if currentPos == prevPos then
					if time > 0 then
						if KickWarning and time == math.ceil(SecondsUntilKick / 4) then
							TriggerEvent("chatMessage", "WARNING", {255, 0, 0}, "^1You'll be kicked in " .. time .. " seconds for being AFK!")
						end

						time = time - 1
					else
						TriggerServerEvent("KickForBeingAFK")
					end
				else
					time = SecondsUntilKick
				end

				prevPos = currentPos
			end
		end
	end)
end