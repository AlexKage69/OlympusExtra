local OlympusMetaUpgradeData = ModUtil.Entangled.ModData(MetaUpgradeData)
local OlympusMetaUpgradeOrder = ModUtil.Entangled.ModData(MetaUpgradeOrder)
local OlympusKeywordList = ModUtil.Entangled.ModData(KeywordList)
local OlympusColor = ModUtil.Entangled.ModData(Color)
local OlympusResourceData = ModUtil.Entangled.ModData(ResourceData)
local OlympusWeaponData = ModUtil.Entangled.ModData(WeaponData)
local OlympusObstacleData = ModUtil.Entangled.ModData(ObstacleData)


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
		ChangeValue = 1.15,
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
		CostTable = { 100, 250 },
		ShortTotal = "DashlessMetaUpgrade_ShortTotal",
		ShortTotalNoIcon = "DashlessMetaUpgrade_ShortTotalNoIcon",
		PreEquipWeapon = "DashlessBuffApplicator",
		ChangeValue = 1.05, -- display variable, change below value to affect gameplay
		--DisplayValue = 3, -- display variable used to display duration of buff
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = WeaponSets.HeroPrimarySecondaryWeapons,
			RequiredEffects = { "DashlessBuffAttackApplicator" },
			RequiredSelfEffectsMultiplier = 1.05
		},
		PropertyChanges =
		{
			{
				WeaponName = "DashlessBuffApplicator",
				EffectName = "DashlessBuffDefenseApplicator",
				EffectProperty = "Modifier",
				ChangeValue = -0.05,
				ChangeType = "Add",
			},
			{
				WeaponName = "DashlessBuffApplicator",
				EffectName = "DashlessBuffAttackApplicator",
				EffectProperty = "Modifier",
				ChangeValue = 0.05,
				ChangeType = "Add",
			},
		},
	}
	OlympusMetaUpgradeData.CountAmmoMetaUpgrade =
	{
		InheritFrom = { "BaseMetaUpgrade", },
		Icon = "MirrorIcon_CountAmmoBonus",
		Starting = true,
		CostTable = { 20, 40, 60, 80, 100 },
		Color = { 255, 255, 255, 255 },
		ShortTotal = "CountAmmoMetaUpgrade_ShortTotal",
		ChangeValue = 1.02,
		FormatAsPercent = true,		
		AddOutgoingDamageModifiers =
		{
			PerCastActiveMultiplier = 1.02,
			ValidWeapons = WeaponSets.HeroRangedWeapons,
		}
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
		PreEquipWeapon = "RangedWeaponBounce",
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
	OlympusWeaponData.RangedWeaponBounce =
	{
		UpgradeChoiceText = "UpgradeChoiceMenu_Ranged",

		--ChargeCameraMotion = { ZoomType = "Overshoot", Fraction = 1.04, Duration = 0.22 },
		--FireCameraMotion = { ZoomType = "Ease", Fraction = 1.0, Duration = 0.1 },
		--HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.05, FalloffSpeed = 3000 },

		FireRumbleParameters =
		{
			{ ScreenPreWait = 0.06, Fraction = 0.17, Duration = 0.17 },
		},

		StoreAmmoOnHit = 1,
		AmmoDropDelay = 16,

		CauseImpactReaction = true,
		ImpactReactionHitsOverride = 10,

		NotReadySound = "/Leftovers/SFX/OutOfAmmo2",
		NotReadyText = "OutOfAmmo_Alt",
		NoAmmoFunctionName = "RangedFailedNoAmmoPresentation",
		NotReadyAmmoPackText = "RetrieveAmmo",
		NotReadyAmmoInEnemyText = "RetrieveAmmoFromEnemy",
		NotReadyPulseStoredAmmo = true,
		--SkipAttackNotReadySounds = true,

		Sounds =
		{
			ChargeSounds =
			{
				{
					Name = "/Leftovers/SFX/AuraCharge",
					StoppedBy = { "ChargeCancel", "Fired" }
				}
			},
			FireSounds =
			{
				{
					-- StoppedBy = { "SpeechFromCue" }
				},
			},

			ImpactSounds =
			{
				Invulnerable = "/SFX/Player Sounds/ZagreusBloodshotImpact",
				Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
				Bone = "/SFX/Player Sounds/ZagreusBloodshotImpact",
				Brick = "/SFX/Player Sounds/ZagreusBloodshotImpact",
				Stone = "/SFX/Player Sounds/ZagreusBloodshotImpact",
				Organic = "/SFX/Player Sounds/ZagreusBloodshotImpact",
				StoneObstacle = "/SFX/Player Sounds/ZagreusBloodshotImpact",
				BrickObstacle = "/SFX/Player Sounds/ZagreusBloodshotImpact",
				MetalObstacle = "/SFX/Player Sounds/ZagreusBloodshotImpact",
				BushObstacle = "/SFX/Player Sounds/ZagreusBloodshotImpact",
			},
		},

		HitSimSlowParameters =
		{
			{ ScreenPreWait = 0.02, Fraction = 0.3, LerpTime = 0 },
			{ ScreenPreWait = 0.02, Fraction = 1.0, LerpTime = 0.07 },
		},

		--[[Binks =
		{
			"ZagreusRangedWeapon_Bink"
		},]]
		SelfMultiplier = 0,
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
		ChangeValue = 1.02,
		--DecimalPlaces = 0,
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
		CostTable = { 50, 1000 },
		Color = { 255, 255, 255, 255 },
		ShortTotal = "EpicBonusMetaUpgrade_ShortTotal",
		ShortTotalNoIcon = "EpicBonusMetaUpgrade_ShortTotalNoIcon",
		InRunTooltip = "EpicBonus_InRun",
		InRunValueFunctionName = "GetTotalEpicBonus",
		ChangeValue = 1.01,
		--DecimalPlaces = 1,
		AddOutgoingDamageModifiers =
		{
			PerUniqueEpicMultiplier = 1.01,
		}
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
	OlympusObstacleData.HealthFountain.RerollFunctionName = "RerollPom"
	ModUtil.Table.Merge(OlympusKeywordList, { 
		"LowHealthDamage", "GemHeal", "ExtraChanceFloor", "DashlessBonus",
		"CountAmmoBonus", "AmmoBounce", "BonusMoneyMirror", "CombatRegeneration",
		"EpicBonus", "NPCEncounterBonus", "PomFirstGod", "RerollPom",
	})
	ResetKeywords()
table.insert(OlympusMetaUpgradeOrder[1], 3, "LowHealthDamageMetaUpgrade")
table.insert(OlympusMetaUpgradeOrder[2], 3, "GemHealMetaUpgrade")
table.insert(OlympusMetaUpgradeOrder[3], 3, "ExtraChanceFloorMetaUpgrade")
table.insert(OlympusMetaUpgradeOrder[4], 3, "DashlessMetaUpgrade")
table.insert(OlympusMetaUpgradeOrder[5], 3, "CountAmmoMetaUpgrade")
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
		CurrentRun.NumRerolls = GetNumMetaUpgrades( "RerollMetaUpgrade" ) + GetNumMetaUpgrades("RerollPanelMetaUpgrade") + GetNumMetaUpgrades("RerollPomMetaUpgrade")
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
			if (usetext == "UseGemDropRunProgress" or usetext == "UseGemDrop" or usetext == "Shop_UseGemDrop" 
			or usetext == "Shop_UseGemDrop_HealthAsObolText") and GetNumMetaUpgrades("GemHealMetaUpgrade") > 0 then
				useTarget.MaxHealthAmount = GetGemsMaxHealthAdded(useTarget.AddResources.Gems)
				usetext = usetext.."_Health"
			end
			if usetext == "UseFountainHeal" and IsMetaUpgradeSelected("RerollPomMetaUpgrade") then
				if not HeroHasPossibleStackTrait() then
					usetext = usetext.."_CannotReroll"
				else
					usetext = usetext.."_Reroll"
				end
			end
			return usetext
		end
	)
