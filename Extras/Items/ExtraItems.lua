if ModUtil ~= nil then

	ModUtil.Mod.Register("ExtraItems")
	local mod = "ExtraItems"
    local package = "ItemsPackage"
    
	local OlympusStoreData = ModUtil.Entangled.ModData(StoreData)
	local OlympusTraitData = ModUtil.Entangled.ModData(TraitData)
	local OlympusConsumableData = ModUtil.Entangled.ModData(ConsumableData)
	
    OlympusTraitData.TemporaryLavaImmunityTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Release_Parchment",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Paper",
		Cost = 70,
		UsesAsEncounters = true,
        RequiredFalseRooms = { "A_PostBoss01", "B_PostBoss01", "C_PostBoss01" },
		RequiredNoChallengeSwitchInRoom = true,
		RequiredBiome = "Asphodel",
		RequiredMaxBiomeDepth = 7,
		RemainingUses = 9,
		SetupFunction =
		{
			Name = "AddEffectImmunities",
			Args =
			{
				EffectNames =
				{
					"LavaSlow",
				},
			},
			RunOnce = true,
		},
		ProcSound = "/Leftovers/SFX/PositiveTalismanProc_2",
		PropertyChanges ={},
	}
    OlympusTraitData.TemporaryStyxPoisonImmunityTrait = {
        InheritFrom = { "ShopTrait" },
        Icon = "Shop_Stone",
        --Icon = "Shop_Release_Parchment",
        OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Crystal",
        --OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Paper",
        Cost = 80,
        UsesAsEncounters = true,
        RequiredFalseRooms = { "A_PostBoss01", "B_PostBoss01", "C_PostBoss01" },
        RequiredNoChallengeSwitchInRoom = true,
        RequiredBiome = "Styx",
        --RequiredMaxBiomeDepth = 7,
        RemainingUses = 14,
        --RequiredFalseTrait = "PoisonImmunityTrait",
        SetupFunction =
        {
            Name = "AddEffectImmunities",
            Args =
            {
                EffectNames =
                {
                    "StyxPoison",
                },
            },
            RunOnce = true,
        },
        ProcSound = "/Leftovers/SFX/PositiveTalismanProc_2",
        --[[LowHealthThresholdText =
        {
            -- Display variable only, to change the data value change the value below under "LowHealthThreshold"
            Threshold = 0.3,
            Text = "Hint_PoisonImmunityTrait",
        },]]
        --[[AddOutgoingDamageModifiers =
        {
            LowHealthThreshold = 0.3,
            LowHealthDamageOutputMultiplier =
            {
                BaseValue = 1.2,
                SourceIsMultiplier = true,
            },
            ExtractValues =
            {
                {
                    Key = "LowHealthDamageOutputMultiplier",
                    ExtractAs = "TooltipBonus",
                    Format = "PercentDelta",
                },
                {
                    Key = "LowHealthThreshold",
                    ExtractAs = "TooltipThreshold",
                    Format = "Percent",
                },
            }
        },]]
        PropertyChanges =
        {


        },
    }
	OlympusTraitData.TemporaryNPCConsummableTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Release_Parchment",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Crystal",
		Cost = 85,
		RemainingUses = 1,
		ForceNPCEncounter = true,
		PropertyChanges ={},
	}
    OlympusTraitData.TemporaryForcedErebusDoorTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Lamp",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Crystal",
		Cost = 35,
		RemainingUses = 1,
		ForceShrinePointDoor = true,
		--RequiredScreenViewed = "ShrineUpgrade",
		--RequiredMinRoomsSinceShrinePointDoor = 4,
		RequiredCosmetics = { "ShrinePointGates", },
		--RequiredMaxDepth = 32,
	}
	--[[OlympusTraitData.TemporaryForcedGardenDoorTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Release_Parchment",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Crystal",
		Cost = 40,
		RemainingUses = 1,
		ForceGardenDoor = true,
		RequiredTextLines = { "GaiaFirstPickUp", },
		RequiredMaxDepth = 32,
		PropertyChanges ={},
	}]]
	OlympusTraitData.TemporaryDoubleBoonTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Release_Parchment",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Crystal",
		Cost = 65,
		RemainingUses = 1,
		BonusLootAmount = 1,
		RequiredBiome = "Tartarus",
		RequiredMaxBiomeDepth = 2,
		PropertyChanges ={},
	}
	OlympusTraitData.TemporaryHeroicUpgradeTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Release_Parchment",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Crystal",
		Cost = 70,
		RemainingUses = 12,
		UsesAsEncounters = true,
		OnExpire = {
			TraitData = { Name = "HeroicUpgradeTrait" }
		},
		PropertyChanges ={},
	}
	OlympusConsumableData.HeroicUpgradeTrait = 
	{
		InheritFrom = { "BaseConsumable", },		
		--ConsumeSound = "/SFX/PomegranatePowerUpDrop",
		UseFunctionName =  "UpgradeToHeroicTrait",
		UseFunctionArgs = { Thread = true, NumTraits = 1, NumStacks = 1, Delay = 0.25 },
		UseText = "UseStoreRewardRandomStack",
		PurchaseText = "UseStoreRewardRandomStack",
		Cost = 0,
	}
	OlympusTraitData.TemporaryPomUpgradeTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Release_Parchment",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Crystal",
		Cost = 70,
		RemainingUses = 6,
		OnExpire = {
			TraitData = { Name = "HeroicUpgradeTrait" }
		},
		PropertyChanges ={},
	}
	OlympusConsumableData.PomUpgradeTrait = 
	{
		InheritFrom = { "BaseConsumable", },		
		--ConsumeSound = "/SFX/PomegranatePowerUpDrop",
		UseFunctionName =  "UpgradeToPomTrait",
		UseFunctionArgs = { Thread = true, NumTraits = 1, NumStacks = 1, Delay = 0.25 },
		UseText = "UseStoreRewardRandomStack",
		PurchaseText = "UseStoreRewardRandomStack",
		Cost = 0,
	}
	OlympusConsumableData.TemporaryAddRerollTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Release_Parchment",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Crystal",
		Cost = 50,
		AddRerolls = 5,
		AddRerollArgs =
		{
			Thread = true,
			Delay = 0.5,
		},
		PropertyChanges ={},
	}
	OlympusConsumableData.TemporaryRandomEffectTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Release_Parchment",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Crystal",
		UseFunctionName =  "ApplyPandoraTrait",
		UseFunctionArgs = {  },
		Cost = 5,
		PropertyChanges ={},
	}
	--[[OlympusTraitData.PandoraTrait =
	{
		Frame = "Shop_Vial"
	}
	OlympusTraitData.PandoraAttackUp =
	{
		InheritFrom = { "PandoraTrait" },
		Icon = "Shop_Release_Parchment",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Crystal",
		PropertyChanges ={},
	}
	OlympusTraitData.PandoraAttackDown =
	{
		InheritFrom = { "PandoraTrait" },
		Icon = "Shop_Release_Parchment",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Crystal",
		PropertyChanges ={},
	}
	OlympusTraitData.PandoraSpecialUp =
	{
		InheritFrom = { "PandoraTrait" },
		Icon = "Shop_Release_Parchment",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Crystal",
		PropertyChanges ={},
	}
	OlympusTraitData.PandoraSpecialDown =
	{
		InheritFrom = { "PandoraTrait" },
		Icon = "Shop_Release_Parchment",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Crystal",
		PropertyChanges ={},
	}	
	OlympusTraitData.PandoraSpeedUp =
	{
		InheritFrom = { "PandoraTrait" },
		Icon = "Shop_Release_Parchment",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Crystal",
		PropertyChanges ={},
	}	
	OlympusTraitData.PandoraSpeedDown =
	{
		InheritFrom = { "PandoraTrait" },
		Icon = "Shop_Release_Parchment",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Crystal",
		PropertyChanges ={},
	}	
	OlympusTraitData.PandoraFoesUp =
	{
		InheritFrom = { "PandoraTrait" },
		Icon = "Shop_Release_Parchment",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Crystal",
		PropertyChanges ={},
	}	
	OlympusTraitData.PandoraFoesDown =
	{
		InheritFrom = { "PandoraTrait" },
		Icon = "Shop_Release_Parchment",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Crystal",
		PropertyChanges ={},
	}	
	OlympusTraitData.PandoraRangedUp =
	{
		InheritFrom = { "PandoraTrait" },
		Icon = "Shop_Release_Parchment",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Crystal",
		PropertyChanges ={},
	}	
	OlympusTraitData.PandoraRangedDown =
	{
		InheritFrom = { "PandoraTrait" },
		Icon = "Shop_Release_Parchment",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Crystal",
		PropertyChanges ={},
	}]]
	OlympusStoreData.RoomShop.Traits = {
		"TemporaryLavaImmunityTrait",
		"TemporaryStyxPoisonImmunityTrait",
		"TemporaryNPCConsummableTrait",
		"TemporaryForcedErebusDoorTrait",
		"TemporaryDoubleBoonTrait",
		"TemporaryHeroicUpgradeTrait",
		"TemporaryPomUpgradeTrait",
		"TemporaryAddRerollTrait",
		"TemporaryRandomEffectTrait"
	}
    --[[table.insert(OlympusStoreData.RoomShop.Traits, "TemporaryLavaImmunityTrait")
    table.insert(OlympusStoreData.RoomShop.Traits, "TemporaryStyxPoisonImmunityTrait")
    table.insert(OlympusStoreData.RoomShop.Traits, "TemporaryNPCConsummableTrait")
    table.insert(OlympusStoreData.RoomShop.Traits, "TemporaryForcedErebusDoorTrait")
    --table.insert(OlympusStoreData.RoomShop.Traits, "TemporaryForcedGardenDoorTrait")
    table.insert(OlympusStoreData.RoomShop.Traits, "TemporaryDoubleBoonTrait")
    table.insert(OlympusStoreData.RoomShop.Traits, "TemporaryHeroicUpgradeTrait")
    table.insert(OlympusStoreData.RoomShop.Traits, "TemporaryPomUpgradeTrait")
    table.insert(OlympusStoreData.RoomShop.Traits, "TemporaryAddRerollTrait")
    table.insert(OlympusStoreData.RoomShop.Traits, "TemporaryRandomEffectTrait")]]
-- Functions
	function UpgradeToHeroicTrait( args )
		args = args or {}
		ModUtil.Hades.PrintStackChunks(ModUtil.ToString("UpgradeToHeroicTrait"))
		--[[if args.NumStacks then
			args.NumStacks = args.NumStacks + GetTotalHeroTraitValue("PomLevelBonus")
		end
		AddStackToTraits( args )
		StoreRewardRandomStackPresentation()]]
	end
	function UpgradeToPomTrait( args )
		args = args or {}
		ModUtil.Hades.PrintStackChunks(ModUtil.ToString("UpgradeToPomTrait"))
		--[[if args.NumStacks then
			args.NumStacks = args.NumStacks + GetTotalHeroTraitValue("PomLevelBonus")
		end
		AddStackToTraits( args )
		StoreRewardRandomStackPresentation()]]
	end
	function ApplyPandoraTrait( args )
		args = args or {}
		ModUtil.Hades.PrintStackChunks(ModUtil.ToString("ApplyPandoraTrait"))
		--[[if args.NumStacks then
			args.NumStacks = args.NumStacks + GetTotalHeroTraitValue("PomLevelBonus")
		end
		AddStackToTraits( args )
		StoreRewardRandomStackPresentation()]]
	end
end