--					 ==========================
--					 Copyright © 2020 SenkaWolf
--					 ==========================

Config = {}

-- //[TOGGLE FEATURES]\\ --
EnableAFK = true -- Set to true if you want to enable AFK kick.
EnableChatCommand = true -- Set to true if you want to be able to use Proximity Chat, /ooc, /me, /gme, /do, /ad, /twt and /darkweb.
EnableDVCommand = true -- Set to true if you want the /dv command to work.
EnableDiscordCommand = false -- Set to true if you want the /dc command to work. Define the Discord link in the Information Commands section below.
EnableTeamSpeakCommand = false -- Set to true if you want the /ts command to work. Define the TeamSpeak link in the Information Commands section below.
EnableWebsiteCommand = false -- Set to true if you want the /web command to work. Define the URL in the Information Commands section below.

-------------------------------------------------------------------------------

-- //[SETTINGS]\\ --

-- Server Management
SecondsUntilKick = 1800 -- AFK Kick Time Limit In Seconds
KickWarning = true -- Warn players if 3/4 of the Time Limit ran up

-- LEO/EMS Commands (Coming Soon)
JailPassword = "leo" --Password needed to use the /jail and /unjain command. Only give this to LEO's.
JailMaxSecs = 1000

-- Information Commands
DiscordLink = 'https://discord.gg/invitecodehere'
TeamSpeakLink = 'ts.domainhere.com'
WebsiteLink = 'https://www.domainhere.com'

-- /ad Command Output Styles
-- 1 = Advert with Steam name. E.g "[ADVERT]SteamName: YOUR TEXT"
-- 2 = Advert with twitter style Steam handle name. E.g "[ADVERT](@SteamName): YOUR TEXT"
-- 3 = Advert with no users identifier. E.g "[ADVERT]: YOUR TEXT"
AdStyle = 3

-------------------------------------------------------------------------------

-- //[EMOTE LIST]\\ --
-- You can add more by copying one of the below lines and using the follow link to pick a animation https://pastebin.com/6mrYTdQv
Emotes = {}
Emotes['cop'] = {name = 'cop', anim = 'WORLD_HUMAN_COP_IDLES'}
Emotes['binoculars'] = {name = 'binoculars', anim = 'WORLD_HUMAN_BINOCULARS'}
Emotes['cheer'] = {name = 'cheer', anim = 'WORLD_HUMAN_CHEERING'}
Emotes['coffee'] = {name = 'coffe', anim = 'WORLD_HUMAN_DRINKING'}
Emotes['smoke'] = {name = 'smoke', anim = 'WORLD_HUMAN_SMOKING'}
Emotes['film'] = {name = 'film', anim = 'WORLD_HUMAN_MOBILE_FILM_SHOCKING'}
Emotes['snap'] = {name = 'snap', anim = 'WORLD_HUMAN_MOBILE_FILM_SHOCKING'}
Emotes['plant'] = {name = 'plant', anim = 'WORLD_HUMAN_GARDENER_PLANT'}
Emotes['guard'] = {name = 'guard', anim = 'WORLD_HUMAN_GUARD_STAND'}
Emotes['hammer'] = {name = 'hammer', anim = 'WORLD_HUMAN_HAMMERING'}
Emotes['hangout'] = {name = 'hangout', anim = 'WORLD_HUMAN_HANG_OUT_STREET'}
Emotes['hiker'] = {name = 'hiker', anim = 'WORLD_HUMAN_HIKER_STANDING'}
Emotes['statue'] = {name = 'statue', anim = 'WORLD_HUMAN_HUMAN_STATUE'}
Emotes['jog'] = {name = 'jog', anim = 'WORLD_HUMAN_JOG_STANDING'}
Emotes['lean'] = {name = 'lean', anim = 'WORLD_HUMAN_LEANING'}
Emotes['flex'] = {name = 'flex', anim = 'WORLD_HUMAN_MUSCLE_FLEX'}
Emotes['camera'] = {name = 'camera', anim = 'WORLD_HUMAN_PAPARAZZI'}
Emotes['sit'] = {name = 'sit', anim = 'WORLD_HUMAN_PICNIC'}
Emotes['sitchair'] = {name = 'sitchair', anim = 'PROP_HUMAN_SEAT_CHAIR_MP_PLAYER'}
Emotes['hoe'] = {name = 'hoe', anim = 'WORLD_HUMAN_PROSTITUTE_HIGH_CLASS'}
Emotes['hoe2'] = {name = 'hoe2', anim = 'WORLD_HUMAN_PROSTITUTE_LOW_CLASS'}
Emotes['pushups'] = {name = 'pushups', anim = 'WORLD_HUMAN_PUSH_UPS'}
Emotes['situps'] = {name = 'situps', anim = 'WORLD_HUMAN_SIT_UPS'}
Emotes['fish'] = {name = 'fish', anim = 'WORLD_HUMAN_STAND_FISHING'}
Emotes['impatient'] = {name = 'impatient', anim = 'WORLD_HUMAN_STAND_IMPATIENT'}
Emotes['mobile'] = {name = 'mobile', anim = 'WORLD_HUMAN_STAND_MOBILE'}
Emotes['diggit'] = {name = 'diggit', anim = 'WORLD_HUMAN_STRIP_WATCH_STAND'}
Emotes['sunbath'] = {name = 'sunbath', anim = 'WORLD_HUMAN_SUNBATHE_BACK'}
Emotes['lay'] = {name = 'lay', anim = 'WORLD_HUMAN_SUNBATHE_BACK'}
Emotes['sunbath2'] = {name = 'sunbath2', anim = 'WORLD_HUMAN_SUNBATHE'}
Emotes['weld'] = {name = 'weld', anim = 'WORLD_HUMAN_WELDING'}
Emotes['yoga'] = {name = 'yoga', anim = 'WORLD_HUMAN_YOGA'}
Emotes['kneel'] = {name = 'kneel', anim = 'CODE_HUMAN_MEDIC_KNEEL'}
Emotes['crowdcontrol'] = {name = 'crowdcontrol', anim = 'CODE_HUMAN_POLICE_CROWD_CONTROL'}
Emotes['investigate'] = {name = 'investigate', anim = 'CODE_HUMAN_POLICE_INVESTIGATE'}
Emotes['clipboard'] = {name = 'clipboard', anim = 'WORLD_HUMAN_CLIPBOARD'}
Emotes['drill'] = {name = 'drill', anim = 'WORLD_HUMAN_CONST_DRILL'}
Emotes['pot'] = {name = 'pot', anim = 'WORLD_HUMAN_SMOKING_POT'}
Emotes['medic'] = {name = 'medic', anim = 'CODE_HUMAN_MEDIC_TEND_TO_DEAD'}
Emotes['notes'] = {name = 'notes', anim = 'CODE_HUMAN_MEDIC_TIME_OF_DEATH'}
Emotes['party'] = {name = 'party', anim = 'WORLD_HUMAN_PARTYING'}
Emotes['traffic'] = {name = 'traffic', anim = 'WORLD_HUMAN_CAR_PARK_ATTENDANT'}
Emotes['notepad'] = {name = 'notepad', anim = 'CODE_HUMAN_MEDIC_TIME_OF_DEATH'}
Emotes['weed'] = {name = 'weed', anim = 'WORLD_HUMAN_SMOKING_POT'}
Emotes['text'] = {name = 'text', anim = 'EAR_TO_TEXT'}
Emotes['wash'] = {name = 'wash', anim = 'WORLD_HUMAN_MAID_CLEAN'}
Emotes['clean'] = {name = 'clean', anim = 'WORLD_HUMAN_MAID_CLEAN'}
