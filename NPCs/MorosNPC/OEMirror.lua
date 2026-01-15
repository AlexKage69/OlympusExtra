local OlympusMetaUpgradeData = ModUtil.Entangled.ModData(MetaUpgradeData)
local OlympusMetaUpgradeOrder = ModUtil.Entangled.ModData(MetaUpgradeOrder)
local OlympusTraitData = ModUtil.Entangled.ModData(TraitData)
local OlympusLootData = ModUtil.Entangled.ModData(LootData)
local OlympusKeywordList = ModUtil.Entangled.ModData(KeywordList)
local OlympusColor = ModUtil.Entangled.ModData(Color)
local OlympusResourceData = ModUtil.Entangled.ModData(ResourceData)
local OlympusWeaponData = ModUtil.Entangled.ModData(WeaponData)
local OlympusWeaponSets = ModUtil.Entangled.ModData(WeaponSets)
local OlympusObstacleData = ModUtil.Entangled.ModData(ObstacleData)
local OlympusConsumableData = ModUtil.Entangled.ModData(ConsumableData)
local OlympusRoomSetData = ModUtil.Entangled.ModData(RoomSetData)
local OlympusEffectData = ModUtil.Entangled.ModData(EffectData)
local OlympusQuestData = ModUtil.Entangled.ModData(QuestData)
local OlympusGameData = ModUtil.Entangled.ModData(GameData)
local OlympusPresetEventArgs = ModUtil.Entangled.ModData(PresetEventArgs)


ModUtil.Mod.Register("OEMirror")
OlympusColor.OEMirrorAttribute = { 145, 17, 55, 255 }
OlympusColor.CastDOTDamage = { 145, 17, 55, 255 }
table.insert(OlympusWeaponSets.HeroNonPhysicalWeapons, "RangedWeaponBounce")
OlympusWeaponData.StoredAmmoDOTApplicator = {
	--OnHitFunctionNames = { "StoredAmmoDOTApplicatorPresentation" },
	RapidDamageType = true,
	PureDamage = true
}
OlympusWeaponData.HestiaDefianceNovaWeapon = {
	InheritFrom = { "HestiaColorProjectile", "NoSlowFrameProjectile", "NoShakeProjectile" },
}
OlympusEffectData.CastDamageOverTime = {
	DamageTextStartColor = OlympusColor.CastDOTDamage,
	DamageTextColor = OlympusColor.CastDOTDamage,
	RapidDamageType = true,
	BlockDamageAnimation = true,
	IgnoreOnHitEffects = true,
	IgnoreInvulnerabilityFrameTrigger = true,
}

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
		ValidWeapons = WeaponSets.HeroPrimarySecondaryWeapons,
		TargetHighHealthThreshold = 0.25,
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
if HestiaExtra ~= nil then
	OlympusTraitData.DefianceDamageTrait = {
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Hestia_01",
		PreEquipWeapons = { "HestiaDefianceNovaWeapon", "LastStandMetaUpgradeShield", "LastStandReincarnateShield" },
		RequiredMinMaximumLastStands = 1,
		RequiredMetaUpgradeSelected = "ExtraChanceFloorMetaUpgrade",
		RequiredFalseTrait = "DefianceDamageTrait",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.5,
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "HestiaDefianceNovaWeapon",
				ProjectileName = "HestiaDefianceNovaProjectile",
				ProjectileProperty = "DamageLow",
				BaseMin = 400,
				BaseMax = 400,
				DepthMult = 0.0,
				IdenticalMultiplier =
				{
					Value = -0.6,
				},
				AutoRamp = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				DeriveSource = "DeriveSource",
			},
			{
				WeaponName = "HestiaDefianceNovaWeapon",
				ProjectileName = "HestiaDefianceNovaProjectile",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DeriveSource",
			},
		},
	}
	table.insert(OlympusLootData.HestiaUpgrade.Traits, "DefianceDamageTrait")
	table.insert(OlympusGameData.RunClearMessageData.ClearRequiredTraitsHestia.GameStateRequirements.RequiredCountOfTraits, "DefianceDamageTrait")
