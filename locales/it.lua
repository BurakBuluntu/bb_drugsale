local Translations = {
    notify = {
        ["Cheater_Kick_Message"] = "Arrivederci, cheater.",
        ["BlockedArea_Animation_1_Text"] = "[1/3] Bussare alla porta.",
        ["BlockedArea_Animation_2_Text"] = "[2/3] Forzare la porta.",
        ["BlockedArea_Animation_3_Text"] = "[3/3] Imporre un blocco.",
        ["BlockedArea_Animation_Cancel_Text"] = "Operazione per imporre un blocco nell'area annullata!",
        ["InsufficientGrade_Text"] = "Il tuo grado di polizia non è sufficiente.",
        ["AreaNotControlPolice_Text"] = "L'area non è sotto il controllo della polizia.",
        ["AreaNotControlYourJob_Text"] = "La mia sicurezza è a rischio, quindi non uscirò!",
        ["Entered_area"] = "Sei entrato nell'area.",
        ["Leaved_area"] = "Hai lasciato l'area.",
        ["ItemCount"] = "X",
        ["ItemSaled"] = "Venduto",
        ["doorText_LSPD"] = "[E] Imporre un blocco nell'area",
        ["doorText"] = "[E] Bussare alla porta",
        ["Drugsale_not_have_item_txt_1"] = "Non hai",
        ["Drugsale_not_have_item_txt_2"] = "da vendere.",
        ["Drugsale_you_not_leader_gang"] = "Non sei l'uomo del leader della banda.",
        ["NPC_Text_1"] = "Aspetta, arrivo subito.",
        ["Empty_Territory_Owner"] = "Senza proprietario"
    },

    blip = {
        ["LspdText"] = "Sotto blocco da parte dell'LSPD",
        ["ZoneText"] = "Proprietario della zona"
    },

    discordlog = {
        ["News"] = "**[STAMPA]**",
        ["Control_Area_Leader_None"] = "Il proprietario dell'area è cambiato",
        ["Control_Area_Leader_None_Blocked_Description"] = "L'assenza di chiunque entri o esca dall'area da molto tempo sta attirando l'attenzione. L'area sembra essere senza proprietario.",
        ["Control_Area_Leader_Changed"] = "Il proprietario dell'area è cambiato",
        ["Control_Area_Leader_Changed_Description"] = "Hanno preso il controllo dell'area. Gli esperti ipotizzano che da qui si stiano effettuando spedizioni di droga.",
        ["Control_Area_Leader_Taked"] = "Hanno preso il controllo dell'area",
        ["Control_Area_Leader_Gived"] = "Hanno perso il controllo dell'area",
        ["Control_Area_Raid_Leader"] = "Le forze dell'ordine hanno preso il controllo dell'area",
        ["Control_Area_Raid_Changed_Description"] = "L'area è sotto controllo, dichiarazione del capo LSPD: Non siamo riusciti a trovare il trafficante di droga, l'area è ancora sotto indagine. L'area è attualmente sicura, ma le tensioni sono alte e il controllo dell'area può cambiare in qualsiasi momento.",
        ["Control_Area_Leader_Blocked"] = "Le forze dell'ordine hanno bloccato l'area",
        ["Control_Area_Leader_Blocked_Description"] = "L'area è stata messa in sicurezza, sono state poste delle barriere e delle serrature sulla porta del presunto trafficante di droga. I nostri cittadini non devono temere, l'area è stata resa sicura.",
        ["Control_Area_Leader_Blocked_None"] = "Le forze di sicurezza hanno rilasciato il blocco della regione",
        ["Control_Area_Leader_Blocked_Description_None"] = "La zona è sicura ma recentemente si prevede che le bande cominceranno a spedire droga nella zona, secondo gli esperti."
    }
}
Lang = Locale:new({phrases = Translations, warnOnMissing = true})