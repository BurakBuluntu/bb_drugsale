if BB.Framework == "qb" then
    QBCore = exports['qb-core']:GetCoreObject()
elseif BB.Framework == "oldqb" then 
    QBCore = nil
end

local PlayerData = {}

Citizen.CreateThread(function()
	if BB.Framework == "qb" then
		while QBCore == nil do
            Citizen.Wait(200)
			QBCore = exports['qb-core']:GetCoreObject()
        end
	elseif BB.Framework == "oldqb" then
		while QBCore == nil do
            TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
            Citizen.Wait(200)
        end
    end
	Citizen.Wait(50)
	PlayerData = QBCore.Functions.GetPlayerData()
	TriggerEvent("bb-drugsale:ceteblipac")
end)

local Police_Job_Name, Police_2_Job_Name, Police_3_Job_Name, Police_4_Job_Name, Police_5_Job_Name= BB.Police_Job_Name, BB.Police_2_Job_Name, BB.Police_3_Job_Name, BB.Police_4_Job_Name, BB.Police_5_Job_Name
local Gang1_Job_Name, Gang2_Job_Name, Gang3_Job_Name, Gang4_Job_Name, Gang5_Job_Name, Gang6_Job_Name, Gang7_Job_Name, Gang8_Job_Name, Gang9_Job_Name, Gang10_Job_Name = BB.Blip_Gang1_Job_Name, BB.Blip_Gang2_Job_Name, BB.Blip_Gang3_Job_Name, BB.Blip_Gang4_Job_Name, BB.Blip_Gang5_Job_Name, BB.Blip_Gang6_Job_Name, BB.Blip_Gang7_Job_Name, BB.Blip_Gang8_Job_Name, BB.Blip_Gang9_Job_Name, BB.Blip_Gang10_Job_Name
local price = nil
local lspd_blocked_area = false
local joined_job = ''
local objectspawned = false
local isDeadStatus = false
local send_data = false
local isJoin = false
local area_coords = vector3(BB.Call_Door_Marker_Coords)

RegisterNetEvent('bb-drugsale:GetBlockedArea')
AddEventHandler('bb-drugsale:GetBlockedArea', function(blocked)
	lspd_blocked_area = blocked
	send_data = false
	pressed = false
end)

RegisterNetEvent('bb-drugsale:GetJoinedArea')
AddEventHandler('bb-drugsale:GetJoinedArea', function()
	if isJoin then
		send_data = false
		joined_job = PlayerData.job.name
		TriggerServerEvent('bb-drugsale:joined_area', "exit", joined_job)
		TriggerEvent('bb-drugsale:openmarker', false)
	end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
	PlayerData.job = job
end)

RegisterNetEvent("QBCore:Client:OnPlayerUnload", function()
	PlayerData = {}
	SetNuiFocus(false, false)
end)

RegisterNetEvent('bb-drugsale:setDeathStatus')
AddEventHandler('bb-drugsale:setDeathStatus', function(isDead)
    isDeadStatus = isDead
end)

Citizen.CreateThread(function()
    Citizen.Wait(5000)
    	while true do
		local sleep = 10000
			if not isDeadStatus then
				if not lspd_blocked_area then

					local ped_coords = GetEntityCoords(PlayerPedId())
					local distance = #(ped_coords - area_coords)

					if distance < BB.Entered_Area_Distance then
						sleep = 3000
						
						if PlayerData.job == nil then 
							PlayerData = QBCore.Functions.GetPlayerData() 
						end

						if not send_data then
							if PlayerData.job.name == Gang1_Job_Name or PlayerData.job.name == Gang2_Job_Name or PlayerData.job.name == Gang3_Job_Name or PlayerData.job.name == Gang4_Job_Name or 
							PlayerData.job.name == Gang5_Job_Name or PlayerData.job.name == Gang6_Job_Name or PlayerData.job.name == Gang7_Job_Name or PlayerData.job.name == Gang8_Job_Name or 
							PlayerData.job.name == Gang9_Job_Name or PlayerData.job.name == Gang10_Job_Name then
								send_data = true
								isJoin = true
								joined_job = PlayerData.job.name
								TriggerServerEvent('bb-drugsale:joined_area', "join", joined_job)
								TriggerEvent('bb-drugsale:openmarker', true)
						
							elseif (BB.AllowPoliceBlockedArea) and (PlayerData.job.name == Police_Job_Name or PlayerData.job.name == Police_Job_2_Name or PlayerData.job.name == Police_Job_3_Name or PlayerData.job.name == Police_Job_4_Name or PlayerData.job.name == Police_Job_5_Name) then
								if BB.AllowOnDuty then
									if PlayerData.job.onduty then
										send_data = true
										isJoin = true
										joined_job = Police_Job_Name
										TriggerServerEvent('bb-drugsale:joined_area', "join", joined_job)
										TriggerEvent('bb-drugsale:openmarker', true)
									end
								else
									send_data = true
									isJoin = true
									joined_job = Police_Job_Name
									TriggerServerEvent('bb-drugsale:joined_area', "join", joined_job)
									TriggerEvent('bb-drugsale:openmarker', true)
								end
							end
						end
					else
						if send_data then
							send_data = false
							isJoin = false
							TriggerServerEvent('bb-drugsale:joined_area', "exit", joined_job)
							sleep = 3000
						else
							sleep = 3000
						end
					end
				else
					sleep = 30000
					send_data = false
				end
			else
				sleep = 15000
			end
			Citizen.Wait(sleep)
		end
end)
local joined = false
local last_leader = "empty"
pressed = false

