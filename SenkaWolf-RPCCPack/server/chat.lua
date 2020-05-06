--Standard Chat
AddEventHandler('chatMessage', function(source, name, message)
  if string.sub(message, 1, string.len("/")) ~= "/" then
	  local name = GetPlayerName(source)
	TriggerClientEvent("sendProximityMessage", -1, source, name, message)
  end
  CancelEvent()
end)

--/me Command
RegisterCommand('me', function(source, args, user)
  local name = GetPlayerName(source)
  TriggerClientEvent("sendProximityMessageMe", -1, source, name, table.concat(args, " "))
end, false)

--/do Command
RegisterCommand('do', function(source, args, user)
  local name = GetPlayerName(source)
  TriggerClientEvent("sendProximityMessageDo", -1, source, name, table.concat(args, " "))
end, false)

--/gme Command
RegisterCommand('gme', function(source, args, user)
TriggerClientEvent('chatMessage', -1, "^3^*GLOBAL ME | ^7" .. GetPlayerName(source) .. "^r", {128, 128, 128}, table.concat(args, " "))
end, false)

--/twt Command
RegisterCommand('twt', function(source, args, user)
TriggerClientEvent('chatMessage', -1, "^0^*[^4Twotter^0] (^5@" .. GetPlayerName(source) .. "^0)^r", {30, 144, 255}, table.concat(args, " "))
end, false)

--/ooc Command
RegisterCommand('ooc', function(source, args, user)
TriggerClientEvent('chatMessage', -1, "^*OOC | " .. GetPlayerName(source) .. "^r", {128, 128, 128}, table.concat(args, " "))
end, false)

--/ad Command
RegisterCommand('ad', function(source, args, user)
--// IF YOU WANT TO USE A DIFFRENT ADVERT STYLE REMOVE THE TWO '--' BEFORE A LINE AND PUT TWO '--' BEFORE THE OLD LINE \\--
--TriggerClientEvent('chatMessage', -1, "^0^*[^1ADVERT^0] " .. GetPlayerName(source), {255,215,0}, table.concat(args, " ")) --ADVERT WITH USERNAME
--TriggerClientEvent('chatMessage', -1, "^0^*[^1ADVERT^0] (^1@" .. GetPlayerName(source) .. "^0)^r", {255,215,0}, table.concat(args, " ")) --ADVERT WITH TWITTER STYLE USERNAME HANDLE
TriggerClientEvent('chatMessage', -1, "^0^*[^1ADVERT^0]^r", {255,215,0}, table.concat(args, " ")) --ADVERT WITH NO USERS IDENTIFIER
end, false)

--/darkweb Command
RegisterCommand('darkweb', function(source, args, user)
TriggerClientEvent('chatMessage', -1, "^*[^*Dark Web] (@^*Anonymous)^r", {0, 0, 0}, table.concat(args, " "))
end, false)

--String Splitting
function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end
