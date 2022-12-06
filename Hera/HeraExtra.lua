-- Separate Gods from Goddess to add more gods

if ModUtil ~= nil then

	ModUtil.Mod.Register("HeraExtra")

	local mod = "HeraExtra"
	local package = "HeraPackage"
	--Variables
	local DepthDamageMultiplier = 0.0
	local DuplicateMultiplier = -0.60
	local DuplicateStrongMultiplier = -0.40
	local DuplicateVeryStrongMultiplier = -0.20
	--Color
	local OlympusColor = ModUtil.Entangled.ModData(Color)
	OlympusColor.HeraVoice = { 54, 67, 55, 255 }
	OlympusColor.HeraDamageLight = { 72, 107, 255 }
	OlympusColor.HeraDamage = { 54, 67, 55, 255 }
	--EnemyUpgradeData
	local OlympusEnemyUpgradeData = ModUtil.Entangled.ModData(EnemyUpgradeData)
	OlympusEnemyUpgradeData.HeraUpgrade =
	{
		ScreenPanel = nil,
		UpgradeString = "LtUpgrade_Hera",
		--AddSpecialWeapons = { ContinuousWeapon = "DevotionZeus" },
		LieutenantsOnly = true,
		Hidden = true,
		PropertyChanges = {},
	}
	--QuestData
	local OlympusQuestData = ModUtil.Entangled.ModData(QuestData)
	OlympusQuestData.HeraUpgrades =
	{
		InheritFrom = { "DefaultQuestItem" },
		RewardResourceName = "Gems",
		RewardResourceAmount = 150,
		UnlockGameStateRequirements =
		{
			RequiredTextLines = { "HeraGift01", },
		},
		CompleteGameStateRequirements =
		{
			RequiredTraitsTaken =
			{
				"HeraWeaponTrait",
				"HeraDashTrait",
				"HeraRangedTrait",
				"HeraSecondaryTrait",
				"HeraShoutTrait",
				"RelationshipTrait",
				"PriviledgeHeraTrait",
				"FamilyHeraTrait",
				"MoreRewardTrait",
				"SnareOverTimeTrait",
				"DeathDamageTrait",
				"JealousyBurstTrait",
				"JealousyCastTrait",
				"MoreCompanionTrait",
				"BetterSnareTrait",
				"BetterJealousyTrait",
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

			-- This was done with your help, Queen Hera.
			{ Cue = "/VO/ZagreusHome_3778" },
		},
	}
	local OlympusQuestOrderData = ModUtil.Entangled.ModData(QuestOrderData)
	table.insert(OlympusQuestOrderData, 30, "HeraUpgrades")

	--UnitSetData
	local OlympusEnemyData = ModUtil.Entangled.ModData(EnemyData)
	OlympusEnemyData.HeraUpgradeRoomWeapon = {
		InheritFrom = { "PassiveRoomWeapon" },

		DefaultAIData =
		{
			DeepInheritance = true,
			PreAttackDuration = 0.1,
			FireDuration = 0.0,
			PostAttackDuration = 0.0,
			PostAttackCooldownMin = 3.0,
			PostAttackCooldownMax = 3.0,
			CreateOwnTargetFromOriginalTarget = true,
			RandomTargetAngle = false,
			TargetOffsetDistanceMin = 0,
			TargetOffsetDistanceMax = 0,
			TeleportToTargetId = true,

			AIFireTicksMin = 1,
			AIFireTicksMax = 1,
			FireCooldown = 0.3,
		},

		WeaponOptions =
		{
			"DevotionHera",
		},
	}
	--WeaponData
	local OlympusWeaponSets = ModUtil.Entangled.ModData(WeaponSets)
	local OlympusWeaponData = ModUtil.Entangled.ModData(WeaponData)
	local OlympusEffectData = ModUtil.Entangled.ModData(EffectData)

	table.insert(OlympusWeaponSets.ExpireProjectileExcludeProjectileNames, "HeraProjectile")
	OlympusWeaponData.HeraShoutWeapon = {
		BlockWrathGain = true,
	}
	OlympusWeaponData.DevotionHera =
	{
		HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.08, FalloffSpeed = 3000 },
		HitSimSlowParameters =
		{
			{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
			{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0 },
		},
	}
	OlympusWeaponData.TheseusHeraUpgradeWrath =
	{
		HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.08, FalloffSpeed = 3000 },
		HitSimSlowParameters =
		{
			{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
			{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0 },
		},
		BlockInterrupt = true,

		AIData =
		{
			FireTicks = 30,
			FireCooldown = 0.15,
			ResetTargetPerTick = true,
			AIAngleTowardsPlayerWhileFiring = true,
			PreAttackAnimation = "Theseus_WrathStart",
			FireAnimation = "Theseus_WrathAirLoop",
			PostAttackAnimation = "Theseus_WrathReturnToIdle",
			PostAttackDuration = 0.6,

			WrathVoiceLines =
			{
				Queue = "Interrupt",
				{
					RandomRemaining = true,
					PreLineWait = 0.1,
					CooldownTime = 40,
					CooldownName = "TheseusWrathLinesPlayedRecently",
					SuccessiveChanceToPlay = 0.5,

					-- Queen Hera, bring him to me..
					{ Cue = "/VO/Theseus_0602" },
					-- Queen Hera, pull him under.
					{ Cue = "/VO/Theseus_0603" },
				},
				[2] = GlobalVoiceLines.TheseusWrathActivationVoiceLines,
				[3] = HeroVoiceLines.TheseusWrathReactionVoiceLines_F,
			},
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/SFX/Player Sounds/ElectricZapSmall" },
			},
		},
	}

	OlympusWeaponData.TheseusHeraUpgradePassive =
	{
		HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.08, FalloffSpeed = 3000 },
		HitSimSlowParameters =
		{
			{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
			{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0 },
		},

		AIData = {
			FireTicks = 1,
			FireCooldown = 0.1,
			FireInterval = 0.1,

			AttackSlotInterval = 5.0,
			AttackSlotsPerTickMin = 1,
			AttackSlotsPerTickMax = 1,
			AttackSlots =
			{
				-- WrathTargetSetA
				{ UseMapObjectId = 525346 },
				{ UseMapObjectId = 525411 },
				{ UseMapObjectId = 525410 },
				{ UseMapObjectId = 525408 },
				{ UseMapObjectId = 525409 },
				{ UseMapObjectId = 525406 },
				{ UseMapObjectId = 543853 },
			},
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/SFX/Player Sounds/ElectricZapSmall" },
			},
		},
	}
	--OlympusEffectData.DelayedDamage.OnApplyFunctionName = "DelayDamageApply"
	--OlympusEffectData.DelayedDamage.OnClearFunctionName = "DelayDamageClear"
	-- GlobalVoiceLines
	local OlympusGlobalVoiceLines = ModUtil.Entangled.ModData(GlobalVoiceLines)
	local OlympusHeroVoiceLines = ModUtil.Entangled.ModData(HeroVoiceLines)
	table.insert(OlympusGlobalVoiceLines.BoonUsedVoiceLines, {
		BreakIfPlayed = true,
		RandomRemaining = true,
		PreLineWait = 0.5,
		RequiredLastGodLoot = "HeraUpgrade",
		RequiredEncounters = { "DevotionTestTartarus", "DevotionTestAsphodel", "DevotionTestElysium", },
		RequireCurrentEncounterNotComplete = true,
		Source = { SubtitleColor = Color.HeraVoice },

		-- A fine performance.
		{ Cue = "/VO/Hera_0149" },
		-- You can do better.
		{ Cue = "/VO/Hera_0150" },
		-- Do it for your queen.
		{ Cue = "/VO/Hera_0151" },
		-- Lasted longer than I expected.
		{ Cue = "/VO/Hera_0152" },
		-- Barely made it, I assume.
		{ Cue = "/VO/Hera_0153" },
		-- With this, you'd better not lose.
		{ Cue = "/VO/Hera_0154" },
		-- There's nothing better than my blessings.
		{ Cue = "/VO/Hera_0155" },
		-- You never give up, do you?
		{ Cue = "/VO/Hera_0156" },
		-- That's right, bow to your queen.
		{ Cue = "/VO/Hera_0157" },
		-- Likely to fail, but I am still helping you.
		{ Cue = "/VO/Hera_0158" },
		-- I can be generous.
		{ Cue = "/VO/Hera_0159" },
		-- The best of all Olympus.
		{ Cue = "/VO/Hera_0160" },
	})
	table.insert(OlympusHeroVoiceLines.UpgradePickedVoiceLines, {
		RandomRemaining = true,
		BreakIfPlayed = true,
		SuccessiveChanceToPlay = 0.5,
		PreLineWait = 0.75,
		RequiredLastGodLoot = "HeraUpgrade",
		-- Glorious!
		{ Cue = "/VO/ZagreusField_4841" },
		-- From royalty.
		{ Cue = "/VO/ZagreusField_4842" },
		-- Bond to be good.
		{ Cue = "/VO/ZagreusField_4843" },
		-- Queen of Olympus.
		{ Cue = "/VO/ZagreusField_4844" },
		-- For your reign.
		{ Cue = "/VO/ZagreusField_4845" },
		-- I'll be loyal to you.
		{ Cue = "/VO/ZagreusField_4846" },
		-- I won't cheat.
		{ Cue = "/VO/ZagreusField_4847" },
		-- In all its glory.
		{ Cue = "/VO/ZagreusField_4848" },
		-- Justice!
		{ Cue = "/VO/ZagreusField_4849" },
		-- Fairest of them all.
		{ Cue = "/VO/ZagreusField_4850" },
	})
	table.insert(OlympusHeroVoiceLines.FullSuperActivatedVoiceLines, {
		-- Hera!!
		Cue = "/VO/ZagreusField_4951", RequiredTrait = "HeraShoutTrait", RequiredFalseSpurnedGodName = "HeraUpgrade"
	})
	table.insert(OlympusHeroVoiceLines.SwapUpgradePickedVoiceLines, {
		RandomRemaining = true,
		BreakIfPlayed = true,
		PreLineWait = 0.65,
		SuccessiveChanceToPlayAll = 0.33,
		RequiredFalseEncounters = { "DevotionTestTartarus", "DevotionTestAsphodel", "DevotionTestElysium", },
		RequiredSwappedGodLoot = "HeraUpgrade",
		CooldownName = "SaidHeraRecently",
		CooldownTime = 40,

		-- I'm sure Queen Hera won't mind.
		{ Cue = "/VO/ZagreusField_4929" },
		-- Surely Hera won't mind.
		{ Cue = "/VO/ZagreusField_4930" },
		-- Queen Hera won't mind, will she?
		{ Cue = "/VO/ZagreusField_4931" },
	})
	--BoonInfoScreenData
	local OlympusBoonInfoScreenData = ModUtil.Entangled.ModData(BoonInfoScreenData)
	table.insert(OlympusBoonInfoScreenData.Ordering, "HeraUpgrade")
	
--ProjectileData
local OlympusProjectileData = ModUtil.Entangled.ModData(ProjectileData)
OlympusProjectileData.HeraColorProjectile = {
	DamageTextStartColor = OlympusColor.HeraDamageLight,
	DamageTextColor = OlympusColor.HeraDamage
}
OlympusProjectileData.HeraProjectile = {
	InheritFrom = { "NoSlowFrameProjectile", "NoShakeProjectile", "HeraColorProjectile" },
}
OlympusProjectileData.HeraField =
{
	InheritFrom = { "NoSlowFrameProjectile", "NoShakeProjectile", "HeraColorProjectile" },
	SpawnedProjectile = true,
	NeverStore = true,
}
OlympusProjectileData.HeraFireDashField = {
	InheritFrom = { "HeraColorProjectile" },
}
OlympusProjectileData.HeraFire = {
	InheritFrom = { "HeraColorProjectile" },
}
OlympusProjectileData.HeraSmallField =
{
	InheritFrom = { "NoSlowFrameProjectile", "NoShakeProjectile", "HeraColorProjectile" },
	SpawnedProjectile = true,
}
--[[OlympusWeaponData.AreaWeakenHera =
{
	InheritFrom = { "HeraColorProjectile" },
}]]
OlympusWeaponData.HeraSuper = {
	InheritFrom = { "HeraColorProjectile", "NoSlowFrameProjectile", "NoShakeProjectile" },
}
OlympusWeaponData.HeraMaxSuper = {
	InheritFrom = { "HeraColorProjectile", "NoSlowFrameProjectile", "NoShakeProjectile" },
}
-- GameData
local OlympusGameData = ModUtil.Entangled.ModData(GameData)
OlympusGameData.HeraBasicPickUpTextLines = {
	"HeraFirstPickUp",
	"HeraMiscPickup01",
	"HeraMiscPickup02",
	"HeraMiscPickup03",
	"HeraMiscPickup04",
	"HeraMiscPickup05",
	"HeraMiscPickup06",
	"HeraMiscPickup07",
	"HeraMiscPickup08",
	"HeraMiscPickup09",
	"HeraMiscPickup10",
	"HeraMiscPickup11",
	"HeraMiscPickup12",
	"HeraMiscPickup13",
	"HeraMiscPickup14",
	"HeraMiscPickup15",
	"HeraMiscPickup16",
	"HeraMiscPickup17"
}
GameData.RunClearMessageData.ClearRequiredTraitsHera =
{
	InheritFrom = { "DefaultMessage" },
	GameStateRequirements =
	{
		RequiredCountOfTraitsCount = 6,
		RequiredCountOfTraits =
		{
			"HeraWeaponTrait",
			"HeraDashTrait",
			"HeraRangedTrait",
			"HeraSecondaryTrait",
			"HeraShoutTrait",
			"RelationshipTrait",
			"PriviledgeHeraTrait",
			"FamilyHeraTrait",
			"MoreRewardTrait",
			"SnareOverTimeTrait",
			"DeathDamageTrait",
			"JealousyBurstTrait",
			"JealousyCastTrait",
			"MoreCompanionTrait",
			"BetterSnareTrait",
			"BetterJealousyTrait",
		},
		RequiredOneOfTraits = { "BetterSnareTrait", "BetterJealousyTrait" },
	},
}
table.insert(OlympusGameData.ConversationOrder, "HeraUpgrade")
table.insert(OlympusGameData.RunClearMessageData.ClearWeaponsFiredWrath.GameStateRequirements.RequiredWeaponsFiredThisRun
	.Names, "HeraBeamWeapon")
ModUtil.Table.Merge(OlympusGameData.GodAboutGodVoiceLines, {
	"HeraAboutZeus01"
}
)
--Keywords
local OlympusKeywordList = ModUtil.Entangled.ModData(KeywordList)
ModUtil.Table.Merge(OlympusKeywordList, { "JealousyCurse", "SnareCurse", "SnareTrap", "Aura" })
ResetKeywords()

-- This is not working since the Icons are too big or small to be used and there's no Scale.
--[[local OlympusIconData = ModUtil.Entangled.ModData(IconData)
OlympusIconData.CentaurHeart = {
	TexturePath = "GUI\\Icons\\HealthExtra",
	UseTooltip = false,
	TextSymbolScale = 0.5,
}
OlympusIconData.CentaurSoul = {
	TexturePath = "GUI\\Icons\\UnLife",
	UseTooltip = false,
	TextSymbolScale = 0.5,
}
for iconName, iconData in pairs( OlympusIconData ) do
	Icons[iconName] = iconData.TexturePath
	IconTooltips[iconName] = iconData.UseTooltip
end]]

