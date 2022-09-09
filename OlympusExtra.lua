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
    -- Apollo Hestia Duo   
        local OlympusLootData = ModUtil.Entangled.ModData(LootData)   
        local OlympusTraitData = ModUtil.Entangled.ModData(TraitData)
    if ModUtil.Mods.Data["HestiaExtra"] ~= nil and ModUtil.Mods.Data["ApolloExtra"] ~= nil  then     
        OlympusTraitData.BlindExtraHealTrait = {
            InheritFrom = { "SynergyTrait" },
            Icon = "Hestia_Apollo_01",
            RequiredFalseTrait = "BlindExtraHealTrait",	
        }
        OlympusLootData.HestiaUpgrade.DuoPickupTextLineSets.HestiaWithApollo01 = {
            Name = "HestiaWithApollo01",
            PlayOnce = true,
            PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
            HasTraitNameInRoom = "BlindAuraTrait",
            { Cue = "/VO/Hestia_0166",
                StartSound = "/Leftovers/World Sounds/MapZoomInShort",
                Text = "Young Apollo, it seems like our tardiness in assisting Zagreus has made him fail to escape more than once. We should do the upmost to make up for our delay." },
            { Cue = "/VO/Apollo_0300",
                PortraitExitWait = 0.35,
                PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
                StartSound = "/SFX/LyreMedium",
                EndSound = "/Leftovers/World Sounds/MapZoomInShort",
                Speaker = "NPC_Apollo_01", Portrait = "Portrait_Apollo_Default_01",
                Text = "Ah, Lady Hestia, nothing makes me more happy than helping my beloved Zagzag. But Artemis should have told me about him way earlier! Anyway, I'm here now." },
        }
        OlympusLootData.ApolloUpgrade.DuoPickupTextLineSets.ApolloWithHestia01 = {
            Name = "ApolloWithHestia01",
            PlayOnce = true,
            PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
            HasTraitNameInRoom = "BlindAuraTrait",
            { Cue = "/VO/Apollo_0301",
                StartSound = "/Leftovers/World Sounds/MapZoomInShort",
                Text = "With my light and your warmth, Aunty, Zagzag truly has the power of the sun on his side. And the sun belongs in the sky above with us." },
            { Cue = "/VO/Hestia_0167",
                PortraitExitWait = 0.35,
                PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
                StartSound = "/SFX/BurnDamage",
                EndSound = "/Leftovers/World Sounds/MapZoomInShort",
                Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
                Text = "Haha, always the poet, I see. I must say, since Zagreus cannot, that I appreciate everything you do for our {#DialogueItalicFormat}Zagzag{#PreviousFormat}. Though, I wouldn't call him that, since he could find a worse nickname in turn." },
        }
    end
    -- CodexMenu Compatibility
    if CodexMenu ~= nil then
        local OlympusTraitData = ModUtil.Entangled.ModData(LootData)
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
            table.insert(OlympusCodexMenuData.Duos, "LavaCrystalTrait")        
            table.insert(OlympusCodexMenuData.Duos, "FullHealBossTrait")        
            table.insert(OlympusCodexMenuData.Duos, "CloseDamageBuffTrait")        
            table.insert(OlympusCodexMenuData.Duos, "ShoutMaxIncreaseTrait")    
            table.insert(OlympusCodexMenuData.Duos, "FishingRewardExtraTrait")         
            
            -- CentaurSoul-CodexMenu
            table.insert(OlympusConsumableTable, "RoomRewardEmptyHealthDrop")
        end
        if ModUtil.Mods.Data["HestiaExtra"] ~= nil and ModUtil.Mods.Data["ApolloExtra"] ~= nil  then     
            table.insert(OlympusCodexMenuData.Duos, "BlindExtraHealTrait")      
        end
    end    
    -- Recompile data. Required for each gods so generic here.
    SetupRunData()
end


ModUtil.Path.Wrap( "AddRerolls", 
	function(baseFunc, amount, source, args )
        if type(amount) == "number" then
		    baseFunc(amount, source, args)
        end
	end
)