ModUtil.Path.Wrap("StartRoom",
	function(baseFunc, currentRun, currentRoom)
		--local biomeDepth = currentRun.BiomeDepthCache or GetBiomeDepth( currentRun )
		--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(biomeDepth))
		if GetNumMetaUpgrades("ExtraChanceFloorMetaUpgrade") > 0 and Contains({"B_Intro","C_Intro","D_Intro",}, currentRoom.Name) then
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
				
		if GetNumMetaUpgrades("RegenerationMetaUpgrade") > 0 and CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead then
			thread( RegenerationMetaUpgrade, CurrentRun.Hero, {Interval = 3.0, Amount = GetNumMetaUpgrades("RegenerationMetaUpgrade")} )
		end
		baseFunc(currentRun, currentRoom)
	end
)
OnWeaponFired{ "RushWeapon",
	function( triggerArgs )
		if GetNumMetaUpgrades("DashlessMetaUpgrade") > 0 and CurrentRun and CurrentRun.Hero then
			if CurrentRun.Hero.DashlessCooldown == nil then
				CurrentRun.Hero.DashlessCooldown = 0
			end
			if CurrentRun.Hero.DashlessCooldown == 0 then
				--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Buff Removed"))	
				ClearEffect({ Id = CurrentRun.Hero.ObjectId, Name = "DashlessBuffAttackApplicator" })
				ClearEffect({ Id = CurrentRun.Hero.ObjectId, Name = "DashlessBuffDefenseApplicator" })
			end
			CurrentRun.Hero.DashlessCooldown = CurrentRun.Hero.DashlessCooldown + 1			
			thread( AddDashlessBuff, 3 )
		end
	end
}
ModUtil.Path.Wrap("HandleDeath",
    function(baseFunc, currentRun, killer, killingUnitWeapon)
        baseFunc(currentRun, killer, killingUnitWeapon)
        currentRun.NumRerolls = currentRun.NumRerolls + GetNumMetaUpgrades("RerollPomMetaUpgrade")
    end
)
ModUtil.Path.Wrap("HandleMetaUpgradeInput",
    function(baseFunc, screen, button)
		baseFunc(screen, button)
        CurrentRun.NumRerolls = CurrentRun.NumRerolls + GetNumMetaUpgrades("RerollPomMetaUpgrade")
		if CurrentRun.NumRerolls > 0 then
			ShowResourceUIs({ CombatOnly = false })
		end
	end
)
function RerollPom( run, fountain)
	UseStoreRewardRandomStack({ Thread = true, NumTraits = 1, NumStacks = 1, Delay = 0.25 })
