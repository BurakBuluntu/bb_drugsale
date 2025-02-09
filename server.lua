if GetCurrentResourceName() == "bb-drugsale" then

if BB.Framework == "qb" then
    QBCore = exports['qb-core']:GetCoreObject()
elseif BB.Framework == "oldqb" then 
    QBCore = nil
    TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
end

local leader_gang = 'empty'
local leader_gang_text = Lang:t("notify.Empty_Territory_Owner")

local Blocked_Area = false
local police_count = 0
local gang1_count, gang2_count, gang3_count, gang4_count, gang5_count, gang6_count, gang7_count, gang8_count, gang9_count, gang10_count = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
local Gang1_Job_Name, Gang2_Job_Name, Gang3_Job_Name, Gang4_Job_Name, Gang5_Job_Name, Gang6_Job_Name, Gang7_Job_Name, Gang8_Job_Name, Gang9_Job_Name, Gang10_Job_Name, DiscordLog = BB.Blip_Gang1_Job_Name, BB.Blip_Gang2_Job_Name, BB.Blip_Gang3_Job_Name, BB.Blip_Gang4_Job_Name, BB.Blip_Gang5_Job_Name, BB.Blip_Gang6_Job_Name, BB.Blip_Gang7_Job_Name, BB.Blip_Gang8_Job_Name, BB.Blip_Gang9_Job_Name, BB.Blip_Gang10_Job_Name, BB.DiscordLog
local Police_Job_Name, Police_2_Job_Name, Police_3_Job_Name, Police_4_Job_Name, Police_5_Job_Name= BB.Police_Job_Name, BB.Police_2_Job_Name, BB.Police_3_Job_Name, BB.Police_4_Job_Name, BB.Police_5_Job_Name

AddEventHandler("bb-drugsale:sale_drug")
RegisterNetEvent("bb-drugsale:sale_drug", function (itemname, adetfiyat, itemlabel, token)
	if token == "BURAK_123812769x1xshajdqkw!gheqgwe1231xhj" then
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local owned_items = xPlayer.Functions.GetItemByName(itemname)
		local total = owned_items.amount * adetfiyat

		if xPlayer.Functions.RemoveItem(itemname, owned_items.amount, xPlayer.Functions.GetItemByName(itemname).slot) then
			xPlayer.Functions.RemoveItem(itemname, owned_items.amount, xPlayer.Functions.GetItemByName(itemname).slot)
			xPlayer.Functions.AddMoney('cash', tonumber(total))
			TriggerClientEvent("QBCore:Notify", xPlayer.PlayerData.source, owned_items.amount .. ' ' .. Lang:t("notify.ItemCount") .. ' ' .. itemlabel ..  ' ' .. Lang:t("notify.ItemSaled"), "inform")
		else
			TriggerClientEvent("QBCore:Notify", xPlayer.PlayerData.source, Lang:t("notify.Drugsale_not_have_item_txt_1") .. ' ' .. itemlabel .. ' ' .. Lang:t("notify.Drugsale_not_have_item_txt_2"), 'error')	
		end
	else
		DropPlayer(src, Lang:t("notify.Cheater_Kick_Message"))
	end
end)

AddEventHandler("bb-drugsale:GetData")
  RegisterNetEvent("bb-drugsale:GetData", function()
    local source = source
	local xPlayer = QBCore.Functions.GetPlayer(source)
	owned_cash = xPlayer.Functions.GetMoney('cash')

    TriggerClientEvent("bb-drugsale:ReadData", source, owned_cash)
end)

QBCore.Functions.CreateCallback('bb-drugsale:item-control', function(source, cb, item)
	local src = source
	local xPlayer = QBCore.Functions.GetPlayer(src)
    local items = xPlayer.Functions.GetItemByName(item).amount
	
    if items == nil then
        cb(0)
    else
        cb(items)
    end
end)

AddEventHandler('playerDropped', function ()
	local source = source
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local ped_coords = GetEntityCoords(GetPlayerPed(source))
	local area_coords = vector3(BB.Call_Door_Marker_Coords)
	if xPlayer then
	  	if xPlayer.PlayerData.job.name ~= nil then
			local distance = #(ped_coords - area_coords)

			if distance < BB.Entered_Area_Distance then
				TriggerEvent('bb-drugsale:joined_area', "exit", xPlayer.PlayerData.job.name)
			end
	  	end
	end
end)

