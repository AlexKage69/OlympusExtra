if ModUtil ~= nil then

	ModUtil.Mod.Register("ExtraItems")
	local mod = "ExtraItems"
    local package = "ItemsPackage"
    
	local OlympusStoreData = ModUtil.Entangled.ModData(StoreData)
	local OlympusTraitData = ModUtil.Entangled.ModData(TraitData)
    OlympusTraitData.TemporaryLavaImmunityTrait =
	{
		InheritFrom = { "ShopTrait" },
		--Icon = "Shop_Stone",
		Icon = "Shop_Release_Parchment",
		--OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Crystal",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Paper",
		Cost = 85,
		UsesAsEncounters = true,
        RequiredFalseRooms = { "A_PostBoss01", "B_PostBoss01", "C_PostBoss01" },
		RequiredNoChallengeSwitchInRoom = true,
		RequiredBiome = "Asphodel",
		RequiredMaxBiomeDepth = 7,
		RemainingUses = 9,
		--RequiredFalseTrait = "PoisonImmunityTrait",
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
    OlympusTraitData.TemporaryStyxPoisonImmunityTrait = {
        InheritFrom = { "ShopTrait" },
        Icon = "Shop_Stone",
        --Icon = "Shop_Release_Parchment",
        OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Crystal",
        --OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Paper",
        Cost = 85,
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
    OlympusTraitData.TemporaryForcedErebusDoorTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Lamp",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Crystal",
		Cost = 55,
		RemainingUses = 1,
		ForceShrinePointDoor = true,
		RequiredScreenViewed = "ShrineUpgrade",
		--RequiredMinRoomsSinceShrinePointDoor = 4,
		RequiredCosmetics = { "ShrinePointGates", },
		RequiredMaxDepth = 32,
	}
    table.insert(OlympusStoreData.RoomShop.Traits, "TemporaryLavaImmunityTrait")
    table.insert(OlympusStoreData.RoomShop.Traits, "TemporaryStyxPoisonImmunityTrait")
    table.insert(OlympusStoreData.RoomShop.Traits, "TemporaryForcedErebusDoorTrait")
end