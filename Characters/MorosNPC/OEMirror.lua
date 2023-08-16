local OlympusMetaUpgradeData = ModUtil.Entangled.ModData(MetaUpgradeData)
local OlympusMetaUpgradeOrder = ModUtil.Entangled.ModData(MetaUpgradeOrder)
local OlympusKeywordList = ModUtil.Entangled.ModData(KeywordList)
local OlympusColor = ModUtil.Entangled.ModData(Color)
local OlympusResourceData = ModUtil.Entangled.ModData(ResourceData)
local OlympusRewardStoreData = ModUtil.Entangled.ModData(RewardStoreData)


OlympusColor.OEMirrorAttribute = { 145,17,55, 255 }

	OlympusMetaUpgradeData.LowHealthDamageMetaUpgrade =
	{
		InheritFrom = { "BaseMetaUpgrade", },
		Icon = "MirrorIcon_LowHealthDamage",
		Starting = true,
		CostTable = { 10, 15, 20, 25, 30 },
		ShortTotal = "LowHealthDamageMetaUpgrade_ShortTotal",
		ChangeValue = 1.12,
		FormatAsPercent = true,
		AddOutgoingDamageModifiers =
		{
			TargetHighHealthThreshold = 0.30,
			TargetHighHealthDamageOutputMultiplier = 1.12
		}
	}

	OlympusMetaUpgradeData.GemHealMetaUpgrade =
	{
		InheritFrom = { "BaseMetaUpgrade", },
		Icon = "MirrorIcon_GemHeal",
		Starting = true,
		CostTable = { 20, 40, 60, 80 },
		ShortTotal = "GemHealMetaUpgrade_ShortTotal",
		ShortTotalNoIcon = "GemHealMetaUpgrade_ShortTotalNoIcon",
		FormatAsPercent = true,
		ChangeValue = 1.25,
	}
	OlympusResourceData.Gems.OnAddedFunctionName = "OnGemsAdded"
	OlympusMetaUpgradeData.ExtraChanceFloorMetaUpgrade=
	{
		InheritFrom = { "BaseMetaUpgrade", },
		Icon = "MirrorIcon_ExtraChanceFloor",
		Starting = true,
		CostTable = { 200, 500 },
		Color = { 255, 255, 255, 255 },
		ShortTotal = "ExtraChanceFloorMetaUpgrade_ShortTotal",
		ShortTotalNoIcon = "ExtraChanceFloorMetaUpgrade_ShortTotalNoIcon",
		ChangeValue = 1,
		HealPercent = 0.4,
		KeywordOverride =
		{
			Key = "ExtraChance",
			Value = "ExtraChanceAlt2",
		},
	}
	OlympusMetaUpgradeData.DashlessMetaUpgrade =
	{
		InheritFrom = { "BaseMetaUpgrade", },
		Icon = "MirrorIcon_DashlessBonus",
		Starting = true,
		CostTable = { 30, 65, 100, 150 },
		ShortTotal = "DashlessMetaUpgrade_ShortTotal",
		ShortTotalNoIcon = "DashlessMetaUpgrade_ShortTotalNoIcon",
		--PreEquipWeapon = "PerfectDashEmpowerApplicator",
		ChangeValue = 1.05, -- display variable, change below value to affect gameplay
	}
	OlympusMetaUpgradeData.NoAmmoMetaUpgrade =
	{
		InheritFrom = { "BaseMetaUpgrade", },
		Icon = "MirrorIcon_NoAmmoBonus",
		Starting = true,
		CostTable = { 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 },
		Color = { 255, 255, 255, 255 },
		ShortTotal = "NoAmmoMetaUpgrade_ShortTotal",
		ChangeValue = 1.02,
		FormatAsPercent = true,
		--[[AddOutgoingDamageModifiers =
		{
			ValidWeapons = WeaponSets.HeroPrimarySecondaryWeapons,
			StoredAmmoMultiplier = 1.1,
		}]]
	}
	OlympusMetaUpgradeData.BounceAmmoMetaUpgrade =
	{
		InheritFrom = { "BaseMetaUpgrade", },
		Icon = "MirrorIcon_AmmoBounce",
		Starting = true,
		Cost = 10,
		CostTable = { 40, 90, 160 },
		ShortTotal = "BounceAmmoMetaUpgrade_ShortTotal",
		ShortTotalNoIcon = "BounceAmmoMetaUpgrade_ShortTotalNoIcon",
		ChangeValue = 1.0,
		KeywordOverrides =
		{
			{
				Key = "Cast",
				Value = "Cast",
			},
			{
				Key = "Ammo",
				Value = "Ammo",
			}
		},
		--[[PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "MaxAmmo",
				ChangeValue = 1,
				ChangeType = "Add",
			},
		},]]
	}
	OlympusMetaUpgradeData.BonusMoneyMetaUpgrade =
	{
		InheritFrom = { "BaseMetaUpgrade", },
		Icon = "MirrorIcon_BonusMoneyMirror",
		RequiredAccumulatedMetaPoints = 120,
		Starting = true,
		CostTable = { 15, 30, 60, 90, 120 },
		ShortTotal = "BonusMoneyMetaUpgrade_ShortTotal",
		ShortTotalNoIcon = "BonusMoneyMetaUpgrade_ShortTotalNoIcon",
		ChangeValue = 1.0,
		MoneyMultiplier =
		{
			BaseValue = 1.02,
			SourceIsMultiplier = true,
		},
	}
	OlympusMetaUpgradeData.RegenerationMetaUpgrade =
	{
		InheritFrom = { "BaseMetaUpgrade", },
		Icon = "MirrorIcon_CombatRegeneration",
		RequiredAccumulatedMetaPoints = 200,
		Starting = true,
		CostTable = { 55, 105, 155 },
		ShortTotal = "RegenerationMetaUpgrade_ShortTotal",
		ShortTotalNoIcon = "RegenerationMetaUpgrade_ShortTotalNoIcon",
		ChangeValue = 1.0,
		HealthThreshold = 0.3,
		--[[PropertyChanges =
		{
			{
				LuaProperty = "MaxHealth",
				ChangeValue = 5,
				ChangeType = "Add",
			},
		}]]
	}
	OlympusMetaUpgradeData.EpicBonusMetaUpgrade =
	{
		InheritFrom = { "BaseMetaUpgrade", },
		Icon = "MirrorIcon_EpicBonus",
		Starting = true,
		CostTable = { 25, 35, 45, 55, 65 },
		Color = { 255, 255, 255, 255 },
		ShortTotal = "EpicBonusMetaUpgrade_ShortTotal",
		ShortTotalNoIcon = "EpicBonusMetaUpgrade_ShortTotalNoIcon",
		InRunTooltip = "EpicBonus_InRun",
		InRunValueFunctionName = "GetTotalEpicBonus",
		ChangeValue = 1.004,
		DecimalPlaces = 1,
		--[[AddOutgoingDamageModifiers =
		{
			PerUniqueGodMultiplier = 1.04,
		}]]
	}
	OlympusMetaUpgradeData.RareNPCMetaUpgrade =
	{
		InheritFrom = { "BaseMetaUpgrade", },
		Icon = "MirrorIcon_NPCEncounterBonus",
		RequiredAccumulatedMetaPoints = 500,
		Starting = true,
		CostTable = { 100, 200, 300, 400, 500 },
		--MaxInvestment = 40,
		ShortTotal = "RareNPCMetaUpgrade_ShortTotal",
		ChangeValue = 1.02,
	}
	OlympusMetaUpgradeData.PomFirstGodMetaUpgrade =
	{
		InheritFrom = { "BaseMetaUpgrade", },
		Icon = "MirrorIcon_PomFirstGod",
		RequiredAccumulatedMetaPoints = 1000,
		Starting = true,
		CostTable = { 900 },
		--MaxInvestment = 20,
		ShortTotal = "PomFirstGodMetaUpgrade_ShortTotal",
		ChangeValue = 1.00,
		HelpTextTable =
		{
			[0] = "PomFirstGodMetaUpgrade_Off",
			[1] = "PomFirstGodMetaUpgrade_On",
		},
	}
	
	OlympusMetaUpgradeData.RerollPomMetaUpgrade =
	{
		InheritFrom = { "BaseMetaUpgrade", },
		Icon = "MirrorIcon_RerollPom",
		Starting = true,
		CostTable = { 300, 600, 1200, 1600, 1800, 2000},
		ShortTotal = "RerollPomMetaUpgrade_ShortTotal",
		ShortTotalNoIcon = "RerollPomMetaUpgrade_ShortTotalNoIcon",
		ChangeValue = 1,
	}
	ModUtil.Table.Merge(OlympusKeywordList, { 
		"LowHealthDamage", "GemHeal", "ExtraChanceFloor", "DashlessBonus",
		"NoAmmoBonus", "AmmoBounce", "BonusMoneyMirror", "CombatRegeneration",
		"EpicBonus", "NPCEncounterBonus", "PomFirstGod", "RerollPom",
	})
	ResetKeywords()
