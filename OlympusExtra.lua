-- Going to combine all mods
--Assets
if ModUtil ~= nil then
    ModUtil.Path.Wrap( "SetupMap", function(baseFunc)
        LoadPackages({Name = "OEHera"})
        LoadPackages({Name = "OEHestia"})
        LoadPackages({Name = "OEApollo"})
        LoadPackages({Name = "OEMinor"})
        LoadPackages({Name = "OEHera"})
        return baseFunc()
    end)
    ModUtil.Mod.Register("OlympusExtra")
    -- Apollo Hestia Duo
ModUtil.LoadOnce(function()
    -- CodexMenu Compatibility
    if CodexMenu ~= nil then
        local OlympusTraitData = ModUtil.Entangled.ModData(LootData)
        local OlympusCodexMenuData = CodexMenu.BoonData
        --local OlympusCodexMenuReloadShouldSkip = OlympusCodexMenu.ReloadShouldSkip
        local OlympusRealGodNames = CodexMenu.RealGodNames
        local OlympusCodexBoonTable = CodexMenu.BoonTable
        local OlympusConsumableTable = CodexMenu.ConsumableTable
        local OlympusCodexBossTable = CodexMenu.BossTable
        OlympusCodexBossTable.Tartarus = RoomSetData.Tartarus.A_Makaria01
        OlympusCodexBossTable.Asphodel = RoomSetData.Tartarus.A_Combat01
        OlympusCodexBossTable.Elysium = RoomSetData.Elysium.C_Reprieve01
        OlympusCodexBossTable.Styx = RoomSetData.Styx.D_Reprieve01
        OlympusCodexBossTable.Secrets = RoomSetData.Secrets.RoomSecret01
        OlympusCodexBossTable.Surface = RoomSetData.Surface.E_Intro
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
                "HestiaShoutTrait", "StrongAttractionTrait", "HestiaRevengeTrait", "LastStandDamageReduceTrait",
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
            table.insert(OlympusCodexMenuData.Duos, "MoreTrapDamageTrait")
            table.insert(OlympusCodexMenuData.Duos, "ExplosionTrait")
            table.insert(OlympusCodexMenuData.Duos, "ChillFireTrait")
            table.insert(OlympusCodexMenuData.Duos, "FullHealBossTrait")
            table.insert(OlympusCodexMenuData.Duos, "FoesNumberDamageTrait")
            table.insert(OlympusCodexMenuData.Duos, "PullZeusCastTrait")
            table.insert(OlympusCodexMenuData.Duos, "FishingRewardExtraTrait")
            if ModUtil.Mods.Data["ApolloExtra"] ~= nil then
                table.insert(OlympusCodexMenuData.Duos, "ShoutMoreHealTrait")
            end
            -- CentaurSoul-CodexMenu
            table.insert(OlympusConsumableTable, "RoomRewardEmptyHealthDrop")
        end
        -- Hera
        if ModUtil.Mods.Data["HeraExtra"] ~= nil then
            OlympusCodexMenuData.HeraUpgrade = {
                "HeraWeaponTrait", "HeraSecondaryTrait", "HeraRushTrait", "HeraRangedTrait",
                "HeraShoutTrait", "PeriodicCurseTrait", "MoreCompanionTrait", "GiveCurseDeathTrait",
                "DiscountHeraTrait", "PrivilegeHeraTrait", "FamilyHeraTrait", "MoreRewardTrait",
                "EnvyBurstTrait", "StatusOverTimeTrait", "HealthAsObolTrait"
            }

            -- Apollo duos
            --[[table.insert(OlympusCodexMenuData.Duos, "FamedDuetTrait")
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
            --OlympusCodexMenuReloadShouldSkip.RerollObolTrait = true ]]        
            table.insert(OlympusCodexBoonTable, "HeraUpgrade")
            table.insert(OlympusRealGodNames, "Hera")
        end     
        --[[if ModUtil.Mods.Data["CerberusAssist"] ~= nil then
            table.insert(OlympusCodexMenuData.Consumables, "LastStandHealthDrop")            
        end]]
    end    
    -- Recompile data. Required for each gods so generic here.
    SetupRunData()

end)
end