if BB.AutoAreaExit_IsDead then
	RegisterNetEvent(BB.AmbulanceJobTrigger, function(isDead)
		local src = source
		local xPlayer = QBCore.Functions.GetPlayer(src)
		local ped_coords = GetEntityCoords(GetPlayerPed(source))
		local area_coords = vector3(BB.Call_Door_Marker_Coords)

		if xPlayer then
			if xPlayer.PlayerData.job.name ~= nil then
			local distance = #(ped_coords - area_coords)

				if distance < BB.Entered_Area_Distance then
					TriggerClientEvent('bb-drugsale:setDeathStatus', src, isDead)

					if isDead then
						TriggerClientEvent('bb-drugsale:GetJoinedArea', src, isDead)
					end
				end
			end
		end
	end)
end

RegisterServerEvent('bb-drugsale:joined_area')
AddEventHandler('bb-drugsale:joined_area', function(process, job)
	local src = source
	
	if process == 'join' then
		if BB.Allow_Join_Exit_Area_Message then
			TriggerClientEvent("QBCore:Notify", src, Lang:t("notify.Entered_area"), "success")
		end
		if job == Police_Job_Name then
			police_count = police_count + 1
			Dominance_Calculate()
		elseif job == Gang1_Job_Name then
			gang1_count = gang1_count + 1
			Dominance_Calculate()
		elseif job == Gang2_Job_Name then
			gang2_count = gang2_count + 1
			Dominance_Calculate()
		elseif job == Gang3_Job_Name then
			gang3_count = gang3_count + 1
			Dominance_Calculate()
		elseif job == Gang4_Job_Name then
			gang4_count = gang4_count + 1
			Dominance_Calculate()
		elseif job == Gang5_Job_Name then
			gang5_count = gang5_count + 1
			Dominance_Calculate()
		elseif job == Gang6_Job_Name then
			gang6_count = gang6_count + 1
			Dominance_Calculate()
		elseif job == Gang7_Job_Name then
			gang7_count = gang7_count + 1
			Dominance_Calculate()
		elseif job == Gang8_Job_Name then
			gang8_count = gang8_count + 1
			Dominance_Calculate()
		elseif job == Gang9_Job_Name then
			gang9_count = gang9_count + 1
			Dominance_Calculate()
		elseif job == Gang10_Job_Name then
			gang10_count = gang10_count + 1
			Dominance_Calculate()
		end
		
	elseif process == 'exit' then
		if BB.Allow_Join_Exit_Area_Message then
			TriggerClientEvent("QBCore:Notify", src, Lang:t("notify.Leaved_area"), "error")
		end

		if job == Police_Job_Name then
			police_count = police_count - 1
				if police_count == -1 then
					police_count = 0
				end
				Dominance_Calculate()
		elseif job == Gang1_Job_Name then
			gang1_count = gang1_count - 1
				if gang1_count == -1 then
					gang1_count = 0
				end
				Dominance_Calculate()
		elseif job == Gang2_Job_Name then
			gang2_count = gang2_count - 1	
				if gang2_count == -1 then
					gang2_count = 0
				end
				Dominance_Calculate()
		elseif job == Gang3_Job_Name then
			gang3_count = gang3_count - 1	
				if gang3_count == -1 then
					gang3_count = 0
				end
				Dominance_Calculate()
		elseif job == Gang4_Job_Name then
			gang4_count = gang4_count - 1	
				if gang4_count == -1 then
					gang4_count = 0
				end
				Dominance_Calculate()
		elseif job == Gang5_Job_Name then
			gang5_count = gang5_count - 1	
				if gang5_count == -1 then
					gang5_count = 0
				end
				Dominance_Calculate()
		elseif job == Gang6_Job_Name then
			gang6_count = gang6_count - 1	
				if gang6_count == -1 then
					gang6_count = 0
				end
				Dominance_Calculate()
		elseif job == Gang7_Job_Name then
			gang7_count = gang7_count - 1	
				if gang7_count == -1 then
					gang7_count = 0
				end
				Dominance_Calculate()
		elseif job == Gang8_Job_Name then
			gang8_count = gang8_count - 1	
				if gang8_count == -1 then
					gang8_count = 0
				end
				Dominance_Calculate()
		elseif job == Gang9_Job_Name then
			gang9_count = gang9_count - 1	
				if gang9_count == -1 then
					gang9_count = 0
				end
				Dominance_Calculate()
		elseif job == Gang10_Job_Name then
				gang10_count = gang10_count - 1	
				if gang10_count == -1 then
					gang10_count = 0
				end
				Dominance_Calculate()
		elseif job == "all" then
		    police_count = 100
			gang1_count, gang2_count, gang3_count, gang4_count, gang5_count, gang6_count, gang7_count, gang8_count, gang9_count, gang10_count = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
			Blocked_Area = true
			leader_gang = Police_Job_Name
			TriggerClientEvent('bb-drugsale:ceteblipac', -1, Police_Job_Name)

			logToDiscord(leader_gang_text, 'LSPD', 'lspd_blocked_area')

			local getnow_timer = os.time()
			TimerController(getnow_timer)
		end
	end
end)