table.insert(OlympusMetaUpgradeOrder[1], 3, "LowHealthDamageMetaUpgrade")
table.insert(OlympusMetaUpgradeOrder[2], 3, "GemHealMetaUpgrade")
table.insert(OlympusMetaUpgradeOrder[3], 3, "ExtraChanceFloorMetaUpgrade")
table.insert(OlympusMetaUpgradeOrder[4], 3, "DashlessMetaUpgrade")
table.insert(OlympusMetaUpgradeOrder[5], 3, "NoAmmoMetaUpgrade")
table.insert(OlympusMetaUpgradeOrder[6], 3, "BounceAmmoMetaUpgrade")
table.insert(OlympusMetaUpgradeOrder[7], 3, "BonusMoneyMetaUpgrade")
table.insert(OlympusMetaUpgradeOrder[8], 3, "RegenerationMetaUpgrade")
table.insert(OlympusMetaUpgradeOrder[9], 3, "EpicBonusMetaUpgrade")
table.insert(OlympusMetaUpgradeOrder[10], 3, "RareNPCMetaUpgrade")
table.insert(OlympusMetaUpgradeOrder[11], 3, "PomFirstGodMetaUpgrade")
table.insert(OlympusMetaUpgradeOrder[12], 3, "RerollPomMetaUpgrade")
-- Functions
ModUtil.Path.Wrap("HandleMetaUpgradeInput",
	function(baseFunc, screen, button)
		baseFunc(screen, button)
	end
)
ModUtil.Path.Wrap("CreateMetaUpgradeEntry",
	function(baseFunc, args)
		baseFunc(args)
		local components = args.Components
		local upgradeData = args.Data
		local upgradeName = upgradeData.Name
		local k = args.Index
		--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(upgradeName))
		--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(k..";"..upgradeName))
		if args.Swap and MetaUpgradeOrder[k] and MetaUpgradeOrder[k][3] == upgradeName then
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("New"))
			ModifyTextBox({ Id =  components["Backing"..k].Id, Color = Color.OEMirrorAttribute })
		end
		
		if MetaUpgradeOrder[k] and MetaUpgradeOrder[k][1] == upgradeName then
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("New"))
			ModifyTextBox({ Id =  components["Backing"..k].Id, Color = Color.DarknessPoint })
		end
	end
)
ModUtil.Path.Wrap("SwapMetaupgrade",
	function(baseFunc, screen, button)
		local index = button.Index
		local itemBackingKey = "Backing"..index
		local unlockId = "Locked"..index
		local lockIconKey = "LockIcon"..index
		local metaUpgradeNextCostKey = "UpgradeCost"..index
		local upgradeName = button.Name
		local components = screen.Components
		local isSwapToBSide = ( MetaUpgradeOrder[index][1] == upgradeName )

		SwapMetaUpgradePresentation( screen, components[itemBackingKey.."Swap"], isSwapToBSide )

		DestroyTextBox({Id = components[itemBackingKey].Id })
		Destroy({ Id = components["Icon"..index].Id })
		Destroy({ Id = components["UpgradeValueTotal"..index].Id })
		Destroy({ Id = components["UpgradeCost"..index].Id })
		Destroy({ Ids = { components[itemBackingKey.."Swap"].Id, components[metaUpgradeNextCostKey].Id }})
		components[unlockId] = nil
		components[metaUpgradeNextCostKey] = nil
		components[itemBackingKey.."Swap"] = nil

		GameState.MetaUpgradeState = GameState.MetaUpgradeState or {}

		local numUpgrades = GetNumMetaUpgrades( upgradeName )
		GameState.MetaUpgradeState[upgradeName] = numUpgrades
		for i = 1, numUpgrades, 1 do
			DecrementTableValue( GameState.MetaUpgrades, upgradeName )
			ApplyMetaUpgrade( MetaUpgradeData[upgradeName], true, GameState.MetaUpgrades[upgradeName] <= 0, true )
		end

		local metaupgradeData = nil
		local takenext = false
		for i, entryName in pairs(MetaUpgradeOrder[index]) do
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(entryName))
			if takenext then
				--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("true"))
				metaupgradeData = MetaUpgradeData[entryName]
				GameState.MetaUpgradesSelected[index] = entryName
				local savedUpgrades = GameState.MetaUpgradeState[ entryName ] or 0
				for i = 1, savedUpgrades, 1 do
					IncrementTableValue( GameState.MetaUpgrades, entryName )
					ApplyMetaUpgrade( MetaUpgradeData[ entryName ], true, GameState.MetaUpgrades[entryName] > 1 )
				end
				break
			end
			if entryName == upgradeName then
				takenext = true
			end			
		end
		if metaupgradeData == nil then
			local entryName = MetaUpgradeOrder[index][1]
			metaupgradeData = MetaUpgradeData[entryName]
			GameState.MetaUpgradesSelected[index] = entryName
			local savedUpgrades = GameState.MetaUpgradeState[ entryName ] or 0
			for i = 1, savedUpgrades, 1 do
				IncrementTableValue( GameState.MetaUpgrades, entryName )
				ApplyMetaUpgrade( MetaUpgradeData[ entryName ], true, GameState.MetaUpgrades[entryName] > 1 )
			end
		end
		wait( 0.01 )
		CreateMetaUpgradeEntry( { Screen = screen, Components = components, Data = metaupgradeData, Index = index, OffsetY = button.OffsetY, Swap = GameState.Flags.SwapMetaupgradesEnabled } )
		UpdateButtonStates( screen )
		CurrentRun.NumRerolls = GetNumMetaUpgrades( "RerollMetaUpgrade" ) + GetNumMetaUpgrades("RerollPanelMetaUpgrade")
		if CurrentRun.NumRerolls > 0 then
			ShowResourceUIs({ CombatOnly = false })
		end
		UpdateRerollUI( CurrentRun.NumRerolls )
	end
)
ModUtil.Path.Wrap("InitHeroLastStands",
	function(baseFunc, newHero)
		baseFunc(newHero)
		for s = 1, GetNumMetaUpgrades("ExtraChanceFloorMetaUpgrade" ) do
			for i = 1, MetaUpgradeData["ExtraChanceFloorMetaUpgrade"].ChangeValue do
				AddLastStand({
					Name = "ExtraChanceFloorMetaUpgrade",
					Unit = newHero,
					IncreaseMax = true,
					Icon = "ExtraLifeReplenish",
					WeaponName = "LastStandMetaUpgradeShield",
					HealFraction = MetaUpgradeData.ExtraChanceFloorMetaUpgrade.HealPercent,
					Silent = true
				})
			end
		end
	end
)
ModUtil.Path.Wrap("GetNumMetaUpgradeLastStands",
	function(baseFunc)
		return baseFunc() + GetNumMetaUpgrades("ExtraChanceFloorMetaUpgrade")
	end
)
	ModUtil.Path.Wrap("GetUseText",
		function(baseFunc, useTarget)
			local usetext = baseFunc(useTarget)
			if usetext == "UseGemDropRunProgress" or usetext == "UseGemDrop" and GetNumMetaUpgrades("GemHealMetaUpgrade") > 0 then
				useTarget.MaxHealthAmount = GetGemsMaxHealthAdded(useTarget.AddResources.Gems)
				usetext = usetext.."_Health"
			end
			return usetext
		end
	)