RegisterNetEvent('bb-drugsale:openmarker')
AddEventHandler('bb-drugsale:openmarker', function(toggle)
	
	while toggle do
		local sleep = 1000
		local ped_coords = GetEntityCoords(PlayerPedId())
		if send_data then
			
			if PlayerData.job == nil then 
				PlayerData = QBCore.Functions.GetPlayerData() 
			end
			
			local distance = #(ped_coords - area_coords)
			if distance <= 12.5 and pressed == false and not isDeadStatus then
				sleep = 500
				if distance <= 3.0 and pressed == false and not isDeadStatus then
					sleep = 2
					DrawMarker(BB.Marker_Type, BB.Call_Door_Marker_Coords.x, BB.Call_Door_Marker_Coords.y, BB.Call_Door_Marker_Coords.z, 0.0, 0.0, 360.0, 0.0, 0.0, 0.0, BB.Marker_Size, 50, 150, 50, 100)
					if not lspd_blocked_area and not isDeadStatus then
						if PlayerData.job.name == Police_Job_Name or PlayerData.job.name == Police_2_Job_Name or PlayerData.job.name == Police_3_Job_Name or PlayerData.job.name == Police_4_Job_Name or PlayerData.job.name == Police_5_Job_Name then
							QBCore.Functions.DrawText3D(BB.Call_Door_Marker_Coords.x, BB.Call_Door_Marker_Coords.y, BB.Call_Door_Marker_Coords.z+1, Lang:t("notify.doorText_LSPD"))
						else
							QBCore.Functions.DrawText3D(BB.Call_Door_Marker_Coords.x, BB.Call_Door_Marker_Coords.y, BB.Call_Door_Marker_Coords.z+1, Lang:t("notify.doorText"))
						end
						if IsControlJustReleased(0, BB.Call_Door_Key) and not pressed and not isDeadStatus then
							pressed = true
							local player = PlayerPedId()
							if (BB.AllowPoliceBlockedArea) and (PlayerData.job.name == Police_Job_Name or PlayerData.job.name == Police_Job_2_Name or PlayerData.job.name == Police_Job_3_Name or PlayerData.job.name == Police_Job_4_Name or PlayerData.job.name == Police_Job_5_Name) then
								if PlayerData.job.name == last_leader then
									if PlayerData.job.grade >= BB.BlockArea_Police_Grade then

									QBCore.Functions.Progressbar("call_door", Lang:t("notify.BlockedArea_Animation_1_Text"), BB.BlockedArea_Animation_1_Time, false, true, {
										disableMovement = true,
										disableCarMovement = true,
										disableMouse = false,
										disableCombat = true,
									}, {
										animDict = "timetable@jimmy@doorknock@",
										anim = "knockdoor_idle",
										
									}, {}, {}, function()
										--
										QBCore.Functions.Progressbar("call_door_2", Lang:t("notify.BlockedArea_Animation_2_Text"), BB.BlockedArea_Animation_2_Time, false, true, {
											disableMovement = true,
											disableCarMovement = true,
											disableMouse = false,
											disableCombat = true,
										}, {
											animDict = "missheistfbi3b_ig7",
											anim = "lift_fibagent_loop",
											
										}, {}, {}, function()
											--
											objectspawned = true

											QBCore.Functions.SpawnObject(BB.LSPD_Blocked_Prop_Name, {x = BB.LSPD_Blocked_Obj_Coords_1.x, y = BB.LSPD_Blocked_Obj_Coords_1.y, z = BB.LSPD_Blocked_Obj_Coords_1.z}, function(Police_Block_Object)
												SetEntityCoords(Police_Block_Object, BB.LSPD_Blocked_Obj_Coords_1.x, BB.LSPD_Blocked_Obj_Coords_1.y, BB.LSPD_Blocked_Obj_Coords_1.z)
												SetEntityRotation(Police_Block_Object, BB.LSPD_Blocked_Obj_Coords_1_Rotate.x, BB.LSPD_Blocked_Obj_Coords_1_Rotate.y, BB.LSPD_Blocked_Obj_Coords_1_Rotate.z)
												SetEntityAsMissionEntity(Police_Block_Object, true, true)
												SetModelAsNoLongerNeeded(BB.LSPD_Blocked_Prop_Name)
												FreezeEntityPosition(Police_Block_Object, true)
											end)

											QBCore.Functions.SpawnObject(BB.LSPD_Blocked_Prop_Name, {x = BB.LSPD_Blocked_Obj_Coords_2.x, y = BB.LSPD_Blocked_Obj_Coords_2.y, z = BB.LSPD_Blocked_Obj_Coords_2.z}, function(Police_Block_Object2)
												SetEntityCoords(Police_Block_Object2, BB.LSPD_Blocked_Obj_Coords_2.x, BB.LSPD_Blocked_Obj_Coords_2.y, BB.LSPD_Blocked_Obj_Coords_2.z)
												SetEntityRotation(Police_Block_Object2, BB.LSPD_Blocked_Obj_Coords_2_Rotate.x, BB.LSPD_Blocked_Obj_Coords_2_Rotate.y, BB.LSPD_Blocked_Obj_Coords_2_Rotate.z)
												SetEntityAsMissionEntity(Police_Block_Object2, true, true)
												SetModelAsNoLongerNeeded(BB.LSPD_Blocked_Prop_Name)
												FreezeEntityPosition(Police_Block_Object2, true)
											end)

											QBCore.Functions.Progressbar("call_door_3", Lang:t("notify.BlockedArea_Animation_3_Text"), BB.BlockedArea_Animation_3_Time, false, true, {
												disableMovement = true,
												disableCarMovement = true,
												disableMouse = false,
												disableCombat = true,
											}, {
												animDict = "amb@world_human_hammering@male@base",
												anim = "base",
												
											}, {}, {}, function()
												lspd_blocked_area = true
		
												ClearPedTasks(player)
												ClearPedTasksImmediately(player)

												TriggerServerEvent('bb-drugsale:joined_area', "exit", "all")
												TriggerEvent('bb-drugsale:openmarker', false)
												
											end, function() -- Cancel
												pressed = false
												ClearPedTasks(player)
												ClearPedTasksImmediately(player)
												DeleteObject(GetEntityModel(Police_Block_Object))
												DeleteObject(GetEntityModel(Police_Block_Object2))

												QBCore.Functions.Notify(Lang:t("notify.BlockedArea_Animation_Cancel_Text"), "error")
											end)
											--

										end, function() -- Cancel
											pressed = false
											ClearPedTasks(player)
											ClearPedTasksImmediately(player)

											DeleteObject(Police_Block_Object)
											DeleteObject(Police_Block_Object2)

											QBCore.Functions.Notify(Lang:t("notify.BlockedArea_Animation_Cancel_Text"), "error")
										end)
										--
									end, function() -- Cancel
										pressed = false
										ClearPedTasks(player)
										ClearPedTasksImmediately(player)

										QBCore.Functions.Notify(Lang:t("notify.BlockedArea_Animation_Cancel_Text"), "error")
									end)


									SetEntityHeading(player, BB.Call_Door_Marker_Coords_Heading)
									SetEntityCoords(player, BB.Call_Door_Marker_Coords)
									
									else
										pressed = false
										QBCore.Functions.Notify(Lang:t("notify.InsufficientGrade_Text"), "error")
									end
								else
									pressed = false
									QBCore.Functions.Notify(Lang:t("notify.AreaNotControlPolice_Text"), "error")
								end
							elseif PlayerData.job.name == last_leader then
								
								SetEntityHeading(player, BB.Call_Door_Marker_Coords_Heading)
								SetEntityCoords(player, BB.Call_Door_Marker_Coords)
								FreezeEntityPosition(player, true)
								RequestAndWaitDict("timetable@jimmy@doorknock@")
								Wait(1000)
								TaskPlayAnim(player, "timetable@jimmy@doorknock@" ,"knockdoor_idle" ,8.0, -8.0, -1, 0, 0, false, false, false )
								Wait(2000)
								FreezeEntityPosition(player, false)
								QBCore.Functions.Notify(Lang:t("notify.NPC_Text_1"), "success")
								Wait(500)
								TaskGoStraightToCoord(player, BB.Player_Walk_Coords, 1.0, 500)
								Wait(2000)
								FreezeEntityPosition(player, true)
								RequestAndWaitModel(-1835459726)
								create_npc = CreatePed(4, -1835459726, BB.Call_Door_Marker_Coords, BB.Call_Door_Marker_Coords_Heading, false, true)
								TaskGoStraightToCoord(create_npc, BB.Npc_Walk_Coords, 1.0, 500, BB.Npc_Walk_Coords_Heading)
								Wait(1000)
								RequestAndWaitDict("anim@amb@world_human_valet@formal_right@base@")
								TaskTurnPedToFaceEntity(PlayerPedId(), create_npc, -1)
								SetPedFleeAttributes(create_npc, 0, 0)
								SetPedDropsWeaponsWhenDead(create_npc, false)
								SetPedDiesWhenInjured(create_npc, false)
								SetEntityInvincible(create_npc , true)
								SetBlockingOfNonTemporaryEvents(create_npc, true)
								TaskPlayAnim(create_npc, "anim@amb@world_human_valet@formal_right@base@" ,"base_a_m_y_vinewood_01" ,8.0, -8.0, -1, 0, 0, false, false, false )
								SetEntityHeading(create_npc, BB.Npc_Walk_Coords_Heading)
								FreezeEntityPosition(create_npc, true)

								SetEntityHeading(player, BB.Player_Heading)
								Wait(500)
								FreezeEntityPosition(player, true)
								RandomAnim(true)
								Wait(1000)
								TriggerServerEvent("bb-drugsale:GetData")
								SendNUIMessage({action = "openmenu"}) 
								SetNuiFocus(true, true)
								
							else
								pressed = false
								QBCore.Functions.Notify(Lang:t("notify.AreaNotControlYourJob_Text"), "error")
							end
						end
					else
						QBCore.Functions.DrawText3D(BB.Call_Door_Marker_Coords, "Region Blockaded by LSPD!")
					end
				end
			else
				sleep = 5000
			end
		else
			break;
		end
		
	Citizen.Wait(sleep)
	end
end)