end
OlympusMetaUpgradeData.ExtraChanceFloorMetaUpgrade =
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
table.insert(OlympusPresetEventArgs.PatroclusBenefitChoices,1,
	{
		RequiredActiveMetaUpgrade = "ExtraChanceFloorMetaUpgrade",
		ChoiceText = "ChoiceText_BuffExtraChance",
		{
			PostLineThreadedFunctionName = "PatroclusBuff",
			PostLineFunctionArgs = {
				LastStand = {
					Count = 100,
					Icon = "ExtraLifeStyx",
					WeaponName = "LastStandMetaUpgradeShield",
					HealFraction = 0.5
				}
			}
		},
	}
)
OlympusConsumableData.LastStandDrop.RequiredActiveMetaUpgrade = "ExtraChanceReplenishMetaUpgrade"
OlympusMetaUpgradeData.DashlessMetaUpgrade =
{
	InheritFrom = { "BaseMetaUpgrade", },
	Icon = "MirrorIcon_DashlessBonus",
	Starting = true,
	CostTable = { 100, 250, 500, 1000 },
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
OlympusMetaUpgradeData.CastDamageOverTimeMetaUpgrade =
{
	InheritFrom = { "BaseMetaUpgrade", },
	Icon = "MirrorIcon_CountAmmoBonus",
	Starting = true,
	CostTable = { 100, 250, 500 },
	Color = { 255, 255, 255, 255 },
	ShortTotal = "CastDamageOverTimeMetaUpgrade_ShortTotal",
	BaseValue = 0,
	ChangeValue = 100,
	PreEquipWeapon = "StoredAmmoDOTApplicator",
	--ChangeValue = 1.06, -- display variable, change below value to affect gameplay
	PropertyChanges =
	{
		{
			WeaponName = "StoredAmmoDOTApplicator",
			EffectName = "CastDamageOverTime",
			EffectProperty = "Cooldown",
			ChangeValue = -0.04,
			ChangeType = "Add",
		},
	},
}
OlympusTraitData.AmmoReclaimTrait.RequiredMetaUpgradeSelected = nil
OlympusTraitData.AmmoReclaimTrait.RequiredAnyMetaUpgradeSelected = {"AmmoMetaUpgrade","BounceAmmoMetaUpgrade"}
OlympusTraitData.AmmoBoltTrait.RequiredMetaUpgradeSelected = nil
OlympusTraitData.AmmoBoltTrait.RequiredAnyMetaUpgradeSelected = {"AmmoMetaUpgrade","BounceAmmoMetaUpgrade"}
OlympusTraitData.AmmoBounceFasterTrait = {
	InheritFrom = { "ShopTier3Trait" },
	RequiredFalseTrait = "AmmoBounceFasterTrait",
	RequiredMetaUpgradeSelected = "BounceAmmoMetaUpgrade",
	Icon = "Boon_Hermes_10",
	AmmoBounceCooldownOverride = {
		BaseValue = 2.0
	},
	ExtractValues =
	{
		{
			Key = "AmmoBounceCooldownOverride",
			ExtractAs = "TooltipAmmoBounceCooldown",
		}
	}
}
OlympusLootData.HermesUpgrade.LinkedUpgrades.AmmoBounceFasterTrait =
{
	OneOf = { "AmmoReclaimTrait", "FastClearDodgeBonusTrait" },
}
table.insert(OlympusQuestData.LegendaryUpgrades.UnlockGameStateRequirements.RequiredAnyTraitsTaken, "AmmoBounceFasterTrait")
table.insert(OlympusQuestData.LegendaryUpgrades.CompleteGameStateRequirements.RequiredTraitsTaken, "AmmoBounceFasterTrait")
table.insert(OlympusGameData.RunClearMessageData.ClearLegendaryTraits.GameStateRequirements.RequiredCountOfTraits, "AmmoBounceFasterTrait")
OlympusTraitData.DionysusRangedTrait.PropertyChanges[13].WeaponNames = { "RangedWeapon"}
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
	BaseValue = 8,
	ChangeValue = -2.0,
	HealthThreshold = 0.3,
}
OlympusMetaUpgradeData.EpicBonusMetaUpgrade =
{
	InheritFrom = { "BaseMetaUpgrade", },
	Icon = "MirrorIcon_EpicBonus",
	Starting = true,
	CostTable = { 50, 1000, 2000 },
	Color = { 255, 255, 255, 255 },
	ShortTotal = "EpicBonusMetaUpgrade_ShortTotal",
	ShortTotalNoIcon = "EpicBonusMetaUpgrade_ShortTotalNoIcon",
	InRunTooltip = "EpicBonusMetaUpgrade_InRun",
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
	ShortTotal = "PomFirstGodMetaUpgrade_ShortTotal",
	ChangeValue = 1.00,
	HelpTextTable =
	{
		[0] = "PomFirstGodMetaUpgrade_Off",
		[1] = "PomFirstGodMetaUpgrade_On",
	},
}

