-- Going to combine all mods
--Assets
local package = "OEAssets"
ModUtil.Path.Wrap( "SetupMap", function(baseFunc)
	DebugPrint({Text = "Trying to load package "..package..".pkg"})
	LoadPackages({Name = package})
	return baseFunc()
end)
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
            table.insert(OlympusCodexMenuData.Duos, "SeaChanteyTrait")
            table.insert(OlympusCodexMenuData.Duos, "MasterBoltTrait")
            table.insert(OlympusCodexMenuData.Duos, "MasterLobApolloTrait")
            table.insert(OlympusCodexMenuData.Duos, "MasterLobDionysusTrait")
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
    if ModUtil.Mods.Data["HestiaExtra"] ~= nil then
        --External mod interaction
        if CodexMenuData ~= nil then
            local OlympusCodexMenuData = ModUtil.Entangled.ModData(CodexMenuData)
            OlympusCodexMenuData.HestiaUpgrade = {
            "HestiaWeaponTrait"
            }
            local OlympusCodexMenuReloadShouldSkip = ModUtil.Entangled.ModData(CodexMenuReloadShouldSkip)    
            local OlympusCodexBoonTable = ModUtil.Entangled.ModData(CodexBoonTable)
            table.insert(OlympusCodexBoonTable, "HestiaUpgrade")

            local OlympusRealGodNames = ModUtil.Entangled.ModData(RealGodNames)
            table.insert(OlympusRealGodNames, "Hestia")

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