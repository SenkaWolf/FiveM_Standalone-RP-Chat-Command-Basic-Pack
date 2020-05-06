
--/dv Command
RegisterServerEvent("chatMessage")
AddEventHandler('chatMessage', function(source, n, message)

	if message == "/delveh" or message == "/dv" then
	
		CancelEvent()
		TriggerClientEvent("delveh", source)
		
	end
end)
