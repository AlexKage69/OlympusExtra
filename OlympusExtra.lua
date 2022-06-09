-- Going to combine all mods
if ModUtil ~= nil then
    ModUtil.Mod.Register("OlympusExtra")
    if ModUtil.Mods.Data["ApolloExtra"] ~= nil then
        --External mod interaction
        if CodexMenuData ~= nil then
            local OlympusCodexMenuData = ModUtil.Entangled.ModData(CodexMenuData)
            OlympusCodexMenuData.ApolloUpgrade = {
            "ApolloWeaponTrait", "ApolloDashTrait", "ApolloRangedTrait", "ApolloSecondaryTrait", 
            "ApolloShoutTrait", "ApolloRetaliateTrait", "FountainDefenseTrait", "FountainCoinTrait",
            "ApolloBlindedTrait", "ApolloHealTrait", "RerollObolTrait", "RerollBoonTrait",
            "MissChanceTrait",
            }
            table.insert(OlympusCodexMenuData.Duos, "FamedDuetTrait")
            table.insert(OlympusCodexMenuData.Duos, "WarSongTrait")
            table.insert(OlympusCodexMenuData.Duos, "HyacinthTrait")
            table.insert(OlympusCodexMenuData.Duos, "MasterBoltTrait")
            table.insert(OlympusCodexMenuData.Duos, "BlindDurationTrait")
            table.insert(OlympusCodexMenuData.Duos, "DamageReduceDistanceTrait")
            local OlympusCodexMenuReloadShouldSkip = ModUtil.Entangled.ModData(CodexMenuReloadShouldSkip)
            OlympusCodexMenuReloadShouldSkip.RerollBoonTrait = true
            OlympusCodexMenuReloadShouldSkip.RerollObolTrait = true         
            local OlympusCodexBoonTable = ModUtil.Entangled.ModData(CodexBoonTable)
            table.insert(OlympusCodexBoonTable, "ApolloUpgrade")

            local OlympusRealGodNames = ModUtil.Entangled.ModData(RealGodNames)
            table.insert(OlympusRealGodNames, "Apollo")

            --[[ModUtil.WrapBaseFunction( "SetupMap", function(baseFunc)
                LoadPackages({Names = {
                    "ApolloUpgrade",
                }})
                return baseFunc()
            end)]]
        end            
    end
    -- Recompile data. Required for each gods so generic here.
    ResetKeywords()
    SetupRunData()
end