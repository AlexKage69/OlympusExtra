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
			RequiredNotInStore = "HephaestusUpgradeDrop",
			RequiredMinCompletedRuns = 3,
			RequiredMinDepth = 13,
		}
	})
	OlympusRewardStoreData.RunProgress[12].GameStateRequirements.RequiredFalseTraits = {"ForceWeaponUpgradeTrait"}
	OlympusRewardStoreData.RunProgress[12].GameStateRequirements.RequiredFalseGodLoot = "HephaestusUpgrade"
	--OlympusRewardStoreData.RunProgress[12].GameStateRequirements.RequiredMinDepth = 2
	--WeaponData
	local OlympusWeaponData = ModUtil.Entangled.ModData(WeaponData)
	OlympusWeaponData.HephChariotRamSelfDestruct =
	{
		StartingWeapon = false,
		IgnoreHealthBuffer = true,
		OnFiredFunctionName = "SelfDestruct",
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
	local OlympusGlobalVoiceLines = ModUtil.Entangled.ModData(GlobalVoiceLines)
	local OlympusHeroVoiceLines = ModUtil.Entangled.ModData(HeroVoiceLines)
	table.insert(OlympusGlobalVoiceLines.BoonUsedVoiceLines, {
		BreakIfPlayed = true,
		RandomRemaining = true,
		PreLineWait = 0.5,
		RequiredLastGodLoot = "HephaestusUpgrade",
		RequiredEncounters = { "DevotionTestTartarus", "DevotionTestAsphodel", "DevotionTestElysium", },
		RequireCurrentEncounterNotComplete = true,
		Source = { SubtitleColor = Color.HephaestusVoice },

		-- A fine performance.
		{ Cue = "/VO/Hephaestus_0162" },
		-- You can do better.
		{ Cue = "/VO/Hephaestus_0163" },
		-- Do it for your queen.
		{ Cue = "/VO/Hephaestus_0164" },
		-- Lasted longer than I expected.
		{ Cue = "/VO/Hephaestus_0165" },
		-- Barely made it, I assume.
		{ Cue = "/VO/Hephaestus_0166" },
		-- With this, you'd better not lose.
		{ Cue = "/VO/Hephaestus_0167" },
		-- There's nothing better than my blessings.
		{ Cue = "/VO/Hephaestus_0168" },
		-- You never give up, do you?
		{ Cue = "/VO/Hephaestus_0169" },
		-- That's right, bow to your queen.
		{ Cue = "/VO/Hephaestus_0170" },
		-- Likely to fail, but I am still helping you.
		{ Cue = "/VO/Hephaestus_0171" },
		-- I can be generous.
		{ Cue = "/VO/Hephaestus_0172" },
		-- The best of all Olympus.
		{ Cue = "/VO/Hephaestus_0173" },
	})
	table.insert(OlympusHeroVoiceLines.UpgradePickedVoiceLines, {
		RandomRemaining = true,
		BreakIfPlayed = true,
		SuccessiveChanceToPlay = 0.5,
		PreLineWait = 0.75,
		RequiredLastGodLoot = "HephaestusUpgrade",
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
		HealthBarOffsetY = -145,
		HealthBarType = "Small",
		SkipDamageText = true,
		AnimOffsetZ = 120,
		UnuseableWhenDead = true,
		SpeechCooldownTime = 9,
		SkipModifiers = true,
		AlwaysTraitor = true,
		AlwaysShowInvulnerabubbleOnInvulnerableHit = false,

		Groups = { "FlyingEnemies", "TrainingEnemies" },

		MeterMultiplier = 0,

		MoneyDropOnDeath =
		{
			Chance = 0,
		},

		ActiveCapWeight = 0.5,
		LargeUnitCap = 6,

		BlockSelfDamageNumbers = false, --true

		IsAggroedSound = "/SFX/Enemy Sounds/FireChariot/FireChariotAggro",
		AIAggroRange = 5000,

		DefaultAIData =
		{
			AIRequireProjectileLineOfSight = false,
			AIRequireUnitLineOfSight = false,
			SetupDistance = 800,
			SetupTimeout = 1.0,
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
				Multiplier = 1.3,
			}
		},
		EnemyPropertyChanges =
		{
			{
				WeaponName = "HephChariotRamSelfDestruct",
				ProjectileName = "HephChariotRamSelfDestruct",
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
				WeaponName = "HephChariotRamSelfDestruct",
				ProjectileName = "HephChariotRamSelfDestruct",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipWrathStocks",
				Format = "ExistingWrathStocks",
				SkipAutoExtract = true
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
			{ Cue = "/VO/ZagreusField_1925", RequiredPlayed = { "/VO/ZagreusField_1927" } },
			-- Hello, Hephaestus.
			{ Cue = "/VO/ZagreusField_1926", RequiredPlayed = { "/VO/ZagreusField_1927" } },
			-- The blacksmith.
			{ Cue = "/VO/ZagreusField_1927" },
			-- Time for an upgrade.
			{ Cue = "/VO/ZagreusField_1928", RequiredPlayed = { "/VO/ZagreusField_1927" } },
			-- Smithing time.
			{ Cue = "/VO/ZagreusField_1929", RequiredPlayed = { "/VO/ZagreusField_1927" } },
			-- There he is.
			{ Cue = "/VO/ZagreusField_1930", RequiredPlayed = { "/VO/ZagreusField_1927" } },
			-- Upgrade for me?
			{ Cue = "/VO/ZagreusField_1931", RequiredPlayed = { "/VO/ZagreusField_1927" } },
			-- He's back.
			{ Cue = "/VO/ZagreusField_1932", RequiredPlayed = { "/VO/ZagreusField_1927" } },
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
					Text = "I see you got my father's blessing. And {#DialogueItalicFormat}woah {#PreviousFormat}, is it a good one. If I may, let me  see what I can do for you. Sounds good?" },
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
					Text = "Athena's shields are always fun to tune up. She's kind of picky when it comes to quality, but eh, so am I. Let me tune this shield up for you." },
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
					Text = "I see you received Ares' blessing. Hanging with ones like Ares, are ya? I am not judging, I am a professional. Let me show you what a real weapon looks like." },
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
					Text = "Oi, you got to see Aphrodite! All she makes is perfect. I'll try to make it better if it's even possible." },
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
					Text = "Uncle Poseidon passed through! Did you know he asked me to craft a board that could ride a wave once? What an imagination!" },
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
					Text = "You talked to Artemis, {#DialogueItalicFormat}eh {#PreviousFormat}? She always goes straight to the point. No wasted chit-chat. I like that. I would be an honor to improve her blessing." },
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
					Text = "Of course, you have Dionysus' blessing. He gets muggled with anybody. To let them do the work. I mean look at what he gave you. Let me fix it." },
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
					Text = "Now. That's a challenge. Demeter's blessings always melt when I try to improve them, but I think I got this time around. Try this out." },
			},		
			HephaestusImproveMiscOlympian01 =
			{
				Name = "HephaestusImproveMiscOlympian01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasAnyTraitNamesInRoom = GameData.HephaestusImproveTraits,
				{ Cue = "/VO/Hephaestus_0052",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "Some say I work too much. Well, let me show them how my work can improve their blessing." },
			},
			HephaestusImproveMiscOlympian02 =
			{
				Name = "HephaestusImproveMiscOlympian02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasAnyTraitNamesInRoom = GameData.HephaestusImproveTraits,
				{ Cue = "/VO/Hephaestus_0053",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "I see I am not the only one to have blessed you. But let me be the last one to improve this then." },
			},
			HephaestusImproveMiscOlympian03 =
			{
				Name = "HephaestusImproveMiscOlympian03",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasAnyTraitNamesInRoom = GameData.HephaestusImproveTraits,
				{ Cue = "/VO/Hephaestus_0054",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "Is there something wrong with that blessing? Might look it can't be improved. Then again, let me show you how it's done." },
			},
			HephaestusImproveMiscOlympian04 =
			{
				Name = "HephaestusImproveMiscOlympian04",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasAnyTraitNamesInRoom = GameData.HephaestusImproveTraits,
				{ Cue = "/VO/Hephaestus_0055",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "I believe you are getting used to the best, Zagreus. Well, say no more. Let me tune this up." },
			},
			HephaestusImproveMiscOlympian05 =
			{
				Name = "HephaestusImproveMiscOlympian05",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasAnyTraitNamesInRoom = GameData.HephaestusImproveTraits,
				{ Cue = "/VO/Hephaestus_0056",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "I would like to take another look at this blessing. I believe it wasn't fully improved. If I could just..." },
			},
			HephaestusImproveMiscOlympian06 =
			{
				Name = "HephaestusImproveMiscOlympian06",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasAnyTraitNamesInRoom = GameData.HephaestusImproveTraits,
				{ Cue = "/VO/Hephaestus_0057",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "You should be used to my improvement by now. Now back to the workshop." },
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
					Text = "I'll be straight with you. I know what failure looks like. How do you think I got there? I had to work hard to get where I am. You must learn to do the same. There's no freepass in life. Earn it." },
			},
			-- ending	
			HephaestusAboutOlympianReunionQuest01 =
			{
				Name = "HephaestusAboutOlympianReunionQuest01",
				PlayOnce = true,
				RequiredTextLines = { "HephaestusFirstPickUp", "PersephoneAboutOlympianReunionQuest01", },
				{ Cue = "/VO/ZagreusField_4343", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 2.7 },
					PostLineAnim = "ZagreusInteractEquip", PostLineAnimTarget = "Hero", PostLineFunctionName = "BoonInteractPresentation",
					Text = "I am sure you could use some time off, Lord Hephaestus. In the name of Hades! Olympus, this is an official message! I hope you can join the party." },
				{ Cue = "/VO/Hephaestus_0042",
					PortraitExitWait = 1.25,
					PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
					UseEventEndSound = true,
					Text = "Oi, an invitation for me? Gathering aren't my cup, if you get me. I'll let Hermes the spotlight. If you'll excuse me, I still have a lot of work. " },
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
					Text = "Zagreus. If I am being totally honest with you. I meant to come help you sooner, but I was too busy with work. Maybe Aphrodite is right. Maybe I should work a little less. But again, that's why I can give you this." },
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
					Text = "Hermes and I don't work on the same schedule. Don't worry, nothing bad happen between us. We are just both so busy, in our own way." },
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
					Text = "Hermes keeps bragging me how many request he does in day. I might do less request than him, but look at this. Like I say, quality beats quantity." },
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
					Text = "How clumsy is Daedalus? Even if he keeps fixing your domain, how many hammer does one have? Many. Yes, many." },
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
					Text = "You might wonder why I got Daedalus to give you his hammer... Well, Zagreus. I keep my own hammer since you might not be strong enough to handle them. Daedalus is kind enough to share his." },
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
					Text = "Can you believe Ares is my brother? I don't think we can ever get along after so many confrontation. There's some things you can't forgive. Even to family member." },
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
					Text = "As you may know, Aphrodite is my wife. Our relationship is... complicated. But nonetheless, we should be everything for each other. I just wish she would understand it." },
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
					Text = "My wife has not been the most faitful, but even in our worst times, I know we cared for each other. I know I am working too much, but it's no reason to play behind my back, right?" },
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
					Text = "" },
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
					Text = "" },
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
					Text = "" },
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
					Text = "" },
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
					Text = "" },
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
					Text = "" },
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
					Text = "" },
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
					Text = "" },
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
					Text = "" },
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
					Text = "" },
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
					Text = "" },
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
					Text = "" },
			},--[[HephaestusAboutHammerWeapon01 =
			{
				Name = "HephaestusAboutHammerWeapon01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredWeapon = "HammerWeapon"
				{ Cue = "/VO/Hephaestus_0154",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You found yourself a fine hammer. I am sure you'll get use to its weight. It's a one of a kind." },
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
					Text = "Got some power there, eh. Zeus might get jealous there." },
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
					Text = "" },
			},]]
			HephaestusBackstory01 =
			{
				Name = "HephaestusBackstory01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "ZeusFirstPickUp", "HeraFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0095",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "As a newborn, I wasn't very... able. Hera didn't want a cripple as a son, and threw me off Olympus. I hope Hades wasn't as harsh to you during your childhood." },
			},
			HephaestusBackstory02 =
			{
				Name = "HephaestusBackstory02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusBackstory01" },
				{ Cue = "/VO/Hephaestus_0096",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You might not know this, but I was raised by nymphs very far from Olympus. It's when I was older that I was able to gain back my right as an olympian. But that's another story. You should keep going up like I did." },
			},
			HephaestusBackstory03 =
			{
				Name = "HephaestusBackstory03",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusBackstory01" },
				{ Cue = "/VO/Hephaestus_0097",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I got my crafting skills from decades of smithing in a volcano. Being a castaway had its pros. I was able to find my true passion. Find your own way, Zagreus." },
			},
			HephaestusBackstory04 =
			{
				Name = "HephaestusBackstory04",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusBackstory02","HephaestusBackstory03", "HephaestusGift02" },
				{ Cue = "/VO/Hephaestus_0098",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I made my mother a golden throne once. I knew she wouldn't refuse it which is why it was actually in fact a trap. How predictable was she then." },
			},
			HephaestusBackstory05 =
			{
				Name = "HephaestusBackstory05",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusBackstory04" },
				{ Cue = "/VO/Hephaestus_0099",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Remember when I told you I trapped my mother in a golden throne? Well, Hermes convinced me to let her go. I did, but under two condition. My place in Olympus and be blessed to have Aphrodite as my wife." },
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
					Text = "Do you remember how I got to where I am right now? Never give up and you might get what you deserve if you work hard enough." },
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
					Text = "Still in Tartarus, mate? While your there, take some time to appreciate Deadalus effort on this maze he made. Must be working if you are still in it. Haha." },
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
					Text = "The burning flames of Asphodel. I love the burning sensation of molten flame while smithing. I hope you get used to it as well." },
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
					Text = "The great garden of Elysium. A place for all heroes. I crafted many weapons. Most were used by them. Other killed them. " },
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
					Text = "I see you are getting close to the surface. I know the Temple of Styx can be tricky to go through. But still take some time to admire the unique architecture it has." },
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
					Text = "Did you get to an unknown location, just now? I would love to see new architecture. You can tell me about it once you visit me in my workshop." },
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
					Text = "Erebus is not a place you stay very long. I wouldn't go there unless necessary if I was you. Some don't come back from there, mate. I wouldn't want to lose my favorite client." },
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
					Text = "What a beautiful garden you were in, it felt so peaceful. You can find such beautiful garden here. But still. Impressive to find them down there." },
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
					Text = "One day you might get to the surface on your way to us. If you ever do, be careful with the local wildlife, they can be a bit agressive at times." },
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
					Text = "There should be an Infernal Trove next to you. Why don't you do some extra work? We both know all efforts are rewarded." },
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
					Text = "You found one of Daedalus' Hammer, mate. They sure know what to do with your weapons. If something can get you out, it's them." },
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
					Text = "I appreciate my uncle Poseidon. He believed in me when I was young and helped me resolve major conflict with my brother. He's the real mate." },
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
					Text = "You must have encountered one of the anvil of fates in your countless attempts to escape. They sure are tricky to use. Sometimes it's best to continue your path." },
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
					Text = "Not even a scratch! You are getting really good at predicting your enemies movements. Maybe this can help in case they eventually hit you." },
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
					Text = "Dodged, and dodged. I couldn't move like you did with my leg, but it was impressive to watch. This is your reward." },
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
					Text = "Was that battle rigged? You didn't get hit. If it wasn't, congratulation. You deserve this for your hard work." },
			},

			HephaestusAboutDamageLessRun01 =
			{
				Name = "HephaestusAboutDamageLessRun01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", },
				RequiredNoDamageThisRoom = true,
				{ Cue = "/VO/Hephaestus_0116",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Wait... I was sure you made it to the surface without a single hit... I must be mistaken since your still down there. I should take a break right after this." },
			},
			HephaestusPostEpilogue01 =
			{
				Name = "HephaestusPostEpilogue01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "OlympianReunionQuestComplete" },
				{ Cue = "/VO/Hephaestus_0119",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Are you done escaping already? Why do I care, as long as I got work to do." },
			},

			HephaestusLegendaryPickUp01 =
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
			},

			HephaestusArmorPickUp01 =
			{
				Name = "HephaestusArmorPickUp01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredOneOfTraits = { "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait" },
				{ Cue = "/VO/Hephaestus_0121",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "If it's defense you need, I reckon I have the best to offer. Armor up." },
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
					Text = "With this, nothing can get through ya. Unless, you let them. Then I don't know what to tell you." },
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
					Text = "How is it going for you? I can sense, not so great. Hope this can change the steam for you." },
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
					Text = "A good defense is always a great start if you want to escape. I think you could improve there." },
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
					Text = "Life is running out of ya, Zagreus. There's a limit to what I can improve. Improve yourself." },
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
					Text = "Let's build up your defense, you look like you could use some." },
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
					Text = "Life isn't doing great for you, eh? Maybe try a different approach? Start with this." },
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
					Text = "I can't sense Hermes anywhere. This new presence might be for something. Olympus I accept this message." },
				{ Cue = "/VO/Hephaestus_0001",
					PortraitExitWait = 1.25,
					PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
					UseEventEndSound = true,
					Text = "Oi, Hermes couldn't make it and asked me to tune up your escape plan. Daedalus sure knows how to create a great maze." },
			},
			HephaestusMiscPickup01 =
			{
				Name = "HephaestusMiscPickup01",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0002",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Smithing is my passion... I don't have to think about my worries, but sometimes, I think others take my creation for granted. " },
			},
			HephaestusMiscPickup02 =
			{
				Name = "HephaestusMiscPickup02",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", },
				{ Cue = "/VO/Hephaestus_0003",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "My hammer knows no limit. Any mineral can do. And I can forge blessing as well. Let me show you." },
			},
			HephaestusMiscPickup03 =
			{
				Name = "HephaestusMiscPickup03",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0004",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Nothing better than hard work, am I right, Zagreus? You must have a lot to do on your end as well. Maybe this will help you." },
			},
			HephaestusMiscPickup04 =
			{
				Name = "HephaestusMiscPickup04",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", },
				{ Cue = "/VO/Hephaestus_0005",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The bronze and iron are still warm. Freshly bended for your needs. Take it." },
			},
			HephaestusMiscPickup05 =
			{
				Name = "HephaestusMiscPickup05",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0006",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "There's only one thing that will get you out of there, Zagreus. It's hard work, and nothing else. Now, show me what you got." },
			},
			HephaestusMiscPickup06 =
			{
				Name = "HephaestusMiscPickup06",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0007",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Slow and steady wins the race. You might think faster brings you far, but surviving brings you further." },
			},
			HephaestusMiscPickup07 =
			{
				Name = "HephaestusMiscPickup07",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", },
				{ Cue = "/VO/Hephaestus_0008",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Oi, harden yourself. You don't know what's ahead of you. There's always a next challenge." },
			},
			HephaestusMiscPickup08 =
			{
				Name = "HephaestusMiscPickup08",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", },
				{ Cue = "/VO/Hephaestus_0009",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "If all you have is a hammer, everything looks like a nail. Sometime the simplest solution is to bash your way through." },
			},
			HephaestusMiscPickup09 =
			{
				Name = "HephaestusMiscPickup09",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0010",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You have my sword... And my bow... And my axe... Any weapon must I say. Just ask." },
			},
			HephaestusMiscPickup10 =
			{
				Name = "HephaestusMiscPickup10",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0011",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "In this world, you are either an anvil or a hammer, Zagreus. Choose well." },
			},
			HephaestusMiscPickup11 =
			{
				Name = "HephaestusMiscPickup11",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", },
				{ Cue = "/VO/Hephaestus_0012",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Life is very similar to smithing, Zagreus. It beats you down until you are tempered and sharp enough to slice through any opposition. You are just being sharped here." },
			},
			HephaestusMiscPickup12 =
			{
				Name = "HephaestusMiscPickup12",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0013",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Without patience and the skill of a craftsman even the greatest talen is wasted. Don't waste this hard work on me now, Zagreus." },
			},
			HephaestusMiscPickup13 =
			{
				Name = "HephaestusMiscPickup13",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", },
				{ Cue = "/VO/Hephaestus_0014",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "In order to succeed, you must have a clear objective in mind. Set yourself to join us and you'll be here in no time." },
			},
			HephaestusMiscPickup14 =
			{
				Name = "HephaestusMiscPickup14",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0015",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "There will be obstacles. There will be doubters. There will be mistakes. But as long as you continue, there are no limits." },
			},
			HephaestusMiscPickup15 =
			{
				Name = "HephaestusMiscPickup15",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", },
				{ Cue = "/VO/Hephaestus_0016",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "There's no way to measure success. You fail or you succeed. There's no in between." },
			},
			-- Relationship improved
			HephaestusMiscPickup16 =
			{
				Name = "HephaestusMiscPickup16",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "HephaestusGift01" },
				{ Cue = "/VO/Hephaestus_0017",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Pain is temporary. Quitting lasts forever. I see you don't quit easily, {#DialogueItalicFormat}eh {#PreviousFormat}? Keep going Zagreus." },
			},
			HephaestusMiscPickup17 =
			{
				Name = "HephaestusMiscPickup17",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "HephaestusGift01" },
				{ Cue = "/VO/Hephaestus_0018",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I work very hard, all the time, Zagreus. But when it comes to you, I always like to put a little extra, just for you." },
			},
			HephaestusMiscPickup18 =
			{
				Name = "HephaestusMiscPickup18",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "HephaestusGift01" },
				{ Cue = "/VO/Hephaestus_0019",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I am still on a production streak thanks to your gift, Zagreus. You'll see what my work looks like at full efficency." },
			},
			HephaestusMiscPickup19 =
			{
				Name = "HephaestusMiscPickup19",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "HephaestusGift01" },
				{ Cue = "/VO/Hephaestus_0020",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I can always think of better ways to work, but it's the reason why I work that makes me work better. When I am working for you, I can't think of a better reason." },
			},
			HephaestusMiscPickup20 =
			{
				Name = "HephaestusMiscPickup20",
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "HephaestusGift01" },
				{ Cue = "/VO/Hephaestus_0021",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Where you find quality, you will find a craftsman, mate. And good thing you found me." },
			},
			-- Shorter Dialogs
			HephaestusMiscPickup21 =
			{
				Name = "HephaestusMiscPickup21",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0022",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hard work always pays off, whatever you do, mate." },
			},
			HephaestusMiscPickup22 =
			{
				Name = "HephaestusMiscPickup22",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0023",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You cannot dream yourself into a character; you must hammer and forge yourself one." },
			},
			HephaestusMiscPickup23 =
			{
				Name = "HephaestusMiscPickup23",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0024",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "If at first you don't succeed, get a bigger hammer. Easy enough, mate?" },
			},
			HephaestusMiscPickup24 =
			{
				Name = "HephaestusMiscPickup24",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0025",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "There are no shortcuts to any place worth going, mate. Olympus is one of them." },
			},
			HephaestusMiscPickup25 =
			{
				Name = "HephaestusMiscPickup25",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0026",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "There are no secrets to sucess, Zagreus. It is the result of preparation, hard work and learning from failure." },
			},
			HephaestusMiscPickup26 =
			{
				Name = "HephaestusMiscPickup26",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0027",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Repeat after me Zagreus. {#DialogueItalicFormat}'No matter how hard it is, or how hard it gets, I'm going to make it'{#PreviousFormat}." },
			},
			HephaestusMiscPickup27 =
			{
				Name = "HephaestusMiscPickup27",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0028",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "There is no magic to achievement, mate. It's really about hard work, choices and persistence." },
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
					Text = "Hard work beats talent when talent doesn't work hard. Lucky enough, you seem to have both, Zagreus." },
			},
			HephaestusMiscPickup29 =
			{
				Name = "HephaestusMiscPickup29",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0030",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Perseverance is failling countless times and succeeding once." },
			},
			HephaestusMiscPickup30 =
			{
				Name = "HephaestusMiscPickup30",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0031",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Never stop going forward. Action always leads to results." },
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
					Text = "Success is the sum of small efforts. Continuously. You are getting somewhere. Let's hope it's here with us." },
			},
			HephaestusMiscPickup33 =
			{
				Name = "HephaestusMiscPickup33",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0034",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "When they bring you down, that's when you get up. Nobody can stop you from what you put your mind into." },
			},
			HephaestusMiscPickup34 =
			{
				Name = "HephaestusMiscPickup34",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0035",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Sometimes you think you won't succeed, but the distance to success is always closer than you think." },
			},
			HephaestusMiscPickup35 =
			{
				Name = "HephaestusMiscPickup35",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0036",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Let's tune that. Oh, like this!" },
			},
			HephaestusMiscPickup36 =
			{
				Name = "HephaestusMiscPickup36",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0037",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "It's getting hot in here. I am sure you'll like this one." },
			},
			HephaestusMiscPickup37 =
			{
				Name = "HephaestusMiscPickup37",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0038",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Forge is hot, what's your order?" },
			},
			HephaestusMiscPickup38 =
			{
				Name = "HephaestusMiscPickup38",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0039",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Order up. I'll make it worth." },
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
					Text = "Is that Charon with you? What a great customer. He keeps it professional. No small talk." },
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
					Text = "Buying from the Boatman, are you? I reckon it's a way to acquire my blessings. As long as I get what I am owe." },
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
					Text = "I smithen that a while ago. I think you get scammed by Charon there." },
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
					Text = "I am sure you know the Boatman keeps a cut. I could have done that half priced." },
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
					Text = "That's what you use your obols for? I am flattered, but you could have bargain a little bit more." },
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
					Text = "Is it worth that much? I sold it to Charon for way less." },
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
					Text = "I understand the delivery fee, but I think you got overcharged." },
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
					Text = "My blessing cost the same as Hermes? I can't accept this. I work with quality here." },
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
					Text = "Lord Hephaestus, please accept this gift for all your improvements. I know you deserve this for your hard work." },
				{ Cue = "/VO/Hephaestus_0142",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "How kind of you, mate. Is that what you think, hardworker deserves gifts? Well, I made this for you. Does it remind you of someone?" },
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
					Text = "I found this nectar and thought you could get a break from your hardwork. At least enough time to drink it." },
				{ Cue = "/VO/Hephaestus_0143",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I don't take break. I'll put your nectar to the side for when I am done with my orders. There's always something to do." },
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
					Text = "You might not get break, Lord Hephaestus. But if you do, I am sure you could use something like this." },
				{ Cue = "/VO/Hephaestus_0144",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Yes. Sure. I... No... To busy right now, but I'll keep it with the other. Feel free to give them to someone else." },
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
					Text = "I am not sure if you found anytime to enjoy my last gift, but I wanted you to have this one." },
				{ Cue = "/VO/Hephaestus_0145",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I... Fine. I'll drink them all right now. Be done with it. {#DialogueItalicFormat}Gurps{#PreviousFormat}. There happy? Oh that was good. {#DialogueItalicFormat}Gurps{#PreviousFormat}." },
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
					Text = "Since you seemed to have like the last one, I though you could use some more." },
				{ Cue = "/VO/Hephaestus_0146",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Oi, more? I haven't been this productive since... can't remember. {#DialogueItalicFormat}Gurps{#PreviousFormat}. This goes here and this here." },
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
					Text = "You seemed so pleased by your improved productivity, Lord Hepheastus. I though I could bring you some more." },
				{ Cue = "/VO/Hephaestus_0147",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Oi... I'll try this one, but... {#DialogueItalicFormat}Gurps{#PreviousFormat} but... eh. can't get anymore. Sorry got to go." },
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
					Text = "Ambrosia? I suppose this could work. Let's try it out. Oh! That hit the spot. Great choice" },
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
					Text = "Since Nectar doesn't fit. Here's Ambrosia like last time, Lord Hephaestus. I hope this makes you feel better." },
				{ Cue = "/VO/Hephaestus_0149",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					PostLineThreadedFunctionName = "MaxedRelationshipPresentation",
					PostLineFunctionArgs = { Text = "NPC_Hephaestus_01", Icon = "Keepsake_HephaestusSticker_Max" },
					Text = "Again? Let's sort this out once and for all. You are my favorite customer. Here I said it. Now go." },
			},
		},

		GiftGivenVoiceLines =
		{
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			PlayFromTarget = true,

			-- But, wait... This is me!
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

		PickupVoiceLines =
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.55,
			SuccessiveChanceToPlayAll = 0.66,
			CooldownTime = 6,

			-- Smithing by the gods.
			{ Cue = "/VO/ZagreusField_5011", },
			-- That's quality.
			{ Cue = "/VO/ZagreusField_5012", },
			-- Couldn't be better.
			{ Cue = "/VO/ZagreusField_5013", },
			-- Woah.
			{ Cue = "/VO/ZagreusField_5014", },
			-- Tuned up.
			{ Cue = "/VO/ZagreusField_5015", },
			-- Bronze and gold.
			{ Cue = "/VO/ZagreusField_5016", },
			-- Rock and stones.
			{ Cue = "/VO/ZagreusField_5017", },
			-- As I ordered it.
			{ Cue = "/VO/ZagreusField_5018", },
			-- Great customer service.
			{ Cue = "/VO/ZagreusField_5019", },
			-- Like I wanted.
			{ Cue = "/VO/ZagreusField_5020", },
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
                Text = "Shiny. Apollo sure knows how to bless someone. But let me improve the lightness of this one. Even he won't see it coming." },
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
                Text = "How strange. Hestia came by? Eh, an order is an order. I know how to deal with the heat. Check this out." },
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
                Text = "You convinced Mum to give you something. That's worth more than getting out of there, if you ask me. I didn't have that much chance with her. Let me change her blessing a bit. She won't like it, but what do I care." },
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
            currentRun.LootTypeHistory.WeaponUpgrade = currentRun.LootTypeHistory.WeaponUpgrade + 1
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
ModUtil.Path.Wrap( "EndEncounterEffects", 
	function(baseFunc, currentRun, currentRoom, currentEncounter)
		baseFunc(currentRun, currentRoom, currentEncounter)
		if currentEncounter == nil or currentEncounter.EncounterType == "NonCombat" then
			return
		end
		if HeroHasTrait("SpawnWeaponsTrait") and CurrentRun.CurrentRoom.HephWeapons ~= nil then
			for index, obstacle in ipairs( CurrentRun.CurrentRoom.HephWeapons ) do
				if obstacle ~= nil then
					Destroy({ Id = obstacle.ObjectId })				
				end
			end
		end
		if currentEncounter == currentRoom.Encounter and not currentRoom.BlockClearRewards then
			for k, traitData in pairs(currentRun.Hero.Traits) do
				if not currentEncounter.PlayerTookDamage and traitData.RepairArmorOnPerfectEncounter then
					--PerfectClearTraitSuccessPresentation( traitData )
					RepairArmor(traitData.RepairArmorOnPerfectEncounter)
					thread(RepairArmorPresentation)
					--CurrentRun.CurrentRoom.PerfectEncounterCleared = true
					--CheckAchievement( { Name = "AchBuffedButterfly", CurrentValue = traitData.AccumulatedDamageBonus } )
				end
			end
		end
	end
)
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
		if superName ~= nil then
			if HeroHasTrait("HephaestusShoutSummon")then
				local isMax = string.find(superName, "Max")
				if isMax then
					thread( HephaestusMaxShout )
				else
					thread( HephaestusShout )
				end
			end
		end		
	end
)
function HephaestusShout() 
	ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Heph Shout"))
	SpawnExplosiveChariot({Name = "HephaestusChariotSuicide", Duration = 10.0})
