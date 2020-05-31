--					 ==========================
--					 Copyright © 2020 SenkaWolf
--					 ==========================


RegisterCommand("jail", function(source, args, rawCommand)

	if tablelength(args) > 3 then

		if args[1] == JailPassword then

			local tPID = tonumber(args[2])
			local jT = tonumber(args[3])
			local reason = table.concat(args, " ", 4)

			if jT > JailMaxSecs then
				jT = JailMaxSecs
			end

			if GetPlayerName(tPID) ~= nil then

				print("Jailing ".. GetPlayerName(tPID).. " for ".. jT .." seconds due to " .. reason .. " issued by ".. GetPlayerName(source))
				TriggerClientEvent("JP", tPID, jT)
				TriggerClientEvent('chatMessage', -1, 'JUDGE', { 0, 0, 0 }, GetPlayerName(tPID) ..' was jailed for '.. jT ..' seconds due to ' .. reason)

			end

		else

			TriggerClientEvent('chatMessage', source, '^8ERROR', { 0, 0, 0 }, '^7Incorrect jail password entered, please try again.')
			print("Incorrect jail password entered by ".. GetPlayerName(source))

		end

	else

		TriggerClientEvent('chatMessage', source, '^8ERROR', { 0, 0, 0 }, '^7Please put in the correct amount of arguments.')
		print("Incorrect amount of arguments entered by ".. GetPlayerName(source))

	end

end, false)

RegisterCommand("unjail", function(source, args, rawCommand)

	if tablelength(args) > 1 then

		if args[1] == JailPassword then

			local tPID = tonumber(args[2])
			if GetPlayerName(tPID) ~= nil then
				print(GetPlayerName(source).. " unjailed " .. GetPlayerName(tPID))
				TriggerClientEvent("UnJP", tPID)
			end

		else

			TriggerClientEvent('chatMessage', source, '^8ERROR', { 0, 0, 0 }, '^7Incorrect jail password entered, please try again.')
			print("Incorrect jail password entered by ".. GetPlayerName(source))

		end

	else

		TriggerClientEvent('chatMessage', source, '^8ERROR', { 0, 0, 0 }, '^7Please put in the correct amount of arguments.')
		print("Incorrect amount of arguments entered by ".. GetPlayerName(source))

	end

end, false)

RegisterCommand("jailme", function(source, args, rawCommand)

	if tablelength(args) > 1 then

		local jT = tonumber(args[1])
		local reason = table.concat(args, " ", 2)

		if jT > JailMaxSecs then

			jT = JailMaxSecs

		end

		print("Jailing ".. GetPlayerName(source) .. " for ".. jT .." seconds due to " .. reason)
		TriggerClientEvent("JP", source, jT)
		TriggerClientEvent('chatMessage', -1, 'JUDGE', { 0, 0, 0 }, GetPlayerName(source) ..' jailed for '.. jT ..' secs due to ' .. reason)

	else

		TriggerClientEvent('chatMessage', source, '^8ERROR', { 0, 0, 0 }, '^7Please put in the correct amount of arguments.')
		print("Incorrect amount of arguments entered by ".. GetPlayerName(source))

	end

end, false)

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
  end