function TimerController(oldtimer)
	while true do
		Citizen.Wait(60000)
		if os.time() - oldtimer >= BB.PoliceBlockedArea_Time then
			police_count = 0
			gang1_count, gang2_count, gang3_count, gang4_count, gang5_count, gang6_count, gang7_count, gang8_count, gang9_count, gang10_count = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
			Blocked_Area = false
			leader_gang = 'empty'
			TriggerClientEvent('bb-drugsale:ceteblipac', -1, 'empty')
			TriggerClientEvent('bb-drugsale:GetBlockedArea', -1, false)
			logToDiscord(leader_gang_text, 'LSPD', 'lspd_not_blocked_area')
			break;
		end
	end
end

function Dominance_Calculate()
	if police_count > gang1_count and police_count > gang2_count and police_count > gang3_count and police_count > gang4_count and police_count > gang5_count and police_count > gang6_count and police_count > gang7_count and police_count > gang8_count and police_count > gang9_count and police_count > gang10_count then
		if not (leader_gang == Police_Job_Name) then
			if DiscordLog then
				if not Blocked_Area then
					logToDiscord(leader_gang_text, 'LSPD', 'changed_leader')
					leader_gang_text = 'LSPD'
				end
			end
			leader_gang = Police_Job_Name
			TriggerClientEvent('bb-drugsale:ceteblipac', -1, Police_Job_Name)
		end
	elseif gang1_count > police_count and gang1_count > gang2_count and gang1_count > gang3_count and gang1_count > gang4_count and gang1_count > gang5_count and gang1_count > gang6_count and gang1_count > gang7_count and gang1_count > gang8_count and gang1_count > gang9_count and gang1_count > gang10_count then
		if not (leader_gang == Gang1_Job_Name) then
			if DiscordLog then
				if not Blocked_Area then
					logToDiscord(leader_gang_text, BB.Blip_Gang1_Text, 'changed_leader')
					leader_gang_text = BB.Blip_Gang1_Text
				end
			end
			leader_gang = Gang1_Job_Name
			TriggerClientEvent('bb-drugsale:ceteblipac', -1, Gang1_Job_Name)
		end
	elseif gang2_count > police_count and gang2_count > gang1_count and gang2_count > gang3_count and gang2_count > gang4_count and gang2_count > gang5_count and gang2_count > gang6_count and gang2_count > gang7_count and gang2_count > gang8_count and gang2_count > gang9_count and gang2_count > gang10_count then
		if not (leader_gang == Gang2_Job_Name) then
			if DiscordLog then
				if not Blocked_Area then
					logToDiscord(leader_gang_text, BB.Blip_Gang2_Text, 'changed_leader')
					leader_gang_text = BB.Blip_Gang2_Text
				end
			end
			leader_gang = Gang2_Job_Name
			TriggerClientEvent('bb-drugsale:ceteblipac', -1, Gang2_Job_Name)
		end
	elseif gang3_count > police_count and gang3_count > gang1_count and gang3_count > gang2_count and gang3_count > gang4_count and gang3_count > gang5_count and gang3_count > gang6_count and gang3_count > gang7_count and gang3_count > gang8_count and gang3_count > gang9_count and gang3_count > gang10_count then
		if not (leader_gang == Gang3_Job_Name) then
			if DiscordLog then
				if not Blocked_Area then
					logToDiscord(leader_gang_text, BB.Blip_Gang3_Text, 'changed_leader')
					leader_gang_text = BB.Blip_Gang3_Text
				end
			end
			leader_gang = Gang3_Job_Name
			TriggerClientEvent('bb-drugsale:ceteblipac', -1, Gang3_Job_Name)
		end
	elseif gang4_count > police_count and gang4_count > gang1_count and gang4_count > gang2_count and gang4_count > gang3_count and gang4_count > gang5_count and gang4_count > gang6_count and gang4_count > gang7_count and gang4_count > gang8_count and gang4_count > gang9_count and gang4_count > gang10_count then
		if not (leader_gang == Gang4_Job_Name) then
			if DiscordLog then
				if not Blocked_Area then
					logToDiscord(leader_gang_text, BB.Blip_Gang4_Text, 'changed_leader')
					leader_gang_text = BB.Blip_Gang4_Text
				end
			end
			leader_gang = Gang4_Job_Name
			TriggerClientEvent('bb-drugsale:ceteblipac', -1, Gang4_Job_Name)
		end
	elseif gang5_count > police_count and gang5_count > gang1_count and gang5_count > gang2_count and gang5_count > gang3_count and gang5_count > gang4_count and gang5_count > gang6_count and gang5_count > gang7_count and gang5_count > gang8_count and gang5_count > gang9_count and gang5_count > gang10_count then
		if not (leader_gang == Gang5_Job_Name) then
			if DiscordLog then
				if not Blocked_Area then
					logToDiscord(leader_gang_text, BB.Blip_Gang5_Text, 'changed_leader')
					leader_gang_text = BB.Blip_Gang5_Text
				end
			end
			leader_gang = Gang5_Job_Name
			TriggerClientEvent('bb-drugsale:ceteblipac', -1, Gang5_Job_Name)
		end
	elseif gang6_count > police_count and gang6_count > gang1_count and gang6_count > gang2_count and gang6_count > gang3_count and gang6_count > gang4_count and gang6_count > gang5_count and gang6_count > gang7_count and gang6_count > gang8_count and gang6_count > gang9_count and gang6_count > gang10_count then
		if not (leader_gang == Gang6_Job_Name) then
			if DiscordLog then
				if not Blocked_Area then
					logToDiscord(leader_gang_text, BB.Blip_Gang6_Text, 'changed_leader')
					leader_gang_text = BB.Blip_Gang6_Text
				end
			end
			leader_gang = Gang6_Job_Name
			leader_gang_text = BB.Blip_Gang6_Text
			TriggerClientEvent('bb-drugsale:ceteblipac', -1, Gang6_Job_Name)
		end
	elseif gang7_count > police_count and gang7_count > gang1_count and gang7_count > gang2_count and gang7_count > gang3_count and gang7_count > gang4_count and gang7_count > gang5_count and gang7_count > gang6_count and gang7_count > gang8_count and gang7_count > gang9_count and gang7_count > gang10_count then
		if not (leader_gang == Gang7_Job_Name) then
			if DiscordLog then
				if not Blocked_Area then
					logToDiscord(leader_gang_text, BB.Blip_Gang7_Text, 'changed_leader')
					leader_gang_text = BB.Blip_Gang7_Text
				end
			end
			leader_gang = Gang7_Job_Name
			TriggerClientEvent('bb-drugsale:ceteblipac', -1, Gang7_Job_Name)
		end
	elseif gang8_count > police_count and gang8_count > gang1_count and gang8_count > gang2_count and gang8_count > gang3_count and gang8_count > gang4_count and gang8_count > gang5_count and gang8_count > gang6_count and gang8_count > gang7_count and gang8_count > gang9_count and gang8_count > gang10_count then
		if not (leader_gang == Gang8_Job_Name) then
			if DiscordLog then
				if not Blocked_Area then
					logToDiscord(leader_gang_text, BB.Blip_Gang8_Text, 'changed_leader')
					leader_gang_text = BB.Blip_Gang8_Text
				end
			end
			leader_gang = Gang8_Job_Name
			TriggerClientEvent('bb-drugsale:ceteblipac', -1, Gang8_Job_Name)
		end
	elseif gang9_count > police_count and gang9_count > gang1_count and gang9_count > gang2_count and gang9_count > gang3_count and gang9_count > gang4_count and gang9_count > gang5_count and gang9_count > gang6_count and gang9_count > gang7_count and gang9_count > gang8_count and gang9_count > gang10_count then
		if not (leader_gang == Gang9_Job_Name) then
			if DiscordLog then
				if not Blocked_Area then
					logToDiscord(leader_gang_text, BB.Blip_Gang9_Text, 'changed_leader')
					leader_gang_text = BB.Blip_Gang9_Text
				end
			end
			leader_gang = Gang9_Job_Name
			TriggerClientEvent('bb-drugsale:ceteblipac', -1, Gang9_Job_Name)
		end
	elseif gang10_count > police_count and gang10_count > gang1_count and gang10_count > gang2_count and gang10_count > gang3_count and gang10_count > gang4_count and gang10_count > gang5_count and gang10_count > gang6_count and gang10_count > gang7_count and gang10_count > gang8_count and gang10_count > gang9_count then
		if not (leader_gang == Gang10_Job_Name) then
			if DiscordLog then
				if not Blocked_Area then
					logToDiscord(leader_gang_text, BB.Blip_Gang10_Text, 'changed_leader')
					leader_gang_text = BB.Blip_Gang10_Text
				end	
			end
			leader_gang = Gang10_Job_Name
			TriggerClientEvent('bb-drugsale:ceteblipac', -1, Gang10_Job_Name)
		end
	else
		if DiscordLog then
			if not Blocked_Area then
				logToDiscord(leader_gang_text, Lang:t("notify.Empty_Territory_Owner"), 'changed_leader')
				leader_gang_text = Lang:t("notify.Empty_Territory_Owner")
			end
		end
		leader_gang = 'empty'
		TriggerClientEvent('bb-drugsale:ceteblipac', -1, 'empty')
	end
