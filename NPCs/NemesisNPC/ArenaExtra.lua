local OlympusMetaUpgradeData = ModUtil.Entangled.ModData(MetaUpgradeData)
local OlympusMetaUpgradeOrder = ModUtil.Entangled.ModData(MetaUpgradeOrder)
local OlympusKeywordList = ModUtil.Entangled.ModData(KeywordList)
local OlympusColor = ModUtil.Entangled.ModData(Color)
local OlympusResourceData = ModUtil.Entangled.ModData(ResourceData)
local OlympusWeaponData = ModUtil.Entangled.ModData(WeaponData)
local OlympusWeaponSets = ModUtil.Entangled.ModData(WeaponSets)
local OlympusObstacleData = ModUtil.Entangled.ModData(ObstacleData)
local OlympusConsumableData = ModUtil.Entangled.ModData(ConsumableData)
local OlympusRoomSetData = ModUtil.Entangled.ModData(RoomSetData)
local OlympusEffectData = ModUtil.Entangled.ModData(EffectData)

OlympusColor.OEMirrorAttribute = { 145, 17, 55, 255 }
OlympusColor.CastDOTDamage = { 145, 17, 55, 255 }
table.insert(OlympusWeaponSets.HeroNonPhysicalWeapons, "RangedWeaponBounce")
OlympusWeaponData.StoredAmmoDOTApplicator = {
}
OlympusEffectData.CastDamageOverTime = {
	DamageTextStartColor = OlympusColor.CastDOTDamage,
	DamageTextColor = OlympusColor.CastDOTDamage,
	RapidDamageType = true,
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
-- Functions