local Translations = {
    notify = {
        ["Cheater_Kick_Message"] = "Bye bye, Cheater.",
        ["BlockedArea_Animation_1_Text"] = "[1/3] Knocking on the door.",
        ["BlockedArea_Animation_2_Text"] = "[2/3] Forcing the door.",
        ["BlockedArea_Animation_3_Text"] = "[3/3] Imposing a blockade.",
        ["BlockedArea_Animation_Cancel_Text"] = "Operation to impose blockade on the area has been cancelled!",
        ["InsufficientGrade_Text"] = "Your police rank is insufficient.",
        ["AreaNotControlPolice_Text"] = "The area is not under police control.",
        ["AreaNotControlYourJob_Text"] = "My security is at risk, so I won't go outside!",
        ["Entered_area"] = "You have entered the area.",
        ["Leaved_area"] = "You have left the area.",
        ["ItemCount"] = "X",
        ["ItemSaled"] = "Sold",
        ["doorText_LSPD"] = "[E] Impose Blockade on the Area",
        ["doorText"] = "[E] Knock on the door",
        ["Drugsale_not_have_item_txt_1"] = "You don't have any",
        ["Drugsale_not_have_item_txt_2"] = "to sell.",
        ["Drugsale_you_not_leader_gang"] = "You are not the man of the leader gang.",
        ["NPC_Text_1"] = "Hold on, I'm coming right away.",
        ["Empty_Territory_Owner"] = "Unowned"
    },

    blip = {
        ["LspdText"] = "Under Blockade by the LSPD",
        ["ZoneText"] = "Zone Owner"
    },

    discordlog = {
        ["News"] = "**[PRESS]**",
        ["Control_Area_Leader_None"] = "Area's Owner Has Changed",
        ["Control_Area_Leader_None_Blocked_Description"] = "The absence of anyone entering or leaving the area for a long time is drawing attention. The area appears to be ownerless.",
        ["Control_Area_Leader_Changed"] = "Area's Owner Has Changed",
        ["Control_Area_Leader_Changed_Description"] = "Seized control of the area. Experts speculate that drug shipments are being made from here.",
        ["Control_Area_Leader_Taked"] = "Seized Control of the Area",
        ["Control_Area_Leader_Gived"] = "Lost Control of the Area",
        ["Control_Area_Raid_Leader"] = "Law Enforcement Took Control of the Area",
        ["Control_Area_Raid_Changed_Description"] = "Area under control LSPD Chief Statement: We couldn't find the drug dealer, the area is under investigation. The area is currently safe, but tensions are high and control over the area can change at any time.",
        ["Control_Area_Leader_Blocked"] = "Law Enforcement Blocked the Area",
        ["Control_Area_Leader_Blocked_Description"] = "The area was secured, barricades and locks were placed on the door of the so-called drug dealer. Our citizens need not be afraid, the area has been made safe.",
        ["Control_Area_Leader_Blocked_None"] = "Security forces released the blockade of the region",
        ["Control_Area_Leader_Blocked_Description_None"] = "The area is safe but recently it is predicted that gangs will start shipping drugs to the area, according to experts.",
    }
}
Lang = Locale:new({phrases = Translations, warnOnMissing = true})