if ApolloExtra ~= nil then
	OlympusTraitData.RerollBoonTrait.RequiredMetaUpgradeSelected = nil
	OlympusTraitData.RerollBoonTrait.RequiredAnyMetaUpgradeSelected = {"RerollPanelMetaUpgrade","RerollPomMetaUpgrade"}
	OlympusTraitData.RerollObolTrait.RequiredMetaUpgradeSelected = nil
	OlympusTraitData.RerollObolTrait.RequiredAnyMetaUpgradeSelected = {"RerollMetaUpgrade","RerollPomMetaUpgrade"}
	OlympusConsumableData.RerollBoonDrop.RequiredMetaUpgradeSelected = nil
	OlympusConsumableData.RerollBoonDrop.RequiredAnyMetaUpgradeSelected = {"RerollPanelMetaUpgrade","RerollPomMetaUpgrade"}
	OlympusConsumableData.RerollObolDrop.RequiredMetaUpgradeSelected = nil
	OlympusConsumableData.RerollObolDrop.RequiredAnyMetaUpgradeSelected = {"RerollMetaUpgrade","RerollPomMetaUpgrade"}
	OlympusTraitData.ApolloRangedTrait.PropertyChanges[13].WeaponNames = { "RangedWeapon"}
end
OlympusMetaUpgradeData.RerollPomMetaUpgrade =
{
	InheritFrom = { "BaseMetaUpgrade", },
	Icon = "MirrorIcon_RerollPom",
	Starting = true,
	CostTable = { 300, 600, 1200, 1600, 1800, 2000 },
	ShortTotal = "RerollPomMetaUpgrade_ShortTotal",
	ShortTotalNoIcon = "RerollPomMetaUpgrade_ShortTotalNoIcon",
	ChangeValue = 1,
}
OlympusObstacleData.HealthFountain.RerollFunctionName = "RerollPom"
OlympusObstacleData.HealthFountain.Cost = 1
OlympusObstacleData.HealthFountain.FountainReroll = true
table.insert(OlympusObstacleData.HealthFountain.ExtractValues, { Key = "Cost", ExtractAs = "TooltipCost", })
OlympusObstacleData.HealthFountainAsphodel.RerollFunctionName = "RerollPom"
OlympusObstacleData.HealthFountainAsphodel.Cost = 1
OlympusObstacleData.HealthFountainAsphodel.FountainReroll = true
table.insert(OlympusObstacleData.HealthFountainAsphodel.ExtractValues, { Key = "Cost", ExtractAs = "TooltipCost", })
OlympusObstacleData.HealthFountainElysium.RerollFunctionName = "RerollPom"
OlympusObstacleData.HealthFountainElysium.Cost = 1
OlympusObstacleData.HealthFountainElysium.FountainReroll = true
table.insert(OlympusObstacleData.HealthFountainElysium.ExtractValues, { Key = "Cost", ExtractAs = "TooltipCost", })
OlympusObstacleData.HealthFountainStyx.RerollFunctionName = "RerollPom"
OlympusObstacleData.HealthFountainStyx.Cost = 1
OlympusObstacleData.HealthFountainStyx.FountainReroll = true
table.insert(OlympusObstacleData.HealthFountainStyx.ExtractValues, { Key = "Cost", ExtractAs = "TooltipCost", })

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
table.insert(OlympusMetaUpgradeOrder[5], 3, "CastDamageOverTimeMetaUpgrade")
table.insert(OlympusMetaUpgradeOrder[6], 3, "BounceAmmoMetaUpgrade")
table.insert(OlympusMetaUpgradeOrder[7], 3, "BonusMoneyMetaUpgrade")
table.insert(OlympusMetaUpgradeOrder[8], 3, "RegenerationMetaUpgrade")
table.insert(OlympusMetaUpgradeOrder[9], 3, "EpicBonusMetaUpgrade")
table.insert(OlympusMetaUpgradeOrder[10], 3, "RareNPCMetaUpgrade")
table.insert(OlympusMetaUpgradeOrder[11], 3, "PomFirstGodMetaUpgrade")
table.insert(OlympusMetaUpgradeOrder[12], 3, "RerollPomMetaUpgrade")