function RandomAnim(playing)
	local animation_ped = PlayerPedId()
	if playing then
        local animnumber = math.random(1, 10)
        if animnumber == 1 then
            RequestAndWaitDict("anim@amb@casino@hangout@ped_male@stand@02b@idles")
            TaskPlayAnim(animation_ped, "anim@amb@casino@hangout@ped_male@stand@02b@idles" ,"idle_a" , 8.0, -1, -1, 1, 1, true, true, true)
        elseif animnumber == 2 then
            RequestAndWaitDict("anim@miss@low@fin@vagos@")
            TaskPlayAnim(animation_ped, "anim@miss@low@fin@vagos@" ,"idle_ped05" ,8.0, -8.0, -1, 0, 0, true, true, true)
        elseif animnumber == 3 then
            RequestAndWaitDict("amb@world_human_bum_standing@twitchy@idle_a")
            TaskPlayAnim(animation_ped, "amb@world_human_bum_standing@twitchy@idle_a" ,"idle_c" ,8.0, -8.0, -1, 1, -1, true, true, true)
        elseif animnumber == 4 then
            RequestAndWaitDict("anim@amb@nightclub@peds@")
            TaskPlayAnim(animation_ped, "anim@amb@nightclub@peds@" ,"rcmme_amanda1_stand_loop_cop" ,8.0, -8.0, -1, 1, -1, true, true, true)
        elseif animnumber == 5 then
            RequestAndWaitDict("move_m@_idles@shake_off")
            TaskPlayAnim(animation_ped, "move_m@_idles@shake_off" ,"shakeoff_1" ,8.0, -8.0, -1, 1, -1, true, true, true)
        elseif animnumber == 6 then
            RequestAndWaitDict("anim@amb@casino@valet_scenario@pose_d@")
            TaskPlayAnim(animation_ped, "anim@amb@casino@valet_scenario@pose_d@" ,"base_a_m_y_vinewood_01" ,8.0, -8.0, -1, 1, -1, true, true, true)
        elseif animnumber == 7 then
            RequestAndWaitDict("timetable@gardener@smoking_joint")
            TaskPlayAnim(animation_ped, "timetable@gardener@smoking_joint" ,"idle_cough" ,8.0, -8.0, -1, 1, -1, true, true, true)
        elseif animnumber == 8 then
            RequestAndWaitDict("random@shop_tattoo")
            TaskPlayAnim(animation_ped, "random@shop_tattoo" ,"_idle_a" ,8.0, -8.0, -1, 1, -1, true, true, true)
        elseif animnumber == 9 then
            RequestAndWaitDict("amb@world_human_hang_out_street@male_b@idle_a")
            TaskPlayAnim(animation_ped, "amb@world_human_hang_out_street@male_b@idle_a" ,"idle_b" ,8.0, -8.0, -1, 1, -1, true, true, true)
        elseif animnumber == 10 then
			RequestAnimDict("amb@world_human_hang_out_street@female_arms_crossed@base")
    	TaskPlayAnim(PlayerPedId(),"amb@world_human_hang_out_street@female_arms_crossed@base", "base", 1.0, -1.0, -1, 1, -1, true, true, true)
        end
	else
		ClearPedTasks(animation_ped)
		ClearPedTasksImmediately(animation_ped)
	end