end

function logToDiscord(oldleader, leader, process)
	local webhookId = BB.DiscordWebhook
    local date = os.date('*t')
    local time = os.date("*t")
	local avatar = BB.DiscordAvatar

	if process == "lspd_blocked_area" then -- abluka altına alındı
		local embed = {
			{
				["color"] = 255,
				["title"] = "**" .. Lang:t("discordlog.Control_Area_Leader_Blocked") .. "**",
				["description"] = Lang:t("discordlog.News") .. ' ' .. Lang:t("discordlog.Control_Area_Leader_Blocked_Description"),
				["footer"] = {
					["text"] = "| " .. os.date("%A, %d %B %Y " .. " - " .. date["hour"] .. ":" .. date["min"] .. " |"), ("%02d:%02d:%02d"):format(time.hour, time.min, time.sec, time.sec),
				},
				["thumbnail"] = {
					["url"] = avatar,
				},
			}
		}

		PerformHttpRequest(webhookId, function(err, text, headers) end, 'POST', json.encode({username = "[LOG] bb-drugsale", embeds = embed}), { ['Content-Type'] = 'application/json' })
	elseif process == "lspd_not_blocked_area" then -- abluka kalkdı
		local embed = {
			{
				["color"] = 255,
				["title"] = "**" .. Lang:t("discordlog.Control_Area_Leader_Blocked_None") .. "**",
				["description"] = Lang:t("discordlog.News") .. ' ' .. Lang:t("discordlog.Control_Area_Leader_Blocked_Description_None"),
				["footer"] = {
					["text"] = "| " .. os.date("%A, %d %B %Y " .. " - " .. date["hour"] .. ":" .. date["min"] .. " |"), ("%02d:%02d:%02d"):format(time.hour, time.min, time.sec, time.sec),
				},
				["thumbnail"] = {
					["url"] = avatar,
				},
			}
		}

		PerformHttpRequest(webhookId, function(err, text, headers) end, 'POST', json.encode({username = "[LOG] bb-drugsale", embeds = embed}), { ['Content-Type'] = 'application/json' })

	elseif leader == 'LSPD' then -- Emniyet Güçleri Bölgeyi Kontrol Altına Aldı
		local embed = {
			{
				["fields"] = {
					{
						["name"] = "**" .. Lang:t("discordlog.Control_Area_Leader_Taked") .. "**",
						["value"] = leader,
						["inline"] = true
					},
					{
						["name"] = "**" .. Lang:t("discordlog.Control_Area_Leader_Gived") .. "**",
						["value"] = "~~" .. oldleader .. "~~",
						["inline"] = true
					},
				},

				["color"] = 3104104,
				["title"] = "**" .. Lang:t("discordlog.Control_Area_Raid_Leader") .. "**",
				["description"] = Lang:t("discordlog.News") .. ' ' .. Lang:t("discordlog.Control_Area_Raid_Changed_Description"),
				["footer"] = {
					["text"] = "| " .. os.date("%A, %d %B %Y " .. " - " .. date["hour"] .. ":" .. date["min"] .. " |"), ("%02d:%02d:%02d"):format(time.hour, time.min, time.sec, time.sec),
				},
				["thumbnail"] = {
					["url"] = avatar,
				},
			}
		}
		PerformHttpRequest(webhookId, function(err, text, headers) end, 'POST', json.encode({username = "[LOG] bb-drugsale", embeds = embed}), { ['Content-Type'] = 'application/json' })
	elseif leader == Lang:t("notify.Empty_Territory_Owner") then -- sahipsiz bölge
		local embed = {
			{
				["color"] = 15794175,
				["title"] = "**" .. Lang:t("discordlog.Control_Area_Leader_None") .. "**",
				["description"] = Lang:t("discordlog.News") .. ' ' .. Lang:t("discordlog.Control_Area_Leader_None_Blocked_Description"),
				["footer"] = {
					["text"] = "| " .. os.date("%A, %d %B %Y " .. " - " .. date["hour"] .. ":" .. date["min"] .. " |"), ("%02d:%02d:%02d"):format(time.hour, time.min, time.sec, time.sec),
				},
				["thumbnail"] = {
					["url"] = avatar,
				},
			}
		}

		PerformHttpRequest(webhookId, function(err, text, headers) end, 'POST', json.encode({username = "[LOG] bb-drugsale", embeds = embed}), { ['Content-Type'] = 'application/json' })
	else
		local embed = {
			{
				["fields"] = {
					{
						["name"] = "**" .. Lang:t("discordlog.Control_Area_Leader_Taked") .. "**",
						["value"] = leader,
						["inline"] = true
					},
					{
						["name"] = "**" .. Lang:t("discordlog.Control_Area_Leader_Gived") .. "**",
						["value"] = "~~" .. oldleader .. "~~",
						["inline"] = true
					},
				},

				["color"] = 16711680,
				["title"] = "**" .. Lang:t("discordlog.Control_Area_Leader_Changed") .. "**",
				["description"] =  Lang:t("discordlog.News") .. ' ' .. leader .. " " .. Lang:t("discordlog.Control_Area_Leader_Changed_Description"),
				["footer"] = {
					["text"] = "| " .. os.date("%A, %d %B %Y " .. " - " .. date["hour"] .. ":" .. date["min"] .. " |"), ("%02d:%02d:%02d"):format(time.hour, time.min, time.sec, time.sec),
				},
				["thumbnail"] = {
					["url"] = avatar,
				},
			}
		}
		PerformHttpRequest(webhookId, function(err, text, headers) end, 'POST', json.encode({username = "[LOG] bb-drugsale", embeds = embed}), { ['Content-Type'] = 'application/json' })
	end
end


else
	print("------------------------------------------")
	print("CHANGE bb-drugsale SCRIPT NAME  ")
	print("------------------------------------------")
	Citizen.Wait(5000)
	os.exit()
end