OlympusQuestData.MirrorCUpgrades =
	{
		InheritFrom = { "DefaultQuestItem" },
		RewardResourceName = "SuperLockKeys",
		RewardResourceAmount = 8,
		UnlockGameStateRequirements =
		{
			RequiredMinRunsCleared = 1,
			RequiredTrueFlags = { "SwapMetaupgradesEnabled" },
			RequiredMetaUpgradeStageUnlocked = 4,
		},
		CompleteGameStateRequirements =
		{
			RequiredClearedWithMetaUpgrades =
			{
				"BackstabMetaUpgrade",
				"FirstStrikeMetaUpgrade",
				"DoorHealMetaUpgrade",
				"DarknessHealMetaUpgrade",
				"ExtraChanceMetaUpgrade",
				"ExtraChanceReplenishMetaUpgrade",
				"StaminaMetaUpgrade",
				"PerfectDashMetaUpgrade",
				"StoredAmmoVulnerabilityMetaUpgrade",
				"StoredAmmoSlowMetaUpgrade",
				"AmmoMetaUpgrade",
				"ReloadAmmoMetaUpgrade",
				"MoneyMetaUpgrade",
				"InterestMetaUpgrade",
				"HealthMetaUpgrade",
				"HighHealthDamageMetaUpgrade",
				"VulnerabilityEffectBonusMetaUpgrade",
				"GodEnhancementMetaUpgrade",
				"RareBoonDropMetaUpgrade",
				"DuoRarityBoonDropMetaUpgrade",
				"EpicBoonDropMetaUpgrade",
				"RunProgressRewardMetaUpgrade",
				"RerollMetaUpgrade",
				"RerollPanelMetaUpgrade",
			},
		},

		CashedOutVoiceLines =
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			PreLineWait = 0.4,
			Cooldowns =
			{
				{ Name = "ZagreusProphecyFulfilledSpeech", Time = 3 },
			},

			-- The Mirror of Night... it's made me strong.
			{ Cue = "/VO/ZagreusHome_3000" },
		},
	}
-- Functions
--[[ModUtil.Path.Wrap("HandleMetaUpgradeInput",
	function(baseFunc, screen, button)
		baseFunc(screen, button)
	end
)]]
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
			ModifyTextBox({ Id = components["Backing" .. k].Id, Color = Color.OEMirrorAttribute })
		end

		if MetaUpgradeOrder[k] and MetaUpgradeOrder[k][1] == upgradeName then
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("New"))
			ModifyTextBox({ Id = components["Backing" .. k].Id, Color = Color.DarknessPoint })
		end
	end
)
ModUtil.Path.Wrap("SwapMetaupgrade",
	function(baseFunc, screen, button)
		local index = button.Index
		local itemBackingKey = "Backing" .. index
		local unlockId = "Locked" .. index
		local metaUpgradeNextCostKey = "UpgradeCost" .. index
		local upgradeName = button.Name
		local components = screen.Components
		local isSwapToBSide = (MetaUpgradeOrder[index][1] == upgradeName)
			
		SwapMetaUpgradePresentation(screen, components[itemBackingKey .. "Swap"], isSwapToBSide)
		
		DestroyTextBox({ Id = components[itemBackingKey].Id })
		Destroy({ Id = components["Icon" .. index].Id })
		Destroy({ Id = components["UpgradeValueTotal" .. index].Id })
		Destroy({ Id = components["UpgradeCost" .. index].Id })
		Destroy({ Ids = { components[itemBackingKey .. "Swap"].Id, components[metaUpgradeNextCostKey].Id } })
		components[unlockId] = nil
		components[metaUpgradeNextCostKey] = nil
		components[itemBackingKey .. "Swap"] = nil
			
		GameState.MetaUpgradeState = GameState.MetaUpgradeState or {}
			
		local numUpgrades = GetNumMetaUpgrades(upgradeName)
		GameState.MetaUpgradeState[upgradeName] = numUpgrades
		for i = 1, numUpgrades, 1 do
			DecrementTableValue(GameState.MetaUpgrades, upgradeName)
			ApplyMetaUpgrade(MetaUpgradeData[upgradeName], true, GameState.MetaUpgrades[upgradeName] <= 0, true)
		end
			
		local metaupgradeData = nil
		local takenext = false
		for i, entryName in pairs(MetaUpgradeOrder[index]) do
			if i == 3 and not GameState.Flags.MirrorCEnabled then
				break
			end
			if takenext then
				--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("true"))
				metaupgradeData = MetaUpgradeData[entryName]
				GameState.MetaUpgradesSelected[index] = entryName
				local savedUpgrades = GameState.MetaUpgradeState[entryName] or 0
				for i = 1, savedUpgrades, 1 do
					IncrementTableValue(GameState.MetaUpgrades, entryName)
					ApplyMetaUpgrade(MetaUpgradeData[entryName], true, GameState.MetaUpgrades[entryName] > 1)
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
			local savedUpgrades = GameState.MetaUpgradeState[entryName] or 0
			for i = 1, savedUpgrades, 1 do
				IncrementTableValue(GameState.MetaUpgrades, entryName)
				ApplyMetaUpgrade(MetaUpgradeData[entryName], true, GameState.MetaUpgrades[entryName] > 1)
			end
		end
		wait(0.01)
		CreateMetaUpgradeEntry({
			Screen = screen,
			Components = components,
			Data = metaupgradeData,
			Index = index,
			OffsetY =
				button.OffsetY,
			Swap = GameState.Flags.SwapMetaupgradesEnabled
		})
		UpdateButtonStates(screen)
		CurrentRun.NumRerolls = GetNumMetaUpgrades("RerollMetaUpgrade") + GetNumMetaUpgrades("RerollPanelMetaUpgrade") +
			GetNumMetaUpgrades("RerollPomMetaUpgrade")
		if CurrentRun.NumRerolls > 0 then
			ShowResourceUIs({ CombatOnly = false })
		end
		UpdateRerollUI(CurrentRun.NumRerolls)
	end
)
ModUtil.Path.Wrap("InitHeroLastStands",
	function(baseFunc, newHero)
		baseFunc(newHero)
		for s = 1, GetNumMetaUpgrades("ExtraChanceFloorMetaUpgrade") do
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
			local maxHealthAmount = GetGemsMaxHealthAdded(useTarget.AddResources.Gems)
			if maxHealthAmount > 15 then
				maxHealthAmount = 15
			end
			useTarget.MaxHealthAmount = maxHealthAmount
			usetext = usetext .. "_Health"
		end
		if usetext == "UseFountainHeal" and IsMetaUpgradeSelected("RerollPomMetaUpgrade") then
			if not HeroHasPossibleStackTrait() then
				usetext = usetext .. "_CannotReroll"
			else
				usetext = usetext .. "_Reroll"
			end
		end
		return usetext
	end
)
function HeroHasPossibleStackTrait()
	return true;
