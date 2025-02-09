local Translations = {
    notify = {
        ["Cheater_Kick_Message"] = "Auf Wiedersehen, Betrüger.",
        ["BlockedArea_Animation_1_Text"] = "[1/3] Klopfen an der Tür.",
        ["BlockedArea_Animation_2_Text"] = "[2/3] Tür aufbrechen.",
        ["BlockedArea_Animation_3_Text"] = "[3/3] Eine Sperre verhängen.",
        ["BlockedArea_Animation_Cancel_Text"] = "Die Operation zur Verhängung einer Sperre in der Zone wurde abgebrochen!",
        ["InsufficientGrade_Text"] = "Ihr Polizeirang ist unzureichend.",
        ["AreaNotControlPolice_Text"] = "Die Zone steht nicht unter der Kontrolle der Polizei.",
        ["AreaNotControlYourJob_Text"] = "Meine Sicherheit ist gefährdet, daher werde ich nicht nach draußen gehen!",
        ["Entered_area"] = "Sie haben die Zone betreten.",
        ["Leaved_area"] = "Sie haben die Zone verlassen.",
        ["ItemCount"] = "X",
        ["ItemSaled"] = "Verkauft",
        ["doorText_LSPD"] = "[E] Sperre in der Zone verhängen",
        ["doorText"] = "[E] An die Tür klopfen",
        ["Drugsale_not_have_item_txt_1"] = "Sie haben keine",
        ["Drugsale_not_have_item_txt_2"] = "zu verkaufen.",
        ["Drugsale_you_not_leader_gang"] = "Sie sind nicht der Mann der Anführerbande.",
        ["NPC_Text_1"] = "Warten Sie, ich komme sofort.",
        ["Empty_Territory_Owner"] = "Ohne Besitzer"
    },

    blip = {
        ["LspdText"] = "Unter Blockade durch die LSPD",
        ["ZoneText"] = "Zonenbesitzer"
    },

    discordlog = {
        ["News"] = "**[PRESSE]**",
        ["Control_Area_Leader_None"] = "Der Besitzer der Zone hat gewechselt",
        ["Control_Area_Leader_None_Blocked_Description"] = "Das Fehlen von Personen, die die Zone betreten oder verlassen, zieht Aufmerksamkeit auf sich. Die Zone scheint keinen Besitzer zu haben.",
        ["Control_Area_Leader_Changed"] = "Der Besitzer der Zone hat gewechselt",
        ["Control_Area_Leader_Changed_Description"] = "Die Kontrolle über die Zone wurde übernommen. Experten spekulieren, dass von hier aus Drogensendungen erfolgen.",
        ["Control_Area_Leader_Taked"] = "Die Kontrolle über die Zone übernommen",
        ["Control_Area_Leader_Gived"] = "Die Kontrolle über die Zone verloren",
        ["Control_Area_Raid_Leader"] = "Die Strafverfolgungsbehörden haben die Kontrolle über die Zone übernommen",
        ["Control_Area_Raid_Changed_Description"] = "Die Zone steht unter Kontrolle, Aussage des LSPD-Chefs: Wir konnten den Drogendealer nicht finden, die Zone steht unter Untersuchung. Die Zone ist derzeit sicher, aber die Spannungen sind hoch und die Kontrolle über die Zone kann sich jederzeit ändern.",
        ["Control_Area_Leader_Blocked"] = "Die Strafverfolgungsbehörden haben die Zone gesperrt",
        ["Control_Area_Leader_Blocked_Description"] = "Die Zone wurde gesichert, Barrikaden und Schlösser wurden an der Tür des sogenannten Drogendealers angebracht. Unsere Bürger müssen keine Angst haben, die Zone ist sicher.",
        ["Control_Area_Leader_Blocked_None"] = "Sicherheitskräfte lösten die Blockade der Region auf",
        ["Control_Area_Leader_Blocked_Description_None"] = "Das Gebiet ist sicher, aber laut Experten wird in letzter Zeit vorhergesagt, dass Banden damit beginnen werden, Drogen in das Gebiet zu transportieren."
    }
}
Lang = Locale:new({phrases = Translations, warnOnMissing = true})