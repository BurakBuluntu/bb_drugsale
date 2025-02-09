local Translations = {
    notify = {
        ["Cheater_Kick_Message"] = "Bye bye, Cheater.",
        ["BlockedArea_Animation_1_Text"] = "[1/3] Kapıyı çalıyorsunuz.",
        ["BlockedArea_Animation_2_Text"] = "[2/3] Kapıyı Zorluyorsunuz.",
        ["BlockedArea_Animation_3_Text"] = "[3/3] Abluka altına alıyorsunuz.",
        ["BlockedArea_Animation_Cancel_Text"] = "Bölgeyi Ablukaya alma işlemi iptal edildi !",
        ["InsufficientGrade_Text"] = "Polis rütbeniz yetersiz.",
        ["AreaNotControlPolice_Text"] = "Bölge Polisin Kontrolünde değil.",
        ["AreaNotControlYourJob_Text"] = "Güvenliğim risk altında o yüzden dışarı çıkmam!",
        ["Entered_area"] = "Bölgeye Giriş Yaptınız",
        ["Leaved_area"] = "Bölgeden Çıkış Yaptınız",
        ["ItemCount"] = "Tane",
        ["ItemSaled"] = "Sattınız",
        ["doorText_LSPD"] = "[E] Bölgeyi Ablukaya Al",
        ["doorText"] = "[E] Kapıyı çal",
        ["Drugsale_not_have_item_txt_1"] = "Üzerinde Hiç Satabileceğin",
        ["Drugsale_not_have_item_txt_2"] = "Yok",
        ["Drugsale_you_not_leader_gang"] = "Sen lider çetenin adamı değilsin.",
        ["NPC_Text_1"] = "Bekle hemen geliyorum",
        ["Empty_Territory_Owner"] = "Sahipsiz"
    },

    blip = {
        ["LspdText"] = "LSPD Tarafından Abluka Altında !",
        ["ZoneText"] = "Bölgenin Sahibi"
    },

    discordlog = {
        ["News"] = "**[BASIN]**",
        ["Control_Area_Leader_None"] = "Bölgenin Sahibi Değişti",
        ["Control_Area_Leader_None_Blocked_Description"] = "Uzun süredir bölgeye giren çıkan kimse olmaması dikkatleri üzerine çekiyor. Bölge sahipsiz gibi duruyor.",
        ["Control_Area_Leader_Changed"] = "Bölgenin Sahibi Değişti",
        ["Control_Area_Leader_Changed_Description"] = "Bölgenin kontrolünü ele geçirdi. Uzmanların tahminleri buradan uyuşturucu sevkiyatını yaptıklarını yönünde.",
        ["Control_Area_Leader_Taked"] = "Bölgeyi Ele Geçiren",
        ["Control_Area_Leader_Gived"] = "Bölgeyi Kaybeden",
        ["Control_Area_Raid_Leader"] = "Emniyet Güçleri Bölgeyi Kontrol Altına Aldı",
        ["Control_Area_Raid_Changed_Description"] = "Bölge Kontrol Altına Alındı, LSPD Şefinin Açıklaması: Tüccarı Bulamadık Bölge Hala İnceleniyor. Bölge şuanlık güvenli fakat bölgede tansiyon hala çok yüksek bölge'nin hakimiyeti her an değişebilir.",
        ["Control_Area_Leader_Blocked"] = "Emniyet Güçleri Bölgeyi Abluka Altına Aldı",
        ["Control_Area_Leader_Blocked_Description"] = "Bölge kontrol altına alındı, sözde tüccarın kapısına barikat ve kilit vuruldu. Vatandaşlarımızın korkmasına gerek yok bölge güvenli hale getirildi.",
        ["Control_Area_Leader_Blocked_None"] = "Güvenlik güçleri bölgedeki ablukayı kaldırdı",
        ["Control_Area_Leader_Blocked_Description_None"] = "Bölge güvenli ancak uzmanlara göre son zamanlarda çetelerin bölgeye uyuşturucu sevkiyatına başlayacağı öngörülüyor.",
    }
}
Lang = Locale:new({phrases = Translations, warnOnMissing = true})