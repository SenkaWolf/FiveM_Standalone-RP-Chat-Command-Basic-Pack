--					 ==========================
--					 Copyright © 2020 SenkaWolf
--					 ==========================

--/hu Command
Citizen.CreateThread(function()

		TriggerEvent('chat:addSuggestion', '/hu', 'Put your hands up.', {})

end)

RegisterNetEvent("HUCommand")
AddEventHandler("HUCommand", function()

	local playerPed = GetPlayerPed(-1)
	if DoesEntityExist(playerPed) then
		Citizen.CreateThread(function()
			RequestAnimDict("random@getawaydriver")
			while not HasAnimDictLoaded("random@getawaydriver") do
				Citizen.Wait(100)
			end

			if IsEntityPlayingAnim(playerPed, "random@getawaydriver", "idle_2_hands_up", 3) then
				ClearPedSecondaryTask(playerPed)
			else
				TaskPlayAnim(playerPed, "random@getawaydriver", "idle_2_hands_up", 8.0, -8, -1, 50, 0, 0, 0, 0)
			end
		end)
	end
end)

-------------------------------------------------------------------------------

--/huk Command
Citizen.CreateThread(function()

		TriggerEvent('chat:addSuggestion', '/huk', 'Put your hands up and kneel.', {})

end)

local HUKToggle = false

RegisterNetEvent("HUKCommand")
AddEventHandler("HUKCommand", function()
	HUKToggle = not HUKToggle
	ToggleHUK(HUKToggle)
end)

function ToggleHUK(toggle)

local lPed = PlayerPedId()

if(toggle) then

		RequestAnimDict("random")
		RequestAnimDict("random@getawaydriver")
		while not HasAnimDictLoaded("random@getawaydriver") do
			Citizen.Wait(100)
		end

		TaskPlayAnim(lPed, "random@getawaydriver", "idle_2_hands_up", 1.0, -1, -1, 0, 0, 0, 0, 0)
			Citizen.Wait(3500)
			TaskPlayAnim(lPed, "random@getawaydriver", "idle_a", 1.0, -1, -1, 1, 0, 0, 0, 0)
			SetEnableHandcuffs(lPed, true)

	else
		if IsEntityPlayingAnim(lPed, "random@getawaydriver", "idle_a", 3) and IsEntityPlayingAnim(lPed, "mp_arresting", "idle", 3) then
			StopAnimTask(lPed, "random@getawaydriver", "idle_a", 3)
			StopAnimTask(lPed, "random@getawaydriver", "idle_2_hands_up", 3)
			TaskPlayAnim(lPed, "random@getawaydriver", "hands_up_2_idle", 1.0, -1, -1, 0, 0, 0, 0, 0)
			ClearPedSecondaryTask(lPed)
			TaskPlayAnim(lPed, "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
			SetEnableHandcuffs(lPed, true)

			elseif IsEntityPlayingAnim(lPed, "random@getawaydriver", "idle_a", 3) then
			StopAnimTask(lPed, "random@getawaydriver", "idle_a", 3)
			StopAnimTask(lPed, "random@getawaydriver", "idle_2_hands_up", 3)
			TaskPlayAnim(lPed, "random@getawaydriver", "hands_up_2_idle", 1.0, -1, -1, 0, 0, 0, 0, 0)
			ClearPedSecondaryTask(lPed)
			SetEnableHandcuffs(lPed, false)

		end
	end
end

-------------------------------------------------------------------------------

--/emote Command
Citizen.CreateThread(function()

    TriggerEvent('chat:addSuggestion', '/emotes', 'Lists emotes which you can use with the /emote command.', {})

    TriggerEvent('chat:addSuggestion', '/emote', 'Perform a emote.', {
		  { name="Emote Name", help="Emote name which you can see the list by doing /emotes."}
	  })

end)

RegisterNetEvent('PlayEmoteCommand');
RegisterNetEvent('EmoteListCommand');
RegisterNetEvent('PointCommand');

playing_emote = false;

local Keys = { ["W"] = 32, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["H"] = 74}

AddEventHandler('PlayEmoteCommand', function(name)
	if Emotes[name] then
		ped = GetPlayerPed(-1);
		if ped then
			if playing_emote == false then
				if Emotes[name].name == "sitchair" then
					pos = GetEntityCoords(ped);
					head = GetEntityHeading(ped);
					TaskStartScenarioAtPosition(ped, Emotes[name].anim, pos['x'], pos['y'], pos['z'] - 1, head, 0, 0, false);
				else
					TaskStartScenarioInPlace(ped, Emotes[name].anim, 0, true);
				end
				playing_emote = true;

			end
		end
	end
end)

--/point Command
AddEventHandler('PointCommand', function()

	pointing = not pointing
	RequestAnimDict("anim@mp_point")
	Wait(1000)

	if pointing then
	Citizen.Wait(10)
	ped = GetPlayerPed(-1);
	Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
	Citizen.Trace("Pointing")
	else
		ClearPedTasks(ped);
	end
end)

--/emotes Command
AddEventHandler('EmoteListCommand', function()
	TriggerEvent('chatMessage', "^6^*RPCCPack Emotes", {255, 0, 0}, "^1Usage: /emote [name]");
	local emoteslist = ""
	for k in pairs(Emotes) do
		emoteslist = k .. ", ".. emoteslist
	end
	TriggerEvent('chatMessage', "", {255, 255, 255}, emoteslist);
end)

--Cancel emote when walk
Citizen.CreateThread(function()
	while true do
                Citizen.Wait(10)
		if playing_emote == true then
			if (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
				ClearPedTasks(ped);
				playing_emote = false;
			end
		end

			Citizen.Wait(0)
      end
end)

-------------------------------------------------------------------------------

--/crouch Command
Citizen.CreateThread(function()

    TriggerEvent('chat:addSuggestion', '/crouch', 'Put your character into a crouching position.', {})

end)

local cr = false
local inf = "move_ped_crouched"
RegisterNetEvent("CrouchCommand")
AddEventHandler("CrouchCommand", function()

	local pP = GetPlayerPed(-1)
	if DoesEntityExist(pP) then
		Citizen.CreateThread(function()
			RequestAnimSet(inf)
			while not HasAnimSetLoaded(inf) do
				Citizen.Wait(100)
			end
			if cr then
				ResetPedMovementClipset(pP, 0)
			else
				SetPedMovementClipset(pP, inf, 0.25)
			end
			cr = not cr
		end)
	end
end)
