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
    if CodexMenuData ~= nil then
        local OlympusCodexMenuData = ModUtil.Entangled.ModData(CodexMenuData)
        local OlympusCodexMenuReloadShouldSkip = ModUtil.Entangled.ModData(CodexMenuReloadShouldSkip)
        local OlympusRealGodNames = ModUtil.Entangled.ModData(RealGodNames)
        local OlympusCodexBoonTable = ModUtil.Entangled.ModData(CodexBoonTable)
        if ModUtil.Mods.Data["ApolloExtra"] ~= nil then
            OlympusCodexMenuData.ApolloUpgrade = {
                "ApolloWeaponTrait", "ApolloDashTrait", "ApolloRangedTrait", "ApolloSecondaryTrait", 
                "ApolloShoutTrait", "ApolloRetaliateTrait", "FountainDefenseTrait", "FountainCoinTrait",
                "ApolloBlindedTrait", "ApolloHealTrait", "RerollObolTrait", "RerollBoonTrait",
                "MissChanceTrait",
            }
            table.insert(OlympusCodexMenuData.Duos, "FamedDuetTrait")
            table.insert(OlympusCodexMenuData.Duos, "WarSongTrait")
            table.insert(OlympusCodexMenuData.Duos, "HyacinthTrait")
            table.insert(OlympusCodexMenuData.Duos, "SeaChanteyTrait")
            table.insert(OlympusCodexMenuData.Duos, "MasterBoltTrait")
            table.insert(OlympusCodexMenuData.Duos, "MasterLobApolloTrait")
            table.insert(OlympusCodexMenuData.Duos, "MasterLobDionysusTrait")
            table.insert(OlympusCodexMenuData.Duos, "BlindDurationTrait")
            table.insert(OlympusCodexMenuData.Duos, "DamageReduceDistanceTrait")
            table.insert(OlympusCodexMenuData.Legendaries, "MissChanceTrait")
            table.insert(OlympusCodexMenuData.BeowulfTraits, "ShieldLoadAmmo_ApolloRangedTrait")
            OlympusCodexMenuReloadShouldSkip.RerollBoonTrait = true
            OlympusCodexMenuReloadShouldSkip.RerollObolTrait = true         
            table.insert(OlympusCodexBoonTable, "ApolloUpgrade")
            table.insert(OlympusRealGodNames, "Apollo")
        end         
        if ModUtil.Mods.Data["HestiaExtra"] ~= nil then
            --External mod interaction
            OlympusCodexMenuData.HestiaUpgrade = {
                "HestiaWeaponTrait", "HestiaDashTrait", "HestiaRangedTrait", "HestiaSecondaryTrait",
                "HestiaShoutTrait", "StrongAttractionTrait", "HestiaRevengeTrait",
                "LastStandHealthDrop", "HealthDamageTrait", "LavaDeathTrait", "LavaResistTrait", 
                "LavaLongerTrait", "LavaAutoTrait"
            }
            table.insert(OlympusCodexMenuData.Consumables, "LastStandHealthDrop")
            table.insert(OlympusCodexMenuData.Legendaries, "LavaAutoTrait")
            table.insert(OlympusCodexMenuData.BeowulfTraits, "ShieldLoadAmmo_HestiaRangedTrait")
            OlympusCodexMenuData.ConsumableTraits.LastStandHealthDrop = "HealthDefianceTrait"
            table.insert(OlympusCodexBoonTable, "HestiaUpgrade")
            table.insert(OlympusRealGodNames, "Hestia")
        end
    end
    -- Recompile data. Required for each gods so generic here.
    ResetKeywords()
    SetupRunData()
end