end

ModUtil.Path.Wrap("GetTotalHeroTraitValue",
	function(baseFunc, propertyName, args)
		local value = baseFunc(propertyName, args)
		if propertyName == "MoneyMultiplier" then
			local costMultiplier = ( GetNumMetaUpgrades( "BonusMoneyMetaUpgrade" ) * ( MetaUpgradeData.BonusMoneyMetaUpgrade.ChangeValue - 1 ) )
			value = value + costMultiplier
		end
		return value
	end
)
ModUtil.Path.Wrap("EndEncounterEffects",
	function(baseFunc, currentRun, currentRoom, currentEncounter )
		baseFunc(currentRun, currentRoom, currentEncounter)
		ClearEffect({ Id = CurrentRun.Hero.ObjectId, Name = "DashlessBuffAttackApplicator" })
		ClearEffect({ Id = CurrentRun.Hero.ObjectId, Name = "DashlessBuffDefenseApplicator" })
	end
)
function AddDashlessBuff(duration)
	wait(duration, RoomThreadName)
	CurrentRun.Hero.DashlessCooldown = CurrentRun.Hero.DashlessCooldown - 1
	if CurrentRun.Hero.DashlessCooldown == 0 and CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead and IsCombatEncounterActive( CurrentRun ) then 
		FireWeaponFromUnit({ Weapon = "DashlessBuffApplicator", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
	end
end
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

function RegenerationMetaUpgrade( unit, args )
	while CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead do
		wait( args.Interval, RoomThreadName)
		if CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead and IsCombatEncounterActive( CurrentRun ) and CurrentRun.Hero.Health < (CurrentRun.Hero.MaxHealth * 0.3) then
			Heal( CurrentRun.Hero, { HealAmount = args.Amount, SourceName = "RegenerationMetaUpgrade", Silent = true })
			thread( UpdateHealthUI )
			CreateAnimation({ Name = "HealthSparkleShower", DestinationId = CurrentRun.Hero.ObjectId, Group = "Overlay" })
		end
	end
end


ModUtil.Path.Wrap("CheckAmmoDrop",
    function(baseFunc, currentRun, targetId, ammoDropData, numDrops)
		local skip = BounceAmmo(ammoDropData, targetId)
		if not skip then
			baseFunc(currentRun, targetId, ammoDropData, numDrops)
		end
	end
)

function BounceAmmo(storedAmmo, victimId)
	--CurrentRun.Hero.BounceAmmo = {} storedAmmo.Id
	if IsMetaUpgradeActive("BounceAmmoMetaUpgrade") then
		local nearbyTargetIds = GetClosestIds({ Id = victimId, DestinationName = "EnemyTeam", IgnoreInvulnerable = true, IgnoreHomingIneligible = true, IgnoreSelf = true, Distance = 1000 })
		if not IsEmpty(nearbyTargetIds) then
			local nearbyTargetId = GetRandomValue(nearbyTargetIds)
			local angle = GetAngleBetween({ Id = victimId, DestinationId = nearbyTargetId })
			FireWeaponFromUnit({ Weapon = "RangedWeaponBounce", Id = CurrentRun.Hero.ObjectId, DestinationId = nearbyTargetId, FireFromTarget = true, Angle = angle})
		else
			local angle = GetAngleBetween({ Id = victimId, DestinationId = CurrentRun.Hero.ObjectId })
			FireWeaponFromUnit({ Weapon = "RangedWeaponBounce",  Id = CurrentRun.Hero.ObjectId, DestinationId = victimId, FireFromTarget = true, Angle = angle})
		end
	end
	ModUtil.Hades.PrintStackChunks(ModUtil.ToString(storedAmmo.Id))
	ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Fire"))	
end