end

OnWeaponFired { "RushWeapon",
	function(triggerArgs)
		if GetNumMetaUpgrades("DashlessMetaUpgrade") > 0 and CurrentRun and CurrentRun.Hero then
			if CurrentRun.Hero.DashlessCooldown == nil then
				CurrentRun.Hero.DashlessCooldown = 0
			end
			if CurrentRun.Hero.DashlessCooldown == 0 then
				ClearEffect({ Id = CurrentRun.Hero.ObjectId, Name = "DashlessBuffAttackApplicator" })
				ClearEffect({ Id = CurrentRun.Hero.ObjectId, Name = "DashlessBuffDefenseApplicator" })
			end
			CurrentRun.Hero.DashlessCooldown = CurrentRun.Hero.DashlessCooldown + 1
			thread(AddDashlessBuff, 4)
		end
	end
}
function AddDashlessBuff(duration)
	wait(duration, RoomThreadName)
	CurrentRun.Hero.DashlessCooldown = CurrentRun.Hero.DashlessCooldown - 1
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(CurrentRun.Hero.DashlessCooldown))	
	if CurrentRun.Hero.DashlessCooldown == 0 and CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead and IsCombatEncounterActive(CurrentRun) then
		FireWeaponFromUnit({
			Weapon = "DashlessBuffApplicator",
			Id = CurrentRun.Hero.ObjectId,
			DestinationId = CurrentRun
				.Hero.ObjectId
		})
	end
end

