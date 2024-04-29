-- Separate Gods from Goddess to add more gods

if ModUtil ~= nil then

	ModUtil.Mod.Register("HestiaExtra")

	local mod = "HestiaExtra"
	local package = "HestiaPackage"
	--Variables
	local DepthDamageMultiplier = 0.0
	local DuplicateMultiplier = -0.60
	local DuplicateStrongMultiplier = -0.40
	local DuplicateVeryStrongMultiplier = -0.20
	--Color
	local OlympusColor = ModUtil.Entangled.ModData(Color)
	OlympusColor.HestiaVoice = { 204, 26, 51, 255 }
	OlympusColor.HestiaDamageLight = { 225, 22, 53, 255 }
	OlympusColor.HestiaDamage = { 204, 26, 51, 255 }
	--EnemyUpgradeData
	local OlympusEnemyUpgradeData = ModUtil.Entangled.ModData(EnemyUpgradeData)
	OlympusEnemyUpgradeData.HestiaUpgrade =
	{
		ScreenPanel = nil,
		UpgradeString = "LtUpgrade_Hestia",
		--AddSpecialWeapons = { ContinuousWeapon = "DevotionZeus" },
		LieutenantsOnly = true,
		Hidden = true,
		PropertyChanges = {},
	}
	--QuestData
	local OlympusQuestData = ModUtil.Entangled.ModData(QuestData)
	OlympusQuestData.HestiaUpgrades =
	{
		InheritFrom = { "DefaultQuestItem" },
		RewardResourceName = "Gems",
		RewardResourceAmount = 150,
		UnlockGameStateRequirements =
		{
			RequiredTextLines = { "HestiaGift01", },
		},
		CompleteGameStateRequirements =
		{
			RequiredTraitsTaken =
			{
				"HestiaWeaponTrait",
				"HestiaDashTrait",
				"HestiaRangedTrait",
				"HestiaSecondaryTrait",
				"HestiaShoutTrait",
				"StrongAttractionTrait",
				"HestiaRevengeTrait",
				--"HealthDefianceTrait",
				--"LastStandDamageReduceTrait",
				--"HealthDamageTrait",
				"LavaDeathTrait",
				"LavaResistTrait",
				"LavaLongerTrait",
				"LavaAutoTrait",
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

			-- This was done with your help, Lady Hestia.
			{ Cue = "/VO/ZagreusHome_3778" },
		},
	}
	OlympusQuestData.HomeWarmthQuest = {
		InheritFrom = { "DefaultQuestItem" },
		RewardResourceName = "SuperGems",
		RewardResourceAmount = 6,
		UnlockGameStateRequirements =
		{
			RequiredTextLines = { "HestiaHomeWarmthQuest01", },
		},
		CompleteGameStateRequirements =
		{
			RequiredTextLines =
			{
				"HestiaHomeWarmthQuest01",
				"HestiaHomeWarmthQuest02",
				"HestiaHomeWarmthQuest03",
				"HestiaHomeWarmthQuest04",
				"HestiaHomeWarmthQuest05",
				"HestiaHomeWarmthQuest06",
			},
		},
		DisplayOrder =
		{
			{ Requirement = "HestiaHomeWarmthQuest01", Text = "WarmthQuest01", },
			{ Requirement = "HestiaHomeWarmthQuest02", Text = "WarmthQuest02", },
			{ Requirement = "HestiaHomeWarmthQuest03", Text = "WarmthQuest03", },
			{ Requirement = "HestiaHomeWarmthQuest04", Text = "WarmthQuest04", },
			{ Requirement = "HestiaHomeWarmthQuest05", Text = "WarmthQuest05", },
			{ Requirement = "HestiaHomeWarmthQuest06", Text = "WarmthQuest06", },
		},
		IncompleteName = "Quest_UnknownCondition",
	}
	OlympusQuestData.ForgivenessQuest =
	{
		InheritFrom = { "DefaultQuestItem" },
		RewardResourceName = "SuperGems",
		RewardResourceAmount = 3,
		UnlockGameStateRequirements =
		{
			RequiredTextLines = { "HestiaFreePass01" },
		},
		CompleteGameStateRequirements =
		{
			RequiredTextLines =
			{
				"ZeusFreePass01",
				"PoseidonFreePass01",
				"AresFreePass01",
				"DionysusFreePass01",
				"AthenaFreePass01",
				"ArtemisFreePass01",
				"AphroditeFreePass01",
				"ApolloFreePass01",
				"HeraFreePass01",
				"HestiaFreePass02",
			},

		},
		IncompleteName = "Quest_UnknownCondition",
		CashedOutVoiceLines =
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			PreLineWait = 0.4,
			Cooldowns =
			{
				{ Name = "ZagreusProphecyFulfilledSpeech", Time = 3 },
			},

			-- That's all of them.
			{ Cue = "/VO/ZagreusHome_3768" },
		},
	}
	local OlympusQuestOrderData = ModUtil.Entangled.ModData(QuestOrderData)
	table.insert(OlympusQuestOrderData, 30, "HestiaUpgrades")
	table.insert(OlympusQuestOrderData, 54, "HomeWarmthQuest")
	table.insert(OlympusQuestOrderData, 55, "ForgivenessQuest")

	--UnitSetData
	local OlympusEnemyData = ModUtil.Entangled.ModData(EnemyData)
	OlympusEnemyData.HestiaUpgradeRoomWeapon = {
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
			"DevotionHestia",
		},
	}
	--WeaponData
	local OlympusWeaponSets = ModUtil.Entangled.ModData(WeaponSets)
	local OlympusWeaponData = ModUtil.Entangled.ModData(WeaponData)
	local OlympusEffectData = ModUtil.Entangled.ModData(EffectData)

	table.insert(OlympusWeaponSets.ExpireProjectileExcludeProjectileNames, "HestiaProjectile")
	OlympusWeaponData.ChainLightning = {
		Name = "ChainLightning"
	}
	OlympusWeaponData.HestiaShoutWeapon = {
		BlockWrathGain = true,
	}
	OlympusWeaponData.DevotionHestia =
	{
		HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.08, FalloffSpeed = 3000 },
		HitSimSlowParameters =
		{
			{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
			{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0 },
		},
	}
	OlympusWeaponData.TheseusHestiaUpgradeWrath =
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

					-- Lady Hestia, bring him to me!
					{ Cue = "/VO/Theseus_0602" },
					-- Lady Hestia, pull him under!
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

	OlympusWeaponData.TheseusHestiaUpgradePassive =
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
		RequiredLastGodLoot = "HestiaUpgrade",
		RequiredEncounters = { "DevotionTestTartarus", "DevotionTestAsphodel", "DevotionTestElysium", },
		RequireCurrentEncounterNotComplete = true,
		Source = { SubtitleColor = Color.HestiaVoice },

		-- Many thanks, young one.
		{ Cue = "/VO/Hestia_0149" },
		-- The youth learn so fast.
		{ Cue = "/VO/Hestia_0150" },
		-- I see the fire in your eyes.
		{ Cue = "/VO/Hestia_0151" },
		-- This will get you far, Zagreus.
		{ Cue = "/VO/Hestia_0152" },
		-- You can achieve your goal.
		{ Cue = "/VO/Hestia_0153" },
		-- One step at a time, young one.
		{ Cue = "/VO/Hestia_0154" },
		-- I see ashes before you.
		{ Cue = "/VO/Hestia_0155" },
		-- You shall be reborn from your ashes.
		{ Cue = "/VO/Hestia_0156" },
		-- This is a piece of home.
		{ Cue = "/VO/Hestia_0157" },
		-- My warmth is yours.
		{ Cue = "/VO/Hestia_0158" },
		-- Bring warmth and compassion to this world.
		{ Cue = "/VO/Hestia_0159" },
		-- For the Warmth and Compassion Brigade!
		{ Cue = "/VO/Hestia_0160" },
	})
	table.insert(OlympusHeroVoiceLines.UpgradePickedVoiceLines, {
		RandomRemaining = true,
		BreakIfPlayed = true,
		SuccessiveChanceToPlay = 0.5,
		PreLineWait = 0.75,
		RequiredLastGodLoot = "HestiaUpgrade",
		-- How kind.
		{ Cue = "/VO/ZagreusField_4841" },
		-- That's hot!
		{ Cue = "/VO/ZagreusField_4842" },
		-- Still warm.
		{ Cue = "/VO/ZagreusField_4843" },
		-- A piece of home.
		{ Cue = "/VO/ZagreusField_4844" },
		-- This feels nice.
		{ Cue = "/VO/ZagreusField_4845" },
		-- Well done.
		{ Cue = "/VO/ZagreusField_4846" },
		-- Over easy.
		{ Cue = "/VO/ZagreusField_4847" },
		-- Smells like burnt.
		{ Cue = "/VO/ZagreusField_4848" },
		-- Let's bring warmth and compassion.
		{ Cue = "/VO/ZagreusField_4849" },
		-- For the Warmth and Compassion Brigade.
		{ Cue = "/VO/ZagreusField_4850" },
	})
	table.insert(OlympusHeroVoiceLines.FullSuperActivatedVoiceLines, {
		-- Hestia!!
		Cue = "/VO/ZagreusField_4951", RequiredTrait = "HestiaShoutTrait", RequiredFalseSpurnedGodName = "HestiaUpgrade"
	})
	table.insert(OlympusHeroVoiceLines.SwapUpgradePickedVoiceLines, {
		RandomRemaining = true,
		BreakIfPlayed = true,
		PreLineWait = 0.65,
		SuccessiveChanceToPlayAll = 0.33,
		RequiredFalseEncounters = { "DevotionTestTartarus", "DevotionTestAsphodel", "DevotionTestElysium", },
		RequiredSwappedGodLoot = "HestiaUpgrade",
		CooldownName = "SaidHestiaRecently",
		CooldownTime = 40,

		-- I'm sure Lady Hestia won't mind.
		{ Cue = "/VO/ZagreusField_4929" },
		-- Surely Hestia won't mind.
		{ Cue = "/VO/ZagreusField_4930" },
		-- Lady Hestia won't mind, will she?
		{ Cue = "/VO/ZagreusField_4931" },
	})
	--BoonInfoScreenData
	local OlympusBoonInfoScreenData = ModUtil.Entangled.ModData(BoonInfoScreenData)
	table.insert(OlympusBoonInfoScreenData.Ordering, "HestiaUpgrade")

	--ProjectileData
	local OlympusProjectileData = ModUtil.Entangled.ModData(ProjectileData)
	OlympusProjectileData.HestiaColorProjectile = {
		DamageTextStartColor = OlympusColor.HestiaDamageLight,
		DamageTextColor = OlympusColor.HestiaDamage
	}
	OlympusProjectileData.HestiaProjectile = {
		InheritFrom = { "NoSlowFrameProjectile", "NoShakeProjectile", "HestiaColorProjectile" },
	}
	OlympusProjectileData.HestiaField =
	{
		InheritFrom = { "NoSlowFrameProjectile", "NoShakeProjectile", "HestiaColorProjectile" },
		SpawnedProjectile = true,
		NeverStore = true,
	}
	OlympusProjectileData.HestiaFireDashField = {
		InheritFrom = { "HestiaColorProjectile" },
	}
	OlympusProjectileData.HestiaFire = {
		InheritFrom = { "HestiaColorProjectile" },
	}
	OlympusProjectileData.HestiaSmallField =
	{
		InheritFrom = { "NoSlowFrameProjectile", "NoShakeProjectile", "HestiaColorProjectile" },
		SpawnedProjectile = true,
	}
	--[[OlympusWeaponData.AreaWeakenHestia =
	{
		InheritFrom = { "HestiaColorProjectile" },
	}]]
	OlympusWeaponData.HestiaSuper = {
		InheritFrom = { "HestiaColorProjectile", "NoSlowFrameProjectile", "NoShakeProjectile" },
	}
	OlympusWeaponData.HestiaMaxSuper = {
		InheritFrom = { "HestiaColorProjectile", "NoSlowFrameProjectile", "NoShakeProjectile" },
	}
	-- GameData
	local OlympusGameData = ModUtil.Entangled.ModData(GameData)
	OlympusGameData.HestiaBasicPickUpTextLines = {
		"HestiaFirstPickUp",
		"HestiaMiscPickup01",
		"HestiaMiscPickup02",
		-- "HestiaMiscPickup03",
		"HestiaMiscPickup04",
		"HestiaMiscPickup05",
		"HestiaMiscPickup06",
		"HestiaMiscPickup07",
		"HestiaMiscPickup08",
		"HestiaMiscPickup09",
		-- "HestiaMiscPickup10",
		"HestiaMiscPickup11",
		"HestiaMiscPickup12",
		"HestiaMiscPickup13",
		"HestiaMiscPickup14",
		"HestiaMiscPickup15",
		"HestiaMiscPickup16",
		"HestiaMiscPickup17"
	}
	GameData.RunClearMessageData.ClearRequiredTraitsHestia =
	{
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements =
		{
			RequiredCountOfTraitsCount = 6,
			RequiredCountOfTraits =
			{
				"HestiaWeaponTrait",
				"HestiaDashTrait",
				"HestiaRangedTrait",
				"HestiaSecondaryTrait",
				"HestiaShoutTrait",
				"StrongAttractionTrait",
				"HestiaRevengeTrait",
				"HealthDefianceTrait",
				"LastStandDamageReduceTrait",
				"HealthDamageTrait",
				"LavaDeathTrait",
				"LavaResistTrait",
				"LavaLongerTrait",
				"LavaAutoTrait",
			},
			RequiredOneOfTraits = { "LavaAutoTrait" },
		},
	}
	table.insert(OlympusGameData.ConversationOrder, "HestiaUpgrade")
	table.insert(OlympusGameData.RunClearMessageData.ClearWeaponsFiredWrath.GameStateRequirements.RequiredWeaponsFiredThisRun
		.Names, "HestiaBeamWeapon")
	ModUtil.Table.Merge(OlympusGameData.GodAboutGodVoiceLines, {
		"HestiaAboutZeus01"
	}
	)
	--Keywords
	local OlympusKeywordList = ModUtil.Entangled.ModData(KeywordList)
	ModUtil.Table.Merge(OlympusKeywordList, { "LavaSplash", "CentaurHeart", "CentaurSoul", "MiniBoss" })
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
	table.insert(OlympusCodexOrdering.OlympianGoddess.Order, "HestiaUpgrade")
	table.insert(OlympusCodexOrdering.Items.Order, 6, "RoomRewardEmptyHealthDrop")

	OlympusCodex.OlympianGoddess.Entries["HestiaUpgrade"] =
	{
		Entries =
		{
			{
				UnlockThreshold = 1,
				Text = "CodexData_Hestia_0001"
			},
			{
				UnlockThreshold = 5,
				Text = "CodexData_Hestia_0002"
			},
			{
				UnlockThreshold = 15,
				Text = "CodexData_Hestia_0003"
			}
		},
		Image = "Codex_Portrait_Hestia",
	}
	OlympusCodex.Items.Entries["RoomRewardEmptyHealthDrop"] =
	{
		Entries =
		{
			{
				UnlockThreshold = 1,
				Text = "CodexData_Hestia_0004",
			},
			{
				UnlockThreshold = 10,
				Text = "CodexData_Hestia_0005",
			},
		},
		Image = "Codex_Portrait_CentaurSoul",
	}
	-- Trait Section
	local OlympusTraitData = ModUtil.Entangled.ModData(TraitData)

	OlympusTraitData.ForceHestiaBoonTrait = {
		Name = "ForceHestiaBoonTrait",
		InheritFrom = { "GiftTrait" },
		--New Data
		InRackTitle = "ForceHestiaBoonTrait_Rack",
		Icon = "Keepsake_Ember",
		EquipSound = "/SFX/PoisonCureFountainDrink",
		ForceBoonName = "HestiaUpgrade",
		Uses = 1,
		RarityBonus =
		{
			RequiredGod = "HestiaUpgrade",
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
				Text = "HestiaSignoff",
			},
			{
				RequiredTextLines = { "HestiaGift07" },
				Text = "HestiaSignoff_Max"
			}
		},
	}
	OlympusTraitData.HestiaWeaponTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Hestia",
		Slot = "Melee",
		Icon = "Boon_Hestia_01",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.30,
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
		OnWeaponHitFunctions = {
			ValidWeapons = { "SniperGunWeapon", "SniperGunWeaponDash", "GunWeapon", "GunWeaponDash", "BowWeapon", "BowWeaponDash" },
			FunctionName = "CheckProjectileVacuumAllNearbyEnemies",
			FunctionArgs =
			{
				From = "OnWeaponProjectileHitFunction",
				SniperGunWeapon = {
					Range = 400,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 75,
					RequireFirstHit = true,
				},
				SniperGunWeaponDash = {
					Range = 400,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 75,
					RequireFirstHit = true,
				},
				GunWeapon = {
					Range = 400,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 75,
					RequireFirstHit = true,
					Traits = {
						GunLoadedGrenadeTrait = {
							Range = 700,
							PullForce = 2000,
							Arc = 360,
							Count = 3,
							Distance = 75,
						},
					},
				},
				GunWeaponDash = {
					Range = 400,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 75,
					RequireFirstHit = true,
					Traits = {
						GunLoadedGrenadeTrait = {
							Range = 700,
							PullForce = 2000,
							Arc = 360,
							Count = 3,
							Distance = 75,
						},
					},
				},
				BowWeapon = {
					Range = 700,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 75,
					RequireFirstHit = true,
				},
				BowWeaponDash = {
					Range = 700,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 75,
					RequireFirstHit = true,
				},
			}
		},
		OnWeaponProjectileDeathFunction =
		{
			ValidWeapons = { "SniperGunWeapon", "SniperGunWeaponDash", "ShieldWeaponRush", "GunWeapon", "GunWeaponDash",
				"BowWeapon", "BowWeaponDash" },
			FunctionName = "CheckProjectileVacuumAllNearbyEnemies",
			FunctionArgs =
			{
				From = "OnWeaponProjectileDeathFunction",
				SniperGunWeapon = {
					Range = 400,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 125,
				},
				SniperGunWeaponDash = {
					Range = 400,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 125,
				},
				ShieldWeaponRush = {
					Range = 400,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 125,
				},
				GunWeapon = {
					Range = 700,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 125,
					Traits = {
						GunLoadedGrenadeTrait = {
							Skip = true
						},
					},
				},
				GunWeaponDash = {
					Range = 400,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 125,
					Traits = {
						GunLoadedGrenadeTrait = {
							Skip = true
						},
					},
				},
				BowWeapon = {
					Range = 700,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 125,
				},
				BowWeaponDash = {
					Range = 700,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 125,
				},
			}
		},
		OnWeaponChargeFunctions =
		{
			ValidWeapons = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
			FunctionName = "CheckChargeVacuumAllNearbyEnemies",
			FunctionArgs =
			{
				From = "OnWeaponChargeFunctions",
				SpearWeaponSpin = {
					Range = 1000,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 250,
				},
				SpearWeaponSpin2 = {
					Range = 1000,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 250,
				},
				SpearWeaponSpin3 = {
					Range = 1000,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 250,
				},
			}
		},
		OnWeaponFiredFunctions =
		{
			ValidWeapons = { "SwordWeapon", "SwordWeapon2", "SwordWeapon3", "SwordWeaponDash", "SpearWeapon", "SpearWeapon2",
				"SpearWeapon3", "SpearWeaponDash", "ShieldWeapon", "ShieldWeaponDash", "FistWeaponDash", "FistWeapon", "FistWeapon2",
				"FistWeapon3", "FistWeapon4", "FistWeapon5", },
			FunctionName = "CheckFiredVacuumAllNearbyEnemies",
			FunctionArgs =
			{
				From = "OnWeaponFiredFunctions",
				SwordWeapon = {
					Range = 500,
					PullForce = 2000,
					Arc = 90,
					Count = 3,
					Distance = 125,
					RequireFacing = true,
				},
				SwordWeapon2 = {
					Range = 500,
					PullForce = 2000,
					Arc = 90,
					Count = 3,
					Distance = 125,
					RequireFacing = true,
				},
				SwordWeapon3 = {
					Range = 500,
					PullForce = 2000,
					Arc = 90,
					Count = 3,
					Distance = 125,
					RequireFacing = true,
				},
				SwordWeaponDash = {
					Range = 500,
					PullForce = 2000,
					Arc = 90,
					Count = 3,
					Distance = 125,
					RequireFacing = true,
				},
				SpearWeapon = {
					Range = 1000,
					PullForce = 2000,
					Arc = 30,
					Count = 3,
					Distance = 500,
					RequireFacing = true,
				},
				SpearWeapon2 = {
					Range = 1000,
					PullForce = 2000,
					Arc = 30,
					Count = 3,
					Distance = 500,
					RequireFacing = true,
				},
				SpearWeapon3 = {
					Range = 1000,
					PullForce = 2000,
					Arc = 30,
					Count = 3,
					Distance = 500,
					RequireFacing = true,
				},
				SpearWeaponDash = {
					Range = 1000,
					PullForce = 2000,
					Arc = 50,
					Count = 3,
					Distance = 300,
					RequireFacing = true,
				},
				ShieldWeapon = {
					Range = 500,
					PullForce = 2000,
					Arc = 90,
					Count = 3,
					Distance = 125,
					RequireFacing = true,
				},
				ShieldWeaponDash = {
					Range = 500,
					PullForce = 2000,
					Arc = 90,
					Count = 3,
					Distance = 125,
					RequireFacing = true,
				},
				FistWeaponDash = {
					Range = 400,
					PullForce = 2000,
					Arc = 70,
					Count = 3,
					Distance = 80,
					RequireFacing = true,
					Traits = {
						FistDetonateTrait = {
							Range = 400,
							PullForce = 2000,
							Arc = 90,
							Count = 3,
							Distance = 80,
							RequireFacing = true,
						}
					}
				},
				FistWeapon = {
					Range = 400,
					PullForce = 2000,
					Arc = 60,
					Count = 3,
					Distance = 80,
					RequireFacing = true,
					Traits = {
						FistDetonateTrait = {
							Range = 500,
							PullForce = 2000,
							Arc = 90,
							Count = 3,
							Distance = 80,
							RequireFacing = true,
						}
					}
				},
				FistWeapon2 = {
					Range = 400,
					PullForce = 2000,
					Arc = 60,
					Count = 3,
					Distance = 80,
					RequireFacing = true,
					Traits = {
						FistDetonateTrait = {
							Range = 700,
							PullForce = 2000,
							Arc = 90,
							Count = 3,
							Distance = 80,
							RequireFacing = true,
						}
					}
				},
				FistWeapon3 = {
					Range = 400,
					PullForce = 2000,
					Arc = 15,
					Count = 3,
					Distance = 80,
					RequireFacing = true,
					Traits = {
						FistDetonateTrait = {
							Range = 700,
							PullForce = 2000,
							Arc = 90,
							Count = 3,
							Distance = 80,
							RequireFacing = true,
						}
					}
				},
				FistWeapon4 = {
					Range = 400,
					PullForce = 2000,
					Arc = 60,
					Count = 3,
					Distance = 80,
					RequireFacing = true,
					Traits = {
						FistDetonateTrait = {
							Range = 700,
							PullForce = 2000,
							Arc = 90,
							Count = 3,
							Distance = 80,
							RequireFacing = true,
						}
					}
				},
				FistWeapon5 = {
					Range = 400,
					PullForce = 2000,
					Arc = 60,
					Count = 3,
					Distance = 80,
					RequireFacing = true,
					Traits = {
						FistDetonateTrait = {
							Range = 700,
							PullForce = 2000,
							Arc = 90,
							Count = 3,
							Distance = 80,
							RequireFacing = true,
						}
					}
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "SwordWeapon",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeB-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon2",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon3",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearDashSwipe-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin2",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowCharge-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponName = "BowWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeFast-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponDash",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipeDash-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "Graphic",
				ChangeValue = "ShieldRush3D-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "ShieldRush3D-Out-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxHestia",
				ChangeType = "Absolute"
			},
			{
				WeaponName = "FistWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "FistFxSwipeHestia",
				ChangeType = "Absolute",
			},

			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Hestia-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeA-Hestia-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Hestia-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Hestia-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowBondTrait",
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowChargeRama-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowBondTrait",
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeRamaDash-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowBondTrait",
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "RamaWideShot-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunLaser-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "GunLaserOriginFlare-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "TipFx",
				ChangeValue = "GunLaserTipFlare-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "GunCharge-Hestia",
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
				ChangeValue = "GunLaserEnd-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "ShieldLoadAmmoTrait",
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "BeowulfShieldSlam-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowMarkHomingTrait",
				WeaponNames = { "BowWeapon" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Hestia-Alt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = { "BowWeapon" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Hestia-Alt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon", "FistWeapon3", "FistWeapon5" },
				TraitName = "FistDetonateTrait",
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipe-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2", "FistWeapon4" },
				TraitName = "FistDetonateTrait",
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeFlipped-Hestia",
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
				ChangeValue = "ClawSwipeFlippedDash-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	}
	OlympusTraitData.HestiaSecondaryTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Hestia",
		Slot = "Secondary",
		Icon = "Boon_Hestia_02",
		RequiredFalseTraits = { "FistVacuumTrait", "FistChargeSpecialTrait", "FistSpecialFireballTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.70,
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
		OnWeaponHitFunctions = {
			ValidWeapons = { "BowSplitShot", "ShieldThrow", "ChaosShieldThrow", "ShieldThrowDash", "SpearWeaponThrow",
				"SpearWeaponThrowReturn" },
			FunctionName = "CheckProjectileVacuumAllNearbyEnemies",
			FunctionArgs =
			{
				From = "OnWeaponProjectileHitFunction",
				ShieldThrow = {
					Range = 700,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 125,
					Traits = {
						ShieldTwoShieldTrait = {
							Skip = true
						}
					}
				},
				ChaosShieldThrow = {
					Range = 700,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 125,
					Traits = {
						ShieldTwoShieldTrait = {
							Skip = true
						}
					}
				},
				ShieldThrowDash = {
					Range = 700,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 125,
					Traits = {
						ShieldTwoShieldTrait = {
							Skip = true
						}
					}
				},
				SpearWeaponThrow = {
					Range = 700,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 150,
					RequireFirstHit = true,
				},
				SpearWeaponThrowReturn = {
					Range = 700,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 150,
					RequireFirstHit = true,
				},
				BowSplitShot = {
					Range = 700,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 80,
				},
			}
		},
		OnWeaponProjectileDeathFunction =
		{ -- "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3",
			ValidWeapons = { "SpearWeaponThrow", "GunGrenadeToss" },
			FunctionName = "CheckProjectileVacuumAllNearbyEnemies",
			FunctionArgs =
			{
				From = "OnWeaponProjectileDeathFunction",
				SpearWeaponThrow = {
					Range = 700,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 125,
				},
				BowSplitShot = {
					Range = 700,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 80,
				},
				GunBombImmolation = {
					Range = 700,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 150,
				},
				GunGrenadeToss = {
					Range = 700,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 150,
				},
			}
		},
		OnWeaponFiredFunctions =
		{
			ValidWeapons = { "SwordParry", "FistWeaponSpecial", "FistWeaponSpecialDash" },
			FunctionName = "CheckFiredVacuumAllNearbyEnemies",
			FunctionArgs =
			{
				From = "OnWeaponFiredFunctions",
				SwordParry = {
					Range = 700,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 125,
				},
				FistWeaponSpecial = {
					Range = 500,
					PullForce = 2000,
					Arc = 70,
					Count = 3,
					Distance = 80,
					RequireFacing = true,
				},
				FistWeaponSpecialDash = {
					Range = 500,
					PullForce = 2000,
					Arc = 70,
					Count = 3,
					Distance = 80,
					RequireFacing = true,
				},
			}
		},

		PropertyChanges =
		{
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordParry",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "RadialNovaSwordParry-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrowReturn",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "StartFx",
				ChangeValue = "HestiaSplashNovaSpearThrow",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowSplitShot",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Hestia-SplitShot",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow" },
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrowDash" },
				ProjectileName = "ShieldThrowDash",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "Graphic",
				ChangeValue = "ProjectileShield-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldRushBonusProjectileTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ShieldThrowDash", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt01-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldLoadAmmoTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ShieldThrowDash", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt03-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				ProjectileProperty = "Graphic",
				WeaponName = "ShieldThrow",
				ChangeValue = "ProjectileShieldAlt02-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldThrowTrailMirage-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "VacuumStrength",
				ChangeValue = 200,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "VacuumDistance",
				ChangeValue = 400,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionHestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearTeleportTrait",
				WeaponName = "SpearRushWeapon",
				ProjectileName = "SpearRushWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearRushTrailFx-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalHestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "Graphic",
				ChangeValue = "GunGrenadeLuciferOrb-Hestia",
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
				ChangeValue = "ZagGrenadeExplosionHestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunBombImmolation" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "LuciferOrbAoE-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowMarkHomingTrait",
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Hestia-SplitShot-Alt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Hestia-SplitShot-Alt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeUppercut-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeUppercutSpecial-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistTeleportSpecialTrait",
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalHestia_FlashKick",
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
				ChangeValue = "LuciferBomb-Hestia",
				ChangeType = "Absolute",
			},
		}
	}

	OlympusTraitData.HestiaDashTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Hestia",
		Icon = "Boon_Hestia_03",
		Slot = "Rush",
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
				ChangeValue = "BlinkTrailVerticalB-Hestia",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusDashNoCollide_Hestia",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "HestiaFireDashField",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileName = "HestiaFireDashField",
				ProjectileProperty = "DamageLow",
				BaseMin = 12,
				BaseMax = 12,
				AsInt = true,
				MinMultiplier = 0.2,
				DepthMult = DepthDamageMultiplier,
				DeriveSource = "BurstDamage",
				IdenticalMultiplier =
				{
					Value = DuplicateVeryStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileName = "HestiaFireDashField",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "BurstDamage"
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileName = "HestiaFire",
				ProjectileProperty = "DamageLow",
				BaseMin = 6,
				BaseMax = 6,
				AsInt = true,
				MinMultiplier = 0.2,
				DepthMult = DepthDamageMultiplier,
				DeriveSource = "DamageOverTime",
				IdenticalMultiplier =
				{
					Value = DuplicateVeryStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamageOverTime",
				}
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileName = "HestiaFire",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageOverTime"
			},
			{
				TraitName = "ChillFireTrait",
				WeaponNames = { "RushWeapon" },
				EffectName = "DemeterSlow",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "ChillFireTrait",
				WeaponNames = { "RushWeapon" },
				ProjectileName = "HestiaFire",
				ProjectileProperty = "Graphic",
				ChangeValue = "HestiaDemeterSpinIn",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	}
	OlympusTraitData.ChaosCurseDashRangeTrait.PropertyChanges[1].DeriveSource = "ModifierSource"
	table.insert(OlympusTraitData.ChaosCurseDashRangeTrait.PropertyChanges, {
		TraitName = "HestiaDashTrait",
		WeaponNames = { "RushWeapon" },
		ProjectileName = "HestiaFireDashField",
		ProjectileProperty = "Range",
		ChangeType = "Multiply",
		DeriveValueFrom = "ModifierSource",
	})
	table.insert(OlympusTraitData.SpearDashMultiStrike.PropertyChanges, {
		TraitName = "HestiaDashTrait",
		WeaponNames = { "RushWeapon" },
		ProjectileName = "HestiaFireDashField",
		ProjectileProperty = "Range",
		ChangeValue = 0.75,
		ChangeType = "Multiply",
	})
	OlympusTraitData.HestiaRangedTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Hestia",
		Slot = "Ranged",
		Icon = "Boon_Hestia_04",
		CustomTrayText = "HestiaRangedTrait_Tray",
		--RequiredFalseTrait = "ShieldLoadAmmoTrait",
		PreEquipWeapons = { "HestiaLavaProjectile" },
		TraitDependencyTextOverrides =
		{
			ShieldLoadAmmoTrait =
			{
				Name = "ShieldLoadAmmo_HestiaRangedTrait",
				CustomTrayText = "ShieldLoadAmmo_HestiaRangedTrait_Tray",
			},
			BowLoadAmmoTrait =
			{
				Name = "BowLoadAmmo_HestiaRangedTrait",
				CustomTrayText = "BowLoadAmmo_HestiaRangedTrait_Tray",
			},
		},
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
		OnProjectileDeathFunction =
		{
			Name = "SpawningLavaProjectile",
			Args = {}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "HestiaProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "ProjectileFireRing-Hestia",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "HestiaProjectile",
				ProjectileProperty = "DamageLow",
				BaseMin = 70,
				BaseMax = 70,
				DepthMult = DepthDamageMultiplier,
				DeriveSource = "DamageBurst",
				IdenticalMultiplier =
				{
					Value = DuplicateVeryStrongMultiplier,
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
				WeaponNames = { "HestiaLavaProjectile" },
				ProjectileProperty = "DamageLow",
				BaseMin = 14,
				BaseMax = 14,
				DeriveSource = "DamageField",
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateVeryStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamageLava",
				}
			},
			{
				WeaponNames = { "HestiaLavaProjectile" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageField"
			},
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
				ChangeValue = "RadialNovaSwordParry-Hestia"
			},
			{
				WeaponNames = { "RangedWeapon", "HestiaLavaProjectile" },
				TraitName = "LavaLongerTrait",
				ProjectileName = "HestiaField",
				ProjectileProperty = "Graphic",
				ChangeValue = "HestiaLavaPuddleLargest",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "RangedWeapon", "HestiaLavaProjectile" },
				TraitName = "LavaAutoTrait",
				ProjectileName = "HestiaField",
				ProjectileProperty = "VacuumStrength",
				ChangeValue = 100,
				ChangeType = "Add",
			},
			{
				WeaponNames = { "RangedWeapon", "HestiaLavaProjectile" },
				TraitName = "LavaAutoTrait",
				ProjectileName = "HestiaField",
				ProjectileProperty = "VacuumDistance",
				ChangeValue = 400,
				ChangeType = "Add",
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
	--[[OlympusTraitData.ShieldLoadAmmo_HestiaRangedTrait = 
	{
		InheritFrom = {"HestiaRangedTrait"},
		Skip = true,
		CustomTrayText = "ShieldLoadAmmo_HestiaRangedTrait_Tray",
        RequiredOneOfTraits = { "BowLoadAmmoTrait", "ShieldLoadAmmoTrait", }
	}]]
	OlympusTraitData.HestiaShoutTrait =
	{
		Name = "HestiaShoutTrait",
		InheritFrom = { "ShopTier1Trait" },
		RequiredTextLines = { "PoseidonWrathIntro01" },
		RequiredFalseTraits = { "RegeneratingCappedSuperTrait" },
		CustomTrayText = "HestiaShoutTrait_Tray",
		God = "Hestia",
		Slot = "Shout",
		Icon = "Boon_Hestia_06",
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
			FunctionName = "HestiaShout",
			MaxFunctionName = "HestiaMaxShout",
			Cost = 33.34,
			SuperDuration = 0.8,
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
		PreEquipWeapons = { "HestiaMaxSuper", "HestiaSuper" },
		PropertyChanges =
		{
			{
				WeaponNames = { "HestiaSuper" },
				ProjectileProperty = "DamageLow",
				BaseMin = 150,
				BaseMax = 150,
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
				WeaponNames = { "HestiaSuper", },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			{
				WeaponNames = { "HestiaMaxSuper" },
				ProjectileProperty = "DamageLow",
				BaseMin = 200,
				BaseMax = 200,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamageMax",
					--SkipAutoExtract = true
				}
			},
			{
				WeaponNames = { "HestiaMaxSuper" },
				ProjectileProperty = "DamageHigh",
				BaseMin = 200,
				BaseMax = 200,
				DepthMult = DepthDamageMultiplier,
				ExcludeLinked = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			{
				WeaponNames = { "HestiaMaxSuper", },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 3,
				ChangeType = "Absolute",
				--[[ExtractValue =
				{
					ExtractAs = "TooltipProjectiles",
				}]]

			},
			{
				TraitName = "RegeneratingCappedSuperTrait",
				LuaProperty = "SuperMeterCap",
				BaseValue = 33.34,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipCap",
				}
			},
		},
		RarityStatMultiplier = 
		{ 
			CustomRarityMultiplier =
			{
				Common =
				{
					MinMultiplier = 1.00,
					MaxMultiplier = 1.00,
				},
				Rare =
				{
					MinMultiplier = 2.0,
					MaxMultiplier = 2.0,
				},
				Epic =
				{
					MinMultiplier = 3.0,
					MaxMultiplier = 3.0,
				},
				Heroic =
				{
					MinMultiplier = 4.0,
					MaxMultiplier = 4.0,
				},
			},
			BaseValue = 1
		},
		AddOutgoingLifestealModifiers =
		{
			Unique = true,
			ValidWeapons = { "HestiaMaxSuper", "HestiaSuper" },
			ValidMultiplier = 0.00,
			MaxLifesteal = 1,
			MinLifesteal = 1,
		},		
		ExtractValues =
		{
			{
				Key = "RarityStatMultiplier",
				ExtractAs = "TooltipHeal",
				SkipAutoExtract = true,
			},
		},
	}

	table.insert(OlympusTraitData.RegeneratingCappedSuperTrait.RequiredFalseTraits,
		"HestiaShoutTrait")

	OlympusTraitData.StrongAttractionTrait =
	{
		Icon = "Boon_Hestia_07",
		InheritFrom = { "ShopTier2Trait" },
		RequiredFalseTrait = "StrongAttractionTrait",
		God = "Hestia",
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
		AttractionCount = {
			BaseValue = 1.0
		},
		AttractionDistance = {
			BaseValue = 0.12
		},
		ExtractValues =
		{
			{
				Key = "AttractionCount",
				ExtractAs = "TooltipAttractionCount",
			},
			{
				Key = "AttractionDistance",
				ExtractAs = "TooltipAttractionDistance",
				Format = "Percent",
			},
		},
	}
	OlympusTraitData.HestiaRevengeTrait =
	{
		Icon = "Boon_Hestia_08",
		InheritFrom = { "ShopTier1Trait" },
		God = "Hestia",
		AddOnHitWeapons = { "HestiaRetaliate" },
		PreEquipWeapons = { "HestiaOnRevenge" },
		OnProjectileDeathFunction =
		{
			Name = "SpawningLavaRevenge",
			Args = {}
		},
		--OnHitWeaponProperties = { FunctionName = "HestiaRevengeFunc",  },
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
			{
				WeaponName = "HestiaOnRevenge",
				ProjectileProperty = "DamageLow",
				BaseMin = 9,
				BaseMax = 9,
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
				WeaponName = "HestiaOnRevenge",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			{
				WeaponNames = { "HestiaOnDeath", "HestiaOnRevenge" },
				TraitName = "LavaLongerTrait",
				ProjectileName = "HestiaSmallField",
				ProjectileProperty = "Graphic",
				ChangeValue = "HestiaLavaPuddleSmall",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "HestiaOnDeath", "HestiaOnRevenge" },
				TraitName = "LavaAutoTrait",
				ProjectileName = "HestiaSmallField",
				ProjectileProperty = "VacuumStrength",
				ChangeValue = 100,
				ChangeType = "Add",
			},
			{
				WeaponNames = { "HestiaOnDeath", "HestiaOnRevenge" },
				TraitName = "LavaAutoTrait",
				ProjectileName = "HestiaSmallField",
				ProjectileProperty = "VacuumDistance",
				ChangeValue = 400,
				ChangeType = "Add",
			},
		},
	}
	OlympusTraitData.HealthDefianceTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Hestia",
		Icon = "Boon_Hestia_09",
		LootSource = "HestiaUpgrade",
		RequiredMetaUpgradeSelected = "ExtraChanceMetaUpgrade",
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
		DefianceExtraHealth = {
			BaseValue = 20,
			ExtractValue =
			{
				ExtractAs = "TooltipBonusHealth",
			}
		},
		ExtractValues =
		{
			{
				Key = "DefianceExtraHealth",
				ExtractAs = "TooltipBonusHealth",
			},
		},
	}
	OlympusTraitData.LastStandDamageReduceTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Hestia_14",
		PreEquipWeapons = { "LastStandMetaUpgradeShield", "LastStandReincarnateShield" },
		RequiredMinMaximumLastStands = 1,
		RequiredMetaUpgradeSelected = "ExtraChanceReplenishMetaUpgrade",
		RequiredFalseTrait = "LastStandDamageReduceTrait",
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
			{
				WeaponNames = { "LastStandMetaUpgradeShield", "LastStandReincarnateShield" },
				EffectName = "LastStandDamageReduce",
				EffectProperty = "Modifier",
				BaseValue = 0.85,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipBonus",
					Format = "NegativePercentDelta",
				},
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "LastStandMetaUpgradeShield", "LastStandReincarnateShield" },
				EffectName = "LastStandDamageReduce",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
		},
	}
	OlympusTraitData.HealthDamageTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Hestia",
		CustomTrayText = "HealthDamageTrait_Tray",
		LootSource = "HestiaUpgrade",
		Icon = "Boon_Hestia_10",
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
		CentaurAttackBonus =
		{
			BaseValue = 1.03,
			SourceIsMultiplier = true,
			DecimalPlaces = 2,
			MinMultiplier = 0.1,
			--[[IdenticalMultiplier =
			{
				Value = -0.8,
			},]]
		},
		AccumulatedHealthDamageBonus = 1,
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = WeaponSets.HeroPrimarySecondaryWeapons,
			UseTraitValue = "AccumulatedHealthDamageBonus",
			IsMultiplier = true,
			Unique = true,
		},
		AddMaxHealth = 25,
		ExtractValues =
		{
			{
				Key = "CentaurAttackBonus",
				ExtractAs = "TooltipDamage",
				Format = "PercentDelta",
				DecimalPlaces = 1,
			},
			{
				Key = "AccumulatedHealthDamageBonus",
				ExtractAs = "TooltipTotalDamage",
				Format = "PercentDelta",
			},
			{
				Key = "AddMaxHealth",
				ExtractAs = "TooltipMaxHealth",
				Format = "MaxHealth"
			},
		}
	}
	OlympusTraitData.LavaDeathTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Hestia",
		Icon = "Boon_Hestia_11",
		PreEquipWeapons = { "HestiaOnDeath" },
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
		OnEnemyDeathFunctionArgs = { Name = "SpawningLavaDeath", Args = {} },
		PropertyChanges =
		{
			{
				WeaponName = "HestiaOnDeath",
				ProjectileProperty = "DamageLow",
				BaseMin = 9,
				BaseMax = 9,
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
				WeaponName = "HestiaOnDeath",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			{
				WeaponNames = { "HestiaOnDeath", "HestiaOnRevenge" },
				TraitName = "LavaLongerTrait",
				ProjectileName = "HestiaSmallField",
				ProjectileProperty = "Graphic",
				ChangeValue = "HestiaLavaPuddleSmall",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "HestiaOnDeath", "HestiaOnRevenge" },
				TraitName = "LavaAutoTrait",
				ProjectileName = "HestiaSmallField",
				ProjectileProperty = "VacuumStrength",
				ChangeValue = 100,
				ChangeType = "Add",
			},
			{
				WeaponNames = { "HestiaOnDeath", "HestiaOnRevenge" },
				TraitName = "LavaAutoTrait",
				ProjectileName = "HestiaSmallField",
				ProjectileProperty = "VacuumDistance",
				ChangeValue = 400,
				ChangeType = "Add",
			},
		},
	}
	OlympusTraitData.LavaResistTrait =
	{
		InheritFrom = { "ShopTier2Trait" },
		God = "Hestia",
		Icon = "Boon_Hestia_12",
		PreEquipWeapons = { "HestiaFieldDefense", "HestiaSmallFieldDefense" },
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
			{
				WeaponNames = { "HestiaFieldDefense" },
				EffectName = "LavaPuddleDefense",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "HestiaFieldDefense" },
				EffectName = "LavaPuddleDefense",
				EffectProperty = "Modifier",
				BaseMin = 0.90,
				BaseMax = 0.90,
				SourceIsMultiplier = true,
				DeriveSource = "ModifierSource",
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipDamageReduction",
					Format = "NegativePercentDelta",
				}
			},
			{
				WeaponNames = { "HestiaSmallFieldDefense" },
				EffectName = "LavaPuddleDefense",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "HestiaSmallFieldDefense" },
				WeaponName = "HestiaOnDeath",
				EffectName = "LavaPuddleDefense",
				EffectProperty = "Modifier",
				DeriveValueFrom = "ModifierSource"
			},
		},
	}
	OlympusTraitData.LavaLongerTrait =
	{
		InheritFrom = { "ShopTier2Trait" },
		RequiredFalseTrait = "LavaLongerTrait",
		God = "Hestia",
		Icon = "Boon_Hestia_13",
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
			{
				WeaponNames = { "RangedWeapon", "HestiaLavaProjectile" },
				ProjectileName = "HestiaField",
				ProjectileProperty = "Graphic",
				ChangeValue = "HestiaLavaPuddleLargest",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "RangedWeapon", "HestiaLavaProjectile" },
				ProjectileName = "HestiaField",
				ProjectileProperty = "Graphic",
				ChangeValue = "HestiaLavaPuddleLargest",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{

				WeaponNames = { "RangedWeapon", "HestiaLavaProjectile" },
				ProjectileName = "HestiaField",
				ProjectileProperty = "TotalFuse",
				BaseMin = 7,
				BaseMax = 7,
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				}
			},
			{
				WeaponNames = { "HestiaOnDeath", "HestiaOnRevenge" },
				ProjectileName = "HestiaSmallField",
				ProjectileProperty = "Graphic",
				ChangeValue = "HestiaLavaPuddleSmall",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "HestiaOnDeath", "HestiaOnRevenge" },
				ProjectileName = "HestiaSmallField",
				ProjectileProperty = "Graphic",
				ChangeValue = "HestiaLavaPuddleSmall",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{

				WeaponNames = { "HestiaOnDeath", "HestiaOnRevenge" },
				ProjectileName = "HestiaSmallField",
				ProjectileProperty = "TotalFuse",
				BaseMin = 7,
				BaseMax = 7,
			},
		},
	}
	OlympusTraitData.LavaAutoTrait =
	{
		InheritFrom = { "ShopTier3Trait" },
		RequiredFalseTrait = "LavaAutoTrait",
		God = "Hestia",
		Icon = "Boon_Hestia_15",
		PropertyChanges =
		{
			{
				WeaponNames = { "RangedWeapon", "HestiaLavaProjectile" },
				ProjectileName = "HestiaField",
				ProjectileProperty = "VacuumStrength",
				ChangeValue = 100,
				ChangeType = "Add",
			},
			{
				WeaponNames = { "RangedWeapon", "HestiaLavaProjectile" },
				ProjectileName = "HestiaField",
				ProjectileProperty = "VacuumDistance",
				ChangeValue = 400,
				ChangeType = "Add",
			},
			{
				WeaponNames = { "HestiaOnDeath", "HestiaOnRevenge" },
				ProjectileName = "HestiaSmallField",
				ProjectileProperty = "VacuumStrength",
				ChangeValue = 100,
				ChangeType = "Add",
			},
			{
				WeaponNames = { "HestiaOnDeath", "HestiaOnRevenge" },
				ProjectileName = "HestiaSmallField",
				ProjectileProperty = "VacuumDistance",
				ChangeValue = 400,
				ChangeType = "Add",
			},
		},
	}
	-- Consumable Data
	local OlympusConsumableData = ModUtil.Entangled.ModData(ConsumableData)
	OlympusConsumableData.LastStandHealthDrop =
	{
		InheritFrom = { "BaseConsumable", "Tier1Consumable" },
		RequiredFalseTrait = "HealthDefianceTrait",
		--RequiredOneOfTraits = { "HestiaWeaponTrait", "HestiaRangedTrait", "HestiaDashTrait", "HestiaSecondaryTrait" },
		RequiredMetaUpgradeSelected = "ExtraChanceMetaUpgrade",
		RequiredMinMaximumLastStands = 1,
		Icon = "Boon_Hestia_09",
		ConsumeSound = "/EmptyCue",
		Cost = 0,
		UseFunctionNames = { "AddLastStand", "AddTraitToHero", "GainLastStandPresentation" },
		UseFunctionArgs = {
			{
				Icon = "ExtraLifeHestia",
				WeaponName = "LastStandMetaUpgradeShield",
				HealFraction = 0.5,
			},
			{ TraitName = "HealthDefianceTrait" },
			{},
		},
	}
	OlympusConsumableData.RoomRewardMetaPointFishGoodDrop =
	{
		InheritFrom = { "RoomRewardMetaPointDrop", },
		AddResources =
		{
			MetaPoints = 15,
		},
	}
	OlympusConsumableData.HealthDamageSoulDrop =
	{
		InheritFrom = { "BaseConsumable", "Tier1Consumable" },
		RequiredFalseTrait = "HealthDamageTrait",
		Icon = "Boon_Hestia_10",
		Cost = 0,
		UseFunctionNames = { "AddTraitToHero", "SpawnCentaurSoul" },
		UseFunctionArgs =
		{
			{ TraitName = "HealthDamageTrait" },
			{},
		},
	}

	OlympusConsumableData.RoomRewardMaxHealthDrop.UseFunctionNames =
	{
		"OnHealthMultiplyDamage"
	}
	OlympusConsumableData.RoomRewardMaxHealthDrop.UseFunctionArgs =
	{
		{},
	}
	OlympusConsumableData.RoomRewardEmptyHealthDrop =
	{
		InheritFrom = { "BaseConsumable", },
		Cost =
		{
			BaseValue = 100,
			DepthMult = 0,
			AsInt = true,
		},
		AddMaxHealth = 25,
		AddMaxHealthArgs =
		{
			Thread = true,
			Delay = 0.1,
			NoHealing = true,
		},
		UseText = "UseEmptyHealthDrop",
		UsePromptOffsetY = 30,
		BlockExitText = "ExitBlockedByHeal",
		SpawnSound = "/SFX/HealthIncreaseDrop",
		ConsumeSound = "/SFX/HealthIncreasePickup",
		PlayInteract = true,
		HideWorldText = true,
		UseFunctionNames = { "OnHealthMultiplyDamage" },
		UseFunctionArgs = { {} },
		ConsumedVoiceLines =
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.55,
			SuccessiveChanceToPlayAll = 0.5,
			Cooldowns =
			{
				{ Name = "ZagreusAnyQuipSpeech", Time = 60 },
			},

			-- That ought to keep me going for a bit.
			{ Cue = "/VO/ZagreusField_0737", },
			-- Strength of the Centaurs.
			{ Cue = "/VO/ZagreusField_0940", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- That's good.
			{ Cue = "/VO/ZagreusField_0386", RequiredPlayed = { "/VO/ZagreusField_0737" }, CooldownName = "SaidGoodRecently",
				CooldownTime = 40, },
			-- Yes.
			{ Cue = "/VO/ZagreusField_0387", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- Better.
			{ Cue = "/VO/ZagreusField_0388", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- Good for the health.
			{ Cue = "/VO/ZagreusField_0389", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- That's a relief.
			{ Cue = "/VO/ZagreusField_0299", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- Much better.
			{ Cue = "/VO/ZagreusField_0300", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- That's better.
			{ Cue = "/VO/ZagreusField_0133", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- I feel stronger.
			{ Cue = "/VO/ZagreusField_3995", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- Feeling stronger.
			{ Cue = "/VO/ZagreusField_3996", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- Feeling good.
			{ Cue = "/VO/ZagreusField_3997", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- Feeling tough.
			{ Cue = "/VO/ZagreusField_3998", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- Centaur strength.
			{ Cue = "/VO/ZagreusField_3999", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- Vitality.
			{ Cue = "/VO/ZagreusField_4000", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- That's life.
			{ Cue = "/VO/ZagreusField_4001", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- Should keep me going.
			{ Cue = "/VO/ZagreusField_4002", RequiredPlayed = { "/VO/ZagreusField_0737" } },
		},
		ExtractValues =
		{
			{
				Key = "AddMaxHealth",
				ExtractAs = "TooltipMaxHealth",
				Format = "MaxHealth"
			},
		}
	}
	-- Duo Traits
	OlympusTraitData.MoreTrapDamageTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Hestia_Athena_01",
		RequiredFalseTrait = "MoreTrapDamageTrait",
		PreEquipWeapons = WeaponSets.RubbleWeapons,
		PropertyChanges =
		{
			--[[{
				WeaponNames = { WeaponSets.RubbleWeapons },
				ProjectileProperty = "DamageLow",
				BaseValue = 4,
				ChangeType = "MultiplyBase",
			},
			{
				WeaponNames = { WeaponSets.RubbleWeapons },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},]]
			{
				WeaponNames = { "HestiaLavaProjectile", "HestiaOnDeath", "HestiaOnRevenge" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 2.0,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "Percent",
				}
			},
			{
				WeaponNames = { "HestiaLavaProjectile", "HestiaOnDeath", "HestiaOnRevenge" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 2.0,
				ChangeType = "Multiply",
			}
		},
		EnemyIncomingDamageModifiers =
		{
			TrapDamageTakenMultiplier =
			{
				BaseValue = 5.0,
				SourceIsMultiplier = true,
			},
			Multiplicative = true,
			ExtractValues =
			{
				{
					Key = "TrapDamageTakenMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
	}

	OlympusTraitData.FreeHealthTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Hestia_Aphrodite_01",
		RequiredFalseTrait = "FreeHealthTrait",
		AddMaxHealth = 25,
		ExtractValues =
		{
			{
				Key = "AddMaxHealth",
				ExtractAs = "TooltipMaxHealth",
				Format = "MaxHealth"
			},
		}
	}

	OlympusTraitData.ExplosionTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Hestia_Artemis_01",
		RequiredFalseTrait = "ExplosionTrait",
		PreEquipWeapons = { "ArtemisHestiaExplosion" },
		PropertyChanges =
		{
			{
				WeaponNames = { "ArtemisHestiaExplosion" },
				ProjectileProperty = "DamageLow",
				BaseMin = 50,
				BaseMax = 50,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		}
	}

	OlympusTraitData.ChillFireTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Hestia_Demeter_01",
		RequiredFalseTrait = "ChillFireTrait",
		--[[WeaponDataOverride =
		{
			RushWeapon =
			{
				DamageTextStartColor = Color.DemeterDamageLight,
				DamageTextColor = Color.DemeterDamage
			},
		},]]
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.25,
				SourceIsMultiplier = true,
			},
			RequiredTrait = "HestiaDashTrait",
			ValidWeapons = WeaponSets.HeroRushWeapons,
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
			--[[{
				WeaponNames = { "RushWeapon" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},]]
			--[[{
				WeaponNames = { "RushWeapon" },
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = 6,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},]]
			{
				WeaponNames = { "RushWeapon" },
				EffectName = "DemeterSlow",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = { "RushWeapon" },
				ProjectileName = "HestiaFire",
				ProjectileProperty = "Graphic",
				ChangeValue = "HestiaDemeterSpinIn",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipChillDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipChillPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "ElapsedTimeMultiplier",
				Format = "NegativePercentDelta"
			},
			{
				ExtractAs = "TooltipChillStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "MaxStacks",
			},
		}
	}
	OlympusTraitData.FullHealBossTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Hestia_Dionysus_01",
		RequiredFalseTrait = "FullHealBossTrait",
		HealingReduction = 1,
		HealingReductionHalf = 1,
		CustomNameWithMetaUpgrade =
		{
			MetaUpgradeName = "HealingReductionShrineUpgrade",
			Name = "FullHealBossTrait_Reduced",
		},
		ExtractValues =
		{
			{
				Key = "HealingReduction",
				ExtractAs = "TooltipHeal",
				Format = "PercentHealLast",
			},
			{
				Key = "HealingReductionHalf",
				ExtractAs = "TooltipHealHalf",
				Format = "PercentHealHalf",
			},
		}
	}
	OlympusTraitData.FoesNumberDamageTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Hestia_Ares_01",
		RequiredFalseTrait = "FoesNumberDamageTrait",
		--EncounterStartWeapon = "FoesNumberDamageBuff",
		PreEquipWeapons = { "FoesNumberDamageBuff" },
		SetupFunction =
		{
			Name = "TrackAresDamageBonus",
			RunOnce = true,
			Args =
			{
				Target = "Player",
				Effect = "FoesNumberDamageBuff",
				EnemiesNumberThreshold = 5,
				ExtractValues =
				{
					{
						Key = "EnemiesNumberThreshold",
						ExtractAs = "EnemyThreshold"
					},
				}
			},
		},
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = WeaponSets.HeroPrimarySecondaryWeapons,
			RequiredEffects = { "FoesNumberDamageBuff" },
			RequiredSelfEffectsMultiplier =
			{
				BaseValue = 1.7,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = -0.8,
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
	OlympusTraitData.PullZeusCastTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Hestia_Zeus_01",
		RequiredFalseTraits = { "PullZeusCastTrait", "ShieldLoadAmmoTrait" },
		OnWeaponHitFunctions = {
			ValidWeapons = { "RangedWeapon", "ChainLightning" },
			FunctionName = "CheckProjectileVacuumAllNearbyEnemies",
			FunctionArgs =
			{
				From = "OnWeaponProjectileHitFunction",
				RangedWeapon = {
					Skip = true,
					Traits = {
						ZeusRangedTrait = {
							Range = 1500,
							PullForce = 1500,
							Arc = 360,
							Count = 2,
							Distance = 75,
							RequireFirstHit = false,
						},
					},
				},
				ChainLightning = {
					Range = 1500,
					PullForce = 1500,
					Arc = 360,
					Count = 2,
					Distance = 75,
					RequireFirstHit = false,
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "ChainLightning",
				ProjectileProperty = "NumJumps",
				BaseMin = 3,
				BaseMax = 3,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "BonusJumps",
				}
			},
			{
				TraitName = "ZeusRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "NumJumps",
				BaseMin = 4,
				BaseMax = 4,
				ChangeType = "Add",
			},
		},
	}
	OlympusTraitData.FishingRewardExtraTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Hestia_Poseidon_01",
		RequiredFalseTrait = "FishingRewardExtraTrait",
	}

	-- Apollo Stuff
	OlympusTraitData.ShoutMoreHealTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Hestia_Apollo_01",
		RequiredFalseTrait = "ShoutMoreHealTrait",
		AddOutgoingLifestealModifiers =
		{
			--Unique = true,
			ValidWeapons = { "HestiaMaxSuper", "HestiaSuper" },
			ValidMultiplier = 0.00,
			MaxLifesteal = 4,
			MinLifesteal = 4,
			ExtractValues =
			{
				{
					Key = "MinLifesteal",
					ExtractAs = "TooltipLifesteal",
				},
			}
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipWrathStocks",
				Format = "ExistingWrathStocks",
				SkipAutoExtract = true
			}
		}
	}
	-- LootData
	local OlympusLootData = ModUtil.Entangled.ModData(LootData)
	table.insert(OlympusLootData.ArtemisUpgrade.LinkedUpgrades.ArtemisAmmoExitTrait.OneOf, "HestiaRangedTrait")
	OlympusLootData.HestiaUpgrade = {
		Name = "HestiaUpgrade",
		InheritFrom = { "BaseLoot", "BaseSoundPackage" },
		CanReceiveGift = true,
		AlwaysShowDefaultUseText = true,
		Weight = 10,
		Icon = "BoonSymbolHestia",
		BoonInfoIcon = "BoonInfoSymbolHestiaIcon",
		DoorIcon = "BoonSymbolHestiaIsometric",
		Color = { 123, 22, 53, 255 },
		LightingColor = { 123, 22, 53, 255 },
		LootColor = { 123, 22, 53, 255 },
		SubtitleColor = { 0.48, 0.09, 0.21, 1.0 },
		EventEndSound = "/SFX/ArtemisBoonArrow",
		UpgradeSelectedSound = "/SFX/ArtemisBoonChoice",
		LootRejectionAnimation = "BoonDissipateA_Hestia",

		RequiredMinCompletedRuns = 1,
		RequiredTextLines = { "DionysusFirstPickUp" },

		TraitsList = { "HestiaWeaponTrait", "HestiaSecondaryTrait", "HestiaDashTrait" },

		PriorityUpgrades = { "HestiaWeaponTrait", "HestiaSecondaryTrait", "HestiaDashTrait", "HestiaRangedTrait" },
		WeaponUpgrades = { "HestiaWeaponTrait", "HestiaSecondaryTrait", "HestiaDashTrait", "HestiaRangedTrait",
			"HestiaShoutTrait" },
		Traits = { "HestiaRevengeTrait", "LavaDeathTrait", "LastStandDamageReduceTrait" },
		Consumables = { "LastStandHealthDrop", "HealthDamageSoulDrop" },

		LinkedUpgrades =
		{
			StrongAttractionTrait = {
				OneOf = { "HestiaWeaponTrait", "HestiaSecondaryTrait" },
			},
			LavaResistTrait = {
				OneOf = { "HestiaRangedTrait", "HestiaRevengeTrait", "LavaDeathTrait" },
			},
			LavaLongerTrait = {
				OneOf = { "HestiaRangedTrait", "HestiaRevengeTrait", "LavaDeathTrait" },
			},
			LavaAutoTrait = {
				OneFromEachSet =
				{
					{ "HestiaWeaponTrait", "HestiaSecondaryTrait" },
					{ "HestiaRangedTrait", "HestiaRevengeTrait", "LavaDeathTrait" },
				}
			},

			-- Duo Boon
			FreeHealthTrait =
			{
				OneFromEachSet =
				{
					{ "HestiaWeaponTrait", "HestiaSecondaryTrait", "HestiaDashTrait", "HestiaRangedTrait" },
					{ "AphroditeWeaponTrait", "AphroditeSecondaryTrait", "AphroditeRushTrait", "AphroditeRangedTrait" }
				},
			},
			MoreTrapDamageTrait =
			{
				OneFromEachSet =
				{
					{ "HestiaRangedTrait", "HestiaRevengeTrait", "LavaDeathTrait" },
					{ "AthenaWeaponTrait", "AthenaSecondaryTrait", "AthenaRushTrait", "AthenaRangedTrait",
						"ShieldLoadAmmo_AthenaRangedTrait" }
				},
			},
			ExplosionTrait =
			{
				OneFromEachSet =
				{
					{ "HestiaWeaponTrait", "HestiaSecondaryTrait" },
					{ "ArtemisWeaponTrait", "ArtemisSecondaryTrait", "ArtemisRangedTrait", "CritBonusTrait" }
				},
			},
			FullHealBossTrait =
			{
				OneFromEachSet =
				{
					{ "HestiaRangedTrait", "HestiaRevengeTrait", "LavaDeathTrait" },
					{ "DionysusWeaponTrait", "DionysusRangedTrait", "DionysusSecondaryTrait", "DionysusRushTrait" }
				},
			},
			FishingRewardExtraTrait =
			{
				OneFromEachSet =
				{
					{ "LastStandDamageReduceTrait", "HealthDefianceTrait", "HealthDamageTrait" },
					{ "RoomRewardBonusTrait", "PoseidonPickedUpMinorLootTrait", "FishingTrait" },
				},
			},
			ShoutMoreHealTrait =
			{
				OneFromEachSet =
				{
					{ "HestiaShoutTrait" },
					{ "ApolloWeaponTrait", "ApolloDashTrait", "ApolloRangedTrait", "ApolloSecondaryTrait" },
				},
			},
			ChillFireTrait =
			{
				OneFromEachSet =
				{
					{ "HestiaDashTrait" },
					{ "DemeterWeaponTrait", "DemeterSecondaryTrait", "DemeterShoutTrait", "DemeterRangedTrait",
						"ShieldLoadAmmo_DemeterRangedTrait" },
				},
			},
			PullZeusCastTrait =
			{
				OneFromEachSet =
				{
					{ "ZeusWeaponTrait", "ZeusRangedTrait" },
					{ "HestiaWeaponTrait", "HestiaSecondaryTrait" },
				},
			},
			FoesNumberDamageTrait =
			{
				OneFromEachSet =
				{
					{ "AresWeaponTrait", "AresSecondaryTrait", "AresRushTrait", "AresRangedTrait" },
					{ "HestiaWeaponTrait", "HestiaSecondaryTrait", "HestiaDashTrait", "HestiaRangedTrait" },
				},
			}
		},

		Speaker = "NPC_Hestia_01",
		Portrait = "Portrait_Hestia_Default_01",
		WrathPortrait = "Portrait_Hestia_Wrath_01",
		OverlayAnim = "HestiaOverlay",
		Gender = "Female",
		SpawnSound = "/SFX/GoldCoinRewardDrop",
		FlavorTextIds =
		{
			"HestiaUpgrade_FlavorText01",
			"HestiaUpgrade_FlavorText02",
			"HestiaUpgrade_FlavorText03",
		},

		OnSpawnVoiceLines =
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			PlayOnceThisRun = true,
			PreLineWait = 0.85,
			ChanceToPlay = 0.33,
			RequiredTextLines = { "HestiaFirstPickUp" },
			RequiredFalseEncounters = { "DevotionTestTartarus", "DevotionTestAsphodel", "DevotionTestElysium", "Shop" },

			-- Lady Hestia...
			{ Cue = "/VO/ZagreusField_4839" },
			-- Kind of you to show now, Lady Hestia....
			{ Cue = "/VO/ZagreusField_4840" },
		},

		UpgradeMenuOpenVoiceLines =
		{
			[1] = GlobalVoiceLines.CheckOlympianReunionVoiceLines,
			[2] = GlobalVoiceLines.FoundRareBoonVoiceLines,
		},

		DuoPickupTextLineSets =
		{
			HestiaWithZeus01 =
			{
				Name = "HestiaWithZeus01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "PullZeusCastTrait",
				{ Cue = "/VO/Hestia_0041",
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
			HestiaWithPoseidon01 =
			{
				Name = "HestiaWithPoseidon01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "FishingRewardExtraTrait",
				{ Cue = "/VO/Hestia_0042",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "{#DialogueItalicFormat}Ah{#PreviousFormat}, Poseidon. I know we haven't talked in a long while, but it seems you still haven't taken responsibility for your actions, or lackthereof." },
				{ Cue = "/VO/Poseidon_0260",
					Emote = "PortraitEmoteFiredUp",
					PortraitExitWait = 0.35,
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
					StartSound = "/SFX/PoseidonBoonWaveCrash", UseEventEndSound = true,
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Poseidon_01", Portrait = "Portrait_Poseidon_Default_01",
					Text = "Now hold on there, Hestia! I always do my best. And how can I be reponsible for something I didn't do? I always take action. Like I'm doing right this moment, with Zagreus." },
			},
			HestiaWithAthena01 =
			{
				Name = "HestiaWithAthena01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "MoreTrapDamageTrait",
				{ Cue = "/VO/Hestia_0043",
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
			HestiaWithAres01 =
			{
				Name = "HestiaWithAres01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "FoesNumberDamageTrait",
				RequiredFalseTextLines = { "OlympianReunionQuestComplete", "HestiaWithAres02" },
				{ Cue = "/VO/Hestia_0044",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "I know you like to fight, Nephew. But a real warrior knows when to start a war and when to maintain peace—there's a fine line between the two." },
				{ Cue = "/VO/Ares_0250",
					PortraitExitWait = 0.35,
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
					StartSound = "/SFX/AresWrathBattle",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Ares_01", Portrait = "Portrait_Ares_Default_01",
					Text = "I can only agree with you, Aunt Hestia. And my kin here is in the midst of a war. He must fight to achieve peace in his realm." },
			},
			HestiaWithAres02 =
			{
				Name = "HestiaWithAres02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "FoesNumberDamageTrait",
				RequiredTextLines = { "OlympianReunionQuestComplete" },
				RequiredFalseTextLines = { "HestiaWithAres01" },
				{ Cue = "/VO/Hestia_0044",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "I know you like to fight, Nephew. But a real warrior knows when to start a war and when to maintain peace—there's a fine line between the two." },
				{ Cue = "/VO/Ares_0253",
					PortraitExitWait = 0.35,
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
					StartSound = "/SFX/AresWrathBattle",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Ares_01", Portrait = "Portrait_Ares_Default_01",
					Text = "I can only agree with you, Aunt Hestia. And even though my kin has brought peace to his realm, he must continue to fight so that he might maintain it." },
			},
			HestiaWithAphrodite01 =
			{
				Name = "HestiaWithAphrodite01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "FreeHealthTrait",
				RequiredTextLines = { "HestiaGift01", "AphroditeGift01" },
				{ Cue = "/VO/Hestia_0045",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "I know your heart is warm, but you could have put a little more on in front of Zagreus, young Aphrodite." },
				{ Cue = "/VO/Aphrodite_0240",
					PortraitExitWait = 0.35,
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Aphrodite_01", Portrait = "Portrait_Aphrodite_Default_01",
					Text = "I don't have anything to hide. And I must say, I've never heard Zagreus complain about the view, if you get my meaning."
				},
			},
			HestiaWithArtemis01 =
			{
				Name = "HestiaWithArtemis01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "ExplosionTrait",
				RequiredTextLines = { "HestiaGift01", "ArtemisGift01" },
				{ Cue = "/VO/Hestia_0046",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "Young Artemis, nothing good is going to come out of being alone. Showing affection and care to others is the best way to accept yourself. Try it with Zagreus." },
				{ Cue = "/VO/Artemis_0260",
					PortraitExitWait = 0.35,
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
					StartSound = "/SFX/ArtemisBoonArrow",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Artemis_01", Portrait = "Portrait_Artemis_Default_01",
					Text = "I show plenty of affection, to those worthy of it. In fact, I'll prove it right now: Zagreus, this is for you, from us, to show that we {#DialogueItalicFormat}care{#PreviousFormat}."
				},
			},
			HestiaWithDionysus01 =
			{
				Name = "HestiaWithDionysus01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "FullHealBossTrait",
				{ Cue = "/VO/Hestia_0047",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "Taking my place as an Olympian isn't too hard, my child? I remember when I was there—I argued with Zeus all the time. I hope you are not as headstrong as I was." },
				{ Cue = "/VO/Dionysus_0240",
					PortraitExitWait = 0.35,
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
					StartSound = "/SFX/DionysusBoonWineLaugh",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Dionysus_01", Portrait = "Portrait_Dionysus_Default_01",
					Text = "{#DialogueItalicFormat}Oh{#PreviousFormat} don't you worry, Lady Hestia, I'm trying a more chill approach. I still care and act, but just when it's necessary, yeah? Like right now, with Zag." },
			},
			HestiaWithDemeter01 =
			{
				Name = "HestiaWithDemeter01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "ChillFireTrait",
				{ Cue = "/VO/Hestia_0048",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "Oh, it's getting rather cold here. Demeter, why can't you let some warmth into your love, for once? If not for me, do it for Zagreus." },
				{ Cue = "/VO/Demeter_0380",
					PortraitExitWait = 0.35,
					StartSound = "/SFX/DemeterBoonFrost",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Demeter_01", Portrait = "Portrait_Demeter_Default_01",
					Text = "You know very well why. And I don't have to justify anything to you. But I will not drag Zagreus into our affairs. Take it, Zagreus. And go." },
			},
		},

		SuperPriorityPickupTextLineSets =
		{
			HestiaForgiveness03 =
			{
				Name = "HestiaForgiveness03",
				PlayOnce = true,
				RequiredTextLines = { "HestiaFirstPickUp", "HestiaGift06" },
				RequiredMinAnyTextLines = { TextLines = { "ZeusFreePass01", "PoseidonFreePass01", "AresFreePass01",
					"DionysusFreePass01", "AthenaFreePass01", "ArtemisFreePass01", "AphroditeFreePass01", "ApolloFreePass01",
					"HeraFreePass01", "HestiaFreePass01", "HestiaFreePass02" }, Count = 7 },
				{ Cue = "/VO/Hestia_0175",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Looks like most of my relatives did their best to be kind when the time came for them to forgive. I hope one day we can be one big family, and that's thanks to you, young one. Thanks." },
			},
			HestiaAboutOlympianReunionQuest01 =
			{
				Name = "HestiaAboutOlympianReunionQuest01",
				PlayOnce = true,
				RequiredTextLines = { "HestiaFirstPickUp", "PersephoneAboutOlympianReunionQuest01", },
				RequiredFalseTextLines = { "HestiaAboutOlympianReunionQuest01b", "HestiaHomeWarmthQuest06" },
				{ Cue = "/VO/ZagreusField_4901", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 2.33 },
					PostLineAnim = "ZagreusInteractEquip", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "I hope she can make it. In the name of Hades! Olympus, this is an official message! Here's a chance to reunite with my father, Lady Hestia!" },
				{ Cue = "/VO/Hestia_0057",
					PortraitExitWait = 1.25,
					PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
					UseEventEndSound = true,
					Emote = "PortraitEmoteDepressed",
					Text = "Young one. This is such a nice gesture, but I am not an official Olympian anymore. I don't believe I have a place among my siblings. Tell Hades I wish him well." },
			},
			HestiaAboutOlympianReunionQuest01b =
			{
				Name = "HestiaAboutOlympianReunionQuest01",
				PlayOnce = true,
				RequiredTextLines = { "HestiaFirstPickUp", "PersephoneAboutOlympianReunionQuest01", "HestiaHomeWarmthQuest06" },
				RequiredFalseTextLines = { "HestiaAboutOlympianReunionQuest01" },
				{ Cue = "/VO/ZagreusField_4901", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 2.33 },
					PostLineAnim = "ZagreusInteractEquip", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "I hope she can make it. In the name of Hades! Olympus, this is an official message! Here's a chance to reunite with my father, Lady Hestia!" },
				{ Cue = "/VO/Hestia_0170",
					PortraitExitWait = 1.25,
					PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
					UseEventEndSound = true,
					Emote = "PortraitEmoteDepressed",
					Text = "Young one. This is such a nice gesture, but I am not an official Olympian anymore. I wish I could see all of the home improvement you did for me, but I don't believe I have a place among my siblings. Tell Hades I wish him well." },
			},
			HestiaPostEpilogue01 =
			{
				Name = "HestiaPostEpilogue01",
				PlayOnce = true,
				RequiredTextLines = { "HestiaFirstPickUp", "OlympianReunionQuestComplete" },
				RequiredAnyTextLines = { "HestiaAboutOlympianReunionQuest01", "HestiaAboutOlympianReunionQuest01b" },
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hestia_0161",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Everyone told me that your little gathering went well. I am glad Hades can finally understand the meaning of family. You are never truly home without one." },
			},
			HestiaHomeWarmthQuest01 =
			{
				Name = "HestiaHomeWarmthQuest01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaGift01", "HestiaAboutHades02" },
				RequiredCosmetics = { "PostBossGiftRack", "QuestLog", "ChallengeSwitches1", "BreakableValue1", "OrpheusUnlockItem" },
				{ Cue = "/VO/Hestia_0068",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Young one, I have a favor to ask. I know how Hades is. He doesn't open up easily to others. Could you please add some lights to his domain? Show him what's in front of him." },
			},
			HestiaHomeWarmthQuest02 =
			{
				Name = "HestiaHomeWarmthQuest02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaHomeWarmthQuest01" },
				RequiredCosmetics = { "Cosmetic_HouseCandles02" },
				{ Cue = "/VO/Hestia_0069",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Thank you, young one. Those candles should give Hades something to look at. But perhaps more fire could bring some warmth to his life. Try adding some." },
			},
			HestiaHomeWarmthQuest03 =
			{
				Name = "HestiaHomeWarmthQuest03",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaHomeWarmthQuest02" },
				RequiredCosmetics = { "Cosmetic_MainHallTikiTorches", "Cosmetic_KitchenStoveFlame" },
				{ Cue = "/VO/Hestia_0070",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I am sure it's nice and warm now, but perhaps it's not enough. Add a fireplace—this should be a place of reunion for the people of his domain. A place to commune." },
			},
			HestiaHomeWarmthQuest04 =
			{
				Name = "HestiaHomeWarmthQuest04",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaHomeWarmthQuest03" },
				RequiredAnyCosmetics = { "Cosmetic_MainHallFireplace", "Cosmetic_MainHallFireplaceA" },
				{ Cue = "/VO/Hestia_0071",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The fireplace is perfect, young one. Now, perhaps you should break the silence with some music. Ask Orpheus to play something fitting for the occasion for your father." },
			},
			HestiaHomeWarmthQuest05 =
			{
				Name = "HestiaHomeWarmthQuest05",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaHomeWarmthQuest04" },
				RequiredCosmetics = { "Cosmetic_MusicPlayer", "/Music/MusicPlayer/MusicAsphodel2MusicPlayer" },
				{ Cue = "/VO/Hestia_0072",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Hmm{#PreviousFormat}. Some music will do. And Orpheus plays it so well. Everything is almost perfect. Ask Thanatos for the final touch, if I correctly recall Hades's taste in home decor." },
			},
			HestiaHomeWarmthQuest06 =
			{
				Name = "HestiaHomeWarmthQuest06",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaHomeWarmthQuest05" },
				RequiredCosmetics = { "Cosmetic_ThanatosBrazier" },
				{ Cue = "/VO/Hestia_0073",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You did it! Those flames are what was missing. Now I am sure Hades is in a good place. And in good hands. You are a good son, Zagreus. Don't let anybody make you think otherwise." },
			},
		},

		PriorityPickupTextLineSets =
		{
			--Badge hints
			HestiaForgiveness01 =
			{
				Name = "HestiaForgiveness01",
				PlayOnce = true,
				RequiredTextLines = { "HestiaFirstPickUp", "HestiaGift01" },
				RequiredFalseTextLines = { "HestiaForgiveness03" },
				RequiredMinAnyTextLines = { TextLines = { "ZeusFreePass01", "PoseidonFreePass01", "AresFreePass01",
					"DionysusFreePass01", "AthenaFreePass01", "ArtemisFreePass01", "AphroditeFreePass01", "ApolloFreePass01",
					"HeraFreePass01", "HestiaFreePass01", "HestiaFreePass02" }, Count = 1 },
				{ Cue = "/VO/Hestia_0173",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Vanity and arrogance is something in our blood. Power can bring selfishness, but it can also ask for forgiveness. I am sure anyone is able to forgive you when the time will come." },
			},
			HestiaForgiveness02 =
			{
				Name = "HestiaForgiveness02",
				PlayOnce = true,
				RequiredTextLines = { "HestiaFirstPickUp", "HestiaForgiveness01", "HestiaGift03" },
				RequiredFalseTextLines = { "HestiaForgiveness03" },
				RequiredMinAnyTextLines = { TextLines = { "ZeusFreePass01", "PoseidonFreePass01", "AresFreePass01",
					"DionysusFreePass01", "AthenaFreePass01", "ArtemisFreePass01", "AphroditeFreePass01", "ApolloFreePass01",
					"HeraFreePass01", "HestiaFreePass01", "HestiaFreePass02" }, Count = 3 },
				{ Cue = "/VO/Hestia_0174",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Young one, I have heard of some of my relatives forgave the wrong you did to them. I am so proud of them! And of you, for showing them the way to forgiveness. Keep it up!" },
			},
			-- about other gods
			HestiaAboutZeus01 =
			{
				Name = "HestiaAboutZeus01",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp",
					"AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "HestiaFirstPickUp" },
				RequiredFalseTextLines = { "HestiaWithZeus01", "ZeusWithHestia01" },
				RequiredGodLoot = "ZeusUpgrade",
				{ Cue = "/VO/Hestia_0064",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I am the oldest and Zeus is the youngest among our siblings. I supposed this makes me the wisest, and Zeus the strongest. Or maybe I am just wise enough to let him believe that." },
			},
			HestiaAboutDemeter01 =
			{
				Name = "HestiaAboutDemeter01",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp",
					"AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "DemeterFirstPickUp", "HestiaFirstPickUp" },
				RequiredFalseTextLines = { "HestiaWithDemeter01", "DemeterWithHestia01" },
				RequiredGodLoot = "DemeterUpgrade",
				{ Cue = "/VO/Hestia_0171",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I don't know why, but Demeter never seemed to like me. All I did was give her advice on how to make her daughter happy, and she would yell at me, saying that I am not a mother and thus don't know anything about it. Maybe you, Zagreus, will heed my advice." },
			},
			HestiaAboutDemeter02 =
			{
				Name = "HestiaAboutDemeter02",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaAboutDemeter01" },
				RequiredFalseTextLines = { "HestiaWithDemeter01", "DemeterWithHestia01" },
				RequiredGodLoot = "DemeterUpgrade",
				{ Cue = "/VO/Hestia_0058",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "When I learned that Demeter's daughter fled from Olympus, I knew exactly why. I believe Demeter knew as well, but she always remained angry at me after that. I can only hope that time may heal her relationship with her daughter someday." },
			},
			HestiaAboutDionysus01 =
			{
				Name = "HestiaAboutDionysus01",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaBackstory02", "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp",
					"AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "HestiaFirstPickUp" },
				RequiredFalseTextLines = { "HestiaWithDionysus01", "DionysusWithHestia01" },
				RequiredGodLoot = "DionysusUpgrade",
				{ Cue = "/VO/Hestia_0059",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "As you might know, I gave my seat as an Olympian to young Dionysus. Elders need to know when to pass the torch to the newer generation. That is something that my siblings will need to learn in time. You are part of the newer generation, Zagreus. This should be of help." },
			},
			HestiaAboutHestiaAspect01 =
			{
				Name = "HestiaAboutHestiaAspect01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				RequiredWeapon = "GunWeapon",
				RequiredTrait = "GunManualReloadTrait",
				{ Cue = "/VO/Hestia_0060",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Oh, my Aspect! I haven't used it in a while. I was much younger then, and believed flames had other purposes. I make much better use of them now. But if it helps you do your deeds, be my guest." },
			},
			HestiaAboutHades01 =
			{
				Name = "HestiaAboutHades01",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp",
					"AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "DemeterFirstPickUp", "HestiaFirstPickUp" },
				{ Cue = "/VO/Hestia_0162",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I remember your father. Always fair and just. He found balance in all things. Maybe there's a reason he doesn't want you to escape." },
			},
			HestiaAboutHades02 =
			{
				Name = "HestiaAboutHades02",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaAboutHades01" },
				{ Cue = "/VO/Hestia_0163",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Even if you disagree with your father, you must continue to show him respect. He's been through so much, even I couldn't know where to start. Maybe start by listening to him." },
			},
			HestiaAboutHades03 =
			{
				Name = "HestiaAboutHades03",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaAboutHades02" },
				{ Cue = "/VO/Hestia_0066",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I was not on good terms with my own father, and that's something I had to learn to live with. Do not be like me, do not wait until it is too late to fix it. Maybe you should go back to talk to him. For now, this is for you." },
			},
			HestiaAboutPoseidon01 =
			{
				Name = "HestiaAboutPoseidon01",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp",
					"AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "HestiaFirstPickUp" },
				RequiredFalseTextLines = { "HestiaWithPoseidon01", "PoseidonWithHestia01" },
				RequiredGodLoot = "PoseidonUpgrade",
				{ Cue = "/VO/Hestia_0065",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Poseidon doesn't take his responsibilities seriously. When Zeus refused to bring Hades back, he didn't speak up. That's what family should be for. That's something I'll have a hard time forgiving." },
			},
			HestiaAboutHera01 =
			{
				Name = "HestiaAboutHera01",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp", "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp",
					"AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "HeraFirstPickUp" },
				RequiredFalseTextLines = { "HestiaWithHera01", "HeraWithHestia01" },
				RequiredGodLoot = "HeraUpgrade",
				{ Cue = "/VO/Hestia_0165",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I don't know if you've met her yet, but Sister Hera is younger than me. She can be strict, but she's still widely respected; she is queen of Olympus, after all. Maybe someday, she will show the same compassion that I am showing you now." },
			},
			HestiaAboutCooking01 =
			{
				Name = "HestiaAboutCooking01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				RequiredCosmetics = { "Cosmetic_KitchenIsland" },
				{ Cue = "/VO/Hestia_0061",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I heard you have a professional chef in your realm. I always enjoy cooking with my heart rather than following recipes. If you get here, I might just be able to give you the feast of your life." },
			},
			HestiaAboutCooking02 =
			{
				Name = "HestiaAboutCooking02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaAboutCooking01" },
				RequiredCosmetics = { "Cosmetic_SpiceRack", "Cosmetic_Knives" },
				{ Cue = "/VO/Hestia_0062",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I cook for my family to stop all fights, even if it's just for a moment—that moment where everybody enjoys the power of a good meal, knowing everything will be alright. I wish you could share it with us right now, young one." },
			},
			HestiaAboutUnderworld01 =
			{
				Name = "HestiaAboutUnderworld01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaAboutHades01" },
				{ Cue = "/VO/Hestia_0063",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I've never been to your father's domain, though I've heard it's larger than Olympus. I can understand how you keep getting lost. I hope this helps guide you." },
			},
			HestiaAboutYoungGods01 =
			{
				Name = "HestiaAboutUnderworld01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp",
					"DionysusFirstPickUp", "HestiaFirstPickUp" },
				{ Cue = "/VO/Hestia_0067",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I don't know what to think about this new generation. They are all so focused on their own goals and responsibilities that they forget the essentials: love and affection. At least they are aiding you on your quest, and I hope this can assist as well." },
			},
			HestiaPostGiftPickup01 =
			{
				Name = "HestiaPostGiftPickup01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaGift01", },
				{ Cue = "/VO/Hestia_0087",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Do you remember when you shared that gift with me? Well, I gave it to someone who needed it. Your deed did further good, and I wanted you to know." },
			},
			HestiaPostGiftPickup02 =
			{
				Name = "HestiaPostGiftPickup02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaGift02", },
				{ Cue = "/VO/Hestia_0088",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Each time I sense you, I feel wonderful. That is a sign of a good relationship. Always cherish what you have, young one." },
			},

			HestiaPostGiftPickup03 =
			{
				Name = "HestiaPostGiftPickup03",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaGift03", },
				{ Cue = "/VO/Hestia_0089",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I hope you may see me as a motherly figure. I know many do. And I don't mind, as long as it can help them find their way." },
			},
			HestiaAboutKeepsake01 =
			{
				Name = "HestiaAboutKeepsake01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTrait = "ForceHestiaBoonTrait",
				{ Cue = "/VO/Hestia_0081",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					--Emote = "PortraitEmoteMusical",
					Text = "My Bottomless Cauldron! I was looking everywhere for it! I probably gave it to you, right? I completly forgot, haha. Keep it. At least I know where it is now." },
			},
			HestiaRunCleared01 =
			{
				Name = "HestiaRunCleared01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				RequiredMinRunsCleared = 2,
				RequiresLastRunCleared = true,
				{ Cue = "/VO/Hestia_0079",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You finally got out last time, but fresh air doesn't seem to be your cup of tea. Maybe breathing some more will fix it for you. Try again, young one." },
			},
			HestiaRunCleared02 =
			{
				Name = "HestiaRunCleared02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				RequiredMinRunsCleared = 3,
				RequiresLastRunCleared = true,
				{ Cue = "/VO/Hestia_0080",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I know you got out, yet you returned to your father's house once more. And I know why: deep down within your heart, you know you must help the people of your realm find their own place. We shall wait until you are done there. I know I will." },
			},
			HestiaBackstory01 =
			{
				Name = "HestiaBackstory01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ZeusFirstPickUp", "DionysusFirstPickUp", "AthenaFirstPickUp", "HestiaFirstPickUp" },
				{ Cue = "/VO/Hestia_0090",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "As you might know, there are twelve seats at the table of Olympus. Only the strongest and wisest of us can be there. I used to have my place there, you know. But I knew when my time was up, and gave back to the younger generation. Youth contains a fire that can extinguish only if you let it." },
			},
			HestiaBackstory02 =
			{
				Name = "HestiaBackstory02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaBackstory01", "AresFirstPickUp", "ArtemisFirstPickUp", "AphroditeFirstPickUp" },
				{ Cue = "/VO/Hestia_0091",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I believe you know Dionysus by now. I gave him my seat, because I saw that behind his relaxed attitude, he knew how to handle any stressful situation. {#DialogueItalicFormat}Hum{#PreviousFormat}. Or maybe it's the wine that makes him relaxed.... Of that, I am not sure. {#DialogueItalicFormat}Hehe{#PreviousFormat}." },
			},
			HestiaBackstory03 =
			{
				Name = "HestiaBackstory03",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "PersephoneMeeting02", "HestiaBackstory02" },
				{ Cue = "/VO/Hestia_0092",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You know, Zagreus, we Elder Gods—your father included—had many challenges to get where we are now. Even myself. This escape is only one of many challenges you'll have to face on your own." },
			},
			HestiaBackstory04 =
			{
				Name = "HestiaBackstory04",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaBackstory03", "HestiaAboutPoseidon01", "HestiaAboutZeus01" },
				{ Cue = "/VO/Hestia_0093",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I have two sisters and three foster-brothers. When we were younger, your father and I used to be close. But much happened, and we grew apart. My flame is the only one that can burn him. Keeping my distance is how I show my love." },
			},
			HestiaBackstory05 =
			{
				Name = "HestiaBackstory05",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaBackstory04", "HestiaAboutHades02" },
				RequiredFalseTextLines = { "PersephoneReturnsHome01" },
				{ Cue = "/VO/Hestia_0094",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "One of the last suggestions I gave while I was at the table of Olympus was to return your father to our mountain. Some agreed and some refused, but to everyone's suprise, it was your father who decided to stay there. There must have been something more important than his freedom from the Underworld, I suppose." },
			},
			HestiaRunProgress01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				RequiredMinRunsCleared = 1,
				{ Cue = "/VO/Hestia_0074",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I heard a strange rumor that you defeated your father. Though I doubt it, since you would be here with us.... Unless your home is not up here. But you won't know unless you try. So try again." },
			},
			HestiaRunProgress02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				RequiredRoomLastRun = "C_Boss01",
				RequiredFalseRoomLastRun = "D_Intro",
				{ Cue = "/VO/Hestia_0075",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I believe you've met Theseus, King of Athens. He always defined himself by the love of others, but self-identity starts by looking inside oneself. One day, he might understand. And so will you." },
			},
			HestiaRunProgress03 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				RequiredMinTimesSeenRoom = { A_Boss01 = 3, A_Boss02 = 3, A_Boss03 = 3 },
				RequiredRoomLastRun = "A_Boss01",
				RequiredFalseRoomLastRun = "B_Intro",
				{ Cue = "/VO/Hestia_0076",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Megaera and her sisters are hard on the outside. But on the inside, I know they can become as kind as I am to you right now. Continue spreading kindness and you'll see." },
			},
			HestiaRunProgress04 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				RequiredAnyRoomsLastRun = { "D_Intro" },
				RequiresLastRunCleared = false,
				{ Cue = "/VO/Hestia_0077",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Getting to the surface and defeating your father might be hard, but I think fighting is your own way of showing your affection towards another. Though remember that violence is rarely the solution." },
			},
			HestiaRunProgress05 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				RequiredAnyRoomsLastRun = { "C_PreBoss01", "C_Boss01" },
				RequiredFalseRoomLastRun = { "C_PostBoss01" },
				RequiresLastRunCleared = false,
				{ Cue = "/VO/Hestia_0078",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Were you defeated by Asterius? Don't hold any grudges against him, he's always been alone. I suppose Theseus' friendship is what he always wanted, and he feels the need to show his appreciation by helping him keep you away from the surface. Friendship comes in all forms." },
			},
			HestiaLowHealth01 =
			{
				Name = "HestiaLowHealth01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				RequiredMaxHealthFraction = 0.20,
				RequiredMaxLastStands = 1,

				{ Cue = "/VO/Hestia_0083",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Emote = "PortraitEmoteSurprise",
					Text = "You don't seem well, young one. Maybe you should go back before you faint. But in case you don't heed my advice, this is for you." },
			},
			HestiaLowHealth02 =
			{
				Name = "HestiaLowHealth02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				RequiredMaxHealthFraction = 0.15,
				RequiredMaxLastStands = 1,

				{ Cue = "/VO/Hestia_0084",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I can sense your fire going out. Take some time to rest. Continue only when you feel you are ready." },
			},
			HestiaLowHealth03 =
			{
				Name = "HestiaLowHealth03",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				RequiredMaxHealthFraction = 0.10,
				RequiredMaxLastStands = 1,

				{ Cue = "/VO/Hestia_0085",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I sense your life essence growing weak. This blessing might reignite your will to live on." },
			},
			HestiaLowHealth04 =
			{
				Name = "HestiaLowHealth04",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,

				{ Cue = "/VO/Hestia_0086",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I heard that death is nothing to you, and your father will always welcome you back into his realm. The next time you fall, perhaps you should go and thank him for what he does." },
			},
			HestiaLegendaryPickUp01 =
			{
				Name = "HestiaLegendaryPickUp01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				ValuableUpgradeInRoom = {
					AllAtLeastRarity = "Rare",
					HasAtLeastRarity = "Epic",
				},
				{ Cue = "/VO/Hestia_0082",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I offer you my strongest fire. There's always a chance of getting burned, but I know you'll use it well. I also know you'll rise from your own ashes, young one." },
			},
		},

		PickupTextLineSets =
		{
			HestiaFirstPickUp =
			{
				Name = "HestiaFirstPickUp",
				PlayOnce = true,
				RequiredTextLines = { "AthenaFirstPickUp", "DionysusFirstPickUp", },
				{ Cue = "/VO/ZagreusField_4900", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 4.23 },
					PostLineAnim = "ZagreusInteractEquip", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "Who can this be? It feels so... warm. In the name of Hades! Olympus! I accept this message." },
				{ Cue = "/VO/Hestia_0001",
					PortraitExitWait = 1.25,
					PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
					UseEventEndSound = true,
					Text = "Hello, young one. It is a pleasure to meet you, Zagreus. I have heard word of your problem—this here is to show my compassion towards your cause. Until next time." },
			},
			HestiaMiscPickup01 =
			{
				Name = "HestiaMiscPickup01",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				{ Cue = "/VO/Hestia_0002",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Love is the tact of every god—the only warmth and the only peace. Take this, and remember it well." },
			},
			HestiaMiscPickup02 =
			{
				Name = "HestiaMiscPickup02",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				{ Cue = "/VO/Hestia_0003",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The fire you kindle for your enemy often burns yourself more than them. Be good to others, as I am with you now." },
			},
			HestiaMiscPickup03 =
			{
				Name = "HestiaMiscPickup03",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				RequiredMaxHealthFraction = 0.75,
				{ Cue = "/VO/Hestia_0004",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "It feels as though you don't really want to escape; rather, you are trying to find your place. Whether that is true or not, I shall support you in your quest. Take this." },
			},
			HestiaMiscPickup04 =
			{
				Name = "HestiaMiscPickup04",
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				{ Cue = "/VO/Hestia_0005",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Friendship is a fire. But whether it is going to warm your hearth or burn down your house, one can never tell. Still, we continue to try." },
			},
			HestiaMiscPickup05 =
			{
				Name = "HestiaMiscPickup05",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				{ Cue = "/VO/Hestia_0006",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Always be kind to others. No one needs to light a fire under you when there’s a fire within you. Kill them with kindness, young one." },
			},
			HestiaMiscPickup06 =
			{
				Name = "HestiaMiscPickup06",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				{ Cue = "/VO/Hestia_0007",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I use my fire to guide home all who have lost their way, including you, young one. I know you can find a home up here." },
			},
			HestiaMiscPickup07 =
			{
				Name = "HestiaMiscPickup07",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				{ Cue = "/VO/Hestia_0008",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Warmth, kindness, and friendship are the most yearned for commodities in the world, Zagreus. If you can provide them, you will never be lonely." },
			},
			HestiaMiscPickup08 =
			{
				Name = "HestiaMiscPickup08",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				{ Cue = "/VO/Hestia_0009",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "There is no formula for generating the authentic warmth of a home. It needs to be genuine. But if you continue like this, I know you will find it." },
			},
			HestiaMiscPickup09 =
			{
				Name = "HestiaMiscPickup09",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				{ Cue = "/VO/Hestia_0010",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Remember, young one: kindness is the language which the deaf can hear and the blind can see." },
			},
			HestiaMiscPickup10 =
			{
				Name = "HestiaMiscPickup10",
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				{ Cue = "/VO/Hestia_0011",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I am not going to stop helping you until you find what you are looking for. We share the same kind of determination, I suppose." },
			},
			HestiaMiscPickup11 =
			{
				Name = "HestiaMiscPickup11",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				{ Cue = "/VO/Hestia_0012",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Once a fire spreads, there's no limit to what it consumes. Be careful not to burn yourself with this, Zagreus." },
			},
			HestiaMiscPickup12 =
			{
				Name = "HestiaMiscPickup12",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				{ Cue = "/VO/Hestia_0013",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "If it isn't a passion, it isn't burning. If it isn't on fire, you haven't lived yet. This flame should help you, young one." },
			},
			HestiaMiscPickup13 =
			{
				Name = "HestiaMiscPickup13",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				{ Cue = "/VO/Hestia_0014",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "If your desire to escape was strong enough, you would already be out. Something deep inside you makes you fail. Maybe you should figure that out first, hm?" },
			},
			HestiaMiscPickup14 =
			{
				Name = "HestiaMiscPickup14",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				MinRunsSinceAnyTextLines = { TextLines = { "HestiaPostEpilogue01" }, Count = 3 },
				{ Cue = "/VO/Hestia_0015",
					PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
					Emote = "PortraitEmoteMusical",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Instead of fighting, take a moment to reflect on yourself. You are the only one that defines yourself." },
			},
			HestiaMiscPickup15 =
			{
				Name = "HestiaMiscPickup15",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp", "HestiaGift01" },
				{ Cue = "/VO/Hestia_0016",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Someday you shall make it up here and I will cook something for you, young one. But first, you must believe that you can have a home here." },
			},
			HestiaMiscPickup16 =
			{
				Name = "HestiaMiscPickup16",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				{ Cue = "/VO/Hestia_0017",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Still trying to find your place in this world, Zagreus? If you haven't figured that out, maybe you should talk to more people. Different perspectives always help in defining your own." },
			},
			HestiaMiscPickup17 =
			{
				Name = "HestiaMiscPickup17",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				{ Cue = "/VO/Hestia_0018",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I have talked to my relatives about your situation. Some of them wanted to stop supporting you, but I pleaded your case and they will double down their assitance. You're welcome!" },
			},
			HestiaMiscPickup18 =
			{
				Name = "HestiaMiscPickup18",
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				{ Cue = "/VO/Hestia_0019",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Normally I try to keep away from the family drama, but everyone deserves to rest at the hearth of their own home.  I hope this helps you reach the hearth of Olympus, young one." },
			},
			HestiaMiscPickup19 =
			{
				Name = "HestiaMiscPickup19",
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HestiaFirstPickUp" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				{ Cue = "/VO/Hestia_0020",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Maybe instead of fighting your father, you should tell him how you really feel. You never know; maybe all he wants is the love of his son?" },
			},

			-- shorter acknowledgments
			HestiaMiscPickup20 =
			{
				Name = "HestiaMiscPickup20",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
				{ Cue = "/VO/Hestia_0021",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Fight your way back, like a wildfire that never goes out." },
			},
			HestiaMiscPickup21 =
			{
				Name = "HestiaMiscPickup21",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
				{ Cue = "/VO/Hestia_0022",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "This is how the fire starts. This is how they'll burn." },
			},
			HestiaMiscPickup22 =
			{
				Name = "HestiaMiscPickup22",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
				{ Cue = "/VO/Hestia_0023",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Keep a little fire burning; however small, however hidden. It shall make you strong." },
			},
			HestiaMiscPickup23 =
			{
				Name = "HestiaMiscPickup23",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
				{ Cue = "/VO/Hestia_0024",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Life is a flame that is always burning itself out, but it catches fire again every time a child is born." },
			},
			HestiaMiscPickup24 =
			{
				Name = "HestiaMiscPickup24",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
				{ Cue = "/VO/Hestia_0025",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "What fire does not destroy, it hardens and makes stronger." },
			},
			HestiaMiscPickup25 =
			{
				Name = "HestiaMiscPickup25",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
				{ Cue = "/VO/Hestia_0026",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Fire is a good servant, but a bad master. Tame it well, young one." },
			},
			HestiaMiscPickup26 =
			{
				Name = "HestiaMiscPickup26",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
				{ Cue = "/VO/Hestia_0027",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "What matters most is how well you walk through the fire. You are doing well. Keep going." },
			},
			HestiaMiscPickup27 =
			{
				Name = "HestiaMiscPickup27",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
				{ Cue = "/VO/Hestia_0028",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "A hearth fire brings warmth and never stops, and you shall do the same. This is for you." },
			},
			HestiaMiscPickup28 =
			{
				Name = "HestiaMiscPickup28",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
				{ Cue = "/VO/Hestia_0029",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Respect those who deserve your respect. The rest will burn in their own malice." },
			},
			HestiaMiscPickup29 =
			{
				Name = "HestiaMiscPickup29",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
				{ Cue = "/VO/Hestia_0030",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Zagreus... I don't know what to do anymore. I suppose this is what you are looking for. Is that enough?" },
			},

			HestiaMiscPickup30 =
			{
				Name = "HestiaMiscPickup30",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
				{ Cue = "/VO/Hestia_0031",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I don't understand the rush to escape. Nobody is going to die.... Except perhaps you, I guess. I'm sorry, young one." },
			},
			HestiaMiscPickup31 =
			{
				Name = "HestiaMiscPickup31",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
				{ Cue = "/VO/Hestia_0032",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "There's always time to talk to others. Communication is key to any relationship. You should start with your father." },
			},
			HestiaMiscPickup32 =
			{
				Name = "HestiaMiscPickup32",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
				{ Cue = "/VO/Hestia_0033",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Get this blessing while it's hot. It's fresh out of the oven, {#DialogueItalicFormat}haha{#PreviousFormat}!" },
			},
			HestiaMiscPickup33 =
			{
				Name = "HestiaMiscPickup33",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
				{ Cue = "/VO/Hestia_0034",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "How many times have you died by now? And every time, people were there to welcome you back. You should go and thank them, young one." },
			},
			HestiaMiscPickup34 =
			{
				Name = "HestiaMiscPickup34",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
				{ Cue = "/VO/Hestia_0035",
					PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
					Emote = "PortraitEmoteMusical",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Fire doesn't care if you are good or bad; it burns all. This is why you must control it, so only the good remains." },
			},
			HestiaMiscPickup35 =
			{
				Name = "HestiaMiscPickup35",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
				{ Cue = "/VO/Hestia_0036",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Such youth. Such tenacity. I wish I was younger, like you. I hope this old lady's blessing is good enough, Zagreus." },
			},
			HestiaMiscPickup36 =
			{
				Name = "HestiaMiscPickup36",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
				{ Cue = "/VO/Hestia_0037",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Always look forward in life... and, in your case, death as well. Haha. But seriously, keep going." },
			},
			HestiaMiscPickup37 =
			{
				Name = "HestiaMiscPickup37",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
				{ Cue = "/VO/Hestia_0038",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "It must be dark down there. Maybe this fire can illuminate your path to a better ending." },
			},
			HestiaMiscPickup38 =
			{
				Name = "HestiaMiscPickup38",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
				{ Cue = "/VO/Hestia_0039",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "There's always someone to turn you down. But remember, there are also people to lift you up when that happens. Be nice to others." },
			},
			HestiaMiscPickup39 =
			{
				Name = "HestiaMiscPickup39",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
				{ Cue = "/VO/Hestia_0040",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I finally found you. I kept this for you. You know what to do now, right, Zagreus?" },
			},
		},

		BoughtTextLines =
		{
			HestiaLootBought01 =
			{
				Name = "HestiaLootBought01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },

				{ Cue = "/VO/Hestia_0095",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Charon sold my blessing to you? He should be giving them away for free. I'll try to convince him next time." },
			},
			HestiaLootBought02 =
			{
				Name = "HestiaLootBought02",
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },

				{ Cue = "/VO/Hestia_0096",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Obols are of no importance; only love and relationships matter. You did well not getting attached to that coin." },
			},
			HestiaLootBought03 =
			{
				Name = "HestiaLootBought03",
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },

				{ Cue = "/VO/Hestia_0097",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I suppose this is the price of showing compassion towards Charon for all he is doing for you. Though, it's not much, when you think about it." },
			},
		},

		RejectionTextLines =
		{
			HestiaRejection01 =
			{
				Name = "HestiaRejection01",
				{ Cue = "/VO/Hestia_0098",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I showed you how to sacrifice yourself for others. Now, you'll have to sacrifice yourself for me." },
			},
			HestiaRejection02 =
			{
				Name = "HestiaRejection02",
				{ Cue = "/VO/Hestia_0099",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Here's some wisdom: choose me next time." },
			},
			HestiaRejection03 =
			{
				Name = "HestiaRejection03",
				{ Cue = "/VO/Hestia_0100",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "That was a risky move. Don't stand too close to the fire, Zagreus. You'll burn yourself." },
			},
			HestiaRejection04 =
			{
				Name = "HestiaRejection04",
				{ Cue = "/VO/Hestia_0101",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I use fire to illuminate the right path. However, it does have other uses. Allow me show you, young one." },
			},
			HestiaRejection05 =
			{
				Name = "HestiaRejection05",
				{ Cue = "/VO/Hestia_0102",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Sometimes you need to be harsh to teach your children. Pay attention to this lesson, young one." },
			},
			HestiaRejection06 =
			{
				Name = "HestiaRejection06",
				{ Cue = "/VO/Hestia_0103",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I generally think you should be equally nice to everyone, but next time, I would appreciate it if you picked me." },
			},
			HestiaRejection07 =
			{
				Name = "HestiaRejection07",
				{ Cue = "/VO/Hestia_0104",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Family shouldn't fight, but sometimes it's the only way to resolve our differences. So be it." },
			},
			HestiaRejection08 =
			{
				Name = "HestiaRejection08",
				{ Cue = "/VO/Hestia_0105",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "That's not how you show compassion. You need to be taught a lesson." },
			},
			HestiaRejection09 =
			{
				Name = "HestiaRejection09",
				{ Cue = "/VO/Hestia_0106",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Why choose between us? You'll always make someone mad at you. So young, and so much to learn." },
			},
			HestiaRejection10 =
			{
				Name = "HestiaRejection10",
				{ Cue = "/VO/Hestia_0107",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The solution here was neither. You'll learn it the hard way." },
			},
			HestiaRejection11 =
			{
				Name = "HestiaRejection11",
				{ Cue = "/VO/Hestia_0108",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I already forgive you, but that doesn't mean I won't make it hard." },
			},
			HestiaRejection12 =
			{
				Name = "HestiaRejection12",
				{ Cue = "/VO/Hestia_0109",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Some choices are hard to make. I hope you had your reasons. Still, here it comes." },
			},
		},
		FreePassVoiceLines = {
			HestiaFreePass01 =
			{
				PlayOnce = true,
				Name = "HestiaFreePass01",
				{ Cue = "/VO/Hestia_0168",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I believe you know me enough by now. I don't like conflict. I don't see the point of fighting you. Take this and be on your way, young one." },
			},
			HestiaFreePass02 =
			{
				PlayOnce = true,
				Name = "HestiaFreePass02",
				RequiredTextLines = { "HestiaFreePass01" },
				RequiredMinAnyTextLines = { TextLines = { "ZeusFreePass01", "PoseidonFreePass01", "AresFreePass01",
					"DionysusFreePass01", "AthenaFreePass01", "ArtemisFreePass01", "AphroditeFreePass01", "ApolloFreePass01",
					"HeraFreePass01", "HestiaFreePass01", "HestiaFreePass02" }, Count = 3 },
				{ Cue = "/VO/Hestia_0169",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I have something to say. I talked to young Ares, and he explained the importance of conflict in life; how it forces us to improve each other. I'll let you have my gift this time, but you'd better pick me next time if you don't want to face the wrath of an old lady." },
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

				-- I didn't mean to, Lady Hestia.
				{ Cue = "/VO/ZagreusField_4902" },
				-- I am very sorry, Lady Hestia.
				{ Cue = "/VO/ZagreusField_4903" },
				-- It isn't anything against you, Lady Hestia.
				{ Cue = "/VO/ZagreusField_4904" },
				-- I don't know why I did that, Lady Hestia.
				{ Cue = "/VO/ZagreusField_4905" },
			},
			[2] = GlobalVoiceLines.GodRejectedVoiceLines,
		},

		MakeUpTextLines =
		{
			HestiaMakeUp01 =
			{
				Name = "HestiaMakeUp01",

				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hestia_0110",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Forgive, and forget." },
			},
			HestiaMakeUp02 =
			{
				Name = "HestiaMakeUp02",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hestia_0111",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Blood under the bridge, isn't that what you say in your realm?" },
			},
			HestiaMakeUp03 =
			{
				Name = "HestiaMakeUp03",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hestia_0112",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "We should all be selective in our battles, and try not to make every problem a war. Which is why I forgive you." },
			},
			HestiaMakeUp04 =
			{
				Name = "HestiaMakeUp04",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hestia_0113",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "By forgiving you now, I hope you can forgive those who wrong you." },
			},
			HestiaMakeUp05 =
			{
				Name = "HestiaMakeUp05",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hestia_0114",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I don't like fighting. I just wanted to teach you that there can be consequences for our actions." },
			},
			HestiaMakeUp06 =
			{
				Name = "HestiaMakeUp06",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hestia_0115",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Communication comes in many forms. Fighting is one of them. But it is certainly not my favorite." },
			},
			HestiaMakeUp07 =
			{
				Name = "HestiaMakeUp07",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hestia_0116",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You didn't choose me because you knew I would understand. You just didn't want to make the others feel bad. How kind of you." },
			},
			HestiaMakeUp08 =
			{
				Name = "HestiaMakeUp08",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hestia_0117",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Stop! I do not want to fight you. It is never the solution." },
			},
			HestiaMakeUp09 =
			{
				Name = "HestiaMakeUp09",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hestia_0118",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "War will only bring more war. Let's make peace to stop the cycle of hate." },
			},
			HestiaMakeUp10 =
			{
				Name = "HestiaMakeUp10",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hestia_0119",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "We might have our differences, but it's not worth fighting over. It is never worth fighting." },
			},
			HestiaMakeUp11 =
			{
				Name = "HestiaMakeUp11",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hestia_0120",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Truce! You cannot defeat me and I refuse to defeat you. Let's end it here." },
			},
			HestiaMakeUp12 =
			{
				Name = "HestiaMakeUp12",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hestia_0121",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "What are you doing? I came here to help you. Let's stop fighting, and take this." },
			},
		},

		GiftTextLineSets =
		{
			-- gives gift in exchange
			HestiaGift01 =
			{
				Name = "HestiaGift01",
				PlayOnce = true,
				{ Cue = "/VO/ZagreusHome_3871", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "You've been so kind to me, Lady Hestia. I found this, and wanted to give it to you to show my appreciation." },
				{ Cue = "/VO/Hestia_0122",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Giving to others while you don't have much yourself, {#DialogueItalicFormat}hm{#PreviousFormat}? This shows how good your heart is. I shall return the kindness, if you'll allow me." },
			},
			HestiaGift02 =
			{
				Name = "HestiaGift02",
				PlayOnce = true,
				RequiredTextLines = { "HestiaGift01" },
				{ Cue = "/VO/ZagreusHome_3872", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "You seemed to have enjoyed my last gift, Lady Hestia. Here's a little more for you." },
				{ Cue = "/VO/Hestia_0123",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Young one, I feel the genuine warmth. The affection. No joke! I am touched by your gesture." },
			},
			HestiaGift03 =
			{
				Name = "HestiaGift03",
				PlayOnce = true,
				RequiredTextLines = { "HestiaGift02" },
				{ Cue = "/VO/ZagreusHome_3873", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "Lady Hestia, you are so motherly. I feel like you should get this for everything you do." },
				{ Cue = "/VO/Hestia_0124",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I do not have children, but if I did, I could only hope they would act as you do. Good deeds are always rewarded." },
			},
			HestiaGift04 =
			{
				Name = "HestiaGift04",
				PlayOnce = true,
				RequiredTextLines = { "HestiaGift03" },
				{ Cue = "/VO/ZagreusHome_3874", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "I found this and I really wanted you to have it. It's my way to repay all the kindness you're showing me." },
				{ Cue = "/VO/Hestia_0125",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Oh{#PreviousFormat}! I was running short on that. However, I don't believe you should be the one to provide it to me, since it's so rare within your realm." },
			},
			HestiaGift05 =
			{
				Name = "HestiaGift05",
				PlayOnce = true,
				RequiredTextLines = { "HestiaGift04" },
				{ Cue = "/VO/ZagreusHome_3875", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "It was hard, but I finally found this. And I wanted to give it to you, Lady Hestia. I hope you'll accept it." },
				{ Cue = "/VO/Hestia_0126",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Sharing even when you have nothing is very kind of you. I also try to share as much as I can, and spread love to others." },
			},
			HestiaGift06 =
			{
				Name = "HestiaGift06",
				PlayOnce = true,
				RequiredTextLines = { "HestiaGift05" },
				{ Cue = "/VO/ZagreusHome_3876", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "You seem to appreciate all my gifts. I didn't know you liked Nectar so much, Lady Hestia. I wanted to give you some more." },
				{ Cue = "/VO/Hestia_0127",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I must confess, I keep giving your gifts to those in need. I suppose it would be faster if you gave those to others from now on. I'm sorry I didn't tell you sooner." },
			},
			HestiaGift07 =
			{
				Name = "HestiaGift07",
				PlayOnce = true,
				RequiredTextLines = { "HestiaGift06" },
				{ Cue = "/VO/ZagreusHome_3877", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "You said that you gave all my gifts to others, but I wanted to give you something more valuable, Lady Hestia. I hope you'll keep this one." },
				{ Cue = "/VO/Hestia_0128",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					PostLineThreadedFunctionName = "MaxedRelationshipPresentation",
					PostLineFunctionArgs = { Text = "NPC_Hestia_01", Icon = "Keepsake_HestiaSticker_Max" },
					Text = "This is too much! You know what? With this gift, I prononce us the Warmth and Compassion Brigade! It might sound silly, but if we can make others laugh at the name, we're already well on our way to bringing people together. Now, here's your badge to prove it." },
			},
		},

		GiftGivenVoiceLines =
		{
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			PlayFromTarget = true,

			-- I'll allow it. Thanks for your kindness, Lady Hestia.
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
				RequiredFalseSpurnedGodName = "HestiaUpgrade",

				-- Punish those who misbehave!
				{ Cue = "/VO/Hestia_0129" },
				-- Only ashes shall remain.
				{ Cue = "/VO/Hestia_0130" },
				-- So much violence!
				{ Cue = "/VO/Hestia_0164" },
				-- We will bring peace to this realm.
				{ Cue = "/VO/Hestia_0131" },
				-- Let's teach them a lesson.
				{ Cue = "/VO/Hestia_0132" },
				-- No soup for you!
				{ Cue = "/VO/Hestia_0133" },
				-- Fire knows no limit!
				{ Cue = "/VO/Hestia_0134" },
				-- We are the Warmth and Compassion Brigade!
				{ Cue = "/VO/Hestia_0135", RequiredTextLines = { "HestiaGift07" } },
			},
			{
				BreakIfPlayed = true,
				PlayFromTarget = true,
				RandomRemaining = true,
				RequiredKillEnemiesFound = true,
				RequiredSpurnedGodName = "HestiaUpgrade",
				RequireCurrentEncounterNotComplete = true,

				-- Why are you doing this?
				{ Cue = "/VO/Hestia_0136" },
				-- I was only kind to you...
				{ Cue = "/VO/Hestia_0137" },
				-- This nonsense has to stop...
				{ Cue = "/VO/Hestia_0138" },
				-- There's no reason to fight like this.
				{ Cue = "/VO/Hestia_0139" },
				-- Fighting is not the solution...
				{ Cue = "/VO/Hestia_0140" },
			},
		},

		SwapUpgradePickedVoiceLines =
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			PreLineWait = 1.05,
			SuccessiveChanceToPlay = 0.33,
			CooldownName = "SaidHestiaRecently",
			CooldownTime = 40,
			RequiresLastUpgradeSwapped = true,
			UsePlayerSource = true,

			-- Oh, that's warmer thanks to you, Lady Hestia.
			{ Cue = "/VO/ZagreusField_4936" },
			-- Lady Hestia, you've always been kind to me.
			{ Cue = "/VO/ZagreusField_4937" },
			-- Lady Hestia, I feel at home thanks to you.
			{ Cue = "/VO/ZagreusField_4938" },
		},

		DeathTauntVoiceLines =
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.25,
			NoTarget = true,

			-- I didn't it want to come to this. Forgive me.
			{ Cue = "/VO/Hestia_0141" },
			-- Go back to your father. Find your true home.
			{ Cue = "/VO/Hestia_0142" },
			-- I did this out of kindness. I know someday you'll understand.
			{ Cue = "/VO/Hestia_0143" },
		},

		BlindBoxOpenedVoiceLines =
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.3,
			Source = { SubtitleColor = Color.HestiaVoice },
			TriggerCooldowns = { "ZagreusBoonTakenSpeech" },

			-- Oh hoh, you are on fire, young one!
			{ Cue = "/VO/Hestia_0144" },
			-- This shall keep you warm.
			{ Cue = "/VO/Hestia_0145" },
			-- We can do this together.
			{ Cue = "/VO/Hestia_0146" },
			-- I appreciate your gesture, young one.
			{ Cue = "/VO/Hestia_0147" },
			-- You are going to burn it to the ground, aren't you?
			{ Cue = "/VO/Hestia_0148" },
		},
	}
	-- FreePass PickupLines
	OlympusLootData.ZeusUpgrade.FreePassVoiceLines = {
		ZeusFreePass01 =
		{
			PlayOnce = true,
			Name = "ZeusFreePass01",
			{ Cue = "/VO/Zeus_0262",
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "I am the strongest of my siblings, Zagreus. Yet, you picked Hestia over me. Well, she's very kind, I must admit. I suppose I'll show you the same kindess... this time." },
		},
	}
	OlympusLootData.PoseidonUpgrade.FreePassVoiceLines = {
		PoseidonFreePass01 =
		{
			PlayOnce = true,
			Name = "PoseidonFreePass01",
			{ Cue = "/VO/Poseidon_0262",
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "You should always pick your uncle over your aunt. I'll spare you the fight this time, but only because I want to show you who's your best relative!" },
		},
	}
	OlympusLootData.AthenaUpgrade.FreePassVoiceLines = {
		AthenaFreePass01 =
		{
			PlayOnce = true,
			Name = "AthenaFreePass01",
			{ Cue = "/VO/Athena_0252",
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "You picked Lady Hestia, I see. A strategic meanuver. In turn, I shall strategically spare you the fight this time. May you use it in your favor." },
		},
	}
	OlympusLootData.AresUpgrade.FreePassVoiceLines = {
		AresFreePass01 =
		{
			PlayOnce = true,
			Name = "AresFreePass01",
			{ Cue = "/VO/Ares_0252",
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "My kin... I do not appreciate this slight. However, since you picked the Lady Hestia, and she has personally beseeched me to find it in my heart to forgive such disrespect, I suppose I shall give you a pass this time. But mark my word, this will happen only once." },
		},
	}
	OlympusLootData.AphroditeUpgrade.FreePassVoiceLines = {
		AphroditeFreePass01 =
		{
			PlayOnce = true,
			Name = "AphroditeFreePass01",
			{ Cue = "/VO/Aphrodite_0242",
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Oh? How coy of you, dearest. You don't have to pick other gods to play hard to get. It won't work on me. No contest." },
		},
	}
	OlympusLootData.ArtemisUpgrade.FreePassVoiceLines = {
		ArtemisFreePass01 =
		{
			PlayOnce = true,
			Name = "ArtemisFreePass01",
			{ Cue = "/VO/Artemis_0262",
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "Look, I also appreciate Hestia, but that's no reason not to pick me. I mean... {#DialogueItalicFormat}Huh{#PreviousFormat} alright, I'll let it go this time. Don't get used to it." },
		},
	}
	OlympusLootData.DionysusUpgrade.FreePassVoiceLines = {
		DionysusFreePass01 =
		{
			PlayOnce = true,
			Name = "DionysusFreePass01",
			{ Cue = "/VO/Dionysus_0242",
				PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
				StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
				Text = "{#DialogueItalicFormat}Ohh{#PreviousFormat}, Zag, you should always pick me. Wait... You picked Hestia? Nevermind, she deserves this one after all she's done for me. I'll even pitch this in." },
		},
	}
	OlympusLootData.DemeterUpgrade.RejectionTextLines.DemeterFakeFreePass01 = {
		PlayOnce = true,
		Name = "DemeterFakeFreePass01",
		RequiredAnyTextLines = { "ZeusFreePass01", "PoseidonFreePass01", "AthenaFreePass01", "AresFreePass01",
			"AphroditeFreePass01", "ArtemisFreePass01", "DionysusFreePass01", },
		{ Cue = "/VO/Demeter_0382",
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
			Text = "Truly, you picked her, Zagreus? Well, I am not like the others. I won't be foul. I'll teach you whom to trust." },
	}
	OlympusLootData.DemeterUpgrade.MakeUpTextLines.DemeterFakeFreePassFollow01 = {
		PlayOnce = true,
		Name = "DemeterFakeFreePassFollow01",
		Priority = true,
		RequiredTextLines = { "DemeterFakeFreePass01" },
		{ Cue = "/VO/Demeter_0383",
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
			Text = "I hope next time you have to make such a choice, it won't be her, Zagreus." },
	}

	-- Duo PickupLines
	OlympusLootData.ZeusUpgrade.DuoPickupTextLineSets.ZeusWithHestia01 = {
		Name = "ZeusWithHestia01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "PullZeusCastTrait",
		{ Cue = "/VO/Zeus_0261",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "My Foster-Sister and I came to give you a few sparks. She thinks it's what's been missing in our relationship." },
		{ Cue = "/VO/Hestia_0049",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			StartSound = "/SFX/BurnDamage",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
			Text = "Sparks become fire, and Zagreus needs the firepower to join us. We must show him what he means to us." },
	}
	OlympusLootData.PoseidonUpgrade.DuoPickupTextLineSets.PoseidonWithHestia01 = {
		Name = "PoseidonWithHestia01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "FishingRewardExtraTrait",
		{ Cue = "/VO/Poseidon_0261",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "You still seem to hold a grudge against me, dear Foster-Sister. You always were hard to read. I wonder what I did to upset you so?" },
		{ Cue = "/VO/Hestia_0050",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			StartSound = "/SFX/BurnDamage",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
			Text = "You still don't get it—this is not about me, it is between you and your brothers. I'm no longer up there, and I won't be the one showing you the wrongs you must make amends for. I believe one day you'll come to understand, and fix the situation. I have hope." },
	}
	OlympusLootData.AthenaUpgrade.DuoPickupTextLineSets.AthenaWithHestia01 = {
		Name = "AthenaWithHestia01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "MoreTrapDamageTrait",
		{ Cue = "/VO/Athena_0251",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "Lady Hestia. Make sure the fire you give to Zagreus doesn't burn him. That would be very conterproductive to our cause. I can only shield him so much." },
		{ Cue = "/VO/Hestia_0051",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			StartSound = "/SFX/BurnDamage",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
			Text = "Oh, young Athena, do not fret. My fire only burns those whose heart is impure. Zagreus should have nothing to fear; of that, I am sure." },
	}
	OlympusLootData.AresUpgrade.DuoPickupTextLineSets.AresWithHestia01 = {
		Name = "AresWithHestia01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "FoesNumberDamageTrait",
		{ Cue = "/VO/Ares_0251",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "Lady Hestia, are you going to let him fight with hugs and kisses? I think we can agree to give him something more." },
		{ Cue = "/VO/Hestia_0052",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			StartSound = "/SFX/BurnDamage",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
			Text = "Oh, Ares, Nephew. Violence is rarely the solution to any problem. But I must agree, Zagreus will need more than compassion this time." },
	}
	OlympusLootData.AphroditeUpgrade.DuoPickupTextLineSets.AphroditeWithHestia01 = {
		Name = "AphroditeWithHestia01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "FreeHealthTrait",
		{ Cue = "/VO/Aphrodite_0241",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "Oh, Lady Hestia. You are positively smoking hot, as always. I can't believe you've never taken up with any suitors! You don't know what you are missing." },
		{ Cue = "/VO/Hestia_0053",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			StartSound = "/SFX/BurnDamage",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
			Text = "Young Aphrodite, you still have so much to learn. Love comes in many forms, and to love others you must start with yourself. You don't need anyone else when you have everybody on your side." },
	}
	OlympusLootData.ArtemisUpgrade.DuoPickupTextLineSets.ArtemisWithHestia01 = {
		Name = "ArtemisWithHestia01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "ExplosionTrait",
		{ Cue = "/VO/Artemis_0261",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "Lady Hestia, could you... give me the recipe once again for the smoky boar I made from the spoils of my hunt the other day? I'd like to hunt another, I think." },
		{ Cue = "/VO/Hestia_0054",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			StartSound = "/SFX/BurnDamage",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
			Text = "Well of course, you are being so kind to Zagreus, and I know that must require a lot of effort for you. Let's help Zagreus, and then I'll write it down." },
	}
	OlympusLootData.DionysusUpgrade.DuoPickupTextLineSets.DionysusWithHestia01 = {
		Name = "DionysusWithHestia01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "FullHealBossTrait",
		{ Cue = "/VO/Dionysus_0241",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "Oh hey, Hestia. I know I seem to party a lot, but I swear I am doing my part as an Olympian. You can ask the others." },
		{ Cue = "/VO/Hestia_0055",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			StartSound = "/SFX/BurnDamage",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
			Text = "Don't worry, my child. I did not come to take my seat back. I know you do your part, and can see how much you've helped Zagreus. I came to help him too, so let's do it together." },
	}
	OlympusLootData.DemeterUpgrade.DuoPickupTextLineSets.DemeterWithHestia01 = {
		Name = "DemeterWithHestia01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "ChillFireTrait",
		{ Cue = "/VO/Demeter_0381",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "I know we don't always agree on things, but I must say, being strong, independent goddesses makes us understand each other." },
		{ Cue = "/VO/Hestia_0056",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			StartSound = "/SFX/BurnDamage",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
			Text = "We can agree. I believe it is our methods that diverge. I treat everybody as my own children, while you treated your own daughter as a stranger. Don't do the same to Zagreus. Show that you care." },
	}
	-- Duo LootData
	OlympusLootData.AphroditeUpgrade.LinkedUpgrades.FreeHealthTrait =
	{
		OneFromEachSet =
		{
			{ "HestiaWeaponTrait", "HestiaSecondaryTrait", "HestiaDashTrait", "HestiaRangedTrait" },
			{ "AphroditeWeaponTrait", "AphroditeSecondaryTrait", "AphroditeRushTrait", "AphroditeRangedTrait",
				"HealthRewardBonusTrait" }
		}
	}
	OlympusLootData.AthenaUpgrade.LinkedUpgrades.MoreTrapDamageTrait =
	{
		OneFromEachSet =
		{
			{ "HestiaRangedTrait", "HestiaRevengeTrait", "LavaDeathTrait" },
			{ "AthenaWeaponTrait", "AthenaSecondaryTrait", "AthenaRushTrait", "AthenaRangedTrait",
				"ShieldLoadAmmo_AthenaRangedTrait" }
		}
	}
	OlympusLootData.ArtemisUpgrade.LinkedUpgrades.ExplosionTrait =
	{
		OneFromEachSet =
		{
			{ "HestiaWeaponTrait", "HestiaSecondaryTrait" },
			{ "ArtemisWeaponTrait", "ArtemisSecondaryTrait", "ArtemisRangedTrait", "CritBonusTrait" }
		}
	}
	OlympusLootData.DionysusUpgrade.LinkedUpgrades.FullHealBossTrait =
	{
		OneFromEachSet =
		{
			{ "HestiaRangedTrait", "HestiaRevengeTrait", "LavaDeathTrait" },
			{ "DionysusWeaponTrait", "DionysusRangedTrait", "DionysusSecondaryTrait", "DionysusRushTrait" }
		},
	}

	OlympusLootData.AresUpgrade.LinkedUpgrades.FoesNumberDamageTrait =
	{
		OneFromEachSet =
		{
			{ "AresWeaponTrait", "AresSecondaryTrait", "AresRushTrait", "AresRangedTrait" },
			{ "HestiaWeaponTrait", "HestiaSecondaryTrait", "HestiaDashTrait", "HestiaRangedTrait" },
		},
	}

	OlympusLootData.DemeterUpgrade.LinkedUpgrades.ChillFireTrait =
	{
		OneFromEachSet =
		{
			{ "HestiaDashTrait" },
			{ "DemeterWeaponTrait", "DemeterSecondaryTrait", "DemeterShoutTrait", "DemeterRangedTrait",
				"ShieldLoadAmmo_DemeterRangedTrait" },
		},
	}

	OlympusLootData.ZeusUpgrade.LinkedUpgrades.PullZeusCastTrait =
	{
		OneFromEachSet =
		{
			{ "ZeusWeaponTrait", "ZeusRangedTrait" },
			{ "HestiaWeaponTrait", "HestiaSecondaryTrait" },
		},
	}

	OlympusLootData.PoseidonUpgrade.LinkedUpgrades.FishingRewardExtraTrait =
	{
		OneFromEachSet =
		{
			{ "LastStandDamageReduceTrait", "HealthDefianceTrait", "HealthDamageTrait" },
			{ "RoomRewardBonusTrait", "PoseidonPickedUpMinorLootTrait", "FishingTrait" },
		}
	}
	-- Other gods modification
	-- AthenaUpgrade
	table.insert(OlympusLootData.AthenaUpgrade.PriorityPickupTextLineSets.AthenaVsOlympians01.RequiredTextLines,
		"HestiaFirstPickUp")

	-- HermesUpgrade
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian01.RequiredMinAnyTextLines
		.TextLines, "HermesExpectingHestia01")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian01.RequiredFalseGodLoots
		, "HestiaUpgrade")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian01.RequiredOneOfTraits
		, "ForceHestiaBoonTrait")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian02.RequiredMinAnyTextLines
		.TextLines, "HermesExpectingHestia01")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian02.RequiredFalseGodLoots
		, "HestiaUpgrade")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian02.RequiredOneOfTraits
		, "ForceHestiaBoonTrait")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian03.RequiredMinAnyTextLines
		.TextLines, "HermesExpectingHestia01")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian03.RequiredFalseGodLoots
		, "HestiaUpgrade")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian03.RequiredOneOfTraits
		, "ForceHestiaBoonTrait")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian04.RequiredMinAnyTextLines
		.TextLines, "HermesExpectingHestia01")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian04.RequiredFalseGodLoots
		, "HestiaUpgrade")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian04.RequiredOneOfTraits
		, "ForceHestiaBoonTrait")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian05.RequiredMinAnyTextLines
		.TextLines, "HermesExpectingHestia01")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian05.RequiredFalseGodLoots
		, "HestiaUpgrade")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian05.RequiredOneOfTraits
		, "ForceHestiaBoonTrait")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian06.RequiredMinAnyTextLines
		.TextLines, "HermesExpectingHestia01")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian06.RequiredFalseGodLoots
		, "HestiaUpgrade")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian06.RequiredOneOfTraits
		, "ForceHestiaBoonTrait")

	OlympusLootData.HermesUpgrade.SuperPriorityPickupTextLineSets.HermesExpectingHestia01 =
	{
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		MinRunsSinceSquelchedHermes = ConstantsData.SquelchedHermesRunCount,
		RequiredTextLines = { "HermesFirstPickUp" },
		RequiredFalseGodLoot = "HestiaUpgrade",
		RequiredTrait = "ForceHestiaBoonTrait",
		EndVoiceLines = GlobalVoiceLines.RushedHermesVoiceLines,

		{ Cue = "/VO/Hermes_0241",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
			Text = "Hi, boss. Hestia wanted to be here, but you know what they say: she had a fire to put out. Anyway, that blessing will still be warm!" },
	}

	-- Gift Section
	local OlympusGiftOrdering = ModUtil.Entangled.ModData(GiftOrdering)
	local OlympusGiftData = ModUtil.Entangled.ModData(GiftData)
	table.insert(OlympusGiftOrdering, 21, "ForceHestiaBoonTrait")

	OlympusGiftData.HestiaUpgrade =
	{
		InheritFrom = { "DefaultGiftData" },
		MaxedIcon = "Keepsake_Hestia_Max",
		MaxedSticker = "Keepsake_HestiaSticker_Max",
		MaxedRequirement = { RequiredTextLines = { "HestiaGift07" }, },
		Value = 0,
		Maximum = 7,
		Locked = 7,
		[1] = { Gift = "ForceHestiaBoonTrait" },
		[7] = { RequiredResource = "SuperGiftPoints" },
		UnlockGameStateRequirements = { RequiredTextLines = { "HestiaForgiveness03" } }
	}

	-- Multi Gods compatibility
	if ModUtil.Mods.Data["HestiaExtra"] ~= nil and ModUtil.Mods.Data["ApolloExtra"] ~= nil then
        OlympusLootData.HestiaUpgrade.LinkedUpgrades.ShoutMoreHealTrait =
        {
            OneFromEachSet =
            {
                { "HestiaShoutTrait" },
                { "ApolloWeaponTrait", "ApolloDashTrait", "ApolloRangedTrait", "ApolloSecondaryTrait" }
            }
        }
        OlympusLootData.ApolloUpgrade.LinkedUpgrades.ShoutMoreHealTrait =
        {
            OneFromEachSet =
            {
                { "HestiaShoutTrait" },
                { "ApolloWeaponTrait", "ApolloDashTrait", "ApolloRangedTrait", "ApolloSecondaryTrait" }
            }
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
                Text = "Ah, Lady Hestia, nothing makes me more happy than helping our beloved Zagzag. But Artemis should have told me about him way earlier! Anyway, what's important is that we're here now." },
        }
        OlympusLootData.ApolloUpgrade.DuoPickupTextLineSets.ApolloWithHestia01 = {
            Name = "ApolloWithHestia01",
            PlayOnce = true,
            PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
            HasTraitNameInRoom = "BlindAuraTrait",
            { Cue = "/VO/Apollo_0301",
                StartSound = "/Leftovers/World Sounds/MapZoomInShort",
                Text = "With my light and your warmth, Aunty, Zagzag truly has the power of the sun on his side. And the sun belongs up in the sky with us." },
            { Cue = "/VO/Hestia_0167",
                PortraitExitWait = 0.35,
                PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
                StartSound = "/SFX/BurnDamage",
                EndSound = "/Leftovers/World Sounds/MapZoomInShort",
                Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
                Text = "Haha, always the poet, I see. I must say, since Zagreus cannot, that I appreciate everything you do for our {#DialogueItalicFormat}Zagzag{#PreviousFormat}. Though, I wouldn't call him that, since he could find a worse nickname in turn." },
        }
        OlympusLootData.ApolloUpgrade.FreePassVoiceLines = {
            ApolloFreePass01 =
            {
                PlayOnce = true,
                Name = "ApolloFreePass01",
                { Cue = "/VO/Apollo_0371",
                    PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
                    StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
                    Text = "You think Lady Hestia is generous? Well, Zagzag, I'll show {#DialogueItalicFormat}you {#PreviousFormat}generosity. No fight this time, just blessings. I bet you'll think twice before you cross me again." },
            },
        }
    end


	-- FUNCTIONS
	-- Attraction functions
	function GetAllNearestEnemiesArgs(args, targetId)
		local range = args.Range or 500
		local count = args.Count or 3
		if HeroHasTrait("StrongAttractionTrait") then
			count = count + GetTotalHeroTraitValue("AttractionCount")
			range = range + 1000 * GetTotalHeroTraitValue("AttractionDistance")
		end
		local arc = args.Arc or 90
		local nearestEnemyTargetIds = GetClosestIds({ Id = targetId, DestinationName = "EnemyTeam", IgnoreInvulnerable = true,
			IgnoreHomingIneligible = true, Distance = range, MaximumCount = count })
		local facingAngle = GetAngle({ Id = CurrentRun.Hero.ObjectId })
		local allNearbyEnemies = {}
		for _, id in pairs(nearestEnemyTargetIds) do
			local enemy = ActiveEnemies[id]
			if enemy ~= nil and not enemy.IsDead and not enemy.IgnoreAutoLock then
				local angleToTarget = GetAngleBetween({ Id = targetId, DestinationId = id })
				local distance = GetDistance({ Id = targetId, DestinationId = id })
				if CalcArcDistance(facingAngle, angleToTarget) <= arc then
					if distance < range * 2 then
						table.insert(allNearbyEnemies, id)
					end
				elseif not args.RequireFacing then
					if distance < range * 2 then
						table.insert(allNearbyEnemies, id)
					end
				end
			end
		end
		return allNearbyEnemies
	end

	function CheckChargeVacuumAllNearbyEnemies(weaponData, args)
		CheckProjectileVacuumAllNearbyEnemies(weaponData, CurrentRun.Hero.ObjectId, args)
	end

	function CheckFiredVacuumAllNearbyEnemies(weaponData, args)
		CheckProjectileVacuumAllNearbyEnemies(weaponData, CurrentRun.Hero.ObjectId, args)
	end

	function CheckProjectileVacuumAllNearbyEnemies(weaponData, triggerArgs, args)
		local args = args[weaponData.Name] or { PullForce = 1000, Range = 500, Count = 3, Arc = 90, Distance = 10 }
		if args.Traits ~= nil then
			for name, trait in pairs(args.Traits) do
				if HeroHasTrait(name) then
					args = trait
					break
				end
			end
		end
		if args.Skip then
			return
		end
		local pullTarget
		if type(triggerArgs) ~= "number" then
			if args.RequireFirstHit and triggerArgs.FirstUnitInVolley then
				pullTarget = triggerArgs.FirstUnitInVolley.ObjectId
			elseif triggerArgs.LocationX and triggerArgs.LocationY then
				pullTarget = SpawnObstacle({ Name = "InvisibleTarget", LocationX = triggerArgs.LocationX,
					LocationY = triggerArgs.LocationY })
			else
				pullTarget = CurrentRun.Hero.ObjectId
			end

		else
			pullTarget = triggerArgs
		end
		local targetIds = GetAllNearestEnemiesArgs(args, pullTarget)
		for _, id in pairs(targetIds) do
			if id ~= 0 and ActiveEnemies[id] ~= nil and not ActiveEnemies[id].IsDead then
				local force = GetRequiredForceToEnemy(id, pullTarget, -1 * args.Distance)
				if (type(force) ~= "number" or args.PullForce < force) then
					-- if HeroHasTrait("StrongAttractionTrait") then
					-- 	force = args.PullForce * GetTotalHeroTraitValue("AttractionCount")
					-- else
					force = args.PullForce
					-- end
				end
				if not args.RequireFirstHit or pullTarget ~= id then
					ApplyForce({ Id = id, Speed = force,--[[ MaxSpeed = 1000,]]
						Angle = GetAngleBetween({ Id = id, DestinationId = pullTarget, SelfApplied = true }) })
					HestiaPullPresentation(id, args, pullTarget)
				end
			end
		end
	end

	function HestiaPullPresentation(victimId, args, dropLocation)
		CreateAnimationsBetween({ Animation = "HestiaFistVacuumFx", DestinationId = victimId, Id = dropLocation,
			Length = args.distanceBuffer, Stretch = true, UseZLocation = false, Group = "FX_Standing_Add" })
		PlaySound({ Name = "/SFX/Player Sounds/ZagreusFistMagnetismVacuumActivate", Id = victimId })
	end

	OnProjectileDeath {
		function(triggerArgs)
			local attacker = triggerArgs.AttackerTable
			local weaponData = GetWeaponData(attacker, triggerArgs.WeaponName)
			local victim = triggerArgs.FirstUnitInVolley
			if CurrentRun.Hero and attacker == CurrentRun.Hero and victim == nil then
				for i, traitData in pairs(GetHeroTraitValues("OnWeaponProjectileDeathFunction")) do
					if (traitData.ValidWeapons == nil or Contains(traitData.ValidWeapons, triggerArgs.name)) and traitData.FunctionName
						and _G[traitData.FunctionName] then
						thread(_G[traitData.FunctionName], weaponData, triggerArgs, traitData.FunctionArgs)
					end
				end
			end
		end
	}
	OnHit {
		function(triggerArgs)
			local attacker = triggerArgs.AttackerTable
			local attackerWeaponName = triggerArgs.SourceWeapon
			triggerArgs.AttackerWeaponData = GetWeaponData(attacker, attackerWeaponName)
			local victim = triggerArgs.TriggeredByTable
			if victim ~= nil and (victim.CanBeAggroed or victim.Name == "TrainingMelee") and victim ~= CurrentRun.Hero then
				for i, traitData in pairs(GetHeroTraitValues("OnWeaponHitFunctions")) do
					if (traitData.ValidWeapons == nil or Contains(traitData.ValidWeapons, attackerWeaponName)) and
						traitData.FunctionName and _G[traitData.FunctionName] then
						thread(_G[traitData.FunctionName], triggerArgs.AttackerWeaponData, victim.ObjectId, traitData.FunctionArgs)
					end
				end
			end
		end
	}
	-- Shout functions
	function HestiaShout()
		FireWeaponFromUnit({ Weapon = "HestiaSuper", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId,
			AutoEquip = true, ClearAllFireRequests = true })
	end

	function HestiaMaxShout()
		FireWeaponFromUnit({ Weapon = "HestiaMaxSuper", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId,
			AutoEquip = true, ClearAllFireRequests = true })
	end

	function EndHestia()
		ExpireProjectiles({ Names = { "HestiaSuper", "HestiaMaxSuper" } })
	end

	-- LastStand Hestia functions
	ModUtil.Path.Wrap("CheckLastStand",
		function(baseFunc, victim, triggerArgs)
			local hasLastStand = baseFunc(victim, triggerArgs)
			if HeroHasTrait("HealthDefianceTrait") and hasLastStand then
				AddMaxHealth(GetTotalHeroTraitValue("DefianceExtraHealth"), "HealthDefianceTrait",
					{ Delay = 0.01, NoHealing = true, Thread = true })
			end
			return hasLastStand
		end
	)

	-- Hestia FreeHealthTrait
	ModUtil.Path.Wrap("SpawnRoomReward",
		function(baseFunc, eventSource, args)
			if HeroHasTrait("FreeHealthTrait") and CurrentRun.CurrentRoom.Encounter ~= nil and
				CurrentRun.CurrentRoom.Encounter.EncounterType ~= nil then
				if CurrentRun.CurrentRoom.Encounter.EncounterType == "Boss" or
					CurrentRun.CurrentRoom.Encounter.EncounterType == "OptionalBoss" then
					local consumableId = SpawnObstacle({ Name = "RoomRewardMaxHealthDrop", DestinationId = CurrentRun.Hero.ObjectId,
						Group = "Standing" })
					local cost = 0
					local consumable = CreateConsumableItem(consumableId, "RoomRewardMaxHealthDrop", cost)
					ActivatedObjects[consumable.ObjectId] = consumable
					PlaySound({ Name = "/Leftovers/World Sounds/TrainingMontageWhoosh", Id = consumableId })
					thread(InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text = "FreeHealthText", Duration = 1 })
					-- end
					-- { "WretchAssassinMiniboss", "HeavyRangedSplitterMiniboss", "RatThugMiniboss", "ThiefImpulseMineLayerMinoboss", "HeavyRangedForkedMiniboss", "StayrRangedMiniboss", "CrawlerMiniboss" }
				elseif CurrentRun.CurrentRoom.IsMiniBossRoom then
					local consumableId = SpawnObstacle({ Name = "RoomRewardEmptyHealthDrop", DestinationId = CurrentRun.Hero.ObjectId,
						Group = "Standing" })
					local cost = 0
					local consumable = CreateConsumableItem(consumableId, "RoomRewardEmptyHealthDrop", cost)
					ActivatedObjects[consumable.ObjectId] = consumable
					PlaySound({ Name = "/Leftovers/World Sounds/TrainingMontageWhoosh", Id = consumableId })
					thread(InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text = "FreeHealthText", Duration = 1 })
				end

			end
			baseFunc(eventSource, args)
		end
	)

	function SpawnCentaurSoul()
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

	-- HealthDamageTrait
	function HealthDamagePresentation()
		--PlaySound({ Name = "/SFX/Player Sounds/DionysusBlightWineDash", Id = CurrentRun.Hero.ObjectId })
		local amount = math.floor(((GetTotalHeroTraitValue("CentaurAttackBonus", { IsMultiplier = false })) - 1) * 100);
		thread(InCombatTextArgs,
			{ TargetId = CurrentRun.Hero.ObjectId, Text = "CentaurHeartBoostedText_Alt", PreDelay = 0.55, Duration = 1,
				LuaKey = "TempTextData", LuaValue = { TraitName = "HealthDamageTrait", Amount = amount } })
	end

	function OnHealthMultiplyDamage()
		local hasDamageBonus = false
		for k, traitData in pairs(CurrentRun.Hero.Traits) do
			if traitData.CentaurAttackBonus then
				hasDamageBonus = true
				traitData.AccumulatedHealthDamageBonus = traitData.AccumulatedHealthDamageBonus + (traitData.CentaurAttackBonus - 1)
				ExtractValues(CurrentRun.Hero, traitData, traitData)
			end
		end
		if hasDamageBonus then
			HealthDamagePresentation()
		end
	end

	ModUtil.Path.Wrap("AddOutgoingLifestealModifier",
		function(baseFunc, unit, data)
			if CanAddModifiers(unit.OutgoingLifestealModifiers, data) then
				baseFunc(unit, data)
			end
		end)
	function CanAddModifiers(list, data)
		if list == nil then
			return true
		end
		for index, value in pairs(list) do
			if (value.Name == data.Name and data.Unique ~= nil) then
				return false
			end
		end
		return true
	end

	--[[ModUtil.Path.Wrap( "CalculateLifestealModifiers", 
	function ( baseFunc, attacker, victim, weaponData, triggerArgs )
		baseFunc(attacker, victim, weaponData, triggerArgs)  
		local lifesteal = 0
		if attacker ~= nil and attacker.OutgoingLifestealModifiers and victim ~= nil and not victim.BlockLifeSteal then
			for i, modifierData in pairs( attacker.OutgoingLifestealModifiers ) do
				local validWeapon = modifierData.ValidWeaponsOnce == nil or ( Contains( modifierData.ValidWeaponsOnce, triggerArgs.SourceWeapon ) and triggerArgs.EffectName == nil )
				if validWeapon then
					lifesteal = modifierData.BaseLifesteal
				end
			end
		end	
		Heal( attacker, { HealAmount = lifesteal, SourceName = "CombatLifesteal", Silent = false } )
	end)]]
	-- Lava Stuff
	ModUtil.Path.Wrap("CheckForAllEnemiesDead",
		function(baseFunc, eventSource, args)
			baseFunc(eventSource, args)
			ExpireProjectiles({ Names = { "HestiaField", "HestiaSmallField", "HestiaFieldDefense", "HestiaSmallFieldDefense" } })
		end)
	ModUtil.Path.Wrap("KillEnemy",
		function(baseFunc, victim, triggerArgs)
			baseFunc(victim, triggerArgs)
			local killer = triggerArgs.AttackerTable
			local killingWeapon = triggerArgs.SourceWeapon
			if not victim.SkipModifiers and killer ~= nil and killer == CurrentRun.Hero then
				for i, data in pairs(GetHeroTraitValues("OnEnemyDeathFunctionArgs")) do
					if data.Name and _G[data.Name] then
						_G[data.Name](triggerArgs, data.Args)
					end
				end
			end
		end)
	function SpawningLavaProjectile(triggerArgs, args)
		if HeroHasTrait("HestiaRangedTrait") and triggerArgs.name == "HestiaProjectile" then
			local dropLocation = SpawnObstacle({ Name = "InvisibleTarget", LocationX = triggerArgs.LocationX,
				LocationY = triggerArgs.LocationY })
			FireWeaponFromUnit({ Weapon = "HestiaLavaProjectile", Id = CurrentRun.Hero.ObjectId, DestinationId = dropLocation,
				FireFromTarget = true })
			if HeroHasTrait("LavaResistTrait") then
				FireWeaponFromUnit({ Weapon = "HestiaFieldDefense", Id = CurrentRun.Hero.ObjectId, DestinationId = dropLocation,
					FireFromTarget = true })
			end
		end
	end

	function SpawningLavaDeath(triggerArgs, args)
		if HeroHasTrait("LavaDeathTrait") then
			--local dropLocation = SpawnObstacle({ Name = "InvisibleTarget", LocationX = triggerArgs.LocationX, LocationY = triggerArgs.LocationY })
			FireWeaponFromUnit({ Weapon = "HestiaOnDeath", Id = CurrentRun.Hero.ObjectId,
				DestinationId = triggerArgs.triggeredById, FireFromTarget = true })
			if HeroHasTrait("LavaResistTrait") then
				FireWeaponFromUnit({ Weapon = "HestiaSmallFieldDefense", Id = CurrentRun.Hero.ObjectId,
					DestinationId = triggerArgs.triggeredById, FireFromTarget = true })
			end
		end
	end

	function SpawningLavaRevenge(triggerArgs, args)
		if HeroHasTrait("HestiaRevengeTrait") and triggerArgs.name == "LavaSplashLob" then
			local dropLocation = SpawnObstacle({ Name = "InvisibleTarget", LocationX = triggerArgs.LocationX,
				LocationY = triggerArgs.LocationY })
			FireWeaponFromUnit({ Weapon = "HestiaOnRevenge", Id = CurrentRun.Hero.ObjectId, DestinationId = dropLocation,
				FireFromTarget = true })
			if HeroHasTrait("LavaResistTrait") then
				FireWeaponFromUnit({ Weapon = "HestiaSmallFieldDefense", Id = CurrentRun.Hero.ObjectId, DestinationId = dropLocation,
					FireFromTarget = true })
			end
		end
	end

	-- Ares Duo
	function TrackAresDamageBonus(hero, args)
		thread(EnemiesCountThread, args)
	end

	function EnemiesCountThread(args)
		while CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead do
			wait(1.0, "RoomThread")
			if CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead
				and IsCombatEncounterActive(CurrentRun) and not IsEmpty(RequiredKillEnemies) then
				local enemiesNumberThreshold = args.EnemiesNumberThreshold or 0

				if TableLength(RequiredKillEnemies) >= enemiesNumberThreshold and
					not HasEffect({ Id = CurrentRun.Hero.ObjectId, EffectName = "FoesNumberDamageBuff" }) then
					ApplyEffectFromWeapon({ Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId,
						WeaponName = "FoesNumberDamageBuff", EffectName = "FoesNumberDamageBuff" })
				elseif TableLength(RequiredKillEnemies) < enemiesNumberThreshold and
					HasEffect({ Id = CurrentRun.Hero.ObjectId, EffectName = "FoesNumberDamageBuff" }) then
					ClearEffect({ Id = CurrentRun.Hero.ObjectId, Name = "FoesNumberDamageBuff" })
				end
			end
		end
	end

	-- Dionysus Duo
	ModUtil.Path.Wrap("StartEncounter",
		function(baseFunc, currentRun, currentRoom, currentEncounter)
			if HeroHasTrait("FullHealBossTrait") then
				local healAmount = round(CurrentRun.Hero.MaxHealth * CalculateHealingMultiplier())
				if healAmount < 0.05 then
					healAmount = round(CurrentRun.Hero.MaxHealth * 0.05)
				end
				if (currentRun.CurrentRoom.Encounter.EncounterType == "Boss" or
					currentRun.CurrentRoom.Encounter.EncounterType == "OptionalBoss") and
					currentRun.CurrentRoom.Encounter.CurrentWaveNum == nil then
					thread(FullHealBossAnnouncement)
					Heal(CurrentRun.Hero, { HealAmount = healAmount, SourceName = "FullHealBossTrait" })
				elseif currentRun.CurrentRoom.IsMiniBossRoom then
					thread(FullHealBossAnnouncement)
					Heal(CurrentRun.Hero, { HealAmount = (healAmount / 2), SourceName = "FullHealBossTrait" })
				end
			end
			baseFunc(currentRun, currentRoom, currentEncounter)
		end
	)
	ModUtil.Path.Wrap("FormatExtractedValue",
		function(baseFunc, value, extractData)
			if extractData.Format ~= nil then
				if extractData.Format == "PercentHealLast" then
					value = value * CalculateHealingMultiplier()
					if value < 0.05 then
						value = 0.05
					end
					value = value * 100
				end
				if extractData.Format == "PercentHealHalf" then
					value = (value * CalculateHealingMultiplier()) / 2
					if value < 0.03 then
						value = 0.03
					end
					value = value * 100
				end
			end
			return baseFunc(value, extractData)
		end
	)
	function FullHealBossAnnouncement()
		wait(0.2)
		--PlaySound({ Name = "/Leftovers/Menu Sounds/CoinLand", Id = CurrentRun.Hero.ObjectId })
		thread(InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text = "FullHealBossText", Duration = 1 })
	end
	-- Hestia Shout Heal Rarity
	ModUtil.Path.Wrap("AddTraitData",
		function(baseFunc, unit, traitData, args)
			if traitData.AddOutgoingLifestealModifiers and traitData.RarityStatMultiplier then
				traitData.AddOutgoingLifestealModifiers.MaxLifesteal = traitData.AddOutgoingLifestealModifiers.MaxLifesteal * traitData.RarityStatMultiplier
				traitData.AddOutgoingLifestealModifiers.MinLifesteal = traitData.AddOutgoingLifestealModifiers.MinLifesteal * traitData.RarityStatMultiplier
			end
			baseFunc(unit, traitData, args)
		end
	)
	-- Poseidon Duo
	ModUtil.Path.Wrap("GetFish",
		function(baseFunc, biome, fishingState)
			if HeroHasTrait("FishingRewardExtraTrait") then
				if CurrentRun.CurrentRoom.Name then
					GiveRandomConsumables({
						Delay = 0.3,
						NotRequiredPickup = true,
						LootOptions =
						{
							{
								Name = "StoreRewardRandomStack",
								Chance = 1,
							}
						}
					})
				end
				if fishingState == "Perfect" then
					DropRewardPerfect()
				elseif fishingState == "Good" then
					DropRewardGood()
				elseif fishingState == "TooLate" then
					DropRewardLate()
				elseif fishingState == "WayLate" then
					DropRewardWayLate()
				end
			end
			local result = baseFunc(biome, fishingState)
			return result
		end)
	function DropRewardPerfect()
		local dropItemName = "GiftDrop"
		GiveRandomConsumables({
			Delay = 0.7,
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

	function DropRewardGood()
		local dropItemName = "RoomRewardMetaPointFishGoodDrop"
		GiveRandomConsumables({
			Delay = 0.7,
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

	function DropRewardLate()
		local dropItemName = "GemDrop"
		GiveRandomConsumables({
			Delay = 0.7,
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

	function DropRewardWayLate()
		local dropItemName = "RoomRewardConsolationPrize"
		GiveRandomConsumables({
			Delay = 0.7,
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

	ModUtil.Path.Wrap("RecordFish",
		function(baseFunc, fishName)
			baseFunc(fishName)
			if HeroHasTrait("FishingRewardExtraTrait") then
				--thread( InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text = "FishDoubled", PreDelay = 0.55, Duration = 1 })
				GameState.TotalCaughtFish = GameState.TotalCaughtFish or {}
				IncrementTableValue(GameState.TotalCaughtFish, fishName)

				GameState.CaughtFish = GameState.CaughtFish or {}
				IncrementTableValue(GameState.CaughtFish, fishName)

				CurrentRun.CaughtFish = CurrentRun.CaughtFish or {}
				IncrementTableValue(CurrentRun.CaughtFish, fishName)
			end
			--local iconId = CreateScreenObstacle({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY - 315, Group = "Combat_Menu_TraitTray_Overlay" })
			--SetAnimation({ Name = "Icon_FishDouble", DestinationId = iconId, OffsetY = 20, OffsetX = 20 })
		end)
	ModUtil.Path.Wrap("DisplayUnlockText",
		function(baseFunc, args)
			if HeroHasTrait("FishingRewardExtraTrait") and args.IconBacking == "FishCatchIconBacking" and args.SubtitleData ~= nil
				and args.SubtitleData.LuaValue ~= nil then
				local doubleName = args.Icon .. "_Doubled"
				args.SubtitleData = { LuaKey = "TempTextData", LuaValue = { Name = doubleName } }
			end
			baseFunc(args)
		end
	)	
	-- Changes to Maps
	local OlympusRoomSetData = ModUtil.Entangled.ModData(RoomSetData)
	table.insert(OlympusRoomSetData.Tartarus.RoomOpening.ForcedRewards, {
		Name = "Boon",
		LootName = "HestiaUpgrade",
		GameStateRequirements =
		{
			RequiredTextLines = { "ZeusFirstPickUp", "DionysusFirstPickUp" },
			RequiredOnlyNotPickedUp = "HestiaUpgrade",
			RequiredOnlyNotPickedUpIgnoreName = "DemeterUpgrade",
		}
	})

	OverwriteTableKeys(RoomData, RoomSetData.Tartarus)
end
