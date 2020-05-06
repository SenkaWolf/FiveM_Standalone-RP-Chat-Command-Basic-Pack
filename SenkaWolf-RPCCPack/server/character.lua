
--/hu Command
-- Cancel all commands being sent to class
AddEventHandler("chatMessage", function(source, name, message)
	if (startswith(message, "/")) then
		local cmd = stringsplit(message, " ")
		if cmd[1] == "/hu" then
			CancelEvent()
			TriggerClientEvent("THU", source)
		end
	end
end)

function startswith(String, Start)
	return string.sub(String,1,string.len(Start))==Start
end

-------------------------------------------------------------------------------

--/huk Command
RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/huk" then
		CancelEvent()
		TriggerClientEvent("HandsupKnees", source)
	end
end)

-------------------------------------------------------------------------------

--/emote Command
RegisterServerEvent("chatMessage")
AddEventHandler('chatMessage', function(source, n, message)
	msg = stringsplit(message, " ")
	
	if msg[1] == "/emotes" then
		CancelEvent()
		TriggerClientEvent("show", source)		
	elseif msg[1] == "/emote" then
		CancelEvent()
		TriggerClientEvent("play", source, msg[2])
		
	elseif msg[1] == "/point" then
		CancelEvent()
		TriggerClientEvent("point", source)
	end
end)

-------------------------------------------------------------------------------

--Used in /hu and /emote
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