ModUtil.Path.Wrap("HandleMetaUpgradeInput",
	function(baseFunc, screen, button)
		local upgradeData = button.Data
		local hasAction = false

		local capApplies = (GetNumMetaUpgrades( "MetaPointCapShrineUpgrade" ) > 0 and screen.ResourceName == "MetaPoints") or screen.ResourceName == "ShrinePoints"
		local pointCap = 0
		local currentPoints = 0
		if (button.HandleType == "Add" and 
			not (upgradeData.RankGameStateRequirements and upgradeData.RankGameStateRequirements[GetNumMetaUpgrades( upgradeData.Name ) + 1 ] and not IsGameStateEligible( CurrentRun, upgradeData.RankGameStateRequirements[GetNumMetaUpgrades( upgradeData.Name ) + 1 ]  )) and
			not (upgradeData.GameStateRequirements and not IsGameStateEligible( CurrentRun, upgradeData.GameStateRequirements )) and
			not (upgradeData.NextCost == nil) and
			not (capApplies and currentPoints + upgradeData.NextCost > pointCap) and
			not (not HasResource( button.ResourceName, upgradeData.NextCost ) and not screen.FreeSpend) and
			not (upgradeData.RequiredTotalInvestment ~= nil and currentPoints < upgradeData.RequiredTotalInvestment)) or
			(button.HandleType == "Remove" and 
			CanDecrementValue( upgradeData, currentPoints, button.ResourceName ) and 
			GetNumMetaUpgrades( upgradeData.Name ) > 0) then
				hasAction = true
		end
		baseFunc(screen, button)
		if not hasAction then
			return
		end
		
		CurrentRun.NumRerolls = CurrentRun.NumRerolls + GetNumMetaUpgrades("RerollPomMetaUpgrade")
		--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(CurrentRun.NumRerolls))	
		if CurrentRun.NumRerolls > 0 then
			ShowResourceUIs({ CombatOnly = false })
		end
		UpdateRerollUI( CurrentRun.NumRerolls )
	end
)

ModUtil.Path.Wrap("GetTotalHeroTraitValue",
	function(baseFunc, propertyName, args)
		local value = baseFunc(propertyName, args)
		if propertyName == "MoneyMultiplier" then
			local costMultiplier = (GetNumMetaUpgrades("BonusMoneyMetaUpgrade") * (MetaUpgradeData.BonusMoneyMetaUpgrade.ChangeValue - 1))
			value = value + costMultiplier
		end
		return value
	end
)
ModUtil.Path.Wrap("EndEncounterEffects",
	function(baseFunc, currentRun, currentRoom, currentEncounter)
		baseFunc(currentRun, currentRoom, currentEncounter)
		ClearEffect({ Id = CurrentRun.Hero.ObjectId, Name = "DashlessBuffAttackApplicator" })
		ClearEffect({ Id = CurrentRun.Hero.ObjectId, Name = "DashlessBuffDefenseApplicator" })
	end
)
function GetTotalEpicBonus()
	local perEpicMultiplier = GetTotalStatChange(MetaUpgradeData.EpicBonusMetaUpgrade)
	local godDictionary = {}
	for i, traitData in pairs(CurrentRun.Hero.Traits) do
		if traitData.Rarity ~= nil and GetRarityValue(traitData.Rarity) >= 3 then
			godDictionary[traitData.Name] = true
		end
	end
	return TableLength(godDictionary) * perEpicMultiplier
end

function GetHeroEpicTraitCount(hero)
	if not hero then
		return 0
	end

	local godDictionary = {}
	for i, traitData in pairs(hero.Traits) do
		if traitData.Rarity ~= nil and GetRarityValue(traitData.Rarity) > 1 then
			godDictionary[traitData.Name] = true
		end
	end

	hero.EpicTraitCount = TableLength(godDictionary)
	return hero.EpicTraitCount
end

function EnableOEMirrorSwap()
	GameState.Flags.NewPagesMetaupgradesEnabled.OEMirror = true
	wait(0.25)
	DisplayUnlockText({
		TitleText = "MetaUpgradeRespec_Unlocked",
		SubtitleText = "MetaUpgradeRespec_Unlocked_Subtitle",
		SubtitleData = { LuaKey = "TempTextData", LuaValue = { Name = "weaponName" } },
		AnimationName = "LocationTextBGGeneric_Mirror",
		AnimationOutName = "LocationTextBGGenericOut_Mirror",
		-- Duration = 4.5,
	})
end

function OnGemsAdded(name, amount, source, args)
	local addedAmount = GetGemsMaxHealthAdded(amount)
	if addedAmount > 0 then
		AddMaxHealth(addedAmount, "GemHealMetaUpgrade", { Delay = 0.5, Thread = true })
	end
end

function GetGemsMaxHealthAdded(amount)
	local healthMultiplier = GetTotalHeroTraitValue("GemHealMultiplier") +
		(GetTotalMetaUpgradeChangeValue("GemHealMetaUpgrade") - 1)
	healthMultiplier = healthMultiplier * GetTotalHeroTraitValue("MaxHealthMultiplier", { IsMultiplier = true })
	local amountRewarded = round(healthMultiplier * amount)
	if amountRewarded > 15 then
		amountRewarded = 15
	end
	return amountRewarded
end

function RerollPom(run, fountain)
	UseStoreRewardRandomStack({ Thread = true, NumTraits = 1, NumStacks = 1, Delay = 0.25 })
end