end

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        if objectspawned then
            QBCore.Functions.DeleteObject(Police_Block_Object)
			QBCore.Functions.DeleteObject(Police_Block_Object2)
        end
    end
end)

RegisterNUICallback("closenui", function ()
	local pPed = PlayerPedId()

	SetNuiFocus(false, false)
	FreezeEntityPosition(PlayerPedId(), false)
	FreezeEntityPosition(create_npc, false)
	Wait(500)
	TaskGoStraightToCoord(create_npc, BB.Call_Door_Marker_Coords, 1.0, 500, BB.Call_Door_Marker_Coords_Heading)
	Wait(300)
	RequestAndWaitDict("gestures@m@standing@casual")
    TaskPlayAnim(pPed, "gestures@m@standing@casual" ,"gesture_damn" ,8.0, -8.0, -1, 0, 0, false, false, false )
	Wait(300)
	DeletePed(create_npc)
	pressed = false
end)

RegisterNUICallback("success_closenui", function ()
	local pPed = PlayerPedId()
	SetNuiFocus(false, false)
	FreezeEntityPosition(create_npc, false)

	RequestAndWaitDict("mp_common")
    RequestAndWaitModel("p_meth_bag_01_s")
    RequestAndWaitModel('hei_prop_heist_cash_pile')
    
    SetPedTalk(create_npc)
    PlayAmbientSpeech1(create_npc, 'GENERIC_HI', 'SPEECH_PARAMS_STANDARD')
    
    local CreatedObject_1 = CreateObject(GetHashKey("p_meth_bag_01_s"), 0, 0, 0, true)
    AttachEntityToEntity(CreatedObject_1, pPed, GetPedBoneIndex(pPed, 57005), 0.13, 0.02, 0.0, -90.0, 0, 0, 1, 1, 0, 1, 0, 1)
    local CreatedObject_2 = CreateObject(GetHashKey('hei_prop_heist_cash_pile'), 0, 0, 0, true)
    AttachEntityToEntity(CreatedObject_2, create_npc, GetPedBoneIndex(create_npc, 57005), 0.13, 0.02, 0.0, -90.0, 0, 0, 1, 1, 0, 1, 0, 1)

    TaskPlayAnim(pPed, 'mp_common', 'givetake1_a', 8.0, 8.0, -1, 0, 1, false, false, false)
    TaskPlayAnim(create_npc, 'mp_common', 'givetake1_a', 8.0, 8.0, -1, 0, 1, false, false, false)

    Wait(1000)
    AttachEntityToEntity(CreatedObject_2, pPed, GetPedBoneIndex(pPed, 57005), 0.13, 0.02, 0.0, -90.0, 0, 0, 1, 1, 0, 1, 0, 1)
    AttachEntityToEntity(CreatedObject_1, create_npc, GetPedBoneIndex(create_npc, 57005), 0.13, 0.02, 0.0, -90.0, 0, 0, 1, 1, 0, 1, 0, 1)
    Wait(1000)
    
    PlaySoundFrontend(-1, "Bomb_Disarmed", "GTAO_Speed_Convoy_Soundset", 0)
    FreezeEntityPosition(pPed, false)
    ClearPedTasks(create_npc)
    ClearPedTasks(pPed)
    
    if CreatedObject_1 then 
        DeleteEntity(CreatedObject_1)
    end
    if CreatedObject_2 then 
        DeleteEntity(CreatedObject_2)
    end
	Wait(500)
	TaskGoStraightToCoord(create_npc, BB.Call_Door_Marker_Coords, 1.0, 500, BB.Call_Door_Marker_Coords_Heading)
	Wait(700)
	DeletePed(create_npc)
	pressed = false
end)

