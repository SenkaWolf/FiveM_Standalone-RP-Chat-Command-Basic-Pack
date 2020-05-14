--					 ==========================
--					 Copyright © 2020 SenkaWolf
--					 ==========================

--/dv Command
if EnableDVCommand == true then
	RegisterServerEvent("chatMessage")
	AddEventHandler('chatMessage', function(source, n, message)

		if message == "/delveh" or message == "/dv" then
		
			CancelEvent()
			TriggerClientEvent("DVCommand", source)
			
		end
	end)
end