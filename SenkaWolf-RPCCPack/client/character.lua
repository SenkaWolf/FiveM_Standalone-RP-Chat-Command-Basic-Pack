
--/hu Command
RegisterNetEvent("THU")
AddEventHandler("THU", function()
	
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
local HUKToggle = false

RegisterNetEvent("HandsupKnees")
AddEventHandler("HandsupKnees", function()
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
RegisterNetEvent('play');
RegisterNetEvent('show');
RegisterNetEvent('point');

-- Supported Emotes
local emotes = {}
emotes['cop'] = {name = 'cop', anim = 'WORLD_HUMAN_COP_IDLES'}
emotes['binoculars'] = {name = 'binoculars', anim = 'WORLD_HUMAN_BINOCULARS'}
emotes['cheer'] = {name = 'cheer', anim = 'WORLD_HUMAN_CHEERING'}
emotes['coffee'] = {name = 'coffe', anim = 'WORLD_HUMAN_DRINKING'}
emotes['smoke'] = {name = 'smoke', anim = 'WORLD_HUMAN_SMOKING'}
emotes['film'] = {name = 'film', anim = 'WORLD_HUMAN_MOBILE_FILM_SHOCKING'}
emotes['plant'] = {name = 'plant', anim = 'WORLD_HUMAN_GARDENER_PLANT'}
emotes['guard'] = {name = 'guard', anim = 'WORLD_HUMAN_GUARD_STAND'}
emotes['hammer'] = {name = 'hammer', anim = 'WORLD_HUMAN_HAMMERING'}
emotes['hangout'] = {name = 'hangout', anim = 'WORLD_HUMAN_HANG_OUT_STREET'}
emotes['hiker'] = {name = 'hiker', anim = 'WORLD_HUMAN_HIKER_STANDING'}
emotes['statue'] = {name = 'statue', anim = 'WORLD_HUMAN_HUMAN_STATUE'}
emotes['jog'] = {name = 'jog', anim = 'WORLD_HUMAN_JOG_STANDING'}
emotes['lean'] = {name = 'lean', anim = 'WORLD_HUMAN_LEANING'}
emotes['flex'] = {name = 'flex', anim = 'WORLD_HUMAN_MUSCLE_FLEX'}
emotes['camera'] = {name = 'camera', anim = 'WORLD_HUMAN_PAPARAZZI'}
emotes['sit'] = {name = 'sit', anim = 'WORLD_HUMAN_PICNIC'}
emotes['sitchair'] = {name = 'sitchair', anim = 'PROP_HUMAN_SEAT_CHAIR_MP_PLAYER'}
emotes['hoe'] = {name = 'hoe', anim = 'WORLD_HUMAN_PROSTITUTE_HIGH_CLASS'}
emotes['hoe2'] = {name = 'hoe2', anim = 'WORLD_HUMAN_PROSTITUTE_LOW_CLASS'}
emotes['pushups'] = {name = 'pushups', anim = 'WORLD_HUMAN_PUSH_UPS'}
emotes['situps'] = {name = 'situps', anim = 'WORLD_HUMAN_SIT_UPS'}
emotes['fish'] = {name = 'fish', anim = 'WORLD_HUMAN_STAND_FISHING'}
emotes['impatient'] = {name = 'impatient', anim = 'WORLD_HUMAN_STAND_IMPATIENT'}
emotes['mobile'] = {name = 'mobile', anim = 'WORLD_HUMAN_STAND_MOBILE'}
emotes['diggit'] = {name = 'diggit', anim = 'WORLD_HUMAN_STRIP_WATCH_STAND'}
emotes['sunbath'] = {name = 'sunbath', anim = 'WORLD_HUMAN_SUNBATHE_BACK'}
emotes['sunbath2'] = {name = 'sunbath2', anim = 'WORLD_HUMAN_SUNBATHE'}
emotes['weld'] = {name = 'weld', anim = 'WORLD_HUMAN_WELDING'}
emotes['yoga'] = {name = 'yoga', anim = 'WORLD_HUMAN_YOGA'}
emotes['kneel'] = {name = 'kneel', anim = 'CODE_HUMAN_MEDIC_KNEEL'}
emotes['crowdcontrol'] = {name = 'crowdcontrol', anim = 'CODE_HUMAN_POLICE_CROWD_CONTROL'}
emotes['investigate'] = {name = 'investigate', anim = 'CODE_HUMAN_POLICE_INVESTIGATE'}
emotes['clipboard'] = {name = 'clipboard', anim = 'WORLD_HUMAN_CLIPBOARD'}
emotes['drill'] = {name = 'drill', anim = 'WORLD_HUMAN_CONST_DRILL'}
emotes['pot'] = {name = 'pot', anim = 'WORLD_HUMAN_SMOKING_POT'}
emotes['medic'] = {name = 'medic', anim = 'CODE_HUMAN_MEDIC_TEND_TO_DEAD'}
emotes['notes'] = {name = 'notes', anim = 'CODE_HUMAN_MEDIC_TIME_OF_DEATH'}
emotes['party'] = {name = 'party', anim = 'WORLD_HUMAN_PARTYING'}
emotes['traffic'] = {name = 'traffic', anim = 'WORLD_HUMAN_CAR_PARK_ATTENDANT'}
emotes['notepad'] = {name = 'notepad', anim = 'CODE_HUMAN_MEDIC_TIME_OF_DEATH'}
emotes['weed'] = {name = 'weed', anim = 'WORLD_HUMAN_SMOKING_POT'}


playing_emote = false;

local Keys = { ["W"] = 32, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["H"] = 74}

AddEventHandler('play', function(name)
	if emotes[name] then
		ped = GetPlayerPed(-1);	
		if ped then
			if playing_emote == false then
				if emotes[name].name == "sitchair" then
					pos = GetEntityCoords(ped);
					head = GetEntityHeading(ped);
					TaskStartScenarioAtPosition(ped, emotes[name].anim, pos['x'], pos['y'], pos['z'] - 1, head, 0, 0, false);
				else
					TaskStartScenarioInPlace(ped, emotes[name].anim, 0, true);
				end
				playing_emote = true;

			end
		end
	end
end)


AddEventHandler('point', function()

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

AddEventHandler('show', function()
	TriggerEvent('chatMessage', "^6^*RPCCPack Emotes", {255, 0, 0}, "^1Usage: /emote [name]");
	local emoteslist = ""
	for k in pairs(emotes) do
		emoteslist = k .. ", ".. emoteslist
	end
	TriggerEvent('chatMessage', "", {255, 255, 255}, emoteslist);
end)


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