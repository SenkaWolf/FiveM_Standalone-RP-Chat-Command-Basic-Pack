--					 ==========================
--					 Copyright © 2020 SenkaWolf
--					 ==========================

--/dv Command
RegisterServerEvent("chatMessage")
AddEventHandler('chatMessage', function(source, n, message)

	if message == "/delveh" or message == "/dv" then
	
		CancelEvent()
		TriggerClientEvent("DVCommand", source)
		
	end
end)