AddEventHandler("bb-drugsale:ReadData")
RegisterNetEvent("bb-drugsale:ReadData", function (owned_money)
	SendNUIMessage({
		action = "update",
		shopname = BB.ShopName,
		have_money = owned_money
	})
end)


RegisterNUICallback("box-menu", function ()
	for k,v in pairs(BB.Items) do
		QBCore.Functions.TriggerCallback('bb-drugsale:item-control', function(qtty)
			SendNUIMessage({
				action = "add-drugs-box",
				label = v.label,
				name = v.name,
				price = v.price,
				owned_count = qtty,
				img =  v.img,
				id = k,
			})
		end, v.name)
	end
end)

RegisterNUICallback("allsell", function (data)
	local key = "BURAK_123812769x1xshajdqkw!gheqgwe1231xhj_BULUNTU"
	if last_leader == joined_job then
		TriggerServerEvent("bb-drugsale:sale_drug", data.itemname, data.countprice, data.itemlabel, key)
	else
		QBCore.Functions.Notify(Lang:t("notify.Drugsale_you_not_leader_gang"), "error")
	end
end)

function animationBlips(gangname)
	if gangname == Police_Job_Name then
		while last_leader == Police_Job_Name do
			Citizen.Wait(350)
			SetBlipColour(police_blip_zone, 6)
			Citizen.Wait(350)
			SetBlipColour(police_blip_zone, 3)
		end
	end
end

