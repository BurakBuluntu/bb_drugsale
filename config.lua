-- BB Scripts Workshop

-- Developer: Burak Buluntu

-- IF YOU HAVE ANY PROBLEM OR DO YOU NEED HELP PLS COME TO MY DISCORD SERVER AND CREATE A TICKET
-- IF YOU DONT HAVE ANY PROBLEM YET AGAIN COME TO MY DISCORD :)
-- https://discord.gg/mNhyHqtwcp

--- GENERAL SETTINGS ---
BB = {}

BB.Framework = "qb" -- qb / oldqb | qb = export system | oldqb = triggerevent system
BB.ShopName = "JOHN'S SHOP"

BB.Allow_Join_Exit_Area_Message = true -- Activates the message that you have entered the area, left the area.
BB.Entered_Area_Distance = 50.0

--- MARKER SETTINGS ---
BB.Call_Door_Key = 38 -- [E]
BB.Call_Door_Marker_Coords = vector3(-1108.46, -1643.31, 4.6405-1)
BB.Call_Door_Marker_Coords_Heading = 120.0
BB.Marker_Type = 6
BB.Marker_Size = vector3(1.0, 1.0, 1.0)

--- NPC SETTINGS ---
BB.Npc_Walk_Coords = vector3(-1108.01, -1642.63, 4.6405)
BB.Npc_Walk_Coords_Heading = 320.0
BB.Player_Walk_Coords = vector3(-1107.44, -1641.10, 4.6405)
BB.Player_Heading = 150.0
BB.Wait_Player_Walk_Time = 2600 -- 1000 = 1 second

--- POLICE SETTINGS ---
BB.Police_Job_Name = "police"
BB.Police_2_Job_Name = "sheriff"
BB.Police_3_Job_Name = "swat"
BB.Police_4_Job_Name = "fbi"
BB.Police_5_Job_Name = "soldier"

BB.AllowPoliceBlockedArea = true -- true or false
BB.PoliceBlockedArea_Time = 1800 -- 60 x 30 = 1800 = 30 Minutes
BB.AllowOnDuty = true  -- true or false
BB.BlockArea_Police_Grade = 3 -- AllowPoliceBlockedArea must be turned on before you can use it
BB.BlockedArea_Animation_1_Time = "30000" -- TIME 30 Second = 30000
BB.BlockedArea_Animation_2_Time = "30000" -- TIME 30 Second = 30000
BB.BlockedArea_Animation_3_Time = "30000" -- TIME 30 Second = 30000

--- POLICE BLOCKED OBJECT SETTINGS ---
BB.LSPD_Blocked_Prop_Name = "prop_mp_barrier_02"
BB.LSPD_Blocked_Obj_Coords_1 = vector3(-1108.59, -1643.39, 4.6405-1)
BB.LSPD_Blocked_Obj_Coords_1_Rotate = vector3(0.0, 0.0, 120.0)
BB.LSPD_Blocked_Obj_Coords_2 = vector3(-1108.59, -1643.39, 4.6405)
BB.LSPD_Blocked_Obj_Coords_2_Rotate = vector3(0.0, 0.0, 120.0)

--- DISCORD LOG SETTINGS ---
BB.DiscordLog = true
BB.DiscordWebhook = "https://discord.com/api/webhooks/XXXXXXX/XXXXXXX" -- bot's discord webhook url
BB.DiscordAvatar = "https://cdn.discordapp.com/attachments/XXXXXXXXX/XXXXXX/logo.png" -- bot's avatar
--- DEAD SETTINGS ---
BB.AutoAreaExit_IsDead = true
BB.AmbulanceJobTrigger = 'esx_ambulancejob:setDeathStatus' -- hospital:server:SetDeathStatus

--- GENERAL BLIP SETTINGS ---
BB.BlipSprite = 419 -- FLAG BLIP https://docs.fivem.net/docs/game-references/blips/
BB.BlipScale = 0.7
BB.Blip_Background_Transparent_Value = 75  --        1 - 100
BB.BlipCoords_Circle_Radius = 70.0

BB.Blip_Empty_Text = "None"
BB.Blip_Empty_Colour = 4    --WHITE

BB.Blip_LSPD_Job_Name = "gang1"
BB.Blip_LSPD_Colour = 3     --BLUE

BB.Blip_Gang1_Job_Name = "gang1"
BB.Blip_Gang1_Text = "Grove"
BB.Blip_Gang1_Colour = 2    -- GREEN

BB.Blip_Gang2_Job_Name = "gang2"
BB.Blip_Gang2_Text = "Vagos"
BB.Blip_Gang2_Colour = 5    -- YELLOW

BB.Blip_Gang3_Job_Name = "gang3"
BB.Blip_Gang3_Text = "Ballas"
BB.Blip_Gang3_Colour = 27    -- PURPLE

BB.Blip_Gang4_Job_Name = "gang4"
BB.Blip_Gang4_Text = "Lost MC"
BB.Blip_Gang4_Colour = 39    -- Light Gray

BB.Blip_Gang5_Job_Name = "gang5"
BB.Blip_Gang5_Text = "Aztecas"
BB.Blip_Gang5_Colour = 32    -- LIGHT BLUE

BB.Blip_Gang6_Job_Name = "gang6"
BB.Blip_Gang6_Text = "Families"
BB.Blip_Gang6_Colour = 43    -- LIGHT GREEN

BB.Blip_Gang7_Job_Name = "gang7"
BB.Blip_Gang7_Text = "Marabunta Grande"
BB.Blip_Gang7_Colour = 54    -- DARK BLUE

BB.Blip_Gang8_Job_Name = "gang8"
BB.Blip_Gang8_Text = "Triads"
BB.Blip_Gang8_Colour = 59    -- RED

BB.Blip_Gang9_Job_Name = "gang9"
BB.Blip_Gang9_Text = "Yakuza"
BB.Blip_Gang9_Colour = 66    -- YELLOW ORANGE

BB.Blip_Gang10_Job_Name = "gang10"
BB.Blip_Gang10_Text = "Best Familes"
BB.Blip_Gang10_Colour = 56    -- BROWN

--- UI SETTINGS ---
BB.Items = {
    [1] = {
        label = "Weed",
        name = "weed",
        price = "15000",
        img = "weed.png"
    },
    [2] = {
        label = "Cocain",
        name = "cocain",
        price = "10000",
        img = "cocaine.png"
    },
    [3] = {
        label = "Methamphetamine",
        name = "meth",
        price = "15000",
        img = "metafetamin.png"
    },
	--[[
	[4] = {
        label = "Madde X",
        name = "maddex",
        price = "12500",
        img = "maddex.png"
    },
	[5] = {
        label = "Madde A",
        name = "maddea",
        price = "10000",
        img = "maddea.png"
    },
	--]]
}