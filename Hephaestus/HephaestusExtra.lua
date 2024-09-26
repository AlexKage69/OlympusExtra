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
	OlympusColor.HephaestusDamageLight = { 98,35,28,255 }
	OlympusColor.HephaestusDamage = { 73,18,15,255  }
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
				"HephaestusRushTrait",
				"HephaestusRangedTrait",
				"HephaestusSecondaryTrait",
				"HephaestusShoutTrait",
				"DamageBoostTrait",
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
	table.insert(OlympusQuestOrderData, 30, "HephaestusUpgrades")
	table.insert(OlympusQuestOrderData, 31, "HephaestusLegendaryUpgrades")
	--Loot
	local OlympusConsumableData = ModUtil.Entangled.ModData(ConsumableData)
	OlympusConsumableData.HephaestusUpgradeDrop =
	{
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
	local OlympusRewardStoreData = ModUtil.Entangled.ModData(RewardStoreData)
	table.insert(OlympusRewardStoreData.RunProgress, {
		Name = "HephaestusUpgrade",
		GameStateRequirements =
		{
			RequiredMaxHephaestusUpgrades = 1,
			--RequiredFalseLootPickup = "HermesUpgrade",
			RequiredNotInStore = "HephaestusUpgradeDrop",
			RequiredMinCompletedRuns = 3,
			RequiredMinDepth = 13,
		}
	})
	--WeaponData
	local OlympusWeaponSets = ModUtil.Entangled.ModData(WeaponSets)
	OlympusWeaponSets.AllPrimaryWeapons = { "SwordWeapon",
		"SwordWeapon2", "SwordWeapon3", "SwordWeaponDash", "SwordWeaponWave", "SpearWeapon", "SpearWeapon2", "SpearWeapon3",
		"SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3",
		"SpearWeaponDash", "SpearWeaponThrow",  "ShieldWeapon", "ShieldWeaponRush", "ShieldThrow",
		"ShieldWeaponDash", "BowWeapon", "BowWeaponDash", "ChargeBowWeapon1",
		"MaxChargeBowWeapon", "BowWeapon2", "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5",
		"FistWeaponDash", "GunWeapon",
		"GunWeaponDash", "SniperGunWeapon", "SniperGunWeaponDash"
	}
	OlympusWeaponSets.AllSecondaryWeapons = { "SwordParry", "SpearWeaponThrow", "SpearThrowImmolation",
		"SpearWeaponThrowReturn", "SpearWeaponThrowInvisibleReturn", "ShieldThrow",
		"ChaosShieldThrow", "ShieldThrowDash", "BowSplitShot", "FistWeaponSpecial",
		"FistWeaponSpecialDash", "FistWeaponLandAreaAttack", "GunGrenadeToss", "GunBombWeapon",
	}
	local OlympusWeaponData = ModUtil.Entangled.ModData(WeaponData)
	local OlympusEffectData = ModUtil.Entangled.ModData(EffectData)
	
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
	
	GameData.RunClearMessageData.ClearRequiredTraitsHephaestus =
	{
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements =
		{
			RequiredCountOfTraitsCount = 3,
			RequiredCountOfTraits =
			{
				"HephaestusWeaponTrait",
				"HephaestusRushTrait",
				"HephaestusRangedTrait",
				"HephaestusSecondaryTrait",
				"HephaestusShoutTrait",
			},
			RequiredOneOfTraits = { "ArmorLegendaryTrait" },
		},
	}
	table.insert(OlympusGameData.ConversationOrder, "HephaestusUpgrade")
	--[[table.insert(OlympusGameData.RunClearMessageData.ClearWeaponsFiredWrath.GameStateRequirements.RequiredWeaponsFiredThisRun
		.Names, "HephaestusBeamWeapon")]]
	ModUtil.Table.Merge(OlympusGameData.GodAboutGodVoiceLines, {
		"HephaestusAboutZeus01"
	}
	)
	--Keywords
	local OlympusKeywordList = ModUtil.Entangled.ModData(KeywordList)
	ModUtil.Table.Merge(OlympusKeywordList, { "Repair", "IgneousArmor", "TemporaryAmmo", "HephWeapon", "ArmorIcon" })
	ResetKeywords()

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
	local OlympusEnemyData = ModUtil.Entangled.ModData(EnemyData)
	OlympusEnemyData.HephaestusChariot = {
		InheritFrom = { "Chariot" },
		GenusName = "HephaestusChariot",
		HitSparkScale = 1.2,

		Groups = { "GroundEnemies" },

		--RequireEncounterCompleted = "ChariotIntro",
		--RequiredIntroEncounter = "ChariotSuicideIntro",

		ActiveCapWeight = 0.5,
		LargeUnitCap = 6,

		MaxHealth = 60,
		HealthBarOffsetY = -130,
		HealthBarType = "Small",
		BlockSelfDamageNumbers = true,

		AlwaysTraitor = true,

		IsAggroedSound = "/SFX/Enemy Sounds/FireChariot/FireChariotAggro",
		--AIAggroRange = 900,

		DefaultAIData =
		{
			AIRequireProjectileLineOfSight = false,
			AIRequireUnitLineOfSight = true,
			SetupDistance = 800,
			SetupTimeout = 5.0,
			RamDistance = 10,
			RamTimeout = 6.0,
			RamWeaponName = "ChariotRamSelfDestruct",
			RamEffectName = "RamBerserk",
			PreAttackAnimation = "SuicideChariotAttackCharge",
			PreAttackSound = "/SFX/Enemy Sounds/FireChariot/FireChariotAttackStart",
			PreAttackShake = 400,
			PreAttackFlash = 1.0,
			PreAttackDuration = 0.5,
			PostAttackAnimation = "ChariotSuicideStop",
			RamRecoverTime = 2.0,
		},

		--[[GeneratorData =
		{
			DifficultyRating = 15,
			BlockEnemyTypes = { "ChariotSuicideElite" },
		},]]

		--[[EnemyFirstEncounterVoiceLines =
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
		},]]

		Binks =
		{
			"Enemy_ChariotSmallIdle_Bink",
			"Enemy_ChariotSmallAttack_Bink",
			"Enemy_ChariotSmallOnHit_Bink",
			"Enemy_ChariotSmallDeathVFX_Bink",
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
		ForceBoonName = "WeaponUpgrade",
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
		--Icon = "Boon_Hephaestus_06",
		LootSource = "HephaestusUpgrade",
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
				Multiplier = 1.80,
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
				Duration = 5,
				Cooldown = 7,
				DamageTransfer = {
					BaseValue = 0.07,
				},
				ExtractValues =
				{
					{
						Key = "Cooldown",
						ExtractAs = "TooltipCooldown",
					},
					{
						Key = "Duration",
						ExtractAs = "TooltipDuration",
					},
					{
						Key = "DamageTransfer",
						ExtractAs = "TooltipDamageTransfer",
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
		--Icon = "Boon_Hephaestus_09",
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
				Multiplier = 1.80,
			}
		},
		OnWeaponFiredFunctions =
		{
			ValidWeapons = WeaponSets.HeroSecondaryWeapons,
			FunctionName = "DamageIgneousArmor",
			FunctionArgs =
			{
				DamageTransfer = 0.1,
				ExtractValues =
				{
					{
						Key = "DamageTransfer",
						ExtractAs = "TooltipDamageTransfer",
					},
				}
			},
		},
		SetupFunction =
		{
			Name = "SetupIgneousArmor",
			RunOnce = true,
			Args =
			{
				Duration = 5,
				Cooldown = 7,
				DamageTransfer = 0.07,
				ExtractValues =
				{
					{
						Key = "Cooldown",
						ExtractAs = "TooltipCooldown",
					},
					{
						Key = "Duration",
						ExtractAs = "TooltipDuration",
					},
				}
			},
		},
		PropertyChanges =
		{

		},
	}
	
	OlympusTraitData.HephaestusRushTrait =
	{
		Name = "HephaestusRushTrait",
		InheritFrom = { "ShopTier1Trait" },
		LootSource = "HephaestusUpgrade",
		--Icon = "Boon_Hephaestus_03",
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
		--Icon = "Boon_Hephaestus_04",
		CustomTrayText = "HephaestusRangedTrait_Tray",
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
		SetupFunction =
		{
			Name = "SetupTemporaryAmmo",
			RunOnce = true,
			Args =
			{
				Ammo = 3,
				ExtractValues =
				{
					{
						Key = "Ammo",
						ExtractAs = "TooltipMaxArmor",
					},
				}
			},
		},
	}

	OlympusTraitData.HephaestusShoutTrait =
	{
		Name = "HephaestusShoutTrait",
		InheritFrom = { "ShopTier1Trait" },
		LootSource = "HephaestusUpgrade",
		RequiredTextLines = { "PoseidonWrathIntro01" },
		RequiredSlottedTrait = "Shout",
		--CustomTrayText = "HephaestusShoutTrait_Tray",
		--Slot = "Shout",
		--Icon = "Boon_Hephaestus_05",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.2,
			},
			Rare =
			{
				Multiplier = 1.3,
			},
			Epic =
			{
				Multiplier = 1.4,
			},
			Heroic =
			{
				Multiplier = 1.5,
			}
		},
		DamageExtract = {
			BaseValue = 100,
			SourceIsMultiplier = false,
		},
		ExtractValues =
		{
			{
				Key = "DamageExtract",
				ExtractAs = "TooltipDamageExtract",
			},
		}
	}
	OlympusTraitData.DropMoneyTrait =
	{
		Name = "DropMoneyTrait",
		--Icon = "Boon_Hephaestus_07",
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
		--Icon = "Boon_Hephaestus_08",
		InheritFrom = { "ShopTier2Trait" },
		LootSource = "HephaestusUpgrade",
		RequiredFalseTrait = "RevengeBoostTrait",
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
		AddOnHitWeapons = { "RevengeBoostApplicator" },
		OnHitWeaponProperties = { IgnoreAutomatic = true, AllowInvulnerable = true, FunctionName = "OnDamageBoost" },
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
		RequiredFalseTrait = "SpawnWeaponsTrait",
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
			ProximityMultiplierWithSelfEffect =
			{
				BaseValue = 1.5,
				SourceIsMultiplier = true,
			},
			DistanceEffects = { "DamageRangedBoost" },
			DistanceThreshold = 400,
			DistanceMultiplierWithSelfEffect =
			{
				BaseValue = 1.5,
				SourceIsMultiplier = true,
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
		}
	}
	OlympusTraitData.ArmorEncounterTrait =
	{
		Name = "ArmorEncounterTrait",
		InheritFrom = { "ShopTier1Trait" },
		LootSource = "HephaestusUpgrade",
		--Icon = "Boon_Hephaestus_10",
		RequiredFalseTrait = "ArmorEncounterTrait",
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
		--Icon = "Boon_Hephaestus_11",
		RequiredFalseTrait = "ArmorDefianceTrait",
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
		--Icon = "Boon_Hephaestus_09",
		RequiredFalseTrait = "ArmorBossTrait",
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
		RequiredFalseTrait = "HephaestusTrapTrait",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 0.8,
			},
			Epic =
			{
				Multiplier = 0.4,
			},
			Heroic =
			{
				Multiplier = 0.2
			}
		},
		LimitIncomingDamageModifiers =
		{
			TrapDamage =
			{
				BaseValue = 5,
			},
			ExtractValues =
			{
				{
					Key = "TrapDamage",
					ExtractAs = "TooltipLimitTrapDamage",
				},
			}	
		}
	}
	OlympusTraitData.DamageBoostTrait ={
		Name = "DamageBoostTrait",
		InheritFrom = { "ShopTier1Trait" },
		LootSource = "HephaestusUpgrade",
		--Icon = "Boon_Hephaestus_10",
		RequiredFalseTrait = "DamageBoostTrait",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			}
		},
		AddOutgoingDamageModifiers =
		{
			--ValidWeapons = WeaponSets.HeroNonPhysicalWeapons,
			--ExcludeLinked = true,
			ArmorDamageMultiplier = { BaseValue = 1.5, SourceIsMultiplier = true },
			ExtractValues =
			{
				{
					Key = "ArmorDamageMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
	}
	OlympusTraitData.ArmorLegendaryTrait =
	{
		Name = "ArmorLegendaryTrait",
		InheritFrom = { "ShopTier3Trait" },
		LootSource = "HephaestusUpgrade",
		RequiredFalseTrait = "ArmorLegendaryTrait",
		--Icon = "Boon_Hephaestus_15",		
		SetupFunction =
		{
			Name = "SetupArmor",
			RunOnce = true,
			Args = 
			{
				ArmorAtSetup = 100,
				Source = "ArmorLegendaryTrait",
				ExtractValues =
				{
					{
						Key = "ArmorAtSetup",
						ExtractAs = "TooltipMaxArmor",
					},
				}
			},
		},
	}
	-- Improved Traits
	-- Zeus	 
	OlympusTraitData.ZeusChargedBoltTrait.RequiredFalseTraits = {"ZeusChargedBoltTrait", "HephaestusImproveZeus"}
	OlympusTraitData.HephaestusImproveZeus =
	{
		Name = "HephaestusImproveZeus",
		Icon = "Boon_Zeus_02",
		ReplaceTrait = "ZeusChargedBoltTrait",
		InheritFrom = { "ShopTier3Trait" },
		God = "Zeus",
		PreEquipWeapons = { "ZeusLegendaryWeapon" },
		RequiredFalseTraits = { "HephaestusImproveZeus" },
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
		RequiredFalseTrait = "HephaestusImproveAthena",
		PreEquipWeapons = { "AthenaDefenseApplicator" },
		SetupFunction =
		{
			Name = "ReactivateInvulnerability",
		},
		PreviousTimeCooldown = 20,
		CurrentCooldown = 10,
		TimeCooldown = 10,
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
		Icon = "Boon_Poseidon_07",
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
		Icon = "Boon_Poseidon_13",
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
		ReplaceTrait = "CharmTrait",
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
		ReplaceTrait = "AresCursedRiftTrait",
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
		ReplaceTrait = "DionysusComboVulnerability",
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
		ReplaceTrait = "InstantChillKill",
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
				BaseMin = 60,
				BaseMax = 60,
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
		EventEndSound = "/SFX/HephaestusBoonWhoosh",
		UpgradeSelectedSound = "/SFX/HephaestusBoonChoice",

		RequiredTextLines = { "HermesFirstPickUp" },

		PriorityUpgrades = {},
		WeaponUpgrades = {},
		Traits = { "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRushTrait", "HephaestusRangedTrait", "HephaestusShoutTrait",  "DropMoneyTrait", "SpawnWeaponsTrait", "RevengeBoostTrait", "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait" },
		Consumables = {  },
		LinkedUpgrades =
		{
			ArmorLegendaryTrait =
			{
				OneOf = { "ArmorBossTrait", "ArmorEncounterTrait", "ArmorDefianceTrait" },
			},
			DamageBoostTrait = {
				OneOf = { "ArmorBossTrait", "ArmorEncounterTrait", "ArmorDefianceTrait" },
			},
			HephaestusTrapTrait = {
				OneOf = { "ArmorBossTrait", "ArmorEncounterTrait", "ArmorDefianceTrait" },
			},
			-- Legendary boost
			HephaestusImproveZeus = {
				OneFromEachSet =
				{
					{ "ZeusChargedBoltTrait" },
					{ "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRushTrait", "HephaestusRangedTrait", "HephaestusShoutTrait",  "DropMoneyTrait", "SpawnWeaponsTrait", "RevengeBoostTrait", "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait", "ForceWeaponUpgradeTrait" },
				}
			},
			HephaestusImproveAthena = {
				OneFromEachSet =
				{
					{ "ShieldHitTrait" },
					{ "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRushTrait", "HephaestusRangedTrait", "HephaestusShoutTrait",  "DropMoneyTrait", "SpawnWeaponsTrait", "RevengeBoostTrait", "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait", "ForceWeaponUpgradeTrait" },
				}
			},
			HephaestusImprovePoseidon = {
				OneFromEachSet =
				{
					{ "DoubleCollisionTrait" },
					{ "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRushTrait", "HephaestusRangedTrait", "HephaestusShoutTrait",  "DropMoneyTrait", "SpawnWeaponsTrait", "RevengeBoostTrait", "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait", "ForceWeaponUpgradeTrait" },
				}
			},
			HephaestusImproveFishPoseidon = {
				OneFromEachSet =
				{
					{ "FishingTrait" },
					{ "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRushTrait", "HephaestusRangedTrait", "HephaestusShoutTrait",  "DropMoneyTrait", "SpawnWeaponsTrait", "RevengeBoostTrait", "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait", "ForceWeaponUpgradeTrait" },
				}
			},
			HephaestusImproveArtemis = {
				OneFromEachSet =
				{
					{ "MoreAmmoTrait" },
					{ "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRushTrait", "HephaestusRangedTrait", "HephaestusShoutTrait",  "DropMoneyTrait", "SpawnWeaponsTrait", "RevengeBoostTrait", "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait", "ForceWeaponUpgradeTrait" },
				}
			},
			HephaestusImproveAphrodite = {
				OneFromEachSet =
				{
					{ "CharmTrait" },
					{ "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRushTrait", "HephaestusRangedTrait", "HephaestusShoutTrait",  "DropMoneyTrait", "SpawnWeaponsTrait", "RevengeBoostTrait", "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait", "ForceWeaponUpgradeTrait" },
				}
			},
			HephaestusImproveAres = {
				OneFromEachSet =
				{
					{ "AresCursedRiftTrait" },
					{ "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRushTrait", "HephaestusRangedTrait", "HephaestusShoutTrait",  "DropMoneyTrait", "SpawnWeaponsTrait", "RevengeBoostTrait", "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait", "ForceWeaponUpgradeTrait" },
				}
			},
			HephaestusImproveDionysus = {
				OneFromEachSet =
				{
					{ "DionysusComboVulnerability" },
					{ "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRushTrait", "HephaestusRangedTrait", "HephaestusShoutTrait",  "DropMoneyTrait", "SpawnWeaponsTrait", "RevengeBoostTrait", "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait", "ForceWeaponUpgradeTrait" },
				}
			},
			HephaestusImproveDemeter = {
				OneFromEachSet =
				{
					{ "InstantChillKill" },
					{ "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRushTrait", "HephaestusRangedTrait", "HephaestusShoutTrait",  "DropMoneyTrait", "SpawnWeaponsTrait", "RevengeBoostTrait", "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait", "ForceWeaponUpgradeTrait" },
				}
			},
		},

		Speaker = "NPC_Hephaestus_01",
		Portrait = "Portrait_Hephaestus_Default_01",
		Gender = "Male",
		SpawnSound = "/SFX/HephaestusBoonWhoosh",
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
			-- It's Hephaestus.
			{ Cue = "/VO/ZagreusField_1927" },
			-- Time for a boost.
			{ Cue = "/VO/ZagreusField_1928", RequiredPlayed = { "/VO/ZagreusField_1927" } },
			-- Right on time.
			{ Cue = "/VO/ZagreusField_1929", RequiredPlayed = { "/VO/ZagreusField_1927" } },
			-- There he is.
			{ Cue = "/VO/ZagreusField_1930", RequiredPlayed = { "/VO/ZagreusField_1927" } },
			-- Message for me?
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

		SuperPriorityPickupTextLineSets =
		{
			HephaestusSecondPickUp =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp", },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0003",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "What's going on, there, Coz? Can I call you Coz? Got something here for you should make your battles to the death end that much quicker!" },
			},

			-- keepsake responses
			HephaestusExpectingZeus01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredFalseGodLoot = "ZeusUpgrade",
				RequiredTrait = "ForceZeusBoonTrait",
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,

				{ Cue = "/VO/Hephaestus_0061",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Sorry, boss, my pop had pressing matters to attend to. But I'm here! Relaying you that message, and relaying this." },
			},
			HephaestusExpectingPoseidon01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredFalseGodLoot = "PoseidonUpgrade",
				RequiredTrait = "ForcePoseidonBoonTrait",
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,

				{ Cue = "/VO/Hephaestus_0062",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Here to tell you that Poseidon's on his way, boss. Sometimes he is a little slow. But you'll meet up with him again eventually!" },
			},
			HephaestusExpectingAthena01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredFalseGodLoot = "AthenaUpgrade",
				RequiredTrait = "ForceAthenaBoonTrait",
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,

				{ Cue = "/VO/Hephaestus_0060",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Expecting someone else, there, boss? A certain half-sister of mine perchance? Well, tough break, I got here first. Want one of these, or not?" },
			},
			HephaestusExpectingAres01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredFalseGodLoot = "AresUpgrade",
				RequiredTrait = "ForceAresBoonTrait",
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,

				{ Cue = "/VO/Hephaestus_0063",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Soon as I heard you were looking to see Ares, boss, I got here as fast as I could! He's never going to beat me. Much less in all that armor." },
			},
			HephaestusExpectingAphrodite01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				RequiredFalseGodLoot = "AphroditeUpgrade",
				RequiredTrait = "ForceAphroditeBoonTrait",
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,

				{ Cue = "/VO/Hephaestus_0064",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Aphrodite said she's running just a little late, Coz, though I'm sure you understand. Besides, I'm here! In spirit anyhow." },
			},
			HephaestusExpectingArtemis01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredFalseGodLoot = "ArtemisUpgrade",
				RequiredTrait = "ForceArtemisBoonTrait",
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,

				{ Cue = "/VO/Hephaestus_0065",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Wanted to let you know my sister Artemis is out looking for you. You should be running into her in any chamber, now!" },
			},
			HephaestusExpectingDionysus01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredFalseGodLoot = "DionysusUpgrade",
				RequiredTrait = "ForceDionysusBoonTrait",
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,

				{ Cue = "/VO/Hephaestus_0066",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Afraid that Dionysus couldn't be here for you, boss. Though punctuality has never been one of his stronger suits." },
			},
			HephaestusExpectingDemeter01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredFalseGodLoot = "DemeterUpgrade",
				RequiredTrait = "ForceDemeterBoonTrait",
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,

				{ Cue = "/VO/Hephaestus_0160",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "That chill you were expecting in the air, that wasn't Demeter this time, here, boss! No, that was just me whisking to you in a flash. Makes for a little pleasant breeze I think!" },
			},

			HephaestusBeatCharonQuestComplete =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp", "BossCharonHephaestusQuestComplete01" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0200",
					Emote = "PortraitEmoteCheerful",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You did it, Coz! And by {#DialogueItalicFormat}it {#PreviousFormat}I'm referring to the act of beating down my seemingly invincible boatman associate, who fancies himself pretty tough as Underworld deities go! He wasn't sure you had it in you, and if I may be so bold, neither was I!" },
			},

			HephaestusAboutPlume02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				-- MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusAboutPlume01" },
				RequiredAnyTextLines = { "HephaestusGift06", "HephaestusGift06B" },
				RequiredTrait = "FastClearDodgeBonusTrait",
				RequiresMaxKeepsake = true,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0115",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hey looking like you're getting some good use out of that fancy plume of yours! Keep going like that, maybe someday you'll be half as quick as me!" },
			},

			HephaestusAboutSkelly01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp", "HephaestusGift01", "SkellyBackstory01" },
				RequiredAnyTextLines = { "HephaestusAboutHourglass01", "HephaestusLootBought01", "HephaestusLootBought01_B" },
				RequiredTrait = "ReincarnationTrait",
				RequiresMaxKeepsake = true,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0117",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I got a keen eye, boss, so I happened to notice that you've got a certain tooth you're carrying about. Know you're from the land of the dead and all, but don't you think that comes across as just a little odd?" },
			},

			-- ending
			HephaestusAboutPersephoneMeeting01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp", "PersephoneFirstMeeting" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				RequiredRoomLastRun = "D_Intro",
				MinRunsSinceAnyTextLines = { TextLines = { "PersephoneFirstMeeting" }, Count = 5 },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0162",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Heard that you finally got out of there, Coz! Big congratulations due for that: Congrats! The secret's safe with me, of course! The others here, they think you're still at it. Though, I guess you are!" },
			},
			HephaestusPostEnding01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp", "Ending01" },
				MinRunsSinceAnyTextLines = { TextLines = { "Ending01" }, Count = 4 },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0163",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					TriggerCooldowns = { "ZagreusBoonPickUpSpeech" },
					Text = "I heard a certain someone's back at home with you down there now, Coz! I'd call it wonderful news, except it {#DialogueItalicFormat}isn't {#PreviousFormat}news, at least not yet! Though if the time comes that you want to spread the word, just give the signal here!" },
			},
			HephaestusAboutOlympianReunionQuest01 =
			{
				PlayOnce = true,
				RequiredTextLines = { "HephaestusFirstPickUp", "PersephoneAboutOlympianReunionQuest01", },
				-- MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/ZagreusField_4343", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 2.7 },
					PostLineAnim = "ZagreusInteractEquip", PostLineAnimTarget = "Hero", PostLineFunctionName = "BoonInteractPresentation",
					Text = "I get to be the messenger this time. In the name of Hades! Olympus, this is an official message! Lord Hephaestus? Got here as quickly as I could." },
				{ Cue = "/VO/Hephaestus_0226",
					PortraitExitWait = 1.25,
					PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
					UseEventEndSound = true,
					Text = "Why, that looks like you've got a message just for {#DialogueItalicFormat}me{#PreviousFormat}, this time, how special is that, boss? Some sort of invite from the looks of things. You sure that I'm supposed to have this, seeing as I'm not officially involved?" },
			},

			HephaestusPostEpilogue01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "OlympianReunionQuestComplete", },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0227",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Got to tell you, Coz, that was a real something of a feast back your place! A little awkward, having to pretend we just met, but hey, I'm an Olympian! Means I can posture with the best of them. Good times, Coz! Glad it all worked out." },
			},
		},

		PriorityPickupTextLineSets =
		{
			HephaestusExpectingMiscOlympian01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredMinAnyTextLines = { TextLines = { "HephaestusExpectingZeus01", "HephaestusExpectingPoseidon01", "HephaestusExpectingAthena01", "HephaestusExpectingAphrodite01", "HephaestusExpectingAres01", "HephaestusExpectingArtemis01", "HephaestusExpectingDionysus01", "HephaestusExpectingDemeter01", }, Count = 2 },
				RequiredFalseGodLoots = { "ZeusUpgrade", "PoseidonUpgrade", "AthenaUpgrade", "AphroditeUpgrade", "AresUpgrade", "ArtemisUpgrade", "DionysusUpgrade", "DemeterUpgrade" },
				RequiredOneOfTraits = { "ForceZeusBoonTrait", "ForcePoseidonBoonTrait", "ForceAthenaBoonTrait", "ForceAresBoonTrait", "ForceAphroditeBoonTrait", "ForceArtemisBoonTrait", "ForceDionysusBoonTrait", "ForceDemeterBoonTrait" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0166",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Afraid your regularly scheduled Olympian could not be here right now, because I'm that much faster, boss!" },
			},
			HephaestusExpectingMiscOlympian02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredMinAnyTextLines = { TextLines = { "HephaestusExpectingZeus01", "HephaestusExpectingPoseidon01", "HephaestusExpectingAthena01", "HephaestusExpectingAphrodite01", "HephaestusExpectingAres01", "HephaestusExpectingArtemis01", "HephaestusExpectingDionysus01", "HephaestusExpectingDemeter01", }, Count = 2 },
				RequiredFalseGodLoots = { "ZeusUpgrade", "PoseidonUpgrade", "AthenaUpgrade", "AphroditeUpgrade", "AresUpgrade", "ArtemisUpgrade", "DionysusUpgrade", "DemeterUpgrade" },
				RequiredOneOfTraits = { "ForceZeusBoonTrait", "ForcePoseidonBoonTrait", "ForceAthenaBoonTrait", "ForceAresBoonTrait", "ForceAphroditeBoonTrait", "ForceArtemisBoonTrait", "ForceDionysusBoonTrait", "ForceDemeterBoonTrait" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0167",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You might have been expecting someone else, here, boss. But I just couldn't help beating them to the punch this time!" },
			},
			HephaestusExpectingMiscOlympian03 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				RequiredMinAnyTextLines = { TextLines = { "HephaestusExpectingZeus01", "HephaestusExpectingPoseidon01", "HephaestusExpectingAthena01", "HephaestusExpectingAphrodite01", "HephaestusExpectingAres01", "HephaestusExpectingArtemis01", "HephaestusExpectingDionysus01", "HephaestusExpectingDemeter01", }, Count = 2 },
				RequiredFalseGodLoots = { "ZeusUpgrade", "PoseidonUpgrade", "AthenaUpgrade", "AphroditeUpgrade", "AresUpgrade", "ArtemisUpgrade", "DionysusUpgrade", "DemeterUpgrade" },
				RequiredOneOfTraits = { "ForceZeusBoonTrait", "ForcePoseidonBoonTrait", "ForceAthenaBoonTrait", "ForceAresBoonTrait", "ForceAphroditeBoonTrait", "ForceArtemisBoonTrait", "ForceDionysusBoonTrait", "ForceDemeterBoonTrait" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0168",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Got here just as quickly as I could, Coz. Which turns out to be quite a bit faster than my relatives!" },
			},
			HephaestusExpectingMiscOlympian04 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredMinAnyTextLines = { TextLines = { "HephaestusExpectingZeus01", "HephaestusExpectingPoseidon01", "HephaestusExpectingAthena01", "HephaestusExpectingAphrodite01", "HephaestusExpectingAres01", "HephaestusExpectingArtemis01", "HephaestusExpectingDionysus01", "HephaestusExpectingDemeter01", }, Count = 2 },
				RequiredFalseGodLoots = { "ZeusUpgrade", "PoseidonUpgrade", "AthenaUpgrade", "AphroditeUpgrade", "AresUpgrade", "ArtemisUpgrade", "DionysusUpgrade", "DemeterUpgrade" },
				RequiredOneOfTraits = { "ForceZeusBoonTrait", "ForcePoseidonBoonTrait", "ForceAthenaBoonTrait", "ForceAresBoonTrait", "ForceAphroditeBoonTrait", "ForceArtemisBoonTrait", "ForceDionysusBoonTrait", "ForceDemeterBoonTrait" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0169",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I'm sure that keepsake that you brought will come in handy soon enough, there, boss!" },
			},
			HephaestusExpectingMiscOlympian05 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredMinAnyTextLines = { TextLines = { "HephaestusExpectingZeus01", "HephaestusExpectingPoseidon01", "HephaestusExpectingAthena01", "HephaestusExpectingAphrodite01", "HephaestusExpectingAres01", "HephaestusExpectingArtemis01", "HephaestusExpectingDionysus01", "HephaestusExpectingDemeter01", }, Count = 2 },
				RequiredFalseGodLoots = { "ZeusUpgrade", "PoseidonUpgrade", "AthenaUpgrade", "AphroditeUpgrade", "AresUpgrade", "ArtemisUpgrade", "DionysusUpgrade", "DemeterUpgrade" },
				RequiredOneOfTraits = { "ForceZeusBoonTrait", "ForcePoseidonBoonTrait", "ForceAthenaBoonTrait", "ForceAresBoonTrait", "ForceAphroditeBoonTrait", "ForceArtemisBoonTrait", "ForceDionysusBoonTrait", "ForceDemeterBoonTrait" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0170",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "My relatives are normally quite quick to heed the call of anybody bearing one of their keepsakes! Huh!" },
			},
			HephaestusExpectingMiscOlympian06 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredMinAnyTextLines = { TextLines = { "HephaestusExpectingZeus01", "HephaestusExpectingPoseidon01", "HephaestusExpectingAthena01", "HephaestusExpectingAphrodite01", "HephaestusExpectingAres01", "HephaestusExpectingArtemis01", "HephaestusExpectingDionysus01", "HephaestusExpectingDemeter01", }, Count = 2 },
				RequiredFalseGodLoots = { "ZeusUpgrade", "PoseidonUpgrade", "AthenaUpgrade", "AphroditeUpgrade", "AresUpgrade", "ArtemisUpgrade", "DionysusUpgrade", "DemeterUpgrade" },
				RequiredOneOfTraits = { "ForceZeusBoonTrait", "ForcePoseidonBoonTrait", "ForceAthenaBoonTrait", "ForceAresBoonTrait", "ForceAphroditeBoonTrait", "ForceArtemisBoonTrait", "ForceDionysusBoonTrait", "ForceDemeterBoonTrait" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0171",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I may not be the god you're looking for right at the moment, boss, but I will get you on your way to them in no time here!" },
			},

			-- about other gods
			HephaestusAboutZeus01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				RequiredGodLoot = "ZeusUpgrade",
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,

				{ Cue = "/VO/Hephaestus_0053",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You heard already from my pop, haven't you, Coz? Wonderful guy. Don't get to spend a lot of time together, though! You know how that is. Well, see you!" },
			},
			HephaestusAboutZeus02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusAboutZeus01" },
				RequiredGodLoot = "ZeusUpgrade",
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,

				{ Cue = "/VO/Hephaestus_0223",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You know, Coz, my pop never gives his lightning blessings to me! He's quite invested in what happens to you, isn't he?" },
			},
			HephaestusAboutPoseidon01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				RequiredGodLoot = "PoseidonUpgrade",
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,

				{ Cue = "/VO/Hephaestus_0054",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Want to bring you in on something, boss. Reason that Uncle Poseidon got to you before I did is, I let him. He's under the impression he's as spry as ever! {#DialogueItalicFormat}Hah!{#PreviousFormat}" },
			},
			HephaestusAboutAthena01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				RequiredGodLoot = "AthenaUpgrade",
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,

				{ Cue = "/VO/Hephaestus_0055",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "So then Athena's looking out for you, that's good, that's good! She likes to put a lot of thought and stuff in everything, it's all a little much, if you ask me!" },
			},
			HephaestusAboutAres01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				RequiredGodLoot = "AresUpgrade",
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,

				{ Cue = "/VO/Hephaestus_0056",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You know who keeps me awful busy, Coz? Ares. Nothing like a good old war amongst the mortals to create demand for lots and lots of messages to go around!" },
			},
			HephaestusAboutArtemis01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				RequiredGodLoot = "ArtemisUpgrade",
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,

				{ Cue = "/VO/Hephaestus_0057",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Did Artemis manage to locate you already, boss? She's pretty good at that, I have to say. I'm faster! But she's fast, she's pretty fast, all right." },
			},
			HephaestusAboutAphrodite01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				RequiredGodLoot = "AphroditeUpgrade",
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,

				{ Cue = "/VO/Hephaestus_0058",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Aphrodite's really something, don't you think so, Coz? Normally I'd stop for no one here. But when it comes to her, exceptions must be made!" },
			},
			HephaestusAboutDionysus01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				RequiredGodLoot = "DionysusUpgrade",
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,

				{ Cue = "/VO/Hephaestus_0059",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You ever get the feeling life's been moving all too quickly for you, boss? Well Dionysus doesn't, as you're probably aware. Throws quite a feast, though!" },
			},
			HephaestusAboutDemeter01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp", "DemeterGift01" },
				RequiredFalseFlags = { "PersephoneAway" },
				RequiredGodLoot = "DemeterUpgrade",
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,

				{ Cue = "/VO/Hephaestus_0159",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Been downright chilly up here lately, Coz! We've Demeter to thank for that! Me, I try to stay out of her way, she doesn't think I'm of much help to her. Although I'm sure she's warmed to you at least!" },
			},
			HephaestusAboutHadesKeepsake01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp", "OlympianReunionQuestComplete" },
				RequiredTrait = "HadesShoutKeepsake",
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,

				{ Cue = "/VO/Hephaestus_0235",
					Emote = "PortraitEmoteSurprise",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Say, isn't that your father's blessing on you, Coz?! I almost can't believe it, but you've done such a good job of things, how could he {#DialogueItalicFormat}not {#PreviousFormat}approve?" },
			},

			HephaestusBackstory01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0004",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Whoa, what's good, there, Coz? Though, who am I kidding, we can cut the small talk. I don't mind. I interrupt my brothers and my sisters all the time!" },
			},
			HephaestusBackstory02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0067",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Boss, you've probably caught yourself thinking: {#DialogueItalicFormat}Hephaestus sure is quick! So how come it took so long for him to show up in the first place? {#PreviousFormat}Well, I'm afraid that's not for you to know. But! It's not because I was late. Not late for anything." },
			},
			HephaestusBackstory03 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusBackstory01", "HephaestusBackstory02" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0068",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hey, uh, could you do a little favor for me, Coz? My brothers, sisters, family, and whatnot, they're unaware I'm working with you, here. It's no big deal, but let's keep it that way for now. All right?" },
			},
			HephaestusBackstory04 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp", "HephaestusLootBought02" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0069",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Happened to be in the area, boss! Seeing as the mortal folk up here keep dying off, and someone's got to bring their souls to your domain, now, don't they." },
			},
			HephaestusBackstory05 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusGift05" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0072",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Know that saying {#DialogueItalicFormat}'don't be hasty'{#PreviousFormat}, boss? That comes from me. I swear! A little way to stave off competition, masquerading as the wisdom of a sage. Those stupid mortals will buy anything!" },
			},
			HephaestusBackstory06 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusBackstory03", "HephaestusGift02" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0193",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Not that I really know {#DialogueItalicFormat}exactly {#PreviousFormat}what you're up to, Coz, but! If I did, I don't think anybody on Olympus is aware of it. Or, if they are, they're keeping their mouths shut. The same as me!" },
			},
			HephaestusBackstory07 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusBackstory02", "HephaestusGift04" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0214",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You ever wonder how I got this fast, Coz? Lots of practicing, I'll tell you that! And being born unnaturally quick, I guess!" },
			},

			HephaestusAboutSkinnyLittleChap01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				-- these requirements are purely coincidental to the content of this event
				RequiredAnyTextLines = { "HephaestusAboutSecretService01", "SkellyBackstory03", "SkellyGift09", "HephaestusGift08" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0195",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Once took a skinny little chap down to the Underworld, got the business end of a sharp spear, he did! He had it coming, though, a lot of lying, cheating, and the like. Last that I heard, he's still making his amends down there. {#DialogueItalicFormat}Eh{#PreviousFormat}!" },
			},

			HephaestusAboutSkelly02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredAnyTextLines = { "SkellyAboutSources01", },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0118",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Boss, I know you've heard a certain rumor from a very skinny individual who's uninclined to move. You best keep that one to yourself, all right? Or else our jig is up, and your father wouldn't like that, nor would you. So, cheers!" },
			},
			HephaestusAboutSkelly03 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusAboutSkelly01", "HephaestusGift05", "SkellyGift09" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0196",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Say, you're in good with what's-his-name, the one who gave you his lucky tooth? So he's an all-right sort, then. Has to be, if you put up with him!" },
			},
			HephaestusAboutSecretService01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredAnyTextLines = { "SkellyAboutSources02" },
				RequiredFalseTextLinesLastRun = { "SkellyAboutSources02" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0165",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "So, now you've found me out, haven't you, Coz? Heard from the big boat-man himself. Well, good! We're pleased to be of service. And {#DialogueItalicFormat}we've {#PreviousFormat}got a lot of dirt on {#DialogueItalicFormat}you{#PreviousFormat}, so you be sure to keep our secrets, too. All right?" },
			},
			HephaestusAboutSecretService02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "Ending01", "HephaestusGift08", "CharonGift07" },
				RequiredAnyTextLines = { "HephaestusLootBought01", "HephaestusLootBought01_B", "HephaestusAboutHourglass01" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0231",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "So my professional associate, the fearsome boatman on the River Styx? You got to know him pretty well in all of this, right, Coz? Hard getting through to him, I know, but his heart's in the right place! It's why I'm working with him, after all this time!" },
			},

			HephaestusAboutMegRelationship01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp", "HephaestusGift03" },
				RequiredAnyTextLines = { "BecameCloseWithMegaera01Meg_GoToHer", "BecameCloseWithMegaera01_BMeg_GoToHer" },
				MinRunsSinceAnyTextLines = { TextLines = { "BecameCloseWithMegaera01Meg_GoToHer", "BecameCloseWithMegaera01_BMeg_GoToHer" }, Count = 2 },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0194",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Heard you've been seeing the Fury, Megaera, Coz? Got the impression she was quite a handful, though I guess the same can probably be said of you, there, huh? You two have fun!" },
			},

			HephaestusAboutCharonFight01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredAnyTextLines = { "HephaestusLootBought01", "HephaestusLootBought01_B", "HephaestusAboutHourglass01" },
				RequiredSeenRooms = { "CharonFight01" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0197",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I can't believe you got into a fight with my professional associate, you daft or something, Coz? Just about everybody that I know, they're all at least a little bit afraid of that one and his boat, yet you think you can take him, huh?" },
			},
			HephaestusAboutCharonFight02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusAboutCharonFight01", "BossCharonOutro01" },
				RequiredFalseTextLines = { "HephaestusBeatCharonQuestComplete" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0198",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "So you took on my good professional associate, is that right, Coz? And you beat the big boatman himself! I knew you were pretty tough, but not {#DialogueItalicFormat}that {#PreviousFormat}tough! Impressive work! He's impressed, too. He isn't even mad!" },
			},

			HephaestusBeatCharonQuest01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusAboutCharonFight01", "HephaestusGift03" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0199",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hey, uh, so I kind of placed a bet with the old boatman, my associate that is, that you could beat him in a fight, twice in a row! No pressure, or anything, but just in case you prove me right one of these days, I would appreciate it, Coz!" },
			},

			HephaestusMessage01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusBackstory03", "HephaestusSecondPickUp", },
				RequiredFalseTextLinesLastRun = { "HephaestusMessage01", "HephaestusMessage02", "HephaestusMessage03", "HephaestusMessage04", "HephaestusMessage05", "HephaestusMessage06" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0073",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Message from Olympus for you, boss! It says, {#DialogueItalicFormat}'It sure is nice up here upon this mountain, not having to escape the Underworld! Come join us soon, won't you?'{#PreviousFormat}" },
			},
			HephaestusMessage02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusMessage01", },
				RequiredFalseTextLinesLastRun = { "HephaestusMessage01", "HephaestusMessage02", "HephaestusMessage03", "HephaestusMessage04", "HephaestusMessage05", "HephaestusMessage06" },
				RequiresLastRunNotCleared = true,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0074",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Message for you, boss. It says, {#DialogueItalicFormat}'You're rather slow. If only somebody could help you out with that.' {#PreviousFormat}Huh, fancy that, what a coincidence!" },
			},

			HephaestusMessage03 =
			{
				Priority = true,
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusMessage01", },
				RequiredFalseTextLinesLastRun = { "HephaestusMessage01", "HephaestusMessage02", "HephaestusMessage03", "HephaestusMessage04", "HephaestusMessage05", "HephaestusMessage06" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				RequiredMinCompletedRuns = 20,
				RequiresLastRunNotCleared = true,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0075",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Got you a message, Coz. Says here, {#DialogueItalicFormat}ahem{#PreviousFormat}: {#DialogueItalicFormat}'Hurry up and get out of there already.' {#PreviousFormat}It's from the surface of the earth, says so right here." },
			},
			HephaestusMessage04 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusMessage01", },
				RequiredFalseTextLinesLastRun = { "HephaestusMessage01", "HephaestusMessage02", "HephaestusMessage03", "HephaestusMessage04", "HephaestusMessage05", "HephaestusMessage06" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0158",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Another message here! It says, {#DialogueItalicFormat}'One small spoon dried oregano, two spoons extra virgin olive oil, one large onion, minced, a dash of salt to taste,' {#PreviousFormat}wait, this isn't for you. Though you should try it sometime if you ever make it out!" },
			},

			HephaestusMessage05 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusMessage01", },
				RequiredAnyTextLines = { "HephaestusGift07", "HephaestusGift07B" },
				RequiredFalseTextLinesLastRun = { "HephaestusMessage01", "HephaestusMessage02", "HephaestusMessage03", "HephaestusMessage04", "HephaestusMessage05", "HephaestusMessage06" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0176",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Message for you, Coz, it says, {#DialogueItalicFormat}'On behalf of all Olympus, we would like for you to know that was a right good bottle of Ambrosia that you offered to the god of travel, Hephaestus, who appreciated every drop.' {#PreviousFormat}Sincerely, me!" },
			},
			HephaestusMessage06 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusMessage01", },
				RequiredAnyTextLines = { "HephaestusGift08", "HephaestusGift08B" },
				RequiredFalseTextLinesLastRun = { "HephaestusMessage01", "HephaestusMessage02", "HephaestusMessage03", "HephaestusMessage04", "HephaestusMessage05", "HephaestusMessage06" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0177",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Another message for you, Coz, this one says, {#DialogueItalicFormat}'Hey, mate! If you ever do make it up here up on this mountaintop for whatever reason, we should hang out, all right? I can show you around.' {#PreviousFormat} Your friend, Hephaestus." },
			},
			HephaestusMaxRelationship01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredAnyTextLines = { "HephaestusMessage06" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0178",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You know, boss, just between us? Out of all special delivery recipients I've had over the ages, here, I've got to say, you're the most interesting one!" },
			},

			HephaestusRunProgress01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp", "HephaestusLootBought02" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0070",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You know, Coz, all this time that I've been bussing souls across the borders of your father's land, it's good to have the chance to help somebody out the other way!" },
			},

			HephaestusSquelch01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusBackstory05", "HephaestusMessage01", "HephaestusMessage02" },
				{ Cue = "/VO/Hephaestus_0078",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hey, Coz, you're now well accustomed to our little chats, but I want you to level with me here. You're the boss, if you prefer, I would be happy to shut up, no harm no foul. Just give the signal, hey?" },
				{
					Text = "Hephaestus_OfferText01",
					Choices =
					{
						{
							ChoiceText = "Squelch_KeepTalking",
							{ Cue = "/VO/ZagreusField_1951", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
								Text = "Perish the thought, Lord Hephaestus. It's been great hearing from you from time to time." },
							{ Cue = "/VO/Hephaestus_0079",
								StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
								Text = "Well, all right, boss. Just making sure that I'm not interrupting anything!" },
						},
						{
							ChoiceText = "Squelch_BeQuietAWhile",
							{ Cue = "/VO/ZagreusField_1952", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
								Text = "Now that you mention it, Lord Hephaestus, yes, let's keep our interactions nice and quick." },
							{ Cue = "/VO/Hephaestus_0080",
								StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
								PostLineFunctionName = "SquelchHephaestus",
								Text = "I hear you, boss, we'll cut straight to the chase next time, all right?" },
						},
					},
				},
			},
			HephaestusSquelch02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				Priority = true,
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSquelch01Squelch_BeQuietAWhile" },
				{ Cue = "/VO/Hephaestus_0081",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Ahem{#PreviousFormat}! Pardon the interruption, boss. You let me know if you prefer that I pipe up again next time, more like I used to!" },
				{
					Text = "Hephaestus_OfferText02",
					Choices =
					{
						{
							ChoiceText = "Squelch_ResumeTalking",
							{ Cue = "/VO/ZagreusField_1953", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
								Text = "I miss hearing from you, Hephaestus. Let's carry on like we did before." },
							{ Cue = "/VO/Hephaestus_0082",
								StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
								Text = "{#DialogueItalicFormat}Hah{#PreviousFormat}, sure thing, boss. It's good to have a chat from time to time!" },
						},
						{
							ChoiceText = "Squelch_KeepQuiet",
							{ Cue = "/VO/ZagreusField_1954", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
								Text = "Appreciate you checking in, Lord Hephaestus. I think we should keep at it like we have been, nice and quiet." },
							{ Cue = "/VO/Hephaestus_0083",
								StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
								PostLineFunctionName = "SquelchHephaestus",
								Text = "No problem whatsoever, boss. Just checking in." },
						},
					},
				},
			},
			-- if you squelched him variant
			HephaestusSquelch03 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				Priority = true,
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSquelch01Squelch_BeQuietAWhile" },
				RequiredFalseTextLines = { "HephaestusSquelch03B" },
				RequiredMinCompletedRuns = 80,
				{ Cue = "/VO/Hephaestus_0084",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Thought I'd check in again real quick, there, boss. You want my witty conversation next time, or straight to the Boons?" },
				{
					Text = "Hephaestus_OfferText03",
					Choices =
					{
						{
							ChoiceText = "Squelch_ResumeTalking",
							{ Cue = "/VO/ZagreusField_1955", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
								Text = "You know, yes, let's go back to having witty conversation from you, Hephaestus. That sounds great." },
							{ Cue = "/VO/Hephaestus_0085",
								StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
								Text = "{#DialogueItalicFormat}Hah{#PreviousFormat}, good! I like these little chats! Take care, now, boss." },
						},
						{
							ChoiceText = "Squelch_KeepQuiet",
							{ Cue = "/VO/ZagreusField_1956", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
								Text = "Straight to the Boons, Lord Hephaestus. We both appreciate cutting straight to the chase." },
							{ Cue = "/VO/Hephaestus_0086",
								StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
								PostLineFunctionName = "SquelchHephaestus", PostLineFunctionArgs = { Permanent = true, },
								Text = "I get it, boss. Words are too slow, aren't they. Won't bother you again word-wise, but I'll be seeing you!" },
						},
					},
				},
			},
			-- if you did not squelch him
			HephaestusSquelch03B =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				Priority = true,
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSquelch01" },
				RequiredFalseTextLines = { "HephaestusSquelch03" },
				RequiredMinCompletedRuns = 80,
				{ Cue = "/VO/Hephaestus_0084",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Thought I'd check in again real quick, there, boss. You want my witty conversation next time, or straight to the Boons?" },
				{
					Text = "Hephaestus_OfferText01",
					Choices =
					{
						{
							ChoiceText = "Squelch_KeepTalking",
							{ Cue = "/VO/ZagreusField_2711", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
								Text = "Definitely witty conversation, Lord Hephaestus. Boons are more than welcome after that." },
							{ Cue = "/VO/Hephaestus_0085",
								StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
								Text = "{#DialogueItalicFormat}Hah{#PreviousFormat}! Good, I like these little chats! Take care, now, boss." },
						},
						{
							ChoiceText = "Squelch_BeQuietAWhile",
							{ Cue = "/VO/ZagreusField_1956", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
								Text = "Straight to the Boons, Lord Hephaestus. We both appreciate cutting straight to the chase." },
							{ Cue = "/VO/Hephaestus_0086",
								StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
								PostLineFunctionName = "SquelchHephaestus",
								Text = "I get it, boss. Words are too slow, aren't they. Won't bother you again word-wise, but I'll be seeing you!" },
						},
					},
				},
			},

			HephaestusAboutHades01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp", "HadesAboutCharon01" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0071",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Met your father face to face only the one time, Coz. Despite rendering services to him for quite a while. Memorable experience, I'll give it that! Seems like he's not done anything with all the messages my side keeps sending him." },
			},

			HephaestusAboutThanatos01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp", "ThanatosGift06" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0076",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You're pretty close with Thanatos, aren't you, boss? We don't often run in the same lanes, though our duties sometimes intersect a bit. Odd chap. Seems good at what he does, though!" },
			},
			HephaestusAboutThanatos02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusAboutThanatos01", },
				RequiredAnyTextLines = { "BecameCloseWithThanatos01", "BecameCloseWithThanatos01_B" },
				MinRunsSinceAnyTextLines = { TextLines = { "ThanatosAboutRelationship02" }, Count = 2 },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0157",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Saw Thanatos again lately, here, boss, and want to tell you, almost looked as though he cracked a smile when he mentioned you! Never seen anything like that with him!" },
			},

			HephaestusAboutOrpheus01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "OrpheusGift02", "HephaestusGift02" },
				RequiredMinNPCInteractions = { NPC_Orpheus_01 = 10 },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0121",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I hear you're close with Orpheus down there, you get the chance, you tell him I said hey! He's pretty decent with that lyre of his, last time I checked." },
			},

			HephaestusAboutEurydice01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusGift03", "HephaestusAboutOrpheus01" },
				RequiredAnyTextLines = { "EurydiceAboutOrpheus01", "EurydiceAboutOrpheus01_B" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0224",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hey boss, in all your travels there, you happen to run into a lass by name Eurydice? Hope she's all right! I feel bad because we didn't get a proper send-off last we met." },
			},
			HephaestusAboutEurydice02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "EurydiceAboutHephaestus01" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0120",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I caught wind you found Eurydice down there, that's great! Long as she's on the up and up, I can eject her from the tiny worry center of my mind." },
			},

			HephaestusAboutHourglass01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp", },
				RequiredTrait = "ShopDurationTrait",
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0116",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "That's quite a nice Bone Hourglass you got, there, boss! So you're in good with my professional associate, as well. A real gentleman!" },
			},

			HephaestusAboutPlume01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp", },
				RequiredTrait = "FastClearDodgeBonusTrait",
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0114",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Why, look at you, there, boss! I recognize that fancy plume you got! Just an iota of my speediness in there, but still! Much more than most can do." },
			},

			HephaestusAboutWhippedFrenzy01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredMinActiveMetaUpgradeLevel = { Name = "EnemySpeedShrineUpgrade", Count = 2 },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0077",
					Emote = "PortraitEmoteSurprise",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Whoa, what's gotten into all those lifeless wretches that you're always fighting with down there? They're really moving lately! Whatever's made them go all out, it wasn't me!" },
			},
			HephaestusAboutEnemySpeedCondition01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp", },
				RequiredActiveMetaUpgrade = "EnemySpeedShrineUpgrade",
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0188",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Got all your father's lifeless wretches hot and bothered, going all out all because of that {#DialogueItalicFormat}Forced Overtime {#PreviousFormat}condition of his, isn't that right, Coz? Well, if they're interested in getting things done quickly, I am sure you can oblige them in a bit!" },
			},
			HephaestusAboutEnemySpeedCondition02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusAboutWhippedFrenzy01", },
				RequiredMinActiveMetaUpgradeLevel = { Name = "EnemySpeedShrineUpgrade", Count = 2 },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0189",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Looks like those lifeless wretches you're contending with down there are {#DialogueItalicFormat}really {#PreviousFormat}on the move this time around, aren't they, boss? Oh, well, you're faster still, I'm sure!" },
			},

			HephaestusAboutBiomeSpeedCondition01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusAboutWhippedFrenzy01", },
				RequiredActiveMetaUpgrade = "BiomeSpeedShrineUpgrade",
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0190",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Somebody's on a tight deadline, I take it, Coz? Courtesy of your father's Pact, well, you believe me, I know how that is, so I won't keep you, just keep moving, right?" },
			},
			HephaestusAboutBiomeSpeedCondition02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusAboutWhippedFrenzy03", },
				RequiredActiveMetaUpgrade = "BiomeSpeedShrineUpgrade",
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0191",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I realize you're on a tight deadline, there, boss, so let's dispense with all unnecessary chit-chat here and get you on your merry way, posthaste!" },
			},
			HephaestusAboutBiomeSpeedCondition03 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusAboutWhippedFrenzy01", },
				RequiredActiveMetaUpgrade = "BiomeSpeedShrineUpgrade",
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0192",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You racing against time to keep things interesting, or what, there, boss? Turns out that time goes pretty quick. I like racing against it, too!" },
			},

			-- speed running
			HephaestusAboutTimer01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp", },
				RequiredTrueConfigOptions = { "ShowGameplayTimer", },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0087",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Hah! {#PreviousFormat}Can't help but notice you've been timing yourself, boss! Good habit that. Keep an eye on the time, you'll get faster and faster! Not as fast as me, mind." },
			},
			HephaestusAboutTimer02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusAboutTimer01", },
				RequiredTrueConfigOptions = { "ShowGameplayTimer", },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0088",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You know, Coz, since you're timing yourself, case you haven't noticed, doesn't count against you when we stop to have these chats! Insisted on that little rule myself." },
			},
			HephaestusAboutTimer03 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusAboutTimer01", },
				RequiredFalseConfigOptions = { "ShowGameplayTimer", },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0089",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hey, you stopped timing yourself, boss, everything all right? If that's not a cry for help, well, I don't know what is. Um, here!" },
			},
			HephaestusAboutTimer04 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusAboutTimer01", "HephaestusAboutTimer03" },
				RequiredTrueConfigOptions = { "ShowGameplayTimer", },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0090",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Good, boss, I can see you're clocking yourself once again. Little term I like to use, means beating yourself up whilst keeping time!" },
			},
			HephaestusAboutTimer05 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusAboutTimer04", },
				RequiredFalseConfigOptions = { "ShowGameplayTimer", },
				{ Cue = "/VO/Hephaestus_0091",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Look, Coz, if you aren't always going to time yourself, that is a choice of lifestyle I have to respect. And learn to understand." },
			},

			-- run clears
			HephaestusFirstRunCleared01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp", "PersephoneFirstMeeting" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0164",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Another message from Olympus, boss. This goes, {#DialogueItalicFormat}'Zagreus, take absolutely all the time you need making your way to us; we know the going must be treacherous, and we assure you our support, however long it takes.' {#PreviousFormat}Well, how about that!" },
			},

			HephaestusRunCleared01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiresLastRunCleared = true,
				RequiredMinRunsCleared = 2,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0109",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Heard you got through pretty quick last time! Not bad, not bad!" },
			},
			HephaestusRunCleared02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiresLastRunCleared = true,
				RequiredMinRunsCleared = 3,
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0225",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You'd think that once you break free to the surface we could see you from Olympus a bit more than usual, but no! It's like you're shrouded in eternal night up here, hm? Something like that. Odd, right?" },
			},

			HephaestusRunClearedNewRecord01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstRunCleared01", },
				RequiresLastRunCleared = true,
				RequiresBestClearTimeLastRun = true,
				RequiredMinRunsCleared = 2,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0110",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hey, you beat your fastest time fighting through all of that! Not that I'm keeping track! I'm keeping track." },
			},
			HephaestusRunClearedNewRecord02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusRunClearedNewRecord01" },
				RequiresLastRunCleared = true,
				RequiresBestClearTimeLastRun = true,
				RequiredMinRunsCleared = 2,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0111",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hey Coz, that last run-through that you did, I almost can't believe how quick you pulled that off! You're really pretty good!" },
			},
			HephaestusRunClearedNewRecord03 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusRunClearedNewRecord02" },
				RequiresLastRunCleared = true,
				RequiresBestClearTimeLastRun = true,
				RequiredMinRunsCleared = 2,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0215",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hey, you got out of there in practically no time at all before! Let's see if you can have another go like that!" },
			},
			HephaestusRunClearedNewRecord04 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusRunClearedNewRecord03" },
				RequiresLastRunCleared = true,
				RequiresBestClearTimeLastRun = true,
				RequiredMinRunsCleared = 2,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0216",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You're getting faster, Coz, keep at it, just like that! Can always go a little faster than before is what I always say!" },
			},
			HephaestusRunClearedNewRecord05 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusRunClearedNewRecord04" },
				RequiresLastRunCleared = true,
				RequiresBestClearTimeLastRun = true,
				RequiredMinRunsCleared = 2,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0217",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hey, Coz, looks to me you beat your fastest time climbing up out of there! That's nicely done! Can you go faster still?" },
			},
			HephaestusRunClearedNewRecord06 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusRunClearedNewRecord05" },
				RequiresLastRunCleared = true,
				RequiresBestClearTimeLastRun = true,
				RequiredMinRunsCleared = 2,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0218",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "What do you know, you beat your personal best time escaping recently! I hope my blessing helped a bit with that!" },
			},

			HephaestusRunClearStreak01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp", },
				RequiresLastRunCleared = true,
				RequiredMinConsecutiveClears = 3,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0112",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Well look at you, Coz! Rushing to victory after successive victory. Caught wind of your accomplishments down there! Well then, let's keep the streak alive!" },
			},
			HephaestusRunClearStreakBroken01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusRunClearStreak01", },
				RequiresLastRunNotCleared = true,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0113",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Heard the news you broke your streak of victories of late, boss. Happens, right? You seem the sort to bounce right back, though. Let me help with that!" },
			},

			HephaestusPostEnding01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "Ending01", "HephaestusGift04" },
				MinRunsSinceAnyTextLines = { TextLines = { "Ending01" }, Count = 2 },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0232",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "So {#DialogueItalicFormat}you {#PreviousFormat}get to keep breaking out of there, time after time, so that {#DialogueItalicFormat}your father {#PreviousFormat}can keep finding ways to make it even harder to escape? Something like that? Sounds like an interesting assignment, Coz!" },
			},

			HephaestusPostEpilogue02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "OlympianReunionQuestComplete", },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0228",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Everybody on Olympus, they're still going on about Persephone, Queen of the Underworld! They had no idea she was down there all along, none whatsoever, Coz! And as for me, now I can deliver you my blessings more officially, I think!" },
			},
			HephaestusPostEpilogue03 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "OlympianReunionQuestComplete", "HephaestusGift03" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0229",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Even though everything's out in the open, now, and all my brothers, sisters, and whatnot are going to keep helping you fight your way out of there, I've still been keeping to myself, of late! That way nobody slows me down." },
			},
			HephaestusPostEpilogue04 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "OlympianReunionQuestComplete", "HephaestusGift04" },
				MinRunsSinceAnyTextLines = { TextLines = { "OlympianReunionQuestComplete" }, Count = 3 },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0230",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Some members of the family up here, I know they haven't helped at all, but just don't take it personal or anything, all right? Think of it this way: You've got more of us getting along and talking properly than I have ever {#DialogueItalicFormat}seen{#PreviousFormat}!" },
			},

			HephaestusAboutPersephoneVisit01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "OlympianReunionQuestComplete" },
				RequiredTrueFlags = { "PersephoneAway" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0233",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Your mother got from there just fine, don't worry, Coz! She had me looking after her, and such. Seemed real nice! Told me to tell you hi." },
			},
			HephaestusAboutPersephoneVisit02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "OlympianReunionQuestComplete" },
				RequiredTrueFlags = { "PersephoneAway" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0234",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You know, I never knew the pomegranate seeds down in the Underworld held such power if not for your mother mentioning it, Coz! And here I thought they were just tasty, that was it!" },
			},

			HephaestusAboutHearing01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				RequiredTextLines = { "HephaestusGift01" },
				RequiresLastRunNotCleared = true,
				RequiredFalseRooms = { "RoomOpening" },
				{ Cue = "/VO/Hephaestus_0204",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Thought I'd check up on you, there, boss. You doing well, everything good and all? Can't hear you one iota, mind, so then, don't answer that!" },
			},

			HephaestusAboutHurrying01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				RequiredTextLines = { "HephaestusGift05" },
				RequiredFalseConfigOptions = { "ShowGameplayTimer", },
				RequiredInactiveMetaUpgrade = "BiomeSpeedShrineUpgrade",

				{ Cue = "/VO/Hephaestus_0205",
					Emote = "PortraitEmoteFiredUp",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Come quickly, boss! You need to hurry up and get out of there, you're running out of time!! You're not, really, but it's a bit of motivation, hey?" },
			},

			-- legendary pickups
			HephaestusLegendaryPickUp01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp" },
				ValuableUpgradeInRoom = {
					AllAtLeastRarity = "Rare",
					HasAtLeastRarity = "Epic",
				},
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0099",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Oh, you ready for this, boss? Got you the {#DialogueItalicFormat}Premium Express {#PreviousFormat}this time. Absolute cream of the crop right here! You're going to go real far." },
			},
			HephaestusLegendaryPickUp02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				ValuableUpgradeInRoom = {
					AllAtLeastRarity = "Rare",
					HasAtLeastRarity = "Epic",
				},
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0100",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Guess what, Coz? It's the {#DialogueItalicFormat}Premium Express{#PreviousFormat}, delivered straight to you, fresh from the richest mountaintop up here! You're going to like this." },
			},
			HephaestusLegendaryPickUp03 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				ValuableUpgradeInRoom = {
					AllAtLeastRarity = "Rare",
					HasAtLeastRarity = "Epic",
				},
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0101",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Express-delivered message for you, Coz. It says: {#DialogueItalicFormat}'Congratulations! You're my hundredth customer today.' {#PreviousFormat}And here is what you get!" },
			},

			-- low health
			HephaestusLowHealth01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0092",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Eugh, I have to tell you, you look awful, Coz. You're barely holding on! Let's see if we can't perk you right back up." },
			},
			HephaestusLowHealth02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0093",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Whew{#PreviousFormat}! Looks like times hit you hard since last we had a run-in, Coz. Well, when life is tough, just hurry through the rubbish bits, I say!" },
			},
			HephaestusLowHealth03 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0094",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Whoa you're a hot mess, there, Coz, what happened getting here? Ah well, I hope your travels run a little smoother here on out." },
			},
			HephaestusLowHealth04 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0219",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "There's a fine line between being quick and being hasty, boss. And if you're hurt as bad as I think, I think you might be on the hasty side!" },
			},
			HephaestusLowHealth05 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0220",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Well, good news is you got to me, but I can tell you hit a lot of bad news on the way! You stay alive, all right?" },
			},
			HephaestusLowHealth06 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0221",
					Emote = "PortraitEmoteSurprise",					
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Oof{#PreviousFormat}! What happened getting here, boss? Let me guess, you got whipped, burned, beat up with spectral clubs... something like that?" },
			},
			HephaestusLowHealth07 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0222",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You're looking worse for wear, I hate to tell you, boss. But, we can pick you up and get you going here, I think!" },
			},

		},

		PickupTextLineSets =
		{
			HephaestusFirstPickUp =
			{
				PlayOnce = true,
				RequiredTextLines = { "AthenaFirstPickUp", },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/ZagreusField_1923", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 3.05 },
					PostLineAnim = "ZagreusInteractEquip", PostLineAnimTarget = "Hero", PostLineFunctionName = "BoonInteractPresentation",
					Text = "This mark, almost like a bat wing. In the name of Hades! Olympus! I accept this message." },
				{ Cue = "/VO/Hephaestus_0002",
					PortraitExitWait = 1.25,
					PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
					UseEventEndSound = true,
					Text = "Hey boss, found you, good. Hephaestus, at your service. Pleasure! You are the talk of Olympus! Normally I wouldn't get mixed up, but for you, I will be making an exception. Now, come on, we both got places to be!" },
			},

			HephaestusMiscPickup01 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0027",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "All right, Coz, here's the goods, fresh from our mountaintop. Take all the time you need deciding! If you want to be a slowpoke." },
			},
			HephaestusMiscPickup02 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp", },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0028",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Won't need but a moment of your time, here, boss! And you'll more than make up for it right quick, you got my guarantee!" },
			},
			HephaestusMiscPickup03 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				RequiredFalseBiome = "Tartarus",
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0029",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "All right, Coz, express delivery to {#DialogueItalicFormat}where{#PreviousFormat}-in-blazes are you at right now? Anyway take one of these, and go about your business!" },
			},
			HephaestusMiscPickup04 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp", },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0030",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I know you're kind of in a hurry, boss. But let me show you what a {#DialogueItalicFormat}real {#PreviousFormat}hurry's all about in just a moment here!" },
			},
			HephaestusMiscPickup05 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0031",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Package for you, boss! And I think you know what's inside. Well, maybe not exactly, but... just pick something, will you?" },
			},
			HephaestusMiscPickup06 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0032",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Come on, Coz, you can do this! And furthermore, I think you can do this rather quick! Now go!" },
			},
			HephaestusMiscPickup07 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp", },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0033",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "It's you, boss, that's good! But you're standing still! That's bad. Let's get you up and moving about again, all right?" },
			},
			HephaestusMiscPickup08 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp", },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0034",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hey, boss! Not much to report up here. But I've not exactly come this far to bring you news, have I?" },
			},
			HephaestusMiscPickup09 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0035",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Afraid there's no one faster than myself, here, Coz. But good news is, {#DialogueItalicFormat}you {#PreviousFormat}are about to close the gap a little bit!" },
			},
			HephaestusMiscPickup10 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0036",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Slow day so far, there, boss? Well all of that's about to change, you got my guarantee!" },
			},
			HephaestusMiscPickup11 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp", },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0037",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "How 'bout we pick the pace up {#DialogueItalicFormat}just {#PreviousFormat}a little, Coz? Or maybe by a lot! Whatever you've the mood and stomach for right now." },
			},
			HephaestusMiscPickup12 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0038",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Last thing I ever want to do is slow you down, boss. So, enough chit-chat. Now pick and go. {#DialogueItalicFormat}Go{#PreviousFormat}!" },
			},
			HephaestusMiscPickup13 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp", },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0039",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You've got a ways to go yet, boss. Good news is, the slowest part of this particular trip is hereby over... {#DialogueItalicFormat}now{#PreviousFormat}!" },
			},
			HephaestusMiscPickup14 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0040",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "All's well enough here on the surface, Coz. Though, sooner you can make it out of there, the better it'll be!" },
			},
			HephaestusMiscPickup15 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp", },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0041",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Another go up to the surface, boss? Might suggest that you be very quick about it. And might give you this!" },
			},
			HephaestusMiscPickup16 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp", },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0042",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Let's hustle, shall we, boss? Honestly, I don't know how the rest of you can stand it, trudging about like you don't have someplace to be!" },
			},
			HephaestusMiscPickup17 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp", },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0043",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hiya, boss! I'd ask what's new, but I already know! I have my ways. And you have to get right on out of there." },
			},
			HephaestusMiscPickup18 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0044",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Wish I could just fly in and haul you out of there, Coz, but there's some rules even I can't break. Though nice to see {#DialogueItalicFormat}you {#PreviousFormat}have a go of it!" },
			},
			HephaestusMiscPickup19 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp", },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0045",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I come with urgent tidings, boss! Unfortunately not addressed to you. But someone got you these!" },
			},
			HephaestusMiscPickup20 =
			{
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0046",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Sorry, Coz, no messages this time. Guess that's what happens when your whole existence is kept secret from the world!" },
			},

			HephaestusMiscPickupExtra01 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredFalseRooms = { "RoomOpening" },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0202",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "There's not much new worth mentioning up here, though looks like {#DialogueItalicFormat}you {#PreviousFormat}have got your hands full down there, boss!" },
			},
			HephaestusMiscPickupExtra02 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0203",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You've got a tough climb up ahead, Coz, so you just pace yourself, all right? Just kidding, go as quickly as you can. It works for me!" },
			},

			HephaestusMiscPickup21 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0005",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Come on, now, boss, let's get you moving here!" },
			},
			HephaestusMiscPickup22 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0006",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Got here in practically no time at all, boss. Ready now?" },
			},
			HephaestusMiscPickup23 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0007",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hey Coz, package for you here. Knock yourself out!" },
			},
			HephaestusMiscPickup24 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0008",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Got a customary care package for you, Coz." },
			},
			HephaestusMiscPickup25 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0009",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hey, what's it going to be this time, boss?" },
			},
			HephaestusMiscPickup26 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0010",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Come on, Coz, let's pick up the pace a bit!" },
			},
			HephaestusMiscPickup27 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0011",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Go get yourself out of there in a hurry, Coz." },
			},
			HephaestusMiscPickup28 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredLootChoices = 3,
				RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0012",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "No rush, but go on and pick one of these, boss." },
			},
			HephaestusMiscPickup29 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0013",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Message for you, Coz: It says {#DialogueItalicFormat}'Take one, it's free, enjoy!'{#PreviousFormat}" },
			},
			HephaestusMiscPickup30 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0014",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "What's going on, there, boss? Are things all right?" },
			},
			HephaestusMiscPickup31 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0015",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You want the usual, or what, there, boss?" },
			},
			HephaestusMiscPickup32 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0016",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Special delivery and all that, boss! Here, take your pick." },
			},
			HephaestusMiscPickup33 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0017",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hey boss! You take one of these, and go for it." },
			},
			HephaestusMiscPickup34 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0018",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Just so happened to be in the area, here, boss!" },
			},
			HephaestusMiscPickup35 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0019",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Making sure you got this, Coz. You got this, Coz!" },
			},
			HephaestusMiscPickup36 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0020",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Here comes a little boost to get you up and out of there in no time, boss!" },
			},
			HephaestusMiscPickup37 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0021",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Now, don't just stand there, Coz, pick one of these and {#DialogueItalicFormat}go{#PreviousFormat}!" },
			},
			HephaestusMiscPickup38 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0022",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Your quickness is my number one priority, here, boss." },
			},
			HephaestusMiscPickup39 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0023",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "No time to waste and so on, Coz. Now, choose!" },
			},
			HephaestusMiscPickup40 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0024",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Caught wind you need my services here, boss?" },
			},
			HephaestusMiscPickup41 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0025",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Thought I'd check in, Coz. See how things are going. Slow, right? Not for long." },
			},
			HephaestusMiscPickup42 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0026",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Ready to hustle? Good! I'll take that as a yes." },
			},
			HephaestusMiscPickup43 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0153",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Let's get you quickly on your way, there, Coz!" },
			},
			HephaestusMiscPickup44 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				RequiredLootChoices = 3,
				RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0154",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Message for you, boss. It says: {#DialogueItalicFormat}'Here, choose one of these, and go!'{#PreviousFormat}" },
			},
			HephaestusMiscPickup45 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0155",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Another message for you! This one says: {#DialogueItalicFormat}'Hey boss! Take this!'{#PreviousFormat}" },
			},
			HephaestusMiscPickup46 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0156",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Just thought I'd check up on you, boss, and bring you this!" },
			},
			HephaestusMiscPickup47 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0201",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hope you enjoyed the life of being slow, because all that's about to change, right here!" },
			},
			HephaestusMiscPickup48 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0206",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "All right, boss, here, let's get you on your way!" },
			},
			HephaestusMiscPickup49 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0207",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Past time we got you out of there, right, boss?" },
			},
			HephaestusMiscPickup50 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0208",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Just thought I'd drop by, give you this, and go!" },
			},
			HephaestusMiscPickup51 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0209",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "We'll have you racing out of here in no time, Coz!" },
			},
			HephaestusMiscPickup52 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0210",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "How goes it underground of late, there, boss?" },
			},
			HephaestusMiscPickup53 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0211",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Nice day we're having on the surface! You should see it, boss!" },
			},
			HephaestusMiscPickup54 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				RequiredMinRunsCleared = 2,
				{ Cue = "/VO/Hephaestus_0212",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Another day, another race up to the top! You ready, boss?" },
			},
			HephaestusMiscPickup55 =
			{
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0213",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Well, here we go again! Let's go, then, boss!" },
			},

			HephaestusFirstLootPickup01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredBiome = "Tartarus",
				RequiredFalseGodLoots = { "ZeusUpgrade", "PoseidonUpgrade", "AthenaUpgrade", "AphroditeUpgrade", "AresUpgrade", "ArtemisUpgrade", "DionysusUpgrade", "DemeterUpgrade" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0047",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Got here as quickly as I could, boss. Now what say we get you promptly the hell out of there!" },
			},
			HephaestusFirstLootPickup02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredBiome = "Tartarus",
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0048",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hey Coz, gathered you were just about to make another go of breaking out of there! Thought I'd stop by and give you a boost." },
			},
			HephaestusFirstLootPickup03 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredBiome = "Tartarus",
				RequiredFalseGodLoots = { "ZeusUpgrade", "PoseidonUpgrade", "AthenaUpgrade", "AphroditeUpgrade", "AresUpgrade", "ArtemisUpgrade", "DionysusUpgrade", "DemeterUpgrade" },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0049",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You're raring for your next trek out of there, right, boss? Well then I guess I got here just in time." },
			},
			HephaestusFirstLootPickup04 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredBiome = "Tartarus",
				RequiredFalseGodLoots = { "ZeusUpgrade", "PoseidonUpgrade", "AthenaUpgrade", "AphroditeUpgrade", "AresUpgrade", "ArtemisUpgrade", "DionysusUpgrade", "DemeterUpgrade" },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0050",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Heard you were heading out again, boss. Changed my schedule around a bit, not a big deal, and figured I'd drop in!" },
			},
			HephaestusFirstLootPickup05 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredBiome = "Tartarus",
				RequiredFalseGodLoots = { "ZeusUpgrade", "PoseidonUpgrade", "AthenaUpgrade", "AphroditeUpgrade", "AresUpgrade", "ArtemisUpgrade", "DionysusUpgrade", "DemeterUpgrade" },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusFirstPickUp" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0051",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You're off again, are you? All right well then safe travels! Or swift travels, failing that!" },
			},
			HephaestusFirstLootPickup06 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredBiome = "Tartarus",
				RequiredFalseGodLoots = { "ZeusUpgrade", "PoseidonUpgrade", "AthenaUpgrade", "AphroditeUpgrade", "AresUpgrade", "ArtemisUpgrade", "DionysusUpgrade", "DemeterUpgrade" },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0052",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You ready for another go at this, Coz? Well then think I can speed you on your journey there." },
			},

		},

		BoughtTextLines =
		{
			HephaestusLootBought01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				RequiredTextLines = { "HephaestusSecondPickUp" },
				RequiredFalseTextLines = { "HephaestusLootBought01_B" },
				{ Cue = "/VO/Hephaestus_0095",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Why, hello, Coz! Odd that we're running into one another here! Among the wares of my professional associate, I mean. Must be some sort of clerical mistake!" },
			},
			HephaestusLootBought01_B =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				RequiredFalseTextLines = { "HephaestusLootBought01", "HephaestusSecondPickUp" },
				{ Cue = "/VO/Hephaestus_0161",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Why, hello, boss! Odd that we're running into one another here! Among the wares of my professional associate, I mean. Must be some sort of clerical mistake!" },
			},

			HephaestusLootBought02 =
			{
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredAnyTextLines = { "HephaestusLootBought01", "HephaestusLootBought01_B", "HephaestusAboutHourglass01" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0096",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You're well familiar with my professional associate, there, with the boat? Souls of the recently departed got to make it over to the Underworld somehow. Part of my job! I bring them in, he takes them down." },
			},
			HephaestusLootBought03 =
			{
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusLootBought02" },
				RequiredAnyTextLines = { "HephaestusLootBought01", "HephaestusLootBought01_B" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0097",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I guess I'm used to these one-sided chats here, boss, thanks to my work experience with my professional associate down there! You tell him I said hi, all right?" },
			},
			HephaestusLootBought04 =
			{
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusLootBought02", "HephaestusLootBought03" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0098",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "A word of caution, Coz. Don't ask too many questions about me, or my professional associate down there. I hand souls over to him, and that's it, you understand?" },
			},
			HephaestusLootBought05 =
			{
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusLootBought04" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0179",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Wouldn't you know it, boss! I was just minding my own business, handing off a few dearly departed souls to my professional associate, and who shows up, but {#DialogueItalicFormat}you{#PreviousFormat}?" },
			},
			HephaestusLootBought06 =
			{
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusLootBought04" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0180",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "My heavy-breathing professional associate was gracious enough to drop me off here with his other stuff, and for quite an affordable price, at that!" },
			},
			HephaestusLootBought07 =
			{
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusLootBought04" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0181",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "All right, then, let's go make that spend of hard-earned coin well worth your while! What do you think, Coz?" },
			},
			HephaestusLootBought08 =
			{
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusLootBought04" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0182",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I'd tell you not to ask too many questions of my good professional associate nearby, but then, {#DialogueItalicFormat}who are we kidding{#PreviousFormat}, boss? Not like he'd answer you those questions anyhow!" },
			},
			HephaestusLootBought09 =
			{
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusLootBought04" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0183",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Message for you, boss, from my professional associate, who wanted you to know, and I quote, {#DialogueItalicFormat}'Hhhrrrrnnnngggggghhhhhh.'{#PreviousFormat}" },
			},
			HephaestusLootBought10 =
			{
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusLootBought04" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0184",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Been working with my good professional associate, the boatman there, since I-don't-know-how-long. Though, let me tell you, Coz, we haven't had a job quite like this yet!" },
			},
			HephaestusLootBought11 =
			{
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusLootBought04" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0185",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Among the many ways in which you could parlay your earnings into better chances of survival here, I'm flattered you would think of me this time!" },
			},
			HephaestusLootBought12 =
			{
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusLootBought04" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0186",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "How strange of a coincidence that you keep running into me along the riverside like this, don't you agree, there, Coz?" },
			},
			HephaestusLootBought13 =
			{
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				RequiredTextLines = { "HephaestusLootBought04" },
				EndVoiceLines = GlobalVoiceLines.RushedHephaestusVoiceLines,
				{ Cue = "/VO/Hephaestus_0187",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Don't normally go selling off my blessings to the highest bidder, boss, but your bid there is good enough for me!" },
			},

		},

		GiftTextLineSets =
		{
			-- gives gift in exchange
			HephaestusGift01 =
			{
				PlayOnce = true,
				RequiredFalseTextLines = { "HephaestusGift01B" },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				{ Cue = "/VO/ZagreusField_1933", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "Lord Hephaestus, please accept this gift as a small token of my appreciation. Thank you for always keeping me on my toes." },
				{ Cue = "/VO/Hephaestus_0106",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Oh{#PreviousFormat}! Mighty keen of you to leave a tip, there, boss. And I've a tip for you: Don't be slow! Maybe this will help with that." },
			},
			HephaestusGift01B =
			{
				PlayOnce = true,
				RequiredFalseTextLines = { "HephaestusGift01" },
				MaxRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				{ Cue = "/VO/ZagreusField_1933", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Lord Hephaestus, please accept this gift as a small token of my appreciation. Thank you for always keeping me on my toes." },
			},

			HephaestusGift02 =
			{
				PlayOnce = true,
				RequiredAnyTextLines = { "HephaestusGift01", "HephaestusGift01B" },
				RequiredFalseTextLines = { "HephaestusGift02B" },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				{ Cue = "/VO/ZagreusField_1934", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "Lord Hephaestus sir, you've asked for nothing in return, and so, please take this humble offering, because... it's nothing, really!" },
				{ Cue = "/VO/Hephaestus_0102",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Well now, that's awful kind, there, Coz! No need to thank me, though. Not so profusely anyhow!" },
			},
			HephaestusGift02B =
			{
				PlayOnce = true,
				RequiredAnyTextLines = { "HephaestusGift01", "HephaestusGift01B" },
				RequiredFalseTextLines = { "HephaestusGift02" },
				MaxRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				{ Cue = "/VO/ZagreusField_1934", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Lord Hephaestus sir, you've asked for nothing in return, and so, please take this humble offering, because... it's nothing, really!" },
			},

			HephaestusGift03 =
			{
				PlayOnce = true,
				RequiredAnyTextLines = { "HephaestusGift02", "HephaestusGift02B" },
				RequiredFalseTextLines = { "HephaestusGift03B" },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				{ Cue = "/VO/ZagreusField_1935", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "Hephaestus, my friend? May I call you my friend? I hope this modest offering will lift your spirits but won't slow you down." },
				{ Cue = "/VO/Hephaestus_0172",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I look like I got the sort of time to sip Nectar, Coz? Well, guess what, I do! So, cheers!" },
			},
			HephaestusGift03B =
			{
				PlayOnce = true,
				RequiredAnyTextLines = { "HephaestusGift02", "HephaestusGift02B" },
				RequiredFalseTextLines = { "HephaestusGift03" },
				MaxRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				{ Cue = "/VO/ZagreusField_1935", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Hephaestus, my friend? May I call you my friend? I hope this modest offering will lift your spirits but won't slow you down." },
			},

			HephaestusGift04 =
			{
				PlayOnce = true,
				RequiredAnyTextLines = { "HephaestusGift03", "HephaestusGift03B" },
				RequiredFalseTextLines = { "HephaestusGift04B" },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				{ Cue = "/VO/ZagreusField_1936", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "Ever since we met, Lord Hephaestus, life here in the Underworld has been much faster-paced, and I am ever grateful. This is for you." },
				{ Cue = "/VO/Hephaestus_0104",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hey, boss, I appreciate the tip. But just as a reminder, all my services are paid in full already! No need for special thanks. Though... cheers." },
			},
			HephaestusGift04B =
			{
				PlayOnce = true,
				RequiredAnyTextLines = { "HephaestusGift03", "HephaestusGift03B" },
				RequiredFalseTextLines = { "HephaestusGift04" },
				MaxRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				{ Cue = "/VO/ZagreusField_1936", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Ever since we met, Lord Hephaestus, life here in the Underworld has been much faster-paced, and I am ever grateful. This is for you." },
			},

			HephaestusGift05 =
			{
				PlayOnce = true,
				RequiredAnyTextLines = { "HephaestusGift04", "HephaestusGift04B" },
				RequiredFalseTextLines = { "HephaestusGift05B" },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				{ Cue = "/VO/ZagreusField_1937", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "I never could have come this far this quickly had it not been for your tireless support, Lord Hephaestus, sir. I'm in your debt." },
				{ Cue = "/VO/Hephaestus_0105",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You know, Coz, I got to say I had a few concerns when we first met, your father being who he is and all. But you're all right!" },
			},
			HephaestusGift05B =
			{
				PlayOnce = true,
				RequiredAnyTextLines = { "HephaestusGift04", "HephaestusGift04B" },
				RequiredFalseTextLines = { "HephaestusGift05" },
				MaxRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				{ Cue = "/VO/ZagreusField_1937", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "I never could have come this far this quickly had it not been for your tireless support, Lord Hephaestus, sir. I'm in your debt." },
			},

			HephaestusGift06 =
			{
				PlayOnce = true,
				RequiredAnyTextLines = { "HephaestusGift05", "HephaestusGift05B" },
				RequiredFalseTextLines = { "HephaestusGift06B" },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				{ Cue = "/VO/ZagreusField_3873", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "This one's for you, swift and sure-footed messenger of the gods! You make what you do look easy. But I know you're going out of your way. Thank you so much, Hephaestus." },
				{ Cue = "/VO/Hephaestus_0173",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "My rule is not to let things get too personal as far as work-related matters are concerned, Coz. But you're family! And, well, you're a right decent chap, I think. Offering up a bit of Nectar to me in the middle of all this!" },
			},
			HephaestusGift06B =
			{
				PlayOnce = true,
				RequiredAnyTextLines = { "HephaestusGift05", "HephaestusGift05B" },
				RequiredFalseTextLines = { "HephaestusGift06" },
				MaxRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				{ Cue = "/VO/ZagreusField_3873", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "This one's for you, swift and sure-footed messenger of the gods! You make what you do look easy. But I know you're going out of your way. Thank you so much, Hephaestus." },
			},

			HephaestusGift07 =
			{
				PlayOnce = true,
				RequiredAnyTextLines = { "HephaestusGift06", "HephaestusGift06B" },
				RequiredFalseTextLines = { "HephaestusGift07B" },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				{ Cue = "/VO/ZagreusField_3874", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "I salute you, Lord Hephaestus, with this rarest of delicacies! Pretty rare here, anyway. You never show it, but I can only imagine how hard you must be working to back me up. Cheers, mate!" },
				{ Cue = "/VO/Hephaestus_0174",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You know, the last time anybody offered me Ambrosia from the Underworld was {#DialogueItalicFormat}never{#PreviousFormat}, before now! That's quite a gesture on your part. You could have just as well taken my services for granted and I'd not have minded in the least! But, thank you, Coz." },
			},
			HephaestusGift07B =
			{
				PlayOnce = true,
				RequiredAnyTextLines = { "HephaestusGift06", "HephaestusGift06B" },
				RequiredFalseTextLines = { "HephaestusGift07" },
				MaxRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				{ Cue = "/VO/ZagreusField_3874", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "I salute you, Lord Hephaestus, with this rarest of delicacies! Pretty rare here, anyway. You never show it, but I can only imagine how hard you must be working to back me up. Cheers, mate!" },
			},

			HephaestusGift08 =
			{
				PlayOnce = true,
				RequiredAnyTextLines = { "HephaestusGift07", "HephaestusGift07B" },
				RequiredFalseTextLines = { "HephaestusGift08B" },
				MinRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				{ Cue = "/VO/ZagreusField_3875", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "Message for you, Lord Hephaestus! It says, {#DialogueItalicFormat}'This offering is dedicated to the incomparable god of swiftness, from whom the news is always good, because he's bringing it. You are a real mate, you know that? I really owe you one.' {#PreviousFormat}Zagreus." },
				{ Cue = "/VO/Hephaestus_0175",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					PostLineThreadedFunctionName = "MaxedRelationshipPresentation",
					PostLineFunctionArgs = { Text = "NPC_Hephaestus_01", Icon = "Keepsake_HephaestusSticker_Max" },
					Text = "Look, Coz, I am going to accept this choice Ambrosia from you one last time, all right? But from this point, I am doubling down on all professional responsibilities, here. Strictly business between us! Although, secretly, you're one of my best mates. Want you to know." },
			},
			HephaestusGift08B =
			{
				PlayOnce = true,
				RequiredAnyTextLines = { "HephaestusGift07", "HephaestusGift07B" },
				RequiredFalseTextLines = { "HephaestusGift08" },
				MaxRunsSinceSquelchedHephaestus = ConstantsData.SquelchedHephaestusRunCount,
				{ Cue = "/VO/ZagreusField_3875", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
					PostLineThreadedFunctionName = "MaxedRelationshipPresentation",
					PostLineFunctionArgs = { Text = "NPC_Hephaestus_01", Icon = "Keepsake_HephaestusSticker_Max" },
					Text = "Message for you, Lord Hephaestus! It says, {#DialogueItalicFormat}This offering is dedicated to the incomparable god of swiftness, from whom the news is always good, because he's bringing it. You are a real mate, you know that? I really owe you one. {#PreviousFormat}Zagreus." },
			},

		},

		GiftGivenVoiceLines =
		{
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			PlayFromTarget = true,

			-- Lord Hephaestus, I am in your debt.
			{ Cue = "/VO/ZagreusField_1950" },
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
	table.insert(OlympusGiftOrdering, 22, "ForceWeaponUpgradeTrait")

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
				{ "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRushTrait", "HephaestusRangedTrait", "HephaestusShoutTrait",  "DropMoneyTrait", "SpawnWeaponsTrait", "RevengeBoostTrait", "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait", "ForceWeaponUpgradeTrait" },
			}
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
				{ "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRushTrait", "HephaestusRangedTrait", "HephaestusShoutTrait",  "DropMoneyTrait", "SpawnWeaponsTrait", "RevengeBoostTrait", "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait", "ForceWeaponUpgradeTrait" },
			}
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
				{ "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRushTrait", "HephaestusRangedTrait", "HephaestusShoutTrait",  "DropMoneyTrait", "SpawnWeaponsTrait", "RevengeBoostTrait", "ArmorBossTrait", "ArmorEncounterTrait","ArmorDefianceTrait", "ForceWeaponUpgradeTrait" },
			}
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
				--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Drop Money:"..moneyDropOnDeath.Chance))
			end
			--moneyDropOnDeath.Chance = 1.0 -- test armor drop
			CheckMoneyDrop( CurrentRun, CurrentRun.CurrentRoom, enemy, moneyDropOnDeath )
			enemy.DroppedAlready = true
		end
		baseFunc(enemy)
	end
)

function SetupTemporaryAmmo(hero, args)
	if args.Ammo then
		RunWeaponMethod({ Id = CurrentRun.Hero.ObjectId, Weapon = "RangedWeapon", Method = "AddAmmo", Parameters = { args.Ammo } })
	end
end
function SetupArmor(hero, args)
	if CurrentRun.Hero.Armor == nil then
		CurrentRun.Hero.Armor = {
			Amount = 0,
			Max = 0,
			Sources = {},
		}
	end
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(args))
	if args.ArmorAtSetup ~= nil and not Contains( CurrentRun.Hero.Armor.Sources, args.Source ) then
		AddMaxArmor(args.ArmorAtSetup)
		table.insert(CurrentRun.Hero.Armor.Sources, args.Source)
		ShowArmorUI()
	end
end

function AddMaxArmor(num)
	CurrentRun.Hero.Armor.Max = CurrentRun.Hero.Armor.Max + num
	RepairArmor(num)
end
function RepairArmor(amount)
	if CurrentRun.Hero.Armor ~= nil and CurrentRun.Hero.Armor.Max > 0 then
		local newAmount = CurrentRun.Hero.Armor.Amount + amount
		if newAmount > CurrentRun.Hero.Armor.Max then
			newAmount = CurrentRun.Hero.Armor.Max
		end
		CurrentRun.Hero.Armor.Amount = newAmount
		thread(RepairArmorPresentation)
		thread( UpdateHealthUI )
	end
end
function GainArmorPresentation( args )
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Some Armor Presentation"))
end

ModUtil.Path.Wrap( "Damage", 
	function (baseFunc, victim, triggerArgs )
		if victim == nil or victim.Health == nil or ( victim.IsDead and not triggerArgs.PureDamage ) then
			return
		end
		if victim == CurrentRun.Hero and victim.Armor ~= nil and victim.Armor.Amount > 0 and not triggerArgs.SkipArmor then
			victim.Armor.Amount = victim.Armor.Amount - triggerArgs.DamageAmount
			if victim.Armor.Amount < 0 then
				victim.Armor.Amount = 0
			end
			triggerArgs.DamageAmount = 0
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(victim.Armor.Amount)) 
			DamageHero( victim, triggerArgs )
			InvalidateCheckpoint()
			if victim.Armor.Amount <= 0 then
				ArmorDepletedPresentation()
			end
		else
			baseFunc(victim, triggerArgs)
		end
	end
)
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
	wait(0.2)
	--PlaySound({ Name = "/Leftovers/Menu Sounds/CoinLand", Id = CurrentRun.Hero.ObjectId })
	thread(InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text = "ArmorDepleted", Duration = 1 })
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
		if currentArmor == nil or maxArmor == nil then
			return
		end

		if ScreenAnchors.ArmorBack ~= nil then
			ModifyTextBox({ Id = ScreenAnchors.ArmorBack, Text = "UI_PlayerArmor", LuaKey = "TempTextData", LuaValue = { Current = math.ceil(currentArmor), Maximum = math.ceil(maxArmor) }, AutoSetDataProperties = false })
		end

		if ScreenAnchors.ArmorFill ~= nil then
			SetAnimationFrameTarget({ Name = "HealthBarFill", Fraction = 1-(currentArmor / maxArmor), DestinationId = ScreenAnchors.ArmorFill })
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
				end
			end
			baseFunc(currentRun, currentRoom, currentEncounter)
		end
	)
	function RepairArmorPresentation()
		wait(0.2)
		--PlaySound({ Name = "/Leftovers/Menu Sounds/CoinLand", Id = CurrentRun.Hero.ObjectId })
		thread(InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text = "RepairText", Duration = 1 })
	end
	
	function OnDamageBoost(attacker, args)
		ApplyEffectFromWeapon({ Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId,
							WeaponName = "RevengeBoostApplicator", EffectName = "RevengeBoostSpeed" })
		ApplyEffectFromWeapon({ Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId,
							WeaponName = "RevengeBoostApplicator", EffectName = "RevengeBoostDamage" })
	end
ModUtil.Path.Wrap( "EndEncounterEffects", 
	function(baseFunc, currentRun, currentRoom, currentEncounter)
		baseFunc(currentRun, currentRoom, currentEncounter)
		if currentEncounter == nil or currentEncounter.EncounterType == "NonCombat" then
			return
		end
		if currentEncounter == currentRoom.Encounter and not currentRoom.BlockClearRewards then
			for k, traitData in pairs(currentRun.Hero.Traits) do
				if not currentEncounter.PlayerTookDamage and traitData.RepairArmorOnPerfectEncounter then
					PerfectClearTraitSuccessPresentation( traitData )
					RepairArmor(traitData.RepairArmorOnPerfectEncounter)
					--CurrentRun.CurrentRoom.PerfectEncounterCleared = true
					--CheckAchievement( { Name = "AchBuffedButterfly", CurrentValue = traitData.AccumulatedDamageBonus } )
				end
			end
		end
	end
)
ModUtil.Path.Wrap( "FireShoutEffects", 
	function(baseFunc, superName)
		baseFunc(superName)
		if superName ~= nil then
			if HeroHasTrait("HephaestusShoutTrait")then
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
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Heph Shout"))
	SpawnExplosiveChariot({Name = "HephaestusChariot", Duration = 30.0})
end
function HephaestusMaxShout() 
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Heph Max Shout")) 
	SpawnExplosiveChariot({Name = "HephaestusChariot", Duration = 30.0})
end
function SpawnExplosiveChariot( args )
	local enemyName = args.Name or "ChariotSuicide"
	local enemyData = EnemyData[enemyName]
	local newEnemy = DeepCopyTable( enemyData )
	newEnemy.BlocksLootInteraction = false

	local invaderSpawnPoint = CurrentRun.Hero.ObjectId
	newEnemy.ObjectId = SpawnUnit({
			Name = enemyData.Name,
			Group = "Standing",
			DestinationId = invaderSpawnPoint, OffsetX = 0, OffsetY = 0 })

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
	PresentationIgneousArmor(hero.IgneousArmor)
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(hero.IgneousArmor.DamageTransfer)) 
end
function PresentationIgneousArmor( igneousArmor )
	if igneousArmor.Ready then
		thread( DisplayPlayerDamageText, { triggeredById = CurrentRun.Hero.ObjectId, UseCustomText = "BiomeTimerDamage", PercentMaxDealt = igneousArmor.Damage/CurrentRun.Hero.MaxHealth, DamageAmount = igneousArmor.Damage } )
		CreateAnimation({ Name = "ThanatosDeathsHead_Small", DestinationId = CurrentRun.Hero.ObjectId, Group = "FX_Standing_Top" })
		PlaySound({ Name = "/SFX/HeartPulsate1" })
		PlaySound({ Name = "/SFX/HeartPulsate2", Delay = 0.35 })
	end
end
function DamageIgneousArmor( weaponData, args)
	args = args or {}
	if CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead and IsCombatEncounterActive( CurrentRun ) then
		local igneousArmor = CurrentRun.Hero.IgneousArmor
		if igneousArmor ~= nil and not igneousArmor.InCooldown then
			PresentationIgneousArmor(igneousArmor)
			if not igneousArmor.Charging and not igneousArmor.InCooldown then
				igneousArmor.InCooldown = true
				igneousArmor.Charging = true
				thread(StartArmorIgneous, igneousArmor)
			end
		end
	end
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(CurrentRun.Hero.IgneousArmor.Damage)) 
end
function StartArmorIgneous(igneousArmor)
	--thread(InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text = "Armor Start", Duration = 1, LuaKey = "TempTextData", LuaValue = { Amount = igneousArmor.Damage }})
	CreateAnimation({ Name = "ThanatosDeathsHead_Small", DestinationId = CurrentRun.Hero.ObjectId, Group = "FX_Standing_Top" })
	wait(igneousArmor.Duration-2.0)
	CreateAnimation({ Name = "ThanatosDeathsHead_Small", DestinationId = CurrentRun.Hero.ObjectId, Group = "FX_Standing_Top" })
	wait(1.0)
	CreateAnimation({ Name = "ThanatosDeathsHead_Small", DestinationId = CurrentRun.Hero.ObjectId, Group = "FX_Standing_Top" })
	wait(1.0)
	if CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead and IsCombatEncounterActive( CurrentRun ) then
		igneousArmor.Charging = false
		--CreateAnimation({ Name = "ThanatosDeathsHead_Small", DestinationId = CurrentRun.Hero.ObjectId, Group = "FX_Standing_Top" })
		thread(InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text = "IgneousArmorDamage", Duration = 1, LuaKey = "TempTextData", LuaValue = { Amount = igneousArmor.Damage }})
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
	if CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead and IsCombatEncounterActive( CurrentRun ) then
		CreateAnimation({ Name = "ThanatosDeathsHead_Small", DestinationId = CurrentRun.Hero.ObjectId, Group = "FX_Standing_Top" })
		--thread(InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text = "Armor Ready", Duration = 1, LuaKey = "TempTextData", LuaValue = { Amount = igneousArmor.Damage }})
		igneousArmor.InCooldown = false
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
	ModUtil.Path.Wrap( "CreateHermesLoot", 
		function(baseFunc, args)
			--baseFunc(args)
			return CreateHephaestusLoot(args)
		end
	)
	function CreateHephaestusLoot( args )
		args = args or {}
		return CreateLoot( MergeTables( args, { Name = "HephaestusUpgrade" } ) )
	end
	--[[ModUtil.Path.Wrap( "BeginOpeningCodex", 
		function(baseFunc)
			-- if (not CanOpenCodex()) and IsSuperValid() then
			-- 	BuildSuperMeter(CurrentRun, 50)
			-- end
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString.Deep(GiftOrdering)) 
			CreateLoot({ Name = "HephaestusUpgrade", SpawnPoint = CurrentRun.Hero.ObjectId } )
			baseFunc()
		end
	)]]
end
