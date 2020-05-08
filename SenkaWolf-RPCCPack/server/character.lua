--					 ==========================
--					 Copyright © 2020 SenkaWolf
--					 ==========================

--/hu Command
-- Cancel all commands being sent to class
AddEventHandler("chatMessage", function(source, name, message)
	if (startswith(message, "/")) then
		local cmd = stringsplit(message, " ")
		if cmd[1] == "/hu" then
			CancelEvent()
			TriggerClientEvent("HUCommand", source)
		end
	end
end)

-------------------------------------------------------------------------------

--/huk Command
RegisterServerEvent("chatMessage")
AddEventHandler("chatMessage", function(source, n, message)
	if message == "/huk" then
		CancelEvent()
		TriggerClientEvent("HUKCommand", source)
	end
end)

-------------------------------------------------------------------------------

--/emote Command
RegisterServerEvent("chatMessage")
AddEventHandler('chatMessage', function(source, n, message)
	msg = stringsplit(message, " ")
	
	if msg[1] == "/emotes" then
		CancelEvent()
		TriggerClientEvent("EmoteListCommand", source)		
	elseif msg[1] == "/emote" then
		CancelEvent()
		TriggerClientEvent("PlayEmoteCommand", source, msg[2])
		
	elseif msg[1] == "/point" then
		CancelEvent()
		TriggerClientEvent("PointCommand", source)
	end
end)

-------------------------------------------------------------------------------

--/crouch Command
-- Cancel all commands being sent to class
AddEventHandler("chatMessage", function(source, name, message)
	if (startswith(message, "/")) then
		local cmd = stringsplit(message, " ")
		if cmd[1] == "/crouch" then
			CancelEvent()
			TriggerClientEvent("CrouchCommand", source)
		end
	end
end)

-------------------------------------------------------------------------------

--Used in /hu, /emote & /crouch

function startswith(String, Start)
	return string.sub(String,1,string.len(Start))==Start
end

--String splits by the separator.
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