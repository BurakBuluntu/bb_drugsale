local Translations = {
    notify = {
        ["Cheater_Kick_Message"] = "Au revoir, tricheur.",
        ["BlockedArea_Animation_1_Text"] = "[1/3] Frappe à la porte.",
        ["BlockedArea_Animation_2_Text"] = "[2/3] Force la porte.",
        ["BlockedArea_Animation_3_Text"] = "[3/3] Imposition d'un blocage.",
        ["BlockedArea_Animation_Cancel_Text"] = "L'opération pour imposer un blocage dans la zone a été annulée !",
        ["InsufficientGrade_Text"] = "Votre grade de policier est insuffisant.",
        ["AreaNotControlPolice_Text"] = "La zone n'est pas sous le contrôle de la police.",
        ["AreaNotControlYourJob_Text"] = "Ma sécurité est en danger, donc je ne sortirai pas !",
        ["Entered_area"] = "Vous avez pénétré dans la zone.",
        ["Leaved_area"] = "Vous avez quitté la zone.",
        ["ItemCount"] = "X",
        ["ItemSaled"] = "Vendu",
        ["doorText_LSPD"] = "[E] Imposer un blocage dans la zone",
        ["doorText"] = "[E] Frapper à la porte",
        ["Drugsale_not_have_item_txt_1"] = "Vous n'avez pas",
        ["Drugsale_not_have_item_txt_2"] = "à vendre.",
        ["Drugsale_you_not_leader_gang"] = "Vous n'êtes pas l'homme du gang des chefs.",
        ["NPC_Text_1"] = "Attendez, j'arrive tout de suite.",
        ["Empty_Territory_Owner"] = "Sans propriétaire"
    },

    blip = {
        ["LspdText"] = "Sous blocus par le LSPD",
        ["ZoneText"] = "Propriétaire de zone"
    },

    discordlog = {
        ["News"] = "**[PRESSE]**",
        ["Control_Area_Leader_None"] = "Le propriétaire de la zone a changé",
        ["Control_Area_Leader_None_Blocked_Description"] = "L'absence de toute entrée ou sortie de la zone depuis longtemps attire l'attention. La zone semble être sans propriétaire.",
        ["Control_Area_Leader_Changed"] = "Le propriétaire de la zone a changé",
        ["Control_Area_Leader_Changed_Description"] = "A pris le contrôle de la zone. Les experts spéculent sur l'expédition de drogues à partir d'ici.",
        ["Control_Area_Leader_Taked"] = "A pris le contrôle de la zone",
        ["Control_Area_Leader_Gived"] = "A perdu le contrôle de la zone",
        ["Control_Area_Raid_Leader"] = "Les forces de l'ordre ont pris le contrôle de la zone",
        ["Control_Area_Raid_Changed_Description"] = "La zone est sous contrôle, déclaration du chef de la LSPD : Nous n'avons pas pu trouver le trafiquant, la zone est encore sous enquête. La zone est actuellement sécurisée, mais les tensions restent élevées et le contrôle de la zone peut changer à tout moment.",
        ["Control_Area_Leader_Blocked"] = "Les forces de l'ordre ont bloqué la zone",
        ["Control_Area_Leader_Blocked_Description"] = "La zone a été sécurisée, des barricades et des verrous ont été placés sur la porte du prétendu trafiquant de drogue. Nos citoyens n'ont pas à avoir peur, la zone est maintenant sécurisée.",
        ["Control_Area_Leader_Blocked_None"] = "Les forces de sécurité ont levé le blocus de la région",
        ["Control_Area_Leader_Blocked_Description_None"] = "La zone est sûre, mais on prévoit récemment que des gangs commenceront à y expédier de la drogue, selon les experts."
    }
}
Lang = Locale:new({phrases = Translations, warnOnMissing = true})