function AttemptPomReroll(run, fountain)
	local cost = fountain.Cost
	if run.NumRerolls < cost or cost < 0 then
		CannotRerollPresentation(run, fountain)
		return
	end

	AddInputBlock({ Name = "AttemptPomReroll" })
	--HideTopMenuScreenTooltips({ Id = fountain.Id })
	CurrentRun.NumRerolls = CurrentRun.NumRerolls - cost
	CurrentRun.CurrentRoom.SpentRerolls = CurrentRun.CurrentRoom.SpentRerolls or {}
	--IncrementTableValue( CurrentRun.CurrentRoom.SpentRerolls, fountain.Id, RerollCosts.ReuseIncrement )
	UpdateRerollUI(CurrentRun.NumRerolls)

	--RandomSynchronize( CurrentRun.NumRerolls )
	InvalidateCheckpoint()
	PreRerollPresentation( run, fountain )
	RefreshUseButton(fountain.ObjectId, fountain)
	if fountain.RerollFunctionName and _G[fountain.RerollFunctionName] then
		--RerollPanelPresentation( screen, button )
		_G[fountain.RerollFunctionName]()
		fountain.Cost = fountain.Cost + 1
	end
	PostRerollPresentation( run, fountain )
	--ModifyTextBox({ Id = components[purchaseButtonKey.."Level"].Id, Text = "UI_TraitLevel", LuaKey = "TempTextData", LuaValue = { Cost = fountain.Cost )} })
	RemoveInputBlock({ Name = "AttemptPomReroll" })
end

function RegenerationMetaUpgrade(unit, args)
	while CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead do
		wait(args.Interval, RoomThreadName)
		if CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead and IsCombatEncounterActive(CurrentRun) and CurrentRun.Hero.Health < (CurrentRun.Hero.MaxHealth * 0.3) then
			Heal(CurrentRun.Hero, { HealAmount = args.Amount, SourceName = "RegenerationMetaUpgrade", Silent = true })
			thread(UpdateHealthUI)
			CreateAnimation({ Name = "HealthSparkleShower", DestinationId = CurrentRun.Hero.ObjectId, Group = "Overlay" })
		end
	end
end
function GetMaxBounce()
end
ModUtil.Path.Wrap("CheckAmmoDrop",
	function(baseFunc, currentRun, targetId, ammoDropData, numDrops)
		if CurrentRun.Hero.Bounce == nil then
			CurrentRun.Hero.Bounce = {
				LastId = nil,
				Num = 0,
				Max = GetNumMetaUpgrades( "BounceAmmoMetaUpgrade" ) 
			}
		end
		if IsMetaUpgradeActive("BounceAmmoMetaUpgrade") and CurrentRun.Hero.Bounce ~= nil then
			if ammoDropData == nil or ammoDropData.Count == nil or ammoDropData.Count <= 0 or numDrops == 0 or (ammoDropData.Chance ~= nil and not RandomChance( ammoDropData.Chance )) then
				--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Error in function"))
				return
			end

			if CurrentRun.Hero.Bounce.Num >= CurrentRun.Hero.Bounce.Max then
				CurrentRun.Hero.Bounce.Num = 0
				return baseFunc(currentRun, targetId, ammoDropData, numDrops)
			end

			if ammoDropData.LocationX ~= nil then
				targetId = nil
			end

			if numDrops == nil then
				numDrops = ammoDropData.Count
			end

			local consumableName = "AmmoPack"
			for i = 1, numDrops do
				ammoDropData.Count = ammoDropData.Count - 1
			end

			for i = 1, numDrops do
				local offset = {}
				if ammoDropData.Angle ~= nil then
					offset = CalcOffset( math.rad(ammoDropData.Angle + 180), 48 )
				end
				local consumableId = SpawnObstacle({ Name = consumableName, DestinationId = targetId, LocationX = ammoDropData.LocationX, LocationY = ammoDropData.LocationY, OffsetX = offset.X, OffsetY = offset.Y, Group = "Standing" })
				local consumable = CreateConsumableItem( consumableId, consumableName )
				consumable.AddAmmo = 1
				ApplyUpwardForce({ Id = consumableId, Speed = RandomFloat( ammoDropData.UpwardForceMin or 500, ammoDropData.UpwardForceMax or 700 ) })
				if ammoDropData.ForceMax ~= nil then
					ApplyForce({ Id = consumableId, Speed = RandomFloat( ammoDropData.ForceMin, ammoDropData.ForceMax ), Angle = ammoDropData.Angle or RandomFloat( 0, 360 ), SelfApplied = true })
				end
				local delay = GetTotalHeroTraitValue("AmmoDropUseDelay")
				SetInteractProperty({ DestinationId = consumableId, Property = "Cooldown", Value = delay + 5.0 + 1.0 })
				if delay > 0 then
					thread( DoUseDelay, consumableId, delay )
				end
				
				for i, data in pairs(GetHeroTraitValues("AmmoFieldWeapon")) do
					thread( FireAmmoWeapon, consumableId, data )
				end
				thread( EscalateMagnetism, consumable )
				thread( StartBounceThread, consumable, targetId, delay )
			end
		else
			baseFunc(currentRun, targetId, ammoDropData, numDrops)
		end
	end
)
function StartBounceThread( consumable, targetId, startDelay )

	if startDelay > 0 then
		wait( startDelay , RoomThreadName )
	end
	if not IsAlive({ Id = consumable.ObjectId }) then
		return
	end
	local delay = consumable.MagnetismHintRemainingTime
	local override = GetTotalHeroTraitValue("AmmoBounceCooldownOverride")
	if override > 0 then
		delay = override
		CreateAnimation({ Name = "AmmoBounceTimerReduce", DestinationId = consumable.ObjectId })
	else
		CreateAnimation({ Name = "AmmoBounceTimer", DestinationId = consumable.ObjectId })
	end
	wait( delay, RoomThreadName )
	FireBounceAmmo(consumable, targetId)
	thread( UpdateAmmoUI )
	--SetObstacleProperty({ Property = "Magnetism", Value = consumable.MagnetismEscalateAmount, DestinationId = consumable.ObjectId })
