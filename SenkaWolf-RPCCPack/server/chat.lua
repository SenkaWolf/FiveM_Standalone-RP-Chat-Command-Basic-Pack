  AddEventHandler('chatMessage', function(source, name, message)
      if string.sub(message, 1, string.len("/")) ~= "/" then
          local name = GetPlayerName(source)
		TriggerClientEvent("sendProximityMessage", -1, source, name, message)
      end
      CancelEvent()
  end)
  
  RegisterCommand('me', function(source, args, user)
      local name = GetPlayerName(source)
      TriggerClientEvent("sendProximityMessageMe", -1, source, name, table.concat(args, " "))
  end, false)

  RegisterCommand('do', function(source, args, user)
      local name = GetPlayerName(source)
      TriggerClientEvent("sendProximityMessageDo", -1, source, name, table.concat(args, " "))
  end, false)

  RegisterCommand('twt', function(source, args, user)
  	TriggerClientEvent('chatMessage', -1, "^0^*[^4Twotter^0] (^5@" .. GetPlayerName(source) .. "^0)^r", {30, 144, 255}, table.concat(args, " "))
  end, false)

  RegisterCommand('ooc', function(source, args, user)
  	TriggerClientEvent('chatMessage', -1, "^*OOC | " .. GetPlayerName(source) .. "^r", {128, 128, 128}, table.concat(args, " "))
  end, false)

  RegisterCommand('ad', function(source, args, user)
	--// IF YOU WANT TO USE A DIFFRENT ADVERT STYLE REMOVE THE TWO '--' BEFORE A LINE AND PUT TWO '--' BEFORE THE OLD LINE \\--
    --TriggerClientEvent('chatMessage', -1, "^0^*[^1ADVERT^0] " .. GetPlayerName(source), {255,215,0}, table.concat(args, " ")) --ADVERT WITH USERNAME
  	--TriggerClientEvent('chatMessage', -1, "^0^*[^1ADVERT^0] (^1@" .. GetPlayerName(source) .. "^0)^r", {255,215,0}, table.concat(args, " ")) --ADVERT WITH TWITTER STYLE USERNAME HANDLE
	TriggerClientEvent('chatMessage', -1, "^0^*[^1ADVERT^0]^r", {255,215,0}, table.concat(args, " ")) --ADVERT WITH NO USERS IDENTIFIER
  end, false)

  RegisterCommand('darkweb', function(source, args, user)
  	TriggerClientEvent('chatMessage', -1, "^*[^*Dark Web] (@^*Anonymous)^r", {0, 0, 0}, table.concat(args, " "))
  end, false)

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
