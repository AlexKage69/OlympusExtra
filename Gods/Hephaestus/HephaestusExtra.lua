-- Separate Gods from Goddess to add more gods

if ModUtil ~= nil then

	ModUtil.Mod.Register("HephaestusExtra")

	local mod = "HephaestusExtra"
	local package = "HephaestusPackage"
	--Variables
	local DepthDamageMultiplier = 0.0
	local DuplicateMultiplier = -0.60
	local DuplicateStrongMultiplier = -0.40
	local DuplicateVeryStrongMultiplier = -0.20
	--Color
	local OlympusColor = ModUtil.Entangled.ModData(Color)
	OlympusColor.HephaestusVoice = { 98,35,28,255 }
	OlympusColor.HephaestusDamageLight = { 171,112,53,255 }
	OlympusColor.HephaestusDamage = { 144,75,7,255  }
	OlympusColor.DamageBackDamageStart = { 229,184,11,255 }
	OlympusColor.DamageBackDamageEnd = { 255,215,0,255 }
	OlympusColor.HephaestusHiddenColor = { 255,255,255,0 }
	
	--QuestData
	local OlympusQuestData = ModUtil.Entangled.ModData(QuestData)
	OlympusQuestData.HephaestusUpgrades =
	{
		InheritFrom = { "DefaultQuestItem" },
		RewardResourceName = "Gems",
		RewardResourceAmount = 150,
		UnlockGameStateRequirements =
		{
			RequiredTextLines = { "HephaestusGift01", },
		},
		CompleteGameStateRequirements =
		{
			RequiredTraitsTaken =
			{
				"HephaestusWeaponTrait",
				"HephaestusRangedTrait",
				"HephaestusSecondaryTrait",
				"HephaestusShoutSummon",
				"DamageReturnTrait",
				"DropMoneyTrait",
				"RevengeBoostTrait",
				"ArmorBossTrait",
				"ArmorEncounterTrait",
				"ArmorDefianceTrait",
				"SpawnWeaponsTrait",
				"HephaestusTrapTrait",
				"ArmorLegendaryTrait",
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

			-- All thansk to you, Lord Hephaestus.
			{ Cue = "/VO/ZagreusHome_3780" },
		},
	}	
	OlympusQuestData.HephaestusLegendaryUpgrades =
	{
		InheritFrom = { "DefaultQuestItem" },
		RewardResourceName = "Gems",
		RewardResourceAmount = 450,
		UnlockGameStateRequirements =
		{
			RequiredAnyTextLines = { 
				"HephaestusImproveZeus01",
				"HephaestusImprovePoseidon01",
				"HephaestusImproveAres01",
				"HephaestusImproveDionysus01",
				"HephaestusImproveApollo01",
				"HephaestusImproveHestia01",
				"HephaestusImproveHera01",
				"HephaestusImproveDemeter01",
				"HephaestusImproveArtemis01",
				"HephaestusImproveAthena01", 
			},
		},
		CompleteGameStateRequirements =
		{
			RequiredTraitsTaken =
			{
				"HephaestusImproveZeus",
				"HephaestusImprovePoseidon",
				"HephaestusImproveAres",
				"HephaestusImproveDionysus",
				"HephaestusImproveApollo",
				"HephaestusImproveHestia",
				"HephaestusImproveHera",
				"HephaestusImproveDemeter",
				"HephaestusImproveArtemis",
				"HephaestusImproveAthena",
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

			-- Thanks for the improvements, Lord Hephaestus
			{ Cue = "/VO/ZagreusHome_3780" },
		},
	}
	AddIcon("ArmorIcon","GUI\\Icons\\HealthArmored",false)

	local OlympusQuestOrderData = ModUtil.Entangled.ModData(QuestOrderData)
	table.insert(OlympusQuestOrderData, 28, "HephaestusUpgrades")
	table.insert(OlympusQuestOrderData, 31, "HephaestusLegendaryUpgrades")
	--Loot
	local OlympusConsumableData = ModUtil.Entangled.ModData(ConsumableData)
	OlympusConsumableData.HephaestusUpgradeDrop =
	{
		Name = "HephaestusUpgradeDrop",
		InheritFrom = { "BaseConsumable", },
		Cost =
		{
			BaseValue = 150,
			DepthMult = 0,
			AsInt = true,
		},
		UseText = "UsePurchaseLoot",
		UseFunctionName = "CreateHephaestusLoot",
		RequiredMaxHephaestusUpgrades = 0,
		RequiredTextLines = {  "HephaestusFirstPickUp" },
	}
	OlympusConsumableData.SwordHephWeaponDrop =
	{
		InheritFrom = { "BaseConsumable" },
		UseText = "UseHealDrop",
		PurchaseText = "Shop_UseHealDrop",
		HideWorldText = true,
		OnConsumedGlobalVoiceLines = "UsedHealDropVoiceLines",
		UseFunctionNames =  { "AddHephBoost" } ,
		UseFunctionArgs = {
			{
				WeaponName = "DamageMeleeBoost",			
			},
		},
	}
	OlympusConsumableData.BowHephWeaponDrop =
	{
		InheritFrom = { "BaseConsumable" },
		UseText = "UseHealDrop",
		PurchaseText = "Shop_UseHealDrop",
		HideWorldText = true,
		OnConsumedGlobalVoiceLines = "UsedHealDropVoiceLines",
		UseFunctionNames =  { "AddHephBoost" } ,
		UseFunctionArgs = {
			{
				WeaponName = "DamageRangedBoost",			
			},
		},
	}
	OlympusConsumableData.ShieldHephWeaponDrop =
	{
		InheritFrom = { "BaseConsumable" },
		UseText = "UseHealDrop",
		PurchaseText = "Shop_UseHealDrop",
		HideWorldText = true,
		OnConsumedGlobalVoiceLines = "UsedHealDropVoiceLines",
		UseFunctionNames =  { "AddHephBoost" } ,
		UseFunctionArgs = {
			{
				WeaponName = "DefenseBoost",			
			},
		},
	}
	OlympusConsumableData.SpearHephWeaponDrop =
	{
		InheritFrom = { "BaseConsumable" },
		UseText = "UseHealDrop",
		PurchaseText = "Shop_UseHealDrop",
		HideWorldText = true,
		OnConsumedGlobalVoiceLines = "UsedHealDropVoiceLines",
		UseFunctionNames =  { "AddHephBoost" } ,
		UseFunctionArgs = {
			{
				WeaponName = "SpeedBoost",			
			},
		},
	}	
	local OlympusStoreData = ModUtil.Entangled.ModData(StoreData)
	--Hermes Shop
	OlympusStoreData.WorldShop.GroupsOf[3].OptionsData[2].ReplaceRequirements = { RequiredMaxHermesUpgrades = 0, RequiredTextLines = {  "HermesFirstPickUp" }, RequiredFalseTrait = "ForceWeaponUpgradeTrait", RequiredFalseGodLoot = "HephaestusUpgrade"}
	OlympusStoreData.D_WorldShop.GroupsOf[4].OptionsData[1].ReplaceRequirements.RequiredFalseTrait = "ForceWeaponUpgradeTrait"
	OlympusStoreData.D_WorldShop.GroupsOf[4].OptionsData[1].ReplaceRequirements.RequiredFalseGodLoot = "HephaestusUpgrade"
	--Hephaestus Shop
	table.insert(OlympusStoreData.WorldShop.GroupsOf[3].OptionsData,{ Name = "HephaestusUpgradeDrop", ReplaceRequirements = { RequiredMaxHephaestusUpgrades = 0, RequiredTextLines = {  "HephaestusFirstPickUp" }, RequiredFalseTrait = "FastClearDodgeBonusTrait", RequiredFalseGodLoot = "HermesUpgrade" }})
	table.insert(OlympusStoreData.D_WorldShop.GroupsOf[4].OptionsData, { Name = "HephaestusUpgradeDrop", Cost = 500, UpgradeChance = 1.0, UpgradedCost = 500, ReplaceRequirements = { RequiredTextLines = {  "HephaestusFirstPickUp" }, RequiredFalseTrait = "FastClearDodgeBonusTrait", RequiredFalseGodLoot = "HermesUpgrade" }})
	
	local OlympusRewardStoreData = ModUtil.Entangled.ModData(RewardStoreData)
	table.insert(OlympusRewardStoreData.RunProgress, {
		Name = "HephaestusUpgrade",
		GameStateRequirements =
		{
			RequiredFalseGodLoot = "HermesUpgrade",
			RequiredFalseTrait = "FastClearDodgeBonusTrait",
			RequiredMaxHephaestusUpgrades = 1,
			--RequiredFalseLootPickup = "HermesUpgrade",
			RequiredNotInStoreNames = {"HephaestusUpgradeDrop", "HermesUpgradeDrop"},
			RequiredMinCompletedRuns = 3,
			RequiredMinDepth = 13,
		}
	})
	OlympusRewardStoreData.RunProgress[12].GameStateRequirements.RequiredFalseTraits = {"ForceWeaponUpgradeTrait"}
	OlympusRewardStoreData.RunProgress[12].GameStateRequirements.RequiredFalseGodLoot = "HephaestusUpgrade"
	OlympusRewardStoreData.RunProgress[12].GameStateRequirements.RequiredNotInStoreNames = {"HephaestusUpgradeDrop", "HermesUpgradeDrop"}
	OlympusRewardStoreData.RunProgress[12].GameStateRequirements.RequiredNotInStore = nil
	--OlympusRewardStoreData.RunProgress[12].GameStateRequirements.RequiredMinDepth = 2
	--WeaponData
	local OlympusWeaponData = ModUtil.Entangled.ModData(WeaponData)
	OlympusWeaponData.HephChariotRamSelfDestruct =
	{
		StartingWeapon = false,
		IgnoreHealthBuffer = true,
		OnHitFunctionNames = {"HephHitSelfDestruct"},
		HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.12, FalloffSpeed = 3000 },
		HitSimSlowParameters =
		{
			{ ScreenPreWait = 0.02, Fraction = 0.1, LerpTime = 0 },
			{ ScreenPreWait = 0.06, Fraction = 1.0, LerpTime = 0 },
		},
	}
	local OlympusEffectData = ModUtil.Entangled.ModData(EffectData)
	OlympusEffectData.DamageBackEffect =
	{
		Name = "DamageBackEffect",
		DamageTextStartColor = Color.DamageBackDamageStart,
		DamageTextColor = Color.DamageBackDamageEnd,
	}
	local OlympusHeroVoiceLines = ModUtil.Entangled.ModData(HeroVoiceLines)
	table.insert(OlympusHeroVoiceLines.UpgradePickedVoiceLines, {
		RandomRemaining = true,
		BreakIfPlayed = true,
		SuccessiveChanceToPlay = 0.5,
		PreLineWait = 0.75,
		RequiredLastGodLoot = "HephaestusUpgrade",
		-- Smithing by the gods.
		{ Cue = "/VO/ZagreusField_5011" },
		-- That's quality work.
		{ Cue = "/VO/ZagreusField_5012" },
		-- Couldn't be better.
		{ Cue = "/VO/ZagreusField_5013" },
		-- Woah.
		{ Cue = "/VO/ZagreusField_5014" },
		-- Tuned up.
		{ Cue = "/VO/ZagreusField_5015" },
		-- Bronze and gold.
		{ Cue = "/VO/ZagreusField_5016" },
		-- Rock and stones.
		{ Cue = "/VO/ZagreusField_5017" },
		-- As I ordered it.
		{ Cue = "/VO/ZagreusField_5018" },
		-- Great customer service.
		{ Cue = "/VO/ZagreusField_5019" },
		-- Like I wanted.
		{ Cue = "/VO/ZagreusField_5020" },
	})
	--BoonInfoScreenData
	local OlympusBoonInfoScreenData = ModUtil.Entangled.ModData(BoonInfoScreenData)
	table.insert(OlympusBoonInfoScreenData.Ordering, "HephaestusUpgrade")

	--ProjectileData
	local OlympusProjectileData = ModUtil.Entangled.ModData(ProjectileData)
	OlympusProjectileData.HephaestusColorProjectile = {
		DamageTextStartColor = OlympusColor.HephaestusDamageLight,
		DamageTextColor = OlympusColor.HephaestusDamage
	}
	OlympusProjectileData.IgneousArmorExplosion = {
		InheritFrom = { "HephaestusColorProjectile" },
	}
	OlympusProjectileData.IgneousRangedExplosion = {
		InheritFrom = { "HephaestusColorProjectile" },
	}
	OlympusProjectileData.IgneousTrapExplosion = {
		InheritFrom = { "HephaestusColorProjectile" },
	}
	OlympusProjectileData.HephChariotRamSelfDestruct ={
		DamageTextStartColor = OlympusColor.HephaestusHiddenColor,
		DamageTextColor = OlympusColor.HephaestusHiddenColor
	}
	OlympusProjectileData.HephChariotRamDeathWeapon ={
		InheritFrom = { "HephaestusColorProjectile" },
	}
	-- GameData
	local OlympusGameData = ModUtil.Entangled.ModData(GameData)
	OlympusGameData.HephaestusBasicPickUpTextLines = {
		"HephaestusFirstPickUp",
		"HephaestusMiscPickup01",
		"HephaestusMiscPickup02",
		"HephaestusMiscPickup03",
		"HephaestusMiscPickup04",
		"HephaestusMiscPickup05",
		"HephaestusMiscPickup06",
		"HephaestusMiscPickup07",
		"HephaestusMiscPickup08",
		"HephaestusMiscPickup09",
		"HephaestusMiscPickup10",
		"HephaestusMiscPickup11",
		"HephaestusMiscPickup12",
		"HephaestusMiscPickup13",
		"HephaestusMiscPickup14",
		"HephaestusMiscPickup15",
		"HephaestusMiscPickup16",
		"HephaestusMiscPickup17"
	}
	OlympusGameData.HephaestusImproveTraits = {
		"HephaestusImproveZeus",
		"HephaestusImproveAthena",
		"HephaestusImproveAres",
		"HephaestusImproveAphrodite",
		"HephaestusImprovePoseidon",
		"HephaestusImproveFishPoseidon",
		"HephaestusImproveArtemis",
		"HephaestusImproveDionysus",
		"HephaestusImproveDemeter",
	}
	
	GameData.RunClearMessageData.ClearRequiredTraitsHephaestus =
	{
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements =
		{
			RequiredCountOfTraitsCount = 3,
			RequiredCountOfTraits =
			{
				"HephaestusWeaponTrait",
				"HephaestusRangedTrait",
				"HephaestusSecondaryTrait",
				"HephaestusShoutSummon",
				"DamageReturnTrait",
				"DropMoneyTrait",
				"RevengeBoostTrait",
				"ArmorBossTrait",
				"ArmorEncounterTrait",
				"ArmorDefianceTrait",
				"SpawnWeaponsTrait",
				"HephaestusTrapTrait",
			},
			RequiredOneOfTraits = { 
				"ArmorLegendaryTrait",
				"HephaestusImproveZeus",
				"HephaestusImprovePoseidon",
				"HephaestusImproveAres",
				"HephaestusImproveDionysus",
				"HephaestusImproveApollo",
				"HephaestusImproveHestia",
				"HephaestusImproveHera",
				"HephaestusImproveDemeter",
				"HephaestusImproveArtemis",
				"HephaestusImproveAthena", 
			},
		},
	}
	table.insert(OlympusGameData.ConversationOrder, "HephaestusUpgrade")
	--[[table.insert(OlympusGameData.RunClearMessageData.ClearWeaponsFiredWrath.GameStateRequirements.RequiredWeaponsFiredThisRun
		.Names, "HephaestusBeamWeapon")]]
	ModUtil.Table.Merge(OlympusGameData.GodAboutGodVoiceLines, {
		"HephaestusAboutZeus01"
	}
	)
	-- Voicelines
	local OlympusGlobalVoiceLines = ModUtil.Entangled.ModData(GlobalVoiceLines)
	table.insert(OlympusGlobalVoiceLines.FoundRareBoonVoiceLines, {
		BreakIfPlayed = true,
		RandomRemaining = true,
		SuccessiveChanceToPlay = 0.75,
		PreLineWait = 1.05,
		RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
		HasAnyTraitNamesInRoom = GameData.HephaestusImproveTraits,

		-- Perfect!
		{ Cue = "/VO/Hephaestus_0058", },
		-- Couldn't have made it better!
		{ Cue = "/VO/Hephaestus_0059", },
		-- A job well done.
		{ Cue = "/VO/Hephaestus_0060", },
		-- A banging job, hey?
		{ Cue = "/VO/Hephaestus_0061", },
		-- Worthy of heroes.
		{ Cue = "/VO/Hephaestus_0062", },
		-- Hope this works out.
		{ Cue = "/VO/Hephaestus_0063", },
		-- Worth the effort.
		{ Cue = "/VO/Hephaestus_0064", },
		-- Done smithing.
		{ Cue = "/VO/Hephaestus_0065", },
		-- Hmph, worked out well.
		{ Cue = "/VO/Hephaestus_0066", },
		-- Just how I imagined it!
		{ Cue = "/VO/Hephaestus_0067", },
		-- Tuned up
		{ Cue = "/VO/Hephaestus_0068", },
		-- Oi oi
		{ Cue = "/VO/Hephaestus_0069", },
		-- Look at this.
		{ Cue = "/VO/Hephaestus_0070", },
		-- Couldn't be better
		{ Cue = "/VO/Hephaestus_0071", },
		-- Legendary
		{ Cue = "/VO/Hephaestus_0072", },
		-- Good enough
		{ Cue = "/VO/Hephaestus_0073", },
		-- Complete
		{ Cue = "/VO/Hephaestus_0074", },
	}
	)
	-- Codex Section
	local OlympusCodexOrdering = ModUtil.Entangled.ModData(CodexOrdering)
	local OlympusCodex = ModUtil.Entangled.ModData(Codex)
	table.insert(OlympusCodexOrdering.OlympianGods.Order, "HephaestusUpgrade")

	OlympusCodex.OlympianGods.Entries["HephaestusUpgrade"] =
	{
		Entries =
		{
			{
				UnlockThreshold = 1,
				Text = "CodexData_Hephaestus_0001"
			},
			{
				UnlockThreshold = 5,
				Text = "CodexData_Hephaestus_0002"
			},
			{
				UnlockThreshold = 15,
				Text = "CodexData_Hephaestus_0003"
			}
		},
		Image = "Codex_Portrait_Hephaestus",
	}
	local OlympusHeroData = ModUtil.Entangled.ModData(HeroData)
	OlympusHeroData.DefaultHero.HeroAlliedUnits.HephaestusChariotSuicide = true
	OlympusHeroData.DefaultHero.HeroAlliedUnits.HephaestusChariotSuicideElite = true

	local OlympusEnemyData = ModUtil.Entangled.ModData(EnemyData)
	OlympusEnemyData.HephaestusChariotSuicide =
	{
		InheritFrom = { "ChariotSuicide" },
		RequiredKill = false,
		DropItemsOnDeath = false,
		UseShrineUpgrades = false,
		DamageType = "Ally",
		MaxHealth = 1,
		--HealthBarOffsetY = -145,
		--HealthBarType = "Small",
		SkipDamageText = true,
		AnimOffsetZ = -120,
		UnuseableWhenDead = true,
		SpeechCooldownTime = 9,
		SkipModifiers = true,
		AlwaysTraitor = true,
		--AdditionalEnemySetupFunctionName = "SetupExplosiveChariot",
		AlwaysShowInvulnerabubbleOnInvulnerableHit = false,

		Groups = { "GroundEnemies", "TrainingEnemies" },

		MeterMultiplier = 0,

		MoneyDropOnDeath =
		{
			Chance = 0,
		},

		--ActiveCapWeight = 0.5,
		--LargeUnitCap = 6,

		BlockSelfDamageNumbers = true, --true

		IsAggroedSound = "/SFX/Enemy Sounds/FireChariot/FireChariotAggro",
		--AIAggroRange = 5000,

		DefaultAIData =
		{
			AIRequireProjectileLineOfSight = false,
			AIRequireUnitLineOfSight = false,
			SetupDistance = 5000,
			SetupTimeout = 0.5,
			RamDistance = 100,
			RamTimeout = 6.0,
			RamWeaponName = "HephChariotRamSelfDestruct",
			RamEffectName = "RamBerserk",
			PreAttackAnimation = "SuicideChariotAttackCharge",
			PreAttackSound = "/SFX/Enemy Sounds/FireChariot/FireChariotAttackStart",
			PreAttackShake = 400,
			PreAttackFlash = 1.0,
			PreAttackDuration = 0.5,
			PostAttackAnimation = "ChariotSuicideStop",
			RamRecoverTime = 0.0,
		},

		EnemyFirstEncounterVoiceLines =
		{
			BreakIfPlayed = true,
			
			-- Flame Wheels!
			{ Cue = "/VO/ZagreusField_1972" },
		},
		EnemySightedVoiceLines =
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			RequiredFalsePlayedThisRun = { "/VO/ZagreusField_1972" },
			RequiredFalseEncounters = { "DevotionTestTartarus", "DevotionTestAsphodel", "DevotionTestElysium", "ThanatosTartarus", "ThanatosAsphodel", "ThanatosElysium", "ThanatosElysiumIntro", "PerfectClearShrinePointChallenge" },
			RequiredFalseRooms = { "C_MiniBoss02" },
			Cooldowns =
			{
				{ Name = "CombatBeginsLinesPlayedRecently", Time = 300 },
			},
			SuccessiveChanceToPlay = 0.2,

			-- Flame Wheels.
			{ Cue = "/VO/ZagreusField_1971", RequiredPlayed = { "/VO/ZagreusField_1972" } },
			-- Flame Wheels!
			{ Cue = "/VO/ZagreusField_1972" },
			-- More Flame Wheels!
			{ Cue = "/VO/ZagreusField_1973", RequiredPlayed = { "/VO/ZagreusField_1972" } },
			-- More Flame Wheels?
			{ Cue = "/VO/ZagreusField_1974", RequiredPlayed = { "/VO/ZagreusField_1972" } },
		},

		Binks =
		{
			"Enemy_ChariotSmallIdle_Bink",
			"Enemy_ChariotSmallAttack_Bink",
			"Enemy_ChariotSmallOnHit_Bink",
			"Enemy_ChariotSmallDeathVFX_Bink",
		},
	}

	OlympusEnemyData.HephaestusChariotSuicideElite =
	{
		InheritFrom = { "Elite", "HephaestusChariotSuicide" },

		Groups = { "GroundEnemies" },
		BlockAttributes = { "ExtraDamage", "HeavyArmor", "DeathSpreadHitShields" },
		

		HealthBuffer = 60,
		HealthBarOffsetY = -140,
		HealthBarType = "Medium",

		GeneratorData =
		{
			DifficultyRating = 40,
			BlockEnemyTypes = { "ChariotSuicide" },
		},
		RequiredMinBiomeDepth = 3,
		Outline =
		{
			R = 255,
			G = 255,
			B = 0,
			Opacity = 0.8,
			Thickness = 2,
			Threshold = 0.6,
		},
	}

	-- Trait Section
	local OlympusTraitData = ModUtil.Entangled.ModData(TraitData)

	OlympusTraitData.ForceWeaponUpgradeTrait = {
		Name = "ForceWeaponUpgradeTrait",
		InheritFrom = { "GiftTrait" },
		--New Data
		LootSource = "HephaestusUpgrade",
		InRackTitle = "ForceWeaponUpgradeTrait_Rack",
		Icon = "Keepsake_Statue",
		EquipSound = "/SFX/WeaponUpgradeHammerDrop2",
		ForceRewardName = "WeaponUpgrade",
		Uses = 1,
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 2.0,
			},
			Epic =
			{
				Multiplier = 3.0,
			}
		},
		RarityBonus =
		{
			LegendaryBonus = { BaseValue = 0.03 },
			ExtractValues =
			{
				{
					Key = "LegendaryBonus",
					ExtractAs = "TooltipBonusChance",
					Format = "Percent",
				}
			}
		},
		SignOffData =
		{
			{
				Text = "HephaestusSignoff",
			},
			{
				RequiredTextLines = { "HephaestusGift07" },
				Text = "HephaestusSignoff_Max"
			}
		},
	}
	OlympusTraitData.HephaestusWeaponTrait =
	{
		Name = "HephaestusWeaponTrait",
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Hephaestus_01",
		LootSource = "HephaestusUpgrade",
		PreEquipWeapons = { "IgneousArmorExplosion", "ArtemisHestiaExplosion" },
        RequiredFalseTraits = {"HephaestusWeaponTrait", "HephaestusSecondaryTrait"},
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
		OnWeaponFiredFunctions =
		{
			ValidWeapons = WeaponSets.HeroPhysicalWeapons,
			FunctionName = "DamageIgneousArmor",
			FunctionArgs = {},
		},
		SetupFunction =
		{
			Name = "SetupIgneousArmor",
			RunOnce = true,
			Args =
			{
				Duration = 6,
				Cooldown = 14,
				DamageTransfer = {
					BaseValue = 0.50,
				},
				ExtractValues =
				{
					{
						Key = "DamageTransfer",
						ExtractAs = "TooltipDamageTransfer",
						Format = "Percent",
					},
					{
						Key = "Cooldown",
						ExtractAs = "TooltipIgneousCooldown",
					},
					{
						Key = "Duration",
						ExtractAs = "TooltipIgneousDuration",
					},
				}
			},
		},
		PropertyChanges =
		{
			
		},
	}
	
	OlympusTraitData.HephaestusSecondaryTrait =
	{
		Name = "HephaestusSecondaryTrait",
		InheritFrom = { "ShopTier1Trait" },
		LootSource = "HephaestusUpgrade",
		Icon = "Boon_Hephaestus_02",
        RequiredFalseTraits = {"HephaestusWeaponTrait", "HephaestusSecondaryTrait"},
		PreEquipWeapons = { "IgneousArmorExplosion", "ArtemisHestiaExplosion" },
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
		OnWeaponFiredFunctions =
		{
			ValidWeapons = WeaponSets.HeroSecondaryWeapons,
			FunctionName = "DamageIgneousArmor",
			FunctionArgs = {},
		},
		SetupFunction =
		{
			Name = "SetupIgneousArmor",
			RunOnce = true,
			Args =
			{
				Duration = 6,
				Cooldown = 14,
				DamageTransfer = {
					BaseValue = 0.50,
				},
				ExtractValues =
				{
					{
						Key = "DamageTransfer",
						ExtractAs = "TooltipDamageTransfer",
						Format = "Percent",
					},
					{
						Key = "Cooldown",
						ExtractAs = "TooltipIgneousCooldown",
					},
					{
						Key = "Duration",
						ExtractAs = "TooltipIgneousDuration",
					},
				}
			},
		},
		PropertyChanges =
		{

		},
	}
	
	OlympusTraitData.HephaestusLongerDashes =
	{
		Name = "HephaestusLongerDashes",
		InheritFrom = { "ShopTier1Trait" },
		LootSource = "HephaestusUpgrade",
		Icon = "Boon_Hephaestus_03",
        RequiredFalseTrait = "HephaestusLongerDashes",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.08,
			},
			Epic =
			{
				Multiplier = 1.15,
			},
			Heroic =
			{
				Multiplier = 1.23,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "RushWeapon" },
				WeaponProperty = "FireFx2",
				ChangeValue = "BlinkTrailVerticalB-Heph",
				ChangeType = "Absolute",
			},
			{
                WeaponNames = { "RushWeapon" },
                WeaponProperty = "WeaponRange",
                BaseValue = 2.0,
                ChangeType = "Multiply",
                ExtractValue =
                {
                    ExtractAs = "TooltipPenalty",
                    Format = "Percent",
                },
            },
			{
				WeaponNames = { "RushWeapon" },
				WeaponProperty = "BlinkMaxRange",
				BaseValue = 2.0,
				ChangeType = "Multiply",
			},
			{
				TraitName = "HestiaDashTrait",
				WeaponNames = { "RushWeapon" },
				ProjectileName = "HestiaFireDashField",
				ProjectileProperty = "Range",
				ChangeValue = 2.0,
				ChangeType = "Multiply",
			},
		},
	}
	OlympusTraitData.HephaestusRangedTrait =
	{
		Name = "HephaestusRangedTrait",
		InheritFrom = { "ShopTier1Trait" },
		LootSource = "HephaestusUpgrade",
		--Slot = "Ranged",
		Icon = "Boon_Hephaestus_04",
		--CustomTrayText = "HephaestusRangedTrait_Tray",
		PreEquipWeapons = { "IgneousRangedExplosion" },
        RequiredFalseTrait = "HephaestusRangedTrait",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.000,
			},
			Rare =
			{
				Multiplier = 1.16,
			},
			Epic =
			{
				Multiplier = 1.33,
			},
			Heroic =
			{
				Multiplier = 1.5,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "IgneousRangedExplosion" },
				ProjectileProperty = "DamageLow",
				BaseMin = 60,
				BaseMax = 60,
				AsInt = true,
				DepthMult = DepthDamageMultiplier,
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
				WeaponNames = { "IgneousRangedExplosion" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		},
	}

	OlympusTraitData.HephaestusShoutSummon =
	{
		Name = "HephaestusShoutSummon",
		InheritFrom = { "ShopTier1Trait" },
		LootSource = "HephaestusUpgrade",
		--RequiredTextLines = { "PoseidonWrathIntro01" },
		RequiredSlottedTrait = "Shout",
		--CustomTrayText = "HephaestusShoutSummon_Tray",
		--PreEquipWeapons = {"HephChariotRamDeathWeapon"},
		--Slot = "Shout",
		Icon = "Boon_Hephaestus_05",
        RequiredFalseTrait = "HephaestusShoutSummon",
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
				Multiplier = 1.33,
			}
		},
		SummonExplosionDamage = {
			BaseValue = 150,
		},
		--[[EnemyPropertyChanges =
		{
			{
				WeaponName = "HephChariotRamDeathWeapon",
				ProjectileName = "HephChariotRamDeathWeapon",
				ProjectileProperty = "DamageLow",
				BaseMin = 150,
				BaseMax = 150,
				AsInt = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "HephChariotRamDeathWeapon",
				ProjectileName = "HephChariotRamDeathWeapon",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		},]]
		ExtractValues =
		{
			{
				ExtractAs = "TooltipWrathStocks",
				Format = "ExistingWrathStocks",
				SkipAutoExtract = true
			},
			{
				Key = "SummonExplosionDamage",
				ExtractAs = "SummonExplosionDamage",
			},
		}
	}
	OlympusTraitData.DropMoneyTrait =
	{
		Name = "DropMoneyTrait",
		Icon = "Boon_Hephaestus_07",
		InheritFrom = { "ShopTier2Trait" },
		LootSource = "HephaestusUpgrade",
		RequiredFalseTrait = "DropMoneyTrait",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 3.00,
			},
			Epic =
			{
				Multiplier = 5.00,
			},
			Heroic =
			{
				Multiplier = 7.00,
			}
		},		
		DropMoneyArmor = {
			BaseValue = 0.05,
			SourceIsMultiplier = false,
		},
		ExtractValues =
		{
			{
				Key = "DropMoneyArmor",
				ExtractAs = "TooltipDropMoneyArmor",
				Format = "Percent",
			},
		}
	}
	OlympusTraitData.RevengeBoostTrait =
	{
		Name = "RevengeBoostTrait",
		Icon = "Boon_Hephaestus_08",
		InheritFrom = { "ShopTier2Trait" },
		LootSource = "HephaestusUpgrade",
		RequiredFalseTrait = "RevengeBoostTrait",
		PreEquipWeapons = { "RevengeBoostApplicator" },
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
				WeaponName = "RevengeBoostApplicator",
				EffectName = "RevengeBoostSpeed",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponName = "RevengeBoostApplicator",
				EffectName = "RevengeBoostDamage",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponName = "RevengeBoostApplicator",
				EffectName = "RevengeBoostSpeed",
				EffectProperty = "Modifier",
				BaseValue = 0.5,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipSpeedBonus",
					Format = "Percent"
				}
			},
			{
				WeaponName = "RevengeBoostApplicator",
				EffectName = "RevengeBoostDamage",
				EffectProperty = "Modifier",
				BaseValue = 0.5,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDamageBonus",
					Format = "Percent"
				}
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipEffectDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "RevengeBoostApplicator",
				BaseName = "RevengeBoostSpeed",
				BaseProperty = "Duration",
				DecimalPlaces = 1,
			},
		}
	}
	
	OlympusTraitData.SpawnWeaponsTrait =
	{
		Name = "SpawnWeaponsTrait",
		InheritFrom = { "ShopTier1Trait" },
		LootSource = "HephaestusUpgrade",
		Icon = "Boon_Hephaestus_12",
		RequiredFalseTrait = "SpawnWeaponsTrait",
		PreEquipWeapons = {"DamageMeleeBoost","DamageRangedBoost", "DefenseBoost", "SpeedBoost"},
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
				Multiplier = 1.6
			}
		},
		-- Defense and Speed is done in PlayerWeapons.sjson
		AddOutgoingDamageModifiers =
		{
			ProximityEffects = { "DamageMeleeBoost" },
			ProximityThreshold = 400,
			ProximityMultiplierWithSelfEffect = 1.25,
			DistanceEffects = { "DamageRangedBoost" },
			DistanceThreshold = 400,
			DistanceMultiplierWithSelfEffect = 1.25,
			ExtractValues =
			{
				{
					Key = "ProximityMultiplierWithSelfEffect",
					ExtractAs = "TooltipSwordPercent",
					Format = "PercentDelta",
				},
				{
					Key = "DistanceMultiplierWithSelfEffect",
					ExtractAs = "TooltipBowPercent",
					Format = "PercentDelta",
				},
			},
		},
		SpawnHephWeaponOnDeath =
		{
			BaseValue = 0.25,
		},	
		ExtractValues =
		{
			{
				Key = "SpawnHephWeaponOnDeath",
				ExtractAs = "TooltipChance",
				Format = "Percent",
			},
			{
				ExtractAs = "TooltipShieldPercent",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "DefenseBoost",
				BaseName = "DefenseBoost",
				BaseProperty = "Modifier",
				Format = "NegativePercentDelta"
			},
			{
				ExtractAs = "TooltipSpearPercent",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SpeedBoost",
				BaseName = "SpeedBoost",
				BaseProperty = "Modifier",
				Format = "PercentDelta"
			},
			{
				ExtractAs = "TooltipHephWeaponDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SpeedBoost",
				BaseName = "SpeedBoost",
				BaseProperty = "Duration",
			},
		}
	}
	OlympusTraitData.ArmorEncounterTrait =
	{
		Name = "ArmorEncounterTrait",
		InheritFrom = { "ShopTier1Trait" },
		LootSource = "HephaestusUpgrade",
		Icon = "Boon_Hephaestus_10",
		RequiredFalseTrait = "ArmorEncounterTrait",
		CustomTrayText = "ArmorEncounterTrait_Tray",
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
				Multiplier = 2.00,
			}
		},
		SetupFunction =
		{
			Name = "SetupArmor",
			RunOnce = true,
			Args =
			{
				ArmorAtSetup = 25,
				Source = "ArmorEncounterTrait",
				ExtractValues =
				{
					{
						Key = "ArmorAtSetup",
						ExtractAs = "TooltipMaxArmor",
					},
				}
			},
		},
		AccumulatedMaxArmor = 0,
		RepairArmorOnPerfectEncounter =
		{
			BaseValue = 3,
			SourceIsMultiplier = true,
			--DecimalPlaces = 3,
		},	
		ExtractValues =
		{
			{
				Key = "RepairArmorOnPerfectEncounter",
				ExtractAs = "TooltipRepairArmor",
			},
		}
	}
	OlympusTraitData.ArmorDefianceTrait =
	{
		Name = "ArmorDefianceTrait",
		InheritFrom = { "ShopTier2Trait" },
		LootSource = "HephaestusUpgrade",
		Icon = "Boon_Hephaestus_11",
		RequiredFalseTrait = "ArmorDefianceTrait",
		CustomTrayText = "ArmorDefianceTrait_Tray",
		RequiredMinMaximumLastStands = 1,
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.125,
			},
			Epic =
			{
				Multiplier = 1.25,
			},
			Heroic =
			{
				Multiplier = 1.375
			}
		},
		SetupFunction =
		{
			Name = "SetupArmor",
			RunOnce = true,
			Args =
			{
				ArmorAtSetup = 50,
				Source = "ArmorDefianceTrait",
				ExtractValues =
				{
					{
						Key = "ArmorAtSetup",
						ExtractAs = "TooltipMaxArmor",
					},
				}
			},
		},
		AccumulatedMaxArmor = 0,
		RepairArmorOnDeathDefiancePercent =
		{
			BaseValue = 0.4,
			SourceIsMultiplier = true,
		},	
		ExtractValues =
		{
			{
				Key = "RepairArmorOnDeathDefiancePercent",
				ExtractAs = "TooltipRepairArmor",
				Format = "Percent",
			},
		}
	}
	
	OlympusTraitData.ArmorBossTrait = 
	{
		Name = "ArmorBossTrait",
		InheritFrom = { "ShopTier1Trait" },
		LootSource = "HephaestusUpgrade",
		Icon = "Boon_Hephaestus_09",
		RequiredFalseTrait = "ArmorBossTrait",
		CustomTrayText = "ArmorBossTrait_Tray",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.2,
			},
			Epic =
			{
				Multiplier = 1.47,
			},
			Heroic =
			{
				Multiplier = 1.6,
			}
		},	
		SetupFunction =
		{
			Name = "SetupArmor",
			RunOnce = true,
			Args =
			{
				ArmorAtSetup = 25,
				Source = "ArmorBossTrait",
				ExtractValues =
				{
					{
						Key = "ArmorAtSetup",
						ExtractAs = "TooltipMaxArmor",
					},
				}
			},
		},
		AccumulatedMaxArmor = 0,
		RepairArmorOnBoss =
		{
			BaseValue = 15,
		},	
		ExtractValues =
		{
			{
				Key = "RepairArmorOnBoss",
				ExtractAs = "TooltipRepairArmor",
			},
		}
	}
	OlympusTraitData.HephaestusTrapTrait =
	{
		Name = "HephaestusTrapTrait",
		InheritFrom = { "ShopTier2Trait" },
		LootSource = "HephaestusUpgrade",
		Icon = "Boon_Hephaestus_13",
		RequiredFalseTrait = "HephaestusTrapTrait",
		PreEquipWeapons = { "IgneousTrapExplosion" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.14,
			},
			Epic =
			{
				Multiplier = 1.28,
			},
			Heroic =
			{
				Multiplier = 1.43
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "IgneousTrapExplosion" },
				ProjectileProperty = "DamageLow",
				BaseMin = 70,
				BaseMax = 70,
				AsInt = true,
				DepthMult = DepthDamageMultiplier,
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
				WeaponNames = { "IgneousTrapExplosion" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		},
	}
	OlympusTraitData.DamageReturnTrait ={
		Name = "DamageReturnTrait",
		InheritFrom = { "ShopTier1Trait" },
		LootSource = "HephaestusUpgrade",
		Icon = "Boon_Hephaestus_06",
		RequiredFalseTrait = "DamageReturnTrait",
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
		RevengeDamage =
		{
			BaseValue = 5,
		},	
		ExtractValues =
		{
			{
				Key = "RevengeDamage",
				ExtractAs = "TooltipRevengeDamage",
				Format = "Percent",
			},
		}
	}
	OlympusTraitData.ArmorLegendaryTrait =
	{
		Name = "ArmorLegendaryTrait",
		InheritFrom = { "ShopTier3Trait" },
		LootSource = "HephaestusUpgrade",
		RequiredFalseTrait = "ArmorLegendaryTrait",
		Icon = "Boon_Hephaestus_14",		
		SetupFunction =
		{
			Name = "SetupArmor",
			RunOnce = true,
			Args = 
			{
				ArmorAtSetup = 100,
				Source = "ArmorLegendaryTrait",
				SpawnWeaponUpgrade = true,
				ExtractValues =
				{
					{
						Key = "ArmorAtSetup",
						ExtractAs = "TooltipMaxArmor",
					},
				}
			},
		},
		AccumulatedMaxArmor = 0,
	}
	table.insert(OlympusRewardStoreData.RunProgress, {
		Name = "WeaponUpgrade",
		GameStateRequirements =
		{
			RequiredTrait = "ArmorLegendaryTrait",
			RequiredMaxWeaponUpgrades = 1,
			RequiredNotInStore = "WeaponUpgradeDrop",
			RequiredMinCompletedRuns = 3,
		}
	})
	table.insert(OlympusRewardStoreData.RunProgress, {
		Name = "WeaponUpgrade",
		GameStateRequirements =
		{
			RequiredTrait = "ArmorLegendaryTrait",
			RequiredMaxWeaponUpgrades = 2,
			RequiredNotInStore = "WeaponUpgradeDrop",
			RequiredMinCompletedRuns = 3,
			RequiredMinDepth = 21, --13
		}
	})
	table.insert(OlympusRewardStoreData.RunProgress, {
		Name = "WeaponUpgrade",
		GameStateRequirements =
		{
			RequiredTrait = "ArmorLegendaryTrait",
			RequiredMaxWeaponUpgrades = 3,
			RequiredNotInStore = "WeaponUpgradeDrop",
			RequiredMinCompletedRuns = 3,
			RequiredMinDepth = 26,
		}
	})
	-- Improved Traits
	-- Zeus	 
	OlympusTraitData.ZeusChargedBoltTrait.RequiredFalseTraits = {"ZeusChargedBoltTrait", "HephaestusImproveZeus"}
	OlympusTraitData.HephaestusImproveZeus =
	{
		Name = "HephaestusImproveZeus",
		Icon = "Boon_Zeus_02",
		ReplaceTrait = "ZeusChargedBoltTrait",
		IsImproveBoon = true,
		InheritFrom = { "ShopTier3Trait" },
		God = "Zeus",
		PreEquipWeapons = { "ZeusLegendaryWeapon" },
		RequiredFalseTraits = { "HephaestusImproveZeus" },
		CustomTrayText = "HephaestusImproveZeus_Tray",		
		PropertyChanges =
		{
			{
				WeaponName = "ZeusLegendaryWeapon",
				ProjectileName = "LightningSpark",
				ProjectileProperty = "DamageLow",
				BaseMin = 60,
				BaseMax = 60,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				AutoRamp = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				DeriveSource = "DeriveSource",
			},
			{
				WeaponName = "ZeusLegendaryWeapon",
				ProjectileName = "LightningSpark",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DeriveSource",
			},
		},
	}
	-- Athena
	OlympusTraitData.ShieldHitTrait.RequiredFalseTrait = nil
	OlympusTraitData.ShieldHitTrait.RequiredFalseTraits = {"ShieldHitTrait", "HephaestusImproveAthena"}
	OlympusTraitData.HephaestusImproveAthena =
	{
		Name = "HephaestusImproveAthena",
		InheritFrom = { "ShopTier3Trait" },
		Icon = "Boon_Athena_10",
		ReplaceTrait = "ShieldHitTrait",
		IsImproveBoon = true,
		RequiredFalseTrait = "HephaestusImproveAthena",
		PreEquipWeapons = { "AthenaDefenseApplicator" },
		CustomTrayText = "HephaestusImproveAthena_Tray",		
		SetupFunction =
		{
			Name = "ReactivateInvulnerability",
		},
		PreviousTimeCooldown = 20,
		CurrentCooldown = 12,
		TimeCooldown = 12,
		ReactivateFunction = "ReactivateInvulnerability",
		ExtractValues =
		{
			{
				Key = "TimeCooldown",
				ExtractAs = "TooltipCooldown",
			},
			{
				Key = "PreviousTimeCooldown",
				ExtractAs = "TooltipPreviousCooldown",
			}
		}
	}
	-- Poseidon
	OlympusTraitData.DoubleCollisionTrait.RequiredFalseTrait = nil
	OlympusTraitData.DoubleCollisionTrait.RequiredFalseTraits = {"DoubleCollisionTrait", "HephaestusImprovePoseidon"}
	OlympusTraitData.HephaestusImprovePoseidon =
	{
		Name = "HephaestusImprovePoseidon",
		InheritFrom = { "ShopTier3Trait" },
		RequiredFalseTrait = "HephaestusImprovePoseidon",
		ReplaceTrait = "DoubleCollisionTrait",
		IsImproveBoon = true,
		Icon = "Boon_Poseidon_07",
		CustomTrayText = "HephaestusImprovePoseidon_Tray",		
		PropertyChanges =
		{
			{
				TraitName = "PoseidonRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "DelayedKnockback",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "DelayedKnockback",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DelayedKnockback",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DelayedKnockback",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonAphroditeTouchTrait",
				WeaponName = "PoseidonAphroditeTouchWeapon",
				EffectName = "DelayedKnockback",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonShoutTrait",
				WeaponName = "PoseidonSurfWeapon",
				EffectName = "DelayedKnockback",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			-- Second Delayed
			{
				TraitName = "PoseidonRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "SecondDelayedKnockback",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "SecondDelayedKnockback",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "SecondDelayedKnockback",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "SecondDelayedKnockback",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonAphroditeTouchTrait",
				WeaponName = "PoseidonAphroditeTouchWeapon",
				EffectName = "SecondDelayedKnockback",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonShoutTrait",
				WeaponName = "PoseidonSurfWeapon",
				EffectName = "SecondDelayedKnockback",
				EffectProperty = "Active",
				ChangeValue = true,
			},
		}
	}
	-- Poseidon 2
	OlympusTraitData.FishingTrait.RequiredFalseTrait = nil
	OlympusTraitData.FishingTrait.RequiredFalseTraits = {"FishingTrait", "HephaestusImproveFishPoseidon"}
	OlympusTraitData.HephaestusImproveFishPoseidon =
	{
		Name = "HephaestusImproveFishPoseidon",
		InheritFrom = { "ShopTier3Trait" },
		RequiredFalseTrait = "HephaestusImproveFishPoseidon",
		RequiredTextLines = { "PoseidonFishQuest01" },
		ReplaceTrait = "FishingTrait",
		IsImproveBoon = true,
		Icon = "Boon_Poseidon_13",
		CustomTrayText = "HephaestusImproveFishPoseidon_Tray",
		FishingPointChanceBonus = 0.35,
		DisableFishRequirements = true,
		ExtractValues =
		{
			{
				Key = "FishingPointChanceBonus",
				ExtractAs = "TooltipBonus",
				Format = "Percent",
			}
		}
	}
	-- Artemis
	OlympusTraitData.MoreAmmoTrait.RequiredFalseTrait = nil
	OlympusTraitData.MoreAmmoTrait.RequiredFalseTraits = {"MoreAmmoTrait", "HephaestusImproveArtemis"}
	OlympusTraitData.HephaestusImproveArtemis =
	{
		Name = "HephaestusImproveArtemis",
		InheritFrom = { "ShopTier3Trait" },
		Icon = "Boon_Artemis_07",
		RequiredFalseTrait = "HephaestusImproveArtemis",
		ReplaceTrait = "MoreAmmoTrait",
		IsImproveBoon = true,
		CustomTrayText = "HephaestusImproveArtemis_Tray",
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "MaxAmmo",
				BaseValue = 4.0,
				ChangeType = "Add",
				MinMultiplier = 1,
				ExtractValue =
				{
					ExtractAs = "TooltipCapacity",
				}
			},
		},
	}
	-- Aphrodite
	OlympusTraitData.CharmTrait.RequiredFalseTrait = nil
	OlympusTraitData.CharmTrait.RequiredFalseTraits = {"CharmTrait", "HephaestusImproveAphrodite"}
	OlympusTraitData.HephaestusImproveAphrodite =
	{
		Name = "HephaestusImproveAphrodite",
		Icon = "Boon_Aphrodite_10",
		RequiredFalseTrait = "HephaestusImproveAphrodite",
		God = "Aphrodite",
		InheritFrom = { "ShopTier3Trait" },
		CustomTrayText = "HephaestusImproveAphrodite_Tray",
		ReplaceTrait = "CharmTrait",
		IsImproveBoon = true,
		AddOnEffectWeapons =
		{
			EffectName = "ReduceDamageOutput",
			Weapon = "AphroditeCharmWeapon",
			AffectChance = 0.30,
			ExtractValues =
			{
				{
					Key = "AffectChance",
					ExtractAs = "TooltipAffectChance",
					SkipAutoExtract = true,
					Format = "Percent",
				}
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "AphroditeCharmWeapon",
				EffectName = "Charm",
				EffectProperty = "Duration",
				ChangeValue = 4,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				},
				DeriveTarget = "DurationTarget"
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipWeakDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipWeakPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Modifier",
				Format = "NegativePercentDelta"
			}
		}
	}
	-- Ares
	OlympusTraitData.AresCursedRiftTrait.RequiredFalseTrait = nil
	OlympusTraitData.AresCursedRiftTrait.RequiredFalseTraits = {"AresCursedRiftTrait", "HephaestusImproveAres"}
	OlympusTraitData.HephaestusImproveAres =
	{
		Name = "HephaestusImproveAres",
		InheritFrom = { "ShopTier3Trait" },
		RequiredFalseTrait = "HephaestusImproveAres",
		Icon = "Boon_Ares_09",
		TextStore = "AresShoutTrait",
		CustomTrayText = "HephaestusImproveAres_Tray",
		ReplaceTrait = "AresCursedRiftTrait",
		IsImproveBoon = true,
		PropertyChanges =
		{
			{
				TraitName = "AresRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "AresProjectile",
				ProjectileProperty = "DamagePerConsecutiveProjectileHit",
				ChangeValue = 3,
				ChangeType = "Absolute",
				DeriveSource = "DamageSource",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				TraitName = "ShieldLoadAmmo_AresRangedTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileName = "AresRushProjectile",
				ProjectileProperty = "DamagePerConsecutiveProjectileHit",
				DeriveValueFrom = "DamageSource"
			},
			{
				TraitName = "AresRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileName = "AresRushProjectile",
				ProjectileProperty = "DamagePerConsecutiveProjectileHit",
				DeriveValueFrom = "DamageSource"
			},

			{
				TraitName = "AresShoutTrait",
				WeaponNames = { "AresSurgeWeapon" },
				ProjectileName = "AresInvisibleAoE",
				ProjectileProperty = "DamagePerConsecutiveHit",
				DeriveValueFrom = "DamageSource"
			},
			{
				TraitName = "AresShoutTrait",
				WeaponNames = { "AresSurgeWeapon" },
				ProjectileName = "AresInvisibleAoE",
				ProjectileProperty = "ConsecutiveHitWindow",
				ChangeValue = 0.55,
				ChangeType = "Absolute",
				DeriveSource = "WindowSource"
			},
		},
	}
	-- Dionysus
	OlympusTraitData.DionysusComboVulnerability.RequiredFalseTrait = nil
	OlympusTraitData.DionysusComboVulnerability.RequiredFalseTraits = {"DionysusComboVulnerability", "HephaestusImproveDionysus"}
	OlympusTraitData.HephaestusImproveDionysus =
	{
		Name = "HephaestusImproveDionysus",
		InheritFrom = { "ShopTier3Trait" },
		RequiredFalseTrait = "HephaestusImproveDionysus",
		God = "Dionysus",
		Icon = "Boon_Dionysus_08",
		CustomTrayText = "HephaestusImproveDionysus_Tray",
		ReplaceTrait = "DionysusComboVulnerability",
		IsImproveBoon = true,
		AddOutgoingDamageModifiers =
		{
			RequiredEffects = { "DamageOverTime", "WinePuddleVulnerability" },
			RequiredEffectsMultiplier =
			{
				BaseValue = 1.8,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ExtractValues =
			{
				{
					Key = "RequiredEffectsMultiplier",
					ExtractAs = "TooltipBonus",
					Format = "PercentDelta",
				},
			}
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
				ExtractAs = "TooltipCloudDuration",
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "DionysusField",
				BaseProperty = "TotalFuse",
			},
			{
				ExtractAs = "TooltipCloudInterval",
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "DionysusField",
				BaseProperty = "Fuse",
				DecimalPlaces = 2,
			}
		}
	}
	-- Demeter
	OlympusTraitData.InstantChillKill.RequiredFalseTrait = nil
	OlympusTraitData.InstantChillKill.RequiredFalseTraits = {"InstantChillKill", "HephaestusImproveDemeter"}
	OlympusTraitData.HephaestusImproveDemeter =
	{
		Name = "HephaestusImproveDemeter",
		InheritFrom = { "ShopTier3Trait" },
		Icon = "Boon_Demeter_10",
		RequiredFalseTrait = "HephaestusImproveDemeter",
		CustomTrayText = "HephaestusImproveDemeter_Tray",
		ReplaceTrait = "InstantChillKill",
		IsImproveBoon = true,
		OnDamageEnemyFunction = {
			FunctionName = "CheckChillKill",
			Args = {
				ChillDeathThreshold = 0.15,
				ExtractValues =
				{
					{
						Key = "ChillDeathThreshold",
						ExtractAs = "TooltipDeathThreshold",
						Format = "Percent",
					},
				}
			}
		},
		PreEquipWeapons = { "DemeterChillKill" },
		PropertyChanges =
		{
			{
				WeaponName = "DemeterChillKill",
				ProjectileProperty = "DamageLow",
				BaseMin = 75,
				BaseMax = 75,
				AsInt = true,
				DepthMult = DepthDamageMultiplier,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			{
				WeaponName = "DemeterChillKill",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
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

	local OlympusLootData = ModUtil.Entangled.ModData(LootData)
	-- LootData
	OlympusLootData.HephaestusUpgrade =
	{
		InheritFrom = { "BaseLoot", "BaseSoundPackage" },
		CanReceiveGift = true,
		AlwaysShowDefaultUseText = true,
		GodLoot = false,
		TreatAsGodLootByShops = true,
		Weight = 10,
		Icon = "BoonSymbolHephaestus",
		BoonInfoIcon = "BoonInfoSymbolHephaestusIcon",
		DoorIcon = "BoonSymbolHephaestusIsometric",
		Color = { 255, 100, 0, 255 },
		LightingColor = {255, 120, 0, 255},
		LootColor = {255, 90, 0, 255},
		SubtitleColor = {0.945, 0.686, 0.349, 1.0},
		EventEndSound = "/SFX/AnvilOfFatesUse",
		UpgradeSelectedSound = "/SFX/HephaestusBoonChoice",

		RequiredTextLines = { "HermesFirstPickUp" },

		PriorityUpgrades = {},
		WeaponUpgrades = {},
		Traits = { "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRangedTrait", "HephaestusShoutSummon",  "DropMoneyTrait", "SpawnWeaponsTrait", "RevengeBoostTrait", "DamageReturnTrait", "HephaestusTrapTrait", "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait" },
		Consumables = {  },
		LinkedUpgrades =
		{
			ArmorLegendaryTrait =
			{
				OneOf = { "ArmorBossTrait", "ArmorEncounterTrait", "ArmorDefianceTrait" },
			},
			-- Legendary boost
			HephaestusImproveZeus = {
				OneFromEachSet =
				{
					{ "ZeusChargedBoltTrait" },
					{ "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRangedTrait", "HephaestusShoutSummon",  "DropMoneyTrait", "SpawnWeaponsTrait", "RevengeBoostTrait", "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait", "ForceWeaponUpgradeTrait" },
				}
			},
			HephaestusImproveAthena = {
				OneFromEachSet =
				{
					{ "ShieldHitTrait" },
					{ "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRangedTrait", "HephaestusShoutSummon",  "DropMoneyTrait", "SpawnWeaponsTrait", "RevengeBoostTrait", "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait", "ForceWeaponUpgradeTrait" },
				}
			},
			HephaestusImprovePoseidon = {
				OneFromEachSet =
				{
					{ "DoubleCollisionTrait" },
					{ "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRangedTrait", "HephaestusShoutSummon",  "DropMoneyTrait", "SpawnWeaponsTrait", "RevengeBoostTrait", "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait", "ForceWeaponUpgradeTrait" },
				}
			},
			HephaestusImproveFishPoseidon = {
				OneFromEachSet =
				{
					{ "FishingTrait" },
					{ "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRangedTrait", "HephaestusShoutSummon",  "DropMoneyTrait", "SpawnWeaponsTrait", "RevengeBoostTrait", "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait", "ForceWeaponUpgradeTrait" },
				}
			},
			HephaestusImproveArtemis = {
				OneFromEachSet =
				{
					{ "MoreAmmoTrait" },
					{ "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRangedTrait", "HephaestusShoutSummon",  "DropMoneyTrait", "SpawnWeaponsTrait", "RevengeBoostTrait", "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait", "ForceWeaponUpgradeTrait" },
				}
			},
			HephaestusImproveAphrodite = {
				OneFromEachSet =
				{
					{ "CharmTrait" },
					{ "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRangedTrait", "HephaestusShoutSummon",  "DropMoneyTrait", "SpawnWeaponsTrait", "RevengeBoostTrait", "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait", "ForceWeaponUpgradeTrait" },
				}
			},
			HephaestusImproveAres = {
				OneFromEachSet =
				{
					{ "AresCursedRiftTrait" },
					{ "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRangedTrait", "HephaestusShoutSummon",  "DropMoneyTrait", "SpawnWeaponsTrait", "RevengeBoostTrait", "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait", "ForceWeaponUpgradeTrait" },
				}
			},
			HephaestusImproveDionysus = {
				OneFromEachSet =
				{
					{ "DionysusComboVulnerability" },
					{ "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRangedTrait", "HephaestusShoutSummon",  "DropMoneyTrait", "SpawnWeaponsTrait", "RevengeBoostTrait", "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait", "ForceWeaponUpgradeTrait" },
				}
			},
			HephaestusImproveDemeter = {
				OneFromEachSet =
				{
					{ "InstantChillKill" },
					{ "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRangedTrait", "HephaestusShoutSummon",  "DropMoneyTrait", "SpawnWeaponsTrait", "RevengeBoostTrait", "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait", "ForceWeaponUpgradeTrait" },
				}
			},
		},

		Speaker = "NPC_Hephaestus_01",
		Portrait = "Portrait_Hephaestus_Default_01",
		Gender = "Male",
		SpawnSound = "/SFX/AnvilOfFatesUse",
		FlavorTextIds =
		{
			"HephaestusUpgrade_FlavorText01",
			"HephaestusUpgrade_FlavorText02",
			"HephaestusUpgrade_FlavorText03",
		},

		OnSpawnVoiceLines =
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			PlayOnceThisRun = true,
			PreLineWait = 0.85,
			ChanceToPlay = 0.33,
			RequiredTextLines = { "HephaestusFirstPickUp" },
			RequiredFalseEncounters = { "DevotionTestTartarus", "DevotionTestAsphodel", "DevotionTestElysium", "Shop" },
			CooldownName = "SaidHephaestusRecently",
			CooldownTime = 40,

			-- Lord Hephaestus.
			{ Cue = "/VO/ZagreusField_5021" },
			-- Hello, Hephaestus.
			{ Cue = "/VO/ZagreusField_5022", RequiredPlayed = { "/VO/ZagreusField_5021" } },
			-- The blacksmith god.
			{ Cue = "/VO/ZagreusField_5023", RequiredPlayed = { "/VO/ZagreusField_5021" } },
			-- Time for an upgrade.
			{ Cue = "/VO/ZagreusField_5024", RequiredPlayed = { "/VO/ZagreusField_5021" } },
			-- It's smithing time.
			{ Cue = "/VO/ZagreusField_5025", RequiredPlayed = { "/VO/ZagreusField_5021" } },
			-- There he is.
			{ Cue = "/VO/ZagreusField_1929", RequiredPlayed = { "/VO/ZagreusField_5021" } },
			-- An upgrade for me?
			{ Cue = "/VO/ZagreusField_5026", RequiredPlayed = { "/VO/ZagreusField_5021" } },
			-- He's back.
			{ Cue = "/VO/ZagreusField_1932", RequiredPlayed = { "/VO/ZagreusField_5021" } },
		},

		UpgradeMenuOpenVoiceLines =
		{
			{
				PlayOnce = true,
				BreakIfPlayed = true,
				PreLineWait = 1.3,
				RequiredTextLinesThisRoom = { "HephaestusAboutSkelly01" },
				Queue = "Always",

				-- What... he meant Skelly's tooth?
				{ Cue = "/VO/ZagreusField_3962" },
			},
			[2] = GlobalVoiceLines.CheckOlympianReunionVoiceLines,
			[3] = GlobalVoiceLines.FoundRareBoonVoiceLines,
		},
		--DuoPickupTextLineSets = {}, -- Don't know why I have to have this...
		ImprovePickupTextLineSets =
		{
			HephaestusImproveZeus01 =
			{
				Name = "HephaestusImproveZeus01",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "HephaestusImproveZeus",
				{ Cue = "/VO/Hephaestus_0044",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "I see you got my father's blessing. And {#DialogueItalicFormat}whoa{#PreviousFormat}, is it a good one! If I may, let me see if we can't improve on good Lord Dad's work, {#DialogueItalicFormat}eh{#PreviousFormat}?" },
			},
			HephaestusImproveAthena01 =
			{
				Name = "HephaestusImproveAthena01",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "HephaestusImproveAthena",
				{ Cue = "/VO/Hephaestus_0045",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "Athena's shields are always fun to tune up. She's kind of picky when it comes to quality, but {#DialogueItalicFormat}eh{#PreviousFormat}, so am I." },
			},
			HephaestusImproveAres01 =
			{
				Name = "HephaestusImproveAres01",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "HephaestusImproveAres",
				{ Cue = "/VO/Hephaestus_0046",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "I see you received Ares' blessing. Hanging with warriors like him, are ya? I am not judging, I'm a professional. Let me show you what a real weapon looks like." },
			},
			HephaestusImproveAphrodite01 =
			{
				Name = "HephaestusImproveAphrodite01",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "HephaestusImproveAphrodite",
				{ Cue = "/VO/Hephaestus_0047",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "{#DialogueItalicFormat}Oi{#PreviousFormat}, you got to see Aphrodite! All she makes is perfect... but that's not gonna stop me trying to improve it." },
			},
			HephaestusImprovePoseidon01 =
			{
				Name = "HephaestusImprovePoseidon01",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasAnyTraitNamesInRoom = { "HephaestusImprovePoseidon", "HephaestusImproveFishPoseidon" },
				{ Cue = "/VO/Hephaestus_0048",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "Uncle Poseidon passed by! Did you know he asked me to craft a board that could ride a wave once? Just proves that everyone's got that one weird uncle, {#DialogueItalicFormat}eh{#PreviousFormat}, Zagreus?" },
			},
			HephaestusImproveArtemis01 =
			{
				Name = "HephaestusImproveArtemis01",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "HephaestusImproveArtemis",
				{ Cue = "/VO/Hephaestus_0049",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "You talked to Artemis, {#DialogueItalicFormat}eh{#PreviousFormat}? She always gets straight to the point. Not wasting time on chit-chat. I like that. It would be an honor to improve her blessing." },
			},
			HephaestusImproveDionysus01 =
			{
				Name = "HephaestusImproveDionysus01",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "HephaestusImproveDionysus",
				{ Cue = "/VO/Hephaestus_0050",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "Of course, you have Dionysus' blessing. He gets in with anybody he can, and their bed... and their loins. {#DialogueItalicFormat}Urgh{#PreviousFormat}... let me see what I can do." },
			},
			HephaestusImproveDemeter01 =
			{
				Name = "HephaestusImproveDemeter01",
				PlayOnce = true,
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "HephaestusImproveDemeter01",
				{ Cue = "/VO/Hephaestus_0051",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "Now, that's a challenge. Demeter's blessings always melt when I try to improve them... but I think I got it this time around. Try this out." },
			},		
			HephaestusImproveMiscOlympian01 =
			{
				Name = "HephaestusImproveMiscOlympian01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasAnyTraitNamesInRoom = GameData.HephaestusImproveTraits,
				{ Cue = "/VO/Hephaestus_0052",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "Some say I work too much. Well, let me show you what their blessings would've looked like if {#DialogueItalicFormat}they{#PreviousFormat} worked harder to begin with." },
			},
			HephaestusImproveMiscOlympian02 =
			{
				Name = "HephaestusImproveMiscOlympian02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasAnyTraitNamesInRoom = GameData.HephaestusImproveTraits,
				{ Cue = "/VO/Hephaestus_0053",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "I see I am not the only one to have blessed you. But I'm confident the blessings I give you are the best!" },
			},
			HephaestusImproveMiscOlympian03 =
			{
				Name = "HephaestusImproveMiscOlympian03",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasAnyTraitNamesInRoom = GameData.HephaestusImproveTraits,
				{ Cue = "/VO/Hephaestus_0054",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "Is there something wrong with that blessing? Not to worry—I got you." },
			},
			HephaestusImproveMiscOlympian04 =
			{
				Name = "HephaestusImproveMiscOlympian04",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasAnyTraitNamesInRoom = GameData.HephaestusImproveTraits,
				{ Cue = "/VO/Hephaestus_0055",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "I believe you are getting used to the best, Zagreus. Well, say no more. Let me tune this for you." },
			},
			HephaestusImproveMiscOlympian05 =
			{
				Name = "HephaestusImproveMiscOlympian05",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasAnyTraitNamesInRoom = GameData.HephaestusImproveTraits,
				{ Cue = "/VO/Hephaestus_0056",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "{#DialogueItalicFormat}Ehh{#PreviousFormat}, could I take another look at that blessing? Believe there's room for improvement—if I could just—" },
			},
			HephaestusImproveMiscOlympian06 =
			{
				Name = "HephaestusImproveMiscOlympian06",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasAnyTraitNamesInRoom = GameData.HephaestusImproveTraits,
				{ Cue = "/VO/Hephaestus_0057",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "You should be used to my improvements by now. Well, back to the workshop." },
			},
		},
		SuperPriorityPickupTextLineSets =
		{
			HephaestusMotivationalSpeech01 =
			{
				Name = "HephaestusMotivationalSpeech01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredMinAnyTextLines = { TextLines = { "HephaestusExpectingZeus01", "HephaestusExpectingPoseidon01", "HephaestusExpectingAthena01", "HephaestusExpectingAphrodite01", "HephaestusExpectingAres01", "HephaestusExpectingArtemis01", "HephaestusExpectingDionysus01", "HephaestusExpectingDemeter01", }, Count = 2 },
				RequiredFalseGodLoots = { "ZeusUpgrade", "PoseidonUpgrade", "AthenaUpgrade", "AphroditeUpgrade", "AresUpgrade", "ArtemisUpgrade", "DionysusUpgrade", "DemeterUpgrade" },
				RequiredOneOfTraits = { "ForceZeusBoonTrait", "ForcePoseidonBoonTrait", "ForceAthenaBoonTrait", "ForceAresBoonTrait", "ForceAphroditeBoonTrait", "ForceArtemisBoonTrait", "ForceDionysusBoonTrait", "ForceDemeterBoonTrait" },
				{ Cue = "/VO/Hephaestus_0041",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I'll be straight with you. I know what failure looks like. How do you think I got there? I had to work hard to get where I am. You must learn to do the same. There's no free pass in life. Earn it." },
			},
			-- ending	
			HephaestusAboutOlympianReunionQuest01 =
			{
				Name = "HephaestusAboutOlympianReunionQuest01",
				PlayOnce = true,
				RequiredTextLines = { "HephaestusFirstPickUp", "PersephoneAboutOlympianReunionQuest01", },
				{ Cue = "/VO/ZagreusField_5001", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 2.7 },
					PostLineAnim = "ZagreusInteractEquip", PostLineAnimTarget = "Hero", PostLineFunctionName = "BoonInteractPresentation",
					Text = "I am sure you could use some time off, Lord Hephaestus. In the name of Hades! Olympus, this is an official message! I hope you can join the party." },
				{ Cue = "/VO/Hephaestus_0042",
					PortraitExitWait = 1.25,
					PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
					UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Eugh{#PreviousFormat}, an invitation for me? Gatherings aren't my cup of tea, if you get my drift. I'll let Hermes have the spotlight. If you'll excuse me, I still have a lot of work." },
			},
		},

		PriorityPickupTextLineSets =
		{
			HephaestusAboutKeepsake01 =
			{
				Name = "HephaestusAboutKeepsake01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredTrait = "ForceWeaponUpgradeTrait",

				{ Cue = "/VO/Hephaestus_0075",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You really brought a statue of yourself with you? I must say it is a little strange, even for me." },
			},
			HephaestusAboutFirstPickup01 =
			{
				Name = "HephaestusAboutFirstPickup01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				MinRunsSinceAnyTextLines = { TextLines = { "HephaestusFirstPickUp" }, Count = 5 },
				{ Cue = "/VO/Hephaestus_0076",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Zagreus. If I am being totally honest, I meant to come help you sooner, but I got distracted by some shiny toys Daedalus just made. Let me give this to you in recompense." },
			},
			HephaestusAboutHermes01 =
			{
				Name = "HephaestusAboutHermes01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredAnyTextLinesLastRun = GameData.HermesBasicPickUpTextLines,

				{ Cue = "/VO/Hephaestus_0077",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hermes and I don't work on the same schedule. Don't worry, there's no bad blood between us. We are just both so busy, far away from the other." },
			},
			HephaestusAboutHermes02 =
			{
				Name = "HephaestusAboutHermes02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "HephaestusAboutHermes01" },
				RequiredAnyTextLinesLastRun = GameData.HermesBasicPickUpTextLines,

				{ Cue = "/VO/Hephaestus_0078",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hermes keeps bragging to me how many requests he does in a day. But hey, quality over quantity, {#DialogueItalicFormat}eh{#PreviousFormat}?" },
			},
			HephaestusAboutDaedalus01 =
			{
				Name = "HephaestusAboutDaedalus01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredMinWeaponUpgrades = 1,

				{ Cue = "/VO/Hephaestus_0079",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Ahh{#PreviousFormat}, Daedalus... A fellow smith of great talent. But I must admit, his obsession with invention sometimes leaves him too focused on the mechanics, neglecting the artistry." },
			},
			HephaestusAboutDaedalus02 =
			{
				Name = "HephaestusAboutDaedalus02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredMinWeaponUpgrades = 1,

				{ Cue = "/VO/Hephaestus_0080",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Daedalus's hammers... they have a raw, destructive beauty to them. Efficient, precise—yet lacking the soul that true craftsmanship should carry. Still, I can respect the cleverness of his designs. Maybe his son, Icarus, can do better one day." },
			},
			HephaestusAboutAres01 =
			{
				Name = "HephaestusAboutAres01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredGodLoot = "AresUpgrade",

				{ Cue = "/VO/Hephaestus_0081",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Can you believe that Ares is my brother? I don't think we can ever get along after... well... There's some things you just can't forgive." },
			},
			HephaestusAboutAphrodite01 =
			{
				Name = "HephaestusAboutAphrodite01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredGodLoot = "AphroditeUpgrade",

				{ Cue = "/VO/Hephaestus_0082",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "My wife... beauty incarnate. She captivates hearts, yes, but her own heart? It's as elusive as the wind. I forged many things for her, gifts of gold and precious stones, but they were never enough. She was always drawn to... someone else." },
			},
			HephaestusAboutAphrodite02 =
			{
				Name = "HephaestusAboutAphrodite02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "HephaestusAboutAphrodite01" },
				RequiredGodLoot = "AphroditeUpgrade",

				{ Cue = "/VO/Hephaestus_0101",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "My wife has not been the most faithful, but even in our worst times, I know we cared for each other. I know I work too much, but I'd hardly say that's an excuse, eh, Zagreus?" },
			},
			HephaestusAboutStygius =
			{
				Name = "HephaestusAboutStygius",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredWeapon = "SwordWeapon",

				{ Cue = "/VO/Hephaestus_0083",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Ahh{#PreviousFormat}, Stygius... the blade forged in the depths, bound by dark magic. I can see the design, sharp and precise, but there's an edge of sorrow in it. This weapon has more than just steel—it’s imbued with the essence of loss." },
			},
			HephaestusAboutVaratha =
			{
				Name = "HephaestusAboutVaratha",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredWeapon = "SpearWeapon",

				{ Cue = "/VO/Hephaestus_0084",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The Eternal Spear! Your father wielded it against the Titans, back in the day. It's a strong piece of work. Not as fancy as other weapons, but it’s sharp and versatile. Everything that a weapon should be." },
			},
			HephaestusAboutAegis =
			{
				Name = "HephaestusAboutAegis",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredWeapon = "ShieldWeapon",

				{ Cue = "/VO/Hephaestus_0085",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Ahh{#PreviousFormat}, Aegis! Your cousin Athena favored this weapon because of its potential for both offense and defense. It's a sturdy companion in the battlefield, although not the most, uhh... artistic." },
			},
			HephaestusAbouCoronacht =
			{
				Name = "HephaestusAbouCoronacht",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredWeapon = "BowWeapon",

				{ Cue = "/VO/Hephaestus_0086",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Ahh{#PreviousFormat}, my mother's old weapon. I've always wanted to tinker with the so-called Heart-Seeker... ehh, forget it. Ain't worth encountering the wrath of you-know-who..." },
			},
			HephaestusAboutMalphon =
			{
				Name = "HephaestusAboutMalphon",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredWeapon = "FistWeapon",

				{ Cue = "/VO/Hephaestus_0087",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The cyclops did a great job on this one. Did you know Malphon was offered to many before falling into the hands of Demeter? And now it ended up in yours. What a surprise. You never know how the story's gonna end, {#DialogueItalicFormat}ehh{#PreviousFormat}?" },
			},
			HephaestusAboutExagryph =
			{
				Name = "HephaestusAboutExagryph",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredWeapon = "GunWeapon",

				{ Cue = "/VO/Hephaestus_0088",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Such beauty... I wonder how you got hold of Exagryph. {#DialogueItalicFormat}Hmph{#PreviousFormat}! Eris must be turning the underworld upside down looking for it! But don't worry—your secret is safe with me." },
			},
			HephaestusAboutArthur =
			{
				Name = "HephaestusAboutArthur",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredWeapon = "SwordWeapon",

				{ Cue = "/VO/Hephaestus_0089",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "That's a mighty unique sword you got there. I thought only a king could wield the thing. Hmph, who would know Prince of the Underworld qualified as 'worthy'. " },
			},
			HephaestusAboutGuanYu =
			{
				Name = "HephaestusAboutGuanYu",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredWeapon = "SpearWeapon",

				{ Cue = "/VO/Hephaestus_0090",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The ferocity of a {#DialogueItalicFormat}Guandao{#PreviousFormat}. We don't see these very often 'round these parts. Did you get a special delivery or something?" },
			},
			HephaestusAboutBeowulf =
			{
				Name = "HephaestusAboutBeowulf",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredWeapon = "ShieldWeapon",

				{ Cue = "/VO/Hephaestus_0091",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Who needs a weapon, when you can just use a shield like that? Legends says you can withstand the blows of many foes with the shield of the stalwart warrior-king. Even dragons!" },
			},
			HephaestusAbouRama =
			{
				Name = "HephaestusAbouRama",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredWeapon = "BowWeapon",

				{ Cue = "/VO/Hephaestus_0092",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Stringing that bow is no easy task. If you want to defeat your worst demons, you better learn how to use it properly. Many failed before you." },
			},
			HephaestusAboutGilgamesh =
			{
				Name = "HephaestusAboutGilgamesh",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredWeapon = "FistWeapon",

				{ Cue = "/VO/Hephaestus_0093",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I don't believe you can achieve more feats of strength than with these gauntlets. I've seen many weapons and this pair handles smoothly like oil on metal. " },
			},
			HephaestusAboutLucifer =
			{
				Name = "HephaestusAboutLucifer",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredWeapon = "GunWeapon",

				{ Cue = "/VO/Hephaestus_0094",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "That weapon... What a rebellious aura... Such fire suits you well. Blow that place up for me, eh?" },
			},--[[HephaestusAboutHammerWeapon01 =
			{
				Name = "HephaestusAboutHammerWeapon01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredWeapon = "HammerWeapon"
				{ Cue = "/VO/Hephaestus_0154",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You found yourself a fine hammer. I am sure you'll get used to its weight. It's a one of a kind." },
			},
			HephaestusAboutThorAspect01 =
			{
				Name = "HephaestusAboutThorAspect01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredWeapon = "HammerWeapon"
				{ Cue = "/VO/Hephaestus_0155",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Got some power there, eh? Zeus might get jealous if you're not careful." },
			},
			HephaestusAboutThorAspect02 =
			{
				Name = "HephaestusAboutThorAspect02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredMinAnyTextLines = { TextLines = { "HephaestusExpectingZeus01", "HephaestusExpectingPoseidon01", "HephaestusExpectingAthena01", "HephaestusExpectingAphrodite01", "HephaestusExpectingAres01", "HephaestusExpectingArtemis01", "HephaestusExpectingDionysus01", "HephaestusExpectingDemeter01", }, Count = 2 },
				RequiredFalseGodLoots = { "ZeusUpgrade", "PoseidonUpgrade", "AthenaUpgrade", "AphroditeUpgrade", "AresUpgrade", "ArtemisUpgrade", "DionysusUpgrade", "DemeterUpgrade" },
				RequiredOneOfTraits = { "ForceZeusBoonTrait", "ForcePoseidonBoonTrait", "ForceAthenaBoonTrait", "ForceAresBoonTrait", "ForceAphroditeBoonTrait", "ForceArtemisBoonTrait", "ForceDionysusBoonTrait", "ForceDemeterBoonTrait" },
				{ Cue = "/VO/Hephaestus_0156",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Mjölnir's compactness belies its destructive power, and the enchantment that binds it to Thor alone? A clever touch, indeed." },
			},]]
			HephaestusBackstory01 =
			{
				Name = "HephaestusBackstory01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "ZeusFirstPickUp", "HeraFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0095",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "As a newborn, I wasn't very... able. Hera didn't want a cripple for a son, and threw me off Olympus. I hope Hades wasn't as harsh to you during your childhood." },
			},
			HephaestusBackstory02 =
			{
				Name = "HephaestusBackstory02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusBackstory01" },
				{ Cue = "/VO/Hephaestus_0096",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Ehh{#PreviousFormat}, you might not know this... but I was raised by nymphs very far from Olympus. I only managed to seize my right as an Olympian when I returned all grown up. But that's a story for some other time." },
			},
			HephaestusBackstory03 =
			{
				Name = "HephaestusBackstory03",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusBackstory01" },
				{ Cue = "/VO/Hephaestus_0097",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I got my crafting skills from decades of smithing inside a volcano. Being a castaway had its advantages. Just like I found my true passion, you will too." },
			},
			HephaestusBackstory04 =
			{
				Name = "HephaestusBackstory04",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusBackstory02","HephaestusBackstory03", "HephaestusGift02" },
				{ Cue = "/VO/Hephaestus_0098",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I made my mother a golden throne once. Could you imagine being so arrogant that you would receive such a gift from the son you threw away... and genuinely believe that you deserved it, so much so you'd sit atop it? Well—that's what I counted on. She'd still be on it, if it was up to me." },
			},
			HephaestusBackstory05 =
			{
				Name = "HephaestusBackstory05",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusBackstory04" },
				{ Cue = "/VO/Hephaestus_0099",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Remember how I trapped my mother on top a golden throne? Well, Hermes convinced me to let her go. I did, but in exchange for two requests: my rightful place in Olympus—and her blessing to take Aphrodite as my wife." },
			},
			HephaestusBackstory06 =
			{
				Name = "HephaestusBackstory06",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusBackstory05" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				{ Cue = "/VO/Hephaestus_0100",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "It took me centuries of planning and work to earn my way back into Olympus. Never give up on your dreams, and with enough effort you will claim what it rightfully yours." },
			},
			HephaestusAboutTartarus01 =
			{
				Name = "HephaestusAboutTartarus01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredBiome = "Tartarus",
				{ Cue = "/VO/Hephaestus_0102",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Still in Tartarus, {#DialogueItalicFormat}eh{#PreviousFormat}? While you're there, take some time to appreciate Deadalus's designs with the maze. Works as intended, if you ain't out of there already. {#DialogueItalicFormat}Heh{#PreviousFormat}." },
			},

			HephaestusAboutAsphodel01 =
			{
				Name = "HephaestusAboutAsphodel01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredBiome = "Asphodel",
				{ Cue = "/VO/Hephaestus_0103",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The burning flames of Asphodel. I love the warm sensation of molten flame in the forge. You'll learn to love it, too." },
			},
			HephaestusAboutElysium01 =
			{
				Name = "HephaestusAboutElysium01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredBiome = "Elysium",
				{ Cue = "/VO/Hephaestus_0104",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The great garden of Elysium. A place for all heroes. I crafted many of the weapons they carried. Some were used to protect, to conquer, to carve their names into history. Others, though... those weapons became their undoing." },
			},
			HephaestusAboutStyx01 =
			{
				Name = "HephaestusAboutStyx01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredBiome = "Styx",
				{ Cue = "/VO/Hephaestus_0105",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I see you are getting close to the surface. Know that the Temple of Styx can be tricky to go through. But still, take some time to admire the unique architecture while you pass by." },
			},
			HephaestusAboutChaos01 =
			{
				Name = "HephaestusAboutChaos01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredLootThisRun = "TrialUpgrade",
				{ Cue = "/VO/Hephaestus_0106",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Ohh{#PreviousFormat}, hold up—what is this unfamiliar place you're in? Fascinating architecture! Tell me all about it once you visit me in my workshop." },
			},
			HephaestusAboutErebus01 =
			{
				Name = "HephaestusAboutErebus01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "HephaestusGift03" },
				RequiredMinRoomsSinceShrinePointDoor = 5,
				{ Cue = "/VO/Hephaestus_0107",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Erebus... It’s not a place for casual visits, even for gods. Don’t go getting yourself lost in there, mate. Wouldn't want to lose my favorite client, {#DialogueItalicFormat}eh{#PreviousFormat}?" },
			},
			--[[HephaestusAboutGaia01 =
			{
				Name = "HephaestusAboutGaia01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredAnyTextLines = { "HephaestusLootBought01", "HephaestusLootBought01_B", "HephaestusAboutHourglass01" },
				RequiredLootThisRun = "QuestUpgrade",
				{ Cue = "/VO/Hephaestus_0153",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Gaia's garden... it feels so peaceful. I've forgotten such beauty existed down there." },
			},]]
			HephaestusAboutGreece01 =
			{
				Name = "HephaestusAboutGreece01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "PersephoneMeeting04" },
				RequiresLastRunCleared = true,
				{ Cue = "/VO/Hephaestus_0108",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "If you ever make it to the surface, do watch the local wildlife, they tend to be a tad aggressive at times." },
			},
			HephaestusAboutInfernalTrove01 =
			{
				Name = "HephaestusAboutInfernalTrove01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredChallengeSwitchInRoom = true,
				{ Cue = "/VO/Hephaestus_0109",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I sense an Infernal Trove near you. Why don't you open it? There's always something to be gained from a little extra effort—every forge fire has its reward, don't you forget." },
			},

			HephaestusAboutDaedalusHammer01 =
			{
				Name = "HephaestusAboutDaedalusHammer01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "HephaestusAboutDaedalus01", "HephaestusAboutDaedalus02" },
				RequiredMinWeaponUpgrades = 1,
				{ Cue = "/VO/Hephaestus_0110",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You found one of Daedalus's Hammers, {#DialogueItalicFormat}eh{#PreviousFormat}? His creations might not have the same polish as mine, but they sure get the job done." },
			},
			HephaestusAboutPoseidon01 =
			{
				Name = "HephaestusAboutPoseidon01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredGodLoot = "PoseidonUpgrade",
				{ Cue = "/VO/Hephaestus_0111",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I appreciate my uncle Poseidon. When I was young and struggling, he was one of the few who saw something in me. I'll never forget it." },
			},

			HephaestusAboutAnvilOfFates01 =
			{
				Name = "HephaestusAboutAnvilOfFates01",
				Priority = true,
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "HephaestusAboutDaedalusHammer01" },
				RequiredMinWeaponUpgrades = 2,
				{ Cue = "/VO/Hephaestus_0112",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The Anvil of Fates is a tricky tool to wield. It tempts you with the promise of altering your path, but such power always comes with a cost. Are you willing to risk what was strong enough to get you this far?" },
			},
			HephaestusAboutDamageLessEncounter01 =
			{
				Name = "HephaestusAboutDamageLessEncounter01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", },
				RequiredNoDamageThisRoom = true,
				RequiredMaxHealthFraction = 1.0,
				{ Cue = "/VO/Hephaestus_0113",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Not a single scratch! You are getting really good at predicting your enemies' movements. But you can't go wrong with some extra armor, {#DialogueItalicFormat}eh{#PreviousFormat}?" },
			},

			HephaestusAboutDamageLessEncounter02 =
			{
				Name = "HephaestusAboutDamageLessEncounter02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", },
				RequiredNoDamageThisRoom = true,
				{ Cue = "/VO/Hephaestus_0114",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Dodged, and dodged. I couldn't move like you did with my leg, but it was impressive to watch. Here's your reward." },
			},
			HephaestusAboutDamageLessEncounter03 =
			{
				Name = "HephaestusAboutDamageLessEncounter03",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", },
				RequiredNoDamageThisRoom = true,
				{ Cue = "/VO/Hephaestus_0115",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Was that battle rigged? You didn't get hit! Here's to your hard work." },
			},

			--[[HephaestusAboutDamageLessRun01 =
			{
				Name = "HephaestusAboutDamageLessRun01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", },
				RequiredNoDamageThisRoom = true,
				{ Cue = "/VO/Hephaestus_0116",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Wait... I could've sworn that you made it to the surface... and without a single scratch! Maybe the heat from the forge fires are getting to me..." },
			},]]
			HephaestusPostEpilogue01 =
			{
				Name = "HephaestusPostEpilogue01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "OlympianReunionQuestComplete" },
				{ Cue = "/VO/Hephaestus_0119",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Ohh{#PreviousFormat}, Hermes told me you got your little gathering at Hades' place. Now, back to work. How about you visit my workshop? I'll show you a trick or two about smithing." },
			},

			--[[HephaestusLegendaryPickUp01 =
			{
				Name = "HephaestusLegendaryPickUp01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				ValuableUpgradeInRoom = {
					AllAtLeastRarity = "Rare",
					HasAtLeastRarity = "Epic",
				},
				{ Cue = "/VO/Hephaestus_0120",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "" },
			},]]

			HephaestusArmorPickUp01 =
			{
				Name = "HephaestusArmorPickUp01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredOneOfTraits = { "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait" },
				{ Cue = "/VO/Hephaestus_0121",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "If it's defense you need, I reckon I have the best to offer. Armor up!" },
			},
			HephaestusArmorPickUp02 =
			{
				Name = "HephaestusArmorPickUp02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "EurydiceAboutHephaestus01" },
				RequiredOneOfTraits = { "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait" },
				{ Cue = "/VO/Hephaestus_0122",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "With this, nothing can get through ya. Unless you let them. Then I don't know what to tell you." },
			},

			HephaestusLowHealth01 =
			{
				Name = "HephaestusLowHealth01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				{ Cue = "/VO/Hephaestus_0123",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Your armor's looking a little dinged up there. I hope this will help turn the tables." },
			},
			HephaestusLowHealth02 =
			{
				Name = "HephaestusLowHealth02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				{ Cue = "/VO/Hephaestus_0124",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Mate, I know that your armor is great and all, but maybe you might want to learn from Hermes every now and then." },
			},
			HephaestusLowHealth03 =
			{
				Name = "HephaestusLowHealth03",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				{ Cue = "/VO/Hephaestus_0125",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Your life is running out of ya, Zagreus. There's only so much surface I can patch." },
			},
			HephaestusLowHealth04 =
			{
				Name = "HephaestusLowHealth04",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				{ Cue = "/VO/Hephaestus_0126",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Let's build up your defense, {#DialogueItalicFormat}eh{#PreviousFormat}? You look like you could use some." },
			},
			HephaestusLowHealth05 =
			{
				Name = "HephaestusLowHealth05",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				{ Cue = "/VO/Hephaestus_0127",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Life isn't going great, {#DialogueItalicFormat}eh{#PreviousFormat}? Better build a better base. Here's some pointers." },
			},
		},

		PickupTextLineSets =
		{
			HephaestusFirstPickUp =
			{
				Name = "HephaestusFirstPickUp",
				PlayOnce = true,
				RequiredTextLines = { "AthenaFirstPickUp", "HermesFirstPickUp", },
				{ Cue = "/VO/ZagreusField_5000", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 3.05 },
					PostLineAnim = "ZagreusInteractEquip", PostLineAnimTarget = "Hero", PostLineFunctionName = "BoonInteractPresentation",
					Text = "{#DialogueItalicFormat}Hm{#PreviousFormat}, I could've sworn I sensed Hermes earlier, but this presence is different. Olympus, I accept this message!" },
				{ Cue = "/VO/Hephaestus_0001",
					PortraitExitWait = 1.25,
					PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
					UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Oi{#PreviousFormat}, Hermes couldn't make it and asked me to help finetune your escape plan. Daedalus sure knows how to create a great maze, {#DialogueItalicFormat}eh{#PreviousFormat}?" },
			},
			HephaestusMiscPickup01 =
			{
				Name = "HephaestusMiscPickup01",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0002",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Smithing is my passion. At the forge, all my worries melt away as if they were the metal I forge. But at times, I feel that others take my creation for granted." },
			},
			HephaestusMiscPickup02 =
			{
				Name = "HephaestusMiscPickup02",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", },
				{ Cue = "/VO/Hephaestus_0003",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "My hammer knows no limit. I can forge your blessings with any mineral or material. Let me show you." },
			},
			HephaestusMiscPickup03 =
			{
				Name = "HephaestusMiscPickup03",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0004",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Nothing beats hard work, am I right, Zagreus? You must have a lot to do on your end. Maybe this will help you." },
			},
			HephaestusMiscPickup04 =
			{
				Name = "HephaestusMiscPickup04",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", },
				{ Cue = "/VO/Hephaestus_0005",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The bronze and iron are still warm. Freshly molded for your needs. Take it." },
			},
			HephaestusMiscPickup05 =
			{
				Name = "HephaestusMiscPickup05",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0006",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "There's only one thing that will get you out of there, Zagreus—and that's hard work. Nothing else. Now, show me what you got." },
			},
			HephaestusMiscPickup06 =
			{
				Name = "HephaestusMiscPickup06",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0007",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Slow and steady wins the race. Hermes likes to boast about gifts of speed, but... you might find that surviving brings you further." },
			},
			HephaestusMiscPickup07 =
			{
				Name = "HephaestusMiscPickup07",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", },
				{ Cue = "/VO/Hephaestus_0008",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Oi{#PreviousFormat}, steel yourself. Just because you get a break doesn't mean you're safe. There's always the next challenge." },
			},
			HephaestusMiscPickup08 =
			{
				Name = "HephaestusMiscPickup08",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", },
				{ Cue = "/VO/Hephaestus_0009",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "If all you have is a hammer, everything looks like a nail. Sometimes, the simplest solution is to bash your way through." },
			},
			HephaestusMiscPickup09 =
			{
				Name = "HephaestusMiscPickup09",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0010",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You have my sword... And my bow... And my axe... And any other weapon of mine you can ask for." },
			},
			HephaestusMiscPickup10 =
			{
				Name = "HephaestusMiscPickup10",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0011",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "In this world, you are either an anvil or a hammer, Zagreus. Think carefully about which you want to be." },
			},
			HephaestusMiscPickup11 =
			{
				Name = "HephaestusMiscPickup11",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", },
				{ Cue = "/VO/Hephaestus_0012",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Life is like smithing, Zagreus. It beats you down until you are tempered and sharp enough to slice through anything in front of you. You're just getting sharpened." },
			},
			HephaestusMiscPickup12 =
			{
				Name = "HephaestusMiscPickup12",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0013",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Without patience and practice, even the greatest talent of the most skilled craftsman is wasted. So, don't waste the hard work I've poured into you, alright?" },
			},
			HephaestusMiscPickup13 =
			{
				Name = "HephaestusMiscPickup13",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", },
				{ Cue = "/VO/Hephaestus_0014",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "To succeed, you need a clear goal. Commit to reaching Olympus, and you'll reach it in no time." },
			},
			HephaestusMiscPickup14 =
			{
				Name = "HephaestusMiscPickup14",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0015",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "There will be obstacles. There will be those who doubt you. There will be mistakes. But as long as you continue, nothing can ever hold you back." },
			},
			HephaestusMiscPickup15 =
			{
				Name = "HephaestusMiscPickup15",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", },
				{ Cue = "/VO/Hephaestus_0016",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Success isn’t something you can measure. Either you fail or you succeed. There's no in-between." },
			},
			-- Relationship improved
			HephaestusMiscPickup16 =
			{
				Name = "HephaestusMiscPickup16",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "HephaestusGift01" },
				{ Cue = "/VO/Hephaestus_0017",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Pain is temporary. Quitting is forever. But I see you don't quit easily, {#DialogueItalicFormat}eh{#PreviousFormat}? Keep going, Zagreus." },
			},
			HephaestusMiscPickup17 =
			{
				Name = "HephaestusMiscPickup17",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "HephaestusGift01" },
				{ Cue = "/VO/Hephaestus_0018",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Ohh{#PreviousFormat}, I work hard {#DialogueItalicFormat}all{#PreviousFormat} the time. But when it comes to you, Zagreus, I always like to put in just that little extra." },
			},
			HephaestusMiscPickup18 =
			{
				Name = "HephaestusMiscPickup18",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "HephaestusGift01" },
				{ Cue = "/VO/Hephaestus_0019",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I'm still on a productive streak thanks to your gift, Zagreus. You'll see what my work looks like at full efficiency." },
			},
			HephaestusMiscPickup19 =
			{
				Name = "HephaestusMiscPickup19",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "HephaestusGift01" },
				{ Cue = "/VO/Hephaestus_0020",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The best work comes not just from skill, but from intent and purpose. And you, my friend, make the effort feel worthwhile. " },
			},
			HephaestusMiscPickup20 =
			{
				Name = "HephaestusMiscPickup20",
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "HephaestusGift01" },
				{ Cue = "/VO/Hephaestus_0021",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Where you find quality, you will find a craftsman. And it's a good thing you found me, {#DialogueItalicFormat}eh{#PreviousFormat}?" },
			},
			-- Shorter Dialogs
			HephaestusMiscPickup21 =
			{
				Name = "HephaestusMiscPickup21",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0022",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hard work always pays off. Well, that and the fact that you have a millenia to reap the fruits of your labor. " },
			},
			HephaestusMiscPickup22 =
			{
				Name = "HephaestusMiscPickup22",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0023",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You cannot dream yourself into a character; you must solder the mold and strike yourself into shape. Preferably with a very big hammer." },
			},
			HephaestusMiscPickup23 =
			{
				Name = "HephaestusMiscPickup23",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0024",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "There's nothing that can't be fixed with a big hammer, {#DialogueItalicFormat}eh{#PreviousFormat}?" },
			},
			HephaestusMiscPickup24 =
			{
				Name = "HephaestusMiscPickup24",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0025",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I’ve learned the hard way—nothing worth having comes without effort, and that’s true whether you’re forging weapons, building something new, or escaping from the depths of your father's domain." },
			},
			HephaestusMiscPickup25 =
			{
				Name = "HephaestusMiscPickup25",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0026",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "There are no secrets to success, Zagreus. It's just like Pandora once told me: {#DialogueItalicFormat}All you need is hard work and determination{#PreviousFormat}." },
			},
			HephaestusMiscPickup26 =
			{
				Name = "HephaestusMiscPickup26",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0027",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Repeat after me Zagreus. {#DialogueItalicFormat}No matter how hard it is, or how hard it gets, I'm going to make it{#PreviousFormat}." },
			},
			HephaestusMiscPickup27 =
			{
				Name = "HephaestusMiscPickup27",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0028",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "There is no magic to achievement, mate. It's really about effort and persistence." },
			},
			HephaestusMiscPickup28 =
			{
				Name = "HephaestusMiscPickup28",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredLootChoices = 3,
				RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0029",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hard work beats talent, because those who have talent believes they don't need hard work. You, Zagreus, seem to be the exception." },
			},
			HephaestusMiscPickup29 =
			{
				Name = "HephaestusMiscPickup29",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0030",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Perseverance is failing countless times only to succeed once." },
			},
			HephaestusMiscPickup30 =
			{
				Name = "HephaestusMiscPickup30",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0031",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Never stop climbing. And should you fall—climb higher next time." },
			},
			HephaestusMiscPickup31 =
			{
				Name = "HephaestusMiscPickup31",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0032",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Movement is essential to succeed. Inaction leads to failure." },
			},
			HephaestusMiscPickup32 =
			{
				Name = "HephaestusMiscPickup32",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0033",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Success is the sum of continuous small efforts. You are getting somewhere. Eventually, it will lead to us finally meeting." },
			},
			HephaestusMiscPickup33 =
			{
				Name = "HephaestusMiscPickup33",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0034",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "When they bring you down, that's when you get up. Nobody can stop you from what you put your mind to achieve." },
			},
			HephaestusMiscPickup34 =
			{
				Name = "HephaestusMiscPickup34",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0035",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Sometimes you think you won't succeed, but the distance to the surface is always closer than you think." },
			},
			HephaestusMiscPickup35 =
			{
				Name = "HephaestusMiscPickup35",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0036",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "... {#DialogueItalicFormat}hm{#PreviousFormat}. That {#DialogueItalicFormat}should{#PreviousFormat} increase efficiency by 0,3%, which should make this function kick in—and there we go, fresh out the mold just for you, Zagreus." },
			},
			HephaestusMiscPickup36 =
			{
				Name = "HephaestusMiscPickup36",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0037",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Oi{#PreviousFormat}, it's getting hot in here. {#DialogueItalicFormat}Hahh{#PreviousFormat}—you're going to like this one." },
			},
			HephaestusMiscPickup37 =
			{
				Name = "HephaestusMiscPickup37",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0038",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "While the forge is hot—what's your order?" },
			},
			HephaestusMiscPickup38 =
			{
				Name = "HephaestusMiscPickup38",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0039",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Order up! I'll make it worth your while." },
			},
			HephaestusMiscPickup39 =
			{
				Name = "HephaestusMiscPickup39",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0040",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Next customer please, I don't have all day." },
			},
		},

		BoughtTextLines =
		{
			HephaestusLootBought01 =
			{
				Name = "HephaestusLootBought01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0134",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Is that Charon with you? What a great customer. He keeps matters professional. No small talk." },
			},
			HephaestusLootBought02 =
			{
				Name = "HephaestusLootBought02",
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredAnyTextLines = { "HephaestusLootBought01" },
				{ Cue = "/VO/Hephaestus_0135",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Buying from the Boatman, are you? I reckon it's a way to acquire my blessings. As long as I get my due." },
			},
			HephaestusLootBought03 =
			{
				Name = "HephaestusLootBought03",
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusLootBought02" },
				{ Cue = "/VO/Hephaestus_0136",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I smithed that quite a while ago. I think Charon got the better end of the deal there." },
			},
			HephaestusLootBought04 =
			{
				Name = "HephaestusLootBought04",
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusLootBought02" },
				{ Cue = "/VO/Hephaestus_0137",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "As I'm sure you know, the Boatman keeps a cut. This one's actually worth half of what you gave. Maybe skip the middleman next time, mate." },
			},
			HephaestusLootBought05 =
			{
				Name = "HephaestusLootBought05",
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusLootBought02", "HephaestusLootBought03" },
				{ Cue = "/VO/Hephaestus_0138",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "That's what you use your obols for? I'm flattered and all, but you could've haggled a {#DialogueItalicFormat}little{#PreviousFormat}." },
			},
			HephaestusLootBought06 =
			{
				Name = "HephaestusLootBought06",
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusLootBought02", "HephaestusLootBought03" },
				{ Cue = "/VO/Hephaestus_0139",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "That's what this is worth!? I sold it to Charon for {#DialogueItalicFormat}way{#PreviousFormat} less!" },
			},
			HephaestusLootBought07 =
			{
				Name = "HephaestusLootBought07",
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusLootBought06" },
				{ Cue = "/VO/Hephaestus_0140",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Ohh{#PreviousFormat} I guess even Charon's got to earn a profit somehow, but between you and me: I think you got played for a sucker, Zagreus." },
			},
			HephaestusLootBought08 =
			{
				Name = "HephaestusLootBought08",
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusLootBought07" },
				{ Cue = "/VO/Hephaestus_0141",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "My blessing are worth the same as Hermes according to Charon!? {#DialogueItalicFormat}Bah{#PreviousFormat}! Quality work can't be rushed." },
			},

		},

		GiftTextLineSets =
		{
			-- gives gift in exchange
			HephaestusGift01 =
			{
				Name = "HephaestusGift01",
				PlayOnce = true,
				{ Cue = "/VO/ZagreusField_5002", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "Lord Hephaestus, please accept this gift as thanks for all your help. Please take this gift for all your hard work." },
				{ Cue = "/VO/Hephaestus_0142",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "How kind of you, mate. Well, I can't leave you empty handed after receiving this, can I? Let me grab some scrap metal from my workshop... and... here you go! Does it remind you of someone?" },
			},
			HephaestusGift02 =
			{
				Name = "HephaestusGift02",
				PlayOnce = true,
				RequiredAnyTextLines = { "HephaestusGift01"},
				{ Cue = "/VO/ZagreusField_5003", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "I found this nectar and thought you could use a break from your work at the forge. A reward for good work done." },
				{ Cue = "/VO/Hephaestus_0143",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Ha{#PreviousFormat}—the reward for good work done is more work. Orders for my handiwork is a list longer than your father's ledger of the dead—but who am I to turn down this token of appreciation?" },
			},
			HephaestusGift03 =
			{
				Name = "HephaestusGift03",
				PlayOnce = true,
				RequiredAnyTextLines = { "HephaestusGift02" },
				{ Cue = "/VO/ZagreusField_5004", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "I know you never take a break, Lord Hephaestus. But if you do, I am sure you would appreciate this." },
				{ Cue = "/VO/Hephaestus_0144",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "No, yes... I mean, sure... {#DialogueItalicFormat}Uh{#PreviousFormat}, {#DialogueItalicFormat}hm{#PreviousFormat}? What were you saying? I was distracted by something. {#DialogueItalicFormat}Ah{#PreviousFormat}, nectar. Cheers, mate. I'll keep it stored with the rest." },
			},
			HephaestusGift04 =
			{
				Name = "HephaestusGift04",
				PlayOnce = true,
				RequiredAnyTextLines = { "HephaestusGift03" },
				{ Cue = "/VO/ZagreusField_5005", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "Lord Hephaestus, have you not... drank any of the nectar I've gifted? Surely you would like to at least have a taste?" },
				{ Cue = "/VO/Hephaestus_0145",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I... Fine. I'll drink them all right now. Be done with it. {#DialogueItalicFormat}Glup{#PreviousFormat}. There, happy? Oh, that was proper good. {#DialogueItalicFormat}Glup{#PreviousFormat}." },
			},
			HephaestusGift05 =
			{
				Name = "HephaestusGift05",
				PlayOnce = true,
				RequiredAnyTextLines = { "HephaestusGift04" },
				{ Cue = "/VO/ZagreusField_5006", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "Since you seemed to have like the last one, I thought you could use some more." },
				{ Cue = "/VO/Hephaestus_0146",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Oh{#PreviousFormat}, more? I haven't been this productive since... can't remember. {#DialogueItalicFormat}Glup{#PreviousFormat}. This goes here—so this goes there..." },
			},
			HephaestusGift06 =
			{
				Name = "HephaestusGift06",
				PlayOnce = true,
				RequiredAnyTextLines = { "HephaestusGift05" },
				{ Cue = "/VO/ZagreusField_5007", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "You seemed so pleased by your improved productivity, Lord Hepheastus. I thought I could bring you some more." },
				{ Cue = "/VO/Hephaestus_0147",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Ohh{#PreviousFormat}... well, I'll have this one... {#DialogueItalicFormat}Glup{#PreviousFormat} but... ehh. I shouldn't have any more, mate. Sorry, got to go now." },
			},
			HephaestusGift07 =
			{
				Name = "HephaestusGift07",
				PlayOnce = true,
				RequiredAnyTextLines = { "HephaestusGift06" },
				{ Cue = "/VO/ZagreusField_5008", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "I didn't think you could get to much Nectar, Lord Hephaestus. I brought this instead." },
				{ Cue = "/VO/Hephaestus_0148",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Ambrosia? I suppose that might be better. Let's try it out. {#DialogueItalicFormat}Glup{#PreviousFormat} Oh! That hit the spot. Great choice, mate!" },
			},
			HephaestusGift08 =
			{
				Name = "HephaestusGift08",
				PlayOnce = true,
				RequiredAnyTextLines = { "HephaestusGift07" },
				{ Cue = "/VO/ZagreusField_5009", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "Since Nectar doesn't work for you, here's Ambrosia like last time, Lord Hephaestus. I hope this makes you feel better." },
				{ Cue = "/VO/Hephaestus_0149",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					PostLineThreadedFunctionName = "MaxedRelationshipPresentation",
					PostLineFunctionArgs = { Text = "NPC_Hephaestus_01", Icon = "Keepsake_HephaestusSticker_Max" },
					Text = "{#DialogueItalicFormat}Again{#PreviousFormat}? {#DialogueItalicFormat}Ohh{#PreviousFormat}, alright, you want me to say it? Fine—I'll say it. You're my favorite customer. Now get out of here before I start building you a golden throne. " },
			},
		},

		GiftGivenVoiceLines =
		{
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			PlayFromTarget = true,

			-- But, wait... That's me!
			{ Cue = "/VO/ZagreusField_5010" },
		},

		ShoutActivationSound = "/SFX/AthenaWrathHolyShield",
		ShoutVoiceLines =
		{
			{
				BreakIfPlayed = true,
				PlayFromTarget = true,
				RandomRemaining = true,
				RequiredKillEnemiesFound = true,
				RequiredFalseSpurnedGodName = "HephaestusUpgrade",

				-- The fury of Olympus!
				-- { Cue = "/VO/Athena_0065" },
			},
			{
				BreakIfPlayed = true,
				PlayFromTarget = true,
				RandomRemaining = true,
				RequiredKillEnemiesFound = true,
				RequiredSpurnedGodName = "HephaestusUpgrade",
				RequireCurrentEncounterNotComplete = true,

				-- I strongly disapprove.
				-- { Cue = "/VO/Athena_0103" },
			},
		},
	}

	-- Gift Section
	local OlympusGiftOrdering = ModUtil.Entangled.ModData(GiftOrdering)
	local OlympusGiftData = ModUtil.Entangled.ModData(GiftData)
	table.insert(OlympusGiftOrdering, 23, "ForceWeaponUpgradeTrait")

	OlympusGiftData.HephaestusUpgrade =
	{
		InheritFrom = { "DefaultGiftData" },
		MaxedIcon = "Keepsake_Hephaestus_Max",
		MaxedSticker = "Keepsake_HephaestusSticker_Max",
		MaxedRequirement = { RequiredTextLines = { "HephaestusGift07" }, },
		Value = 0,
		Maximum = 7,
		Locked = 7,
		[1] = { Gift = "ForceWeaponUpgradeTrait" },
		[7] = { RequiredResource = "SuperGiftPoints" },
		UnlockGameStateRequirements = { RequiredTextLines = { "HephaestusBackstory04" } }
	}
	-- Multi Gods compatibility
	if ApolloExtra ~= nil then
		-- Demeter
		OlympusTraitData.MissChanceTrait.RequiredFalseTrait = nil
		OlympusTraitData.MissChanceTrait.RequiredFalseTraits = {"MissChanceTrait", "HephaestusImproveApollo"}
		OlympusTraitData.HephaestusImproveApollo =
		{
			Name = "HephaestusImproveApollo",
			Icon = "Boon_Apollo_14",
			RequiredFalseTrait = "HephaestusImproveApollo",
			ReplaceTrait = "MissChanceTrait",
			IsImproveBoon = true,
			God = "Apollo",
			InheritFrom = { "ShopTier3Trait" },
			PropertyChanges =
			{
				{
					WeaponName = WeaponSets.HeroPhysicalWeapons,
					EffectName = "ApolloBlind",
					EffectProperty = "Amount",
					ChangeValue = 0.70,
					ChangeType = "Absolute",
				},
				{
					WeaponName = WeaponSets.HeroSecondaryWeapons,
					EffectName = "ApolloBlind",
					EffectProperty = "Amount",
					ChangeValue = 0.70,
					ChangeType = "Absolute",
				},
				{
					WeaponName = WeaponSets.HeroRushWeapons,
					EffectName = "ApolloBlind",
					EffectProperty = "Amount",
					ChangeValue = 0.70,
					ChangeType = "Absolute",
				},
				{
					WeaponName = WeaponSets.HeroNonPhysicalWeapons,
					EffectName = "ApolloBlind",
					EffectProperty = "Amount",
					ChangeValue = 0.70,
					ChangeType = "Absolute",
				},
				{
					WeaponNames = { "AreaWeakenApollo" },
					EffectName = "ApolloBlind",
					EffectProperty = "Amount",
					ChangeValue = 0.70,
					ChangeType = "Absolute",
				},
			},
			ExtractValues =
			{
				{
					ExtractAs = "TooltipBlindDuration",
					SkipAutoExtract = true,
					External = true,
					BaseType = "Effect",
					WeaponName = "SwordWeapon",
					BaseName = "ApolloBlind",
					BaseProperty = "Duration",
				},
				{
					ExtractAs = "TooltipBlindPower",
					SkipAutoExtract = true,
					External = true,
					BaseType = "Effect",
					WeaponName = "SwordWeapon",
					BaseName = "ApolloBlind",
					BaseProperty = "Amount",
					Format = "Percent"
				}
			}
		}
		OlympusLootData.HephaestusUpgrade.LinkedUpgrades.HephaestusImproveApollo =
		{
			OneFromEachSet =
			{
				{ "MissChanceTrait" },
				{ "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRangedTrait", "HephaestusShoutSummon",  "DropMoneyTrait", "SpawnWeaponsTrait", "RevengeBoostTrait", "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait", "ForceWeaponUpgradeTrait" },
			}
		}
		OlympusLootData.HephaestusUpgrade.ImprovePickupTextLineSets.HephaestusImproveApollo01 = {
            Name = "HephaestusImproveApollo01",
            PlayOnce = true,
            PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
            HasTraitNameInRoom = "HephaestusImproveApollo",
            { Cue = "/VO/Hephaestus_0150",
                StartSound = "/Leftovers/World Sounds/MapZoomInShort",
                Text = "{#DialogueItalicFormat}Oh{#PreviousFormat}, shiny. Apollo sure knows how to bless someone. But let me turn up the brightness—let's see if we can Blind the Sun God." },
        }
	end
	if HestiaExtra then
		-- Demeter
		OlympusTraitData.LavaAutoTrait.RequiredFalseTrait = nil
		OlympusTraitData.LavaAutoTrait.RequiredFalseTraits = {"LavaAutoTrait", "HephaestusImproveHestia"}
		OlympusTraitData.HephaestusImproveHestia =
		{
			Name = "HephaestusImproveHestia",
			InheritFrom = { "ShopTier3Trait" },
			ReplaceTrait = "LavaAutoTrait",
			IsImproveBoon = true,
			RequiredFalseTrait = "HephaestusImproveHestia",
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
					ChangeValue = 600,
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
					ChangeValue = 600,
					ChangeType = "Add",
				},
			},
		}
		OlympusLootData.HephaestusUpgrade.LinkedUpgrades.HephaestusImproveHestia =
		{
			OneFromEachSet =
			{
				{ "LavaAutoTrait" },
				{ "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRangedTrait", "HephaestusShoutSummon",  "DropMoneyTrait", "SpawnWeaponsTrait", "RevengeBoostTrait", "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait", "ForceWeaponUpgradeTrait" },
			}
		}
		OlympusLootData.HephaestusUpgrade.ImprovePickupTextLineSets.HephaestusImproveHestia01 = {
            Name = "HephaestusImproveHestia01",
            PlayOnce = true,
            PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
            HasTraitNameInRoom = "HephaestusImproveHestia",
            { Cue = "/VO/Hephaestus_0151",
                StartSound = "/Leftovers/World Sounds/MapZoomInShort",
                Text = "How strange. Hestia swung by? {#DialogueItalicFormat}Eh{#PreviousFormat}, an order is an order. I know how to deal with the heat. Check this out." },
        }
	end
	if HeraExtra ~= nil then
		-- Demeter
		OlympusTraitData.StatusOverTimeTrait.RequiredFalseTrait = nil
		OlympusTraitData.StatusOverTimeTrait.RequiredFalseTraits = {"StatusOverTimeTrait", "HephaestusImproveHera"}
		OlympusTraitData.HephaestusImproveHera =
		{
			Name = "HephaestusImproveHera",
			InheritFrom = { "ShopTier3Trait" },
			ReplaceTrait = "StatusOverTimeTrait",
			IsImproveBoon = true,
			RequiredFalseTrait = "HephaestusImproveHera",
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
					BaseValue = 0.8,
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
					ChangeValue = 30,
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
		OlympusLootData.HephaestusUpgrade.LinkedUpgrades.HephaestusImproveHera =
		{
			OneFromEachSet =
			{
				{ "StatusOverTimeTrait" },
				{ "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRangedTrait", "HephaestusShoutSummon",  "DropMoneyTrait", "SpawnWeaponsTrait", "RevengeBoostTrait", "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait", "ForceWeaponUpgradeTrait" },
			}
		}
		OlympusLootData.HephaestusUpgrade.ImprovePickupTextLineSets.HephaestusImproveHera01 = {
            Name = "HephaestusImproveHera01",
            PlayOnce = true,
            PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
            HasTraitNameInRoom = "HephaestusImproveHera",
            { Cue = "/VO/Hephaestus_0152",
                StartSound = "/Leftovers/World Sounds/MapZoomInShort",
                Text = "{#DialogueItalicFormat}Ooh{#PreviousFormat}, you convinced Mum to give you something? That's worth more than getting out of the underworld. She wouldn't want me messing with the blessing, but {#DialogueItalicFormat}eh{#PreviousFormat}, what do I care?" },
        }
	end
	-- FUNCTIONS

ModUtil.Path.Wrap( "DoEnemyHealthBufferDeplete", 
	function(baseFunc, enemy)
		if enemy.DroppedAlready == nil and enemy.MoneyDropOnDeath ~= nil and enemy.MoneyDropOnDeath.Chance > 0 then
			local moneyDropOnDeath = DeepCopyTable( enemy.MoneyDropOnDeath )
			local extraChance = GetTotalHeroTraitValue("DropMoneyArmor")
			if moneyDropOnDeath.Chance ~= nil then
				moneyDropOnDeath.Chance = moneyDropOnDeath.Chance + extraChance
			end
			--moneyDropOnDeath.Chance = 1.0 -- test armor drop
			CheckMoneyDrop( CurrentRun, CurrentRun.CurrentRoom, enemy, moneyDropOnDeath )
			enemy.DroppedAlready = true
		end
		baseFunc(enemy)
	end
)
function SetupArmor(hero, args)
	if CurrentRun.Hero.Armor == nil then
		CurrentRun.Hero.Armor = {
			Amount = 0,
			Max = 0,
			Sources = {},
		}
	end
	if args.ArmorAtSetup ~= nil and not Contains( CurrentRun.Hero.Armor.Sources, args.Source ) then
		AddMaxArmor(args.ArmorAtSetup)
		table.insert(CurrentRun.Hero.Armor.Sources, args.Source)
		ShowArmorUI()
		if args.SpawnWeaponUpgrade ~= nil and args.SpawnWeaponUpgrade then
			CreateWeaponLoot({ SpawnPoint = CurrentRun.Hero.ObjectId, OffsetX = 0, OffsetY = 0, SuppressSpawnSounds = CurrentRun.CurrentRoom.SuppressRewardSpawnSounds })
			-- Count as a Drop
			if CurrentRun.LootTypeHistory.WeaponUpgrade == nil then
                CurrentRun.LootTypeHistory.WeaponUpgrade = 0
            end
            CurrentRun.LootTypeHistory.WeaponUpgrade = CurrentRun.LootTypeHistory.WeaponUpgrade + 1
		end
	end
end

function AddMaxArmor(num)
	CurrentRun.Hero.Armor.Max = CurrentRun.Hero.Armor.Max + num
	RepairArmor(num)
	thread(ArmorUpPresentation)
end
function RepairArmor(amount)
	if CurrentRun.Hero.Armor ~= nil and CurrentRun.Hero.Armor.Max > 0 and CurrentRun.Hero.Armor.Amount < CurrentRun.Hero.Armor.Max then
		local newAmount = CurrentRun.Hero.Armor.Amount + amount
		if newAmount > CurrentRun.Hero.Armor.Max then
			newAmount = CurrentRun.Hero.Armor.Max
		end
		CurrentRun.Hero.Armor.Amount = newAmount
		thread( UpdateHealthUI )
	end
end

ModUtil.Path.Wrap( "SacrificeHealth", 
	function (baseFunc, args )
		if CurrentRun.Hero.Armor ~= nil and CurrentRun.Hero.Armor.Amount > 0 then
			if args.SacrificeHealth == nil and ( args.SacrificeHealthMin == nil or args.SacrificeHealthMax == nil )then
				return 0
			end
			local randomDamageValue = args.SacrificeHealth
			if randomDamageValue == nil then
				randomDamageValue = RandomInt( args.SacrificeHealthMin, args.SacrificeHealthMax )
			end
			if randomDamageValue <= 0 then
				return randomDamageValue
			end
			Damage( CurrentRun.Hero, { triggeredById = CurrentRun.Hero.ObjectId, DamageAmount = randomDamageValue, MinHealth = args.MinHealth, PureDamage = true, Silent = args.Silent, SkipArmor = true } )
			if not args.Silent then
				CreateAnimation({ Name = "SacrificeHealthFx", DestinationId = CurrentRun.Hero.ObjectId })
			end
			return randomDamageValue
		else
			baseFunc(args)
		end
	end
)
function AddHephBoost(args)
	ApplyEffectFromWeapon({ WeaponName = args.WeaponName, EffectName = args.WeaponName, Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
end
function ArmorDepletedPresentation()
	thread( InCombatText, CurrentRun.Hero.ObjectId, "ArmorDepletedText", 0.6, {SkipShadow = true} )
	wait(0.1)
    PlaySound({ Name = "/SFX/Player Sounds/DashCrack" })
    PlaySound({ Name = "/SFX/WrathOver" })
	CreateAnimation({ Name = "ArmorBreak", DestinationId = CurrentRun.Hero.ObjectId })
end
ModUtil.Path.Wrap( "ShowHealthUI", 
	function(baseFunc)
		if not ConfigOptionCache.ShowUIAnimations then
			return
		end
		baseFunc()
		ShowArmorUI()
	end
)
function ShowArmorUI()
		local unit = CurrentRun.Hero
		if unit == nil or unit.Armor == nil then
			return
		end
		local currentArmor = unit.Armor.Amount
		local maxArmor = unit.Armor.Max
		if currentArmor == nil or maxArmor == nil then
			return
		end
		if ScreenAnchors.ArmorBack ~= nil then
			return
		end

		if ScreenAnchors.Shadow == nil then
			ScreenAnchors.Shadow = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Combat_UI_Backing", X = 0, Y = ScreenHeight })
			SetAnimation({ Name = "BarShadow", DestinationId = ScreenAnchors.Shadow })
		end

		ScreenAnchors.ArmorBack = CreateScreenObstacle({Name = "BlankObstacle", Group = "Combat_UI", X = 10 - CombatUI.FadeDistance.Health, Y = ScreenHeight - 50})
		ScreenAnchors.ArmorFill = CreateScreenObstacle({Name = "BlankObstacle", Group = "Combat_UI", X = 10 - CombatUI.FadeDistance.Health, Y = ScreenHeight - 50})
		ScreenAnchors.ArmorFlash =  CreateScreenObstacle({Name = "BlankObstacle", Group = "Combat_UI", X = 10 - CombatUI.FadeDistance.Health, Y = ScreenHeight - 50})

		CreateTextBox(MergeTables({ Id = ScreenAnchors.ArmorBack, OffsetX = 392, OffsetY = -38,
				Font = "AlegreyaSansSCBold", FontSize = 24, ShadowRed = 0.1, ShadowBlue = 0.1, ShadowGreen = 0.1,
				OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 1,
				ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left",
				}, LocalizationData.UIScripts.HealthUI ))

		--SetAnimation({ Name = "HealthBar", DestinationId = ScreenAnchors.ArmorBack })

		local frameTarget = 1-(currentArmor / maxArmor)
		SetAnimation({ Name = "HealthBarFill", DestinationId = ScreenAnchors.ArmorFill, FrameTarget = frameTarget, Instant = true, Color = Color.Yellow })

		thread(UpdateHealthUI)

		FadeObstacleIn({ Id = ScreenAnchors.ArmorBack, Duration = CombatUI.FadeInDuration, IncludeText = true, Distance = CombatUI.FadeDistance.Health, Direction = 0 })
		FadeObstacleIn({ Id = ScreenAnchors.ArmorFill, Duration = CombatUI.FadeInDuration, IncludeText = false, Distance = CombatUI.FadeDistance.Health, Direction = 0 })
		FadeObstacleIn({ Id = ScreenAnchors.ArmorFlash, Duration = CombatUI.FadeInDuration, IncludeText = false, Distance = CombatUI.FadeDistance.Health, Direction = 0 })
end
ModUtil.Path.Wrap( "UpdateHealthUI", 
	function(baseFunc, damageEventArgs)
		baseFunc(damageEventArgs)
		local unit = CurrentRun.Hero
		if unit == nil or unit.Armor == nil then
			return
		end

		local currentArmor = unit.Armor.Amount
		local maxArmor = unit.Armor.Max
		if currentArmor ~= nil and currentArmor >= 0 and maxArmor ~= nil then
			if ScreenAnchors.ArmorBack ~= nil then
				ModifyTextBox({ Id = ScreenAnchors.ArmorBack, Text = "UI_PlayerArmor", LuaKey = "TempTextData", LuaValue = { Current = math.ceil(currentArmor), Maximum = math.ceil(maxArmor) }, AutoSetDataProperties = false })
			end

			if ScreenAnchors.ArmorFill ~= nil then
				SetAnimationFrameTarget({ Name = "HealthBarFill", Fraction = 1-(currentArmor / maxArmor), DestinationId = ScreenAnchors.ArmorFill })
			end
		end
	end
)
ModUtil.Path.Wrap( "HideHealthUI", 
	function(baseFunc)
		if ScreenAnchors.ArmorBack == nil then
			return
		end
		local ArmorIds = { "ArmorBack", "ArmorFill", "ArmorFlash" }
		local armorAnchorIds = {}
		for i, id in pairs( ArmorIds ) do
			table.insert(armorAnchorIds, ScreenAnchors[id])
		end

		ScreenAnchors.ArmorBack = nil
		ScreenAnchors.ArmorFill = nil
		ScreenAnchors.ArmorFlash = nil

		HideObstacle({ Ids = armorAnchorIds, IncludeText = true, FadeTarget = 0, Duration = CombatUI.FadeDuration, Angle = 180, Distance = CombatUI.FadeDistance.Health })
		baseFunc()
		--wait( CombatUI.FadeDuration, RoomThreadName )
		Destroy({ Ids = armorAnchorIds })
	end
)
ModUtil.Path.Wrap( "DestroyHealthUI", 
	function(baseFunc)
		baseFunc()
		local ids = { ScreenAnchors.ArmorBack, ScreenAnchors.ArmorFill, ScreenAnchors.ArmorFlash }
		if not IsEmpty( ids ) then
			Destroy({ Ids = ids })
		end
		ScreenAnchors.ArmorBack = nil
		ScreenAnchors.ArmorFill = nil
		ScreenAnchors.ArmorFlash = nil
	end
)
ModUtil.Path.Wrap("StartEncounter",
		function(baseFunc, currentRun, currentRoom, currentEncounter)
			if HeroHasTrait("ArmorBossTrait") then
				if ((currentRun.CurrentRoom.Encounter.EncounterType == "Boss" or
					currentRun.CurrentRoom.Encounter.EncounterType == "OptionalBoss") and
					currentRun.CurrentRoom.Encounter.CurrentWaveNum == nil) or
					currentRun.CurrentRoom.IsMiniBossRoom then		
						local armorAmount = GetTotalHeroTraitValue("RepairArmorOnBoss", { IsMultiplier = false })			
						RepairArmor(armorAmount)
						thread(RepairArmorPresentation)
				end
			end
			baseFunc(currentRun, currentRoom, currentEncounter)
		end
	)
	function RepairArmorPresentation()
		wait(0.2)
		CreateAnimation({ Name = "HephRepair", DestinationId = CurrentRun.Hero.ObjectId })
		--thread( InCombatTextArgs, { Text = "RepairText", TargetId = CurrentRun.Hero.ObjectId, Duration = 0.85, PreDelay = 0.21, FontScale = 20, SkipShadow = true } ) --SkipRise = true, OffsetY = -160, 
	end
	function ArmorUpPresentation()
		wait(0.5)
		CreateAnimation({ Name = "HephArmorUp", DestinationId = CurrentRun.Hero.ObjectId })		
		--thread( InCombatTextArgs, { Text = "ArmorUpText", TargetId = CurrentRun.Hero.ObjectId, Duration = 0.85, PreDelay = 0.21, FontScale = 20, SkipShadow = true } ) --SkipRise = true, OffsetY = -160, SkipShadow = true
	end
ModUtil.Path.Wrap( "ReloadAmmoPresentation", 
	function(baseFunc)
		baseFunc()
		if HeroHasTrait("HephaestusRangedTrait") then
			FireWeaponFromUnit({
				Weapon = "IgneousRangedExplosion",
				Id = CurrentRun.Hero.ObjectId,
				DestinationId = CurrentRun.Hero.ObjectId,
				ClearAllFireRequests = true,
				FireFromTarget = true
			})
		end
	end
)
ModUtil.Path.Wrap( "AddAmmoPresentation", 
	function(baseFunc)
		baseFunc()
		if HeroHasTrait("HephaestusRangedTrait") then
			FireWeaponFromUnit({
				Weapon = "IgneousRangedExplosion",
				Id = CurrentRun.Hero.ObjectId,
				DestinationId = CurrentRun.Hero.ObjectId,
				ClearAllFireRequests = true,
				FireFromTarget = true
			})
		end
	end
)
ModUtil.Path.Wrap( "FireShoutEffects", 
	function(baseFunc, superName)
		baseFunc(superName)
		if HeroHasTrait("HephaestusShoutSummon")then
			local isSuper = CurrentRun.Hero.SuperMeter == CurrentRun.Hero.SuperMeterLimit
			thread( HephaestusShout, isSuper )
		end	
	end
)
function HephaestusShout(isSuper)
	SpawnExplosiveChariot({Name = "HephaestusChariotSuicide", Duration = 10.0})
	if isSuper then
		SpawnExplosiveChariot({Name = "HephaestusChariotSuicide", Duration = 10.0, OffsetX = 15, OffsetY = 10})
		SpawnExplosiveChariot({Name = "HephaestusChariotSuicide", Duration = 10.0, OffsetX = 15, OffsetY = -10})
		SpawnExplosiveChariot({Name = "HephaestusChariotSuicide", Duration = 10.0, OffsetY = -15,})
		SpawnExplosiveChariot({Name = "HephaestusChariotSuicide", Duration = 10.0, OffsetX = -15, OffsetY = 10})
		SpawnExplosiveChariot({Name = "HephaestusChariotSuicide", Duration = 10.0, OffsetX = -15, OffsetY = -10})		
	end
end
function HephHitSelfDestruct( victim, victimId, triggerArgs )
	if victim ~= nil and victim.DamageType == "Enemy" then
		thread( Kill, triggerArgs.AttackerTable )
	end
end
function SpawnExplosiveChariot( args )
	local enemyName = args.Name or "ChariotSuicide"	
	local newEnemy = DeepCopyTable( EnemyData[enemyName] )
	newEnemy.BlocksLootInteraction = false

	local invaderSpawnPoint = CurrentRun.Hero.ObjectId
	newEnemy.ObjectId = SpawnUnit({
			Name = newEnemy.Name,
			Group = "Standing",
			DestinationId = invaderSpawnPoint, OffsetX = args.OffsetX or 0, OffsetY = args.OffsetY or 15,
			DoActivatePresentation = false })

	SetupEnemyObject( newEnemy, CurrentRun )
	local damage = GetTotalHeroTraitValue("SummonExplosionDamage")
	ApplyWeaponPropertyChanges( newEnemy, "HephChariotRamDeathWeapon", {
		{
			ProjectileProperty = "DamageLow",
			ChangeValue = damage,
			ChangeType = "Absolute",
		},
		{
			ProjectileProperty = "DamageHigh",
			ChangeValue = damage,
			ChangeType = "Absolute",
		},
	})
	thread(EndExplosiveChariot, newEnemy, args )
end

function EndExplosiveChariot( enemy, args )
	wait( args.Duration, RoomThreadName )
	--thread( PlayVoiceLines, enemy.AssistEndedVoiceLines )
	--ExpireProjectiles({ Name = "DusaFreezeShotNonHoming" })
	Kill( enemy )
end
-- IgneousArmor
function SetupIgneousArmor( hero, args )
	args = args or {}
	if hero.IgneousArmor == nil then
		hero.IgneousArmor = {
			Charging = false,
			InCooldown = false,
			Damage = 0,
			Cooldown = args.Cooldown,
			Duration = args.Duration,
			DamageTransfer = args.DamageTransfer
		}
	else
		hero.IgneousArmor.Charging = false;
		hero.IgneousArmor.InCooldown = false;
		if hero.IgneousArmor.DamageTransfer ~= args.DamageTransfer then
			hero.IgneousArmor.DamageTransfer = args.DamageTransfer
		end
	end
end
function PresentationIgneousArmor( igneousArmor )
	if igneousArmor.Ready then
		thread( DisplayPlayerDamageText, { triggeredById = CurrentRun.Hero.ObjectId, UseCustomText = "BiomeTimerDamage", PercentMaxDealt = igneousArmor.Damage/CurrentRun.Hero.MaxHealth, DamageAmount = igneousArmor.Damage } )
		--CreateAnimation({ Name = "ThanatosDeathsHead_Small", DestinationId = CurrentRun.Hero.ObjectId, Group = "FX_Standing_Top" })
		PlaySound({ Name = "/SFX/HeartPulsate1" })
		PlaySound({ Name = "/SFX/HeartPulsate2", Delay = 0.35 })
	end
end
function DamageIgneousArmor( weaponData, args)
	args = args or {} -- HephHammerUp, HephHammerTrailDown, HephHammerDown, HephHammerLand, HephHammerExplosion
	-- HephHammerExplosionSpawner, HephHammerExplosionNova
	if CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead and IsCombatEncounterActive( CurrentRun ) then
		local igneousArmor = CurrentRun.Hero.IgneousArmor
		if igneousArmor ~= nil and not igneousArmor.InCooldown and not igneousArmor.Charging then
			igneousArmor.InCooldown = true
			igneousArmor.Charging = true
			thread(StartArmorIgneous, igneousArmor)
		end
	end
end
function StartArmorIgneous(igneousArmor)
	if CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead and IsCombatEncounterActive( CurrentRun ) then
		CreateAnimation({ Name = "Shielded", DestinationId = CurrentRun.Hero.ObjectId, Group = "FX_Standing_Top" })
	end
	wait(igneousArmor.Duration-1.4)
	if CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead and IsCombatEncounterActive( CurrentRun ) then
		CreateAnimation({ Name = "QuickFlash", DestinationId = CurrentRun.Hero.ObjectId, Group = "FX_Standing_Top" })
		PlaySound({ Name = "/SFX/WrathEndingWarning" })
	end
	wait(0.7)
	if CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead and IsCombatEncounterActive( CurrentRun ) then
		CreateAnimation({ Name = "QuickFlash", DestinationId = CurrentRun.Hero.ObjectId, Group = "FX_Standing_Top" })
		PlaySound({ Name = "/SFX/WrathEndingWarning" })
	end
	wait(0.7) 
	StopAnimation({ Name = "Shielded", DestinationId = CurrentRun.Hero.ObjectId })
	igneousArmor.Charging = false
	if CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead and IsCombatEncounterActive( CurrentRun ) then
		local targetId = SpawnObstacle({ Name = "InvisibleTarget", DestinationId = CurrentRun.Hero.ObjectId })
		ApplyWeaponPropertyChanges( CurrentRun.Hero, "IgneousArmorExplosion", {
			{
				ProjectileProperty = "DamageLow",
				ChangeValue = igneousArmor.Damage,
				ChangeType = "Absolute",
			},
			{
				ProjectileProperty = "DamageHigh",
				ChangeValue = igneousArmor.Damage,
				ChangeType = "Absolute",
			},
		})
		FireWeaponFromUnit({
			Weapon = "IgneousArmorExplosion",
			Id = CurrentRun.Hero.ObjectId,
			DestinationId = CurrentRun.Hero.ObjectId,
			ClearAllFireRequests = true,
			FireFromTarget = true
		})
		igneousArmor.Damage = 0
	end
	wait(igneousArmor.Cooldown)
	igneousArmor.InCooldown = false
	if CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead and IsCombatEncounterActive( CurrentRun ) then
		thread( PlayVoiceLines, HeroVoiceLines.GunWeaponReloadCompleteVoiceLines, true )
		thread( InCombatText, CurrentRun.Hero.ObjectId, "IgneousArmorReady", 0.4, {SkipShadow = true} )
	end
end
--[[ModUtil.Path.Wrap( "IsHermesBoon", 
	function(baseFunc, traitName)
		if traitName ~= nil then
			local result  = baseFunc(traitName)
			for i, loot in pairs (LootData) do
				if loot.Icon == "BoonSymbolHephaestus" and loot.TraitIndex[traitName] then
					return true
				end
				return false
			end
			return false
		end
	end
	)]]
	--[[ModUtil.Path.Wrap( "CreateHermesLoot", 
		function(baseFunc, args)
			--baseFunc(args)
			return CreateHephaestusLoot(args)
		end
	)]]
	function CreateHephaestusLoot( args )
		args = args or {}
		return CreateLoot( MergeTables( args, { Name = "HephaestusUpgrade" } ) )
	end
end