end
function FireBounceAmmo(storedAmmo, victimId)
	--local victim = ActiveEnemies[victimId]
	local nearbyTargetIds = GetClosestIds({ Id = storedAmmo.ObjectId, DestinationName = "EnemyTeam", IgnoreInvulnerable = true, IgnoreHomingIneligible = true, IgnoreSelf = true, Distance = 800 })
	if IsEmpty(nearbyTargetIds) then
		nearbyTargetIds = GetClosestIds({ Id = storedAmmo.ObjectId, DestinationName = "EnemyTeam", IgnoreInvulnerable = true, IgnoreHomingIneligible = true, IgnoreSelf = true, Distance = 1000 })
	end
	if IsEmpty(nearbyTargetIds) then
		nearbyTargetIds = GetClosestIds({ Id = storedAmmo.ObjectId, DestinationName = "EnemyTeam", IgnoreInvulnerable = true, IgnoreHomingIneligible = true, IgnoreSelf = true, Distance = 2500 })
	end
	local toVictim = CurrentRun.Hero.ObjectId
	local shouldBounce = victimId ~= nil or HeroHasTrait("AresRangedTrait") or HeroHasTrait("DionysusRangedTrait") or HeroHasTrait("ApolloRangedTrait") or HeroHasTrait("DemeterRangedTrait")
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(IsEmpty(nearbyTargetIds))..ModUtil.ToString(shouldBounce)..ModUtil.ToString(HeroHasTrait("AresRangedTrait")))
	
		--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(CurrentRun.Hero.Bounce.Num)..tostring(victim))
		
		--RunWeaponMethod({ Id = CurrentRun.Hero.ObjectId, Weapon = "RangedWeapon", Method = "AddAmmo", Parameters = { 1 } })
		
		if not IsEmpty(nearbyTargetIds) then
			toVictim = GetRandomValue(nearbyTargetIds)
		end
		local angle = math.rad(GetAngleBetween({ Id = storedAmmo.ObjectId, DestinationId = toVictim }))
		--local offset = CalcOffset(angle, 105)
		CurrentRun.Hero.Bounce.Num = CurrentRun.Hero.Bounce.Num + 1
		FireWeaponFromUnit({
			Weapon = "RangedWeaponBounce",
			AutoEquip = true,
			Id = CurrentRun.Hero.ObjectId,
			DestinationId =
				storedAmmo.ObjectId,
			FireFromTarget = true,
			Angle = angle
		})
		if HeroHasTrait("CastNovaTrait") then
			FireWeaponFromUnit({
				Weapon = "DemeterAmmoWind",
				Id = CurrentRun.Hero.ObjectId
			})
		end
		Destroy({ Id = storedAmmo.ObjectId})
		--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(CurrentRun.Hero.Bounce.Num)..ModUtil.ToString(CurrentRun.Hero.Bounce.Max))
end
OverwriteTableKeys(RoomData, OlympusRoomSetData.Tartarus)