end
function HephaestusMaxShout() 
	ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Heph Max Shout")) 
	SpawnExplosiveChariot({Name = "HephaestusChariotSuicide", Duration = 10.0})
	SpawnExplosiveChariot({Name = "HephaestusChariotSuicide", Duration = 10.0})
	SpawnExplosiveChariot({Name = "HephaestusChariotSuicide", Duration = 10.0})
	SpawnExplosiveChariot({Name = "HephaestusChariotSuicide", Duration = 10.0})
end
function SpawnExplosiveChariot( args )
	local enemyName = args.Name or "ChariotSuicide"
	local enemyData = EnemyData[enemyName]
	local newEnemy = DeepCopyTable( enemyData )
	newEnemy.BlocksLootInteraction = false

	local invaderSpawnPoint = CurrentRun.Hero.ObjectId
	newEnemy.ObjectId = SpawnUnit({
			Name = enemyData.Name,
			--Group = "Standing",
			DestinationId = invaderSpawnPoint, OffsetX = 0, OffsetY = 15,
			DoActivatePresentation = false })

	SetupEnemyObject( newEnemy, CurrentRun )
	--CurrentRun.CurrentRoom.DestroyAssistUnitOnEncounterEndId = newEnemy.ObjectId
	--CurrentRun.CurrentRoom.DestroyAssistProjectilesOnEncounterEnd = "DusaFreezeShotNonHoming"
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
	ModUtil.Hades.PrintStackChunks(ModUtil.ToString("InCooldown Setup"))
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
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("InCooldown Start"))
	if CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead and IsCombatEncounterActive( CurrentRun ) then
		CreateAnimation({ Name = "Shielded", DestinationId = CurrentRun.Hero.ObjectId, Group = "FX_Standing_Top" })
	end
	wait(igneousArmor.Duration-1.4)
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("InCooldown Tick"))
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
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("InCooldown Cooldown"))
	wait(igneousArmor.Cooldown)
	igneousArmor.InCooldown = false
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("InCooldown Ready"))
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