-- Codex Section
local OlympusCodexOrdering = ModUtil.Entangled.ModData(CodexOrdering)
local OlympusCodex = ModUtil.Entangled.ModData(Codex)
table.insert(OlympusCodexOrdering.OlympianGoddess.Order, "HeraUpgrade")
--table.insert(OlympusCodexOrdering.Items.Order, 6, "RoomRewardEmptyHealthDrop")

OlympusCodex.OlympianGoddess.Entries["HeraUpgrade"] =
{
	Entries =
	{
		{
			UnlockThreshold = 1,
			Text = "CodexData_Hera_0001"
		},
		{
			UnlockThreshold = 5,
			Text = "CodexData_Hera_0002"
		},
		{
			UnlockThreshold = 15,
			Text = "CodexData_Hera_0003"
		}
	},
	Image = "Codex_Portrait_Hera",
}

-- Trait Section
local OlympusTraitData = ModUtil.Entangled.ModData(TraitData)

OlympusTraitData.ForceHeraBoonTrait = {
	Name = "ForceHeraBoonTrait",
	InheritFrom = { "GiftTrait" },
	--New Data
	InRackTitle = "ForceHeraBoonTrait_Rack",
	Icon = "CosmeticIcon_PedestalA",
	EquipSound = "/SFX/WrathOver2",
	ForceBoonName = "HeraUpgrade",
	Uses = 1,
	RarityBonus =
	{
		RequiredGod = "HeraUpgrade",
		RareBonus = { BaseValue = 0.1 },
		EpicBonus = 0.1,
		LegendaryBonus = 0.1,
		ExtractValues =
		{
			{
				Key = "RareBonus",
				ExtractAs = "TooltipBonusChance",
				Format = "Percent",
			}
		}
	},
	SignOffData =
	{
		{
			Text = "HeraSignoff",
		},
		{
			RequiredTextLines = { "HeraGift07" },
			Text = "HeraSignoff_Max"
		}
	},
}
OlympusTraitData.HeraWeaponTrait =
{
	InheritFrom = { "ShopTier1Trait" },
	God = "Hera",
	Slot = "Melee",
	Icon = "Boon_Hera_01",
	AddOutgoingDamageModifiers =
	{
		ValidWeaponMultiplier =
		{
			BaseValue = 1.50,
			SourceIsMultiplier = true,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		ValidWeapons = WeaponSets.HeroPhysicalWeapons,
		ExtractValues =
		{
			{
				Key = "ValidWeaponMultiplier",
				ExtractAs = "TooltipDamage",
				Format = "PercentDelta",
			},
		}
	},
	PropertyChanges =
	{
		{
			WeaponNames = WeaponSets.HeroPhysicalWeapons,
			EffectName = "JealousyCurse",
			EffectProperty = "Active",
			ChangeValue = true,
		},
		{
			WeaponName = "SwordWeapon",
			WeaponProperty = "FireFx",
			ChangeValue = "SwordSwipeAFlipped-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			WeaponName = "SwordWeapon2",
			WeaponProperty = "FireFx",
			ChangeValue = "SwordSwipeB-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			WeaponName = "SwordWeapon3",
			WeaponProperty = "FireFx",
			ChangeValue = "SwordSwipeC-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			WeaponName = "SwordWeaponDash",
			WeaponProperty = "FireFx",
			ChangeValue = "SwordSwipeC-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			WeaponName = "SwordWeapon3",
			WeaponProperty = "ChargeFx",
			ChangeValue = "ChargeAttack-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			WeaponName = "SwordWeaponDash",
			WeaponProperty = "ChargeFx",
			ChangeValue = "ChargeAttack-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			WeaponName = "SpearWeapon",
			ProjectileProperty = "Graphic",
			ChangeValue = "SpearThrustProjectile-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			WeaponName = "SpearWeapon2",
			ProjectileProperty = "Graphic",
			ChangeValue = "SpearThrustProjectile-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			WeaponName = "SpearWeapon3",
			ProjectileProperty = "Graphic",
			ChangeValue = "SpearThrustProjectile-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			WeaponName = "SpearWeaponDash",
			ProjectileProperty = "Graphic",
			ChangeValue = "SpearDashSwipe-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			WeaponName = "SpearWeaponSpin",
			ProjectileProperty = "DetonateGraphic",
			ChangeValue = "SpearSwipe360-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			WeaponName = "SpearWeaponSpin2",
			ProjectileProperty = "DetonateGraphic",
			ChangeValue = "SpearSwipe360-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			WeaponName = "SpearWeaponSpin3",
			ProjectileProperty = "DetonateGraphic",
			ChangeValue = "SpearSwipe360-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			WeaponName = "BowWeapon",
			ProjectileProperty = "Graphic",
			ChangeValue = "BowWeaponArrow-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			WeaponName = "BowWeapon",
			WeaponProperty = "MinChargeStartFx",
			ChangeValue = "BowCharge-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			WeaponName = "BowWeaponDash",
			ProjectileProperty = "Graphic",
			ChangeValue = "BowWeaponArrow-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			WeaponName = "BowWeaponDash",
			WeaponProperty = "ChargeStartFx",
			ChangeValue = "BowChargeFast-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			WeaponName = "ShieldWeapon",
			ProjectileProperty = "DetonateGraphic",
			ChangeValue = "ShieldSwipe-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			WeaponName = "ShieldWeaponDash",
			ProjectileProperty = "DetonateGraphic",
			ChangeValue = "ShieldSwipeDash-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			WeaponName = "ShieldWeaponRush",
			WeaponProperty = "ChargeStartFx",
			ChangeValue = "ShieldCharge-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			WeaponName = "ShieldWeaponRush",
			ProjectileProperty = "Graphic",
			ChangeValue = "ShieldRush3D-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			WeaponName = "ShieldWeaponRush",
			ProjectileProperty = "DissipateGraphic",
			ChangeValue = "ShieldRush3D-Out-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			WeaponName = "GunWeapon",
			ProjectileProperty = "Graphic",
			ChangeValue = "GunWeaponProjectile-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			WeaponName = "GunWeapon",
			WeaponProperty = "FireFx",
			ChangeValue = "GunFire-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			WeaponName = "GunWeapon",
			ProjectileProperty = "ImpactFx",
			ChangeValue = "GunWeaponImpact-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			WeaponName = "GunWeaponDash",
			ProjectileProperty = "Graphic",
			ChangeValue = "GunWeaponProjectile-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			WeaponName = "GunWeaponDash",
			WeaponProperty = "FireFx",
			ChangeValue = "GunFire-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			WeaponName = "GunWeaponDash",
			ProjectileProperty = "ImpactFx",
			ChangeValue = "GunWeaponImpact-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
			ProjectileProperty = "Graphic",
			ChangeValue = "FistFxHera",
			ChangeType = "Absolute"
		},
		{
			WeaponName = "FistWeaponDash",
			ProjectileProperty = "StartFx",
			ChangeValue = "FistFxSwipe",
			ChangeType = "Absolute",
		},

		{
			TraitName = "SwordConsecrationTrait",
			WeaponNames = { "SwordWeapon" },
			WeaponProperty = "FireFx",
			ChangeValue = "SwordSwipeC-Hera-Arthur",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			TraitName = "SwordConsecrationTrait",
			WeaponNames = { "SwordWeapon2" },
			WeaponProperty = "ChargeFx",
			ChangeValue = "ChargeAttack-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			TraitName = "SwordConsecrationTrait",
			WeaponNames = { "SwordWeapon2" },
			WeaponProperty = "FireFx",
			ChangeValue = "SwordSwipeA-Hera-Arthur",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			TraitName = "SwordConsecrationTrait",
			WeaponNames = { "SwordWeapon3" },
			WeaponProperty = "FireFx",
			ChangeValue = "SwordSwipeAFlipped-Hera-Arthur",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			TraitName = "SwordConsecrationTrait",
			WeaponNames = { "SwordWeapon3" },
			WeaponProperty = "ChargeFx",
			ChangeValue = "ChargeAttack-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			TraitName = "SwordConsecrationTrait",
			WeaponNames = { "SwordWeaponDash" },
			WeaponProperty = "FireFx",
			ChangeValue = "SwordSwipeC-Hera-Arthur",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			TraitName = "BowBondTrait",
			WeaponName = "BowWeapon",
			WeaponProperty = "MinChargeStartFx",
			ChangeValue = "BowChargeRama-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			TraitName = "BowBondTrait",
			WeaponName = "BowWeaponDash",
			WeaponProperty = "ChargeStartFx",
			ChangeValue = "BowChargeRamaDash-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			TraitName = "BowBondTrait",
			WeaponNames = { "BowWeapon", "BowWeaponDash" },
			ProjectileProperty = "AttachedAnim",
			ChangeValue = "RamaWideShot-Hera",
			ChangeType = "Absoawlute",
			ExcludeLinked = true,
		},

		{
			TraitName = "GunLoadedGrenadeTrait",
			WeaponName = "GunWeapon",
			ProjectileProperty = "Graphic",
			ChangeValue = "GunLaser-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			TraitName = "GunLoadedGrenadeTrait",
			WeaponName = "GunWeapon",
			ProjectileProperty = "AttachedAnim",
			ChangeValue = "GunLaserOriginFlare-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			TraitName = "GunLoadedGrenadeTrait",
			WeaponName = "GunWeapon",
			ProjectileProperty = "TipFx",
			ChangeValue = "GunLaserTipFlare-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			TraitName = "GunLoadedGrenadeTrait",
			WeaponName = "GunWeapon",
			WeaponProperty = "ChargeStartFx",
			ChangeValue = "GunCharge-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			TraitName = "GunLoadedGrenadeTrait",
			WeaponNames = { "GunWeapon", "GunWeaponDash" },
			WeaponProperty = "FireFx",
			ChangeValue = "null",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			TraitName = "GunLoadedGrenadeTrait",
			WeaponName = "GunWeapon",
			ProjectileProperty = "DissipateGraphic",
			ChangeValue = "GunLaserEnd-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			TraitName = "ShieldLoadAmmoTrait",
			WeaponName = "ShieldWeapon",
			ProjectileProperty = "DetonateGraphic",
			ChangeValue = "BeowulfShieldSlam-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			TraitName = "BowMarkHomingTrait",
			WeaponNames = { "BowWeapon" },
			ProjectileProperty = "Graphic",
			ChangeValue = "BowWeaponArrow-Hera-Alt01",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			TraitName = "BowLoadAmmoTrait",
			WeaponNames = { "BowWeapon" },
			ProjectileProperty = "Graphic",
			ChangeValue = "BowWeaponArrow-Hera-Alt02",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			WeaponNames = { "FistWeapon", "FistWeapon3", "FistWeapon5" },
			TraitName = "FistDetonateTrait",
			WeaponProperty = "FireFx",
			ChangeValue = "ClawSwipe-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			WeaponNames = { "FistWeapon2", "FistWeapon4" },
			TraitName = "FistDetonateTrait",
			WeaponProperty = "FireFx",
			ChangeValue = "ClawSwipeFlipped-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
			TraitName = "FistDetonateTrait",
			ProjectileProperty = "Graphic",
			ChangeValue = "null",
			ChangeType = "Absolute"
		},
		{
			WeaponNames = { "FistWeaponDash" },
			ProjectileProperty = "StartFx",
			ChangeValue = "ClawSwipeFlippedDash-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

	},
	ExtractValues =
	{
		{
			ExtractAs = "TooltipJealousyDuration",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "JealousyCurse",
			BaseProperty = "Duration",
		},
		{
			ExtractAs = "TooltipJealousyPower",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "JealousyCurse",
			BaseProperty = "Amount",
			Format = "Percent"
		}
	}
}
OlympusTraitData.HeraSecondaryTrait =
{
	InheritFrom = { "ShopTier1Trait" },
	God = "Hera",
	Slot = "Secondary",
	Icon = "Boon_Hera_02",
	AddOutgoingDamageModifiers =
	{
		ValidWeaponMultiplier =
		{
			BaseValue = 1.4,
			SourceIsMultiplier = true,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		ValidWeapons = WeaponSets.HeroSecondaryWeapons,
		ExtractValues =
		{
			{
				Key = "ValidWeaponMultiplier",
				ExtractAs = "TooltipDamage",
				Format = "PercentDelta",
			},
		}
	},
	PropertyChanges =
	{
		{
			WeaponNames = WeaponSets.HeroSecondaryWeapons,
			EffectName = "JealousyCurse",
			EffectProperty = "Active",
			ChangeValue = true,
		},
		{
			WeaponName = "SwordParry",
			ProjectileProperty = "DetonateGraphic",
			ChangeValue = "RadialNovaSwordParry-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			WeaponName = "SpearWeaponThrow",
			ProjectileProperty = "Graphic",
			ChangeValue = "SpearThrowProjectile-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			WeaponName = "SpearWeaponThrowReturn",
			ProjectileProperty = "Graphic",
			ChangeValue = "SpearThrowProjectile-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			WeaponName = "SpearWeaponThrow",
			ProjectileProperty = "StartFx",
			ChangeValue = "HeraSpearThrowStartFx",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			WeaponName = "BowSplitShot",
			ProjectileProperty = "Graphic",
			ChangeValue = "BowWeaponArrow-Hera-SplitShot",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			WeaponName = "BowSplitShot",
			WeaponProperty = "MinChargeStartFx",
			ChangeValue = "BowCharge-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
			ProjectileName = "ShieldThrow",
			ProjectileProperty = "DetonateGraphic",
			ChangeValue = "ShieldSwipe-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			WeaponNames = { "ShieldThrowDash" },
			ProjectileName = "ShieldThrowDash",
			ProjectileProperty = "DetonateGraphic",
			ChangeValue = "ShieldSwipe-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
			WeaponProperty = "ChargeStartFx",
			ChangeValue = "ShieldCharge-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			WeaponName = "GunGrenadeToss",
			ProjectileProperty = "DetonateGraphic",
			ChangeValue = "ZagGrenadeExplosionHera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
			ProjectileProperty = "Graphic",
			ChangeValue = "ProjectileShield-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			TraitName = "ShieldRushBonusProjectileTrait",
			ProjectileProperty = "Graphic",
			WeaponNames = { "ShieldThrow", "ShieldThrowDash", "ChaosShieldThrow" },
			ChangeValue = "ProjectileShieldAlt01-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			TraitName = "ShieldLoadAmmoTrait",
			ProjectileProperty = "Graphic",
			WeaponNames = { "ShieldThrow", "ShieldThrowDash", "ChaosShieldThrow" },
			ChangeValue = "ProjectileShieldAlt03-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			TraitName = "ShieldTwoShieldTrait",
			ProjectileProperty = "Graphic",
			WeaponName = "ShieldThrow",
			ChangeValue = "ProjectileShieldAlt02-Poseidon",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			TraitName = "ShieldTwoShieldTrait",
			WeaponName = "ShieldThrow",
			ProjectileName = "ShieldThrow",
			ProjectileProperty = "DetonateGraphic",
			ChangeValue = "ShieldThrowTrailMirage-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			WeaponName = "GunGrenadeToss",
			WeaponProperty = "FireFx",
			ChangeValue = "SwordSwipeAFlipped-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			WeaponName = "GunGrenadeToss",
			ProjectileProperty = "StartFx",
			ChangeValue = "SwordSwipeA-Emitter-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			TraitName = "SpearTeleportTrait",
			WeaponName = "SpearRushWeapon",
			ProjectileName = "SpearRushWeapon",
			ProjectileProperty = "DetonateGraphic",
			ChangeValue = "SpearRushTrailFx-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
			WeaponProperty = "FireFx",
			ChangeValue = "FistFxUppercutDirectionalHera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},

		{
			TraitName = "GunLoadedGrenadeTrait",
			WeaponNames = { "GunGrenadeToss" },
			ProjectileProperty = "Graphic",
			ChangeValue = "GunGrenadeLuciferOrb-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			TraitName = "GunLoadedGrenadeTrait",
			WeaponNames = { "GunGrenadeToss" },
			ProjectileProperty = "GroupName",
			ChangeValue = "FX_Standing_Add",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			TraitName = "GunLoadedGrenadeTrait",
			WeaponNames = { "GunBombWeapon" },
			ProjectileProperty = "DetonateGraphic",
			ChangeValue = "ZagGrenadeExplosionHera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			TraitName = "GunLoadedGrenadeTrait",
			WeaponName = "GunGrenadeToss",
			ProjectileProperty = "StartFx",
			ChangeValue = "null",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			TraitName = "GunLoadedGrenadeTrait",
			WeaponName = "GunGrenadeToss",
			WeaponProperty = "FireFx",
			ChangeValue = "null",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			TraitName = "GunLoadedGrenadeTrait",
			WeaponNames = { "GunBombImmolation" },
			ProjectileProperty = "DetonateGraphic",
			ChangeValue = "LuciferOrbAoE-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			TraitName = "BowMarkHomingTrait",
			WeaponNames = { "BowSplitShot" },
			ProjectileProperty = "Graphic",
			ChangeValue = "BowWeaponArrow-Hera-SplitShot-Alt01",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			TraitName = "BowLoadAmmoTrait",
			WeaponNames = { "BowSplitShot" },
			ProjectileProperty = "Graphic",
			ChangeValue = "BowWeaponArrow-Hera-SplitShot-Alt02",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			TraitName = "FistDetonateTrait",
			WeaponNames = { "FistWeaponSpecial" },
			WeaponProperty = "FireFx",
			ChangeValue = "ClawSwipeUppercut-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			TraitName = "FistDetonateTrait",
			WeaponNames = { "FistWeaponSpecialDash" },
			WeaponProperty = "FireFx",
			ChangeValue = "ClawSwipeUppercutSpecial-Hera",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
		{
			TraitName = "FistTeleportSpecialTrait",
			WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
			WeaponProperty = "FireFx",
			ChangeValue = "FistFxUppercutDirectionalHera_FlashKick",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
	},
	EnemyPropertyChanges =
	{
		{
			TraitName = "GunLoadedGrenadeTrait",
			LegalUnits = { "GunBombUnit" },
			ThingProperty = "Graphic",
			ChangeValue = "LuciferBomb-Hera",
			ChangeType = "Absolute",
		},
	},
	ExtractValues = 
	{
	}
}

OlympusTraitData.HeraRushTrait =
{
	InheritFrom = { "ShopTier1Trait" },
	God = "Hera",
	Icon = "Boon_Hera_03",
	Slot = "Rush",
	PreEquipWeapons = { "MineTossZagreus" },
	RarityLevels =
	{
		Common =
		{
			Multiplier = 1.00,
		},
		Rare =
		{
			Multiplier = 1.22,
		},
		Epic =
		{
			Multiplier = 1.44,
		},
		Heroic =
		{
			Multiplier = 1.66,
		}
	},
	PropertyChanges =
	{
		{
			WeaponNames = WeaponSets.HeroRushWeapons,
			WeaponProperty = "FireFx",
			ChangeValue = "BlinkTrailVerticalB-Hera",
			ChangeType = "Absolute",
		},

		{
			WeaponNames = WeaponSets.HeroRushWeapons,
			WeaponProperty = "FireGraphic",
			ChangeValue = "ZagreusDashNoCollide_Hera",
			ChangeType = "Absolute",
		},

		{
			WeaponNames = WeaponSets.HeroRushWeapons,
			WeaponProperty = "Projectile",
			ChangeValue = "HeraDashProjectile",
			ChangeType = "Absolute",
		},
		{
			WeaponNames = WeaponSets.HeroRushWeapons,
			WeaponProperty = "BlinkDetonateAtOrigin",
			ChangeValue = true,
			ChangeType = "Absolute",
		},
		{
			WeaponNames = WeaponSets.HeroRushWeapons,
			WeaponProperty = "BlinkDetonateAtEndpoint",
			ChangeValue = false,
			ChangeType = "Absolute",
		},
		--[[
		{
			WeaponNames = WeaponSets.HeroRushWeapons,
			ProjectileProperty = "Range",
			ChangeValue = 0.0,
			ChangeType = "Absolute",
		},
		{
			WeaponNames = WeaponSets.HeroRushWeapons,
			EffectName = "DamageOverTime",
			EffectProperty = "Active",
			ChangeValue = true,
		},
		{
			WeaponNames = WeaponSets.HeroRushWeapons,
			EffectName = "DamageOverTime",
			EffectProperty = "Amount",
			BaseMin = 2,
			BaseMax = 2,
			ChangeType = "Add",
			AsInt = true,
			MinMultiplier = 0.5,
			IdenticalMultiplier =
			{
				Value = -0.8,
			},
			ExtractValue =
			{
				ExtractAs = "TooltipDamage",
			}
		},
		]]
	},
}
OlympusTraitData.HeraRangedTrait =
{
	InheritFrom = { "ShopTier1Trait" },
	God = "Hera",
	Slot = "Ranged",
	Icon = "Boon_Hera_04",
	CustomTrayText = "HeraRangedTrait_Tray",
	--RequiredFalseTrait = "ShieldLoadAmmoTrait",
	PreEquipWeapons = { "" },
	RarityLevels =
	{
		Common =
		{
			Multiplier = 1.000,
		},
		Rare =
		{
			Multiplier = 1.145,
		},
		Epic =
		{
			Multiplier = 1.290,
		},
		Heroic =
		{
			Multiplier = 1.435,
		}
	},		
	PropertyChanges =
	{			
		-- Beowulf
		{
			TraitName = "ShieldLoadAmmoTrait",
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			WeaponProperty = "FireOnRelease",
			ChangeValue = false,
			ChangeType = "Absolute",
		},
		{
			TraitName = "ShieldLoadAmmoTrait",
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			ProjectileProperty = "Type",
			ChangeValue = "INSTANT",
		},
		{
			TraitName = "ShieldLoadAmmoTrait",
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			ProjectileProperty = "DamageRadius",
			ChangeValue = 400
		},
		{
			TraitName = "ShieldLoadAmmoTrait",
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			ProjectileProperty = "DetonateGraphic",
			ChangeValue = "RadialNovaSwordParry-Hera"
		},
	},
	ExtractValues =
	{
		{
			ExtractAs = "BaseRangedDamage",
			External = true,
			BaseType = "Projectile",
			BaseName = "RangedWeapon",
			BaseProperty = "DamageLow",
		}
	}
}
--[[OlympusTraitData.ShieldLoadAmmo_HeraRangedTrait =
{
	InheritFrom = { "ShopTier1Trait" },
	God = "Hera",
	Slot = "Ranged",
	Icon = "Boon_Hera_05",
	CustomTrayText = "ShieldLoadAmmo_HeraRangedTrait_Tray",
	RequiredTrait = "ShieldLoadAmmoTrait",
	PreEquipWeapons = { "HeraLavaProjectile" },
	RarityLevels =
	{
		Common =
		{
			Multiplier = 1.000,
		},
		Rare =
		{
			Multiplier = 1.145,
		},
		Epic =
		{
			Multiplier = 1.290,
		},
		Heroic =
		{
			Multiplier = 1.435,
		}
	},
	PropertyChanges =
	{
		{
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			WeaponProperty = "Projectile",
			ChangeValue = "HeraProjectile",
			ChangeType = "Absolute",
		},
		{
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			WeaponProperty = "FireFx",
			ChangeValue = "ProjectileFireRing-Hera",
			ChangeType = "Absolute",
		},
		{
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			ProjectileName = "HeraProjectile",
			ProjectileProperty = "DamageLow",
			BaseMin = 60,
			BaseMax = 60,
			DepthMult = DepthDamageMultiplier,
			DeriveSource = "DamageBurst",
			IdenticalMultiplier =
			{
				Value = DuplicateStrongMultiplier,
			},
			ExtractValue =
			{
				ExtractAs = "TooltipDamage",
			}
		},
		{
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			ProjectileProperty = "DamageHigh",
			DeriveValueFrom = "DamageBurst"
		},
		{
			WeaponNames = { "HeraLavaProjectile" },
			ProjectileProperty = "DamageLow",
			BaseMin = 16,
			BaseMax = 16,
			DeriveSource = "DamageField",
			DepthMult = DepthDamageMultiplier,
			IdenticalMultiplier =
			{
				Value = DuplicateStrongMultiplier,
			},
			ExtractValue =
			{
				ExtractAs = "TooltipDamageLava",
			}
		},
		{
			WeaponNames = { "HeraLavaProjectile" },
			ProjectileProperty = "DamageHigh",
			DeriveValueFrom = "DamageField"
		},
		{
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			WeaponProperty = "FireOnRelease",
			ChangeValue = false,
			ChangeType = "Absolute",
		},
		{
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			ProjectileProperty = "Type",
			ChangeValue = "INSTANT",
		},
		{
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			ProjectileProperty = "DamageRadius",
			ChangeValue = 330
		},
		{
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			ProjectileProperty = "IgnoreCoverageAngles",
			ChangeValue = false
		},
		{
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			ProjectileProperty = "DetonateGraphic",
			ChangeValue = "RadialNovaSwordParry-Hera"
		},
	},
	ExtractValues =
	{
		{
			ExtractAs = "BaseRangedDamage",
			External = true,
			BaseType = "Projectile",
			BaseName = "RangedWeapon",
			BaseProperty = "DamageLow",
		}
	}
}]]
OlympusTraitData.HeraShoutTrait =
{
	InheritFrom = { "ShopTier1Trait" },
	RequiredTextLines = { "PoseidonWrathIntro01" },
	CustomTrayText = "HeraShoutTrait_Tray",
	God = "Hera",
	Slot = "Shout",
	Icon = "Boon_Hera_06",
	RarityLevels =
	{
		Common =
		{
			Multiplier = 1.0,
		},
		Rare =
		{
			Multiplier = 1.1,
		},
		Epic =
		{
			Multiplier = 1.2,
		},
		Heroic =
		{
			Multiplier = 1.3,
		}
	},
	AddShout =
	{
		FunctionName = "HeraShout",
		MaxFunctionName = "HeraMaxShout",
		Cost = 25,
		SuperDuration = 1.5,
		MaxDurationMultiplier = 5,
		IsBurst = true,
		ExtractValues =
		{
			{
				Key = "Cost",
				ExtractAs = "TooltipWrathStocks",
				Format = "WrathStocks",
				SkipAutoExtract = true
			},
		}
	},
	EndShout = "EndHera",
	PreEquipWeapons = { "HeraMaxSuper", "HeraSuper", "LightningStrikeX", "AthenaShoutWeapon", "PoseidonSurfWeapon",
	"ArtemisMaxShoutWeapon", "ArtemisShoutWeapon", "AphroditeSuperCharm", "AphroditeMaxSuperCharm", "AresSurgeWeapon",
	"DionysusShoutWeapon", "DemeterSuper", "DemeterMaxSuper" },
	SetupFunction =
	{
		Name = "SetupHeraNextShout",
		RunOnce = true,
	},
	PropertyChanges =
	{
		{
			WeaponName = "LightningStrikeX",
			ProjectileProperty = "DamageLow",
			BaseMin = 50,
			BaseMax = 50,
			IdenticalMultiplier =
			{
				Value = 0.0,
			}
		},
		{
			WeaponName = "LightningStrikeX",
			ProjectileProperty = "DamageHigh",
			DeriveValueFrom = "DamageLow"
		},
		{
			WeaponName = "PoseidonSurfWeapon",
			ProjectileProperty = "DamageLow",
			BaseMin = 250,
			BaseMax = 250,
			DepthMult = DepthDamageMultiplier,
			IdenticalMultiplier =
			{
				Value = 0.0,
			}
		},
		{
			WeaponName = "PoseidonSurfWeapon",
			ProjectileProperty = "DamageHigh",
			DeriveValueFrom = "DamageLow"
		},
		{
			WeaponName = "PoseidonSurfWeapon",
			ProjectileProperty = "ImpactVelocity",
			ChangeValue = 3500,
			ChangeType = "Absolute",
		},
		{
			WeaponNames = {"ArtemisMaxShoutWeapon", "ArtemisShoutWeapon",},
			ProjectileProperty = "DamageLow",
			BaseMin = 100,
			BaseMax = 100,
			DepthMult = DepthDamageMultiplier,
			IdenticalMultiplier =
			{
				Value = 0.0,
			}
		},
		{
			WeaponNames = {"ArtemisMaxShoutWeapon", "ArtemisShoutWeapon",},
			ProjectileProperty = "DamageHigh",
			DeriveValueFrom = "DamageLow"
		},

		{
			WeaponNames = {"ArtemisMaxShoutWeapon",},
			WeaponProperty = "NumProjectiles",
			ChangeValue = 10,
			ChangeType = "Absolute",
		},
		{
			WeaponNames = {"ArtemisMaxShoutWeapon", "ArtemisShoutWeapon",},
			ProjectileProperty = "CriticalHitChance",
			ChangeValue = 0.35,
			ChangeType = "Absolute",
		},
		{
			WeaponNames = { "AphroditeSuperCharm", "AphroditeMaxSuperCharm",},
			EffectName = "Charm",
			EffectProperty = "Duration",
			BaseValue = 5,
			ChangeType = "Add",
			MinMultiplier = 0.2,
			IdenticalMultiplier =
			{
				Value = 0.0,
			},
		},

		{
			WeaponNames = {"AphroditeMaxSuperCharm",},
			ProjectileProperty = "DamageLow",
			ChangeValue = 2500,
			DepthMult = DepthDamageMultiplier,
			IdenticalMultiplier =
			{
				Value = 0.0,
			}
		},
		{
			WeaponNames = {"AphroditeMaxSuperCharm",},
			ProjectileProperty = "DamageHigh",
			DeriveValueFrom = "DamageLow"
		},
		{
			WeaponName = "AresSurgeWeapon",
			ProjectileProperty = "DamageLow",
			BaseMin = 30,
			BaseMax = 30,
			AsInt = true,
			MinMultiplier = 0.05,
			IdenticalMultiplier =
			{
				Value = 0.0,
			}
		},
		{
			WeaponName = "AresSurgeWeapon",
			ProjectileProperty = "DamageHigh",
			DeriveValueFrom = "DamageLow"
		},
		{
			TraitName = "HermesShoutDodge",
			WeaponName = "HermesWrathBuff",
			EffectName = "DodgeBonus",
			EffectProperty = "BackFx",
			ChangeValue = "null",
			ChangeType = "Absolute",
		},
		{
			WeaponName = "DionysusShoutWeapon",
			EffectName = "DamageOverTime",
			EffectProperty = "Active",
			ChangeType = "Absolute",
			ChangeValue = true,
		},
		{
			WeaponName = "DionysusShoutWeapon",
			EffectName = "DamageOverTime",
			EffectProperty = "Amount",
			ChangeType = "Add",
			BaseMin = 15,
			BaseMax = 15,
			AsInt = true,
			MinMultiplier = 0.25,
			DepthMult = DepthDamageMultiplier,
			IdenticalMultiplier =
			{
				Value = 0.0,
			}
		},
		{
			WeaponNames = { "DemeterSuper", "DemeterMaxSuper", },
			ProjectileProperty = "DamageLow",
			BaseMin = 10,
			BaseMax = 10,
			MinMultiplier = 0.2,
			IdenticalMultiplier =
			{
				Value = 0.0,
			}
		},
		{
			WeaponNames = { "DemeterSuper", "DemeterMaxSuper", },
			ProjectileProperty = "DamageHigh",
			DeriveValueFrom = "DamageLow"
		},
		{
			WeaponNames = { "DemeterSuper", "DemeterMaxSuper", },
			ProjectileProperty = "Fuse",
			ChangeValue = 0.25
		},
	},
}

OlympusTraitData.RelationshipTrait =
{
	Icon = "Boon_Hera_07",
	InheritFrom = { "ShopTier2Trait" },
	RequiredFalseTrait = "RelationshipTrait",
	God = "Hera",
	RarityLevels =
	{
		Common =
		{
			Multiplier = 2.0,
		},
		Rare =
		{
			Multiplier = 3.0,
		},
		Epic =
		{
			Multiplier = 4.0,
		},
		Heroic =
		{
			Multiplier = 5.0,
		}
	},
	ExtractValues =
	{
		
	},
}
OlympusTraitData.PriviledgeHeraTrait =
{
	Icon = "Boon_Hera_08",
	InheritFrom = { "ShopTier1Trait" },
	God = "Hera",
	RequiredMetaUpgradeSelected = "GodEnhancementMetaUpgrade",
	RequiredMetaUpgradeStageUnlocked = 3,
	RarityLevels =
	{
		Common =
		{
			Multiplier = 1.00,
		},
		Rare =
		{
			Multiplier = 1.20,
		},
		Epic =
		{
			Multiplier = 1.40,
		},
		Heroic =
		{
			Multiplier = 1.60,
		}
	},
	PropertyChanges =
	{
		
	},
}
OlympusTraitData.FamilyHeraTrait =
{
	Icon = "Boon_Hera_08",
	InheritFrom = { "ShopTier1Trait" },
	God = "Hera",
	RequiredMetaUpgradeSelected = "VulnerabilityEffectBonusMetaUpgrade",
	RequiredMetaUpgradeStageUnlocked = 3,
	RarityLevels =
	{
		Common =
		{
			Multiplier = 1.00,
		},
		Rare =
		{
			Multiplier = 1.20,
		},
		Epic =
		{
			Multiplier = 1.40,
		},
		Heroic =
		{
			Multiplier = 1.60,
		}
	},
	PropertyChanges =
	{
		
	},
}
OlympusTraitData.MoreRewardTrait =
{
	InheritFrom = { "ShopTier1Trait" },
	God = "Hera",
	Icon = "Boon_Hera_09",
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
			Multiplier = 1.50,
		},
		Heroic =
		{
			Multiplier = 1.75,
		}
	},
}
OlympusTraitData.SnareOverTimeTrait =
{
	InheritFrom = { "ShopTier1Trait" },
	Icon = "Boon_Hera_14",
	RequiredFalseTrait = "SnareOverTimeTrait",
	RarityLevels =
	{
		Common =
		{
			Multiplier = 1.00,
		},
		Rare =
		{
			Multiplier = 0.94,
		},
		Epic =
		{
			Multiplier = 0.88,
		},
		Heroic =
		{
			Multiplier = 0.82,
		}
	},
	PropertyChanges =
	{
		
	},
}
OlympusTraitData.DeathDamageTrait =
{
	InheritFrom = { "ShopTier1Trait" },
	God = "Hera",
	Icon = "Boon_Hera_10",
	RarityLevels =
	{
		Common =
		{
			Multiplier = 1.00,
		},
		Rare =
		{
			Multiplier = 1.50,
		},
		Epic =
		{
			Multiplier = 2.00,
		},
		Heroic =
		{
			Multiplier = 2.50,
		}
	},		
}
OlympusTraitData.JealousyBurstTrait =
{
	InheritFrom = { "ShopTier1Trait" },
	God = "Hera",
	Icon = "Boon_Hera_11",
	RarityLevels =
	{
		Common =
		{
			Multiplier = 1.0,
		},
		Rare =
		{
			Multiplier = 1.2,
		},
		Epic =
		{
			Multiplier = 1.4,
		},
		Heroic =
		{
			Multiplier = 1.7
		}
	},		
}
OlympusTraitData.JealousyCastTrait =
{
	InheritFrom = { "ShopTier2Trait" },
	God = "Hera",
	Icon = "Boon_Hera_12",
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
			Multiplier = 1.50,
		},
		Heroic =
		{
			Multiplier = 1.75,
		}
	},
	PropertyChanges =
	{
	},
}
OlympusTraitData.MoreCompanionTrait =
{
	InheritFrom = { "ShopTier2Trait" },
	RequiredFalseTrait = "MoreCompanionTrait",
	RequiredFalseBiome = "Styx",
	God = "Hera",
	Icon = "Boon_Hera_13",
	RarityLevels =
	{
		Common =
		{
			Multiplier = 1.00,
		},
		Rare =
		{
			Multiplier = 1.28,
		},
		Epic =
		{
			Multiplier = 1.57,
		},
		Heroic =
		{
			Multiplier = 1.86,
		}
	},
	PropertyChanges =
	{
		
	},
}
OlympusTraitData.BetterSnareTrait =
{
	InheritFrom = { "ShopTier3Trait" },
	RequiredFalseTrait = "BetterSnareTrait",
	God = "Hera",
	Icon = "Boon_Hera_15",
	PropertyChanges =
	{
		
	},
}
OlympusTraitData.BetterJealousyTrait =
{
	InheritFrom = { "ShopTier3Trait" },
	RequiredFalseTrait = "BetterSnareTrait",
	God = "Hera",
	Icon = "Boon_Hera_15",
	PropertyChanges =
	{
		
	},
}
-- Duo Traits
OlympusTraitData.AuraExposedTrait =
{
	InheritFrom = { "SynergyTrait" },
	Icon = "Hera_Athena_01",
	RequiredFalseTrait = "AuraExposedTrait",
	PropertyChanges =
	{
		
	},		
}
OlympusTraitData.CurseLongerTrait =
{
	InheritFrom = { "SynergyTrait" },
	Icon = "Hera_Aphrodite_01",
	RequiredFalseTrait = "CurseLongerTrait",
	PropertyChanges =
	{
		
	},		
}
OlympusTraitData.BetterTrapsTrait =
{
	InheritFrom = { "SynergyTrait" },
	Icon = "Hera_Artemis_01",
	RequiredFalseTrait = "BetterTrapsTrait",
	PropertyChanges =
	{
		
	},		
}
OlympusTraitData.HeroicBoonsTrait =
{
	InheritFrom = { "SynergyTrait" },
	Icon = "Hera_Demeter_01",
	RequiredFalseTrait = "HeroicBoonsTrait",
	PropertyChanges =
	{
		
	},		
}
OlympusTraitData.JealousyStacksTrait =
{
	InheritFrom = { "SynergyTrait" },
	Icon = "Hera_Dionysus_01",
	RequiredFalseTrait = "JealousyStacksTrait",
	PropertyChanges =
	{
		
	},		
}
OlympusTraitData.KillMarkedTrait =
{
	InheritFrom = { "SynergyTrait" },
	Icon = "Hera_Ares_01",
	RequiredFalseTrait = "KillMarkedTrait",
	PropertyChanges =
	{
		
	},		
}
OlympusTraitData.GaugeLightningTrait =
{
	InheritFrom = { "SynergyTrait" },
	Icon = "Hera_Zeus_01",
	RequiredFalseTrait = "GaugeLightningTrait",
	PropertyChanges =
	{
		
	},		
}
OlympusTraitData.AuraRuptureTrait =
{
	InheritFrom = { "SynergyTrait" },
	Icon = "Hera_Poseidon_01",
	RequiredFalseTrait = "AuraRuptureTrait",
	PropertyChanges =
	{
		
	},		
}


-- LootData
local OlympusLootData = ModUtil.Entangled.ModData(LootData)
OlympusLootData.HeraUpgrade = {
	Name = "HeraUpgrade",
	InheritFrom = { "BaseLoot", "BaseSoundPackage" },
	CanReceiveGift = true,
	AlwaysShowDefaultUseText = true,
	Weight = 10,
	Icon = "BoonSymbolHera",
	BoonInfoIcon = "BoonInfoSymbolHeraIcon",
	DoorIcon = "BoonSymbolHeraIsometric",
	Color = { 123, 22, 53, 255 },
	LightingColor = { 123, 22, 53, 255 },
	LootColor = { 123, 22, 53, 255 },
	SubtitleColor = { 0.48, 0.09, 0.21, 1.0 },
	EventEndSound = "/SFX/ArtemisBoonArrow",
	UpgradeSelectedSound = "/SFX/ArtemisBoonChoice",
	LootRejectionAnimation = "BoonDissipateA_Hera",

	RequiredMinCompletedRuns = 1,
	RequiredTextLines = { "ZeusFirstPickUp" },

	TraitsList = { "HeraWeaponTrait", "HeraSecondaryTrait", "HeraRushTrait" },

	PriorityUpgrades = { "HeraWeaponTrait", "HeraSecondaryTrait", "HeraRushTrait"},--, "HeraRangedTrait" },
	WeaponUpgrades = { "HeraWeaponTrait", "HeraSecondaryTrait", "HeraRushTrait", "HeraShoutTrait"},--, "HeraRangedTrait", "HeraShoutTrait" },
	Traits = { },--"RelationshipTrait", "MoreCompanionTrait", "MoreRewardTrait", "DeathDamageTrait" },
	Consumables = { },

	LinkedUpgrades =
	{
		
		
	},

	Speaker = "NPC_Hera_01",
	Portrait = "Portrait_Hera_Default_01",
	WrathPortrait = "Portrait_Hera_Wrath_01",
	OverlayAnim = "HeraOverlay",
	Gender = "Female",
	SpawnSound = "/SFX/GoldCoinRewardDrop",
	FlavorTextIds =
	{
		"HeraUpgrade_FlavorText01",
		"HeraUpgrade_FlavorText02",
		"HeraUpgrade_FlavorText03",
	},

	OnSpawnVoiceLines =
	{
		BreakIfPlayed = true,
		RandomRemaining = true,
		PlayOnceThisRun = true,
		PreLineWait = 0.85,
		ChanceToPlay = 0.33,
		RequiredTextLines = { "HeraFirstPickUp" },
		RequiredFalseEncounters = { "DevotionTestTartarus", "DevotionTestAsphodel", "DevotionTestElysium", "Shop" },

		-- Queen Hera...
		{ Cue = "/VO/ZagreusField_4839" },
		-- Kind of you to show now, Queen Hera....
		{ Cue = "/VO/ZagreusField_4840" },
	},

	UpgradeMenuOpenVoiceLines =
	{
		[1] = GlobalVoiceLines.CheckOlympianReunionVoiceLines,
		[2] = GlobalVoiceLines.FoundRareBoonVoiceLines,
	},

	DuoPickupTextLineSets =
	{
		HeraWithZeus01 =
		{
			Name = "HeraWithZeus01",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			HasTraitNameInRoom = "PullZeusCastTrait",
			{ Cue = "/VO/Hera_0041",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort",
				Text = "Foster-Brother. How's ruling over all your relatives making you feel? A word of advice from your big sister: treat others as you treat yourself, because they might just do the same." },
			{ Cue = "/VO/Zeus_0260",
				PortraitExitWait = 0.35,
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
				StartSound = "/SFX/ZeusBoonThunder",
				EndSound = "/Leftovers/World Sounds/MapZoomInShort",
				Speaker = "NPC_Zeus_01", Portrait = "Portrait_Zeus_Default_01",
				Text = "I know how to rule my realm, Foster-Sister. Something you don't have to do anymore. I even have extra time to help our young Zagreus here!" },
		},
		HeraWithPoseidon01 =
		{
			Name = "HeraWithPoseidon01",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			HasTraitNameInRoom = "FishingRewardExtraTrait",
			{ Cue = "/VO/Hera_0042",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort",
				Text = "Ah. Poseidon. I know we haven't talked in a long while, but it seems you still haven't taken responsibility for your actions, or lackthereof." },
			{ Cue = "/VO/Poseidon_0260",
				Emote = "PortraitEmoteFiredUp",
				PortraitExitWait = 0.35,
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
				StartSound = "/SFX/PoseidonBoonWaveCrash", UseEventEndSound = true,
				EndSound = "/Leftovers/World Sounds/MapZoomInShort",
				Speaker = "NPC_Poseidon_01", Portrait = "Portrait_Poseidon_Default_01",
				Text = "Now hold on there, Hera! I always do my best. And how can I be reponsible for something I didn't do? I always take action. Like I'm doing right this moment, with Zagreus." },
		},
		HeraWithAthena01 =
		{
			Name = "HeraWithAthena01",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			HasTraitNameInRoom = "MoreTrapDamageTrait",
			{ Cue = "/VO/Hera_0043",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort",
				Text = "I wanted to thank you, young Athena. You were the first to help out our beloved Zagreus on his quest of freedom. It is you who started all this." },
			{ Cue = "/VO/Athena_0250",
				PortraitExitWait = 0.35,
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
				StartSound = "/SFX/AthenaBoonHolyShield",
				EndSound = "/Leftovers/World Sounds/MapZoomInShort",
				Speaker = "NPC_Athena_01", Portrait = "Portrait_Athena_Default_01",
				Text = "I only did what I believed should be done. I gave Zagreus the opportunity to escape. The rest is up to him now. We should continue to help in any way we can." },
		},
		HeraWithAres01 =
		{
			Name = "HeraWithAres01",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			HasTraitNameInRoom = "FoesNumberDamageTrait",
			RequiredFalseTextLines = { "OlympianReunionQuestComplete", "HeraWithAres02" },
			{ Cue = "/VO/Hera_0044",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort",
				Text = "I know you like to fight, Nephew. But a real warrior knows when to start a war and when to maintain peace—there's a fine line between the two." },
			{ Cue = "/VO/Ares_0240",
				PortraitExitWait = 0.35,
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
				StartSound = "/SFX/AresWrathBattle",
				EndSound = "/Leftovers/World Sounds/MapZoomInShort",
				Speaker = "NPC_Ares_01", Portrait = "Portrait_Ares_Default_01",
				Text = "I can only agree with you, Aunt Hera. And my kin here is in the midst of a war. He must fight to achieve peace in his realm." },
		},
		HeraWithAres02 =
		{
			Name = "HeraWithAres02",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			HasTraitNameInRoom = "FoesNumberDamageTrait",
			RequiredTextLines = { "OlympianReunionQuestComplete" },
			RequiredFalseTextLines = { "HeraWithAres01" },
			{ Cue = "/VO/Hera_0044",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort",
				Text = "I know you like to fight, Nephew. But a real warrior knows when to start a war and when to maintain peace—there's a fine line between the two." },
			{ Cue = "/VO/Ares_0240",
				PortraitExitWait = 0.35,
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
				StartSound = "/SFX/AresWrathBattle",
				EndSound = "/Leftovers/World Sounds/MapZoomInShort",
				Speaker = "NPC_Ares_01", Portrait = "Portrait_Ares_Default_01",
				Text = "I can only agree with you, Aunt Hera. And even though my kin has brought peace to his realm, he must continue to fight so that he might maintain it." },
		},
		HeraWithAphrodite01 =
		{
			Name = "HeraWithAphrodite01",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			HasTraitNameInRoom = "FreeHealthTrait",
			RequiredTextLines = { "HeraGift01", "AphroditeGift01" },
			{ Cue = "/VO/Hera_0045",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort",
				Text = "I know your heart is warm, but you could have put a little more on in front of Zagreus, young Aphrodite." },
			{ Cue = "/VO/Aphrodite_0230",
				PortraitExitWait = 0.35,
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
				EndSound = "/Leftovers/World Sounds/MapZoomInShort",
				Speaker = "NPC_Aphrodite_01", Portrait = "Portrait_Aphrodite_Default_01",
				Text = "I don't have anything to hide. And I must say, I've never heard Zagreus complain about the view, if you get my meaning."
			},
		},
		HeraWithArtemis01 =
		{
			Name = "HeraWithArtemis01",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			HasTraitNameInRoom = "ExplosionTrait",
			RequiredTextLines = { "HeraGift01", "ArtemisGift01" },
			{ Cue = "/VO/Hera_0046",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort",
				Text = "Young Artemis, nothing good is going to come out of being alone. Showing affection and care to others is the best way to accept yourself. Try it with Zagreus." },
			{ Cue = "/VO/Artemis_0250",
				PortraitExitWait = 0.35,
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
				StartSound = "/SFX/ArtemisBoonArrow",
				EndSound = "/Leftovers/World Sounds/MapZoomInShort",
				Speaker = "NPC_Artemis_01", Portrait = "Portrait_Artemis_Default_01",
				Text = "I show plenty of affection, to those worthy of it. In fact, I'll prove it right now: Zagreus, this is for you, from us, to show that we {#DialogueItalicFormat}care{#PreviousFormat}."
			},
		},
		HeraWithDionysus01 =
		{
			Name = "HeraWithDionysus01",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			HasTraitNameInRoom = "FullHealBossTrait",
			{ Cue = "/VO/Hera_0047",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort",
				Text = "Taking my place as an Olympian isn't too hard, my child? I remember when I was there—I argued with Zeus all the time. I hope you are not as headstrong as I was." },
			{ Cue = "/VO/Dionysus_0230",
				PortraitExitWait = 0.35,
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
				StartSound = "/SFX/DionysusBoonWineLaugh",
				EndSound = "/Leftovers/World Sounds/MapZoomInShort",
				Speaker = "NPC_Dionysus_01", Portrait = "Portrait_Dionysus_Default_01",
				Text = "{#DialogueItalicFormat}Oh{#PreviousFormat} don't you worry, Queen Hera, I'm trying a more chill approach. I still care and act, but just when it's necessary, yeah? Like right now, with Zag." },
		},
		HeraWithDemeter01 =
		{
			Name = "HeraWithDemeter01",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			HasTraitNameInRoom = "ChillFireTrait",
			{ Cue = "/VO/Hera_0048",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort",
				Text = "Oh, it's getting rather cold here. Demeter, why can't you let some warmth into your love, for once? If not for me, do it for Zagreus." },
			{ Cue = "/VO/Demeter_0370",
				PortraitExitWait = 0.35,
				StartSound = "/SFX/DemeterBoonFrost",
				EndSound = "/Leftovers/World Sounds/MapZoomInShort",
				Speaker = "NPC_Demeter_01", Portrait = "Portrait_Demeter_Default_01",
				Text = "You know very well why. And I don't have to justify anything to you. But I will not drag Zagreus into our affairs. Take it, Zagreus. And go." },
		},
	},

	SuperPriorityPickupTextLineSets =
	{
		HeraAboutOlympianReunionQuest01 =
		{
			Name = "HeraAboutOlympianReunionQuest01",
			PlayOnce = true,
			RequiredTextLines = { "HeraFirstPickUp", "PersephoneAboutOlympianReunionQuest01", },
			RequiredFalseTextLines = { "HeraAboutOlympianReunionQuest01b" },
			{ Cue = "/VO/ZagreusField_4901", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 2.33 },
				PostLineAnim = "ZagreusInteractEquip", PostLineAnimTarget = "Hero",
				PostLineFunctionName = "BoonInteractPresentation",
				Text = "I hope she can make it. In the name of Hades! Olympus, this is an official message! Here's a chance to reunite with my father, Queen Hera!" },
			{ Cue = "/VO/Hera_0057",
				PortraitExitWait = 1.25,
				PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
				UseEventEndSound = true,
				Emote = "PortraitEmoteDepressed",
				Text = "Young one. This is such a nice gesture, but I am not an official Olympian anymore. I don't believe I have a place among my siblings. Tell Hades I wish him well." },
		},
		HeraAboutOlympianReunionQuest01b =
		{
			Name = "HeraAboutOlympianReunionQuest01",
			PlayOnce = true,
			RequiredTextLines = { "HeraFirstPickUp", "PersephoneAboutOlympianReunionQuest01", },
			RequiredFalseTextLines = { "HeraAboutOlympianReunionQuest01" },
			{ Cue = "/VO/ZagreusField_4901", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 2.33 },
				PostLineAnim = "ZagreusInteractEquip", PostLineAnimTarget = "Hero",
				PostLineFunctionName = "BoonInteractPresentation",
				Text = "I hope she can make it. In the name of Hades! Olympus, this is an official message! Here's a chance to reunite with my father, Queen Hera!" },
			{ Cue = "/VO/Hera_0170",
				PortraitExitWait = 1.25,
				PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
				UseEventEndSound = true,
				Emote = "PortraitEmoteDepressed",
				Text = "Young one. This is such a nice gesture, but I am not an official Olympian anymore. I wish I could see all of the home improvement you did for me, but I don't believe I have a place among my siblings. Tell Hades I wish him well." },
		},
		HeraPostEpilogue01 =
		{
			Name = "HeraPostEpilogue01",
			PlayOnce = true,
			RequiredTextLines = { "HeraFirstPickUp", "OlympianReunionQuestComplete" },
			RequiredAnyTextLines = { "HeraAboutOlympianReunionQuest01", "HeraAboutOlympianReunionQuest01b" },
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			{ Cue = "/VO/Hera_0161",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Everyone told me that your little gathering went well. I am glad Hades can finally understand the meaning of family. You are never truly home without one." },
		},
		HeraHomeWarmthQuest01 =
		{
			Name = "HeraHomeWarmthQuest01",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraGift01", "HeraAboutHades02" },
			RequiredCosmetics = { "PostBossGiftRack", "QuestLog", "ChallengeSwitches1", "BreakableValue1", "OrpheusUnlockItem" },
			{ Cue = "/VO/Hera_0068",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Young one, I have a favor to ask. I know how Hades is. He doesn't open up easily to others. Could you please add some lights to his domain? Show him what's in front of him." },
		},
		HeraHomeWarmthQuest02 =
		{
			Name = "HeraHomeWarmthQuest02",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraHomeWarmthQuest01" },
			RequiredCosmetics = { "Cosmetic_HouseCandles02" },
			{ Cue = "/VO/Hera_0069",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Thank you, young one. Those candles should give Hades something to look at. But perhaps more fire could bring some warmth to his life. Try adding some." },
		},
		HeraHomeWarmthQuest03 =
		{
			Name = "HeraHomeWarmthQuest03",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraHomeWarmthQuest02" },
			RequiredCosmetics = { "Cosmetic_MainHallTikiTorches", "Cosmetic_KitchenStoveFlame" },
			{ Cue = "/VO/Hera_0070",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I am sure it's nice and warm now, but perhaps it's not enough. Add a fireplace—this should be a place of reunion for the people of his domain. A place to commune." },
		},
		HeraHomeWarmthQuest04 =
		{
			Name = "HeraHomeWarmthQuest04",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraHomeWarmthQuest03" },
			RequiredAnyCosmetics = { "Cosmetic_MainHallFireplace", "Cosmetic_MainHallFireplaceA" },
			{ Cue = "/VO/Hera_0071",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "The fireplace is perfect, young one. Now, perhaps you should break the silence with some music. Ask Orpheus to play something for your father." },
		},
		HeraHomeWarmthQuest05 =
		{
			Name = "HeraHomeWarmthQuest05",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraHomeWarmthQuest04" },
			RequiredCosmetics = { "Cosmetic_MusicPlayer" },
			--RequiredMusicName = { "MusicMusicPlayerMusicAsphodel2MusicPlayer" },
			{ Cue = "/VO/Hera_0072",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "{#DialogueItalicFormat}Hmm{#PreviousFormat}. Some music will do. And Orpheus plays it so well. Everything is almost perfect. Ask Thanatos for the final touch, if I correctly recall Hades's taste in home decor." },
		},
		HeraHomeWarmthQuest06 =
		{
			Name = "HeraHomeWarmthQuest06",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraHomeWarmthQuest05" },
			RequiredCosmetics = { "Cosmetic_ThanatosBrazier" },
			{ Cue = "/VO/Hera_0073",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "You did it! Those flames are what was missing. Now I am sure Hades is in a good place. And in good hands. You are a good son, Zagreus. Don't let anybody make you think otherwise." },
		},
	},

	PriorityPickupTextLineSets =
	{
		-- about other gods
		HeraAboutZeus01 =
		{
			Name = "HeraAboutZeus01",
			PlayOnce = true,
			RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp",
				"AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "HeraFirstPickUp" },
			RequiredFalseTextLines = { "HeraWithZeus01", "ZeusWithHera01" },
			RequiredGodLoot = "ZeusUpgrade",
			{ Cue = "/VO/Hera_0064",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I am the oldest and Zeus is the youngest among our siblings. I supposed this makes me the wisest, and Zeus the strongest. Or maybe I am just wise enough to let him believe that." },
		},
		HeraAboutDemeter01 =
		{
			Name = "HeraAboutDemeter01",
			PlayOnce = true,
			RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp",
				"AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "DemeterFirstPickUp", "HeraFirstPickUp" },
			RequiredFalseTextLines = { "HeraWithDemeter01", "DemeterWithHera01" },
			RequiredGodLoot = "DemeterUpgrade",
			{ Cue = "/VO/Hera_0171",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I don't know why, but Demeter never seemed to like me. All I did was give her advice on how to make her daughter happy, and she would yell at me, saying that I am not a mother and thus don't know anything about it. Maybe you, Zagreus, will heed my advice." },
		},
		HeraAboutDemeter02 =
		{
			Name = "HeraAboutDemeter02",
			PlayOnce = true,
			RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraAboutDemeter01" },
			RequiredFalseTextLines = { "HeraWithDemeter01", "DemeterWithHera01" },
			RequiredGodLoot = "DemeterUpgrade",
			{ Cue = "/VO/Hera_0058",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "When I learned that Demeter's daughter fled from Olympus, I knew exactly why. I believe Demeter knew as well, but she always remained angry at me after that. I can only hope that time may heal her relationship with her daughter someday." },
		},
		HeraAboutDionysus01 =
		{
			Name = "HeraAboutDionysus01",
			PlayOnce = true,
			RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraBackstory02", "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp",
				"AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "HeraFirstPickUp" },
			RequiredFalseTextLines = { "HeraWithDionysus01", "DionysusWithHera01" },
			RequiredGodLoot = "DionysusUpgrade",
			{ Cue = "/VO/Hera_0059",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "As you might know, I gave my seat as an Olympian to young Dionysus. Elders need to know when to pass the torch to the newer generation. That is something that my siblings will need to learn in time. You are part of the newer generation, Zagreus. This should be of help." },
		},
		HeraAboutHeraAspect01 =
		{
			Name = "HeraAboutHeraAspect01",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			RequiredWeapon = "GunWeapon",
			RequiredTrait = "GunManualReloadTrait",
			{ Cue = "/VO/Hera_0060",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Oh, my Aspect! I haven't used it in a while. I was much younger then, and believed flames had other purposes. I make much better use of them now. But if it helps you do your deeds, be my guest." },
		},
		HeraAboutHades01 =
		{
			Name = "HeraAboutHades01",
			PlayOnce = true,
			RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp",
				"AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "DemeterFirstPickUp", "HeraFirstPickUp" },
			{ Cue = "/VO/Hera_0162",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I remember your father. Always fair and just. He found balance in all things. Maybe there's a reason he doesn't want you to escape." },
		},
		HeraAboutHades02 =
		{
			Name = "HeraAboutHades02",
			PlayOnce = true,
			RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraAboutHades01" },
			{ Cue = "/VO/Hera_0163",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Even if you disagree with your father, you must continue to show him respect. He's been through so much, even I couldn't know where to start. Maybe start by listening to him." },
		},
		HeraAboutHades03 =
		{
			Name = "HeraAboutHades03",
			PlayOnce = true,
			RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraAboutHades02" },
			{ Cue = "/VO/Hera_0066",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I was not on good terms with my own father, and that's something I had to learn to live with. Do not be like me, do not wait until it is too late to fix it. Maybe you should go back to talk to him. For now, this is for you." },
		},
		HeraAboutPoseidon01 =
		{
			Name = "HeraAboutPoseidon01",
			PlayOnce = true,
			RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp",
				"AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "HeraFirstPickUp" },
			RequiredFalseTextLines = { "HeraWithPoseidon01", "PoseidonWithHera01" },
			RequiredGodLoot = "PoseidonUpgrade",
			{ Cue = "/VO/Hera_0065",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Poseidon doesn't take his responsibilities seriously. When Zeus refused to bring Hades back, he didn't speak up. That's what family should be for. That's something I'll have a hard time forgiving." },
		},
		--[[HeraAboutHera01 =
			{
				Name = "HeraAboutHera01",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp", "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "HeraFirstPickUp" },
				RequiredFalseTextLines = { "HeraWithHera01", "HeraWithHera01" },
				RequiredGodLoot = "HeraUpgrade",
				{ Cue = "/VO/Hera_0065",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I don't know if you've met her yet, but Sister Hera is younger than me. She can be strict, but she's still widely respected; she is queen of Olympus, after all. Maybe someday, she will show the same compassion that I am showing you now." },
			},]]
		HeraAboutCooking01 =
		{
			Name = "HeraAboutCooking01",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			RequiredCosmetics = { "Cosmetic_KitchenIsland" },
			{ Cue = "/VO/Hera_0061",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I heard you have a professional chef in your realm. I always enjoy cooking with my heart rather than following recipes. If you get here, I might just be able to give you the feast of your life." },
		},
		HeraAboutCooking02 =
		{
			Name = "HeraAboutCooking02",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraAboutCooking01" },
			RequiredCosmetics = { "Cosmetic_SpiceRack", "Cosmetic_Knives" },
			{ Cue = "/VO/Hera_0062",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I cook for my family to stop all fights, even if it's just for a moment—that moment where everybody enjoys the power of a good meal, knowing everything will be alright. I wish you could share it with us right now, young one." },
		},
		HeraAboutUnderworld01 =
		{
			Name = "HeraAboutUnderworld01",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraAboutHades01" },
			{ Cue = "/VO/Hera_0063",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I've never been to your father's domain, though I've heard it's larger than Olympus. I can understand how you keep getting lost. I hope this helps guide you." },
		},
		HeraAboutYoungGods01 =
		{
			Name = "HeraAboutUnderworld01",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp",
				"DionysusFirstPickUp", "HeraFirstPickUp" },
			{ Cue = "/VO/Hera_0067",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I don't know what to think about this new generation. They are all so focused on their own goals and responsibilities that they forget the essentials: love and affection. At least they are aiding you on your quest, and I hope this can assist as well." },
		},
		HeraPostGiftPickup01 =
		{
			Name = "HeraPostGiftPickup01",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraGift01", },
			{ Cue = "/VO/Hera_0087",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Do you remember when you shared that gift with me? Well, I gave it to someone who needed it. Your deed did further good, and I wanted you to know." },
		},
		HeraPostGiftPickup02 =
		{
			Name = "HeraPostGiftPickup02",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraGift02", },
			{ Cue = "/VO/Hera_0088",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Each time I sense you, I feel wonderful. That is a sign of a good relationship. Always cherish what you have, young one." },
		},

		HeraPostGiftPickup03 =
		{
			Name = "HeraPostGiftPickup03",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraGift03", },
			{ Cue = "/VO/Hera_0089",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I hope you may see me as a motherly figure. I know many do. And I don't mind, as long as it can help them find their way." },
		},
		HeraAboutKeepsake01 =
		{
			Name = "HeraAboutKeepsake01",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTrait = "ForceHeraBoonTrait",
			{ Cue = "/VO/Hera_0081",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				--Emote = "PortraitEmoteMusical",
				Text = "My Bottomless Cauldron! I was looking everywhere for it! I probably gave it to you, right? I completly forgot, haha. Keep it. At least I know where it is now." },
		},
		HeraRunCleared01 =
		{
			Name = "HeraRunCleared01",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			RequiredMinRunsCleared = 2,
			RequiresLastRunCleared = true,
			{ Cue = "/VO/Hera_0079",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "You finally got out last time, but fresh air doesn't seem to be your cup of tea. Maybe breathing some more will fix it for you. Try again, young one." },
		},
		HeraRunCleared0 =
		{
			Name = "HeraRunCleared02",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
			RequiredMinRunsCleared = 3,
			RequiresLastRunCleared = true,
			{ Cue = "/VO/Hera_0080",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I know you got out, yet you returned to your father's house once more. And I know why: deep down within your heart, you know you must help the people of your realm find their own place. We shall wait until you are done there. I know I will." },
		},
		HeraBackstory01 =
		{
			Name = "HeraBackstory01",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "ZeusFirstPickUp", "DionysusFirstPickUp", "AthenaFirstPickUp", "HeraFirstPickUp" },
			{ Cue = "/VO/Hera_0090",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "As you might know, there are twelve seats at the table of Olympus. Only the strongest and wisest of us can be there. I used to have my place there, you know. But I knew when my time was up, and gave back to the younger generation. Youth contains a fire that can extinguish only if you let it." },
		},
		HeraBackstory02 =
		{
			Name = "HeraBackstory02",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraBackstory01", "AresFirstPickUp", "ArtemisFirstPickUp", "AphroditeFirstPickUp" },
			{ Cue = "/VO/Hera_0091",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I believe you know Dionysus by now. I gave him my seat, because I saw that behind his relaxed attitude, he knew how to handle any stressful situation. {#DialogueItalicFormat}Hum{#PreviousFormat}. Or maybe it's the wine that makes him relaxed.... Of that, I am not sure. {#DialogueItalicFormat}Hehe{#PreviousFormat}." },
		},
		HeraBackstory03 =
		{
			Name = "HeraBackstory03",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "PersephoneMeeting02", "HeraBackstory02" },
			{ Cue = "/VO/Hera_0092",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "You know, Zagreus, we Elder Gods—your father included—had many challenges to get where we are now. Even myself. This escape is only one of many challenges you'll have to face on your own." },
		},
		HeraBackstory04 =
		{
			Name = "HeraBackstory04",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraBackstory03", "HeraAboutPoseidon01", "HeraAboutZeus01" },
			{ Cue = "/VO/Hera_0093",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I have two sisters and three foster-brothers. When we were younger, your father and I used to be close. But much happened, and we grew apart. My flame is the only one that can burn him. Keeping my distance is how I show my love." },
		},
		HeraBackstory05 =
		{
			Name = "HeraBackstory05",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraBackstory04", "HeraAboutHades02" },
			RequiredFalseTextLines = { "PersephoneReturnsHome01" },
			{ Cue = "/VO/Hera_0094",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "One of the last suggestions I gave while I was at the table of Olympus was to return your father to our mountain. Some agreed and some refused, but to everyone's suprise, it was your father who decided to stay there. There must have been something more important than his freedom from the Underworld, I suppose." },
		},
		HeraRunProgress01 =
		{
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			RequiredMinRunsCleared = 1,
			{ Cue = "/VO/Hera_0074",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I heard a strange rumor that you defeated your father. Though I doubt it, since you would be here with us.... Unless your home is not up here. But you won't know unless you try. So try again." },
		},
		HeraRunProgress02 =
		{
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			RequiredRoomLastRun = "C_Boss01",
			RequiredFalseRoomLastRun = "D_Intro",
			{ Cue = "/VO/Hera_0075",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I believe you've met Theseus, King of Athens. He always defined himself by the love of others, but self-identity starts by looking inside oneself. One day, he might understand. And so will you." },
		},
		HeraRunProgress03 =
		{
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			RequiredMinTimesSeenRoom = { A_Boss01 = 3, A_Boss02 = 3, A_Boss03 = 3 },
			RequiredRoomLastRun = "A_Boss01",
			RequiredFalseRoomLastRun = "B_Intro",
			{ Cue = "/VO/Hera_0076",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Megaera and her sisters are hard on the outside. But on the inside, I know they can become as kind as I am to you right now. Continue spreading kindness and you'll see." },
		},
		HeraRunProgress04 =
		{
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			RequiredAnyRoomsLastRun = { "D_Intro" },
			RequiresLastRunCleared = false,
			{ Cue = "/VO/Hera_0077",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Getting to the surface and defeating your father might be hard, but I think fighting is your own way of showing your affection towards another. Though remember that violence is rarely the solution." },
		},
		HeraRunProgress05 =
		{
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredAnyRoomsLastRun = { "C_PreBoss01" },
			RequiresLastRunCleared = false,
			{ Cue = "/VO/Hera_0078",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Were you defeated by Asterius? Don't hold any grudges against him, he's always been alone. I suppose Theseus' friendship is what he always wanted, and he feels the need to show his appreciation by helping him keep you away from the surface. Friendship comes in all forms." },
		},
		HeraLowHealth01 =
		{
			Name = "HeraLowHealth01",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			RequiredMaxHealthFraction = 0.20,
			RequiredMaxLastStands = 1,

			{ Cue = "/VO/Hera_0083",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Emote = "PortraitEmoteSurprise",
				Text = "You don't seem well, young one. Maybe you should go back before you faint. But in case you don't heed my advice, this is for you." },
		},
		HeraLowHealth02 =
		{
			Name = "HeraLowHealth02",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			RequiredMaxHealthFraction = 0.15,
			RequiredMaxLastStands = 1,

			{ Cue = "/VO/Hera_0084",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I can sense your fire going out. Take some time to rest. Continue only when you feel you are ready." },
		},
		HeraLowHealth03 =
		{
			Name = "HeraLowHealth03",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			RequiredMaxHealthFraction = 0.10,
			RequiredMaxLastStands = 1,

			{ Cue = "/VO/Hera_0085",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I sense your life essence growing weak. This blessing might reignite your will to live on." },
		},
		HeraLowHealth04 =
		{
			Name = "HeraLowHealth04",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			RequiredMaxHealthFraction = 0.25,
			RequiredMaxLastStands = 1,

			{ Cue = "/VO/Hera_0086",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I heard that death is nothing to you, and your father will always welcome you back into his realm. The next time you fall, perhaps you should go and thank him for what he does." },
		},
		HeraLegendaryPickUp01 =
		{
			Name = "HeraLegendaryPickUp01",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			ValuableUpgradeInRoom = {
				AllAtLeastRarity = "Rare",
				HasAtLeastRarity = "Epic",
			},
			{ Cue = "/VO/Hera_0082",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I offer you my strongest fire. There's always a chance of getting burned, but I know you'll use it well. I also know you'll rise from your own ashes, young one." },
		},
	},

	PickupTextLineSets =
	{
		HeraFirstPickUp =
		{
			Name = "HeraFirstPickUp",
			PlayOnce = true,
			RequiredTextLines = { "AthenaFirstPickUp", "DionysusFirstPickUp", },
			{ Cue = "/VO/ZagreusField_4900", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 4.23 },
				PostLineAnim = "ZagreusInteractEquip", PostLineAnimTarget = "Hero",
				PostLineFunctionName = "BoonInteractPresentation",
				Text = "Who can this be? It feels so... warm. In the name of Hades! Olympus! I accept this message." },
			{ Cue = "/VO/Hera_0001",
				PortraitExitWait = 1.25,
				PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
				UseEventEndSound = true,
				Text = "Hello, young one. It is a pleasure to meet you, Zagreus. I have heard word of your problem—this here is to show my compassion towards your cause. Until next time." },
		},
		HeraMiscPickup01 =
		{
			Name = "HeraMiscPickup01",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			{ Cue = "/VO/Hera_0002",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Love is the tact of every god—the only warmth and the only peace. Take this, and remember it well." },
		},
		HeraMiscPickup02 =
		{
			Name = "HeraMiscPickup02",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			{ Cue = "/VO/Hera_0003",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "The fire you kindle for your enemy often burns yourself more than them. Be good to others, as I am with you now." },
		},
		HeraMiscPickup03 =
		{
			Name = "HeraMiscPickup03",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
			RequiredMaxHealthFraction = 0.75,
			{ Cue = "/VO/Hera_0004",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "It feels as though you don't really want to escape; rather, you are trying to find your place. Whether that is true or not, I shall support you in your quest. Take this." },
		},
		HeraMiscPickup04 =
		{
			Name = "HeraMiscPickup04",
			Priority = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			{ Cue = "/VO/Hera_0005",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Friendship is a fire. But whether it is going to warm your hearth or burn down your house, one can never tell. Still, we continue to try." },
		},
		HeraMiscPickup05 =
		{
			Name = "HeraMiscPickup05",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			{ Cue = "/VO/Hera_0006",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Always be kind to others. No one needs to light a fire under you when there’s a fire within you. Kill them with kindness, young one." },
		},
		HeraMiscPickup06 =
		{
			Name = "HeraMiscPickup06",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			{ Cue = "/VO/Hera_0007",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I use my fire to guide home all who have lost their way, including you, young one. I know you can find a home up here." },
		},
		HeraMiscPickup07 =
		{
			Name = "HeraMiscPickup07",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			{ Cue = "/VO/Hera_0008",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Warmth, kindness, and friendship are the most yearned for commodities in the world, Zagreus. If you can provide them, you will never be lonely." },
		},
		HeraMiscPickup08 =
		{
			Name = "HeraMiscPickup08",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			{ Cue = "/VO/Hera_0009",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "There is no formula for generating the authentic warmth of a home. It needs to be genuine. But if you continue like this, I know you will find it." },
		},
		HeraMiscPickup09 =
		{
			Name = "HeraMiscPickup09",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			{ Cue = "/VO/Hera_0010",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Remember, young one: kindness is the language which the deaf can hear and the blind can see." },
		},
		HeraMiscPickup10 =
		{
			Name = "HeraMiscPickup10",
			Priority = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
			{ Cue = "/VO/Hera_0011",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I am not going to stop helping you until you find what you are looking for. We share the same kind of determination, I suppose." },
		},
		HeraMiscPickup11 =
		{
			Name = "HeraMiscPickup11",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			{ Cue = "/VO/Hera_0012",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Once a fire spreads, there's no limit to what it consumes. Be careful not to burn yourself with this, Zagreus." },
		},
		HeraMiscPickup12 =
		{
			Name = "HeraMiscPickup12",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			{ Cue = "/VO/Hera_0013",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "If it isn't a passion, it isn't burning. If it isn't on fire, you haven't lived yet. This flame should help you, young one." },
		},
		HeraMiscPickup13 =
		{
			Name = "HeraMiscPickup13",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			{ Cue = "/VO/Hera_0014",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "If your desire to escape was strong enough, you would already be out. Something deep inside you makes you fail. Maybe you should figure that out first, hm?" },
		},
		HeraMiscPickup14 =
		{
			Name = "HeraMiscPickup14",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			MinRunsSinceAnyTextLines = { TextLines = { "HeraPostEpilogue01" }, Count = 3 },
			{ Cue = "/VO/Hera_0015",
				PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
				Emote = "PortraitEmoteMusical",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Instead of fighting, take a moment to reflect on yourself. You are the only one that defines yourself." },
		},
		HeraMiscPickup15 =
		{
			Name = "HeraMiscPickup15",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp", "HeraGift01" },
			{ Cue = "/VO/Hera_0016",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Someday you shall make it up here and I will cook something for you, young one. But first, you must believe that you can have a home here." },
		},
		HeraMiscPickup16 =
		{
			Name = "HeraMiscPickup16",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			{ Cue = "/VO/Hera_0017",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Still trying to find your place in this world, Zagreus? If you haven't figured that out, maybe you should talk to more people. Different perspectives always help in defining your own." },
		},
		HeraMiscPickup17 =
		{
			Name = "HeraMiscPickup17",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			{ Cue = "/VO/Hera_0018",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I have talked to my relatives about your situation. Some of them wanted to stop supporting you, but I pleaded your case and they will double down their assitance. You're welcome!" },
		},
		HeraMiscPickup18 =
		{
			Name = "HeraMiscPickup18",
			Priority = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
			{ Cue = "/VO/Hera_0019",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Normally I try to keep away from the family drama, but everyone deserves to rest at the hearth of their own home.  I hope this helps you reach the hearth of Olympus, young one." },
		},
		HeraMiscPickup19 =
		{
			Name = "HeraMiscPickup19",
			Priority = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = { "HeraFirstPickUp" },
			RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
			{ Cue = "/VO/Hera_0020",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Maybe instead of fighting your father, you should tell him how you really feel. You never know; maybe all he wants is the love of his son?" },
		},

		-- shorter acknowledgments
		HeraMiscPickup20 =
		{
			Name = "HeraMiscPickup20",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = GameData.HeraBasicPickUpTextLines,
			{ Cue = "/VO/Hera_0021",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Fight your way back, like a wildfire that never goes out." },
		},
		HeraMiscPickup21 =
		{
			Name = "HeraMiscPickup21",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = GameData.HeraBasicPickUpTextLines,
			{ Cue = "/VO/Hera_0022",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "This is how the fire starts. This is how they'll burn." },
		},
		HeraMiscPickup22 =
		{
			Name = "HeraMiscPickup22",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = GameData.HeraBasicPickUpTextLines,
			{ Cue = "/VO/Hera_0023",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Keep a little fire burning; however small, however hidden. It shall make you strong." },
		},
		HeraMiscPickup23 =
		{
			Name = "HeraMiscPickup23",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = GameData.HeraBasicPickUpTextLines,
			{ Cue = "/VO/Hera_0024",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Life is a flame that is always burning itself out, but it catches fire again every time a child is born." },
		},
		HeraMiscPickup24 =
		{
			Name = "HeraMiscPickup24",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = GameData.HeraBasicPickUpTextLines,
			{ Cue = "/VO/Hera_0025",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "What fire does not destroy, it hardens and makes stronger." },
		},
		HeraMiscPickup25 =
		{
			Name = "HeraMiscPickup25",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = GameData.HeraBasicPickUpTextLines,
			{ Cue = "/VO/Hera_0026",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Fire is a good servant, but a bad master. Tame it well, young one." },
		},
		HeraMiscPickup26 =
		{
			Name = "HeraMiscPickup26",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = GameData.HeraBasicPickUpTextLines,
			{ Cue = "/VO/Hera_0027",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "What matters most is how well you walk through the fire. You are doing well. Keep going." },
		},
		HeraMiscPickup27 =
		{
			Name = "HeraMiscPickup27",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = GameData.HeraBasicPickUpTextLines,
			{ Cue = "/VO/Hera_0028",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "A hearth fire brings warmth and never stops, and you shall do the same. This is for you." },
		},
		HeraMiscPickup28 =
		{
			Name = "HeraMiscPickup28",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = GameData.HeraBasicPickUpTextLines,
			{ Cue = "/VO/Hera_0029",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Respect those who deserve your respect. The rest will burn in their own malice." },
		},
		HeraMiscPickup29 =
		{
			Name = "HeraMiscPickup29",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = GameData.HeraBasicPickUpTextLines,
			{ Cue = "/VO/Hera_0030",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Zagreus... I don't know what to do anymore. I suppose this is what you are looking for. Is that enough?" },
		},

		HeraMiscPickup30 =
		{
			Name = "HeraMiscPickup30",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = GameData.HeraBasicPickUpTextLines,
			{ Cue = "/VO/Hera_0031",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I don't understand the rush to escape. Nobody is going to die.... Except perhaps you, I guess. I'm sorry, young one." },
		},
		HeraMiscPickup31 =
		{
			Name = "HeraMiscPickup31",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = GameData.HeraBasicPickUpTextLines,
			{ Cue = "/VO/Hera_0032",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "There's always time to talk to others. Communication is key to any relationship. You should start with your father." },
		},
		HeraMiscPickup32 =
		{
			Name = "HeraMiscPickup32",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = GameData.HeraBasicPickUpTextLines,
			{ Cue = "/VO/Hera_0033",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Get this blessing while it's hot. It's fresh out of the oven, {#DialogueItalicFormat}haha{#PreviousFormat}!" },
		},
		HeraMiscPickup33 =
		{
			Name = "HeraMiscPickup33",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = GameData.HeraBasicPickUpTextLines,
			{ Cue = "/VO/Hera_0034",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "How many times have you died by now? And every time, people were there to welcome you back. You should go and thank them, young one." },
		},
		HeraMiscPickup34 =
		{
			Name = "HeraMiscPickup34",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = GameData.HeraBasicPickUpTextLines,
			{ Cue = "/VO/Hera_0035",
				PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
				Emote = "PortraitEmoteMusical",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Fire doesn't care if you are good or bad; it burns all. This is why you must control it, so only the good remains." },
		},
		HeraMiscPickup35 =
		{
			Name = "HeraMiscPickup35",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = GameData.HeraBasicPickUpTextLines,
			{ Cue = "/VO/Hera_0036",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Such youth. Such tenacity. I wish I was younger, like you. I hope this old lady's blessing is good enough, Zagreus." },
		},
		HeraMiscPickup36 =
		{
			Name = "HeraMiscPickup36",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = GameData.HeraBasicPickUpTextLines,
			{ Cue = "/VO/Hera_0037",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Always look forward in life... and, in your case, death as well. Haha. But seriously, keep going." },
		},
		HeraMiscPickup37 =
		{
			Name = "HeraMiscPickup37",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = GameData.HeraBasicPickUpTextLines,
			{ Cue = "/VO/Hera_0038",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "It must be dark down there. Maybe this fire can illuminate your path to a better ending." },
		},
		HeraMiscPickup38 =
		{
			Name = "HeraMiscPickup38",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = GameData.HeraBasicPickUpTextLines,
			{ Cue = "/VO/Hera_0039",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "There's always someone to turn you down. But remember, there are also people to lift you up when that happens. Be nice to others." },
		},
		HeraMiscPickup39 =
		{
			Name = "HeraMiscPickup39",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			RequiredTextLines = GameData.HeraBasicPickUpTextLines,
			{ Cue = "/VO/Hera_0040",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I finally found you. I kept this for you. You know what to do now, right, Zagreus?" },
		},
	},

	BoughtTextLines =
	{
		HeraLootBought01 =
		{
			Name = "HeraLootBought01",
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },

			{ Cue = "/VO/Hera_0095",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Charon sold my blessing to you? He should be giving them away for free. I'll try to convince him next time." },
		},
		HeraLootBought02 =
		{
			Name = "HeraLootBought02",
			PlayOnce = true,
			ChanceToPlay = 0.33,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },

			{ Cue = "/VO/Hera_0096",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Obols are of no importance; only love and relationships matter. You did well not getting attached to that coin." },
		},
		HeraLootBought03 =
		{
			Name = "HeraLootBought03",
			PlayOnce = true,
			ChanceToPlay = 0.33,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },

			{ Cue = "/VO/Hera_0097",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I suppose this is the price of showing compassion towards Charon for all he is doing for you. Though, it's not much, when you think about it." },
		},
	},

	RejectionTextLines =
	{
		HeraRejection01 =
		{
			Name = "HeraRejection01",
			{ Cue = "/VO/Hera_0098",
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I showed you how to sacrifice yourself for others. Now, you'll have to sacrifice yourself for me." },
		},
		HeraRejection02 =
		{
			Name = "HeraRejection02",
			{ Cue = "/VO/Hera_0099",
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Here's some wisdom: choose me next time." },
		},
		HeraRejection03 =
		{
			Name = "HeraRejection03",
			{ Cue = "/VO/Hera_0100",
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "That was a risky move. Don't stand too close to the fire, Zagreus. You'll burn yourself." },
		},
		HeraRejection04 =
		{
			Name = "HeraRejection04",
			{ Cue = "/VO/Hera_0101",
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I use fire to illuminate the right path. However, it does have other uses. Allow me show you, young one." },
		},
		HeraRejection05 =
		{
			Name = "HeraRejection05",
			{ Cue = "/VO/Hera_0102",
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Sometimes you need to be harsh to teach your children. Pay attention to this lesson, young one." },
		},
		HeraRejection06 =
		{
			Name = "HeraRejection06",
			{ Cue = "/VO/Hera_0103",
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I generally think you should be equally nice to everyone, but next time, I would appreciate it if you picked me." },
		},
		HeraRejection07 =
		{
			Name = "HeraRejection07",
			{ Cue = "/VO/Hera_0104",
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Family shouldn't fight, but sometimes it's the only way to resolve our differences. So be it." },
		},
		HeraRejection08 =
		{
			Name = "HeraRejection08",
			{ Cue = "/VO/Hera_0105",
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "That's not how you show compassion. You need to be taught a lesson." },
		},
		HeraRejection09 =
		{
			Name = "HeraRejection09",
			{ Cue = "/VO/Hera_0106",
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Why choose between us? You'll always make someone mad at you. So young, and so much to learn." },
		},
		HeraRejection10 =
		{
			Name = "HeraRejection10",
			{ Cue = "/VO/Hera_0107",
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "The solution here was neither. You'll learn it the hard way." },
		},
		HeraRejection11 =
		{
			Name = "HeraRejection11",
			{ Cue = "/VO/Hera_0108",
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I already forgive you, but that doesn't mean I won't make it hard." },
		},
		HeraRejection12 =
		{
			Name = "HeraRejection12",
			{ Cue = "/VO/Hera_0109",
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Some choices are hard to make. I hope you had your reasons. Still, here it comes." },
		},
	},
	FreePassVoiceLines = {
		HeraFreePass01 =
		{
			PlayOnce = true,
			Name = "HeraFreePass01",
			{ Cue = "/VO/Hera_0098",
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I believe you know me enough by now. I don't like conflict. I don't see the point of fighting you. Take this and be on your way, young one." },
		},
	},
	RejectionVoiceLines =
	{
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.3,
			RequiredEncounters = { "DevotionTestTartarus", "DevotionTestAsphodel", "DevotionTestElysium", },
			SuccessiveChanceToPlay = 0.33,
			UsePlayerSource = true,

			-- I didn't mean to, Queen Hera.
			{ Cue = "/VO/ZagreusField_4902" },
			-- I am very sorry, Queen Hera.
			{ Cue = "/VO/ZagreusField_4903" },
			-- It isn't anything against you, Queen Hera.
			{ Cue = "/VO/ZagreusField_4904" },
			-- I don't know why I did that, Queen Hera.
			{ Cue = "/VO/ZagreusField_4905" },
		},
		[2] = GlobalVoiceLines.GodRejectedVoiceLines,
	},

	MakeUpTextLines =
	{
		HeraMakeUp01 =
		{
			Name = "HeraMakeUp01",

			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			{ Cue = "/VO/Hera_0110",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Forgive, and forget." },
		},
		HeraMakeUp02 =
		{
			Name = "HeraMakeUp02",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			{ Cue = "/VO/Hera_0111",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Blood under the bridge, isn't that what you say in your realm?" },
		},
		HeraMakeUp03 =
		{
			Name = "HeraMakeUp03",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			{ Cue = "/VO/Hera_0112",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "We should all be selective in our battles, and try not to make every problem a war. Which is why I forgive you." },
		},
		HeraMakeUp04 =
		{
			Name = "HeraMakeUp04",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			{ Cue = "/VO/Hera_0113",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "By forgiving you now, I hope you can forgive those who wrong you." },
		},
		HeraMakeUp05 =
		{
			Name = "HeraMakeUp05",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			{ Cue = "/VO/Hera_0114",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I don't like fighting. I just wanted to teach you that there can be consequences for our actions." },
		},
		HeraMakeUp06 =
		{
			Name = "HeraMakeUp06",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			{ Cue = "/VO/Hera_0115",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Communication comes in many forms. Fighting is one of them. But it is certainly not my favorite." },
		},
		HeraMakeUp07 =
		{
			Name = "HeraMakeUp07",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			{ Cue = "/VO/Hera_0116",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "You didn't choose me because you knew I would understand. You just didn't want to make the others feel bad. How kind of you." },
		},
		HeraMakeUp08 =
		{
			Name = "HeraMakeUp08",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			{ Cue = "/VO/Hera_0117",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Stop! I do not want to fight you. It is never the solution." },
		},
		HeraMakeUp09 =
		{
			Name = "HeraMakeUp09",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			{ Cue = "/VO/Hera_0118",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "War will only bring more war. Let's make peace to stop the cycle of hate." },
		},
		HeraMakeUp10 =
		{
			Name = "HeraMakeUp10",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			{ Cue = "/VO/Hera_0119",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "We might have our differences, but it's not worth fighting over. It is never worth fighting." },
		},
		HeraMakeUp11 =
		{
			Name = "HeraMakeUp11",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			{ Cue = "/VO/Hera_0120",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Truce! You cannot defeat me and I refuse to defeat you. Let's end it here." },
		},
		HeraMakeUp12 =
		{
			Name = "HeraMakeUp12",
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			{ Cue = "/VO/Hera_0121",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "What are you doing? I came here to help you. Let's stop fighting, and take this." },
		},
	},

	GiftTextLineSets =
	{
		-- gives gift in exchange
		HeraGift01 =
		{
			Name = "HeraGift01",
			PlayOnce = true,
			{ Cue = "/VO/ZagreusHome_3871", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				PostLineFunctionName = "BoonInteractPresentation",
				Text = "You've been so kind to me, Queen Hera. I found this, and wanted to give it to you to show my appreciation." },
			{ Cue = "/VO/Hera_0122",
				PortraitExitWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Giving to others while you don't have much yourself, {#DialogueItalicFormat}hm{#PreviousFormat}? This shows how good your heart is. I shall return the kindness, if you'll allow me." },
		},
		HeraGift02 =
		{
			Name = "HeraGift02",
			PlayOnce = true,
			RequiredTextLines = { "HeraGift01" },
			{ Cue = "/VO/ZagreusHome_3872", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
				PostLineFunctionName = "BoonInteractPresentation",
				Text = "You seemed to have enjoyed my last gift, Queen Hera. Here's a little more for you." },
			{ Cue = "/VO/Hera_0123",
				PortraitExitWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Young one, I feel the genuine warmth. The affection. No joke! I am touched by your gesture." },
		},
		HeraGift03 =
		{
			Name = "HeraGift03",
			PlayOnce = true,
			RequiredTextLines = { "HeraGift02" },
			{ Cue = "/VO/ZagreusHome_3873", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
				PostLineFunctionName = "BoonInteractPresentation",
				Text = "Queen Hera, you are so motherly. I feel like you should get this for everything you do." },
			{ Cue = "/VO/Hera_0124",
				PortraitExitWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I do not have children, but if I did, I could only hope they would act as you do. Good deeds are always rewarded." },
		},
		HeraGift04 =
		{
			Name = "HeraGift04",
			PlayOnce = true,
			RequiredTextLines = { "HeraGift03" },
			{ Cue = "/VO/ZagreusHome_3874", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
				PostLineFunctionName = "BoonInteractPresentation",
				Text = "I found this and I really wanted you to have it. It's my way to repay all the kindness you're showing me." },
			{ Cue = "/VO/Hera_0125",
				PortraitExitWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Oh! I was running short on that. However, I don't believe you should be the one to provide it to me, since it's so rare within your realm." },
		},
		HeraGift05 =
		{
			Name = "HeraGift05",
			PlayOnce = true,
			RequiredTextLines = { "HeraGift04" },
			{ Cue = "/VO/ZagreusHome_3875", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
				PostLineFunctionName = "BoonInteractPresentation",
				Text = "It was hard, but I finally found this. And I wanted to give it to you, Queen Hera. I hope you'll accept it." },
			{ Cue = "/VO/Hera_0126",
				PortraitExitWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Sharing even when you have nothing is very kind of you. I also try to share as much as I can, and spread love to others." },
		},
		HeraGift06 =
		{
			Name = "HeraGift06",
			PlayOnce = true,
			RequiredTextLines = { "HeraGift05" },
			{ Cue = "/VO/ZagreusHome_3876", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
				PostLineFunctionName = "BoonInteractPresentation",
				Text = "You seem to appreciate all my gifts. I didn't know you liked Nectar so much, Queen Hera. I wanted to give you some more." },
			{ Cue = "/VO/Hera_0127",
				PortraitExitWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I must confess, I keep giving your gifts to those in need. I suppose it would be faster if you gave those to others from now on. I'm sorry I didn't tell you sooner." },
		},
		HeraGift07 =
		{
			Name = "HeraGift07",
			PlayOnce = true,
			RequiredTextLines = { "HeraGift06" },
			{ Cue = "/VO/ZagreusHome_3877", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
				PostLineFunctionName = "BoonInteractPresentation",
				Text = "You said that you gave all my gifts to others, but I wanted to give you something more valuable, Queen Hera. I hope you'll keep this one." },
			{ Cue = "/VO/Hera_0128",
				PortraitExitWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				PostLineThreadedFunctionName = "MaxedRelationshipPresentation",
				PostLineFunctionArgs = { Text = "NPC_Hera_01", Icon = "Keepsake_HeraSticker_Max" },
				Text = "This is too much! You know what? With this gift, I prononce us the Warmth and Compassion Brigade! It might sound silly, but if we can make others laugh at the name, we're already well on our way to bringing people together. Now, here's your badge to prove it." },
		},
	},

	GiftGivenVoiceLines =
	{
		BreakIfPlayed = true,
		PreLineWait = 1.0,
		PlayFromTarget = true,

		-- I'll allow it. Thanks for your kindness, Queen Hera.
		{ Cue = "/VO/ZagreusField_4912" },
	},

	ShoutActivationSound = "/SFX/BurnDamage",
	ShoutVoiceLines =
	{
		Queue = "Interrupt",
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			RequiredKillEnemiesFound = true,
			RequiredFalseSpurnedGodName = "HeraUpgrade",

			-- Punish those who misbehave!
			{ Cue = "/VO/Hera_0129" },
			-- Only ashes shall remain.
			{ Cue = "/VO/Hera_0130" },
			-- So much violence!
			{ Cue = "/VO/Hera_0164" },
			-- We will bring peace to this realm.
			{ Cue = "/VO/Hera_0131" },
			-- Let's teach them a lesson.
			{ Cue = "/VO/Hera_0132" },
			-- No soup for you!
			{ Cue = "/VO/Hera_0133" },
			-- Fire knows no limit!
			{ Cue = "/VO/Hera_0134" },
			-- We are the Warmth and Compassion Brigade!
			{ Cue = "/VO/Hera_0135", RequiredTextLines = { "HeraGift07" } },
		},
		{
			BreakIfPlayed = true,
			PlayFromTarget = true,
			RandomRemaining = true,
			RequiredKillEnemiesFound = true,
			RequiredSpurnedGodName = "HeraUpgrade",
			RequireCurrentEncounterNotComplete = true,

			-- Why are you doing this?
			{ Cue = "/VO/Hera_0136" },
			-- I was only kind to you...
			{ Cue = "/VO/Hera_0137" },
			-- This nonsense has to stop...
			{ Cue = "/VO/Hera_0138" },
			-- There's no reason to fight like this.
			{ Cue = "/VO/Hera_0139" },
			-- Fighting is not the solution...
			{ Cue = "/VO/Hera_0140" },
		},
	},

	SwapUpgradePickedVoiceLines =
	{
		BreakIfPlayed = true,
		RandomRemaining = true,
		PreLineWait = 1.05,
		SuccessiveChanceToPlay = 0.33,
		CooldownName = "SaidHeraRecently",
		CooldownTime = 40,
		RequiresLastUpgradeSwapped = true,
		UsePlayerSource = true,

		-- Oh, that's warmer thanks to you, Queen Hera.
		{ Cue = "/VO/ZagreusField_4936" },
		-- Queen Hera, you've always been kind to me.
		{ Cue = "/VO/ZagreusField_4937" },
		-- Queen Hera, I feel at home thanks to you.
		{ Cue = "/VO/ZagreusField_4938" },
	},

	DeathTauntVoiceLines =
	{
		RandomRemaining = true,
		BreakIfPlayed = true,
		PreLineWait = 1.25,
		NoTarget = true,

		-- I didn't it want to come to this. Forgive me.
		{ Cue = "/VO/Hera_0141" },
		-- Go back to your father. Find your true home.
		{ Cue = "/VO/Hera_0142" },
		-- I did this out of kindness. I know someday you'll understand.
		{ Cue = "/VO/Hera_0143" },
	},

	BlindBoxOpenedVoiceLines =
	{
		RandomRemaining = true,
		BreakIfPlayed = true,
		PreLineWait = 0.3,
		Source = { SubtitleColor = Color.HeraVoice },
		TriggerCooldowns = { "ZagreusBoonTakenSpeech" },

		-- Oh hoh, you are on fire, young one!
		{ Cue = "/VO/Hera_0144" },
		-- This shall keep you warm.
		{ Cue = "/VO/Hera_0145" },
		-- We can do this together.
		{ Cue = "/VO/Hera_0146" },
		-- I appreciate your gesture, young one.
		{ Cue = "/VO/Hera_0147" },
		-- You are going to burn it to the ground, aren't you?
		{ Cue = "/VO/Hera_0148" },
	},
}-- Other gods modification
	-- AthenaUpgrade
	table.insert(OlympusLootData.AthenaUpgrade.PriorityPickupTextLineSets.AthenaVsOlympians01.RequiredTextLines,
		"HeraFirstPickUp")

	-- HermesUpgrade
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian01.RequiredMinAnyTextLines
		.TextLines, "HermesExpectingHera01")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian01.RequiredFalseGodLoots
		, "HeraUpgrade")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian01.RequiredOneOfTraits
		, "ForceHeraBoonTrait")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian02.RequiredMinAnyTextLines
		.TextLines, "HermesExpectingHera01")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian02.RequiredFalseGodLoots
		, "HeraUpgrade")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian02.RequiredOneOfTraits
		, "ForceHeraBoonTrait")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian03.RequiredMinAnyTextLines
		.TextLines, "HermesExpectingHera01")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian03.RequiredFalseGodLoots
		, "HeraUpgrade")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian03.RequiredOneOfTraits
		, "ForceHeraBoonTrait")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian04.RequiredMinAnyTextLines
		.TextLines, "HermesExpectingHera01")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian04.RequiredFalseGodLoots
		, "HeraUpgrade")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian04.RequiredOneOfTraits
		, "ForceHeraBoonTrait")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian05.RequiredMinAnyTextLines
		.TextLines, "HermesExpectingHera01")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian05.RequiredFalseGodLoots
		, "HeraUpgrade")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian05.RequiredOneOfTraits
		, "ForceHeraBoonTrait")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian06.RequiredMinAnyTextLines
		.TextLines, "HermesExpectingHera01")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian06.RequiredFalseGodLoots
		, "HeraUpgrade")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian06.RequiredOneOfTraits
		, "ForceHeraBoonTrait")

		OlympusLootData.HeraUpgrade.SuperPriorityPickupTextLineSets.HermesExpectingHeraFail01 =
		{
			PlayOnce = true,
			PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
			MinRunsSinceSquelchedHermes = ConstantsData.SquelchedHermesRunCount,
			RequiredTextLines = { "HermesFirstPickUp" },
			RequiredFalseGodLoot = "HeraUpgrade",
			RequiredTrait = "ForceHeraBoonTrait",
			EndVoiceLines = GlobalVoiceLines.RushedHermesVoiceLines,
	
			{ Cue = "/VO/Hermes_0241",
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Hi, boss. Hera wanted to be here, but you know what they say: she had a fire to put out. Anyway, that blessing will still be warm!" },
		}
	OlympusLootData.HermesUpgrade.SuperPriorityPickupTextLineSets.HermesExpectingHera01 =
	{
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		MinRunsSinceSquelchedHermes = ConstantsData.SquelchedHermesRunCount,
		RequiredTextLines = { "HermesFirstPickUp", "HermesExpectingHeraFail01" },
		RequiredFalseGodLoot = "HeraUpgrade",
		RequiredTrait = "ForceHeraBoonTrait",
		EndVoiceLines = GlobalVoiceLines.RushedHermesVoiceLines,

		{ Cue = "/VO/Hermes_0241",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
			Text = "Hi, boss. Hera wanted to be here, but you know what they say: she had a fire to put out. Anyway, that blessing will still be warm!" },
	}

	-- Gift Section
	local OlympusGiftOrdering = ModUtil.Entangled.ModData(GiftOrdering)
	local OlympusGiftData = ModUtil.Entangled.ModData(GiftData)
	table.insert(OlympusGiftOrdering, 21, "ForceHeraBoonTrait")

	OlympusGiftData.HeraUpgrade =
	{
		InheritFrom = { "DefaultGiftData" },
		MaxedIcon = "Keepsake_Hera_Max",
		MaxedSticker = "Keepsake_HeraSticker_Max",
		MaxedRequirement = { RequiredTextLines = { "HeraGift07" }, },
		Value = 0,
		Maximum = 7,
		Locked = 7,
		[1] = { Gift = "ForceHeraBoonTrait" },
		[7] = { RequiredResource = "SuperGiftPoints" },
		UnlockGameStateRequirements = { RequiredTextLines = { "HeraBackstory04" } }
	}
	-- FUNCTIONS
	function HeraShout()	
		if CurrentRun.Hero.NextHeraGod == "Zeus" then
			ZeusShout()
		elseif CurrentRun.Hero.NextHeraGod == "Athena" then
			AthenaShout()			
		elseif CurrentRun.Hero.NextHeraGod == "Poseidon" then
			PoseidonShout()			
		elseif CurrentRun.Hero.NextHeraGod == "Artemis" then
			ArtemisShout()			
		elseif CurrentRun.Hero.NextHeraGod == "Aphrodite" then
			AphroditeShout()			
		elseif CurrentRun.Hero.NextHeraGod == "Ares" then
			AresShout()			
		elseif CurrentRun.Hero.NextHeraGod == "Dionysus" then
			DionysusShout()			
		elseif CurrentRun.Hero.NextHeraGod == "Demeter" then
			DemeterShout()
		else -- glitched
			--Nothing in case of other mods Gods	
		end
	end
	function HeraMaxShout()	
		if CurrentRun.Hero.NextHeraGod == "Zeus" then
			ZeusShout()
		elseif CurrentRun.Hero.NextHeraGod == "Athena" then
			AthenaShout()			
		elseif CurrentRun.Hero.NextHeraGod == "Poseidon" then
			PoseidonShout()			
		elseif CurrentRun.Hero.NextHeraGod == "Artemis" then
			ArtemisMaxShout()			
		elseif CurrentRun.Hero.NextHeraGod == "Aphrodite" then
			AphroditeMaxShout()			
		elseif CurrentRun.Hero.NextHeraGod == "Ares" then
			AresShout()			
		elseif CurrentRun.Hero.NextHeraGod == "Dionysus" then
			DionysusShout()			
		elseif CurrentRun.Hero.NextHeraGod == "Demeter" then
			DemeterMaxShout()
		else -- glitched
			--Nothing in case of other mods Gods
		end
	end
	function EndHera()	
		if CurrentRun.Hero.NextHeraGod == "Athena" then
			EndAthenaShout()
		elseif CurrentRun.Hero.NextHeraGod == "Poseidon" or CurrentRun.Hero.NextHeraGod == "Ares" then		
			EndSurge()
		elseif CurrentRun.Hero.NextHeraGod == "Demeter" then
			EndDemeter()
		end
		SetupHeraNextShout()
		BuildSuperMeter(CurrentRun, 25)
	end
	HeraExtra.NumberOfGods = 8
	HeraExtra.GodsList = {
		"Zeus",
		"Athena",
		"Poseidon",
		"Artemis",
		"Aphrodite",
		"Ares",
		"Dionysus",
		"Demeter",
	}
	function SetupHeraNextShout()
		local index = RandomNumber(HeraExtra.NumberOfGods)
		CurrentRun.Hero.NextHeraGod = HeraExtra.GodsList[index]
		ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Choose "..CurrentRun.Hero.NextHeraGod))		
	end
	ModUtil.Path.Wrap("ShowTraitUI",
		function(baseFunc)
			baseFunc()
			local wrathIcon = SpawnObstacle({ Name = "TraitTray_SlotIcon_Wrath", Group = "Combat_UI_Backing", OffsetX = TraitUI.IconStartX - CombatUI.FadeDistance.Trait, OffsetY = TraitUI.StartY + 490.5 })
			FadeObstacleIn({ Id = wrathIcon, Duration = CombatUI.FadeInDuration, Distance = CombatUI.FadeDistance.Trait, Direction = 0 })
			table.insert( ScreenAnchors.TraitPlaceholderIcons, wrathIcon )
		end
	)	
	-- Changes to Maps
	local OlympusRoomSetData = ModUtil.Entangled.ModData(RoomSetData)
	table.insert(OlympusRoomSetData.Tartarus.RoomOpening.ForcedRewards, {
		Name = "Boon",
		LootName = "HeraUpgrade",
		GameStateRequirements =
		{
			RequiredTextLines = { "ZeusFirstPickUp", "DionysusFirstPickUp" },
			RequiredOnlyNotPickedUp = "HeraUpgrade",
			RequiredOnlyNotPickedUpIgnoreName = "DemeterUpgrade",
		}
	})

	OverwriteTableKeys(RoomData, RoomSetData.Tartarus)

	-- For testing purposes
	ModUtil.Path.Wrap("BeginOpeningCodex",
		function(baseFunc)

			if (not CanOpenCodex()) and IsSuperValid() then
				BuildSuperMeter(CurrentRun, 50)
			end
			
			--CreateLoot({ Name = "HeraUpgrade", OffsetX = 100, SpawnPoint = CurrentRun.Hero.ObjectId })
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString.Deep(GiftOrdering))
			baseFunc()
		end
	)
	--[[ModUtil.Path.Wrap("ModUtil.Hades.Triggers.OnHit.Combat.1.Call", function( base, triggerArgs ) 
		ModUtil.Hades.PrintStackChunks(ModUtil.ToString(ModUtil.Hades.Triggers)) 
		return base( triggerArgs ) 
	end )]]

	--[[OnControlPressed{ "Codex",
		function( triggerArgs )
			local dropItemName = "RoomRewardEmptyHealthDrop"
			GiveRandomConsumables({
				Delay = 0.5,
				NotRequiredPickup = true,
				LootOptions =
				{
					{
						Name = dropItemName,
						Chance = 1,
					}
				}
			})
		end 
	}]] --

end
