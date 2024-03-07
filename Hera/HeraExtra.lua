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
	OlympusColor.HeraVoice = { 158,136,121,255 }
	OlympusColor.HeraDamageLight = { 158,136,121,255 }
	OlympusColor.HeraDamage = { 128,111,104,255  }
	OlympusColor.JealousyDamageStart = { 158,136,121,255 }
	OlympusColor.JealousyDamageEnd = { 128,111,104,255 }
	OlympusColor.EnvyDamageStart = {35,123,94,255 }
	OlympusColor.EnvyDamageEnd = { 34,110,86,255 }
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
				"HeraSecondaryTrait",
				"HeraRushTrait",
				"HeraRangedTrait",
				"HeraShoutTrait",
				"DiscountHeraTrait",
				"PrivilegeHeraTrait",
				"FamilyHeraTrait",
				"MoreRewardTrait",
				"PeriodicCurseTrait",
				"EnvyBurstTrait",
				"MoreCompanionTrait",
				"HealthAsObolTrait",
				"StatusOverTimeTrait",
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

			-- This is in your honor, Queen Hera.
			{ Cue = "/VO/ZagreusHome_3780" },
		},
	}
	local OlympusPresetEventArgs = ModUtil.Entangled.ModData(PresetEventArgs)
	OlympusPresetEventArgs.HeraSisyphusBenefitChoices =
	{
		{
			ChoiceText = "ChoiceText_Healing",
			{ PostLineFunctionName = "HeraSisyphusHealing", },
		},
		{
			ChoiceText = "ChoiceText_Darkness",
			{ PostLineFunctionName = "HeraSisyphusMetaPoints", },
		},
		{
			ChoiceText = "ChoiceText_Money",
			{ PostLineFunctionName = "HeraSisyphusMoney", },
		},
	}
	OlympusPresetEventArgs.HeraPatroclusBenefitChoices =
	{
		{
			RequiredActiveMetaUpgrade = "ExtraChanceMetaUpgrade",
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
		},
		{
			RequiredActiveMetaUpgrade = "ExtraChanceReplenishMetaUpgrade",
			ChoiceText = "ChoiceText_BuffExtraChanceReplenish",
			{
				PostLineThreadedFunctionName = "PatroclusBuff",
				PostLineFunctionArgs =
				{
					TraitName = "UpgradedTemporaryLastStandHealTrait",
				}
			},
		},
		{
			ChoiceText = "ChoiceText_BuffHealing",
			{ PostLineThreadedFunctionName = "PatroclusBuff", PostLineFunctionArgs = { TraitName = "TemporaryDoorHealTrait_Patroclus", } },
		},
		{
			ChoiceText = "ChoiceText_BuffWeapon",
			{ PostLineThreadedFunctionName = "PatroclusBuff", PostLineFunctionArgs = { TraitName = "TemporaryImprovedWeaponTrait_Patroclus", } },
		},
	}
	OlympusPresetEventArgs.HeraEurydiceBenefitChoices =
	{
		{
			ChoiceText = "ChoiceText_BuffSlottedBoonRarity",
			{ PostLineThreadedFunctionName = "EurydiceBuff", PostLineFunctionArgs = { BoonRarity = true } },
		},
		{
			ChoiceText = "ChoiceText_BuffMegaPom",
			{ PostLineThreadedFunctionName = "EurydiceBuff", PostLineFunctionArgs = { StackTraits = true } },
		},
		{
			ChoiceText = "ChoiceText_BuffFutureBoonRarity",
			{ PostLineThreadedFunctionName = "EurydiceBuff", PostLineFunctionArgs = { BuffFutureRarity = true } },
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
			PreAttackDuration = 0.0,
			PreFireAnimation = "DevotionPreAttackBase_Hera",
			PreFireDuration = 1.0,
			FireDuration = 0.0,
			PostAttackDuration = 0.0,
			PostAttackCooldownMin = 0.2,
			PostAttackCooldownMax = 0.4,
			CreateOwnTargetFromOriginalTarget = true,
			RandomTargetAngle = true,
			TargetOffsetDistanceMin = 350,
			TargetOffsetDistanceMax = 600,
			TeleportToTargetId = true,

			FireTicks = 1,
			FireCooldown = 0.0,
		},

		WeaponOptions =
		{
			"DevotionHera",
		},
	}
	OlympusEnemyData.HeraMine =
	{
		InheritFrom = { "BaseTrap" },
		--InheritFrom = { "IsNeutral", "BaseVulnerableEnemy" },
		IsBossDamage = true,
		MaxHealth = 1,
		SkipDamageText = true,
		HideHealthBar = true,
		HideLevelDisplay = true,
		RequiredKill = false,

		MoneyDropOnDeath =
		{
			Chance = 0.0,
		},
		OutgoingDamageModifiers =
		{
			{
				NonPlayerMultiplier = 1.0,
				PlayerMultiplier = 0.0
			},
		},		
	}
	--WeaponData
	local OlympusWeaponSets = ModUtil.Entangled.ModData(WeaponSets)
	local OlympusWeaponData = ModUtil.Entangled.ModData(WeaponData)
	local OlympusEffectData = ModUtil.Entangled.ModData(EffectData)

	table.insert(OlympusWeaponSets.ExpireProjectileExcludeProjectileNames, "HeraTrap")
	OlympusWeaponSets.AllJealousyWeapons = { "SwordWeapon",
		"SwordWeapon2", "SwordWeapon3", "SwordParry", "SwordWeaponDash", "SwordWeaponWave", "SpearWeapon", "SpearWeapon2", "SpearWeapon3",
		"SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3", "SpearWeaponThrow", "SpearThrowImmolation",
		"SpearWeaponDash", "SpearWeaponThrow", "SpearWeaponThrowReturn", "SpearWeaponThrowInvisibleReturn", "ShieldWeapon", "ShieldWeaponRush", "ShieldThrow",
		"ShieldWeaponDash", "ChaosShieldThrow", "ShieldThrow", "ShieldThrowDash", "BowWeapon", "BowSplitShot", "BowWeaponDash", "ChargeBowWeapon1",
		"MaxChargeBowWeapon", "BowWeapon2", "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5", "FistWeaponSpecial",
		"FistWeaponDash", "FistWeaponSpecialDash", "FistWeaponLandAreaAttack", "GunGrenadeToss", "GunBombWeapon", "GunWeapon",
		"GunWeaponDash", "SniperGunWeapon", "SniperGunWeaponDash"
	}
	OlympusWeaponSets.AssistWeapons = {
		"NPC_Thanatos_01_Assist",
		"NPC_FurySister_01_Assist",
		"NPC_Sisyphus_01_Assist",
		"NPC_Achilles_01_Assist",
		"NPC_Patroclus_01_Assist",
		"DusaFreezeShotSpray",
		"DusaFreezeShotSpread",
		"NPC_Goodboy_01_Assist",
	}	
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
					{ Cue = "/VO/Theseus_0604" },
					-- Queen Hera, pull him under.
					{ Cue = "/VO/Theseus_0605" },
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
			FireCooldown = 0.01,
			FireInterval = 0.01,

			AttackSlotInterval = 0.01,
			AttackSlotsPerTick = 6,
			AttackSlots =
			{
				-- WrathTargetSetA
				--{ UseMapObjectId = 525346 },
				{ UseMapObjectId = 525411 , PauseDuration = 0.35 },
				{ UseMapObjectId = 525406 , PauseDuration = 0.35 },
				{ UseMapObjectId = 543853 , PauseDuration = 0.35 },
				{ UseMapObjectId = 525410 , PauseDuration = 0.35 },
				{ UseMapObjectId = 525409 , PauseDuration = 0.35 },
				{ UseMapObjectId = 525408 , PauseDuration = 0.35 },
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

	OlympusEffectData.JealousyCurse =
	{
		Name = "JealousyCurse",
		DamageTextStartColor = Color.JealousyDamageStart,
		DamageTextColor = Color.JealousyDamageEnd,
		OnApplyFunctionName = "JealousyCurseApply",
		OnClearFunctionName = "JealousyCurseClear",		
	}
	OlympusEffectData.EnvyCurseAttack =
	{
		Name = "EnvyCurseAttack",
		DamageTextStartColor = Color.EnvyDamageStart,
		DamageTextColor = Color.EnvyDamageEnd,
		OnApplyFunctionName = "EnvyCurseAttackApply",
		OnClearFunctionName = "EnvyCurseAttackClear",
	}
	OlympusEffectData.EnvyCurseSecondary =
	{
		Name = "EnvyCurseSecondary",
		DamageTextStartColor = Color.EnvyDamageStart,
		DamageTextColor = Color.EnvyDamageEnd,
		OnApplyFunctionName = "EnvyCurseSecondaryApply",
		OnClearFunctionName = "EnvyCurseSecondaryClear",
	}
	OlympusEffectData.HeraDecay =
	{
		Name = "JealousyCurse",
		DamageTextStartColor = Color.EnvyDamageStart,
		DamageTextColor = Color.EnvyDamageEnd,	
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
		{ Cue = "/VO/Hera_0162" },
		-- You can do better.
		{ Cue = "/VO/Hera_0163" },
		-- Do it for your queen.
		{ Cue = "/VO/Hera_0164" },
		-- Lasted longer than I expected.
		{ Cue = "/VO/Hera_0165" },
		-- Barely made it, I assume.
		{ Cue = "/VO/Hera_0166" },
		-- With this, you'd better not lose.
		{ Cue = "/VO/Hera_0167" },
		-- There's nothing better than my blessings.
		{ Cue = "/VO/Hera_0168" },
		-- You never give up, do you?
		{ Cue = "/VO/Hera_0169" },
		-- That's right, bow to your queen.
		{ Cue = "/VO/Hera_0170" },
		-- Likely to fail, but I am still helping you.
		{ Cue = "/VO/Hera_0171" },
		-- I can be generous.
		{ Cue = "/VO/Hera_0172" },
		-- The best of all Olympus.
		{ Cue = "/VO/Hera_0173" },
	})
	table.insert(OlympusHeroVoiceLines.UpgradePickedVoiceLines, {
		RandomRemaining = true,
		BreakIfPlayed = true,
		SuccessiveChanceToPlay = 0.5,
		PreLineWait = 0.75,
		RequiredLastGodLoot = "HeraUpgrade",
		-- Glorious!
		{ Cue = "/VO/ZagreusField_4973" },
		-- From royalty.
		{ Cue = "/VO/ZagreusField_4974" },
		-- Bond to be good.
		{ Cue = "/VO/ZagreusField_4975" },
		-- Queen of Olympus.
		{ Cue = "/VO/ZagreusField_4976" },
		-- For your reign.
		{ Cue = "/VO/ZagreusField_4977" },
		-- I'll be loyal to you.
		{ Cue = "/VO/ZagreusField_4978" },
		-- I won't cheat.
		{ Cue = "/VO/ZagreusField_4979" },
		-- In all its glory.
		{ Cue = "/VO/ZagreusField_4980" },
		-- Justice!
		{ Cue = "/VO/ZagreusField_4981" },
		-- Fairest of them all.
		{ Cue = "/VO/ZagreusField_4982" },
	})
	table.insert(OlympusHeroVoiceLines.FullSuperActivatedVoiceLines, {
		-- Queen Hera!!
		Cue = "/VO/ZagreusField_4987", RequiredTrait = "HeraShoutTrait", RequiredFalseSpurnedGodName = "HeraUpgrade"
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
		{ Cue = "/VO/ZagreusField_4983" },
		-- Surely Hera won't mind.
		{ Cue = "/VO/ZagreusField_4984" },
		-- Queen Hera won't mind, will she?
		{ Cue = "/VO/ZagreusField_4985" },
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
	OlympusProjectileData.HeraProjectile =
	{
		InheritFrom = { "NoSlowFrameProjectile", "HeraColorProjectile" },
		StoreAmmoInLastHit = true,
	}
	OlympusProjectileData.HeraProjectileSmall =
	{
		InheritFrom = { "NoSlowFrameProjectile", "HeraColorProjectile" },
		NeverStore = true,
		MultipleProjectileMultiplier = 0.10,
	}
	OlympusWeaponData.DecayCurseApplicator = {
		InheritFrom = { "HeraColorProjectile" },
		PureDamage = true
	}
	OlympusWeaponData.LowBurstEnvyWeapon =
	{
		InheritFrom = { "HeraColorProjectile" },
	}
	OlympusWeaponData.HighBurstEnvyWeapon =
	{
		InheritFrom = { "HeraColorProjectile" },
	}
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
	OlympusGameData.RoyalPactNPCTextLines = {
		"HeraFirstNPC01",
		"HeraGenericNPC01",
		"HeraGenericNPC02",
		"HeraGenericNPC03",
		"HeraGenericNPC04",
		"HeraGenericNPC05",
		"HeraGenericNPC06",
		"HeraGenericNPC07",
		"HestiaGenericNPC01",
		"HestiaGenericNPC02",
		"HestiaGenericNPC03",
		"HestiaGenericNPC04",
		"HestiaGenericNPC05",
		"HestiaGenericNPC06",
		"HestiaGenericNPC07",
	}
	OlympusGameData.RoyalPactBossTextLines = {
		"HestiaFirstBoss01",
		"HeraGenericBoss01",
		"HeraGenericBoss02",
		"HeraGenericBoss03",
		"HeraGenericBoss04",
		"HeraGenericBoss05",
		"HeraGenericBoss06",
		"HeraGenericBoss07",
		"HestiaGenericBoss01",
		"HestiaGenericBoss02",
		"HestiaGenericBoss03",
		"HestiaGenericBoss04",
		"HestiaGenericBoss05",
		"HestiaGenericBoss06",
		"HestiaGenericBoss07",
	}
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
	GameData.RunClearMessageData.ClearRequiredTraitsHera =
	{
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements =
		{
			RequiredCountOfTraitsCount = 6,
			RequiredCountOfTraits =
			{
				"HeraWeaponTrait",
				"HeraSecondaryTrait",
				"HeraRushTrait",
				"HeraRangedTrait",
				"HeraShoutTrait",
				"DiscountHeraTrait",
				"PrivilegeHeraTrait",
				"FamilyHeraTrait",
				"MoreRewardTrait",
				"PeriodicCurseTrait",
				"EnvyBurstTrait",
				"MoreCompanionTrait",
				"HealthAsObolTrait",
				"StatusOverTimeTrait",
			},
			RequiredOneOfTraits = { "StatusOverTimeTrait" },
		},
	}
	table.insert(OlympusGameData.ConversationOrder, "HeraUpgrade")
	table.insert(OlympusGameData.RunClearMessageData.ClearWeaponsFiredWrath.GameStateRequirements.RequiredWeaponsFiredThisRun
		.Names, "HeraBeamWeapon")
	ModUtil.Table.Merge(OlympusGameData.GodAboutGodVoiceLines, {
		"HeraAboutZeus01",
		"HeraAboutZeus02",
		"HeraAboutPoseidon01"
	}
	)
	--Keywords
	local OlympusKeywordList = ModUtil.Entangled.ModData(KeywordList)
	ModUtil.Table.Merge(OlympusKeywordList, { "JealousyCurse", "EnvyCurse", "HeraTrap", "Aura", "SpecialDiscount" })
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
		Icon = "Keepsake_Skull",
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
		Name = "HeraWeaponTrait",
		InheritFrom = { "ShopTier1Trait" },
		God = "Hera",
		Slot = "Melee",
		Icon = "Boon_Hera_01",
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "EnvyCurseAttack",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "EnvyCurseAttack",
				EffectProperty = "Modifier",
				ChangeType = "Add",
				BaseMin = 10,
				BaseMax = 10,
				MinMultiplier = 0.335,
				AsInt = true,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
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
				ExtractAs = "TooltipEnvyDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "EnvyCurseAttack",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipEnvyPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "EnvyCurseAttack",
				BaseProperty = "Modifier",
				Format = "Percent"
			}
		}
	}
	OlympusTraitData.HeraSecondaryTrait =
	{
		Name = "HeraSecondaryTrait",
		InheritFrom = { "ShopTier1Trait" },
		God = "Hera",
		Slot = "Secondary",
		Icon = "Boon_Hera_02",
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "EnvyCurseSecondary",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "EnvyCurseSecondary",
				EffectProperty = "Modifier",
				ChangeType = "Add",
				BaseMin = 15,
				BaseMax = 15,
				MinMultiplier = 0.335,
				AsInt = true,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
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
			{
				ExtractAs = "TooltipEnvyDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "EnvyCurseSecondary",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipEnvyPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "EnvyCurseSecondary",
				BaseProperty = "Modifier",
				Format = "Percent"
			}
		}
	}
	OlympusTraitData.ShieldLoadAmmoTrait.AnimDefinitions.HeraWeaponTrait =
	{
		Unloaded =
		{
			Graphic = "ShieldRush3DBeowulf-Hera",
			DissipateGraphic = "ShieldRush3DBeowulf-Out-Hera",
			StartFx = "null",
			StartFx2 = "null",
			AttachedAnim = "null",
		},
		Loaded =
		{
			Graphic = "ShieldRush3DBeowulf-Hera",
			DissipateGraphic = "ShieldRush3DBeowulf-Out-Hera",
			StartFx = "null",
			StartFx2 = "null",
			AttachedAnim = "ShieldRush3DBeowulfMax-Hera",
		},
	}

	OlympusTraitData.HeraRushTrait =
	{
		Name = "HeraRushTrait",
		InheritFrom = { "ShopTier1Trait" },
		God = "Hera",
		Icon = "Boon_Hera_03",
		Slot = "Rush",
		--PreEquipWeapons = { "HeraMineWeapon" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.3,
			},
			Epic =
			{
				Multiplier = 1.6,
			},
			Heroic =
			{
				Multiplier = 1.8,
			}
		},
		SetupFunction =
		{
			Name = "SetupHeraDashTrap",
			RunOnce = true,
		},
		AddRush =
		{
			FunctionName = "HeraTrapDash",
			RunOnce = true,
			FunctionArgs =
			{
				Range = 700,
				Cooldown = 4,
				ExtractValues =
				{
					{
						Key = "Cooldown",
						ExtractAs = "TooltipCooldown",
					},
				}
			},
			
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
		},
		HeraMineBlast =		
		{
			BaseValue = 45,
			--SourceIsMultiplier = true,
			--DecimalPlaces = 2,
			MinMultiplier = 0.1,
			IdenticalMultiplier =
			{
				Value = -0.8,
			},
		},
		ExtractValues =
		{
			{
				Key = "HeraMineBlast",
				ExtractAs = "TooltipDamage",
				--Format = "PercentDelta",
				--DecimalPlaces = 1,
			},
			{
				ExtractAs = "TooltipJealousyDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "JealousyCurseApplicator",
				BaseName = "JealousyCurse",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipJealousyPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "JealousyCurseApplicator",
				BaseName = "JealousyCurse",
				BaseProperty = "Modifier",
				Format = "Percent"
			}
		}
	}
	OlympusTraitData.HeraRangedTrait =
	{
		Name = "HeraRangedTrait",
		InheritFrom = { "ShopTier1Trait" },
		God = "Hera",
		Slot = "Ranged",
		Icon = "Boon_Hera_04",
		CustomTrayText = "HeraRangedTrait_Tray",
        --RequiredFalseTrait = "ShieldLoadAmmoTrait",
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
				BaseMin = 65,
				BaseMax = 65,
				DepthMult = DepthDamageMultiplier,
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
				ProjectileName = "HeraProjectile",
				ProjectileProperty = "DamageHigh",
				BaseMin = 65,
				BaseMax = 65,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "HeraProjectileSmall",
				ProjectileProperty = "DamageLow",
				BaseMin = 15,
				BaseMax = 15,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateVeryStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamageSmall",
				}
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "HeraProjectileSmall",
				ProjectileProperty = "DamageHigh",
				BaseMin = 15,
				BaseMax = 15,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateVeryStrongMultiplier,
				},
			},
			--[[{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireOnRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
			},]]
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "HeraProjectile",
				ProjectileProperty = "Range",
				ChangeValue = 10,
				ChangeType = "Absolute",
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "HeraProjectile",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.1,
				ChangeType = "Absolute",
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "HeraProjectile",
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireOnRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				TraitName = "ShieldLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "HeraProjectile",
				ProjectileProperty = "Range",
				ChangeValue = 15,
				ChangeType = "Absolute",
			},
			{
				TraitName = "ShieldLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "HeraProjectile",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.4,
				ChangeType = "Absolute",
			},
			{
				TraitName = "ShieldLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "HeraProjectile",
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			--[[{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "CriticalHitChance",
				ChangeValue = 0.10,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipCritChance",
					Format = "Percent",
					SkipAutoExtract = true
				}
			},]]
			-- Beowulf
			--[[{
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
			{
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "Range",
                ChangeValue = "1"
            },]]
		},
		ExtractValues =
		{
			{
				ExtractAs = "BaseRangedDamage",
				External = true,
				BaseType = "Projectile",
				BaseName = "RangedWeapon",
				BaseProperty = "DamageLow",
			},
			{
				ExtractAs = "TooltipJealousyDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "JealousyCurseApplicator",
				BaseName = "JealousyCurse",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipJealousyPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "JealousyCurseApplicator",
				BaseName = "JealousyCurse",
				BaseProperty = "Modifier",
				Format = "Percent"
			}
		}
	}

	--[[OlympusTraitData.ShieldLoadAmmo_HeraRangedTrait =
{
	InheritFrom = { "ShopTier1Trait" },
	God = "Hera",
	Slot = "Ranged",
	Icon = "Boon_Hera_03",
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
		Name = "HeraShoutTrait",
		InheritFrom = { "ShopTier1Trait" },
		RequiredTextLines = { "PoseidonWrathIntro01" },
		CustomTrayText = "HeraShoutTrait_Tray",
		God = "Hera",
		Slot = "Shout",
		Icon = "Boon_Hera_05",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.1,
			},
			Rare =
			{
				Multiplier = 1.3,
			},
			Epic =
			{
				Multiplier = 1.5,
			},
			Heroic =
			{
				Multiplier = 1.7,
			}
		},
		AddShout ={
			FunctionName = "",
			Cost = 25,
			SuperDuration = 0.8,
		},
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
					Value = DuplicateStrongMultiplier,
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
					Value = DuplicateStrongMultiplier,
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
				WeaponNames = { "ArtemisMaxShoutWeapon", "ArtemisShoutWeapon", },
				ProjectileProperty = "DamageLow",
				BaseMin = 100,
				BaseMax = 100,
				DepthMult = DepthDamageMultiplier,
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
				WeaponNames = { "ArtemisMaxShoutWeapon", "ArtemisShoutWeapon", },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},

			{
				WeaponNames = { "ArtemisMaxShoutWeapon", },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 10,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "ArtemisMaxShoutWeapon", "ArtemisShoutWeapon", },
				ProjectileProperty = "CriticalHitChance",
				ChangeValue = 0.35,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "AphroditeSuperCharm", "AphroditeMaxSuperCharm", },
				EffectName = "Charm",
				EffectProperty = "Duration",
				BaseValue = 5,
				ChangeType = "Add",
				MinMultiplier = 0.2,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
			},

			{
				WeaponNames = { "AphroditeMaxSuperCharm", },
				ProjectileProperty = "DamageLow",
				ChangeValue = 2500,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				}
			},
			{
				WeaponNames = { "AphroditeMaxSuperCharm", },
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
					Value = DuplicateStrongMultiplier,
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
					Value = DuplicateStrongMultiplier,
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
					Value = DuplicateStrongMultiplier,
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
		FakeCost = 25,
		ExtractValues =
		{
			--[[{
				Key = "SuperDuration",
				ExtractAs = "TooltipDuration",
				DecimalPlaces = 2,
			},]]
			{
				Key = "FakeCost",
				ExtractAs = "TooltipWrathStocks",
				Format = "WrathStocks",
				SkipAutoExtract = true
			}
			--[[{
				Key = "MaxDurationMultiplier",
				ExtractAs = "TooltipMaxDurationMultiplier",
				DecimalPlaces = 2,
				SkipAutoExtract = true
			}]]
		}
	}

	OlympusTraitData.DiscountHeraTrait =
	{
		Name = "DiscountHeraTrait",
		Icon = "Boon_Hera_06",
		InheritFrom = { "ShopTier2Trait" },
		RequiredFalseTrait = "DiscountHeraTrait",
		God = "Hera",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 0.941,
			},
			Epic =
			{
				Multiplier = 0.882,
			},
			Heroic =
			{
				Multiplier = 0.823,
			}
		},
		RefreshShop =
		{
			OnAdd = true,
			OnRemove = true,
		},
		StoreCostMultiplier = {
			BaseValue = 0.85
		},
		ExtractValues =
		{
			{
				Key = "StoreCostMultiplier",
				ExtractAs = "TooltipDiscount",
				Format = "NegativePercentDelta",
			}
		}
	}
	OlympusTraitData.PrivilegeHeraTrait =
	{
		Name = "PrivilegeHeraTrait",
		Icon = "Boon_Hera_07",
		InheritFrom = { "ShopTier2Trait" },
		God = "Hera",
		RequiredMetaUpgradeSelected = "GodEnhancementMetaUpgrade",
		RequiredMetaUpgradeStageUnlocked = 3,
		CustomTrayText = "PrivilegeHeraTrait_Tray",
		RequiredFalseTraits = {"FamilyHeraTrait", "PrivilegeHeraTrait"},
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.33,
			},
			Epic =
			{
				Multiplier = 1.66,
			},
			Heroic =
			{
				Multiplier = 2.0,
			}
		},
		AddOutgoingDamageModifiers =
		{
		  UseTraitValue = "AccumulatedGodDamageBonus",
		  IsMultiplier = true,
		  Unique = true,
		},
		GodDamageBonus =
		{
			BaseValue = 1.03,
			SourceIsMultiplier = true,
			DecimalPlaces = 2,
			MinMultiplier = 0.1,
		},
		AccumulatedGodDamageBonus = 1,
		FromGodIndex = 0,
		ExtractValues =
		{
			{
				Key = "GodDamageBonus",
				ExtractAs = "TooltipGodBonus",
				Format = "PercentDelta",
				DecimalPlaces = 1,
			},
			{
				Key = "AccumulatedGodDamageBonus",
				ExtractAs = "TooltipAccumulatedBonus",
				Format = "PercentDelta",
				DecimalPlaces = 1,
			},
			{
				Key = "FromGodIndex",
				ExtractAs = "TooltipGodName",
			}
		}
	}
	OlympusTraitData.FamilyHeraTrait =
	{
		Name = "FamilyHeraTrait",
		Icon = "Boon_Hera_08",
		InheritFrom = { "ShopTier2Trait" },
		God = "Hera",
		RequiredMetaUpgradeSelected = "VulnerabilityEffectBonusMetaUpgrade",
		RequiredMetaUpgradeStageUnlocked = 3,
		RequiredFalseTrait = "PrivilegeHeraTrait",
		PreEquipWeapons = { "HeraCurseCountWeapon" },
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
		SetupFunction =
		{
			Name = "TrackHeraCurseCount",
			RunOnce = true,
		},
		AddOutgoingDamageModifiers =
		{
			RequiredEffects = { "HeraCurseCount" },
			RequiredSelfEffectsMultiplier =
			{
				BaseValue = 1.2,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					  Value = -0.7,
				},
			},
			ExtractValues =
			{
				{
					Key = "RequiredSelfEffectsMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
	}
	OlympusTraitData.MoreRewardTrait =
	{
		Name = "MoreRewardTrait",
		InheritFrom = { "ShopTier1Trait" },
		God = "Hera",
		Icon = "Boon_Hera_09",
		RequiredFalseTrait = "MoreRewardTrait",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.06,
			},
			Epic =
			{
				Multiplier = 1.12,
			},
			Heroic =
			{
				Multiplier = 1.18,
			}
		},
		SellTraitCostMultiplier = {
			BaseValue = 1.5
		},
		ChallengeRewardIncrease =
		{
			BaseValue = 1.5,
			SourceIsMultiplier = true,
		},
		UrnsRewardMultiplier = {
			BaseValue = 1.5
		},
		ExtractValues =
		{
			{
				Key = "SellTraitCostMultiplier",
				ExtractAs = "TooltipBonus",
				Format = "PercentDelta",
			}
		}
	}
	OlympusTraitData.PeriodicCurseTrait =
	{
		Name = "PeriodicCurseTrait",
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Hera_10",
		RequiredFalseTrait = "PeriodicCurseTrait",
		PreEquipWeapons = {"JealousyCurseApplicator"},
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 0.86,
			},
			Epic =
			{
				Multiplier = 0.71,
			},
			Heroic =
			{
				Multiplier = 0.57,
			}
		},
		SetupFunction =
		{
			Name = "AddJealousyOnRandomFoe",
			RunOnce = true,
		},
		JealousyIntervalApply = {
			BaseValue = 7.0
		},
		PropertyChanges =
		{

		},
		ExtractValues =
		{
			{
				Key = "JealousyIntervalApply",
				ExtractAs = "TooltipTimeInterval",
				--Format = "Percent",
			},
			{
				ExtractAs = "TooltipJealousyDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "JealousyCurseApplicator",
				BaseName = "JealousyCurse",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipJealousyPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "JealousyCurseApplicator",
				BaseName = "JealousyCurse",
				BaseProperty = "Modifier",
				Format = "Percent"
			}
		}
	}
	
	OlympusTraitData.EnvyBurstTrait =
	{
		Name = "EnvyBurstTrait",
		InheritFrom = { "ShopTier2Trait" },
		God = "Hera",
		Icon = "Boon_Hera_11",
		PreEquipWeapons = {"BurstEnvyApplicator", "LowBurstEnvyWeapon", "HighBurstEnvyWeapon"},
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
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
				Multiplier = 1.75
			}
		},
		PropertyChanges = {
			{
				WeaponName = "LowBurstEnvyWeapon",
				ProjectileProperty = "DamageLow",
				BaseMin = 35,
				BaseMax = 35,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "LowBurstEnvyWeapon",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			{
				WeaponName = "HighBurstEnvyWeapon",
				ProjectileProperty = "DamageLow",
				BaseMin = 70,
				BaseMax = 70,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				}
			},
			{
				WeaponName = "HighBurstEnvyWeapon",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
		EnvyBurstChance = {
			BaseValue = 0.08,
		},
		ExtractValues =
		{
			{
				Key = "EnvyBurstChance",
				ExtractAs = "TooltipChance",
				Format = "Percent",
			},
			{
				ExtractAs = "TooltipEnvyDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "EnvyCurseAttack",
				BaseProperty = "Duration",
			}
		}
	}	
	OlympusTraitData.MoreCompanionTrait =
	{
		Name = "MoreCompanionTrait",
		InheritFrom = { "ShopTier1Trait" },
		RequiredFalseTrait = "MoreCompanionTrait",
		RequiredFalseBiome = "Styx",
		RequiredSlottedTrait = "Assist",
		God = "Hera",
		Icon = "Boon_Hera_14",
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
		AddOutgoingDamageModifiers =
		{
			BypassIgnore = true,
			ValidWeaponMultiplier =
			{
				BaseValue = 1.30,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = OlympusWeaponSets.AssistWeapons,
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

		},
	}
	OlympusTraitData.HealthAsObolTrait =
	{
		Name = "HealthAsObolTrait",
		InheritFrom = { "ShopTier2Trait" },
		RequiredFalseTrait = "HealthAsObolTrait",
		RequiredFalseBiome = "Styx",
		God = "Hera",
		Icon = "Boon_Hera_16",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.4,
			},
			Epic =
			{
				Multiplier = 1.8,
			},
			Heroic =
			{
				Multiplier = 2.2,
			}
		},		
		RefreshShop =
		{
			OnAdd = true,
			OnRemove = true,
		},
		CharonHealMultiplier = {
			BaseValue = 25,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		ExtractValues =
		{
			{
				Key = "CharonHealMultiplier",
				ExtractAs = "TooltipMultiplier",
			}
		}
	}
	OlympusTraitData.StatusOverTimeTrait =
	{
		Name = "StatusOverTimeTrait",
		InheritFrom = { "ShopTier3Trait" },
		RequiredFalseTrait = "StatusOverTimeTrait",
		God = "Hera",
		Icon = "Boon_Hera_15",
		SetupFunction =
		{
			Name = "SetupAura",
			RunOnce = true,
		},
		PreEquipWeapons = { "DecayCurseApplicator" },
		PropertyChanges =
		{

			{
				WeaponName = "DecayCurseApplicator",
				EffectName = "HeraDecay",
				EffectProperty = "ElapsedTimeMultiplier",
				BaseValue = 0.9,
				SourceIsMultiplier = true,
				ExtractValue =
				{
					ExtractAs = "TooltipSlow",
					Format = "NegativePercentDelta",
				},
				ChangeType = "Multiply",
			},

			{
				WeaponName = "DecayCurseApplicator",
				EffectName = "HeraDecay",
				EffectProperty = "Amount",
				ChangeValue = 15,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponName = "DecayCurseApplicator",
				EffectName = "HeraDecay",
				EffectProperty = "Cooldown",
				ChangeValue = 0.5,
				ExtractValue =
				{
					ExtractAs = "TooltipTickRate",
					DecimalPlaces = 1,
				},
				ChangeType = "Absolute",
			},
		},
		ExtractValues = {
			{
				ExtractAs = "TooltipEnvyDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "EnvyCurseAttack",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipJealousyDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "JealousyCurseApplicator",
				BaseName = "JealousyCurse",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipJealousyPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "JealousyCurseApplicator",
				BaseName = "JealousyCurse",
				BaseProperty = "Modifier",
				Format = "Percent"
			}
		},
	}
	-- Duo Traits
	OlympusTraitData.AuraExposedTrait =
	{
		Name = "AuraExposedTrait",
		InheritFrom = { "SynergyTrait" },
		Icon = "Hera_Athena_01",
		RequiredFalseTrait = "AuraExposedTrait",		
		PreEquipWeapons = {"ExposedCurseApplicator"},
		PropertyChanges =
		{

		},		
		SetupFunction =
		{
			Name = "SetupAura",
			RunOnce = true,
		},
		ExtractValues =
		{

			{
				ExtractAs = "TooltipStaggerDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "ExposedCurseApplicator",
				BaseName = "AthenaBackstabVulnerability",
				BaseProperty = "Duration",
			}
		}
	}
	
	table.insert(OlympusTraitData.AthenaBackstabDebuffTrait.PropertyChanges,
	{
		TraitName = "AuraExposedTrait",
		WeaponName = "ExposedCurseApplicator",
		EffectName = "AthenaBackstabVulnerability",
		EffectProperty = "Modifier",
		DeriveValueFrom = "DeriveSource",
	})
	OlympusTraitData.CurseLongerTrait =
	{
		Name = "CurseLongerTrait",
		InheritFrom = { "SynergyTrait" },
		Icon = "Hera_Aphrodite_01",
		RequiredFalseTrait = "CurseLongerTrait",
		PropertyChanges =
		{
			-- Weak
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Duration",
				BaseValue = 2,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
					DecimalPlaces = 1,
				},
				DeriveSource = "DeriveSource",
			},
			{
				TraitName = "AphroditeRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "ShieldLoadAmmo_AphroditeRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
			{
				WeaponNames = { "AphroditeShoutWeapon", "AreaWeakenAphrodite", "PoseidonAphroditeTouchWeapon" },
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AphroditeRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AphroditeSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},{
				TraitName = "AphroditeDeathTrait",
				WeaponNames = {"DeathAreaWeakenAphrodite"},
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
			-- Hangover
		{
			TraitName = "DionysusRushTrait",
			WeaponNames = WeaponSets.HeroRushWeapons,
			EffectName= "DamageOverTime",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		  },
		  {
			TraitName = "DionysusWeaponTrait",
			WeaponNames = WeaponSets.HeroPhysicalWeapons,
			EffectName= "DamageOverTime",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		  },
		  {
			TraitName = "DionysusSecondaryTrait",
			WeaponNames = WeaponSets.HeroSecondaryWeapons,
			EffectName= "DamageOverTime",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		  },
		  {
			TraitName = "DionysusShoutTrait",
			WeaponName = "DionysusShoutWeapon",
			EffectName= "DamageOverTime",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		  },
		  {
			TraitName = "AmmoFieldTrait",
			WeaponName = "DionysusAmmoWeapon",
			EffectName= "DamageOverTime",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		  },
		  -- Jolted
		  {
			TraitName = "ZeusWeaponTrait",
			WeaponName = "ChainLightning",
			EffectName = "ZeusAttackPenalty",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "ZeusRangedTrait",
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			EffectName = "ZeusAttackPenalty",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "ShieldLoadAmmo_ZeusRangedTrait",
			WeaponNames = {"ZeusShieldLoadAmmoStrike"},
			EffectName = "ZeusAttackPenalty",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "ZeusSecondaryTrait",
			WeaponName = "LightningStrikeSecondary",
			EffectName = "ZeusAttackPenalty",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "ZeusRushTrait",
			WeaponName = "LightningDash",
			EffectName = "ZeusAttackPenalty",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "PerfectDashBoltTrait",
			WeaponName = "LightningPerfectDash",
			EffectName = "ZeusAttackPenalty",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "ZeusShoutTrait",
			WeaponName = "LightningStrikeX",
			EffectName = "ZeusAttackPenalty",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "CriticalBoltTrait",
			WeaponName = "LightningStrikeCrit",
			EffectName = "ZeusAttackPenalty",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "ImpactBoltTrait",
			WeaponName = "LightningStrikeImpact",
			EffectName = "ZeusAttackPenalty",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "RetaliateWeaponTrait",
			WeaponName = "LightningStrikeRetaliate",
			EffectName = "ZeusAttackPenalty",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "AmmoBoltTrait",
			WeaponName = "ZeusAmmoWeapon",
			EffectName = "ZeusAttackPenalty",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "LightningCloudTrait",
			WeaponName = "ZeusDionysusCloudStrike",
			EffectName = "ZeusAttackPenalty",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "PerfectDashBoltTrait",
			WeaponName = "LightningPerfectDash",
			EffectName = "ZeusAttackPenalty",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		-- Rupture
		{
			TraitName = "PoseidonRushTrait",
			WeaponNames = WeaponSets.HeroRushWeapons,
			EffectName = "DamageOverDistance",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "PoseidonRangedTrait",
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			EffectName = "DamageOverDistance",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "BlizzardOrbTrait",
			ProjectileName = "IceSpark",
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			EffectName = "DamageOverDistance",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "PoseidonWeaponTrait",
			WeaponNames = WeaponSets.HeroPhysicalWeapons,
			EffectName = "DamageOverDistance",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "PoseidonSecondaryTrait",
			WeaponNames = WeaponSets.HeroSecondaryWeapons,
			EffectName = "DamageOverDistance",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "PoseidonShoutTrait",
			WeaponName = "PoseidonSurfWeapon",
			EffectName = "DamageOverDistance",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "PoseidonAphroditeTouchTrait",
			WeaponName = "PoseidonAphroditeTouchWeapon",
			EffectName = "DamageOverDistance",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		-- Exposed
		{
			TraitName = "AthenaRushTrait",
			WeaponNames = WeaponSets.HeroRushWeapons,
			EffectName = "AthenaBackstabVulnerability",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "AthenaRangedTrait",
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			EffectName = "AthenaBackstabVulnerability",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "ShieldLoadAmmo_AthenaRangedTrait",
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			EffectName = "AthenaBackstabVulnerability",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "AthenaWeaponTrait",
			WeaponNames = WeaponSets.HeroPhysicalWeapons,
			EffectName = "AthenaBackstabVulnerability",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			WeaponName = "MagicShieldRetaliate",
			EffectName = "AthenaBackstabVulnerability",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "AthenaSecondaryTrait",
			WeaponNames = WeaponSets.HeroSecondaryWeapons,
			EffectName = "AthenaBackstabVulnerability",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		--Marked
		{
			WeaponName = "CritVulnerabilityWeapon",
			EffectName = "CritVulnerability",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		--Chill
		{
			TraitName = "DemeterWeaponTrait",
			WeaponNames = WeaponSets.HeroPhysicalWeapons,
			EffectName = "DemeterSlow",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "DemeterRushTrait",
			WeaponNames = WeaponSets.HeroRushWeapons,
			EffectName = "DemeterSlow",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "DemeterRangedTrait",
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			EffectName = "DemeterSlow",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "ShieldLoadAmmo_DemeterRangedTrait",
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			EffectName = "DemeterSlow",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "DemeterRushTrait",
			WeaponName = "DemeterIce",
			EffectName = "DemeterSlow",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "DemeterSecondaryTrait",
			WeaponNames = WeaponSets.HeroSecondaryWeapons,
			EffectName = "DemeterSlow",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "DemeterShoutTrait",
			WeaponNames = { "DemeterSuper", "DemeterMaxSuper", },
			EffectName = "DemeterSlow",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "CastNovaTrait",
			WeaponNames = { "DemeterAmmoWind", },
			EffectName = "DemeterSlow",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "InstantChillKill",
			WeaponNames = { "DemeterChillKill", },
			EffectName = "DemeterSlow",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		{
			TraitName = "DemeterRetaliateTrait",
			WeaponNames = { "ChillRetaliate", },
			EffectName = "DemeterSlow",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		},
		},
		EnemyPropertyChanges =
		{
		  {
			TraitName = "DionysusSpreadTrait",
			WeaponName = "DionysusPlagueWeapon",
			EffectName = "DamageOverTime",
			EffectProperty = "Duration",
			DeriveValueFrom = "DeriveSource",
		  },
		},
	}
	OlympusTraitData.BetterTrapsTrait =
	{
		Name = "BetterTrapsTrait",
		InheritFrom = { "SynergyTrait" },
		Icon = "Hera_Artemis_01",
		RequiredFalseTrait = "BetterTrapsTrait",
		PropertyChanges =
		{

		},
	}
	OlympusTraitData.HeroicBoonsTrait =
	{
		Name = "HeroicBoonsTrait",
		InheritFrom = { "SynergyTrait" },
		Icon = "Hera_Demeter_01",		
		RequiredUpgradeableGodTraits = 3,
		RequiredFalseTrait = "HeroicBoonsTrait",
		CustomTrayText = "HeroicBoonsTrait_Tray",
		SetupFunction =
		{
			Name = "SetupHeroicBoonsTrait",
			Args =
			{
				RandomBoons = 3,
				ExtractValues =
				{
					{
						Key = "RandomBoons",
						ExtractAs = "TooltipCount",
					},
				}
			},
			RunOnce = true,
		},
	}
	-- Overwrite this one since It needs to be multiply instead of Absolute
	OlympusTraitData.PoisonTickRateTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Dionysus_Ares_01",
		RequiredFalseTraits = {"SlowerHangoverTrait", "PoisonTickRateTrait"},
		PropertyChanges =
		{
		  {
			TraitName = "DionysusRushTrait",
			WeaponNames = WeaponSets.HeroRushWeapons,
			EffectName= "DamageOverTime",
			EffectProperty = "Cooldown",
			ChangeValue = 0.70,
			ChangeType = "Multiply",
			DeriveSource = "DeriveSource",
			
		  },
		  {
			TraitName = "DionysusWeaponTrait",
			WeaponNames = WeaponSets.HeroPhysicalWeapons,
			EffectName= "DamageOverTime",
			EffectProperty = "Cooldown",
			DeriveValueFrom = "DeriveSource",
		  },
		  {
			TraitName = "DionysusSecondaryTrait",
			WeaponNames = WeaponSets.HeroSecondaryWeapons,
			EffectName= "DamageOverTime",
			EffectProperty = "Cooldown",
			DeriveValueFrom = "DeriveSource",
		  },
		  {
			TraitName = "DionysusShoutTrait",
			WeaponName = "DionysusShoutWeapon",
			EffectName= "DamageOverTime",
			EffectProperty = "Cooldown",
			DeriveValueFrom = "DeriveSource",
		  },
		  {
			TraitName = "AmmoFieldTrait",
			WeaponName = "DionysusAmmoWeapon",
			EffectName= "DamageOverTime",
			EffectProperty = "Cooldown",
			DeriveValueFrom = "DeriveSource",
		  },
		},
		EnemyPropertyChanges =
		{
		  {
			TraitName = "DionysusSpreadTrait",
			WeaponName = "DionysusPlagueWeapon",
			EffectName = "DamageOverTime",
			EffectProperty = "Cooldown",
			DeriveValueFrom = "DeriveSource",
		  },
		},
		FakeTickRate = 0.35,
		ExtractValues =
		{
			{
				ExtractAs = "TooltipPoisonDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipPoisonStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "MaxStacks",
			},
			{
				ExtractAs = "TooltipBaseTickRate",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "Cooldown",
				DecimalPlaces = 1,
			},
			{
				Key = "FakeTickRate",
				ExtractAs = "TooltipTickRate",
				DecimalPlaces = 2,
			},
		}
	}
	OlympusTraitData.SlowerHangoverTrait =
	{
		Name = "SlowerHangoverTrait",
		InheritFrom = { "SynergyTrait" },
		Icon = "Hera_Dionysus_01",
		RequiredFalseTraits = {"SlowerHangoverTrait", "PoisonTickRateTrait"},
		PropertyChanges =
		{
		  {
			TraitName = "DionysusRushTrait",
			WeaponNames = WeaponSets.HeroRushWeapons,
			EffectName= "DamageOverTime",
			EffectProperty = "Cooldown",
			ChangeValue = 2.0,
			ChangeType = "Multiply",
			DeriveSource = "DeriveSource",
			ExtractValue =
			{
				ExtractAs = "TooltipTickRate",
				DecimalPlaces = 2,
			}
		  },
		  {
			TraitName = "DionysusWeaponTrait",
			WeaponNames = WeaponSets.HeroPhysicalWeapons,
			EffectName= "DamageOverTime",
			EffectProperty = "Cooldown",
			DeriveValueFrom = "DeriveSource",
		  },
		  {
			TraitName = "DionysusSecondaryTrait",
			WeaponNames = WeaponSets.HeroSecondaryWeapons,
			EffectName= "DamageOverTime",
			EffectProperty = "Cooldown",
			DeriveValueFrom = "DeriveSource",
		  },
		  {
			TraitName = "DionysusShoutTrait",
			WeaponName = "DionysusShoutWeapon",
			EffectName= "DamageOverTime",
			EffectProperty = "Cooldown",
			DeriveValueFrom = "DeriveSource",
		  },
		  {
			TraitName = "AmmoFieldTrait",
			WeaponName = "DionysusAmmoWeapon",
			EffectName= "DamageOverTime",
			EffectProperty = "Cooldown",
			DeriveValueFrom = "DeriveSource",
		  },
		  {
			TraitName = "DionysusRushTrait",
			WeaponNames = WeaponSets.HeroRushWeapons,
			EffectName = "DamageOverTime",
			EffectProperty = "Amount",
			BaseValue = 2.5,
			ChangeType = "Multiply",
			AsInt = true,
			--DeriveSource = "DeriveMultiplier",
			ExtractValue =
			{
				ExtractAs = "TooltipDamage",
			}
		  },
		  {
			TraitName = "DionysusWeaponTrait",
			WeaponNames = WeaponSets.HeroPhysicalWeapons,
			EffectName = "DamageOverTime",
			EffectProperty = "Amount",
			BaseValue = 2.5,
			ChangeType = "Multiply",
			AsInt = true,
		  },
		  {
			TraitName = "DionysusSecondaryTrait",
			WeaponNames = WeaponSets.HeroSecondaryWeapons,
			EffectName = "DamageOverTime",
			EffectProperty = "Amount",
			BaseValue = 2.5,
			ChangeType = "Multiply",
			AsInt = true,
		  },
		  {
			TraitName = "DionysusShoutTrait",
			WeaponName = "DionysusShoutWeapon",
			EffectName = "DamageOverTime",
			EffectProperty = "Amount",
			BaseValue = 2.5,
			ChangeType = "Multiply",
			AsInt = true,
		  },
		  {
			TraitName = "AmmoFieldTrait",
			WeaponName = "DionysusAmmoWeapon",
			EffectName = "DamageOverTime",
			EffectProperty = "Amount",
			BaseValue = 2.5,
			ChangeType = "Multiply",
			AsInt = true,
		  },
		},
		EnemyPropertyChanges =
		{
		  {
			TraitName = "DionysusSpreadTrait",
			WeaponName = "DionysusPlagueWeapon",
			EffectName = "DamageOverTime",
			EffectProperty = "Amount",
			BaseValue = 2.5,
			ChangeType = "Multiply",
			AsInt = true,
		  },
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipPoisonDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipPoisonStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "MaxStacks",
			},
			{
				ExtractAs = "TooltipBaseTickRate",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "Cooldown",
				DecimalPlaces = 1,
			}
		}
	}
	OlympusTraitData.KillMarkedTrait =
	{
		Name = "KillMarkedTrait",
		InheritFrom = { "SynergyTrait" },
		Icon = "Hera_Ares_01",
		RequiredFalseTrait = "KillMarkedTrait",
		PreEquipWeapons = {"DeathMarkedApplicator"},
		PropertyChanges =
		{
			{
				WeaponName = "DeathMarkedApplicator",
				EffectName= "DeathMarkedCurse",
				EffectProperty = "Modifier",
				ChangeValue = 2.0,
				ChangeType = "Absolute",
			  },
		},
		SetupFunction =
		{
			Name = "SetupDeathMarked",
			RunOnce = true,
		},
	}
	OlympusTraitData.GaugeLightningTrait =
	{
		Name = "GaugeLightningTrait",
		InheritFrom = { "SynergyTrait" },
		Icon = "Hera_Zeus_01",
		RequiredFalseTraits = {"GaugeLightningTrait", "RegeneratingCappedSuperTrait"},
		RequiredSlottedTrait = "Shout",
		PreEquipWeapons = { "ZeusAmmoWeapon" },
		SetupFunction =
		{
			Name = "TrackHeraFullSuperMeter",
			Args = {
				WeaponName = "ZeusAmmoWeapon",
				Interval = { Min = 1.0, Max = 1.0 },
				Range = 500,
			},
			RunOnce = true,
		},
		
		PropertyChanges =
		{
			{
				WeaponName = "ZeusAmmoWeapon",
				ProjectileProperty = "DamageLow",
				BaseMin = 70,
				BaseMax = 70,
				DepthMult = DepthDamageMultiplier,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "ZeusAmmoWeapon",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		},
	}
	OlympusTraitData.AuraRuptureTrait =
	{
		Name = "AuraRuptureTrait",
		InheritFrom = { "SynergyTrait" },
		Icon = "Hera_Poseidon_01",
		RequiredFalseTrait = "AuraRuptureTrait",		
		PreEquipWeapons = {"RuptureCurseApplicator"},
		PropertyChanges =
		{

		},	
		SetupFunction =
		{
			Name = "SetupAura",
			RunOnce = true,
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipRuptureDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "RuptureCurseApplicator",
				BaseName = "DamageOverDistance",
				BaseProperty = "Duration",
			},
		}
	}
	table.insert(OlympusTraitData.SlipperyTrait.PropertyChanges,
	{
		TraitName = "AuraRuptureTrait",
		WeaponName = "RuptureCurseApplicator",
		EffectName = "DamageOverDistance",
		EffectProperty = "MaxTriggerDamage",
		DeriveValueFrom = "DeriveSource",
	})
	table.insert(OlympusTraitData.SlipperyTrait.PropertyChanges,
	{
		TraitName = "AuraRuptureTrait",
		WeaponName = "RuptureCurseApplicator",
		EffectName = "DamageOverDistance",
		EffectProperty = "MinTriggerDamage",
		DeriveValueFrom = "DeriveSource",
	})
	OlympusTraitData.AuraBlindTrait =
	{
		Name = "AuraBlindTrait",
		InheritFrom = { "SynergyTrait" },
		Icon = "Hera_Apollo_01",
		RequiredFalseTrait = "AuraBlindTrait",		
		PreEquipWeapons = {"BlindCurseApplicator"},
		PropertyChanges =
		{

		},	
		SetupFunction =
		{
			Name = "SetupAura",
			RunOnce = true,
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipBlindDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "BlindCurseApplicator",
				BaseName = "ApolloBlind",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipBlindPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "BlindCurseApplicator",
				BaseName = "ApolloBlind",
				BaseProperty = "Amount",
				Format = "Percent"
			}
		}
	}
	OlympusTraitData.EnhancedNPCTrait =
	{
		Name = "EnhancedNPCTrait",
		InheritFrom = { "SynergyTrait" },
		Icon = "Hera_Hestia_01",
		RequiredFalseTrait = "EnhancedNPCTrait",
		RequiredFalseSeenRoomsThisRun = {"C_Boss01"},
		PropertyChanges = {},
	}


	-- LootData
	local OlympusLootData = ModUtil.Entangled.ModData(LootData)
	table.insert(OlympusLootData.ArtemisUpgrade.LinkedUpgrades.ArtemisAmmoExitTrait.OneOf, "HeraRangedTrait")
	OlympusLootData.HeraUpgrade = {
		Name = "HeraUpgrade",
		InheritFrom = { "BaseLoot", "BaseSoundPackage" },
		CanReceiveGift = true,
		AlwaysShowDefaultUseText = true,
		Weight = 10,
		Icon = "BoonSymbolHera",
		BoonInfoIcon = "BoonInfoSymbolHeraIcon",
		DoorIcon = "BoonSymbolHeraIsometric",
		Color = { 22, 128, 140, 255 },
		LightingColor = { 22, 128, 140, 255 },
		LootColor = { 22, 128, 140, 255 },
		SubtitleColor = { 0.09, 0.50, 0.55, 1.0 },
		EventEndSound = "/SFX/ArtemisBoonArrow",
		UpgradeSelectedSound = "/SFX/ArtemisBoonChoice",
		LootRejectionAnimation = "BoonDissipateA_Hera",

		RequiredMinCompletedRuns = 3,
		RequiredTextLines = { "ZeusFirstPickUp" },
		RequiredCosmetics = { "BreakableValue1", "ChallengeSwitches1" },

		TraitsList = { "HeraWeaponTrait", "HeraSecondaryTrait", "HeraRushTrait" },

		PriorityUpgrades = { "HeraWeaponTrait", "HeraSecondaryTrait", "HeraRushTrait", "HeraRangedTrait" },
		WeaponUpgrades = { "HeraWeaponTrait", "HeraSecondaryTrait", "HeraRushTrait", "HeraRangedTrait", "HeraShoutTrait" },
		Traits = { "MoreRewardTrait", "MoreCompanionTrait", "HealthAsObolTrait", "PeriodicCurseTrait" },
		Consumables = {},

		LinkedUpgrades =
		{

			EnvyBurstTrait = {
				OneOf = { "HeraWeaponTrait", "HeraSecondaryTrait" }, 
			},
			PrivilegeHeraTrait = {
				OneOf = { "HeraWeaponTrait", "HeraSecondaryTrait", "HeraRangedTrait" }, --, "HeraRangedTrait"
			},			
			FamilyHeraTrait = {
				OneOf = { "HeraWeaponTrait", "HeraSecondaryTrait", "HeraRangedTrait" }, --, "HeraRangedTrait"
			},
			DiscountHeraTrait = {
				OneOf = { "MoreRewardTrait", "MoreCompanionTrait", "HealthAsObolTrait" }, 
			},
			StatusOverTimeTrait = {
				OneFromEachSet =
				{
					{ "HeraWeaponTrait", "HeraSecondaryTrait", "HeraRangedTrait", "PeriodicCurseTrait" },
					{ "ForceHeraBoonTrait", "EnvyBurstTrait", "DiscountHeraTrait", "FamilyHeraTrait", "PrivilegeHeraTrait" },
				}
			},
			-- Duos
			CurseLongerTrait =
			{
				OneFromEachSet =
				{
					{ "HeraWeaponTrait", "HeraSecondaryTrait", "HeraRushTrait", "HeraRangedTrait" },
					{ "AphroditeWeaponTrait", "AphroditeSecondaryTrait", "AphroditeRushTrait", "AphroditeRangedTrait" }
				},
			},
			AuraExposedTrait =
			{
				OneFromEachSet =
				{
					{ "HeraWeaponTrait", "HeraSecondaryTrait", "HeraRushTrait", "HeraRangedTrait" },
					{ "AthenaWeaponTrait", "AthenaSecondaryTrait", "AthenaRushTrait", "AthenaRangedTrait",
						"ShieldLoadAmmo_AthenaRangedTrait" }
				},
			},
			BetterTrapsTrait =
			{
				OneFromEachSet =
				{
					{ "HeraRushTrait" },
					{ "ArtemisWeaponTrait", "ArtemisSecondaryTrait", "ArtemisRangedTrait", "CritBonusTrait" }
				},
			},
			SlowerHangoverTrait =
			{
				OneFromEachSet =
				{
					{ "HeraWeaponTrait", "HeraSecondaryTrait"},
					{ "DionysusWeaponTrait", "DionysusRushTrait", "DionysusSecondaryTrait", "DionysusShoutTrait" },
				}
			},
			AuraRuptureTrait =
			{
				OneFromEachSet =
				{
					{ "HeraWeaponTrait", "HeraSecondaryTrait", "HeraRushTrait", "HeraRangedTrait" },
					{ "PoseidonWeaponTrait", "PoseidonSecondaryTrait", "PoseidonRushTrait", "PoseidonRangedTrait" },
				}
			},
			KillMarkedTrait =
			{
				OneFromEachSet =
				{
					{ "HeraWeaponTrait", "HeraSecondaryTrait", "HeraRushTrait", "HeraRangedTrait" },
					{ "AresWeaponTrait", "AresSecondaryTrait", "AresRushTrait", "AresRangedTrait" },
				},
			},
			HeroicBoonsTrait =
			{
				OneFromEachSet =
				{
					{ "HeraWeaponTrait", "HeraSecondaryTrait", "HeraRushTrait", "HeraRangedTrait" },
					{ "DemeterWeaponTrait", "DemeterRushTrait", "DemeterSecondaryTrait", "DemeterRangedTrait" },
				},
			},
			GaugeLightningTrait =
			{
				OneFromEachSet =
				{
					{ "HeraRushTrait", "HeraRangedTrait", "HeraShoutTrait" },
					{ "ZeusWeaponTrait", "ZeusRushTrait", "ZeusSecondaryTrait", "ZeusRangedTrait", "ZeusShoutTrait" },
				},
			},
			
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
				HasTraitNameInRoom = "GaugeLightningTrait",
				{ Cue = "/VO/Hera_0041",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "My dear, it seems I only see you when we have common duties. Do you not feel our old passion any longer? Or are you busy elsewhere once more?" },
				{ Cue = "/VO/Zeus_0270",
					PortraitExitWait = 0.35,
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
					StartSound = "/SFX/ZeusBoonThunder",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Zeus_01", Portrait = "Portrait_Zeus_Default_01",
					Text = "Hera, I made you my wife, my queen. I have given you everything I have, and yet still there is an...emptiness between us. Maybe helping Zagreus will help us fill that void!" },
			},
			HeraWithPoseidon01 =
			{
				Name = "HeraWithPoseidon01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "AuraRuptureTrait",
				{ Cue = "/VO/Hera_0042",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "Poseidon. I can't seem to remember the last time you showed favor to your queen. Am I not important enough?" },
				{ Cue = "/VO/Poseidon_0270",
					Emote = "PortraitEmoteFiredUp",
					PortraitExitWait = 0.35,
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
					StartSound = "/SFX/PoseidonBoonWaveCrash", UseEventEndSound = true,
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Poseidon_01", Portrait = "Portrait_Poseidon_Default_01",
					Text = "Long time no see, Hera! I've been quite busy, helping little Hades escape from his father. If it's my favor you're after, help me with this one first." },
			},
			HeraWithAthena01 =
			{
				Name = "HeraWithAthena01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "AuraExposedTrait",
				{ Cue = "/VO/Hera_0043",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "I know we don't always share the same taste in heroes, Athena, but I believe we can agree in this instance that Zagreus requires our help. He shall escape that wretched realm." },
				{ Cue = "/VO/Athena_0260",
					PortraitExitWait = 0.35,
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
					StartSound = "/SFX/AthenaBoonHolyShield",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Athena_01", Portrait = "Portrait_Athena_Default_01",
					Text = "I can remember a time when we did get along in our inspiration. I'll help you and Zagreus, Queen Hera. In honor of those times of glory." },
			},
			HeraWithAres01 =
			{
				Name = "HeraWithAres01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "KillMarkedTrait",
				{ Cue = "/VO/Hera_0044",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "Ares, my dearest. Everyone else has failed to bring Zagreus to us. I'm here asking only the best to assist me in finally helping him out of that wretched place." },
				{ Cue = "/VO/Ares_0260",
					PortraitExitWait = 0.35,
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
					StartSound = "/SFX/AresWrathBattle",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Ares_01", Portrait = "Portrait_Ares_Default_01",
					Text = "It would be my pleasure, mother. I know that with our help, he can learn the true meaning of winning the war." },
			},
			HeraWithAphrodite01 =
			{
				Name = "HeraWithAphrodite01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "CurseLongerTrait",
				{ Cue = "/VO/Hera_0045",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "There you are. Always in a man's company...and yet it never seems to be your {#DialogueItalicFormat}husband{#PreviousFormat}. I see. Well, I suppose I can stay and chaperone this rendez-vous you have with Zagreus." },
				{ Cue = "/VO/Aphrodite_0250",
					PortraitExitWait = 0.35,
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Aphrodite_01", Portrait = "Portrait_Aphrodite_Default_01",
					Text = "Oh, that's simply unnecessary, my queen. Zagreus and I are just... Fine. Since you're already here, let's get this over with."
				},
			},
			HeraWithArtemis01 =
			{
				Name = "HeraWithArtemis01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "BetterTrapsTrait",
				--RequiredTextLines = { "HeraGift01", "ArtemisGift01" },
				{ Cue = "/VO/Hera_0046",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "I know still hold me responsible for what happened to your mother, Artemis. But as a step-mother, I hope you'll learn to get over such resentment." },
				{ Cue = "/VO/Artemis_0270",
					PortraitExitWait = 0.35,
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
					StartSound = "/SFX/ArtemisBoonArrow",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Artemis_01", Portrait = "Portrait_Artemis_Default_01",
					Text = "{#DialogueItalicFormat}Oh{#PreviousFormat}. I know how to get over it. I choose not to. Since you obviously don't know, here's a tip on how to help others."
				},
			},
			HeraWithDionysus01 =
			{
				Name = "HeraWithDionysus01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "SlowerHangoverTrait",
				{ Cue = "/VO/Hera_0047",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "We had our up and downs, but I must say your presence in Olympus is appreciated by many. It seems as your manners please more than one." },
				{ Cue = "/VO/Dionysus_0250",
					PortraitExitWait = 0.35,
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
					StartSound = "/SFX/DionysusBoonWineLaugh",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Dionysus_01", Portrait = "Portrait_Dionysus_Default_01",
					Text = "{#DialogueItalicFormat}Oh{#PreviousFormat}. A compliment from the queen herself. I guess it was worth facing your wrath more than once in the end. Let's share this cup while we wait for Zagreus to join us." },
			},
			HeraWithDemeter01 =
			{
				Name = "HeraWithDemeter01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "HeroicBoonsTrait",
				{ Cue = "/VO/Hera_0048",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "Demeter. As a queen and as a sister, can you stop this never ending winter? I got so many complains about it. The wramth of summer has to come eventually!" },
				{ Cue = "/VO/Demeter_0390",
					PortraitExitWait = 0.35,
					StartSound = "/SFX/DemeterBoonFrost",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Demeter_01", Portrait = "Portrait_Demeter_Default_01",
					Text = "Not until I feel like it, dear Hera. My grief and sorrow are not yet there. You'll be the first to know that's as much as I can do. And helping Zagreus as well. The cold doesn't seem to bother him." },
			},
		},

		SuperPriorityPickupTextLineSets =
		{
			HeraAboutOlympianReunionQuest01 =
			{
				Name = "HeraAboutOlympianReunionQuest01",
				PlayOnce = true,
				RequiredTextLines = { "HeraFirstPickUp", "PersephoneAboutOlympianReunionQuest01", },
				{ Cue = "/VO/ZagreusField_4961", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 2.33 },
					PostLineAnim = "ZagreusInteractEquip", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "I should probably invite her... In the name of Hades! Olympus, this is an official message! The underworld is open to all, especially royalty." },
				{ Cue = "/VO/Hera_0062",
					PortraitExitWait = 1.25,
					PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
					UseEventEndSound = true,
					Emote = "PortraitEmoteDepressed",
					Text = "What is this? An invitation? Can't you see that I'm very busy managing Olympus? After all, it's not like Zeus is doing his part. I'm sure he'll go to your little gathering, and I will inevitably be forced to hold down the mountain all on my own. Forget it." },
			},			
			HeraPostEpilogue01 =
			{
				Name = "HeraPostEpilogue01",
				PlayOnce = true,
				RequiredTextLines = { "HeraFirstPickUp", "OlympianReunionQuestComplete" },
				RequiredAnyTextLines = { "HeraAboutOlympianReunionQuest01", "HeraAboutOlympianReunionQuest01b" },
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hera_0061",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Zeus told me about your little reunion. How about we have the feast up here next time, hmm? That is, if you manage to join us one day." },
			},		
			HeraBackstory01 =
			{
				Name = "HeraBackstory01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp", "HeraGift04" },
				{ Cue = "/VO/Hera_0092",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I heard you have trouble with your father, Zagreus. Then let me tell you the story of ours. Kronos was my foster father and your father's father. And let's just say that Hades inherit Kronos temper. Let continue this chat once you are here." },
			},
			HeraBackstory02 =
			{
				Name = "HeraBackstory02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraBackstory01"},
				{ Cue = "/VO/Hera_0093",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Since you seem lock down there, let me continue my story about Kronos. He received a prophecy that he would be overthrown by one of his children. So he locked us, like you are right now." },
			},
			HeraBackstory03 =
			{
				Name = "HeraBackstory03",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraBackstory02", "HeraGift05" },
				{ Cue = "/VO/Hera_0094",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Remember when I told you we were lock by our father Kronos. Well, Zeus was able to escape and gather enough friends along his way to save us and locked Kronos. Please keep going, Zagreus. While I remember Zeus in all his glory." },
			},
			HeraBackstory04 =
			{
				Name = "HeraBackstory04",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraBackstory03" },
				{ Cue = "/VO/Hera_0095",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "To keep a story short. With Kronos defeated, Olympus needed a new King. Zeus inherited that role, but he decided to share it between twelve seats. Which brings the Olympus you'll see once you get up here. If you ever do." },
			},
			HeraBackstory05 =
			{
				Name = "HeraBackstory05",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraBackstory04", "HeraGift06"},
				{ Cue = "/VO/Hera_0096",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Now that you know your grandfather's story, I hope you show more respect to me and your father from now on. And never dare compare Hades to Kronos." },
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
				RequiredTextLines = { "ZeusFirstPickUp", "AresFirstPickUp", "HeraFirstPickUp" },
				--RequiredFalseTextLines = { "HeraWithZeus01", "ZeusWithHera01" },
				RequiredGodLoot = "ZeusUpgrade",
				{ Cue = "/VO/Hera_0063",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "My husband Zeus certainly has his flaws. Many flaws, actually. But nonetheless, I promised fidelity to him and his throne. A promise is not something you can break without consequences. My destiny is chained to Zeus, as is his with mine." },
			},
			HeraAboutZeus02 =
			{
				Name = "HeraAboutZeus02",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ZeusFirstPickUp", "AresFirstPickUp", "HeraFirstPickUp" },
				--RequiredFalseTextLines = { "HeraWithZeus01", "ZeusWithHera01" },
				RequiredGodLoot = "ZeusUpgrade",
				{ Cue = "/VO/Hera_0064",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Other than the four children we've had together, Zeus has many other children outside our marriage. That is not my idea of an ideal relationship." },
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
					Text = "Poseidon has always done his best to stay out of important decision-making, leaving my husband and me to take care of most of them. I would have expected a little more commitment to duty from the ruler of the sea." },
			},
			HeraAboutQueenDuty01 =
			{
				Name = "HeraAboutQueenDuty01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				{ Cue = "/VO/Hera_0066",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Every day, many come to see me for advice and guidance. Some want my power, others my wisdom, and as their rightful queen, it is my duty to help them. Let me show you what I mean." },
			},
			HeraAboutQueenDuty02 =
			{
				Name = "HeraAboutQueenDuty02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp", "HeraAboutQueenDuty01" },
				{ Cue = "/VO/Hera_0067",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "My role on Olympus is far more important than that of our king. Zeus is always absent, making my work twice as hard. Are you to blame for this recently, Zagreus?" },
			},
			HeraAboutQueenDuty03 =
			{
				Name = "HeraAboutQueenDuty03",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp", "HeraAboutQueenDuty02" },
				{ Cue = "/VO/Hera_0068",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I often receive gifts for my excellent work as queen. Peasants are always eager to shower me with offerings. When you are up here, I hope you'll do the same." },
			},
			HeraAboutQueenDuty04 =
			{
				Name = "HeraAboutQueenDuty04",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp", "HeraAboutQueenDuty03" },
				{ Cue = "/VO/Hera_0069",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I may be queen, but that doesn't mean I can't spend time amongst the commoners from time to time. Unfortunately, I am much too busy of late to indulge in such frivolity." },
			},
			HeraAboutQueenDuty05 =
			{
				Name = "HeraAboutQueenDuty05",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp", "HeraAboutQueenDuty04" },
				{ Cue = "/VO/Hera_0070",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Of all my duties as a queen, your escape is becoming my most time-consuming. I hope you will fix this matter quickly, Zagreus. Don't make me wait." },
			},
			HeraAboutCerberus01 =
			{
				Name = "HeraAboutCerberus01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				{ Cue = "/VO/Hera_0071",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I must admit, of all the Underworlds' subjects, there is one I would like you to greet for me. Next time you see Cerberus, please tell him... \"Who's a good boy?\" Hah. That will be all." },
			},
			HeraAboutCoronacht01 =
			{
				Name = "HeraAboutCoronacht01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				RequiredWeapon = "BowWeapon",
				--RequiredTrait = "GunManualReloadTrait",
				{ Cue = "/VO/Hera_0072",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Coronacht! Oh, how long it's been since I saw this perfectly balanced weapon. I was so young then. If you use it well, Zagreus, it shall defeat any enemies in your way." },
			},
			HeraAboutHeraAspect01 =
			{
				Name = "HeraAboutHeraAspect01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp", "HeraAboutCoronacht01" },
				RequiredWeapon = "BowWeapon",
				RequiredTrait = "BowLoadAmmoTrait",
				{ Cue = "/VO/Hera_0073",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You dare to use my aspect of Coronacht without first obtaining my permission?! You are bold, little one. Make use of it while you can, for now that I know where it disappeared to, I know where to find it when I next need it." },
			},
			HeraAboutPersephoneQueen01 =
			{
				Name = "HeraAboutPersephoneQueen01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp", "PersephoneHomeMeeting03" },
				{ Cue = "/VO/Hera_0074",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Pomegranates are often given to me as offerings, and they symbolize my rightful role as queen. However, I recently heard that lately, someone else is getting pomegranates instead of me. I cannot let this slight stand, and if I catch this false queen... Oooh." },
			},
			HeraAboutPersephoneQueen02 =
			{
				Name = "HeraAboutPersephoneQueen02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraAboutPersephoneQueen01", "PersephoneHomeMeeting04" },
				{ Cue = "/VO/Hera_0075",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Even if you disagree with your father, you must continue to show him respect. He's been through so much, even I couldn't know where to start. Maybe start by listening to him." },
			},
			HeraOlympusSecurity01 =
			{
				Name = "HeraOlympusSecurity01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp", "Ending01" },
				-- I'm grateful.
				EndCue = "/VO/ZagreusField_4962",
				EndWait = 0.45,
				{ Cue = "/VO/Hera_0076",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I hear you're Head of Underworld Security now. We have one of those up here too, you know. I suspect he's far better at it than you are. Pff. I suppose we'll never know." },
			},
			HeraRunProgress01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				RequiredBiome = "Elysium",
				RequiredMinRunsCleared = 1,
				{ Cue = "/VO/Hera_0077",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You made it to Elysium? Good work. Say hello to Theseus for me. He is such a genuine hero." },
			},
			HeraRunProgress02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				RequiredAnyRoomsThisRun = { "C_Boss01", "C_MiniBoss01" },
				{ Cue = "/VO/Hera_0078",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Did you meet Asterius on your way up? He's very committed to his... friendship with Theseus, and I respect that in a hero." },
			},
			HeraRunProgress03 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				RequiredBiome = "Tartarus",
				{ Cue = "/VO/Hera_0079",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Still in Tartarus, Zagreus? What are you doing? Hurry up! For the love of Zeus!" },
			},	
			HeraRunCleared01 =
			{
				Name = "HeraRunCleared01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				RequiredMinRunsCleared = 1,
				RequiresLastRunCleared = true,
				{ Cue = "/VO/Hera_0080",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I was informed that you got out? Finally... And yet you returned because you perished before reaching us up here? The surface can be harsh sometimes. At least you proved it is possible. I'll continue my support until you make it to Olympus." },
			},
			HeraAboutDefiance01 =
			{
				Name = "HeraAboutDefiance01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				RequiredMinLastStandsUsed = 1,
				{ Cue = "/VO/Hera_0081",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I see you've used that Defiance to keep you alive when you should've perished, Zagreus. Messing with our own death is risky, but every risk is worth taking when we have nothing to lose. Keep trying." },
			},
			HeraAboutDefiance02 =
			{
				Name = "HeraAboutDefiance02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				RequiredFalseGodLoots = { "AthenaUpgrade", "HestiaUpgrade" },
				RequiredMinLastStandsUsed = 1,
				RequiredMaxLastStands = 0,
				{ Cue = "/VO/Hera_0082",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "No more Defiance to help you? Maybe you should ask Hestia or Athena. I've heard they have some to spare. Until then, take this." },
			},
			HeraAboutDefiance03 =
			{
				Name = "HeraAboutDefiance03",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				RequiredMinLastStandsUsed = 1,
				RequiredMaxLastStands = 3,
				{ Cue = "/VO/Hera_0083",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You keep getting that Defiance back, I see. Is it some kind of parlor trick Nyx showed you to cheat death? I look forward to seeing a demonstration in person upon your arrival on Olympus." },
			},
			HeraAboutKeepsake01 =
			{
				Name = "HeraAboutKeepsake01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				RequiredTrait = "ForceHeraBoonTrait",
				{ Cue = "/VO/Hera_0084",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					--Emote = "PortraitEmoteMusical",
					Text = "My KEEPSAKE! I can't believe I gave it to someone like you. You're not even a hero. Hmph. Anyway, a gift from a queen is forever. Cherish it." },
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
				{ Cue = "/VO/Hera_0085",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "This is the best you'll ever get from me, Zagreus. Don't make me regret my decision to expend this much effort on your cause." },
			},
			HeraLowHealth01 =
			{
				Name = "HeraLowHealth01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				RequiredMaxHealthFraction = 0.30,
				RequiredMaxLastStands = 0,

				{ Cue = "/VO/Hera_0086",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Emote = "PortraitEmoteSurprise",
					Text = "Aw, look who's about to die. Just make sure to send my blessing back. A real hero might need it." },
			},
			HeraLowHealth02 =
			{
				Name = "HeraLowHealth02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				RequiredMaxHealthFraction = 0.30,
				RequiredMaxLastStands = 0,

				{ Cue = "/VO/Hera_0087",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Life is short. Yours, especially, it seems. Still, as a generous queen, I give you this." },
			},
			HeraLowHealth03 =
			{
				Name = "HeraLowHealth03",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				RequiredMaxHealthFraction = 0.30,
				RequiredMaxLastStands = 0,

				{ Cue = "/VO/Hera_0088",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Let's make this quick. You clearly won't make it very far anyway." },
			},
			HeraPostGiftPickup01 =
			{
				Name = "HeraPostGiftPickup01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraGift01", },
				{ Cue = "/VO/Hera_0089",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I prepared this blessing for another hero, but he died before I could give it to him. You can use it, little hero, since he won't be needing it in your realm." },
			},
			HeraPostGiftPickup02 =
			{
				Name = "HeraPostGiftPickup02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraGift02", },
				{ Cue = "/VO/Hera_0090",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I call you little hero because I see you as weaker than other heroes. Not because of your height. I just wanted to be clear." },
			},

			HeraPostGiftPickup03 =
			{
				Name = "HeraPostGiftPickup03",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraGift03", },
				{ Cue = "/VO/Hera_0091",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I already used all the gifts you gave me, little hero. Don't worry, Nectar and Ambrosia are terribly common here. Join us, if you'd like some." },
			},		
		},

		PickupTextLineSets =
		{
			HeraFirstPickUp =
			{
				Name = "HeraFirstPickUp",
				PlayOnce = true,
				RequiredTextLines = { "AthenaFirstPickUp", "DionysusFirstPickUp", },
				{ Cue = "/VO/ZagreusField_4960", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 4.23 },
					PostLineAnim = "ZagreusInteractEquip", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "The power of a queen.… I know only one person this could be. In the name of Hades! Olympus! I accept this message." },
				{ Cue = "/VO/Hera_0001",
					PortraitExitWait = 1.25,
					PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
					UseEventEndSound = true,
					Text = "I have heard very much about you, Zagreus. I remain unsure if you are a hero, or more like your father. I suppose the only way to know is by allowing you to borrow my blessing to get out of this wretched realm. Don't disappoint me." },
			},
			HeraMiscPickup01 =
			{
				Name = "HeraMiscPickup01",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				{ Cue = "/VO/Hera_0002",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Still climbing this wretched realm, Zagreus? I'm not terribly fond of your father, but at least he gets results." },
			},
			HeraMiscPickup02 =
			{
				Name = "HeraMiscPickup02",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				{ Cue = "/VO/Hera_0003",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I haven't a clue why every soul here places their obols on you escaping from this place. I don't think you have it in you, but I'll give you a chance. Don't disappoint me, Zagreus." },
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
					Text = "There's always someone stronger than you, Zagreus. No one escapes that fate, save one. ...Obviously, I'm not talking about you, but you might be just strong enough to pass your father's security. Here; you can thank me when you finally succeed." },
			},
			HeraMiscPickup04 =
			{
				Name = "HeraMiscPickup04",
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				{ Cue = "/VO/Hera_0005",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You can learn a lot by observing others. I was tricked many times when I was much younger, and more naive. Now, I know better. Let me show you a thing or two." },
			},
			HeraMiscPickup05 =
			{
				Name = "HeraMiscPickup05",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				{ Cue = "/VO/Hera_0006",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "A true hero isn't born a hero. A hero is defined by their actions. But even a hero must answer to their queen. If you want to be a hero one day, Zagreus, you'd do well to remember this." },
			},
			HeraMiscPickup06 =
			{
				Name = "HeraMiscPickup06",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				{ Cue = "/VO/Hera_0007",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I always saw you Underworld gods as beneath us... That's all. You keep trying to do... whatever it is you're doing. Oh, poor you." },
			},
			HeraMiscPickup07 =
			{
				Name = "HeraMiscPickup07",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				{ Cue = "/VO/Hera_0008",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "If your sad escape attempts continue to utterly fail at producing results, Zagreus, I may consider withdrawing my help for your cause. It's verging on pathetic at this point, really." },
			},
			HeraMiscPickup08 =
			{
				Name = "HeraMiscPickup08",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				{ Cue = "/VO/Hera_0009",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You can't always rely on others, Zagreus. You must learn how to pick yourself up when you fall." },
			},
			HeraMiscPickup09 =
			{
				Name = "HeraMiscPickup09",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				{ Cue = "/VO/Hera_0010",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Olympus is full of our egocentric relatives all proclaiming their own magnificence. I hope that when you get here, it won't be adding one more. I won't allow it." },
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
					Text = "My blessing comes with a price. One that I hope you'll be willing to pay, when the time comes." },
			},
			HeraMiscPickup11 =
			{
				Name = "HeraMiscPickup11",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				{ Cue = "/VO/Hera_0012",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "When I agreed to help you with your rebellion against your father, I didn't think it would take {#DialogueItalicFormat}forever{#PreviousFormat}. Do hurry up." },
			},
			HeraMiscPickup12 =
			{
				Name = "HeraMiscPickup12",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				{ Cue = "/VO/Hera_0013",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The world can be cruel at times. Luckily, we are there to improve it. Don't let anyone make you think otherwise." },
			},
			HeraMiscPickup13 =
			{
				Name = "HeraMiscPickup13",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				{ Cue = "/VO/Hera_0014",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Once a year, when I bathe at Kanathos, I feel fresh and revived, like new feathers on a bird after a molt. I'm sure you feel the same when you die and come out of your pool full of... {#DialogueItalicFormat}blood{#PreviousFormat}... Or perhaps not." },
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
					Text = "If you manage to get to the surface, you ought to try the white substance that comes from these majestic surface creatures. I was the first to call them cows, and then everyone else started using the name... Anyhow, that's only  {#DialogueItalicFormat}if{#PreviousFormat} you ever get up there." },
			},
			HeraMiscPickup15 =
			{
				Name = "HeraMiscPickup15",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				{ Cue = "/VO/Hera_0016",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You've never truly lost until you give up. That's why I keep supporting your cause, even if I think you should have given up ages ago. But what do I know? I always succeed in my pursuits. Unlike you." },
			},
			HeraMiscPickup16 =
			{
				Name = "HeraMiscPickup16",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				{ Cue = "/VO/Hera_0017",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Look at you, still doing your best after all those failed attempts. I almost feel pity for you, little hero." },
			},
			HeraMiscPickup17 =
			{
				Name = "HeraMiscPickup17",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				{ Cue = "/VO/Hera_0018",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I am once more here for you, little hero. But when are you going to return the favor, {#DialogueItalicFormat}hm{#PreviousFormat}? Soon, I hope." },
			},
			HeraMiscPickup18 =
			{
				Name = "HeraMiscPickup18",
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp" },
				{ Cue = "/VO/Hera_0019",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You have died many times by now. And yet, you've never given up. I can admit, I admire your perseverance, little hero." },
			},
			HeraMiscPickup19 =
			{
				Name = "HeraMiscPickup19",
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HeraFirstPickUp", "HeraGift07" },
				{ Cue = "/VO/Hera_0020",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You could have given up, but I know it's my help that keeps you going, little hero. I won't give up on you, as long as you do the same." },
			},

			-- shorter acknowledgments
			HeraMiscPickup20 =
			{
				Name = "HeraMiscPickup20",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HeraBasicPickUpTextLines,
				{ Cue = "/VO/Hera_0021",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Off with their heads, Zagreus. Show no mercy." },
			},
			HeraMiscPickup21 =
			{
				Name = "HeraMiscPickup21",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HeraBasicPickUpTextLines,
				{ Cue = "/VO/Hera_0022",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Think like me, Zagreus. A queen is not afraid to fail. Failure is simply another steppingstone to greatness." },
			},
			HeraMiscPickup22 =
			{
				Name = "HeraMiscPickup22",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HeraBasicPickUpTextLines,
				{ Cue = "/VO/Hera_0023",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "When everyone else is losing their head, it is important to keep yours." },
			},
			HeraMiscPickup23 =
			{
				Name = "HeraMiscPickup23",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HeraBasicPickUpTextLines,
				{ Cue = "/VO/Hera_0024",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I am a queen, and I demand to be treated like a queen. Show them all, Zagreus." },
			},
			HeraMiscPickup24 =
			{
				Name = "HeraMiscPickup24",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HeraBasicPickUpTextLines,
				{ Cue = "/VO/Hera_0025",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The secret of a happy marriage remains a secret." },
			},
			HeraMiscPickup25 =
			{
				Name = "HeraMiscPickup25",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HeraBasicPickUpTextLines,
				{ Cue = "/VO/Hera_0026",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "A successful marriage requires falling in love over and over again with the same person." },
			},
			HeraMiscPickup26 =
			{
				Name = "HeraMiscPickup26",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HeraBasicPickUpTextLines,
				{ Cue = "/VO/Hera_0027",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Marriage is neither heaven nor hell, it is simply purgatory." },
			},
			HeraMiscPickup27 =
			{
				Name = "HeraMiscPickup27",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HeraBasicPickUpTextLines,
				{ Cue = "/VO/Hera_0028",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "By my name, Zagreus... wake up and show some results." },
			},
			HeraMiscPickup28 =
			{
				Name = "HeraMiscPickup28",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HeraBasicPickUpTextLines,
				{ Cue = "/VO/Hera_0029",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "For once, I believe you can succeed. Truly. After all, it is impossible to fail that many times in a row." },
			},
			HeraMiscPickup29 =
			{
				Name = "HeraMiscPickup29",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HeraBasicPickUpTextLines,
				{ Cue = "/VO/Hera_0030",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Of all the peasants of the Underworld, you could say you are not my least favorite. Feel free to take that as a compliment." },
			},

			HeraMiscPickup30 =
			{
				Name = "HeraMiscPickup30",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HeraBasicPickUpTextLines,
				{ Cue = "/VO/Hera_0031",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "If this was your father, I am sure he would be out by now. Olympus can't be that far, Zagreus." },
			},
			HeraMiscPickup31 =
			{
				Name = "HeraMiscPickup31",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HeraBasicPickUpTextLines,
				{ Cue = "/VO/Hera_0032",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Marriage is about commitment, and you have showed yours. Keep doing... whatever you do." },
			},
			HeraMiscPickup32 =
			{
				Name = "HeraMiscPickup32",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HeraBasicPickUpTextLines,
				{ Cue = "/VO/Hera_0033",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Is there something else I can help you with? I have others duties besides you, you know." },
			},
			HeraMiscPickup33 =
			{
				Name = "HeraMiscPickup33",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HeraBasicPickUpTextLines,
				{ Cue = "/VO/Hera_0034",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You are not the center of the world, Zagreus. Take this and get out." },
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
					Text = "I am starting to doubt you ever want to come to Olympus. But you would never lie to your queen. Am I right?" },
			},
			HeraMiscPickup35 =
			{
				Name = "HeraMiscPickup35",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HeraBasicPickUpTextLines,
				{ Cue = "/VO/Hera_0036",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You won't find any more committed than me, Zagreus. I'll keep helping you until you join us." },
			},
			HeraMiscPickup36 =
			{
				Name = "HeraMiscPickup36",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HeraBasicPickUpTextLines,
				{ Cue = "/VO/Hera_0037",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Dying must be a common thing for you at this point. Strange hobby." },
			},
			HeraMiscPickup37 =
			{
				Name = "HeraMiscPickup37",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HeraBasicPickUpTextLines,
				{ Cue = "/VO/Hera_0038",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You are always welcome on Olympus. That is, if you can prove yourself worthy of it." },
			},
			HeraMiscPickup38 =
			{
				Name = "HeraMiscPickup38",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HeraBasicPickUpTextLines,
				{ Cue = "/VO/Hera_0039",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I have others duties to attend to. Take this and I'll be on my way." },
			},
			HeraMiscPickup39 =
			{
				Name = "HeraMiscPickup39",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HeraBasicPickUpTextLines,
				{ Cue = "/VO/Hera_0040",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Another deed done. What's next on my list? A queen's job is never finished." },
			},
		},

		BoughtTextLines =
		{
			HeraLootBought01 =
			{
				Name = "HeraLootBought01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				-- You just did.
				EndCue = "/VO/ZagreusField_4988",
				EndWait = 0.45,
				{ Cue = "/VO/Hera_0099",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Part of what you just gave to Charon is coming back to me; it's part of our trade arrangement. I won't say anything so prosaic as, \"thank you for your purchase.\"" },
			},
			HeraLootBought02 =
			{
				Name = "HeraLootBought02",
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },

				{ Cue = "/VO/Hera_0100",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I suppose the cost was low enough for your rank, this time. Good for you." },
			},
			HeraLootBought03 =
			{
				Name = "HeraLootBought03",
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },

				{ Cue = "/VO/Hera_0101",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "And here I thought you would never have enough obols for my blessings." },
			},
		},
		RejectionTextLines =
		{
			HeraRejection01 =
			{
				Name = "HeraRejection01",
				{ Cue = "/VO/Hera_0102",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Nobody says no to the queen! You'll feel my wrath to its fullest!" },
			},
			HeraRejection02 =
			{
				Name = "HeraRejection02",
				{ Cue = "/VO/Hera_0103",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "How dare you, miserable imp! You should have been grateful for my offer. You won't make that mistake again, trust me!" },
			},
			HeraRejection03 =
			{
				Name = "HeraRejection03",
				{ Cue = "/VO/Hera_0104",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I suppose that was to be expected from a peasant like yourself. Not everybody has what it takes to make the correct decision, when faced with a choice." },
			},
			HeraRejection04 =
			{
				Name = "HeraRejection04",
				{ Cue = "/VO/Hera_0105",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Adoration is something you earn. Even if I have to use excessive force, I'll get yours." },
			},
			HeraRejection05 =
			{
				Name = "HeraRejection05",
				{ Cue = "/VO/Hera_0106",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Peasant once, peasant always. You were all but doomed to make the wrong decision. Poor thing." },
			},
			HeraRejection06 =
			{
				Name = "HeraRejection06",
				{ Cue = "/VO/Hera_0107",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Be more like your father: know when to quit, and always do as the queen asks of you." },
			},
			HeraRejection07 =
			{
				Name = "HeraRejection07",
				{ Cue = "/VO/Hera_0108",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Wrong! I'll make you bow to the queen, peasant!" },
			},
			HeraRejection08 =
			{
				Name = "HeraRejection08",
				{ Cue = "/VO/Hera_0109",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I hear you keep cheating death. Well, you'd better prepare yourself: it's coming soon." },
			},
			HeraRejection09 =
			{
				Name = "HeraRejection09",
				{ Cue = "/VO/Hera_0110",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I don't take \"no\" for an answer. You'd best remember that, peasant." },
			},
			HeraRejection10 =
			{
				Name = "HeraRejection10",
				{ Cue = "/VO/Hera_0111",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I'll show you what it's like to go against a queen. I won't go easy." },
			},
			HeraRejection11 =
			{
				Name = "HeraRejection11",
				{ Cue = "/VO/Hera_0112",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I already forgive you, but that doesn't mean I won't make it hard." },
			},
			HeraRejection12 =
			{
				Name = "HeraRejection12",
				{ Cue = "/VO/Hera_0113",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I didn't even wanted to give you my blessing. But if you show yourself worthy of it, I might reconsider giving it to you..." },
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

				-- Oops, big mistake.
				{ Cue = "/VO/ZagreusField_4991" },
				-- Gulp, not the queen.
				{ Cue = "/VO/ZagreusField_4992" },
				-- I beg for forgiveness, your highness.
				{ Cue = "/VO/ZagreusField_4993" },
				-- Oh no, my bad!
				{ Cue = "/VO/ZagreusField_4994" },
			},
			[2] = GlobalVoiceLines.GodRejectedVoiceLines,
		},

		MakeUpTextLines =
		{
			HeraMakeUp01 =
			{
				Name = "HeraMakeUp01",

				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hera_0118",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You survived our little confrontation? Well, I didn't expect that from you. Take this and go." },
			},
			HeraMakeUp02 =
			{
				Name = "HeraMakeUp02",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hera_0119",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I hope you don't forget the lesson you've learned: never face the wrath of a queen." },
			},
			HeraMakeUp03 =
			{
				Name = "HeraMakeUp03",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hera_0120",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Take my blessing and go. I've wasted enough time on you already." },
			},
			HeraMakeUp04 =
			{
				Name = "HeraMakeUp04",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hera_0121",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You might have survived this one, Zagreus, but next time you go against me, I won't hold back like I did here." },
			},
			HeraMakeUp05 =
			{
				Name = "HeraMakeUp05",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hera_0122",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I hope this \"fight\" has reminded you of why you should always be loyal to me, peasant. Godlings... Always thinking they're better than others. You'll learn, young one. You'll learn." },
			},
			HeraMakeUp06 =
			{
				Name = "HeraMakeUp06",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hera_0123",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Next time I say \"jump,\" you say, \"how high?\" Understood?" },
			},
			HeraMakeUp07 =
			{
				Name = "HeraMakeUp07",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hera_0124",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You'd better not go around telling people you defeated me. I'll deny it and you'll look like a fool. Don't try me." },
			},
			HeraMakeUp08 =
			{
				Name = "HeraMakeUp08",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hera_0125",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "How— No one crosses the queen and remains alive. You must have cheated somehow. Cheater.  {#DialogueItalicFormat}Hmph{#PreviousFormat}. Here, take your ill-gotten winnings." },
			},
			HeraMakeUp09 =
			{
				Name = "HeraMakeUp09",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hera_0126",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Congratulations, Zagreus. You've proved you're one of the few who can cross me and live to tell about it. Stay vigilant, for I won't forget this." },
			},
			HeraMakeUp10 =
			{
				Name = "HeraMakeUp10",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hera_0127",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Frankly, I'm glad it's over. I have much more important things to do. The task list of a queen is endless." },
			},
			HeraMakeUp11 =
			{
				Name = "HeraMakeUp11",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hera_0128",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I'll let you win this time, Zagreus. A queen can be forgiving, on occasion." },
			},
			HeraMakeUp12 =
			{
				Name = "HeraMakeUp12",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hera_0129",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "That's it. I order this fight to end. Good, you are listening to reason again." },
			},
		},
		MakeUpFailedTextLines = {
			HeraMakeUpFailed01 =
			{
				Name = "HeraMakeUpFailed01",
				PlayOnce = true,
				-- Denied. (Nothing.)
				EndCue = "ZagreusHome_0434",--"/VO/ZagreusField_4963",
				EndWait = 0.45,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hera_0130",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Pff. You thought I would give you a blessing after disrespecting me like you did? Go find me elsewhere if you want another boon." },
			},
			HeraMakeUpFailed02 =
			{
				Name = "HeraMakeUpFailed02",
				PlayOnce = true,
				-- Nothing.
				EndCue = "/VO/ZagreusHome_0434",
				EndWait = 0.45,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hera_0131",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Haha. See, all this trouble for what? Nothing! Absolutely nothing. Next time, worship your queen." },
			},
		},
		GiftTextLineSets =
		{
			-- gives gift in exchange
			HeraGift01 =
			{
				Name = "HeraGift01",
				PlayOnce = true,
				{ Cue = "/VO/ZagreusField_4965", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "You seemed to think little of me, Queen Hera. I hope this gift may improve our relationship." },
				{ Cue = "/VO/Hera_0132",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Pff{#PreviousFormat}. As queen of Olympus, I receive countless gifts and offerings each day. Yours makes no difference; you'll never be remembered as a true hero. Still, I suppose you could try by starting with this. Use it wisely." },
			},
			HeraGift02 =
			{
				Name = "HeraGift02",
				PlayOnce = true,
				RequiredTextLines = { "HeraGift01" },
				{ Cue = "/VO/ZagreusField_4966", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "I don't want to be remembered like the heroes stuck in Elysium. I just want to make a genuine connection with you, Queen Hera." },
				{ Cue = "/VO/Hera_0133",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "In order to form a connection, both parties must be in agreement, and I don't see any reason to connect with you. I don't fraternize with lower ranked little godlings." },
			},
			HeraGift03 =
			{
				Name = "HeraGift03",
				PlayOnce = true,
				RequiredTextLines = { "HeraGift02" },
				{ Cue = "/VO/ZagreusField_4967", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "I know you might never see me as an equal, Queen Hera. But I am persistent, and this is my way to show you the truth of my words." },
				{ Cue = "/VO/Hera_0134",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Truth? Hah. You speak like someone else I know, and I do not need another hero like him in my life. Cease with this nonsense, or I'll stop accepting your gifts." },
			},
			HeraGift04 =
			{
				Name = "HeraGift04",
				PlayOnce = true,
				RequiredTextLines = { "HeraGift03" },
				{ Cue = "/VO/ZagreusField_4968", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "I didn't mean to upset you, Queen Hera. This gift is not to prove that I'm a hero. It's only to show my respect for you." },
				{ Cue = "/VO/Hera_0135",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Many before you have given me gifts with ill intentions. I shall judge myself if you are worthy of my respect." },
			},
			HeraGift05 =
			{
				Name = "HeraGift05",
				PlayOnce = true,
				RequiredTextLines = { "HeraGift04" },
				{ Cue = "/VO/ZagreusField_4969", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "I don't know what it is with you and heroes, Queen Hera, but I hope we can become friends." },
				{ Cue = "/VO/Hera_0136",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Stop this nonsense, Zagreus. I don't have friends, I have servants. Now go fetch more gifts for your queen." },
			},
			HeraGift06 =
			{
				Name = "HeraGift06",
				PlayOnce = true,
				RequiredTextLines = { "HeraGift05" },
				{ Cue = "/VO/ZagreusField_4970", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "I found some more Nectar for you, Queen Hera. Even though those aren't exactly rare in your realm." },
				{ Cue = "/VO/Hera_0137",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Indeed. And I am growing tired of it. Unless you can find me something of more substance, I order you to cease with this meaningless gift giving." },
			},
			HeraGift07 =
			{
				Name = "HeraGift07",
				PlayOnce = true,
				RequiredTextLines = { "HeraGift06" },
				{ Cue = "/VO/ZagreusField_4971", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "This is no Nectar, my queen. And I know this doesn't make me a hero, or whatever, I just wanted you to have it. I promise I'll stop bothering you from now on, if that's what you'd prefer." },
				{ Cue = "/VO/Hera_0138",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					PostLineThreadedFunctionName = "MaxedRelationshipPresentation",
					PostLineFunctionArgs = { Text = "NPC_Hera_01", Icon = "Keepsake_HeraSticker_Max" },
					Text = "{#DialogueItalicFormat}Hmph{#PreviousFormat}. I see you went to a fair amount of trouble to bring me this bottle. Such a shame, when I already have several. You are obviously no hero... Perhaps, at best, a little hero. Maybe we will be able to make something of you, in the end." },
			},
		},
		RoyalPactVoiceLines = {
			-- NPC HERA
			HeraFirstNPC01 =
			{
				Name = "HeraFirstNPC01",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hera_0175",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Zagreus, you are now in possession of the Royal Pact. Anyone you meet is obligated to aid you, without fear of retaliation from your father. But if you fail, the contract ends and you start afresh. Understood?" },
			},
			HeraTartarusNPC01 =
			{
				Name = "HeraTartarusNPC01",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "A_Story01",
				{ Cue = "/VO/Hera_0176",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Old King, Zagreus possesses the Royal Pact. You may help Zagreus without fear of Hades' servants. I made sure of it." },
			},
			HeraTartarusNPC02 =
			{
				Name = "HeraTartarusNPC02",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "A_Story01",
				{ Cue = "/VO/Hera_0177",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You may take a break from your endless punishment, Old King. Zagreus needs your help once again." },
			},
			HeraTartarusNPC03 =
			{
				Name = "HeraTartarusNPC03",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "A_Story01",
				{ Cue = "/VO/Hera_0178",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I heard you are an expert at unfinished tasks. Perhaps you might have more success with helping Zagreus on his tasks than pushing that damned rock." },
			},
			HeraTartarusNPC04 =
			{
				Name = "HeraTartarusNPC04",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "A_Story01",
				{ Cue = "/VO/Hera_0179",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Is that a face on that rock? I hope you didn't give it a name. Never mind that, Zagreus is here to receive your precious gifts." },
			},
			HeraTartarusNPC05 =
			{
				Name = "HeraTartarusNPC05",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "A_Story01",
				{ Cue = "/VO/Hera_0180",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Old King. Do good deed for Zagreus. See this as an extension of your punishment." },
			},
			HeraAsphodelNPC01 =
			{
				Name = "HeraAsphodelNPC01",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "B_Story01",
				{ Cue = "/VO/Hera_0181",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Dryad, I have heard your meals have assisted Zagreus in the past. You may prepare your best dishes for him." },
			},
			HeraAsphodelNPC02 =
			{
				Name = "HeraAsphodelNPC02",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "B_Story01",
				{ Cue = "/VO/Hera_0182",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I allow you to cook a feast, Dryad. Zagreus needs all the strength he can get." },
			},
			HeraAsphodelNPC03 =
			{
				Name = "HeraAsphodelNPC03",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "B_Story01",
				{ Cue = "/VO/Hera_0183",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Provide Zagreus with whatever aid you can offer. As mentioned in the Royal Pact, you have my permission." },
			},
			HeraAsphodelNPC04 =
			{
				Name = "HeraAsphodelNPC04",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "B_Story01",
				{ Cue = "/VO/Hera_0184",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I heard you sing very well, Dryad. But more cooking and less singing. Zagreus needs all the strength he can get." },
			},
			HeraAsphodelNPC05 =
			{
				Name = "HeraAsphodelNPC05",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "B_Story01",
				{ Cue = "/VO/Hera_0185",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Use your best ingredients, Dryad. As long as the Royal Pact applies, you must help Zagreus in his quest." },
			},
			HeraElysiumNPC01 =
			{
				Name = "HeraElysiumNPC01",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "C_Story01",
				{ Cue = "/VO/Hera_0186",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Finally, a champion. Prove to me that you deserve your place in Elysium. By this Royal Pact, I order you to help Zagreus in his quest." },
			},
			HeraElysiumNPC02 =
			{
				Name = "HeraElysiumNPC02",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "C_Story01",
				{ Cue = "/VO/Hera_0187",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You must once again be there for Zagreus, Hero. This Royal Pact will ensure you have no retaliation for your action." },
			},
			HeraElysiumNPC03 =
			{
				Name = "HeraElysiumNPC03",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "C_Story01",
				{ Cue = "/VO/Hera_0188",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I understand helping Zagreus isn't the most heroic task. But even so, heed my decree and aid him." },
			},
			HeraElysiumNPC04 =
			{
				Name = "HeraElysiumNPC04",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "C_Story01",
				{ Cue = "/VO/Hera_0189",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "With this Royal Pact, Hades cannot interfere with your aid, Hero. You may help Zagreus as you please." },
			},
			HeraElysiumNPC05 =
			{
				Name = "HeraElysiumNPC05",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "C_Story01",
				{ Cue = "/VO/Hera_0190",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Must I ask another hero, Patroclus? It seems like you lack the dedication for the task at hand. As long as the Royal Pact is in Zagreus possession, you must help him no matter what." },
			},
			HeraGenericNPC01 =
			{
				Name = "HeraGenericNPC01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hera_0191",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "As you may be aware, Zagreus struggles with the simplest task of escaping his father's domain. Your assistance is required." },
			},
			HeraGenericNPC02 =
			{
				Name = "HeraGenericNPC02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hera_0192",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "By this Royal Pact, I hereby order you to help Zagreus to the utmost of your abilities. That will be all." },
			},
			HeraGenericNPC03 =
			{
				Name = "HeraGenericNPC03",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hera_0193",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Maybe with the Royal Pact, Zagreus will show himself worthy of entering Olympus. We shall see." },
			},
			HeraGenericNPC04 =
			{
				Name = "HeraGenericNPC04",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hera_0194",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hestia and I created this Royal Pact to help heroes in their quest, even if Zagreus is not a hero, we made an exception. Go ahead." },
			},
			HeraGenericNPC05 =
			{
				Name = "HeraGenericNPC05",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hera_0195",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "It was Hestia's idea to write down the Royal Pact for you, Zagreus. I signed it out of pity for you, since I knew you cannot escape your father's realm unaided." },
			},
			HeraGenericNPC06 =
			{
				Name = "HeraGenericNPC06",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hera_0196",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "By my status of queen and by this Royal Pact, any capable shade must help Zagreus in his escape from the underworld." },
			},
			HeraGenericNPC07 =
			{
				Name = "HeraGenericNPC07",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hera_0197",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Even with your help Zagreus seems incapable of escaping, still he is in possession of the Royal Pact. Keep helping him and one day he might succeed." },
			},
			HeraRepeatNPC01 =
			{
				Name = "HeraRepeatNPC01",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactNPCTextLines,
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hera_0198",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Anybody able to help Zagreus are forced to help him escape. No exception." },
			},
			HeraRepeatNPC02 =
			{
				Name = "HeraRepeatNPC02",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactNPCTextLines,
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hera_0199",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Stop. Helping Zagreus is your new priority. Once done, you may get back to your business." },
			},
			HeraRepeatNPC03 =
			{
				Name = "HeraRepeatNPC03",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactNPCTextLines,
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hera_0200",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Zagreus has the Royal Pact. You know what to do." },
			},
			HeraRepeatNPC04 =
			{
				Name = "HeraRepeatNPC04",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactNPCTextLines,
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hera_0201",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Once again, you must help Zagreus as much as you are capable." },
			},
			HeraRepeatNPC05 =
			{
				Name = "HeraRepeatNPC05",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactNPCTextLines,
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hera_0202",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Since Zagreus is in possession of the Royal Pact, you must help him in his quest." },
			},
			HeraRepeatNPC06 =
			{
				Name = "HeraRepeatNPC06",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactNPCTextLines,
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hera_0203",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "All the help you can deliver is requested here. Do not hold back." },
			},
			HeraRepeatNPC07 =
			{
				Name = "HeraRepeatNPC07",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactNPCTextLines,
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hera_0204",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Another time to perform your duty. And to please your queen. Go on." },
			},
			-- Boss Hera			
			HeraTartarusBoss01 =
			{
				Name = "HeraTartarusBoss01",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03"},
				{ Cue = "/VO/Hera_0205",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The Old King heard you have the Royal Pact, Zagreus. This is from him. He must have been too busy pushing his rock to deliver it himself." },
				{
					Text = "Hera_OfferText",
				},
			},
			HeraTartarusBoss02 =
			{
				Name = "HeraTartarusBoss02",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03"},
				{ Cue = "/VO/Hera_0206",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The Old King sent you this. He said its from him and... Bouldy? Not sure who that it." },
					{
						Text = "Hera_OfferText",
					},
			},
			HeraTartarusBoss03 =
			{
				Name = "HeraTartarusBoss03",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03"},
				{ Cue = "/VO/Hera_0207",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Another delivery from your Tartarus friend. I should make Hermes do these, I have more important things to do." },
						{
							Text = "Hera_OfferText",
						},
			},
			HeraTartarusBoss04 =
			{
				Name = "HeraTartarusBoss04",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03"},
				{ Cue = "/VO/Hera_0208",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The Old King prepared if by chance you succeed bypassing the furies. I suppose this is another reward for you." },
					{
						Text = "Hera_OfferText",
					},
			},
			HeraTartarusBoss05 =
			{
				Name = "HeraTartarusBoss05",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03"},
				{ Cue = "/VO/Hera_0209",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The Old King thank me for helping you. So I wanted to clarify the situation. I said I would get you to our domain, and I only have one word. Hopefully, you'll get here soon." },
					{
						Text = "Hera_OfferText",
					},
			},
			HeraAsphodelBoss01 =
			{
				Name = "HeraAsphodelBoss01",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "B_Boss01", "B_Boss02" },
				{ Cue = "/VO/Hera_0210",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The Dryad knows the existence of the Royal Pact and wanted to prepare this to regain your strength after defeating that Lernaean Hydra. You can thank me for bringing it to you." },
					{
						Text = "Hera_OfferText",
					},
			},
			HeraAsphodelBoss02 =
			{
				Name = "HeraAsphodelBoss02",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "B_Boss01", "B_Boss02" },
				{ Cue = "/VO/Hera_0211",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I do not know if that meal is still hot since it took you forever to defeat that Lernaean Hydra, but here. The Dryad prepared it for you." },
						{
							Text = "Hera_OfferText",
						},
			},
			HeraAsphodelBoss03 =
			{
				Name = "HeraAsphodelBoss03",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "B_Boss01", "B_Boss02" },
				{ Cue = "/VO/Hera_0212",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Time to leave this inferno, Zagreus. But with the Royal Pact in hand, you get to leave it with some leftovers." },
					{
						Text = "Hera_OfferText",
					},
			},
			HeraAsphodelBoss04 =
			{
				Name = "HeraAsphodelBoss04",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "B_Boss01", "B_Boss02" },
				{ Cue = "/VO/Hera_0213",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The Dryad prepared some nurishment for you. Tell yourself that you will have any food you want once you are with us. This might be the motivation you were missing." },
					{
						Text = "Hera_OfferText",
					},
			},
			HeraAsphodelBoss05 =
			{
				Name = "HeraAsphodelBoss05",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "B_Boss01", "B_Boss02" },
				{ Cue = "/VO/Hera_0214",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "For as long as the Royal Pact is in your hand, the Dryad will bring you what you need. I'll make sure of it." },
					{
						Text = "Hera_OfferText",
					},
			},
			HeraElysiumBoss01 =
			{
				Name = "HeraElysiumBoss01",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "C_Boss01" },
				{ Cue = "/VO/Hera_0215",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Elysium host many heroes. Yet only one offered to help you. You can thank Patrocleus next time you see him." },
					{
						Text = "Hera_OfferText",
					},
			},
			HeraElysiumBoss02 =
			{
				Name = "HeraElysiumBoss02",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "C_Boss01" },
				{ Cue = "/VO/Hera_0216",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Seems like you defeated Theseus. Maybe you are not as worthless as I though. Patrocleus sent you this to celebrate your victory. I'll see you soon then." },
						{
							Text = "Hera_OfferText",
						},
			},
			HeraElysiumBoss03 =
			{
				Name = "HeraElysiumBoss03",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "C_Boss01" },
				{ Cue = "/VO/Hera_0217",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You are done with Elysium, I see. There's no way you can fail from here. Even Patrocleus pitch this in." },
					{
						Text = "Hera_OfferText",
					},
			},
			HeraElysiumBoss04 =
			{
				Name = "HeraElysiumBoss04",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "C_Boss01" },
				{ Cue = "/VO/Hera_0218",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Defeating Asterius, I understand. But Theseus, not bad. I suppose you are worthy of this delivery from Patrocleus." },
					{
						Text = "Hera_OfferText",
					},
			},
			HeraElysiumBoss05 =
			{
				Name = "HeraElysiumBoss05",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "C_Boss01" },
				{ Cue = "/VO/Hera_0219",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Defeating Theseus doesn't make you a hero. But I believe this is enough to keep receiving gifts from Patrocleus. As long as you have the Royal Pact, of course." },
					{
						Text = "Hera_OfferText",
					},
			},
			HeraGenericBoss01 =
			{
				Name = "HeraGenericBoss01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hera_0220",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "As you know, the Royal Pact is there for your acquaintance to help you in your quest. That being when you find yourself worthy of it." },
					{
						Text = "Hera_OfferText",
					},
			},
			HeraGenericBoss02 =
			{
				Name = "HeraGenericBoss02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hera_0221",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Someone wants the best for you. It's not me. I am just here to give it to you." },
					{
						Text = "Hera_OfferText",
					},
			},
			HeraGenericBoss03 =
			{
				Name = "HeraGenericBoss03",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hera_0222",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Uff{#PreviousFormat}. Why did I accept to create this Royal Pact? I have better things to do than deliver futile gift to you, Zagreus. " },
						{
							Text = "Hera_OfferText",
						},
			},
			HeraGenericBoss04 =
			{
				Name = "HeraGenericBoss04",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hera_0223",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Here's a farewell gift from one of your friend. It would be awkward if didn't really left your father's domain.  Don't you think?" },
					{
						Text = "Hera_OfferText",
					},
			},
			HeraGenericBoss05 =
			{
				Name = "HeraGenericBoss05",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hera_0224",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "What do you need to finally succeed your escape? Maybe this is what you needed?" },
						{
							Text = "Hera_OfferText",
						},
			},
			HeraGenericBoss06 =
			{
				Name = "HeraGenericBoss06",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hera_0225",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I should make Hestia do all the dirty work. Do I look like Hermes?" },
						{
							Text = "Hera_OfferText",
						},
			},
			HeraGenericBoss07 =
			{
				Name = "HeraGenericBoss07",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hera_0226",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I made sure your acquaintances keep following the Royal Pact commitment. They should keep giving you their support. As long as you have the Royal Pact at hand." },
					{
						Text = "Hera_OfferText",
					},
			},
			HeraRepeatBoss01 =
			{
				Name = "HeraRepeatBoss01",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactBossTextLines,
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hera_0227",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Are you done here? Good. I don't like people who keeps me waiting. This is for you." },
					{
						Text = "Hera_OfferText",
					},
			},
			HeraRepeatBoss02 =
			{
				Name = "HeraRepeatBoss02",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactBossTextLines,
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hera_0228",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "That was a worthy performance, I suppose. Take this and move on." },
					{
						Text = "Hera_OfferText",
					},
			},
			HeraRepeatBoss03 =
			{
				Name = "HeraRepeatBoss03",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactBossTextLines,
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hera_0229",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Won the battle, Zagreus? Now it's time to win the war. With this." },
					{
						Text = "Hera_OfferText",
					},
			},
			HeraRepeatBoss04 =
			{
				Name = "HeraRepeatBoss04",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactBossTextLines,
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hera_0230",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Another gift, Zagreus? They must be very annoyed of your failure to escape. I know I am." },
					{
						Text = "Hera_OfferText",
					},
			},
			HeraRepeatBoss05 =
			{
				Name = "HeraRepeatBoss05",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactBossTextLines,
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hera_0231",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You survive that? I don't see why you would fail from here. But again, you desapointed me before, Zagreus." },
					{
						Text = "Hera_OfferText",
					},
			},
			HeraRepeatBoss06 =
			{
				Name = "HeraRepeatBoss06",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactBossTextLines,
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hera_0232",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Another delivery from one of your acquaintances, Zagreus. Good. It means my Royal Pact is useful." },
					{
						Text = "Hera_OfferText",
					},
			},
			HeraRepeatBoss07 =
			{
				Name = "HeraRepeatBoss07",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactBossTextLines,
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hera_0233",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Another gift coming your way, Zagreus. I am sure you are going to waste them like the others." },
					{
						Text = "Hera_OfferText",
					},
			},
			-- NPC HESTIA			
			HestiaTartarusNPC01 =
			{
				Name = "HestiaTartarusNPC01",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "A_Story01",
				{ Cue = "/VO/Hestia_0302",
					Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I come with great news, Sisyphus You are allowed to help Zagreus without any consequences from Hades and his servants. Isn't that great?" },
			},
			HestiaTartarusNPC02 =
			{
				Name = "HestiaTartarusNPC02",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "A_Story01",
				{ Cue = "/VO/Hestia_0303",
					Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Sisyphus, now is time to show Zagreus all your appreciation through the Royal Pact. Share your compassion." },
			},
			HestiaTartarusNPC03 =
			{
				Name = "HestiaTartarusNPC03",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "A_Story01",
				{ Cue = "/VO/Hestia_0304",
					Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You can stop pushing your boulder for now, Sisyphus. It's time for give all your appreciation to Zagreus." },
			},
			HestiaTartarusNPC04 =
			{
				Name = "HestiaTartarusNPC04",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "A_Story01",
				{ Cue = "/VO/Hestia_0305",
					Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I believe you named your boulder? What a great show of affection. And with the Royal Pact, you can show Zagreus some more affection as well." },
			},
			HestiaTartarusNPC05 =
			{
				Name = "HestiaTartarusNPC05",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "A_Story01",
				{ Cue = "/VO/Hestia_0306",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Don't ever stop supporting your friends in need, Sisyphus. I know you'll do your best when the time is right." },
			},
			HestiaAsphodelNPC01 =
			{
				Name = "HestiaAsphodelNPC01",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "B_Story01",
				{ Cue = "/VO/Hestia_0307",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I heard that you prepare meals to Zagreus from time to time, Eurydice. Is there any chance you could do more this time? With the Royal Pact, you can spoil Zagreus as much as you want." },
			},
			HestiaAsphodelNPC02 =
			{
				Name = "HestiaAsphodelNPC02",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "B_Story01",
				{ Cue = "/VO/Hestia_0308",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "It is great to see someone else with a passion for cooking. Give your heart out this time, Eurydice. I also want to cook for this young one once he escapes." },
			},
			HestiaAsphodelNPC03 =
			{
				Name = "HestiaAsphodelNPC03",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "B_Story01",
				{ Cue = "/VO/Hestia_0309",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Your voice is spectacular, my dear. I feel your singing has already helped Zagreus in his crusade. But just to make sure, why not you cook something extra as well?" },
			},
			HestiaAsphodelNPC04 =
			{
				Name = "HestiaAsphodelNPC04",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "B_Story01",
				{ Cue = "/VO/Hestia_0310",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The heat doesn't seem to bother you, Eurydice. Another thing we have in common aside our excellent cooking skills. Speaking of which, it's time to serve Zagreus your best treats." },
			},
			HestiaAsphodelNPC05 =
			{
				Name = "HestiaAsphodelNPC05",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "B_Story01",
				{ Cue = "/VO/Hestia_0311",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Whenever Zagreus visits you with the Royal Pact, feel free to prepare a feast. I know I will once he finally join us." },
			},
			HestiaElysiumNPC01 =
			{
				Name = "HestiaElysiumNPC01",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "C_Story01",
				{ Cue = "/VO/Hestia_0312",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "... and then it means you can help him without angering Hades. Oh, Zagreus! I was just explaining to Patroclus the meaning behind the Royal Pact. I'll move on now." },
			},
			HestiaElysiumNPC02 =
			{
				Name = "HestiaElysiumNPC02",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "C_Story01",
				{ Cue = "/VO/Hestia_0313",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Even if you aren't invested in Zagreus' quest, you've been quite helpful to him so far. And this time you can aid him to your heart's content." },
			},
			HestiaElysiumNPC03 =
			{
				Name = "HestiaElysiumNPC03",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "C_Story01",
				{ Cue = "/VO/Hestia_0314",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "One day Zagreus will be up here with us. And you could be part of that happening, Patroclus. How lovely!" },
			},
			HestiaElysiumNPC04 =
			{
				Name = "HestiaElysiumNPC04",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "C_Story01",
				{ Cue = "/VO/Hestia_0315",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Zagreus is here to greet you, Patroclus? What a coincidence, he seems to have brought the Royal Pact with him. Why don't you give him a little something as a customary gift?" },
			},
			HestiaElysiumNPC05 =
			{
				Name = "HestiaElysiumNPC05",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRoom = "C_Story01",
				{ Cue = "/VO/Hestia_0316",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Patroclus, I don't know you well enough to know if you've finally found your true home, but let me tell you that helping others is a great way to find it. Keep spreading the love around." },
			},
			HestiaGenericNPC01 =
			{
				Name = "HestiaGenericNPC01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hestia_0317",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "When you think you have given enough to Zagreus, that's when you try to give even more. You'll see how grateful Zagreus is." },
			},
			HestiaGenericNPC02 =
			{
				Name = "HestiaGenericNPC02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hestia_0318",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "While Zagraeus has the Royal Pact, nobody can stop you from helping him on his way to Olympus. Not even Hades." },
			},
			HestiaGenericNPC03 =
			{
				Name = "HestiaGenericNPC03",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hestia_0319",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Could show your compassion for Zagreus? It appears that he still can't reach his family in Olympus. " },
			},
			HestiaGenericNPC04 =
			{
				Name = "HestiaGenericNPC04",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hestia_0320",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The Royal Pact is here once again. It is time to spread love and compassion towards all." },
			},
			HestiaGenericNPC05 =
			{
				Name = "HestiaGenericNPC05",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hestia_0321",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Young one. You are spoiled by all the gift you have received from your loved ones. Show your appreciation by finally joining us in Olympus." },
			},
			HestiaGenericNPC06 =
			{
				Name = "HestiaGenericNPC06",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hestia_0322",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You get a gift. You get a gift. Everyone gets a gift! I love it when we get to show how we truly feel." },
			},
			HestiaGenericNPC07 =
			{
				Name = "HestiaGenericNPC07",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HeraFirstNPC01",
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hestia_0323",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "No restrictiona this time! It is time to show what Zagreus means to us. Shower him with gifts!" },
			},
			HestiaRepeatNPC01 =
			{
				Name = "HestiaRepeatNPC01",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactNPCTextLines,
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hestia_0324",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Once again we are free to show our true selves and share our love with the ones we care about." },
			},
			HestiaRepeatNPC02 =
			{
				Name = "HestiaRepeatNPC02",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactNPCTextLines,
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hestia_0325",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Keep the gifts coming! Zagreus has the Royal Pact, which means no consequences from helping him escape!" },
			},
			HestiaRepeatNPC03 =
			{
				Name = "HestiaRepeatNPC03",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactNPCTextLines,
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hestia_0326",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Share the love. There won't be any retaliation from your actions. We made sure of it." },
			},
			HestiaRepeatNPC04 =
			{
				Name = "HestiaRepeatNPC04",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactNPCTextLines,
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hestia_0327",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Zagreus has the Royal Pact, and we all know what it means... Give away!" },
			},
			HestiaRepeatNPC05 =
			{
				Name = "HestiaRepeatNPC05",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactNPCTextLines,
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hestia_0328",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The Royal Pact is back in action. Now is not a time to limit ourselves." },
			},
			HestiaRepeatNPC06 =
			{
				Name = "HestiaRepeatNPC06",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactNPCTextLines,
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hestia_0329",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Nothing and no one can stop love from finding its way. Specially with the Royal Pact in Zagreus' hands." },
			},
			HestiaRepeatNPC07 =
			{
				Name = "HestiaRepeatNPC07",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactNPCTextLines,
				RequiredRooms = { "A_Story01", "B_Story01", "C_Story01" },
				{ Cue = "/VO/Hestia_0330",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I don't think I have to explain further -- the Royal Pact is here and so are you." },
			},
			-- Boss Hestia			
			HestiaFirstBoss01 =
			{
				Name = "HestiaFirstBoss01",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03"},
				{ Cue = "/VO/Hestia_0331",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "As the new owner of the the Royal Pact, you can get as much help from your friends without retaliation. Meaning someone meant to give you this before you move on." },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaTartarusBoss01 =
			{
				Name = "HestiaTartarusBoss01",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03"},
				{ Cue = "/VO/Hestia_0332",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Are you leaving Tartarus? I am sure you'll need this if you want to get past Asphodel." },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaTartarusBoss02 =
			{
				Name = "HestiaTartarusBoss02",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03"},
				{ Cue = "/VO/Hestia_0333",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I am happy to deliver this to you, young one. It's from Sisyphus and his... boulder? Huh." },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaTartarusBoss03 =
			{
				Name = "HestiaTartarusBoss03",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03"},
				{ Cue = "/VO/Hestia_0334",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You defeated the fury sisters? Well, it's a time to celebrate. Good thing Sisyphus is sending you this." },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaTartarusBoss04 =
			{
				Name = "HestiaTartarusBoss04",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03"},
				{ Cue = "/VO/Hestia_0335",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Another fight with the fury sisters? Sisyphus and I think you should try discussing your issues next time. Anyway, he sent you this." },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaTartarusBoss05 =
			{
				Name = "HestiaTartarusBoss05",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03"},
				{ Cue = "/VO/Hestia_0336",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I'll talk with Sisyphus and convince him to help you as much as he can. As long as you keep visiting him from time to time." },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaAsphodelBoss01 =
			{
				Name = "HestiaAsphodelBoss01",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "B_Boss01", "B_Boss02" },
				{ Cue = "/VO/Hestia_0337",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You fought the Lernaean Hydra and got out victorious? Well, it's a good thing Eurydice sent you this to celebrate." },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaAsphodelBoss02 =
			{
				Name = "HestiaAsphodelBoss02",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "B_Boss01", "B_Boss02" },
				{ Cue = "/VO/Hestia_0338",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Young one. You must be exhausted after such a fight. Have this a warm meal. It will fix you right up." },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaAsphodelBoss03 =
			{
				Name = "HestiaAsphodelBoss03",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "B_Boss01", "B_Boss02" },
				{ Cue = "/VO/Hestia_0339",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You might not get the chance to hear a victory song from Eurydice, young one. But she prepared this for you. How lucky!" },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaAsphodelBoss04 =
			{
				Name = "HestiaAsphodelBoss04",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "B_Boss01", "B_Boss02" },
				{ Cue = "/VO/Hestia_0340",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Seems like you are done with the heat of Asphodel. Let's hope you can cool down in Elysium." },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaAsphodelBoss05 =
			{
				Name = "HestiaAsphodelBoss05",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "B_Boss01", "B_Boss02" },
				{ Cue = "/VO/Hestia_0341",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I am happy to deliver anything Eurydice prepare to you, as long as you have the Royal Pact at hand. Wouldn't want to make anyone angry, would we?" },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaElysiumBoss01 =
			{
				Name = "HestiaElysiumBoss01",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "C_Boss01" },
				{ Cue = "/VO/Hestia_0342",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You missed Patroclus as you were visiting Elysium? Don't worry, he wishes you the best and sent you this." },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaElysiumBoss02 =
			{
				Name = "HestiaElysiumBoss02",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "C_Boss01" },
				{ Cue = "/VO/Hestia_0343",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Patroclus heard you have the Royal Pact and thought I could bring you this. How nice of him." },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaElysiumBoss03 =
			{
				Name = "HestiaElysiumBoss03",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "C_Boss01" },
				{ Cue = "/VO/Hestia_0344",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Did you just defeat Theseus and Asterius by your own? Even if I mislike violence, I am happy you got out safely." },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaElysiumBoss04 =
			{
				Name = "HestiaElysiumBoss04",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "C_Boss01" },
				{ Cue = "/VO/Hestia_0345",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Did you think Elysium was pretty, young one? Wait until you see Olympus. You can bring this if you want." },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaElysiumBoss05 =
			{
				Name = "HestiaElysiumBoss05",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "C_Boss01" },
				{ Cue = "/VO/Hestia_0346",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You didn't get to say farewell to Patroclus, young one. But fear not, he sent me this farewell gift for you." },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaGenericBoss01 =
			{
				Name = "HestiaGenericBoss01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hestia_0347",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You are never alone, young one. Others are there to help as well. Even more now that you have the Royal Pact in your possession." },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaGenericBoss02 =
			{
				Name = "HestiaGenericBoss02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hestia_0348",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I am happy to have convinced Hera to give you the Royal Pact. I hope you are enjoying the gifts!" },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaGenericBoss03 =
			{
				Name = "HestiaGenericBoss03",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hestia_0349",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I know this is usually Hermes' job to deliver messages, but I just like spreading love." },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaGenericBoss04 =
			{
				Name = "HestiaGenericBoss04",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hestia_0350",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "When you are good to others, others return the favor when you need it. I feel like you need it right now." },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaGenericBoss05 =
			{
				Name = "HestiaGenericBoss05",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hestia_0351",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I have another gift for you. When you do good to others, they always return the favor someday." },
						{
							Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
							Text = "Hestia_OfferText",
						},
			},
			HestiaGenericBoss06 =
			{
				Name = "HestiaGenericBoss06",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hestia_0352",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Were you thinking of someone just now? Because I am here to give you this. They were thinking of you too." },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaGenericBoss07 =
			{
				Name = "HestiaGenericBoss07",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLine = "HestiaFirstBoss01",
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hestia_0353",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I appreciate all the efforts you put into showing compassion to others. As you can see, others started to reciprocate your good deeds. Like with this gift." },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaRepeatBoss01 =
			{
				Name = "HestiaRepeatBoss01",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactBossTextLines,
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hestia_0354",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Take this before you leave, young one. With well wishes from your friends." },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaRepeatBoss02 =
			{
				Name = "HestiaRepeatBoss02",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactBossTextLines,
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hestia_0355",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I am very happy to deliver this to you, young one. I know you'll do good with it." },
						{
							Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
							Text = "Hestia_OfferText",
						},
			},
			HestiaRepeatBoss03 =
			{
				Name = "HestiaRepeatBoss03",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactBossTextLines,
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hestia_0356",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Were you expecting something from someone? Well, you're right. Here you go!" },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaRepeatBoss04 =
			{
				Name = "HestiaRepeatBoss04",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactBossTextLines,
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hestia_0357",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Gift coming right up. It's always good to see people getting along." },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaRepeatBoss05 =
			{
				Name = "HestiaRepeatBoss05",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactBossTextLines,
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hestia_0358",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You must have done something right, young one. This gift is for you." },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaRepeatBoss06 =
			{
				Name = "HestiaRepeatBoss06",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactBossTextLines,
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hestia_0359",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Good deeds are always rewarded. So here's your reward!" },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
			HestiaRepeatBoss07 =
			{
				Name = "HestiaRepeatBoss07",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.RoyalPactBossTextLines,
				RequiredRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "B_Boss01", "B_Boss02", "C_Boss01" },
				{ Cue = "/VO/Hestia_0360",
				Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Don't leave yet. I still haven't delivered this to you. Enjoy." },
					{
						Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
						Text = "Hestia_OfferText",
					},
			},
		},
		GiftGivenVoiceLines =
		{
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			PlayFromTarget = true,

			-- I'll try, Queen Hera.
			{ Cue = "/VO/ZagreusField_4972" },
		},

		--ShoutActivationSound = "/SFX/BurnDamage",
		ShoutVoiceLines =
		{
			Queue = "Interrupt",
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				RequiredKillEnemiesFound = true,
				RequiredFalseSpurnedGodName = "HeraUpgrade",

				-- All shall be defeated.
				{ Cue = "/VO/Hera_0139" },
				-- Bow before me!
				{ Cue = "/VO/Hera_0140" },
				-- Long live the queen.
				{ Cue = "/VO/Hera_0141" },
				-- Show these peasants.
				{ Cue = "/VO/Hera_0142" },
				-- Divine punishment.
				{ Cue = "/VO/Hera_0143" },
				-- Lowly subjects.
				{ Cue = "/VO/Hera_0144" },
				-- Pathetic.
				{ Cue = "/VO/Hera_0145" },
			},
			{
				BreakIfPlayed = true,
				PlayFromTarget = true,
				RandomRemaining = true,
				RequiredKillEnemiesFound = true,
				RequiredSpurnedGodName = "HeraUpgrade",
				RequireCurrentEncounterNotComplete = true,

				-- How could you!
				{ Cue = "/VO/Hera_0146" },
				-- But I am the queen.
				{ Cue = "/VO/Hera_0147" },
				-- This is mine, not yours.
				{ Cue = "/VO/Hera_0148" },
				-- You miserable—!
				{ Cue = "/VO/Hera_0149" },
				-- No!
				{ Cue = "/VO/Hera_0150" },
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

			-- Very generous of you, Queen Hera.
			{ Cue = "/VO/ZagreusField_4995" },
			-- All thanks to you, Queen Hera.
			{ Cue = "/VO/ZagreusField_4996" },
			-- Your grace.
			{ Cue = "/VO/ZagreusField_4997" },
		},

		DeathTauntVoiceLines =
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.25,
			NoTarget = true,

			-- Don't pick fights you cannot win, peasant.
			{ Cue = "/VO/Hera_0154" },
			-- Nothing. You are nothing.
			{ Cue = "/VO/Hera_0155" },
			-- Stay down for your own good.
			{ Cue = "/VO/Hera_0156" },
		},

		BlindBoxOpenedVoiceLines =
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.3,
			Source = { SubtitleColor = Color.HeraVoice },
			TriggerCooldowns = { "ZagreusBoonTakenSpeech" },

			-- You choose the queen. Huh.
			{ Cue = "/VO/Hera_0157" },
			-- You made it this far?
			{ Cue = "/VO/Hera_0158" },
			-- You probably won't last much longer.
			{ Cue = "/VO/Hera_0159" },
			-- The best choice you were offered, I suppose.
			{ Cue = "/VO/Hera_0160" },
			-- Fine, I'll bring you to the surface.
			{ Cue = "/VO/Hera_0161" },
		},
	}
	-- Duo lines
	OlympusLootData.ZeusUpgrade.DuoPickupTextLineSets.ZeusWithHera01 = {
		Name = "ZeusWithHera01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "GaugeLightningTrait",
		{ Cue = "/VO/Zeus_0271",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "If it isn't my beloved wife! How pleasant to find you here. Did you come help Zagreus on his quest. Since we are both here, why don't we join our forces?" },
		{ Cue = "/VO/Hera_0051",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			--StartSound = "/SFX/BurnDamage",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Hera_01", Portrait = "Portrait_Hera_Default_01",
			Text = "Zagreus? Oh the peasant from the underworld. huh. yes, indeedI came here to give my assistance. It isn't like I was stalking your every move in case you go somewhere you shouldn't. haha. that wouldbe crazy." },
	}
	OlympusLootData.PoseidonUpgrade.DuoPickupTextLineSets.PoseidonWithHera01 = {
		Name = "PoseidonWithHera01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "AuraRuptureTrait",
		{ Cue = "/VO/Poseidon_0271",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "Look Zagreus. The queen is here. And I know she doesn't put this much effort for anyone. You must be one important guest if she wants you to make it to here." },
		{ Cue = "/VO/Hera_0052",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			--StartSound = "/SFX/BurnDamage",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Hera_01", Portrait = "Portrait_Hera_Default_01",
			Text = "Zagreus is of no importance. But I committed myseld to his cause and I have one word. Maybe with your help, Poseidon, I can finally strike this one off my list." },
	}
	OlympusLootData.AthenaUpgrade.DuoPickupTextLineSets.AthenaWithHera01 = {
		Name = "AthenaWithHera01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "AuraExposedTrait",
		{ Cue = "/VO/Athena_0261",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "Hera. Us meeting here can't be a coincidence. I believe the best strategy is to combine our powers for Zagreus. " },
		{ Cue = "/VO/Hera_0053",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			--StartSound = "/SFX/BurnDamage",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Hera_01", Portrait = "Portrait_Hera_Default_01",
			Text = "Whatever it takes. As long as I don't have to come back here again. " },
	}
	OlympusLootData.AresUpgrade.DuoPickupTextLineSets.AresWithHera01 = {
		Name = "AresWithHera01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "KillMarkedTrait",
		{ Cue = "/VO/Ares_0261",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "Mother, I found Zagreus like you ask me to. I also prepared this, as per your instructions." },
		{ Cue = "/VO/Hera_0054",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			--StartSound = "/SFX/BurnDamage",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Hera_01", Portrait = "Portrait_Hera_Default_01",
			Text = "Very good, my son. I knew you were the only capable soul in this place. Zagreus take example on Ares and get results. We prepared this to give you a chance." },
	}
	OlympusLootData.AphroditeUpgrade.DuoPickupTextLineSets.AphroditeWithHera01 = {
		Name = "AphroditeWithHera01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "CurseLongerTrait",
		{ Cue = "/VO/Aphrodite_0271",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "You know what's funny, Hera? If the crown went to the most popular goddess, I would be queen by now." },
		{ Cue = "/VO/Hera_0055",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			--StartSound = "/SFX/BurnDamage",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Hera_01", Portrait = "Portrait_Hera_Default_01",
			Text = "Careful with your words, Aphrodite. The title of queen is not subject to some popularity contest; you wouldn't want to incur the queen's wrath." },
	}
	OlympusLootData.ArtemisUpgrade.DuoPickupTextLineSets.ArtemisWithHera01 = {
		Name = "ArtemisWithHera01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "BetterTrapsTrait",
		{ Cue = "/VO/Artemis_0271",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "Just wanted to let you know that Calisto is doing fine. Even if you transformed her into a bear. Now she's cured, and can transform at will. No thanks to you." },
		{ Cue = "/VO/Hera_0056",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			--StartSound = "/SFX/BurnDamage",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Hera_01", Portrait = "Portrait_Hera_Default_01",
			Text = "Ah, yes, Callisto. She's but one of many that made the mistake of getting too close to my husband, and I show no mercy for such a transgression. But the past is past, and right now, your queen needs you to help Zagreus escape from his father's domain." },
	}
	OlympusLootData.DionysusUpgrade.DuoPickupTextLineSets.DionysusWithHera01 = {
		Name = "DionysusWithHera01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "SlowerHangoverTrait",
		{ Cue = "/VO/Dionysus_0251",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "Zeus never wanted to let me know what happened to my mother. But as my step-mother, I figured you might know something that can help me find where she is." },
		{ Cue = "/VO/Hera_0057",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			--StartSound = "/SFX/BurnDamage",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Hera_01", Portrait = "Portrait_Hera_Default_01",
			Text = "Now is not the time. I have many deeds to complete and Zagreus here is waiting for us. Better focus on him for the time being." },
	}
	OlympusLootData.DemeterUpgrade.DuoPickupTextLineSets.DemeterWithHera01 = {
		Name = "DemeterWithHera01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "HeroicBoonsTrait",
		{ Cue = "/VO/Demeter_0271",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "Dear sister Hera. You took your sweet time to come help. I suppose the queen as always more important business than the underworld." },
		{ Cue = "/VO/Hera_0058",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			--StartSound = "/SFX/BurnDamage",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Hera_01", Portrait = "Portrait_Hera_Default_01",
			Text = "As Queen, my duties will always overcome yours, Sister Demeter. You should be honoured I come help him, while I am ask elsewhere." },
	}
	-- Other gods modification
	OlympusLootData.AphroditeUpgrade.LinkedUpgrades.CurseLongerTrait =
	{
		OneFromEachSet =
		{
			{ "HeraWeaponTrait", "HeraSecondaryTrait", "HeraRushTrait", "HeraRangedTrait" },
			{ "AphroditeWeaponTrait", "AphroditeSecondaryTrait", "AphroditeRushTrait", "AphroditeRangedTrait" }
		}
	}
	OlympusLootData.AthenaUpgrade.LinkedUpgrades.AuraExposedTrait =
	{
		OneFromEachSet =
		{
					{ "HeraWeaponTrait", "HeraSecondaryTrait", "HeraRushTrait", "HeraRangedTrait" },
					{ "AthenaWeaponTrait", "AthenaSecondaryTrait", "AthenaRushTrait", "AthenaRangedTrait",
						"ShieldLoadAmmo_AthenaRangedTrait" }
				}
	}
	OlympusLootData.ArtemisUpgrade.LinkedUpgrades.BetterTrapsTrait =
	{
		OneFromEachSet =
				{
					{ "HeraRushTrait" },
					{ "ArtemisWeaponTrait", "ArtemisSecondaryTrait", "ArtemisRangedTrait", "CritBonusTrait" }
				},
	}
	OlympusLootData.DionysusUpgrade.LinkedUpgrades.SlowerHangoverTrait =
	{
		OneFromEachSet =
				{
					{ "HeraWeaponTrait", "HeraSecondaryTrait", "HeraRushTrait", "HeraRangedTrait" },
					{ "DionysusWeaponTrait", "DionysusRushTrait", "DionysusSecondaryTrait", "DionysusShoutTrait" },
				}
	}
	OlympusLootData.PoseidonUpgrade.LinkedUpgrades.AuraRuptureTrait =
	{
		OneFromEachSet =
				{
					{ "HeraWeaponTrait", "HeraSecondaryTrait", "HeraRushTrait", "HeraRangedTrait" },
					{ "PoseidonWeaponTrait", "PoseidonSecondaryTrait", "PoseidonRushTrait", "PoseidonRangedTrait" },
				}
	}
	OlympusLootData.AresUpgrade.LinkedUpgrades.KillMarkedTrait =
	{
		OneFromEachSet =
				{
					{ "HeraWeaponTrait", "HeraSecondaryTrait", "HeraRushTrait", "HeraRangedTrait" },
					{ "AresWeaponTrait", "AresSecondaryTrait", "AresRushTrait", "AresRangedTrait" },
				},
	}
	OlympusLootData.DemeterUpgrade.LinkedUpgrades.HeroicBoonsTrait =
	{
		OneFromEachSet =
				{
					{ "HeraWeaponTrait", "HeraSecondaryTrait", "HeraRushTrait", "HeraRangedTrait" },
					{ "DemeterWeaponTrait", "DemeterRushTrait", "DemeterSecondaryTrait", "DemeterShoutTrait", "DemeterRangedTrait" },
				},
	}
	OlympusLootData.ZeusUpgrade.LinkedUpgrades.GaugeLightningTrait =
	{
		OneFromEachSet =
				{
					{ "HeraWeaponTrait", "HeraSecondaryTrait", "HeraRushTrait", "HeraRangedTrait" },
					{ "ZeusWeaponTrait", "ZeusRushTrait", "ZeusSecondaryTrait", "ZeusRangedTrait", "ZeusShoutTrait" },
				},
	}
	
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

	OlympusLootData.HermesUpgrade.SuperPriorityPickupTextLineSets.HermesExpectingHeraFail01 =
	{
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		MinRunsSinceSquelchedHermes = ConstantsData.SquelchedHermesRunCount,
		RequiredTextLines = { "HermesFirstPickUp" },
		RequiredFalseGodLoot = "HeraUpgrade",
		RequiredTrait = "ForceHeraBoonTrait",
		--EndVoiceLines = GlobalVoiceLines.RushedHermesVoiceLines,
		-- Insolent fool.
		EndCue = "/VO/Hera_0098",
		EndWait = 0.45,
		{ Cue = "/VO/Hermes_0242",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "Boss, you know how you're the boss? Let me tell you, Hera is everyone's boss, and she—" },
		{ Cue = "/VO/Hera_0097",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			--StartSound = "/SFX/BurnDamage",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Hera_01", Portrait = "Portrait_Hera_Default_01",
			Text = "What do you think you're doing, Hermes?! Are you trying to intercept my message to young Zagreus?! I hope not..." },
		{ Cue = "/VO/Hermes_0243",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
			Text = "Hi, boss Hera! No, no, umm, I was just passing by... I have somewhere to go, so, see you soon boss Zagr— Nevermind." },
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
		{ Cue = "/VO/Hermes_0244",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
			Text = "Hera isn't here, is she? No? Good. Quick, take this, and you'd better keep going before we get caught again." },
	}

	-- Gift Section
	local OlympusGiftOrdering = ModUtil.Entangled.ModData(GiftOrdering)
	local OlympusGiftData = ModUtil.Entangled.ModData(GiftData)
	table.insert(OlympusGiftOrdering, 22, "ForceHeraBoonTrait")

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
		UnlockGameStateRequirements = { RequiredTextLines = { "HeraBackstory05" } }
	}
	-- Multi Gods compatibility
	--if ModUtil.Mods.Data["HestiaExtra"] ~= nil then 
		OlympusLootData.HeraUpgrade.LinkedUpgrades.EnhancedNPCTrait =
		{
			OneFromEachSet =
			{
				{ "HeraWeaponTrait", "HeraSecondaryTrait", "HeraRushTrait", "HeraRangedTrait" },
				{ "HestiaWeaponTrait", "HestiaDashTrait", "HestiaSecondaryTrait", "HestiaRangedTrait", "HestiaShoutTrait" },
			},
		}
		OlympusLootData.HestiaUpgrade.LinkedUpgrades.EnhancedNPCTrait =
		{
			OneFromEachSet =
					{
						{ "HeraWeaponTrait", "HeraSecondaryTrait", "HeraRushTrait", "HeraRangedTrait" },
						{ "HestiaWeaponTrait", "HestiaDashTrait", "HestiaSecondaryTrait", "HestiaRangedTrait", "HestiaShoutTrait" },
					},
		}
        OlympusLootData.HeraUpgrade.DuoPickupTextLineSets.HeraWithHestia01 = {
            Name = "HeraWithHestia01",
            PlayOnce = true,
            PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
            HasTraitNameInRoom = "EnhancedNPCTrait",
			--PostLineFunctionName = "ChangeLootSource", PostLineFunctionArgs = { NewSource = "HeraUpgrade", },
            { Cue = "/VO/Hera_0050",
                StartSound = "/Leftovers/World Sounds/MapZoomInShort",
                Text = "Drop the act, sister. Being kind to all won't bring peace. It will only allow the vile creature to stab you in the back. Better safe than sorry." },
            { Cue = "/VO/Hestia_0300",
                PortraitExitWait = 0.35,
                PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
                StartSound = "/SFX/BurnDamage",
                EndSound = "/Leftovers/World Sounds/MapZoomInShort",
                Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
                Text = "Always seeing what could go wrong. Not every soul wants to take you down if you open your heart. Zagreus, once you are here could you give us your opinion on the matter? Until then, we prepared this for you together." },
        }
        OlympusLootData.HestiaUpgrade.DuoPickupTextLineSets.HestiaWithHera01 = {
            Name = "HestiaWithHera01",
            PlayOnce = true,
            PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
            HasTraitNameInRoom = "EnhancedNPCTrait",
            { Cue = "/VO/Hestia_0301",
                StartSound = "/Leftovers/World Sounds/MapZoomInShort",
                Text = "Sister. How long as it been? I am sure you remember why I left. That doesn't mean I can't help others when they are in need. Like this poor soul here." },
            { Cue = "/VO/Hera_0060",
                PortraitExitWait = 0.35,
                PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
                --StartSound = "/SFX/BurnDamage",
                EndSound = "/Leftovers/World Sounds/MapZoomInShort",
                Speaker = "NPC_Hera_01", Portrait = "Portrait_Hera_Default_01",
                Text = "I do remember. And you are family after all, I'll allow you to continue helping Zagreus. He doesnt seem to be able to do much on his own. " },
        }
        OlympusLootData.HeraUpgrade.FreePassVoiceLines = {
            HeraFreePass01 =
            {
                PlayOnce = true,
                Name = "HeraFreePass01",
                { Cue = "/VO/Hera_0371",
                    PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
                    StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
                    Text = "But... My sister isn't even an Olympian anymore. And I am your Queen! Zagreus. You poor misguided soul. I... suppose I forgive you for your ignorance. {#DialogueItalicFormat}Hmph{#PreviousFormat}." },
            },
        }
		table.insert(HeraExtra.GodsList, "Hestia")		
	--end
	--if ModUtil.Mods.Data["ApolloExtra"] ~= nil then
        OlympusLootData.HeraUpgrade.LinkedUpgrades.AuraBlindTrait =
		{
			OneFromEachSet =
			{
				{ "HeraWeaponTrait", "HeraSecondaryTrait", "HeraRushTrait", "HeraRangedTrait" },
				{ "ApolloWeaponTrait", "ApolloDashTrait", "ApolloSecondaryTrait", "ApolloRangedTrait", "ApolloShoutTrait" },
			},
		}
		OlympusLootData.ApolloUpgrade.LinkedUpgrades.AuraBlindTrait =
		{
			OneFromEachSet =
					{
						{ "HeraWeaponTrait", "HeraSecondaryTrait", "HeraRushTrait", "HeraRangedTrait" },
						{ "ApolloWeaponTrait", "ApolloDashTrait", "ApolloSecondaryTrait", "ApolloRangedTrait", "ApolloShoutTrait" },
					},
		}
        OlympusLootData.HeraUpgrade.DuoPickupTextLineSets.HeraWithApollo01 = {
            Name = "HeraWithApollo01",
            PlayOnce = true,
            PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
            HasTraitNameInRoom = "BlindAuraTrait",
            { Cue = "/VO/Hera_0049",
                StartSound = "/Leftovers/World Sounds/MapZoomInShort",
                Text = "Apollo... You are the last I wanted to see, but if you came this far to see me. You have my attention." },
            { Cue = "/VO/Apollo_0310",
                PortraitExitWait = 0.35,
                PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
                StartSound = "/SFX/LyreMedium",
                EndSound = "/Leftovers/World Sounds/MapZoomInShort",
                Speaker = "NPC_Apollo_01", Portrait = "Portrait_Apollo_Default_01",
                Text = "Really? Why would I want to see you? After what you did to my mother... I came here for Zagzag. Now help me or go." },
        }
        OlympusLootData.ApolloUpgrade.DuoPickupTextLineSets.ApolloWithHera01 = {
            Name = "ApolloWithHera01",
            PlayOnce = true,
            PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
            HasTraitNameInRoom = "BlindAuraTrait",
            { Cue = "/VO/Apollo_0311",
                StartSound = "/Leftovers/World Sounds/MapZoomInShort",
                Text = "I don't think Zagzag needs your help, Hera. As long as he's got me, he can keep the rhythm." },
            { Cue = "/VO/Hera_0059",
                PortraitExitWait = 0.35,
                PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
                --StartSound = "/SFX/BurnDamage",
                EndSound = "/Leftovers/World Sounds/MapZoomInShort",
                Speaker = "NPC_Hera_01", Portrait = "Portrait_Hera_Default_01",
                Text = "It is Queen Hera, to you. I said I would help him escape, and I keep my word. Now help me or go away." },
        }
		table.insert(HeraExtra.GodsList, "Apollo")
    --end
	--if ModUtil.Mods.Data["ApolloExtra"] ~= nil and ModUtil.Mods.Data["HestiaExtra"] ~= nil then
		OlympusQuestData.SynergyUpgrades2 =
		{
			Name = "SynergyUpgrades2",
			InheritFrom = { "DefaultQuestItem" },
			RewardResourceName = "SuperGiftPoints",
			RewardResourceAmount = 15,
			Spacing = 28,
			FontSize = 18,
			MaxEntriesPerColumn = 14,
			UnlockGameStateRequirements =
			{
				RequiredAnyTraitsTaken =
				{
					"FamedDuetTrait",
					"WarSongTrait",
					"MasterBoltTrait",
					"HyacinthTrait",
					"BlindDurationTrait",
					"DamageReduceDistanceTrait",
					"SeaChanteyTrait",
					"MasterLobDionysusTrait",
					"MasterLobApolloTrait",

					"FreeHealthTrait",
					"MoreTrapDamageTrait",
					"ExplosionTrait",
					"FullHealBossTrait",
					"FoesNumberDamageTrait",
					"ChillFireTrait",
					"PullZeusCastTrait",
					"FishingRewardExtraTrait",

					"ShoutMoreHealTrait",

					"CurseLongerTrait",
					"AuraExposedTrait",
					"BetterTrapsTrait",
					"SlowerHangoverTrait",
					"AuraRuptureTrait",
					"KillMarkedTrait",
					"HeroicBoonsTrait",
					"GaugeLightningTrait",

					"AuraBlindTrait",
					"EnhancedNPCTrait",
				}
			},
			CompleteGameStateRequirements =
			{
				RequiredTraitsTaken =
				{
					"FamedDuetTrait",
					"WarSongTrait",
					"MasterBoltTrait",
					"HyacinthTrait",
					"BlindDurationTrait",
					"DamageReduceDistanceTrait",
					"SeaChanteyTrait",
					"MasterLobDionysusTrait",
					"MasterLobApolloTrait",

					"FreeHealthTrait",
					"MoreTrapDamageTrait",
					"ExplosionTrait",
					"FullHealBossTrait",
					"FoesNumberDamageTrait",
					"ChillFireTrait",
					"PullZeusCastTrait",
					"FishingRewardExtraTrait",

					"ShoutMoreHealTrait",

					"CurseLongerTrait",
					"AuraExposedTrait",
					"BetterTrapsTrait",
					"SlowerHangoverTrait",
					"AuraRuptureTrait",
					"KillMarkedTrait",
					"HeroicBoonsTrait",
					"GaugeLightningTrait",
					
					"AuraBlindTrait",
					"EnhancedNPCTrait",
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

				-- The Olympians aren't all on the best of terms I guess.
				{ Cue = "/VO/ZagreusHome_2980" },
			},
		}
		table.insert(OlympusQuestOrderData, 34, "SynergyUpgrades2")
	--end
	-- FUNCTIONS
	ModUtil.Path.Wrap("CommenceSuperMove",
		function(baseFunc)
			local isHeraShout = false
			for i, traitData in pairs(CurrentRun.Hero.Traits) do
				if traitData.Name == "HeraShoutTrait" and CurrentRun.Hero.HeraShout.NextHeraGod then
					--local otherTrait = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = CurrentRun.Hero.HeraShout.NextHeraGod.."ShoutTrait", Rarity = traitData.Rarity })
					local otherTrait = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = CurrentRun.Hero.HeraShout.NextHeraGod.."ShoutTrait", Rarity = traitData.Rarity })
					if otherTrait.AddShout ~= nil then
						isHeraShout = true
						traitData.AddShout.FunctionName = otherTrait.AddShout.FunctionName
						traitData.AddShout.MaxDurationMultiplier = otherTrait.AddShout.MaxDurationMultiplier
						--[[if otherTrait.AddShout.MaxDurationMultiplier ~= nil then
							traitData.AddShout.MaxDurationMultiplier = otherTrait.AddShout.MaxDurationMultiplier
						else
							traitData.AddShout.MaxDurationMultiplier = nil
						end]]
						if type(otherTrait.AddShout.SuperDuration) == "table" then
							traitData.AddShout.SuperDuration = otherTrait.AddShout.SuperDuration.BaseValue
						else
							traitData.AddShout.SuperDuration = otherTrait.AddShout.SuperDuration
						end
					end
					if otherTrait.EndShout ~= nil then
						traitData.EndShout = otherTrait.EndShout
					end
					--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(traitData.Rarity))
				end
			end
			baseFunc()
			if isHeraShout then
				CurrentRun.Hero.HeraShout.GetNext = true
				UpdateHeraShoutIcon()
			end

		end
	)
	function SetupHeraNextShout()
		if CurrentRun.Hero.HeraShout == nil then
			CurrentRun.Hero.HeraShout = {}
		end		
		CurrentRun.Hero.HeraShout.GetNext = true
		UpdateHeraShoutIcon()
	end
	function UpdateHeraShoutIcon()	
		if CurrentRun.Hero.HeraShout == nil then
			CurrentRun.Hero.HeraShout = {}
		end	
		if CurrentRun.Hero.HeraShout.GetNext then
			CurrentRun.Hero.HeraShout.NextHeraGod = HeraExtra.GodsList[RandomNumber(TableLength(HeraExtra.GodsList))]
			CurrentRun.Hero.HeraShout.GetNext = false
		end
		if CurrentRun.Hero.HeraShout.NextHeraGod then
			if CurrentRun.Hero.HeraShout.Icon then
				CurrentRun.Hero.HeraShout.PreviousIcon = CurrentRun.Hero.HeraShout.Icon
			end
			if ScreenAnchors.TraitAnchorIds then
				CurrentRun.Hero.HeraShout.Icon = CreateScreenComponent({ Name = "HeraShout"..CurrentRun.Hero.HeraShout.NextHeraGod.."Icon", Group = "Combat_Menu_TraitTray", X = 75, Y = 700 })
				table.insert( ScreenAnchors.TraitAnchorIds, CurrentRun.Hero.HeraShout.Icon.Id )
			end
			for i, trait in pairs(CurrentRun.Hero.Traits) do
				if trait.Name == "HeraShoutTrait" then
					trait.CurrentGod = CurrentRun.Hero.HeraShout.NextHeraGod
				end
			end
		end
		if CurrentRun.Hero.HeraShout.PreviousIcon then
			Destroy({ Id = CurrentRun.Hero.HeraShout.PreviousIcon.Id})
			CurrentRun.Hero.HeraShout.PreviousIcon = nil
		end
	end
	ModUtil.Path.Wrap("StopSuper",
		function(baseFunc)
			baseFunc()
			if HeroHasTrait("HeraShoutTrait") then
				if CurrentRun.Hero.HeraShout == nil then
					CurrentRun.Hero.HeraShout = {}
				end	
				UpdateHeraShoutIcon()
			end
		end
	)
	ModUtil.Path.Wrap("RemoveTraitData",
		function(baseFunc, unit, trait, args)
			baseFunc(unit, trait, args)
			if CurrentRun and CurrentRun.Hero.HeraShout then
				if CurrentRun.Hero.HeraShout.Icon then
					Destroy({Id = CurrentRun.Hero.HeraShout.Icon.Id})
				end
			end
		end
	)
	

	ModUtil.Path.Wrap("ShowTraitUI",
		function(baseFunc)
			baseFunc()
			if HeroHasTrait("HeraShoutTrait") then
				UpdateHeraShoutIcon()
			end
			if HeroHasTrait("HeraRushTrait") then
				ShowTrapDashUI()
			end
			--[[if CurrentRun.Hero.HeraShout and CurrentRun.Hero.HeraShout.NextHeraGod then
				CurrentRun.Hero.HeraShout.Icon = CreateScreenComponent({ Name = "HeraShout"..CurrentRun.Hero.HeraShout.NextHeraGod.."Icon", Group = "Combat_Menu_TraitTray", X = 75, Y = 700 })
				table.insert( ScreenAnchors.TraitAnchorIds, CurrentRun.Hero.HeraShout.Icon.Id )
			end]]
		end
	)	
	ModUtil.Path.Wrap("HideTraitUI",
		function(baseFunc)
			baseFunc()
			if HeroHasTrait("HeraRushTrait") then
				HideTrapDashUI()
			end
		end
	)		
	ModUtil.Path.Wrap("DestroyTraitUI",
		function(baseFunc)
			baseFunc()
			if HeroHasTrait("HeraRushTrait") then
				DestroyTrapDashUI()
			end
		end
	)	
	ModUtil.Path.Wrap("CreateLoot",
		function(baseFunc, args)
			local loot = baseFunc(args)
			if args.Cost ~= nil and args.Cost > 0 then
				loot.OriginalCost = args.Cost
			end
			return loot
		end
	)
	ModUtil.Path.Wrap("CreateConsumableItemFromData",
		function(baseFunc, consumableId, consumableItem, costOverride, args )
			local OriginalCost = nil
			if costOverride then
				OriginalCost = costOverride
			elseif consumableItem.Cost ~= nil and consumableItem.Cost > 0 then
				OriginalCost = consumableItem.Cost
			end
			local consumable = baseFunc(consumableId, consumableItem, costOverride, args)
			if OriginalCost then
				consumable.OriginalCost = OriginalCost
			end
			return consumable
		end
	)
	
	ModUtil.Path.Wrap("UpdateCostText",
		function(baseFunc, object, textExists)
			baseFunc(object, textExists)
			if object.OriginalCost ~= nil and object.OriginalCost > 0 and textExists then
				local costMultiplier = 1 + ( GetNumMetaUpgrades( "ShopPricesShrineUpgrade" ) * ( MetaUpgradeData.ShopPricesShrineUpgrade.ChangeValue - 1 ) )
				costMultiplier = costMultiplier * GetTotalHeroTraitValue("StoreCostMultiplier", {IsMultiplier = true})
				object.Cost = round( object.OriginalCost * costMultiplier )
				ModifyTextBox({ Id = object.ObjectId, Text = "Shop_ItemCost", LuaKey = "TempTextData", LuaValue = { Amount = object.Cost } })
			end
		end
	)
	
	ModUtil.Path.Wrap("HandleStorePurchase",
		function(baseFunc, screen, button)
			baseFunc(screen, button)
			if screen.Components["PurchaseButton"..button.Index.."DiscountIcon"] ~= nil then
				Destroy({ Id = screen.Components["PurchaseButton"..button.Index.."DiscountIcon"].Id })
				screen.Components["PurchaseButton"..button.Index.."DiscountIcon"] = nil
			end
			if screen.Components["SacrificeButton"..button.Index] ~= nil then
				Destroy({ Id = screen.Components["SacrificeButton"..button.Index].Id })
				screen.Components["SacrificeButton"..button.Index] = nil
			end
		end
	)

	--[[ModUtil.Path.Wrap("FillInShopOptions",
		function(baseFunc, args)
			local store = baseFunc(args)
			if store.StoreOptions ~= nil and HeroHasTrait("DiscountHeraTrait") then
				local itemIndex = RandomNumber(TableLength(store.StoreOptions))
				store.StoreOptions[itemIndex].HasDiscount = true
				ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Discount on: " .. itemIndex))
				CurrentRun.CurrentRoom.Store.
			end
			return store
		end
	)]]
	ModUtil.Path.Wrap("GetProcessedTraitData",
		function(baseFunc, args)
			local traitData = baseFunc(args)
			if HeroHasTrait("DiscountHeraTrait") and CurrentRun and CurrentRun.CurrentRoom and CurrentRun.CurrentRoom.Store and CurrentRun.CurrentRoom.Store.DiscountItem and CurrentRun.CurrentRoom.Store.DiscountItem == traitData.Name then
				traitData.Cost = round(traitData.Cost * 0.8)
				if traitData.HealthCost then
					traitData.HealthCost = round(traitData.HealthCost * 0.8)
				end
				traitData.HasDiscount = true
			end
			return traitData
		end
	)
	ModUtil.Path.Wrap("GetRampedConsumableData",
		function(baseFunc, consumableData, rarity)
			local rampedData = baseFunc(consumableData, rarity)
			if HeroHasTrait("DiscountHeraTrait") and CurrentRun and CurrentRun.CurrentRoom and CurrentRun.CurrentRoom.Store and CurrentRun.CurrentRoom.Store.DiscountItem and CurrentRun.CurrentRoom.Store.DiscountItem == rampedData.Name then
				rampedData.Cost = round(rampedData.Cost * 0.8)
				if rampedData.HealthCost then
					rampedData.HealthCost = round(rampedData.HealthCost * 0.8)
				end
				rampedData.HasDiscount = true
			end
			return rampedData
		end
	)
	ModUtil.Path.Wrap("CreateStoreButtons",
		function(baseFunc)
			for i, data in pairs( CurrentRun.CurrentRoom.Store.StoreOptions ) do
				if data.Processed then 
					data.Processed = false
				end
			end
			if HeroHasTrait("DiscountHeraTrait") and CurrentRun.CurrentRoom.Store.StoreOptions ~= nil and CurrentRun.CurrentRoom.Store.DiscountItem == nil then
				local numButtons = StoreData.WorldShop.MaxOffers
				if numButtons == nil then
					numButtons = 0
					for i, groupData in pairs(StoreData.WorldShop.GroupsOf) do
						numButtons = numButtons + groupData.Offers
					end
				end
				local itemIndex = RandomNumber(numButtons)
				CurrentRun.CurrentRoom.Store.DiscountItem = CurrentRun.CurrentRoom.Store.StoreOptions[itemIndex].Name
			end
			
			baseFunc()
			local itemLocationStartY = ShopUI.ShopItemStartY
			local itemLocationYSpacer = ShopUI.ShopItemSpacerY
			local itemLocationMaxY = itemLocationStartY + 4 * itemLocationYSpacer
			local itemLocationStartX = ShopUI.ShopItemStartX
			local itemLocationXSpacer = ShopUI.ShopItemSpacerX
			local itemLocationMaxX = itemLocationStartX + 1 * itemLocationXSpacer

			local itemLocationX = itemLocationStartX
			local itemLocationY = itemLocationStartY
			for i, button in pairs( CurrentRun.CurrentRoom.Store.Buttons ) do
				local upgradeData = CurrentRun.CurrentRoom.Store.StoreOptions[button.Index]
				if HeroHasTrait("HealthAsObolTrait") and upgradeData.Cost ~= nil and upgradeData.Cost > 0 and upgradeData.HealFraction == nil and upgradeData.HealthCost == nil and upgradeData.Processed and upgradeData.SacrificeCost == nil then
					upgradeData.SacrificeCost = round(upgradeData.Cost*0.9)
					if upgradeData.SacrificeCost <= 0 then
						upgradeData.SacrificeCost = 1
					end
				end
				if HeroHasTrait("DiscountHeraTrait") and upgradeData.HasDiscount then
					local offsetY = ShopUI.ShopItemStartY + ShopUI.ShopItemSpacerY * (button.Index-1) - 65
					local offsetX = ShopUI.ShopItemStartX + 210
					CurrentRun.CurrentRoom.Store.Screen.Components["PurchaseButton"..button.Index.."DiscountIcon"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu", X = offsetX , Y = offsetY })
					SetAnimation({ DestinationId = CurrentRun.CurrentRoom.Store.Screen.Components["PurchaseButton"..button.Index.."DiscountIcon"].Id, Name = "DiscountItemIcon" })
				end
				if upgradeData.SacrificeCost then
					local costFontColor = Color.CostAffordable
					if upgradeData.SacrificeCost ~= nil and upgradeData.SacrificeCost > 0 and (CurrentRun.Hero.Health+1) < upgradeData.SacrificeCost then
						costFontColor = Color.CostUnaffordable
					end
					local itemSacrificeButtonKey = "SacrificeButton"..button.Index
					local components = CurrentRun.CurrentRoom.Store.Screen.Components
					local costString = upgradeData.SacrificeCost .. " @GUI\\Icons\\Life_Small"
					local offset = { X = 320, Y = -350 + button.Index * itemLocationYSpacer }
					components[itemSacrificeButtonKey] = CreateScreenComponent({ Name = "BoonSlot1", Scale = 0.2, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "Combat_Menu"})
					Attach({ Id = components[itemSacrificeButtonKey].Id, DestinationId = components.ShopBackground.Id, OffsetX = offset.X, OffsetY = offset.Y })	
					components[itemSacrificeButtonKey].Data = upgradeData
					components[itemSacrificeButtonKey].OnPressedFunctionName = "SacrificeButtonPressed"
					components[itemSacrificeButtonKey].SacrificeCost = upgradeData.SacrificeCost
					components[itemSacrificeButtonKey].Index = button.Index
					button.SacrificeId = components[itemSacrificeButtonKey].Id
					CreateTextBox({ Id = components[itemSacrificeButtonKey].Id, Text = costString,
						FontSize = 28, OffsetX = 0, OffsetY = 0, Width = 720, Font = "AlegreyaSansSCRegular",
						ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Left",
						Color = costFontColor
					})
					itemLocationX = itemLocationX + itemLocationXSpacer
					if itemLocationX >= itemLocationMaxX then
						itemLocationX = itemLocationStartX
						itemLocationY = itemLocationY + itemLocationYSpacer
					end
				end
			end
		end
	)
	ModUtil.Path.Wrap("DestroyStoreButtons",
		function(baseFunc)
			local components = CurrentRun.CurrentRoom.Store.Screen.Components
			local toDestroy = {}
			for index = 1, StoreData.RoomShop.MaxOffers do
				local destroyIndexes = { "SacrificeButton"..index }
				for i, indexName in pairs( destroyIndexes ) do
					if components[indexName] then
						table.insert(toDestroy, components[indexName].Id)
					end
				end
			end
			Destroy({ Ids = toDestroy })
			baseFunc()
		end
	)
	
	function SacrificeButtonPressed(screen, button)
		local upgradeData = button.Data

		if upgradeData.SacrificeCost and (CurrentRun.Hero.Health+1) <= upgradeData.SacrificeCost then
			Flash({ Id = screen.Components["PurchaseButton".. button.Index].Id, Speed = 2, MinFraction = 1, MaxFraction = 0.0, Color = Color.CostUnaffordable, ExpireAfterCycle = true })
			CantAffordPresentation( upgradeData )
			return
		end
	
		if upgradeData.Cost ~= nil and upgradeData.Cost > 0 and upgradeData.PurchaseRequirements ~= nil and not IsGameStateEligible( CurrentRun, upgradeData.PurchaseRequirements ) then
			CantPurchasePresentation( screen.Components["PurchaseButton".. button.Index] )
			return
		end
	
		StorePurchasePresentation( screen, button, upgradeData )
	
		CurrentRun.WellPurchases =  (CurrentRun.WellPurchases or 0) + 1
	
		SacrificeHealth({ SacrificeHealth = upgradeData.SacrificeCost, MinHealth = 1 })
		local values = {}
		for i, value in pairs (CurrentRun.CurrentRoom.Store.StoreOptions) do
			if value.Name == upgradeData.Name then
				CurrentRun.CurrentRoom.Store.StoreOptions[i] = nil
			end
		end
	
		if upgradeData.Type == "Trait" then
			AddTraitToHero({ TraitData = upgradeData })
			IncrementTableValue( GameState.ItemInteractions, upgradeData.Name )
			CheckCodexUnlock( "Items", upgradeData.Name )
		elseif upgradeData.Type == "Consumable" then
			local consumableName = upgradeData.Name
			local consumableId = SpawnObstacle({ Name = consumableName, DestinationId = CurrentRun.Hero.ObjectId, Group = "Standing" })
			local consumable = CreateConsumableItemFromData( consumableId, upgradeData, 0 )
		end
	
		if upgradeData.CloseScreen then
			thread( PlayRandomEligibleVoiceLines, { upgradeData.PurchasedLines } )
			CloseStoreScreen( screen, button )
			return
		end
		if screen.Components["PurchaseButton"..button.Index.."QuestIcon"] ~= nil then
			Destroy({ Id = screen.Components["PurchaseButton"..button.Index.."QuestIcon"].Id })
			screen.Components["PurchaseButton"..button.Index.."QuestIcon"] = nil
		end
	
		Destroy({ Id = screen.Components["PurchaseButtonTitle".. button.Index].Id })
		screen.Components["PurchaseButtonTitle".. button.Index] = nil
	
		CreateAnimation({ Name = "BoonSlotPurchase", DestinationId = screen.Components["Backing".. button.Index].Id, OffsetX = -380 })
	
		Destroy({ Id = screen.Components["PurchaseButton".. button.Index].Id })
		screen.Components["PurchaseButton".. button.Index] = nil
	
		Destroy({ Id = screen.Components["Icon".. button.Index].Id })
		screen.Components["Icon".. button.Index] = nil

		if screen.Components["PurchaseButton"..button.Index.."DiscountIcon"] ~= nil then
			Destroy({ Id = screen.Components["PurchaseButton"..button.Index.."DiscountIcon"].Id })
			screen.Components["PurchaseButton"..button.Index.."DiscountIcon"] = nil
		end
		if screen.Components["SacrificeButton"..button.Index] ~= nil then
			Destroy({ Id = screen.Components["SacrificeButton"..button.Index].Id })
			screen.Components["SacrificeButton"..button.Index] = nil
		end
		thread( PlayRandomEligibleVoiceLines, { upgradeData.PurchasedLines } )
	
		for i, button in pairs(CurrentRun.CurrentRoom.Store.Buttons) do
			UpdateCostButton( button )
		end
	end
	ModUtil.Path.Wrap("UpdateCostButton",
		function(baseFunc, button)			
			baseFunc(button)
			if button == nil then
				return
			end
		
			UpdateSacrificeCostButton(button)
		end
	)
	function UpdateSacrificeCostButton(button)
		if button.SacrificeId then
			local upgradeData = button.Data
			local costColor = Color.CostAffordable
			if (CurrentRun.Hero.Health+1) < upgradeData.SacrificeCost then
				costColor = Color.CostUnaffordable
			end
			ModifyTextBox({ Id = button.SacrificeId, ColorTarget = costColor, ColorDuration = 0.2 })
		end
	end
	ModUtil.Path.Wrap("AddTraitData",
		function(baseFunc, unit, traitData, args)
			baseFunc(unit, traitData, args)
			local once = false
			if TraitData[traitData.Name].RefreshShop and TraitData[traitData.Name].RefreshShop.OnAdd and not once then
				RefreshStoreItems()
				once = true
			end
		end
	)
	ModUtil.Path.Wrap("RemoveTrait",
		function(baseFunc, unit, traitName, args)
			baseFunc(unit, traitName, args)
			local once = false
			if traitName ~= nil and TraitData[traitName] ~= nil and TraitData[traitName].RefreshShop and TraitData[traitName].RefreshShop.OnRemove and not once then
				RefreshStoreItems()
				once = true
			end
			if traitName == "AuraRuptureTrait" then
				StopAnimation({ Name = "AuraFx-Rupture", DestinationId = CurrentRun.Hero.ObjectId })			
			end
			if traitName ==  "StatusOverTimeTrait" then
				StopAnimation({ Name = "AuraFx-Legendary", DestinationId = CurrentRun.Hero.ObjectId })			
			end
			if traitName ==  "AuraExposedTrait" then
				StopAnimation({ Name = "AuraFx-Exposed", DestinationId = CurrentRun.Hero.ObjectId })		
			end
			if traitName == "AuraBlindTrait" then
				StopAnimation({ Name = "AuraFx-Blind", DestinationId = CurrentRun.Hero.ObjectId })		
			end
		end
	)
	ModUtil.Path.Wrap("GenerateSellTraitShop",
		function(baseFunc, currentRun, currentRoom, args)
			if args and args.ExclusionNames then
				table.insert(args.ExclusionNames, "MoreRewardTrait")
				table.insert(args.ExclusionNames, "HeroicBoonsTrait")
			else
				args = { ExclusionNames = { "MoreRewardTrait", "HeroicBoonsTrait" } }
			end
			baseFunc(currentRun, currentRoom, args)
		end
	)
	ModUtil.Path.Wrap("GetTraitValue",
		function(baseFunc, traitData)
			local value = baseFunc(traitData)
			return round(value * GetTotalHeroTraitValue("SellTraitCostMultiplier", { IsMultiplier = true }))
		end
	)
	ModUtil.Path.Wrap("FindAllSwappableBreakables",
		function(baseFunc)
			local legalBreakables = {}
			local multiplier = GetTotalHeroTraitValue("UrnsRewardMultiplier", { IsMultiplier = true })
			for id, enemy in pairs(ActiveEnemies) do
				if enemy.ValueOptions ~= nil then
					legalBreakables[id] = enemy
					if HeroHasTrait("MoreRewardTrait") then
						for id2, options in pairs(legalBreakables[id].ValueOptions) do
							if options.MoneyDropOnDeath.MinValue then
								options.MoneyDropOnDeath.MinValue = round(options.MoneyDropOnDeath.MinValue * multiplier)
								options.MoneyDropOnDeath.MaxValue = options.MoneyDropOnDeath.MinValue
							end
						end
					end
				end
			end
			return legalBreakables
		end
	)

	
	function AddJealousyOnRandomFoe()
		thread(JealousyOnRandomFoeThread, {})
	end
	function JealousyOnRandomFoeThread()
		local randomEnemy = nil
		local time = GetTotalHeroTraitValue("JealousyIntervalApply")
		while CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead do
			wait(time, "RoomThread") --0.01
			if CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead and IsCombatEncounterActive( CurrentRun ) then
				for _, id in pairs( GetClosestIds({ Id = CurrentRun.Hero.ObjectId, DestinationName = "EnemyTeam", IgnoreInvulnerable = true, IgnoreHomingIneligible = true, Distance = 9999 })) do
					randomEnemy = ActiveEnemies[id]
					if randomEnemy ~= nil and not randomEnemy.IsDead and (not randomEnemy.ActiveEffects or not randomEnemy.ActiveEffects.JealousyCurse) then
						ApplyEffectFromWeapon({ WeaponName = "JealousyCurseApplicator", EffectName = "JealousyCurse", Id = CurrentRun.Hero.ObjectId, DestinationId = randomEnemy.ObjectId })
						break
					end
				end
			end
		end
	end
	function EnvyCurseAttackApply(triggerArgs)
		local victim = triggerArgs.TriggeredByTable
		ClearEffect({ Id = victim.ObjectId, Name = "EnvyCurseSecondary" })	
		victim.EnvyNextDamage = {Activated = true, Source = "Attack"}
		ApplyEnvyCurse(victim, triggerArgs.Modifier)
	end
	function EnvyCurseSecondaryApply(triggerArgs)
		local victim = triggerArgs.TriggeredByTable
		ClearEffect({ Id = victim.ObjectId, Name = "EnvyCurseAttack" })	
		victim.EnvyNextDamage = {Activated = true, Source = "Secondary"}
		ApplyEnvyCurse(victim, triggerArgs.Modifier)
	end
	function ApplyEnvyCurse(victim, amount)
		victim.EnvyNextDamage.Amount = amount
		if HeroHasTrait("EnvyBurstTrait") then
			if not victim.EnvyFlag or ( victim.EnvyFlag and RandomFloat(0, 1) <= GetTotalHeroTraitValue("EnvyBurstChance")) then
				ApplyEffectFromWeapon({ WeaponName = "BurstEnvyApplicator", EffectName = "BurstEnvy", Id = CurrentRun.Hero.ObjectId, DestinationId = victim.ObjectId })
			end
		end
	end
	function EnvyCurseAttackClear(triggerArgs)
		local victim = triggerArgs.TriggeredByTable
		if victim.ActiveEffects["EnvyCurseSecondary"] == nil then
			victim.EnvyNextDamage = nil	
		end
	end
	function EnvyCurseSecondaryClear(triggerArgs)
		local victim = triggerArgs.TriggeredByTable
		if victim.ActiveEffects["EnvyCurseAttack"] == nil then
			victim.EnvyNextDamage = nil	
		end
	end
	function JealousyCurseApply(triggerArgs)
		local victim = triggerArgs.TriggeredByTable
		victim.JealousyModifier = triggerArgs.Modifier
	end	
	function JealousyCurseClear(triggerArgs)
		local victim = triggerArgs.TriggeredByTable
		victim.JealousyModifier = nil
	end	
	ModUtil.Hades.Triggers.OnEffectApply.Combat[1].Call = ModUtil.Wrap(ModUtil.Hades.Triggers.OnEffectApply.Combat[1].Call,
		function( baseFunc, triggerArgs )
			local victim = triggerArgs.TriggeredByTable
			if not victim or ( victim.IsDead and victim ~= CurrentRun.Hero ) then
				return
			end
			if victim.EnvyNextDamage ~= nil and triggerArgs.IsVulnerabilityEffect then
				local isLow = true
				if triggerArgs.EffectName ~= "EnvyCurseAttack" and triggerArgs.EffectName ~= "EnvyCurseSecondary" then
					victim.EnvyNextDamage.Amount = victim.EnvyNextDamage.Amount + victim.EnvyNextDamage.Amount
					isLow = false
				end
				Damage(victim, { EffectName = "EnvyCurse"..victim.EnvyNextDamage.Source, DamageAmount = victim.EnvyNextDamage.Amount, Silent = false, PureDamage = false })	
				if victim and victim.EnvyNextDamage ~= nil and victim.ObjectId and triggerArgs.EffectName ~= "EnvyCurseAttack" and triggerArgs.EffectName ~= "EnvyCurseSecondary" then
					ClearEffect({ Id = victim.ObjectId, Name = "EnvyCurse"..victim.EnvyNextDamage.Source })	
				end
				if victim and HasEffect({ Id = victim.ObjectId, EffectName = "BurstEnvy" }) then
					if isLow then
						FireWeaponFromUnit({ Weapon = "LowBurstEnvyWeapon", Id = CurrentRun.Hero.ObjectId,
						DestinationId = victim.ObjectId, FireFromTarget = true })
					else
						FireWeaponFromUnit({ Weapon = "HighBurstEnvyWeapon", Id = CurrentRun.Hero.ObjectId,
						DestinationId = victim.ObjectId, FireFromTarget = true })
					end
					ClearEffect({ Id = victim.ObjectId, Name = "BurstEnvy" })
				end
				if victim then
					victim.EnvyFlag = true
					victim.EnvyNextDamage = nil		
				end				
			end
			baseFunc(triggerArgs)
			
		end
	)
	-- HESTIA DUO
	
	ModUtil.Path.Wrap("LeaveRoom",
		function(baseFunc, currentRun, door)
			if HeroHasTrait("EnhancedNPCTrait") and CheckHeraDialog() then
				StartHeraHestiaDialog()
				return
			end
			baseFunc(currentRun, door)
		end
	)
	ModUtil.Path.Wrap("DisplayTextLine",
		function(baseFunc, screen, source, line, parentLine)
			if HeroHasTrait("EnhancedNPCTrait") then
				if Contains({"Sisyphus_OfferText01"}, line.Text) and not CurrentRun.HeraTartarusStory and not CurrentRun.HeraTartarusBoss then
					line.Choices = nil
					line.Text = "Sisyphus_EnhancedOfferText01"
					line.PostLineThreadedFunctionName = "EnhancedSisyphusBuff"
					CurrentRun.HeraTartarusStory = true
				end
				if Contains({"Eurydice_OfferText01","Eurydice_OfferText02","Eurydice_OfferText03"}, line.Text) and not CurrentRun.HeraAsphodelStory and not CurrentRun.HeraAsphodelBoss then
					line.Choices = nil
					line.Text = "Eurydice_EnhancedOfferText01"
					line.PostLineThreadedFunctionName = "EurydiceBuff"
					line.PostLineFunctionArgs = { BoonRarity = true, StackTraits = true, BuffFutureRarity = true }
					CurrentRun.HeraAsphodelStory = true
				end
				if Contains({"Patroclus_OfferText02","Patroclus_OfferText03","Patroclus_OfferText04","Patroclus_OfferText05"}, line.Text) and not CurrentRun.HeraElysiumStory and not CurrentRun.HeraElysiumBoss then
					line.Choices = nil
					line.Text = "Patroclus_EnhancedOfferText01"
					line.PostLineThreadedFunctionName = "EnhancedPatroclusBuff"
					CurrentRun.HeraElysiumStory = true
				end
				if "Hera_OfferText" == line.Text or "Hestia_OfferText" == line.Text then
					if Contains({"A_Boss01","A_Boss02","A_Boss03",}, CurrentRun.CurrentRoom.Name) and not CurrentRun.HeraTartarusStory and not CurrentRun.HeraTartarusBoss then
						line.Text = line.Text.."01"
						line.Choices = PresetEventArgs.HeraSisyphusBenefitChoices
						CurrentRun.CurrentRoom.SkipLoadNextMap = true
						CurrentRun.HeraTartarusBoss = true
					end
					if Contains({"B_Boss01", "B_Boss02"}, CurrentRun.CurrentRoom.Name) and not CurrentRun.HeraAsphodelStory and not CurrentRun.HeraAsphodelBoss then
						line.Text = line.Text.."02"
						line.Choices = PresetEventArgs.HeraEurydiceBenefitChoices
						CurrentRun.CurrentRoom.SkipLoadNextMap = true
						CurrentRun.HeraAsphodelBoss = true
					end
					if Contains({"C_Boss01"}, CurrentRun.CurrentRoom.Name) and not CurrentRun.HeraElysiumStory and not CurrentRun.HeraElysiumBoss then
						line.Text = line.Text.."03"
						line.Choices = PresetEventArgs.HeraPatroclusBenefitChoices
						CurrentRun.CurrentRoom.SkipLoadNextMap = true
						CurrentRun.HeraElysiumBoss = true
					end
				end
			end
			return baseFunc(screen, source, line, parentLine)
		end
	)
	function HeraSisyphusHealing( source, args )
		DropHealth( "RoomRewardHealDrop", CurrentRun.Hero.ObjectId, 130, 0, true )
	end	
	function HeraSisyphusMetaPoints( source, args )
		local consumableId = SpawnObstacle({ Name = "RoomRewardMetaPointDrop", DestinationId = CurrentRun.Hero.ObjectId, Group = "Standing" })
		local cost = 0
		local consumable = CreateConsumableItem( consumableId, "RoomRewardMetaPointDrop", cost )
		local amount = RandomInt( 50, 60 )
		consumable.AddResources = { MetaPoints = round( amount * CalculateMetaPointMultiplier() ) }
		ApplyUpwardForce({ Id = consumableId, Speed = 700 })
		--local forceAngle = GetAngleBetween({ Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
		--ApplyForce({ Id = consumableId, Speed = 100, Angle = forceAngle, SelfApplied = true })
	end	
	function HeraSisyphusMoney( source, args )
		local amount = RandomInt(  101, 115 )
		local moneyMultiplier = GetTotalHeroTraitValue( "MoneyMultiplier", { IsMultiplier = true } )
		amount = round( amount * moneyMultiplier )
		thread( GushMoney, { Amount = amount, LocationId = CurrentRun.Hero.ObjectId, Radius = 100, Source = "Sisyphus", } )
	end
	function EnhancedSisyphusBuff(source, args)
		DropHealth( "RoomRewardHealDrop", source.ObjectId, 130, 0, true )
		wait(0.5)
		local consumableId = SpawnObstacle({ Name = "RoomRewardMetaPointDrop", DestinationId = source.ObjectId, Group = "Standing" })
		local cost = 0
		local consumable = CreateConsumableItem( consumableId, "RoomRewardMetaPointDrop", cost )
		local amount = RandomInt( source.MetaPointMin, source.MetaPointMax )
		consumable.AddResources = { MetaPoints = round( amount * CalculateMetaPointMultiplier() ) }
		SetAnimation({ DestinationId = source.ObjectId, Name = "SisyphusElbowing" })
		ApplyUpwardForce({ Id = consumableId, Speed = 700 })
		local forceAngle = GetAngleBetween({ Id = source.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
		ApplyForce({ Id = consumableId, Speed = 100, Angle = forceAngle, SelfApplied = true })
		wait(0.5)		
		local amount = RandomInt(  source.MoneyMin, source.MoneyMax )
		local moneyMultiplier = GetTotalHeroTraitValue( "MoneyMultiplier", { IsMultiplier = true } )
		amount = round( amount * moneyMultiplier )
		thread( GushMoney, { Amount = amount, LocationId = CurrentRun.Hero.ObjectId, Radius = 100, Source = "Sisyphus", } )
	end
	function EnhancedEurydiceBuff( source, args )
		EurydicePreBuffPresentation( source, args )
		if args.BoonRarity ~= nil then
			AddRarityToTraits( source, { NumTraits = 2 } )
		end
		wait(0.5)
		if args.StackTraits ~= nil then
			AddStackToTraits( source, { NumTraits = 4, NumStacks = 1 } )
		end
		wait(0.5)
		if args.BuffFutureRarity ~= nil then
			AddSuperRarityBoost()
		end
		EurydicePostBuffPresentation( source, args )
	end
	function EnhancedPatroclusBuff( source, args )
		local args = args or {}
		PatroclusPreBuffPresentation( source, args )
		if IsGameStateEligible( CurrentRun, { RequiredActiveMetaUpgrade = "ExtraChanceMetaUpgrade", RequiredMetaUpgradeSelected = "ExtraChanceMetaUpgrade" }) then
			AddLastStand({
				Count = 100,
				Icon = "ExtraLifeStyx",
				WeaponName = "LastStandMetaUpgradeShield",
				HealFraction = 0.5
			})
		elseif IsGameStateEligible( CurrentRun, { RequiredActiveMetaUpgrade = "ExtraChanceReplenishMetaUpgrade", RequiredMetaUpgradeSelected = "ExtraChanceReplenishMetaUpgrade" }) then
			AddTraitToHero({ TraitData = TraitData["UpgradedTemporaryLastStandHealTrait"] })
			args.TraitName = "UpgradedTemporaryLastStandHealTrait"
		end
		wait(0.5)
		AddTraitToHero({ TraitData = TraitData["TemporaryDoorHealTrait_Patroclus"] })
		wait(0.5)
		AddTraitToHero({ TraitData = TraitData["TemporaryImprovedWeaponTrait_Patroclus"] })
		PatroclusPostBuffPresentation( source, args )
	end
	function CheckHeraDialog()
		if Contains({"A_Boss01","A_Boss02","A_Boss03",}, CurrentRun.CurrentRoom.Name) and CurrentRun.HeraTartarusBoss or
		   Contains({"B_Boss01"}, CurrentRun.CurrentRoom.Name) and CurrentRun.HeraAsphodelBoss or
		   Contains({"C_Boss01"}, CurrentRun.CurrentRoom.Name) and CurrentRun.HeraElysiumBoss then
			CurrentRun.CurrentRoom.SkipLoadNextMap = false
		end
		return Contains({"A_Story01", "A_Boss01","A_Boss02","A_Boss03",}, CurrentRun.CurrentRoom.Name) and not CurrentRun.HeraTartarusStory and not CurrentRun.HeraTartarusBoss or 
			   Contains({"B_Story01", "B_Boss01"}, CurrentRun.CurrentRoom.Name) and not CurrentRun.HeraAsphodelStory and not CurrentRun.HeraAsphodelBoss or 
			   Contains({"C_Story01", "C_Boss01"}, CurrentRun.CurrentRoom.Name) and not CurrentRun.HeraElysiumStory and not CurrentRun.HeraElysiumBoss
	end
	function StartHeraHestiaDialog()
		SetPlayerInvulnerable( "HandleLootPickup" )
		local lootData = LootData["HeraUpgrade"]
		local loot = DeepCopyTable( lootData )
		PlayRandomRemainingTextLines( loot, loot.RoyalPactVoiceLines )
		SetPlayerVulnerable( "HandleLootPickup" )
	end
	function EncounterStory()
		if HeroHasTrait("EnhancedNPCTrait") and CheckHeraDialog() then
			StartHeraHestiaDialog()
		end
	end
	function DoFullSuperDualPresentation( traitData, secondGod )
		local currentRun = CurrentRun
		SetPlayerInvulnerable( "Super" )
		--AddInputBlock({ Name = "SuperPresentation" })
		HideCombatUI("SuperPresentation")
	
		thread( DoRumble, { { RightTriggerStart = 2, RightTriggerStrengthFraction = 0.3, RightTriggerFrequencyFraction = 0.15, RightTriggerTimeout = 0.25, }, } )
	
		SetAnimation({ Name = "ZagreusWrath", DestinationId = currentRun.Hero.ObjectId })
		CreateAnimation({ Name = "ZagreusWrathFire", DestinationId = CurrentRun.Hero.ObjectId, Color = LootData[traitData.God .. "Upgrade"].LootColor })
	
		ApplyEffectFromWeapon({ Id = currentRun.Hero.ObjectId, DestinationId = currentRun.Hero.ObjectId, WeaponName = "ShoutSelfSlow", EffectName = "ShoutSelfSlow", AutoEquip = true })
		Rumble({ RightFraction = 0.7, Duration = 0.3 })
		FocusCamera({ Fraction = 0.9, Duration = 0.02, ZoomType = "Ease" })
		AdjustFullscreenBloom({ Name = "LightningStrike", Duration = 0 })
		AdjustFullscreenBloom({ Name = "WrathPhase2", Duration = 0.1, Delay = 0 })
		AdjustRadialBlurStrength({ Fraction = 1.5, Duration = 0 })
		AdjustRadialBlurDistance({ Fraction = 0.125, Duration = 0 })
		AdjustRadialBlurStrength({ Fraction = 0, Duration = 0.03, Delay=0 })
		AdjustRadialBlurDistance({ Fraction = 0, Duration = 0.03, Delay=0 })
	
		--SetThingProperty({ Property = "TimeModifierFraction", Value = 1.0, DestinationId = currentRun.Hero.ObjectId, DataValue = false })
	
		--SetSoundCueValue({ Id = GetMixingId({}), Names = { "LowPass" }, Value = 1.0, Duration = 0.25 })
		-- super activation sound
		--PlaySound({ Name = "/Leftovers/SFX/MeteorStrikeShort" })
		--PlaySound({ Name = "/VO/ZagreusEmotes/EmotePoweringUp", Id = currentRun.Hero.ObjectId })
	
		-- audio
		local sourceName = traitData.God.."Upgrade"
		thread( PlayVoiceLines, traitData.FullSuperActivatedVoiceLines or HeroVoiceLines.FullSuperActivatedVoiceLines )
		PlaySound({ Name = LootData[sourceName].ShoutActivationSound or "/Leftovers/SFX/MeteorStrikeShort" })
		AudioState.ShoutEffectSoundId = PlaySound({ Name = "/SFX/WrathStartNoEmote", Id = CurrentRun.Hero.ObjectId })
	
		--thread( PlayVoiceLines, HeroVoiceLines.SuperActivatedVoiceLines )
		local wrathPresentationOffsetY = 150
		local wrathStreak = SpawnObstacle({ Name = "BlankObstacle", DestinationId = currentRun.Hero.ObjectId, Group = "Combat_UI" })
		Teleport({ Id = wrathStreak, OffsetX = (1920/2), OffsetY = 800 + wrathPresentationOffsetY })
		DrawScreenRelative({ Ids = { wrathStreak } })
		CreateAnimation({ Name = "WrathPresentationStreak", DestinationId = wrathStreak, Color = LootData[traitData.God .. "Upgrade"].LootColor })
	
		local godImage = SpawnObstacle({ Name = "BlankObstacle", DestinationId = currentRun.Hero.ObjectId, Group = "Combat_Menu" })
		Teleport({ Id = godImage, OffsetX = -300, OffsetY = (1080/2) + 80 + wrathPresentationOffsetY })
		DrawScreenRelative({ Ids = { godImage } })
		CreateAnimation({ Name = LootData[traitData.God .. "Upgrade"].WrathPortrait, DestinationId = godImage, Scale = "1.0" })

		local godImage2 = SpawnObstacle({ Name = "BlankObstacle", DestinationId = currentRun.Hero.ObjectId, Group = "Combat_UI" })
		Teleport({ Id = godImage2, OffsetX = 60, OffsetY = (1080/2) + 90 + wrathPresentationOffsetY })
		DrawScreenRelative({ Ids = { godImage2 } })
		CreateAnimation({ Name = LootData[secondGod .. "Upgrade"].WrathPortrait, DestinationId = godImage2, Scale = "1.0" })
		
		local wrathStreakFront = SpawnObstacle({ Name = "BlankObstacle", DestinationId = currentRun.Hero.ObjectId, Group = "Combat_Menu_Overlay" })
		Teleport({ Id = wrathStreakFront, OffsetX = 900, OffsetY = 1150 + wrathPresentationOffsetY })
		DrawScreenRelative({ Ids = { wrathStreakFront } })
		CreateAnimation({ Name = "WrathPresentationBottomDivider", DestinationId = wrathStreakFront, Scale = "1.25", Color = LootData[traitData.God .. "Upgrade"].LootColor })
	
		local wrathVignette = SpawnObstacle({ Name = "BlankObstacle", DestinationId = currentRun.Hero.ObjectId, Group = "FX_Standing_Top" })
		CreateAnimation({ Name = "WrathVignette", DestinationId = wrathVignette, Color = LootData[traitData.God .. "Upgrade"].LootColor })
	
		thread( ShoutSlow )
	
		ScreenAnchors.FullscreenAlertFxAnchor = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Scripting", X = ScreenCenterX, Y = ScreenCenterY })
	
		local fullscreenAlertDisplacementFx = SpawnObstacle({ Name = "FullscreenAlertDisplace", Group = "FX_Displacement", DestinationId = ScreenAnchors.FullscreenAlertFxAnchor})
		DrawScreenRelative({ Id = fullscreenAlertDisplacementFx })
	
		Move({ Id = godImage, Angle = 8, Distance = 800, Duration = 0.2, EaseIn = 0.2, EaseOut = 1, TimeModifierFraction = 0 })
		Move({ Id = godImage2, Angle = 8, Distance = 800, Duration = 0.2, EaseIn = 0.2, EaseOut = 1, TimeModifierFraction = 0 })
		Move({ Id = wrathStreakFront, Angle = 8, Distance = 200, Duration = 0.5, EaseIn = 0.9, EaseOut = 1, TimeModifierFraction = 0 })
		--Move({ Id = playerImage, Angle = 170, Speed = 50, TimeModifierFraction = 0 })
	
		SetColor({ Id = godImage, Color = {0, 0, 0, 1}, Duration = 0.05, TimeModifierFraction = 0 })
		SetColor({ Id = godImage2, Color = {0, 0, 0, 1}, Duration = 0.1, TimeModifierFraction = 0 })
		SetColor({ Id = wrathVignette, Color = {0, 0, 0, 0.4}, Duration = 0.05, TimeModifierFraction = 0 })
	
		waitScreenTime( 0.25, RoomThreadName )
		AdjustFullscreenBloom({ Name = "Off", Duration = 0.1, Delay = 0 })
		Move({ Id = godImage, Angle = 8, Distance = 100, Duration = 1, EaseIn = 0.5, EaseOut = 0.5, TimeModifierFraction = 0 })
		Move({ Id = godImage2, Angle = 8, Distance = 100, Duration = 1, EaseIn = 0.5, EaseOut = 0.5, TimeModifierFraction = 0 })
		Move({ Id = wrathStreakFront, Angle = 8, Distance = 25, Duration = 1, EaseIn = 0.5, EaseOut = 1, TimeModifierFraction = 0 })
	
		waitScreenTime( 0.35, RoomThreadName )
		thread( PlayVoiceLines, LootData[sourceName].ShoutVoiceLines, false, LootData[sourceName] )
	
		waitScreenTime( 0.35, RoomThreadName )
		FocusCamera({ Fraction = currentRun.CurrentRoom.ZoomFraction or 0.75, Duration = 0.25, ZoomType = "Ease" })
	
		-- Move({ Id = godImage, Angle = 170, Speed = 7000, TimeModifierFraction = 0 })
		PlaySound({ Name = "/Leftovers/Menu Sounds/TextReveal3" })
	
		waitScreenTime( 0.1, RoomThreadName )
		--SetThingProperty({ Property = "TimeModifierFraction", Value = 1.0, DestinationId = currentRun.Hero.ObjectId, DataValue = false })
	
		SetAlpha({ Id = godImage, Fraction = 0, Duration = 0.12, TimeModifierFraction = 0 })
		SetAlpha({ Id = godImage2, Fraction = 0, Duration = 0.12, TimeModifierFraction = 0 })
		SetAlpha({ Id = wrathVignette, Fraction = 0, Duration = 0.06 })
		SetAlpha({ Id = fullscreenAlertDisplacementFx, Fraction = 0, Duration = 0.06 })
		thread( CleanUpShoutPresentation, fullscreenAlertDisplacementFx)
	
		for k, enemy in pairs( ActiveEnemies ) do
			if enemy.WrathReactionVoiceLines ~= nil then
				local currentHealthFraction = enemy.Health / enemy.MaxHealth
				if enemy.WrathReactionVoiceLines ~= nil and currentHealthFraction > (enemy.WrathReactionVoiceLineMinHealthThreshold or 0) then
					thread( PlayVoiceLines, enemy.WrathReactionVoiceLines, nil, enemy )
				end
			end
		end
	
		thread( CrowdReactionPresentation, { AnimationNames = { "StatusIconOhBoy", "StatusIconFear" }, Sound = "/SFX/TheseusCrowdCheer", ReactionChance = 0.08, Requirements = { RequiredRoom = "C_Boss01" }, Delay = 1, Shake = true, RadialBlur = true } )
	
		ShowCombatUI("SuperPresentation")
		--RemoveInputBlock({ Name = "SuperPresentation" })
		thread( RevulnerablePlayerAfterShout )
	end
	-- HealthAsObolTrait Mechanic
	OnControlPressed{ "Gift",
		function( triggerArgs )
			local target = triggerArgs.UseTarget
			if target == nil then
				return
			end
			if target.SacrificeCost then
				if target.Rarity then
					local interactionBlocked = false
					if not CurrentRun.CurrentRoom.AlwaysAllowLootInteraction then
						for enemyId, enemy in pairs( ActiveEnemies ) do
							if enemy.BlocksLootInteraction then
								interactionBlocked = true
								break
								--DebugPrint({ Text = "blockedByEnemy = "..GetTableString( nil, enemy ) })
							end
						end
					end

					if interactionBlocked then
						local userTable = triggerArgs.TriggeredByTable
						thread( CannotUseLootPresentation, triggerArgs.triggeredById, userTable )
						CreateAnimation({ Name = "ShoutFlare", DestinationId = triggerArgs.triggeredById })
					elseif not AreScreensActive() then		
						if target.SacrificeCost ~= nil and CurrentRun.Hero.Health < target.SacrificeCost then
							CantAffordPresentation( target )
							return
						end
						if target.SacrificeCost ~= nil and target.SacrificeCost > 0 then
							target.Purchased = true
							SacrificeHealth({ SacrificeHealth = target.SacrificeCost, MinHealth = 1 })
							RemoveStoreItem({Name = target.Name, IsBoon = true, BoonRaritiesOverride = target.BoonRaritiesOverride, StackNum = target.StackNum })
							PlaySound({ Name = "/Leftovers/Menu Sounds/StoreBuyingItem" })
							thread( PlayVoiceLines, GlobalVoiceLines.PurchasedConsumableVoiceLines, true )
						end

						if target.RarityBoosted then
							UseHeroTraitsWithValue("RarityBonus", true )
						end
						
						SetPlayerInvulnerable( "HandleLootPickupAnimation" )
						PlayInteractAnimation( triggerArgs.triggeredById )
						HandleLootPickup( CurrentRun, target )
						SetPlayerVulnerable( "HandleLootPickupAnimation" )
					end
				else
					if CurrentRun.Hero.HandlingDeath then
						return
					end
			
					if target.SacrificeCost ~= nil and CurrentRun.Hero.Health < (target.SacrificeCost+1) then
						CantAffordPresentation( target )
						return
					end
					if target.SacrificeCost ~= nil and target.SacrificeCost > 0 and target.PurchaseRequirements ~= nil and not IsGameStateEligible( CurrentRun, target.PurchaseRequirements ) then
						CantPurchaseWorldItemPresentation( target )
						return
					end
					target.UseSacrifice = true
					PurchaseConsumableItem( CurrentRun, target, triggerArgs )
				end
			end
		end
	}
	ModUtil.Path.Wrap("HandleLootPickup",
		function(baseFunc, currentRun, loot)
			if loot.SacrificeId then
				Destroy({ Id = loot.SacrificeId })
			end
			baseFunc(currentRun, loot)
		end
	)
	ModUtil.Path.Wrap("PurchaseConsumableItem",
		function(baseFunc, currentRun, consumableItem, args)
			if consumableItem.SacrificeCost and consumableItem.UseSacrifice then
				ConsumableUsedPresentation( currentRun, consumableItem, args )
		
				IncrementTableValue( GameState.ItemInteractions, consumableItem.Name )
				CheckCodexUnlock( "Items", GetGenusName( consumableItem ))
		
				currentRun.ConsumableRecord[consumableItem.Name] = (currentRun.ConsumableRecord[consumableItem.Name] or 0) + 1
		
				RemoveStoreItem({ Name = consumableItem.Name })
				SacrificeHealth({ SacrificeHealth = consumableItem.SacrificeCost, MinHealth = 1 })
				consumableItem.IgnorePurchase = true
			end
			if consumableItem.SacrificeId then
				Destroy({ Id = consumableItem.SacrificeId })
			end
			baseFunc(currentRun, consumableItem, args)
		end
	)
	ModUtil.Path.Wrap("SpawnStoreItemInWorld",
		function(baseFunc, itemData, kitId)
			local spawnedItem = nil
			if itemData.Name == "StackUpgradeDrop" then
				spawnedItem = CreateStackLoot({ SpawnPoint = kitId, Cost = GetProcessedValue( ConsumableData.StackUpgradeDrop.Cost ), DoesNotBlockExit = true, SuppressSpawnSounds = true, } )
			elseif itemData.Name == "WeaponUpgradeDrop" then
				spawnedItem = CreateWeaponLoot({ SpawnPoint = kitId, Cost = itemData.Cost or GetProcessedValue( ConsumableData.WeaponUpgradeDrop.Cost ), DoesNotBlockExit = true, SuppressSpawnSounds = true, } )
			elseif itemData.Name =="HermesUpgradeDrop" then
				spawnedItem = CreateHermesLoot({ SpawnPoint = kitId, Cost = itemData.Cost or GetProcessedValue( ConsumableData.HermesUpgradeDrop.Cost ), DoesNotBlockExit = true, SuppressSpawnSounds = true, BoughtFromShop = true, AddBoostedAnimation = itemData.AddBoostedAnimation, BoonRaritiesOverride = itemData.BoonRaritiesOverride })
				spawnedItem.CanReceiveGift = false
				SetThingProperty({ Property = "SortBoundsScale", Value = 1.0, DestinationId = spawnedItem.ObjectId })
			elseif itemData.Name == "StoreTrialUpgradeDrop" then
				local args  = { BoughtFromShop = true, DoesNotBlockExit = true, Cost = GetProcessedValue( ConsumableData.StoreTrialUpgradeDrop.Cost ) }
				args.SpawnPoint = kitId
				args.DoesNotBlockExit = true
				args.SuppressSpawnSounds = true
				args.Name = "TrialUpgrade"
				spawnedItem = GiveLoot( args )
				spawnedItem.CanReceiveGift = false
				SetThingProperty({ Property = "SortBoundsScale", Value = 1.0, DestinationId = spawnedItem.ObjectId })
			elseif itemData.Name == "StackUpgradeDropRare" then
				spawnedItem = CreateStackLoot({ SpawnPoint = kitId, Cost = GetProcessedValue( ConsumableData.StackUpgradeDropRare.Cost ), DoesNotBlockExit = true, SuppressSpawnSounds = true, StackNum = 2, AddBoostedAnimation = true, })
			elseif itemData.Type == "Consumable" then
				local consumablePoint = SpawnObstacle({ Name = itemData.Name, DestinationId = kitId, Group = "Standing" })
				local upgradeData =  GetRampedConsumableData( ConsumableData[itemData.Name] )
				spawnedItem = CreateConsumableItemFromData( consumablePoint, upgradeData )
				ApplyConsumableItemResourceMultiplier( CurrentRun.CurrentRoom, spawnedItem )
				ExtractValues( CurrentRun.Hero, spawnedItem, spawnedItem )
			elseif itemData.Type == "Boon" then
				itemData.Args.SpawnPoint = kitId
				itemData.Args.DoesNotBlockExit = true
				itemData.Args.SuppressSpawnSounds = true
				itemData.Args.SuppressFlares = true
				spawnedItem = GiveLoot( itemData.Args )
				spawnedItem.CanReceiveGift = false
				SetThingProperty({ Property = "SortBoundsScale", Value = 1.0, DestinationId = spawnedItem.ObjectId })
			end			
			if spawnedItem ~= nil then
				SetObstacleProperty({ Property = "MagnetismWhileBlocked", Value = 0, DestinationId = spawnedItem.ObjectId })
				spawnedItem.SpawnPointId = kitId
				spawnedItem.UseText = spawnedItem.PurchaseText or "Shop_UseText"
				table.insert( CurrentRun.CurrentRoom.Store.SpawnedStoreItems, spawnedItem )
			end						
			RefreshStoreItems()
		end
	)
	function RefreshStoreItems()
		if CurrentRun and CurrentRun.CurrentRoom.Store and CurrentRun.CurrentRoom.Store.SpawnedStoreItems then
			for i, data in pairs( CurrentRun.CurrentRoom.Store.SpawnedStoreItems ) do
				if HeroHasTrait("HealthAsObolTrait") then
					AddHealthAsObolText(data)
				else
					RemoveHealthAsObolText(data)
				end
				UpdateCostText( data, true )
				UpdateHealthCostText(data)
			end
		end	
	end
	function AddHealthAsObolText(spawnedItem)
		if HeroHasTrait("HealthAsObolTrait") and spawnedItem.Cost ~= nil and spawnedItem.Cost > 0 and spawnedItem.HealFraction == nil and spawnedItem.HealthCost == nil then
			spawnedItem.SacrificeCost = round(spawnedItem.Cost*0.9)
			if spawnedItem.SacrificeCost <= 0 then
				spawnedItem.SacrificeCost = 1
			end
			if spawnedItem.SacrificeId == nil then
				spawnedItem.SacrificeId = SpawnObstacle({ Name = "BlankObstacle", DestinationId = spawnedItem.ObjectId, Group = "Standing" })
				CreateTextBox({ Id = spawnedItem.SacrificeId, Text = "Shop_ItemSacrifice", TextSymbolScale = 0.6, LuaKey = "TempTextData", LuaValue = { SacrificeCost = spawnedItem.SacrificeCost }, FontSize = 24, OffsetY = -280, Color = Color.CostUnaffordable, Justification = "CENTER",
						Font="AlegreyaSansSCBold",
						FontSize=36,
						ShadowColor = {0,0,0,1},
						ShadowOffset= {0,2},
						ShadowAlpha=1,
						ShadowBlur=0,
						OutlineColor={0,0,0,1},
						OutlineThickness=2,
					})
				if spawnedItem.NoneSacrificeUseText == nil then
					spawnedItem.NoneSacrificeUseText = spawnedItem.PurchaseText or "Shop_UseText"
				end
				if spawnedItem.PurchaseText then
					spawnedItem.UseText = spawnedItem.PurchaseText.."_HealthAsObolText"
				else
					spawnedItem.UseText = "Shop_UseText_HealthAsObolText"
				end
			end
		end
	end
	function RemoveHealthAsObolText(spawnedItem)
		if spawnedItem.SacrificeId then
			DestroyTextBox({ Id = spawnedItem.SacrificeId })
			spawnedItem.SacrificeId = nil
			if spawnedItem.NoneSacrificeUseText then
				spawnedItem.UseText = spawnedItem.NoneSacrificeUseText
			end
		end
	end
	ModUtil.Path.Wrap("Heal",
		function(baseFunc, victim, triggerArgs)
			baseFunc(victim, triggerArgs)
			if victim == CurrentRun.Hero then
				UpdateHealthCostTexts()
			end
		end
	)
	ModUtil.Path.Wrap("Damage",
		function(baseFunc, victim, triggerArgs)
			if triggerArgs ~= nil and triggerArgs.AttackerTable ~= nil and triggerArgs.SourceWeapon ~= nil then
			local sourceWeaponData = GetWeaponData( triggerArgs.AttackerTable, triggerArgs.SourceWeapon )
				if sourceWeaponData ~= nil and sourceWeaponData.PureDamage and not triggerArgs.PureDamage then
					triggerArgs.PureDamage = true
				end				
			end
			baseFunc(victim, triggerArgs)
			if victim == CurrentRun.Hero and HeroHasTrait("HealthAsObolTrait") then
				UpdateHealthCostTexts()
				if CurrentRun.CurrentRoom.Store ~= nil and CurrentRun.CurrentRoom.Store.Buttons then
					for i, button in pairs(CurrentRun.CurrentRoom.Store.Buttons) do
						UpdateSacrificeCostButton( button )
					end
				end
			end
		end
	)
	function UpdateHealthCostTexts()
		if CurrentRun and CurrentRun.CurrentRoom and CurrentRun.CurrentRoom.Store ~= nil and CurrentRun.CurrentRoom.Store.SpawnedStoreItems ~= nil then
			for i, item in pairs(CurrentRun.CurrentRoom.Store.SpawnedStoreItems) do
				UpdateHealthCostText(item)
			end
		end
	end
	function UpdateHealthCostText(object)
		if object.SacrificeCost ~= nil and object.SacrificeCost > 0 then
			object.SacrificeCost = round(object.Cost*0.9)
			if object.SacrificeCost <= 0 then
				object.SacrificeCost = 1
			end
			local costFontColor = Color.CostAffordable
			if (CurrentRun.Hero.Health) < object.SacrificeCost and not object.Purchased then
				costFontColor = Color.CostUnaffordable
			end
			ModifyTextBox({ Id = object.SacrificeId, Text = "Shop_ItemSacrifice", LuaKey = "TempTextData", LuaValue = { SacrificeCost = object.SacrificeCost }, ColorTarget = costFontColor, ColorDuration = 0.2  })
		end
	end
	
	-- END OF HealthAsObolTrait

	-- DASHING STUFF
	
	ModUtil.Path.Wrap("DisableRoomTraps",
		function(baseFunc)
			baseFunc()
			DestroyHeraTraps()
		end
	)
	function DestroyHeraTraps()
		if CurrentRun and CurrentRun.Hero and CurrentRun.Hero.TrapDash and CurrentRun.Hero.TrapDash.AllTraps then
			for k, enemy in pairs( CurrentRun.Hero.TrapDash.AllTraps ) do
				if not enemy.IsDead then
					SetUnitProperty({ Property = "OnDeathWeapon", Value = "null", DestinationId = enemy.ObjectId })
					thread( Kill, enemy )
				end
			end
		end
	end
	function HeraTrapDash( traitArgs, triggerArgs )
		if CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead and IsCombatEncounterActive( CurrentRun ) then
			if CurrentRun.Hero.TrapDash and CurrentRun.Hero.TrapDash.Count > 0 then
				CurrentRun.Hero.TrapDash.Count = CurrentRun.Hero.TrapDash.Count - 1
				--FireWeaponFromUnit({ Weapon = "HeraMineWeapon", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
				local newUnit = DeepCopyTable( EnemyData["HeraMine"] )
				newUnit.ObjectId = SpawnUnit({ Name = "HeraMine", Group = "Standing", DestinationId = CurrentRun.Hero.ObjectId, DoActivatePresentation = false })
				local damage = GetTotalHeroTraitValue("HeraMineBlast")
				SetProjectileProperty({ WeaponName = "HeraMineBlast", DestinationId = newUnit.ObjectId, Property = "DamageLow", Value = damage })
				SetProjectileProperty({ WeaponName = "HeraMineBlast", DestinationId = newUnit.ObjectId, Property = "DamageHigh", Value = damage })
				--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(newUnit.DamageType))
				SetupEnemyObject( newUnit, CurrentRun)
				newUnit.OnDeathWeapons = {}
				--table.insert( CurrentRun.Hero.AllTraps, newUnit )
				HasDashed(traitArgs.Cooldown)
			end
		end
	end
	function HasDashed(delay)
		thread( ReloadRangedDashTrap, delay )
		StartTrapDashReloadPresentation( delay )

		--[[if triggerArgs.Ammo == 0 then
			RangedLastAmmoPresentation()
		end]]
		--thread( UpdateTrapDashUI )

	end
	function ReloadRangedDashTrap( delay )
		wait( delay, RoomThreadName )
		CurrentRun.Hero.TrapDash.Count = CurrentRun.Hero.TrapDash.Count + 1
		EndTrapDashReloadPresentation()
		
	
		--[[RunWeaponMethod({ Id = CurrentRun.Hero.ObjectId, Weapon = "RangedWeapon", Method = "AddAmmo", Parameters = { 1 } })
		if IsMetaUpgradeActive("ReloadAmmoMetaUpgrade") then
			ReloadAmmoPresentation()
		else
			AddAmmoPresentation()
		end]]
	
	end
	function GetBaseDashTrapReloadTime()
		return TraitData.HeraRushTrait.DashTrap.DashTrap.Value
	end
	--[[ModUtil.Path.Wrap("CheckOnDeathPowers",
		function(baseFunc, victim, attacker, weaponName)
			ModUtil.Hades.PrintStackChunks(ModUtil.ToString(weaponName))
			if victim ~= nil and weaponName == "HeraMineBlast" then
				ModUtil.Hades.PrintStackChunks(ModUtil.ToString(victim.ObjectId))
				SetProjectileProperty({ WeaponName = "HeraMineBlast", DestinationId = victim.ObjectId, Property = "DamageLow", Value = 150 })
				SetProjectileProperty({ WeaponName = "HeraMineBlast", DestinationId = victim.ObjectId, Property = "DamageHigh", Value = 150 })
			end
			baseFunc(victim, attacker, weaponName)
		end
	)]]
	function SetupHeraDashTrap()
		--SetProjectileProperty({ WeaponName = "HeraMineBlast", DestinationId = CurrentRun.Hero.ObjectId, Property = "DamageLow", Value = 150 })
		--SetProjectileProperty({ WeaponName = "HeraMineBlast", DestinationId = CurrentRun.Hero.ObjectId, Property = "DamageHigh", Value = 150 })
		if not CurrentRun.Hero.TrapDash then
			CurrentRun.Hero.TrapDash = {}
		end
		if HeroHasTrait("BetterTrapsTrait") then
			CurrentRun.Hero.TrapDash.Max = 3
			CurrentRun.Hero.TrapDash.Count = 3
		else
			CurrentRun.Hero.TrapDash.Max = 1
			CurrentRun.Hero.TrapDash.Count = 1
		end
		
		CurrentRun.Hero.TrapDash.AllTraps = {}
		ResetTrapDashUI()
		ShowTrapDashUI()
	end	
	function ResetTrapDashUI()
		GameState.TrapDashUI =
		{
			RunningThreads = 0
		}
	end
	function StartTrapDashReloadPresentation( delay )
		ScreenAnchors.TrapDashIndicatorUIReloads = ScreenAnchors.TrapDashIndicatorUIReloads or {}
		local reloadTimer = delay
		local id = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Combat_Menu", Y = 610, X = 70 - 25 * #ScreenAnchors.TrapDashIndicatorUIReloads })
		SetAnimation({ Name = "TrapDashMultipleReloadTimer", DestinationId = id, PlaySpeed = 100 / reloadTimer })
		SetColor({ Id = ScreenAnchors.TrapDashIndicatorUI, Color = {0.5, 0.5, 0.5, 1.0} })
		table.insert( ScreenAnchors.TrapDashIndicatorUIReloads, id )		
	end
	function EndTrapDashReloadPresentation()

		if IsEmpty(ScreenAnchors.TrapDashIndicatorUIReloads ) then
			return
		end
	
		SetColor({ Id = ScreenAnchors.TrapDashIndicatorUI, Color = {1.0, 1.0, 1.0, 1.0} })
		CreateAnimation({ DestinationId = ScreenAnchors.TrapDashIndicatorUI, Name = "AmmoReloadFinishedFlare" })
		table.remove( ScreenAnchors.TrapDashIndicatorUIReloads, 1 )
		local destroyIds = {}
		for i, id in pairs( ScreenAnchors.TrapDashIndicatorUIReloads ) do
			local targetId = SpawnObstacle({ Name = "InvisibleTarget", OffsetX = 70 - 25 * (i - 1 ), OffsetY = 610, Group = "Standing" })
			Move({ Id = id, DestinationId = targetId, Duration = 0.25 })
			table.insert( destroyIds, targetId )
		end
		PlaySound({ Name = "/SFX/BloodstoneAmmoRecharged", Id = CurrentRun.Hero.ObjectId })
		Destroy({ Ids = destroyIds })
	end
	function ShowTrapDashUI()
		if ScreenAnchors.TrapDashIndicatorUI ~= nil then
			return
		end
		--if ScreenAnchors.TraitAnchorIds then
			--CurrentRun.Hero.TrapDash.Icon = CreateScreenComponent({ Name = "HeraShoutZeusIcon", Group = "Combat_Menu_TraitTray", X = 75, Y = 610 })
			--table.insert( ScreenAnchors.TraitAnchorIds, CurrentRun.Hero.TrapDash.Icon.Id )
		--end
		--[[ScreenAnchors.TrapDashIndicatorUI = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray",  X = 75, Y = 700 })
		SetAnimation({ Name = "TrapDashIndicatorIcon", DestinationId = ScreenAnchors.TrapDashIndicatorUI})
		CreateTextBox(MergeTables({ Id = ScreenAnchors.TrapDashIndicatorUI, OffsetX = 24, OffsetY = -2,
				Font = "AlegreyaSansSCBold", FontSize = 24, ShadowRed = 0.1, ShadowBlue = 0.1, ShadowGreen = 0.1,
				OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 1,
				ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left",
				}, LocalizationData.UIScripts.TrapDashUI ))]]
		--thread( UpdateTrapDashUI )
	
		--FadeObstacleIn({ Id = ScreenAnchors.TrapDashIndicatorUI, Duration = CombatUI.FadeInDuration, IncludeText = true, Distance = CombatUI.FadeDistance.TrapDash, Direction = 0 })
	end
	
	function UpdateTrapDashUI( triggerArgs )
		if ScreenAnchors.TrapDashIndicatorUI == nil or CurrentRun.Hero == nil then
			return
		end
		triggerArgs = triggerArgs or {}
		local TrapDashData =
		{
			Current = triggerArgs.TrapDash or GetWeaponProperty({ Id = CurrentRun.Hero.ObjectId, WeaponName = "RangedWeapon", Property = "TrapDash" }),
			Maximum = triggerArgs.MaxTrapDash or CurrentRun.Hero.TrapDash.Max
		}
		PulseText({ ScreenAnchorReference = "TrapDashIndicatorUI", ScaleTarget = 1.04, ScaleDuration = 0.05, HoldDuration = 0.05, PulseBias = 0.02})
		ModifyTextBox({ Id = ScreenAnchors.TrapDashIndicatorUI, Text = "UI_TrapDashText", OffsetY = -2, LuaKey = "TempTextData", LuaValue = TrapDashData, AutoSetDataProperties = false, })
	end
	
	function HideTrapDashUI()
		if ScreenAnchors.TrapDashIndicatorUI == nil then
			return
		end
		ScreenAnchors.TrapDashIndicatorUIReloads = ScreenAnchors.TrapDashIndicatorUIReloads or {}
	
		local ids = CombineTables( { ScreenAnchors.TrapDashIndicatorUI }, ScreenAnchors.TrapDashIndicatorUIReloads )
	
		for i, reloadId in pairs( ids ) do
			HideObstacle({ Id = reloadId, IncludeText = true, Distance = CombatUI.FadeDistance.TrapDash, Angle = 180, Duration = CombatUI.FadeDuration, SmoothStep = true })
		end
		ScreenAnchors.TrapDashIndicatorUI = nil
		ScreenAnchors.TrapDashIndicatorUIReloads = nil
	
		wait( CombatUI.FadeDuration, RoomThreadName )
	
		Destroy({ Ids = ids })
	end
	
	function DestroyTrapDashUI()
		if ScreenAnchors.TrapDashIndicatorUI == nil then
			return
		end
		Destroy({ Id = ScreenAnchors.TrapDashIndicatorUI })
		Destroy({ Ids = ScreenAnchors.TrapDashIndicatorUIReloads })
		ScreenAnchors.TrapDashIndicatorUI = nil
	end
	-- END
	-- SameGoodTrait
	function TrackHeraFullSuperMeter( hero, args )
		thread( HeraFullSuperMeterThread, args )
	end

	function HeraFullSuperMeterThread( args )
		local weaponName = args.WeaponName
		--local intervalData = args.Interval or { Min = 1.0, Max = 1.0 }
		local range = args.Range
		while CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead do
			--[[local interval = intervalData
						if type(intervalData) == "table" then
							interval = RandomFloat( intervalData.Min, intervalData.Max )
						end]]
			wait(1.0, RoomThreadName)
			if CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead and IsCombatEncounterActive( CurrentRun ) and not IsEmpty( RequiredKillEnemies ) and
			CurrentRun.Hero.SuperMeter == CurrentRun.Hero.SuperMeterLimit and HeroHasTrait("GaugeLightningTrait") then
				if range then
					thread(FireWeaponWithinRange, { SourceId = CurrentRun.Hero.ObjectId, Range = range, SeekTarget = true, WeaponName = weaponName, InitialDelay = 0, Delay = 0.21, Count = 1, BonusChance = GetTotalHeroTraitValue("BonusBolts") })
					--[[else
						FireWeaponFromUnit({ Weapon = weaponName, Id = CurrentRun.Hero.ObjectId, DestinationId = ammoId })]]
				end
			end
		end
	end
	function TrackHeraCurseCount( hero, args )
		thread( HeraCurseCountThread, args )
	end

	function HeraCurseCountThread( args )
		while CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead do
			wait(1.0, RoomThreadName) --0.2
			if CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead then
				if IsCombatEncounterActive( CurrentRun ) and not IsEmpty( RequiredKillEnemies ) then
					local count = 0
					for enemyId, enemy in pairs(RequiredKillEnemies) do
						if enemy.VulnerabilityEffects ~= nil and TableLength(enemy.VulnerabilityEffects) > 0 then
							count = count + 1
						end
					end

					if count >= 3 and 
						not HasEffect({ Id = CurrentRun.Hero.ObjectId, EffectName = "HeraCurseCount" }) then
						ApplyEffectFromWeapon({ Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId,
							WeaponName = "HeraCurseCountWeapon", EffectName = "HeraCurseCount" })
					elseif count < 3 and
						HasEffect({ Id = CurrentRun.Hero.ObjectId, EffectName = "HeraCurseCount" }) then
						ClearEffect({ Id = CurrentRun.Hero.ObjectId, Name = "HeraCurseCount" })
					end
				elseif HasEffect({ Id = CurrentRun.Hero.ObjectId, EffectName = "HeraCurseCount" }) then
					ClearEffect({ Id = CurrentRun.Hero.ObjectId, Name = "HeraCurseCount" })
				end
			end
		end
	end
	ModUtil.Path.Wrap("UpdateHeroTraitDictionary",
		function(baseFunc)
			baseFunc()
			for k, traitData in pairs(CurrentRun.Hero.Traits) do
				if traitData.GodDamageBonus then
					traitData.AccumulatedGodDamageBonus = 1 + GetHeroSameGodCount(CurrentRun.Hero) * (traitData.GodDamageBonus - 1)
					--traitData.FromGod = name
					ExtractValues( CurrentRun.Hero, traitData, traitData )
				end
			end
		end
	)

	function GetHeroSameGodCount( hero )
		if not hero then
			return 0
		end

		local godDictionary = {}
		local highestCount = 0
		local highestFrom = "none"
		for traitName in pairs( hero.TraitDictionary ) do
			if GetLootSourceName( traitName ) then
				godDictionary[GetLootSourceName( traitName )] = (godDictionary[GetLootSourceName( traitName )]  or 0) + 1
				if highestCount < godDictionary[GetLootSourceName( traitName )] then
					highestCount = godDictionary[GetLootSourceName( traitName )]
					highestFrom = GetLootSourceName( traitName )
				end
			end
		end
		if hero.SameGodCount == nil or hero.SameGodCount < highestCount then 
			for i, trait in pairs(CurrentRun.Hero.Traits) do
				if trait.Name == "PrivilegeHeraTrait" then
					trait.SameGodName = highestFrom
				end
			end
			thread( PresentationNewSameGodIncrease )
		end
		hero.SameGodFrom = highestFrom
		hero.SameGodCount = highestCount
		return hero.SameGodCount
	end
	function PresentationNewSameGodIncrease()
		wait(1.0)
		CreateAnimation({ Name = "HeraWingsFlap", DestinationId = CurrentRun.Hero.ObjectId })
	end
	function SetupHeroicBoonsTrait( args )
		if not CurrentRun.Hero.HeroicBoonsTraitFlag then
			local numTraits = args.RandomBoons or 3
			local traitDictionary = {}
			local upgradableTraits = {}
			local upgradedTraits = {}
			for i, traitData in pairs( CurrentRun.Hero.Traits ) do
				if not traitDictionary[traitData.Name] and IsGodTrait(traitData.Name) and TraitData[traitData.Name] and traitData.Rarity ~= nil and GetUpgradedRarity(traitData.Rarity) ~= nil and traitData.RarityLevels[GetUpgradedRarity(traitData.Rarity)] ~= nil then
					table.insert(upgradableTraits, traitData )
					traitDictionary[traitData.Name] = true
				end
			end
			while numTraits > 0 and not IsEmpty( upgradableTraits ) do
				local traitData = RemoveRandomValue( upgradableTraits )
				local persistentKeys = { "AccumulatedFountainDamageBonus", "AccumulatedFountainDefenseBonus", "AccumulatedHealthDamageBonus" }
				local persistentValues = {}
				for i, key in pairs( persistentKeys ) do
					persistentValues[key] = traitData[key]
				end
		
				upgradedTraits[traitData.Name] = true
				--table.insert( harvestTraitData.HarvestBoons, traitData.Name )
				local numOldTrait = GetTraitNameCount( CurrentRun.Hero, traitData.Name )
				RemoveWeaponTrait( traitData.Name )
		
				local processedData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitData.Name, Rarity = "Heroic" }) 
				for i, key in pairs( persistentKeys ) do
					processedData[key] = persistentValues[key]
				end
				AddTraitToHero({ TraitData = processedData })
		
				for i=1, numOldTrait-1 do
					AddTraitToHero({ TraitName = traitData.Name })
				end
				numTraits = numTraits - 1
			end
			--harvestTraitData.TraitListTextString = "HarvestBoonTraitList"..tostring(TableLength(harvestTraitData.HarvestBoons))
			thread( HarvestBoonTraitPresentation, upgradedTraits, 1.5 )
			--AddTraitToHero({TraitData = harvestTraitData })
			CurrentRun.Hero.HeroicBoonsTraitFlag = true
		end
	end
	function SetupAura(args)
		thread( AuraThread, args )
	end
	function AuraThread(args)
		--local PreviousCloseEnemiesList = {}
		if HeroHasTrait("AuraRuptureTrait") then
			StopAnimation({ Name = "AuraFx-Rupture", DestinationId = CurrentRun.Hero.ObjectId })
			CreateAnimation({ Name = "AuraFx-Rupture", DestinationId = CurrentRun.Hero.ObjectId })			
		end
		if HeroHasTrait("StatusOverTimeTrait") then
			StopAnimation({ Name = "AuraFx-Legendary", DestinationId = CurrentRun.Hero.ObjectId })
			CreateAnimation({ Name = "AuraFx-Legendary", DestinationId = CurrentRun.Hero.ObjectId })			
		end
		if HeroHasTrait("AuraExposedTrait") then
			StopAnimation({ Name = "AuraFx-Exposed", DestinationId = CurrentRun.Hero.ObjectId })
			CreateAnimation({ Name = "AuraFx-Exposed", DestinationId = CurrentRun.Hero.ObjectId })			
		end
		if HeroHasTrait("AuraBlindTrait") then
			StopAnimation({ Name = "AuraFx-Blind", DestinationId = CurrentRun.Hero.ObjectId })
			CreateAnimation({ Name = "AuraFx-Blind", DestinationId = CurrentRun.Hero.ObjectId })			
		end
		while CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead do
			wait(0.2, "RoomThread") -- 0.2
			if CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead and IsCombatEncounterActive( CurrentRun ) and not IsEmpty( RequiredKillEnemies ) then
				local enemyLocation = { 0, 0 }
				local heroLocation = GetLocation({ Id = CurrentRun.Hero.ObjectId })
				for enemyId, enemy in pairs(RequiredKillEnemies) do
					enemyLocation = GetLocation({ Id = enemy.ObjectId })
					local distanceSquared = math.sqrt((enemyLocation.X - heroLocation.X) ^ 2 +
						(enemyLocation.Y - heroLocation.Y) ^ 2)
					if distanceSquared <= 200 and HeroHasTrait("AuraRuptureTrait") then
						ApplyEffectFromWeapon({ WeaponName = "RuptureCurseApplicator", EffectName = "DamageOverDistance", Id = CurrentRun.Hero.ObjectId, DestinationId = enemy.ObjectId })
					end
					if distanceSquared <= 300 and HeroHasTrait("StatusOverTimeTrait") and enemy.VulnerabilityEffects and (enemy.VulnerabilityEffects["EnvyCurseAttack"] or enemy.VulnerabilityEffects["EnvyCurseSecondary"] or enemy.VulnerabilityEffects["JealousyCurse"]) then
						ApplyEffectFromWeapon({ WeaponName = "DecayCurseApplicator", EffectName = "HeraDecay", Id = CurrentRun.Hero.ObjectId, DestinationId = enemy.ObjectId })
					end
					if distanceSquared <= 400 and HeroHasTrait("AuraExposedTrait") then
						ApplyEffectFromWeapon({ WeaponName = "ExposedCurseApplicator", EffectName = "AthenaBackstabVulnerability", Id = CurrentRun.Hero.ObjectId, DestinationId = enemy.ObjectId })
					end
					if distanceSquared <= 500 and HeroHasTrait("AuraBlindTrait") then
						ApplyEffectFromWeapon({ WeaponName = "BlindCurseApplicator", EffectName = "ApolloBlind", Id = CurrentRun.Hero.ObjectId, DestinationId = enemy.ObjectId })
					end
				end	
			end
		end
	end
	function SetupDeathMarked(args)
		thread( DeathMarkedThread, args )
	end
	function DeathMarkedThread(args)
		--local PreviousCloseEnemiesList = {}
		while CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead do
			local noMark = true
			wait(0.2, "RoomThread") -- 0.2
			if CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead and IsCombatEncounterActive( CurrentRun ) and not IsEmpty( RequiredKillEnemies ) then
				for enemyId, enemy in pairs(RequiredKillEnemies) do
					if ( enemy.ActiveEffects and enemy.ActiveEffects.DeathMarkedCurse ) then
						noMark = false
						break
					end
				end	
				
				if noMark then				
					local randomEnemy = GetRandomValue(RequiredKillEnemies)
					if randomEnemy.IsBoss then
						ApplyEffectFromWeapon({ WeaponName = "DeathMarkedApplicator", EffectName = "DeathMarkedCurse", Id = CurrentRun.Hero.ObjectId, DestinationId = randomEnemy.ObjectId })
						wait(5.0, "RoomThread")
						ClearEffect({ Id = randomEnemy.ObjectId, Name = "DeathMarkedCurse" })
					else
						ApplyEffectFromWeapon({ WeaponName = "DeathMarkedApplicator", EffectName = "DeathMarkedCurse", Id = CurrentRun.Hero.ObjectId, DestinationId = randomEnemy.ObjectId })
					end
				end
			end
		end
	end
	ModUtil.Path.Wrap("FullSuperUsedPresentation",
		function(baseFunc, traitData)
			if traitData.God == "Hera" then
				DoFullSuperDualPresentation(traitData, CurrentRun.Hero.HeraShout.NextHeraGod)
				CheckAchievement( { Name = "AchGreaterCall" } )
				if CurrentRun.CurrentRoom.Encounter.EncounterType == "Devotion" then
					if CurrentRun.CurrentRoom.Encounter.SpurnedGodName == traitData.God.."Upgrade" then
						CheckAchievement( { Name = "AchGreaterCallSpurned" } )
					end
				end	
			else
				baseFunc(traitData)			
			end
		end
	)
	function EncounterShop()
		if HeroHasTrait("MoreCompanionTrait") then
			AddKeepsakeCharge({ Thread = true, Delay = 0.1, NumCharges = 1 })
			thread(InCombatTextArgs,
			{ TargetId = CurrentRun.Hero.ObjectId, Text = "MoreCompanionText_Alt", Duration = 1, LuaKey = "TempTextData",
				LuaValue = { TraitName = "MoreCompanionTrait",
					Amount = 1 } })
			wait(1.0)
		end
		if HeroHasTrait("HealthAsObolTrait") then
			local amount = round(GetTotalHeroTraitValue("CharonHealMultiplier"))
			Heal( CurrentRun.Hero, { HealAmount = amount, SourceName = "HealthAsObolTrait" } )
			thread(InCombatTextArgs,
			{ TargetId = CurrentRun.Hero.ObjectId, Text = "HealthAsObolText_Alt", Duration = 1, LuaKey = "TempTextData",
				LuaValue = { TraitName = "HealthAsObolTrait",
					Amount = amount } })
		end
	end
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
	-- Charon/Hera Upgrade
	table.insert(OlympusRoomSetData.Tartarus.A_Shop01.DistanceTriggers, {
		TriggerObjectType = "NPC_Charon_01", WithinDistance = 600,
		FunctionName = "EncounterShop"
	})
	table.insert(OlympusRoomSetData.Tartarus.A_PreBoss01.DistanceTriggers, {
		TriggerObjectType = "NPC_Charon_01", WithinDistance = 800,
		FunctionName = "EncounterShop"
	})
	table.insert(OlympusRoomSetData.Asphodel.B_Shop01.DistanceTriggers, {
		TriggerObjectType = "NPC_Charon_01", WithinDistance = 800,
		FunctionName = "EncounterShop"
	})
	OlympusRoomSetData.Asphodel.B_PreBoss01.DistanceTriggers =  {
		{
			TriggerObjectType = "NPC_Charon_01", WithinDistance = 800,
			FunctionName = "EncounterShop"
		}
	}
	OlympusRoomSetData.Elysium.C_Shop01.DistanceTriggers =  { {
		TriggerObjectType = "NPC_Charon_01", WithinDistance = 1200,
		FunctionName = "EncounterShop"
	} }
	OlympusRoomSetData.Elysium.C_PreBoss01.DistanceTriggers = { {
		TriggerObjectType = "NPC_Charon_01", WithinDistance = 1200,
		FunctionName = "EncounterShop"
	} }
	--Hestia/Hera Duo
	local OlympusEncounterData = ModUtil.Entangled.ModData(EncounterData)
	table.insert(OlympusEncounterData.Story_Sisyphus_01.DistanceTriggers, {
		TriggerObjectType = "NPC_Sisyphus_01", WithinDistance = 100,
		FunctionName = "EncounterStory"
	})
	table.insert(OlympusEncounterData.Story_Eurydice_01.DistanceTriggers, {
		TriggerObjectType = "NPC_Eurydice_01", WithinDistance = 100,
		FunctionName = "EncounterStory"
	})
	OlympusEncounterData.Story_Patroclus_01.DistanceTriggers = {
		{
			TriggerObjectType = "NPC_Patroclus_01", WithinDistance = 400,
			FunctionName = "EncounterStory"
		}
	}
	
	local OlympusRoomData = ModUtil.Entangled.ModData(RoomData)
	--[[OlympusRoomSetData.Tartarus.A_Boss01.ExitFunctionName = "EncounterStory"
	OlympusRoomSetData.Tartarus.A_Boss02.ExitFunctionName = "EncounterStory"
	OlympusRoomSetData.Tartarus.A_Boss03.ExitFunctionName = "EncounterStory"
	OlympusRoomSetData.Asphodel.B_Boss01.ExitFunctionName = "EncounterStory"
	OlympusRoomSetData.Elysium.C_Boss01.ExitFunctionName = "EncounterStory"]]
	OverwriteTableKeys(OlympusRoomData, OlympusRoomSetData.Tartarus)
	OverwriteTableKeys(OlympusRoomData, OlympusRoomSetData.Asphodel)
	OverwriteTableKeys(OlympusRoomData, OlympusRoomSetData.Elysium)

end