ModUtil.Path.Wrap("StartRoom",
	function(baseFunc, currentRun, currentRoom)
		
	local biomeDepth = currentRun.BiomeDepthCache or GetBiomeDepth( currentRun )
	ModUtil.Hades.PrintStackChunks(ModUtil.ToString(biomeDepth))
	if GetNumMetaUpgrades("ExtraChanceFloorMetaUpgrade") > 0 and biomeDepth == 1 then
		local numRegenerationLastStands = 0
		for i, lastStand in pairs(CurrentRun.Hero.LastStands) do
			if lastStand.Name == "ExtraChanceFloorMetaUpgrade" then
				numRegenerationLastStands = numRegenerationLastStands + 1
			end
		end
		while GetNumMetaUpgrades("ExtraChanceFloorMetaUpgrade") > numRegenerationLastStands do
			AddLastStand({
				Name = "ExtraChanceFloorMetaUpgrade",
				Unit = CurrentRun.Hero,
				Icon = "ExtraLifeReplenish",
				WeaponName = "LastStandMetaUpgradeShield",
				HealFraction = MetaUpgradeData.ExtraChanceFloorMetaUpgrade.HealPercent,
				Silent = true
			})
			numRegenerationLastStands = numRegenerationLastStands + 1
		end
		CurrentRun.Hero.MaxLastStands = TableLength(CurrentRun.Hero.LastStands)
	end

		baseFunc(currentRun, currentRoom)
	end
)
function GetTotalEpicBonus()
	local perGodMultiplier = GetTotalStatChange( MetaUpgradeData.GodEnhancementMetaUpgrade )
	local godDictionary = {}
	for traitName in pairs( CurrentRun.Hero.TraitDictionary ) do
		if GetLootSourceName( traitName ) then
			godDictionary[GetLootSourceName( traitName )] = true
		end
	end
	return 2
