-- Going to combine all mods
--Assets
local package = "OEApollo"
if ModUtil ~= nil then
    ModUtil.Path.Wrap( "SetupMap", function(baseFunc)
        DebugPrint({Text = "Trying to load package "..package..".pkg"})
        LoadPackages({Name = "OEHestia"})
        LoadPackages({Name = "OEApollo"})
        return baseFunc()
    end)
    ModUtil.Mod.Register("OlympusExtra")

    -- CodexMenu Compatibility
    if CodexMenu ~= nil then
        local OlympusCodexMenuData = CodexMenu.BoonData
        --local OlympusCodexMenuReloadShouldSkip = OlympusCodexMenu.ReloadShouldSkip
        local OlympusRealGodNames = CodexMenu.RealGodNames
        local OlympusCodexBoonTable = CodexMenu.BoonTable
        local OlympusConsumableTable = CodexMenu.ConsumableTable
        --Apollo
        if ModUtil.Mods.Data["ApolloExtra"] ~= nil then
            OlympusCodexMenuData.ApolloUpgrade = {
                "ApolloWeaponTrait", "ApolloDashTrait", "ApolloRangedTrait", "ApolloSecondaryTrait", 
                "ApolloShoutTrait", "ApolloRetaliateTrait", "FountainDefenseTrait", "FountainCoinTrait",
                "ApolloBlindedTrait", "ApolloHealTrait", "RerollObolDrop", "RerollBoonDrop",
                "MissChanceTrait",
            }

            -- Apollo duos
            table.insert(OlympusCodexMenuData.Duos, "FamedDuetTrait")
            table.insert(OlympusCodexMenuData.Duos, "WarSongTrait")
            table.insert(OlympusCodexMenuData.Duos, "HyacinthTrait")
            table.insert(OlympusCodexMenuData.Duos, "SeaChanteyTrait")
            table.insert(OlympusCodexMenuData.Duos, "MasterBoltTrait")
            table.insert(OlympusCodexMenuData.Duos, "MasterLobApolloTrait")
            table.insert(OlympusCodexMenuData.Duos, "MasterLobDionysusTrait")
            table.insert(OlympusCodexMenuData.Duos, "BlindDurationTrait")
            table.insert(OlympusCodexMenuData.Duos, "DamageReduceDistanceTrait")

            table.insert(OlympusCodexMenuData.Consumables, "RerollObolDrop")
            table.insert(OlympusCodexMenuData.Consumables, "RerollBoonDrop")
            table.insert(OlympusCodexMenuData.Legendaries, "MissChanceTrait")
            table.insert(OlympusCodexMenuData.BeowulfTraits, "ShieldLoadAmmo_ApolloRangedTrait")
            OlympusCodexMenuData.ConsumableTraits.RerollObolDrop = "RerollObolTrait"
            OlympusCodexMenuData.ConsumableTraits.RerollBoonDrop = "RerollBoonTrait"
            --OlympusCodexMenuReloadShouldSkip.RerollBoonTrait = true
            --OlympusCodexMenuReloadShouldSkip.RerollObolTrait = true         
            table.insert(OlympusCodexBoonTable, "ApolloUpgrade")
            table.insert(OlympusRealGodNames, "Apollo")
        end        
        -- Hestia 
        if ModUtil.Mods.Data["HestiaExtra"] ~= nil then
            --External mod interaction
            OlympusCodexMenuData.HestiaUpgrade = {
                "HestiaWeaponTrait", "HestiaDashTrait", "HestiaRangedTrait", "HestiaSecondaryTrait",
                "HestiaShoutTrait", "StrongAttractionTrait", "HestiaRevengeTrait",
                "LastStandHealthDrop", "HealthDamageSoulDrop", "LavaDeathTrait", "LavaResistTrait", 
                "LavaLongerTrait", "LavaAutoTrait"
            }
            table.insert(OlympusCodexMenuData.Consumables, "LastStandHealthDrop")
            table.insert(OlympusCodexMenuData.Consumables, "HealthDamageSoulDrop")
            table.insert(OlympusCodexMenuData.Legendaries, "LavaAutoTrait")
            table.insert(OlympusCodexMenuData.BeowulfTraits, "ShieldLoadAmmo_HestiaRangedTrait")
            OlympusCodexMenuData.ConsumableTraits.LastStandHealthDrop = "HealthDefianceTrait"
            OlympusCodexMenuData.ConsumableTraits.HealthDamageSoulDrop = "HealthDamageTrait"
            table.insert(OlympusCodexBoonTable, "HestiaUpgrade")
            table.insert(OlympusRealGodNames, "Hestia")

            -- Hestia duos
            table.insert(OlympusCodexMenuData.Duos, "FreeHealthTrait")

            -- CentaurSoul-CodexMenu
            table.insert(OlympusConsumableTable, "RoomRewardEmptyHealthDrop")
        end
        -- Apollo Hestia Duo
    end
    -- Recompile data. Required for each gods so generic here.
    SetupRunData()
end