RegisterNetEvent('bb-drugsale:ceteblipac')
AddEventHandler('bb-drugsale:ceteblipac', function(gangname)
	Citizen.CreateThread(function()
		if last_leader == 'empty' then
			RemoveBlip(Empty_blip_zone)
			RemoveBlip(Empty_blip)
		elseif last_leader == Police_Job_Name then
			RemoveBlip(police_blip_zone)
			RemoveBlip(police_blip)
		elseif last_leader == Gang1_Job_Name then
			RemoveBlip(Gang1_blip_zone)
			RemoveBlip(Gang1_blip)
		elseif last_leader == Gang2_Job_Name then
			RemoveBlip(Gang2_blip_zone)
			RemoveBlip(Gang2_blip)
		elseif last_leader == Gang3_Job_Name then
			RemoveBlip(Gang3_blip_zone)
			RemoveBlip(Gang3_blip)
		elseif last_leader == Gang4_Job_Name then
			RemoveBlip(Gang4_blip_zone)
			RemoveBlip(Gang4_blip)
		elseif last_leader == Gang5_Job_Name then
			RemoveBlip(Gang5_blip_zone)
			RemoveBlip(Gang5_blip)
		elseif last_leader == Gang6_Job_Name then
			RemoveBlip(Gang6_blip_zone)
			RemoveBlip(Gang6_blip)
		elseif last_leader == Gang7_Job_Name then
			RemoveBlip(Gang7_blip_zone)
			RemoveBlip(Gang7_blip)
		elseif last_leader == Gang8_Job_Name then
			RemoveBlip(Gang8_blip_zone)
			RemoveBlip(Gang8_blip)
		elseif last_leader == Gang9_Job_Name then
			RemoveBlip(Gang9_blip_zone)
			RemoveBlip(Gang9_blip)
		elseif last_leader == Gang10_Job_Name then
			RemoveBlip(Gang10_blip_zone)
			RemoveBlip(Gang10_blip)
		end

		if gangname == Police_Job_Name then
			last_leader = Police_Job_Name

			police_blip_zone = AddBlipForRadius(BB.Call_Door_Marker_Coords, BB.Entered_Area_Distance)
			SetBlipAlpha(police_blip_zone, BB.Blip_Background_Transparent_Value)
			SetBlipColour(police_blip_zone, BB.Blip_LSPD_Colour)
			SetBlipDisplay(police_blip_zone, 3)
			SetBlipHighDetail(police_blip_zone, true) 
			SetBlipAsShortRange(police_blip_zone, true)
				
			police_blip = AddBlipForCoord(BB.Call_Door_Marker_Coords)       
			SetBlipSprite(police_blip, BB.BlipSprite)
			SetBlipColour(police_blip, 4)
			SetBlipScale(police_blip, BB.BlipScale)
			SetBlipAsShortRange(police_blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(Lang:t("blip.LspdText"))
			EndTextCommandSetBlipName(police_blip)
			animationBlips(Police_Job_Name)
		elseif gangname == Gang1_Job_Name then
			last_leader = Gang1_Job_Name

			Gang1_blip_zone = AddBlipForRadius(BB.Call_Door_Marker_Coords, BB.Entered_Area_Distance)
			SetBlipAlpha(Gang1_blip_zone, BB.Blip_Background_Transparent_Value)
			SetBlipColour(Gang1_blip_zone, BB.Blip_Gang1_Colour)
			SetBlipDisplay(Gang1_blip_zone, 3)
			SetBlipHighDetail(Gang1_blip_zone, true) 
			SetBlipAsShortRange(Gang1_blip_zone, true)
				
			Gang1_blip = AddBlipForCoord(BB.Call_Door_Marker_Coords)       
			SetBlipSprite(Gang1_blip, BB.BlipSprite)
			SetBlipColour(Gang1_blip, 4)
			SetBlipScale(Gang1_blip, BB.BlipScale)
			SetBlipAsShortRange(Gang1_blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(Lang:t("blip.ZoneText") .. " " .. BB.Blip_Gang1_Text .. " !")
			EndTextCommandSetBlipName(Gang1_blip)
		elseif gangname == Gang2_Job_Name then
			last_leader = Gang2_Job_Name
			
			Gang2_blip_zone = AddBlipForRadius(BB.Call_Door_Marker_Coords, BB.Entered_Area_Distance)
			SetBlipAlpha(Gang2_blip_zone, BB.Blip_Background_Transparent_Value)
			SetBlipColour(Gang2_blip_zone, BB.Blip_Gang2_Colour)
			SetBlipDisplay(Gang2_blip_zone, 3)
			SetBlipHighDetail(Gang2_blip_zone, true) 
			SetBlipAsShortRange(Gang2_blip_zone, true)
				
			Gang2_blip = AddBlipForCoord(BB.Call_Door_Marker_Coords)       
			SetBlipSprite(Gang2_blip, BB.BlipSprite)
			SetBlipColour(Gang2_blip, 4)
			SetBlipScale(Gang2_blip, BB.BlipScale)
			SetBlipAsShortRange(Gang2_blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(Lang:t("blip.ZoneText") .. " " .. BB.Blip_Gang2_Text .. " !")
			EndTextCommandSetBlipName(Gang2_blip)
		elseif gangname == Gang3_Job_Name then
			last_leader = Gang3_Job_Name
			
			Gang3_blip_zone = AddBlipForRadius(BB.Call_Door_Marker_Coords, BB.Entered_Area_Distance)
			SetBlipAlpha(Gang3_blip_zone, BB.Blip_Background_Transparent_Value)
			SetBlipColour(Gang3_blip_zone, BB.Blip_Gang3_Colour)
			SetBlipDisplay(Gang3_blip_zone, 3)
			SetBlipHighDetail(Gang3_blip_zone, true) 
			SetBlipAsShortRange(Gang3_blip_zone, true)
				
			Gang3_blip = AddBlipForCoord(BB.Call_Door_Marker_Coords)       
			SetBlipSprite(Gang3_blip, BB.BlipSprite)
			SetBlipColour(Gang3_blip, 4)
			SetBlipScale(Gang3_blip, BB.BlipScale)
			SetBlipAsShortRange(Gang3_blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(Lang:t("blip.ZoneText") .. " " .. BB.Blip_Gang3_Text .. " !")
			EndTextCommandSetBlipName(Gang3_blip)
		elseif gangname == Gang4_Job_Name then
			last_leader = Gang4_Job_Name
			
			Gang4_blip_zone = AddBlipForRadius(BB.Call_Door_Marker_Coords, BB.Entered_Area_Distance)
			SetBlipAlpha(Gang4_blip_zone, BB.Blip_Background_Transparent_Value)
			SetBlipColour(Gang4_blip_zone, BB.Blip_Gang4_Colour)
			SetBlipDisplay(Gang4_blip_zone, 3)
			SetBlipHighDetail(Gang4_blip_zone, true) 
			SetBlipAsShortRange(Gang4_blip_zone, true)
				
			Gang4_blip = AddBlipForCoord(BB.Call_Door_Marker_Coords)       
			SetBlipSprite(Gang4_blip, BB.BlipSprite)
			SetBlipColour(Gang4_blip, 4)
			SetBlipScale(Gang4_blip, BB.BlipScale)
			SetBlipAsShortRange(Gang4_blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(Lang:t("blip.ZoneText") .. " " .. BB.Blip_Gang4_Text .. " !")
			EndTextCommandSetBlipName(Gang4_blip)
			
		elseif gangname == Gang5_Job_Name then
			last_leader = Gang5_Job_Name
			
			Gang5_blip_zone = AddBlipForRadius(BB.Call_Door_Marker_Coords, BB.Entered_Area_Distance)
			SetBlipAlpha(Gang5_blip_zone, BB.Blip_Background_Transparent_Value)
			SetBlipColour(Gang5_blip_zone, BB.Blip_Gang5_Colour)
			SetBlipDisplay(Gang5_blip_zone, 3)
			SetBlipHighDetail(Gang5_blip_zone, true) 
			SetBlipAsShortRange(Gang5_blip_zone, true)
				
			Gang5_blip = AddBlipForCoord(BB.Call_Door_Marker_Coords)       
			SetBlipSprite(Gang5_blip, BB.BlipSprite)
			SetBlipColour(Gang5_blip, 4)
			SetBlipScale(Gang5_blip, BB.BlipScale)
			SetBlipAsShortRange(Gang5_blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(Lang:t("blip.ZoneText") .. " " .. BB.Blip_Gang5_Text .. " !")
			EndTextCommandSetBlipName(Gang5_blip)
		elseif gangname == Gang6_Job_Name then
			last_leader = Gang6_Job_Name
			
			Gang6_blip_zone = AddBlipForRadius(BB.Call_Door_Marker_Coords, BB.Entered_Area_Distance)
			SetBlipAlpha(Gang6_blip_zone, BB.Blip_Background_Transparent_Value)
			SetBlipColour(Gang6_blip_zone, BB.Blip_Gang6_Colour)
			SetBlipDisplay(Gang6_blip_zone, 3)
			SetBlipHighDetail(Gang6_blip_zone, true) 
			SetBlipAsShortRange(Gang6_blip_zone, true)
				
			Gang6_blip = AddBlipForCoord(BB.Call_Door_Marker_Coords)       
			SetBlipSprite(Gang6_blip, BB.BlipSprite)
			SetBlipColour(Gang6_blip, 4)
			SetBlipScale(Gang6_blip, BB.BlipScale)
			SetBlipAsShortRange(Gang6_blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(Lang:t("blip.ZoneText") .. " " .. BB.Blip_Gang6_Text .. " !")
			EndTextCommandSetBlipName(Gang6_blip)
		elseif gangname == Gang7_Job_Name then
			last_leader = Gang7_Job_Name
			
			Gang7_blip_zone = AddBlipForRadius(BB.Call_Door_Marker_Coords, BB.Entered_Area_Distance)
			SetBlipAlpha(Gang7_blip_zone, BB.Blip_Background_Transparent_Value)
			SetBlipColour(Gang7_blip_zone, BB.Blip_Gang7_Colour)
			SetBlipDisplay(Gang7_blip_zone, 3)
			SetBlipHighDetail(Gang7_blip_zone, true) 
			SetBlipAsShortRange(Gang7_blip_zone, true)
				
			Gang7_blip = AddBlipForCoord(BB.Call_Door_Marker_Coords)       
			SetBlipSprite(Gang7_blip, BB.BlipSprite)
			SetBlipColour(Gang7_blip, 4)
			SetBlipScale(Gang7_blip, BB.BlipScale)
			SetBlipAsShortRange(Gang7_blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(Lang:t("blip.ZoneText") .. " " .. BB.Blip_Gang7_Text .. " !")
			EndTextCommandSetBlipName(Gang7_blip)
		elseif gangname == Gang8_Job_Name then
			last_leader = Gang8_Job_Name
			
			Gang8_blip_zone = AddBlipForRadius(BB.Call_Door_Marker_Coords, BB.Entered_Area_Distance)
			SetBlipAlpha(Gang8_blip_zone, BB.Blip_Background_Transparent_Value)
			SetBlipColour(Gang8_blip_zone, BB.Blip_Gang8_Colour)
			SetBlipDisplay(Gang8_blip_zone, 3)
			SetBlipHighDetail(Gang8_blip_zone, true) 
			SetBlipAsShortRange(Gang8_blip_zone, true)
				
			Gang8_blip = AddBlipForCoord(BB.Call_Door_Marker_Coords)       
			SetBlipSprite(Gang8_blip, BB.BlipSprite)
			SetBlipColour(Gang8_blip, 4)
			SetBlipScale(Gang8_blip, BB.BlipScale)
			SetBlipAsShortRange(Gang8_blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(Lang:t("blip.ZoneText") .. " " .. BB.Blip_Gang8_Text .. " !")
			EndTextCommandSetBlipName(Gang8_blip)
		elseif gangname == Gang9_Job_Name then
			last_leader = Gang9_Job_Name
			
			Gang9_blip_zone = AddBlipForRadius(BB.Call_Door_Marker_Coords, BB.Entered_Area_Distance)
			SetBlipAlpha(Gang9_blip_zone, BB.Blip_Background_Transparent_Value)
			SetBlipColour(Gang9_blip_zone, BB.Blip_Gang9_Colour)
			SetBlipDisplay(Gang9_blip_zone, 3)
			SetBlipHighDetail(Gang9_blip_zone, true) 
			SetBlipAsShortRange(Gang9_blip_zone, true)
				
			Gang9_blip = AddBlipForCoord(BB.Call_Door_Marker_Coords)       
			SetBlipSprite(Gang9_blip, BB.BlipSprite)
			SetBlipColour(Gang9_blip, 4)
			SetBlipScale(Gang9_blip, BB.BlipScale)
			SetBlipAsShortRange(Gang9_blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(Lang:t("blip.ZoneText") .. " " .. BB.Blip_Gang9_Text .. " !")
			EndTextCommandSetBlipName(Gang9_blip)
		elseif gangname == Gang10_Job_Name then
			last_leader = Gang10_Job_Name
			
			Gang10_blip_zone = AddBlipForRadius(BB.Call_Door_Marker_Coords, BB.Entered_Area_Distance)
			SetBlipAlpha(Gang10_blip_zone, BB.Blip_Background_Transparent_Value)
			SetBlipColour(Gang10_blip_zone, BB.Blip_Gang10_Colour)
			SetBlipDisplay(Gang10_blip_zone, 3)
			SetBlipHighDetail(Gang10_blip_zone, true) 
			SetBlipAsShortRange(Gang10_blip_zone, true)
				
			Gang10_blip = AddBlipForCoord(BB.Call_Door_Marker_Coords)       
			SetBlipSprite(Gang10_blip, BB.BlipSprite)
			SetBlipColour(Gang10_blip, 4)
			SetBlipScale(Gang10_blip, BB.BlipScale)
			SetBlipAsShortRange(Gang10_blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(Lang:t("blip.ZoneText") .. " " .. BB.Blip_Gang10_Text .. " !")
			EndTextCommandSetBlipName(Gang10_blip)
		else
			last_leader = 'empty'

			Empty_blip_zone = AddBlipForRadius(BB.Call_Door_Marker_Coords, BB.Entered_Area_Distance)
			SetBlipAlpha(Empty_blip_zone, BB.Blip_Background_Transparent_Value)
			SetBlipColour(Empty_blip_zone, BB.Blip_Empty_Colour)
			SetBlipDisplay(Empty_blip_zone, 3)
			SetBlipHighDetail(Empty_blip_zone, true) 
			SetBlipAsShortRange(Empty_blip_zone, true)
				
			Empty_blip = AddBlipForCoord(BB.Call_Door_Marker_Coords)       
			SetBlipSprite(Empty_blip, BB.BlipSprite)
			SetBlipColour(Empty_blip, 4)
			SetBlipScale(Empty_blip, BB.BlipScale)
			SetBlipAsShortRange(Empty_blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(Lang:t("blip.ZoneText") .. " " .. BB.Blip_Empty_Text .. " !")
			EndTextCommandSetBlipName(Empty_blip)
		end
	end)
end)

function RequestAndWaitDict(dictName) -- Request animation (dict)
	if dictName and DoesAnimDictExist(dictName) and not HasAnimDictLoaded(dictName) then
		RequestAnimDict(dictName)
		while not HasAnimDictLoaded(dictName) do Citizen.Wait(100) end
	end
end
function RequestAndWaitModel(modelName) -- Request model or vehicle
	if modelName and IsModelInCdimage(modelName) and not HasModelLoaded(modelName) then
		RequestModel(modelName)
		while not HasModelLoaded(modelName) do Citizen.Wait(100) end
	end
end