end

function EnableOEMirrorSwap()
	GameState.Flags.NewPagesMetaupgradesEnabled.OEMirror = true
	wait(0.25)
	DisplayUnlockText({
		TitleText = "MetaUpgradeRespec_Unlocked",
		SubtitleText = "MetaUpgradeRespec_Unlocked_Subtitle",
		SubtitleData = { LuaKey = "TempTextData", LuaValue = { Name = "weaponName" }},
		AnimationName = "LocationTextBGGeneric_Mirror",
		AnimationOutName = "LocationTextBGGenericOut_Mirror",
		-- Duration = 4.5,
	})
end

function OnGemsAdded( name, amount, source, args )
	local addedAmount = GetGemsMaxHealthAdded(amount)
	if addedAmount > 0 then
		AddMaxHealth(addedAmount, "GemHealMetaUpgrade", { Delay = 0.5, Thread = true })
	end
end

function GetGemsMaxHealthAdded(amount)
	local healthMultiplier = GetTotalHeroTraitValue("GemHealMultiplier") + ( GetTotalMetaUpgradeChangeValue("GemHealMetaUpgrade") - 1 )
	healthMultiplier = healthMultiplier * GetTotalHeroTraitValue("MaxHealthMultiplier", { IsMultiplier = true })
	return round( healthMultiplier * amount )
end