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
				"FullHealthExtraRewardTrait",
				"DropMoneyTrait",
				"DamageBoostTrait",
				"ArmorBossTrait",
				"ArmorEncounterTrait",
				"ArmorDefianceTrait",
				"SpawnWeaponsTrait",
				"HephaestusDistantTrait",
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
		RewardResourceAmount = 350,
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
	local OlympusRewardStoreData = ModUtil.Entangled.ModData(RewardStoreData)
	table.insert(OlympusRewardStoreData.RunProgress, {
		Name = "HephaestusUpgrade",
		GameStateRequirements =
		{
			RequiredMaxHephaestusUpgrades = 1,
			RequiredFalseLootPickup = "HermesUpgrade",
			RequiredNotInStore = "HephaestusUpgradeDrop",
			RequiredMinCompletedRuns = 3,
			RequiredMinDepth = 13,
		}
	})
	--WeaponData
	local OlympusWeaponSets = ModUtil.Entangled.ModData(WeaponSets)
	local OlympusWeaponData = ModUtil.Entangled.ModData(WeaponData)
	local OlympusEffectData = ModUtil.Entangled.ModData(EffectData)
	OlympusWeaponSets.PrimaryWeapons = { "SwordWeapon",
		"SwordWeapon2", "SwordWeapon3", "SwordWeaponDash", "SpearWeapon", "SpearWeapon2", "SpearWeapon3",
		"SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3", 
		"SpearWeaponDash", "ShieldWeapon", "ShieldWeaponRush", 
		"ShieldWeaponDash", "BowWeapon", "BowSplitShot", "BowWeaponDash", "ChargeBowWeapon1",
		"MaxChargeBowWeapon", "BowWeapon2", "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5", 
		"FistWeaponDash", "GunWeapon",
		"GunWeaponDash", "SniperGunWeapon", "SniperGunWeaponDash" --"FistWeaponLandAreaAttack",
	}
	OlympusWeaponSets.SecondaryWeapons = { 
		"SwordParry", "SpearWeaponThrow", "SpearThrowImmolation",
		"SpearWeaponThrow", "SpearWeaponThrowReturn", "SpearWeaponThrowInvisibleReturn", "ShieldThrow",
		"ChaosShieldThrow", "ShieldThrowDash", "BowSplitShot", 
		"BowWeapon2", "FistWeaponSpecial",
		"FistWeaponSpecialDash", "GunGrenadeToss", "GunBombWeapon",
	}
	--table.insert(OlympusWeaponSets.ExpireProjectileExcludeProjectileNames, "HephaestusTrap")	
	
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
			RequiredCountOfTraitsCount = 6,
			RequiredCountOfTraits =
			{
				"HephaestusWeaponTrait",
				"HephaestusRushTrait",
				"HephaestusRangedTrait",
				"HephaestusSecondaryTrait",
				"HephaestusShoutTrait",
				"DiscountHephaestusTrait",
				"PrivilegeHephaestusTrait",
				"FamilyHephaestusTrait",
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
	table.insert(OlympusGameData.ConversationOrder, "HephaestusUpgrade")
	table.insert(OlympusGameData.RunClearMessageData.ClearWeaponsFiredWrath.GameStateRequirements.RequiredWeaponsFiredThisRun
		.Names, "HephaestusBeamWeapon")
	ModUtil.Table.Merge(OlympusGameData.GodAboutGodVoiceLines, {
		"HephaestusAboutZeus01"
	}
	)
	--Keywords
	local OlympusKeywordList = ModUtil.Entangled.ModData(KeywordList)
	--ModUtil.Table.Merge(OlympusKeywordList, { "JealousyCurse", "EnvyCurse", "HephaestusTrap", "Aura", "SpecialDiscount" })
	--ResetKeywords()

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

	-- Trait Section
	local OlympusTraitData = ModUtil.Entangled.ModData(TraitData)

	OlympusTraitData.ForceHephaestusBoonTrait = {
		Name = "ForceHephaestusBoonTrait",
		InheritFrom = { "GiftTrait" },
		--New Data
		InRackTitle = "ForceHephaestusBoonTrait_Rack",
		Icon = "Keepsake_Skull",
		EquipSound = "/SFX/WrathOver2",
		ForceBoonName = "HephaestusUpgrade",
		Uses = 1,
		RarityBonus =
		{
			RequiredGod = "HephaestusUpgrade",
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
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Hephaestus_06",
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
		PropertyChanges =
		{
			{
				WeaponNames = OlympusWeaponSets.PrimaryWeapons,
				EffectName = "RushHyperArmor",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = OlympusWeaponSets.PrimaryWeapons,
				EffectName= "RushHyperArmor",
				EffectProperty = "Modifier",
				BaseMin = 0.7,
				BaseMax = 0.7,
				SourceIsMultiplier = true,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDamageReduction",
					Format = "NegativePercentDelta",
				}
			},
			{
				WeaponNames = OlympusWeaponSets.PrimaryWeapons,
				EffectName= "RushHyperArmor",
				EffectProperty = "Duration",
				BaseValue = 0.5,
				ChangeType = "Absolute",
			},
			--[[{
				WeaponNames = { "SwordWeapon" },
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesSwipeLineA",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesSwipeLineB",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon3" },
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesSwipeLineC_Sword3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon" },
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesSwipeLineC_Sword3_Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SwordWeapon", "SwordWeapon2", "SwordWeapon3" },
				WeaponProperty = "ChargeTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon" },
				EffectName = "SwordDisableHeavy",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SwordWeapon" },
				EffectName = "SwordDisableCancelableAndLockTrigger",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				EffectName = "SwordDisableCancelableAndLockTrigger2",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				EffectName = "SwordDisableArthurCancellable2",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon3" },
				EffectName = "SwordDisable3",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon3" },
				EffectName = "SwordDisableAttackCancelable3",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},




			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				WeaponProperty = "ChargeTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon" },
				EffectName = "SpearDisableCancelableAndLockTrigger",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon" },
				EffectName = "SpearDisableCancelableAndLockRotation",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon2" },
				EffectName = "SpearDisableCancelableAndLockTrigger2",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon2" },
				EffectName = "SpearDisableCancelableAndLockRotation",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon3" },
				EffectName = "SpearDisableCancelable3",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesSwipeLineC_Spear",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldWeapon" },
				WeaponProperty = "ChargeTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldWeapon" },
				WeaponProperty = "ReloadTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldWeapon" },
				EffectName = "ShieldDisableAttack",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldWeapon" },
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesSwipeLineB_Shield",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesWings_ShieldRush",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon" },
				WeaponProperty = "ChargeTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesBowTrail",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunWeapon" },
				WeaponProperty = "Cooldown",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunWeapon" },
				ProjectileProperty = "Fuse",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesGunTrail",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				WeaponProperty = "ChargeTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistDisableAndLockTrigger",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistChargeDisableAndLockTrigger",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				EffectName = "FistDisableAndLockTrigger2",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				EffectName = "FistChargeDisableAndLockTrigger2",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon3" },
				EffectName = "FistDisableAndLockTrigger3",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon3" },
				EffectName = "FistChargeDisableAndLockTrigger3",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon4" },
				EffectName = "FistDisableAndLockTrigger4",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon5" },
				EffectName = "FistDisableAndLockTrigger5",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},]]
		},
		ExtractEntry =
		{
			BaseValue = 0.70,
		},
		ExtractValues =
		{
			{
				Key = "ExtractEntry",
				DecimalPlaces = 2,
				Format = "NegativePercentDelta",
				ExtractAs = "TooltipSpeedIncrease",
			},
		}
	}
	
	OlympusTraitData.HephaestusSecondaryTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Hephaestus_09",
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
		PropertyChanges =
		{
			
			{
				WeaponNames = OlympusWeaponSets.SecondaryWeapons,
				EffectName = "RushHyperArmor",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = OlympusWeaponSets.SecondaryWeapons,
				EffectName= "RushHyperArmor",
				EffectProperty = "Modifier",
				BaseMin = 0.7,
				BaseMax = 0.7,
				SourceIsMultiplier = true,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDamageReduction",
					Format = "NegativePercentDelta",
				}
			},
			{
				WeaponNames = OlympusWeaponSets.SecondaryWeapons,
				EffectName= "RushHyperArmor",
				EffectProperty = "Duration",
				BaseValue = 0.5,
				ChangeType = "Absolute",
			},

		},
		ExtractEntry =
		{
			BaseValue = 0.9,
			SourceIsMultiplier = true,

		},
		ExtractValues =
		{
			{
				Key = "ExtractEntry",
				DecimalPlaces = 2,
				Format = "NegativePercentDelta",
				ExtractAs = "TooltipSpeedIncrease",
			},
		},
	}
	
	OlympusTraitData.HephaestusRushTrait =
	{
		Name = "HephaestusRushTrait",
		InheritFrom = { "ShopTier1Trait" },
		God = "Hephaestus",
		Icon = "Boon_Hephaestus_03",
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
                WeaponNames = { "RushWeapon" },
                WeaponProperty = "WeaponRange",
                BaseValue = 1.5,
                ChangeType = "Multiply",
                ExtractValue =
                {
                    ExtractAs = "TooltipPenalty",
                    Format = "NegativePercentDelta",
                },
            },
		},
	}
	OlympusTraitData.HephaestusRangedTrait =
	{
		Name = "HephaestusRangedTrait",
		InheritFrom = { "ShopTier1Trait" },
		God = "Hephaestus",
		Slot = "Ranged",
		Icon = "Boon_Hephaestus_04",
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
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "HephaestusProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "ProjectileFireRing-Hephaestus",
				ChangeType = "Absolute",
			},
			
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "HephaestusProjectile",
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
				ProjectileName = "HephaestusProjectile",
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
				ProjectileName = "HephaestusProjectileSmall",
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
				ProjectileName = "HephaestusProjectileSmall",
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
				ProjectileName = "HephaestusProjectile",
				ProjectileProperty = "Range",
				ChangeValue = 10,
				ChangeType = "Absolute",
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "HephaestusProjectile",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.1,
				ChangeType = "Absolute",
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "HephaestusProjectile",
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
				ProjectileName = "HephaestusProjectile",
				ProjectileProperty = "Range",
				ChangeValue = 15,
				ChangeType = "Absolute",
			},
			{
				TraitName = "ShieldLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "HephaestusProjectile",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.4,
				ChangeType = "Absolute",
			},
			{
				TraitName = "ShieldLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "HephaestusProjectile",
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
                ChangeValue = "RadialNovaSwordParry-Hephaestus"
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

	OlympusTraitData.HephaestusShoutTrait =
	{
		Name = "HephaestusShoutTrait",
		InheritFrom = { "ShopTier1Trait" },
		RequiredTextLines = { "PoseidonWrathIntro01" },
		CustomTrayText = "HephaestusShoutTrait_Tray",
		God = "Hephaestus",
		Slot = "Shout",
		Icon = "Boon_Hephaestus_05",
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
	}

	OlympusTraitData.FullHealthExtraRewardTrait =
	{
		Name = "FullHealthExtraRewardTrait",
		Icon = "Boon_Hephaestus_06",
		InheritFrom = { "ShopTier2Trait" },
		RequiredFalseTrait = "FullHealthExtraRewardTrait",
		God = "Hephaestus",
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
	}
	OlympusTraitData.DropMoneyTrait =
	{
		Name = "DropMoneyTrait",
		Icon = "Boon_Hephaestus_07",
		InheritFrom = { "ShopTier2Trait" },
		God = "Hephaestus",
		RequiredFalseTrait = "DropMoneyTrait",
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
	}
	OlympusTraitData.DamageBoostTrait =
	{
		Name = "DamageBoostTrait",
		Icon = "Boon_Hephaestus_08",
		InheritFrom = { "ShopTier2Trait" },
		God = "Hephaestus",
		RequiredFalseTrait = "DamageBoostTrait",
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
	OlympusTraitData.ArmorBossTrait =
	{
		Name = "ArmorBossTrait",
		InheritFrom = { "ShopTier1Trait" },
		God = "Hephaestus",
		Icon = "Boon_Hephaestus_09",
		RequiredFalseTrait = "ArmorBossTrait",
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
	}
	OlympusTraitData.ArmorEncounterTrait =
	{
		Name = "ArmorEncounterTrait",
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Hephaestus_10",
		RequiredFalseTrait = "ArmorEncounterTrait",
		God = "Hephaestus",
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
	}
	
	OlympusTraitData.ArmorDefianceTrait =
	{
		Name = "ArmorDefianceTrait",
		InheritFrom = { "ShopTier2Trait" },
		God = "Hephaestus",
		Icon = "Boon_Hephaestus_11",
		RequiredFalseTrait = "ArmorDefianceTrait",
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
		
	}	
	OlympusTraitData.SpawnWeaponsTrait =
	{
		Name = "SpawnWeaponsTrait",
		InheritFrom = { "ShopTier1Trait" },
		God = "Hephaestus",
		RequiredFalseTrait = "SpawnWeaponsTrait",
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
	}
	OlympusTraitData.HephaestusDistantTrait =
	{
		Name = "HephaestusDistantTrait",
		InheritFrom = { "ShopTier2Trait" },
		God = "Hephaestus",
		RequiredFalseTrait = "HephaestusDistantTrait",
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
	}
	OlympusTraitData.HephaestusTrapTrait =
	{
		Name = "HephaestusTrapTrait",
		InheritFrom = { "ShopTier2Trait" },
		God = "Hephaestus",
		RequiredFalseTrait = "HephaestusTrapTrait",
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
	}
	OlympusTraitData.ArmorLegendaryTrait =
	{
		Name = "ArmorLegendaryTrait",
		InheritFrom = { "ShopTier3Trait" },
		RequiredFalseTrait = "ArmorLegendaryTrait",
		God = "Hephaestus",
		Icon = "Boon_Hephaestus_15",		
	}
	-- Improved Traits
	OlympusTraitData.AthenaLegendary =
	{
		Name = "AthenaLegendary",
		InheritFrom = { "ShopTier3Trait" },
		God = "Athena",
		--Icon = "Hephaestus_Athena_01",
		RequiredFalseTrait = "AthenaLegendary",		
		PreEquipWeapons = {"ExposedCurseApplicator"},
	}


	-- LootData
	local OlympusLootData = ModUtil.Entangled.ModData(LootData)
	OlympusLootData.HephaestusUpgrade = {
		Name = "HephaestusUpgrade",
		InheritFrom = { "BaseLoot", "BaseSoundPackage" },
		CanReceiveGift = true,
		AlwaysShowDefaultUseText = true,
		GodLoot = false,
		TreatAsGodLootByShops = true,
		Weight = 10,
		Icon = "BoonSymbolHephaestus",
		BoonInfoIcon = "BoonInfoSymbolHephaestusIcon",
		DoorIcon = "BoonSymbolHephaestusIsometric",
		Color = { 98,35,28, 255 },
		LightingColor = { 98,35,28, 255 },
		LootColor = { 98,35,28, 255 },
		SubtitleColor = { 0.384, 0.137, 0.098, 1.0 },
		EventEndSound = "/SFX/ArtemisBoonArrow",
		UpgradeSelectedSound = "/SFX/ArtemisBoonChoice",

		RequiredMinCompletedRuns = 10,
		RequiredTextLines = { "HermesFirstPickUp" },
		--RequiredCosmetics = { "BreakableValue1", "ChallengeSwitches1" },

		TraitsList = { "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRushTrait" },

		PriorityUpgrades = { "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRushTrait", "HephaestusRangedTrait" },
		WeaponUpgrades = { "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRushTrait", "HephaestusRangedTrait", "HephaestusShoutTrait" },
		Traits = { "ArmorBossTrait", "ArmorEncounterTrait", "ArmorDefianceTrait", "DamageBoostTrait", "HephaestusDistantTrait", "HephaestusTrapTrait" },
		Consumables = {},

		LinkedUpgrades =
		{
			HephaestusRangedTrait = {
				OneOf = { "ArmorBossTrait", "ArmorEncounterTrait", "ArmorDefianceTrait", "ArmorLegendaryTrait" },				
			},
			FullHealthExtraRewardTrait = {
				OneOf = { "ArmorBossTrait" }, 
			},
			DropMoneyTrait = {
				OneOf = { "ArmorBossTrait" }, 
			},			
			SpawnWeaponsTrait = {
				OneOf = { "ArmorBossTrait" }, 
			},
			ArmorLegendaryTrait = {
				OneFromEachSet =
				{
					{ "HephaestusWeaponTrait", "HephaestusSecondaryTrait", "HephaestusRangedTrait", "PeriodicCurseTrait" },
					{ "EnvyBurstTrait", "PrivilegeHephaestusTrait" },
				}
			},
			-- Improved Boon
			AthenaLegendaryImproved =
			{
				OneOf = { "AthenaLegendary" }, 
			},			
		},

		Speaker = "NPC_Hephaestus_01",
		Portrait = "Portrait_Hephaestus_Default_01",
		Gender = "Male",
		SpawnSound = "/SFX/GoldCoinRewardDrop",
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

			-- Lord Hephaestus...
			{ Cue = "/VO/ZagreusField_4839" },
			-- Kind of you to show now, Queen Hephaestus....
			{ Cue = "/VO/ZagreusField_4840" },
		},

		UpgradeMenuOpenVoiceLines =
		{
			[1] = GlobalVoiceLines.CheckOlympianReunionVoiceLines,
			[2] = GlobalVoiceLines.FoundRareBoonVoiceLines,
		},		

		SuperPriorityPickupTextLineSets =
		{
			HephaestusAboutOlympianReunionQuest01 =
			{
				Name = "HephaestusAboutOlympianReunionQuest01",
				PlayOnce = true,
				RequiredTextLines = { "HephaestusFirstPickUp", "PersephoneAboutOlympianReunionQuest01", },
				{ Cue = "/VO/ZagreusField_4901", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 2.33 },
					PostLineAnim = "ZagreusInteractEquip", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "I should probably invite her... In the name of Hades! Olympus, this is an official message! The underworld is open to all, especially royalty." },
				{ Cue = "/VO/Hephaestus_0057",
					PortraitExitWait = 1.25,
					PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
					UseEventEndSound = true,
					Emote = "PortraitEmoteDepressed",
					Text = "What is this? An invitation? Can't you see that I'm very busy managing Olympus? After all, it's not like Zeus is doing his part. I'm sure he'll go to your little gathering, and I will inevitably be forced to hold down the mountain all on my own. Forget it." },
			},			
			HephaestusPostEpilogue01 =
			{
				Name = "HephaestusPostEpilogue01",
				PlayOnce = true,
				RequiredTextLines = { "HephaestusFirstPickUp", "OlympianReunionQuestComplete" },
				RequiredAnyTextLines = { "HephaestusAboutOlympianReunionQuest01", "HephaestusAboutOlympianReunionQuest01b" },
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Hephaestus_0161",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Zeus told me about your little reunion. How about we have the feast up here next time, hmm? That is, if you manage to join us one day." },
			},			
		},

		PriorityPickupTextLineSets =
		{
			-- about other gods
			HephaestusAboutZeus01 =
			{
				Name = "HephaestusAboutZeus01",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ZeusFirstPickUp", "AresFirstPickUp", "HephaestusFirstPickUp" },
				--RequiredFalseTextLines = { "HephaestusWithZeus01", "ZeusWithHephaestus01" },
				RequiredGodLoot = "ZeusUpgrade",
				{ Cue = "/VO/Hephaestus_0063",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "My husband Zeus certainly has his flaws. Many flaws, actually. But nonetheless, I promised fidelity to him and his throne. A promise is not something you can break without consequences. My destiny is chained to Zeus, as is his with mine." },
			},
			HephaestusAboutZeus02 =
			{
				Name = "HephaestusAboutZeus02",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ZeusFirstPickUp", "AresFirstPickUp", "HephaestusFirstPickUp" },
				--RequiredFalseTextLines = { "HephaestusWithZeus01", "ZeusWithHephaestus01" },
				RequiredGodLoot = "ZeusUpgrade",
				{ Cue = "/VO/Hephaestus_0064",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Placeholder" },
			},
			HephaestusAboutPoseidon01 =
			{
				Name = "HephaestusAboutPoseidon01",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp",
					"AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "HephaestusFirstPickUp" },
				RequiredFalseTextLines = { "HephaestusWithPoseidon01", "PoseidonWithHephaestus01" },
				RequiredGodLoot = "PoseidonUpgrade",
				{ Cue = "/VO/Hephaestus_0065",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Placeholder" },
			},
			HephaestusAboutQueenDuty01 =
			{
				Name = "HephaestusAboutQueenDuty01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0066",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Every day, many come to see me for advice and guidance. Some want my power, others my wisdom, and as their rightful queen, it is my duty to help them. Let me show you what I mean." },
			},
			HephaestusAboutQueenDuty02 =
			{
				Name = "HephaestusAboutQueenDuty02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "HephaestusAboutQueenDuty01" },
				{ Cue = "/VO/Hephaestus_0067",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "My role on Olympus is far more important than that of our king. Zeus is always absent, making my work twice as hard. Are you to blame for this recently, Zagreus?" },
			},
			HephaestusAboutQueenDuty03 =
			{
				Name = "HephaestusAboutQueenDuty03",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "HephaestusAboutQueenDuty02" },
				{ Cue = "/VO/Hephaestus_0068",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I often receive gifts for my excellent work as queen. Peasants are always eager to shower me with offerings. When you are up here, I hope you'll do the same." },
			},
			HephaestusAboutQueenDuty04 =
			{
				Name = "HephaestusAboutQueenDuty04",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "HephaestusAboutQueenDuty03" },
				{ Cue = "/VO/Hephaestus_0069",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I may be queen, but that doesn't mean I can't spend time amongst the commoners from time to time. Unfortunately, I am much too busy of late to indulge in such frivolity." },
			},
			HephaestusAboutQueenDuty05 =
			{
				Name = "HephaestusAboutQueenDuty05",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "HephaestusAboutQueenDuty04" },
				{ Cue = "/VO/Hephaestus_0070",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Of all my duties as a queen, your escape is becoming my most time-consuming. I hope you will fix this matter quickly, Zagreus. Don't make me wait." },
			},
			HephaestusAboutCerberus01 =
			{
				Name = "HephaestusAboutCerberus01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0071",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I must admit, of all the Underworlds' subjects, there is one I would like you to greet for me. Next time you see Cerberus, please tell him... \"Who's a good boy?\" Hah. That will be all." },
			},
			HephaestusAboutCoronacht01 =
			{
				Name = "HephaestusAboutCoronacht01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredWeapon = "BowWeapon",
				--RequiredTrait = "GunManualReloadTrait",
				{ Cue = "/VO/Hephaestus_0072",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Coronacht! Oh, how long it's been since I saw this perfectly balanced weapon. I was so young then. If you use it well, Zagreus, it shall defeat any enemies in your way." },
			},
			HephaestusAboutHephaestusAspect01 =
			{
				Name = "HephaestusAboutHephaestusAspect01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "HephaestusAboutCoronacht01" },
				RequiredWeapon = "BowWeapon",
				RequiredTrait = "BowLoadAmmoTrait",
				{ Cue = "/VO/Hephaestus_0073",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You dare to use my aspect of Coronacht without first obtaining my permission?! You are bold, little one. Make use of it while you can, for now that I know where it disappeared to, I know where to find it when I next need it." },
			},
			HephaestusAboutPersephoneQueen01 =
			{
				Name = "HephaestusAboutPersephoneQueen01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "PersephoneHomeMeeting03" },
				{ Cue = "/VO/Hephaestus_0074",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Pomegranates are often given to me as offerings, and they symbolize my rightful role as queen. However, I recently heard that lately, someone else is getting pomegranates instead of me. I cannot let this slight stand, and if I catch this false queen... Oooh." },
			},
			HephaestusAboutPersephoneQueen02 =
			{
				Name = "HephaestusAboutPersephoneQueen02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusAboutPersephoneQueen01", "PersephoneHomeMeeting04" },
				{ Cue = "/VO/Hephaestus_0075",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Even if you disagree with your father, you must continue to show him respect. He's been through so much, even I couldn't know where to start. Maybe start by listening to him." },
			},
			HephaestusOlympusSecurity01 =
			{
				Name = "HephaestusOlympusSecurity01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "Ending01" },
				-- I'm grateful.
				EndCue = "/VO/ZagreusField_4962",
				EndWait = 0.45,
				{ Cue = "/VO/Hephaestus_0076",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I hear you're Head of Underworld Security now. We have one of those up here too, you know. I suspect he's far better at it than you are. Pff. I suppose we'll never know." },
			},
			HephaestusRunProgress01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredBiome = "Elysium",
				RequiredMinRunsCleared = 1,
				{ Cue = "/VO/Hephaestus_0077",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You made it to Elysium? Good work. Say hello to Theseus for me. He is such a genuine hero." },
			},
			HephaestusRunProgress02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredAnyRoomsThisRun = { "C_Boss01", "C_MiniBoss01" },
				{ Cue = "/VO/Hephaestus_0078",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Did you meet Asterius on your way up? He's very committed to his... friendship with Theseus, and I respect that in a hero." },
			},
			HephaestusRunProgress03 =
			{
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredBiome = "Tartarus",
				{ Cue = "/VO/Hephaestus_0079",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Still in Tartarus, Zagreus? What are you doing? Hurry up! For the love of Zeus!" },
			},	
			HephaestusRunCleared01 =
			{
				Name = "HephaestusRunCleared01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredMinRunsCleared = 1,
				RequiresLastRunCleared = true,
				{ Cue = "/VO/Hephaestus_0080",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I was informed that you got out? Finally... And yet you returned because you perished before reaching us up here? The surface can be harsh sometimes. At least you proved it is possible. I'll continue my support until you make it to Olympus." },
			},
			HephaestusAboutDefiance01 =
			{
				Name = "HephaestusAboutDefiance01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredMinLastStandsUsed = 1,
				{ Cue = "/VO/Hephaestus_0081",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I see you've used that Defiance to keep you alive when you should've perished, Zagreus. Messing with our own death is risky, but every risk is worth taking when we have nothing to lose. Keep trying." },
			},
			HephaestusAboutDefiance02 =
			{
				Name = "HephaestusAboutDefiance02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredFalseGodLoots = { "AthenaUpgrade", "HestiaUpgrade" },
				RequiredMinLastStandsUsed = 1,
				RequiredMaxLastStands = 0,
				{ Cue = "/VO/Hephaestus_0082",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "No more Defiance to help you? Maybe you should ask Hestia or Athena. I've heard they have some to spare. Until then, take this." },
			},
			HephaestusAboutDefiance03 =
			{
				Name = "HephaestusAboutDefiance03",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredMinLastStandsUsed = 1,
				RequiredMaxLastStands = 3,
				{ Cue = "/VO/Hephaestus_0083",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You keep getting that Defiance back, I see. Is it some kind of parlor trick Nyx showed you to cheat death? I look forward to seeing a demonstration in person upon your arrival on Olympus." },
			},
			HephaestusAboutKeepsake01 =
			{
				Name = "HephaestusAboutKeepsake01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredTrait = "ForceHephaestusBoonTrait",
				{ Cue = "/VO/Hephaestus_0084",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					--Emote = "PortraitEmoteMusical",
					Text = "My KEEPSAKE! I can't believe I gave it to someone like you. You're not even a hero. Hmph. Anyway, a gift from a queen is forever. Cherish it." },
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
				{ Cue = "/VO/Hephaestus_0085",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "This is the best you'll ever get from me, Zagreus. Don't make me regret my decision to expend this much effort on your cause." },
			},
			HephaestusLowHealth01 =
			{
				Name = "HephaestusLowHealth01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredMaxHealthFraction = 0.30,
				RequiredMaxLastStands = 0,

				{ Cue = "/VO/Hephaestus_0086",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Emote = "PortraitEmoteSurprise",
					Text = "Aw, look who's about to die. Just make sure to send my blessing back. A real hero might need it." },
			},
			HephaestusLowHealth02 =
			{
				Name = "HephaestusLowHealth02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredMaxHealthFraction = 0.30,
				RequiredMaxLastStands = 0,

				{ Cue = "/VO/Hephaestus_0087",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Life is short. Yours, especially, it seems. Still, as a generous queen, I give you this." },
			},
			HephaestusLowHealth03 =
			{
				Name = "HephaestusLowHealth03",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredMaxHealthFraction = 0.30,
				RequiredMaxLastStands = 0,

				{ Cue = "/VO/Hephaestus_0088",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Let's make this quick. You clearly won't make it very far anyway." },
			},
			HephaestusPostGiftPickup01 =
			{
				Name = "HephaestusPostGiftPickup01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusGift01", },
				{ Cue = "/VO/Hephaestus_0089",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I prepared this blessing for another hero, but he died before I could give it to him. You can use it, little hero, since he won't be needing it in your realm." },
			},
			HephaestusPostGiftPickup02 =
			{
				Name = "HephaestusPostGiftPickup02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusGift02", },
				{ Cue = "/VO/Hephaestus_0090",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I call you little hero because I see you as weaker than other heroes. Not because of your height. I just wanted to be clear." },
			},

			HephaestusPostGiftPickup03 =
			{
				Name = "HephaestusPostGiftPickup03",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusGift03", },
				{ Cue = "/VO/Hephaestus_0091",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I already used all the gifts you gave me, little hero. Don't worry, Nectar and Ambrosia are terribly common here. Join us, if you'd like some." },
			},
			HephaestusBackstory01 =
			{
				Name = "HephaestusBackstory01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0092",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Placeholder" },
			},
			HephaestusBackstory02 =
			{
				Name = "HephaestusBackstory02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusBackstory01"},
				{ Cue = "/VO/Hephaestus_0093",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Placeholder" },
			},
			HephaestusBackstory03 =
			{
				Name = "HephaestusBackstory03",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusBackstory02" },
				{ Cue = "/VO/Hephaestus_0094",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Placeholder" },
			},
			HephaestusBackstory04 =
			{
				Name = "HephaestusBackstory04",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusBackstory03" },
				{ Cue = "/VO/Hephaestus_0095",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Placeholder" },
			},
			HephaestusBackstory05 =
			{
				Name = "HephaestusBackstory05",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusBackstory04"},
				{ Cue = "/VO/Hephaestus_0096",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Placeholder" },
			},				
		},

		PickupTextLineSets =
		{
			HephaestusFirstPickUp =
			{
				Name = "HephaestusFirstPickUp",
				PlayOnce = true,
				RequiredTextLines = { "AthenaFirstPickUp", "DionysusFirstPickUp", },
				{ Cue = "/VO/ZagreusField_4960", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 4.23 },
					PostLineAnim = "ZagreusInteractEquip", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "The power of a queen.… I know only one person this could be. In the name of Hades! Olympus! I accept this message." },
				{ Cue = "/VO/Hephaestus_0001",
					PortraitExitWait = 1.25,
					PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
					UseEventEndSound = true,
					Text = "I have heard very much about you, Zagreus. I remain unsure if you are a hero, or more like your father. I suppose the only way to know is by allowing you to borrow my blessing to get out of this wretched realm. Don't disappoint me." },
			},
			HephaestusMiscPickup01 =
			{
				Name = "HephaestusMiscPickup01",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0002",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Still climbing this wretched realm, Zagreus? I'm not terribly fond of your father, but at least he gets results." },
			},
			HephaestusMiscPickup02 =
			{
				Name = "HephaestusMiscPickup02",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0003",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I haven't a clue why every soul here places their obols on you escaping from this place. I don't think you have it in you, but I'll give you a chance. Don't disappoint me, Zagreus." },
			},
			HephaestusMiscPickup03 =
			{
				Name = "HephaestusMiscPickup03",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				RequiredMaxHealthFraction = 0.75,
				{ Cue = "/VO/Hephaestus_0004",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "There's always someone stronger than you, Zagreus. No one escapes that fate, save one. ...Obviously, I'm not talking about you, but you might be just strong enough to pass your father's security. Here; you can thank me when you finally succeed." },
			},
			HephaestusMiscPickup04 =
			{
				Name = "HephaestusMiscPickup04",
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0005",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You can learn a lot by observing others. I was tricked many times when I was much younger, and more naive. Now, I know better. Let me show you a thing or two." },
			},
			HephaestusMiscPickup05 =
			{
				Name = "HephaestusMiscPickup05",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0006",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "A true hero isn't born a hero. A hero is defined by their actions. But even a hero must answer to their queen. If you want to be a hero one day, Zagreus, you'd do well to remember this." },
			},
			HephaestusMiscPickup06 =
			{
				Name = "HephaestusMiscPickup06",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0007",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I always saw you Underworld gods as beneath us... That's all. You keep trying to do... whatever it is you're doing. Oh, poor you." },
			},
			HephaestusMiscPickup07 =
			{
				Name = "HephaestusMiscPickup07",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0008",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "If your sad escape attempts continue to utterly fail at producing results, Zagreus, I may consider withdrawing my help for your cause. It's verging on pathetic at this point, really." },
			},
			HephaestusMiscPickup08 =
			{
				Name = "HephaestusMiscPickup08",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0009",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You can't always rely on others, Zagreus. You must learn how to pick yourself up when you fall." },
			},
			HephaestusMiscPickup09 =
			{
				Name = "HephaestusMiscPickup09",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0010",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Olympus is full of our egocentric relatives all proclaiming their own magnificence. I hope that when you get here, it won't be adding one more. I won't allow it." },
			},
			HephaestusMiscPickup10 =
			{
				Name = "HephaestusMiscPickup10",
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				{ Cue = "/VO/Hephaestus_0011",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "My blessing comes with a price. One that I hope you'll be willing to pay, when the time comes." },
			},
			HephaestusMiscPickup11 =
			{
				Name = "HephaestusMiscPickup11",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0012",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "When I agreed to help you with your rebellion against your father, I didn't think it would take {#DialogueItalicFormat}forever{#PreviousFormat}. Do hurry up." },
			},
			HephaestusMiscPickup12 =
			{
				Name = "HephaestusMiscPickup12",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0013",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The world can be cruel at times. Luckily, we are there to improve it. Don't let anyone make you think otherwise." },
			},
			HephaestusMiscPickup13 =
			{
				Name = "HephaestusMiscPickup13",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0014",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Once a year, when I bathe at Kanathos, I feel fresh and revived, like new feathers on a bird after a molt. I'm sure you feel the same when you die and come out of your pool full of... {#DialogueItalicFormat}blood{#PreviousFormat}... Or perhaps not." },
			},
			HephaestusMiscPickup14 =
			{
				Name = "HephaestusMiscPickup14",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				MinRunsSinceAnyTextLines = { TextLines = { "HephaestusPostEpilogue01" }, Count = 3 },
				{ Cue = "/VO/Hephaestus_0015",
					PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
					Emote = "PortraitEmoteMusical",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "If you manage to get to the surface, you ought to try the white substance that comes from these majestic surface creatures. I was the first to call them cows, and then everyone else started using the name... Anyhow, that's only if you ever get up there." },
			},
			HephaestusMiscPickup15 =
			{
				Name = "HephaestusMiscPickup15",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0016",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You've never truly lost until you give up. That's why I keep supporting your cause, even if I think you should have given up ages ago. But what do I know? I always succeed in my pursuits. Unlike you." },
			},
			HephaestusMiscPickup16 =
			{
				Name = "HephaestusMiscPickup16",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0017",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Look at you, still doing your best after all those failed attempts. I almost feel pity for you, little hero." },
			},
			HephaestusMiscPickup17 =
			{
				Name = "HephaestusMiscPickup17",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0018",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I am once more here for you, little hero. But when are you going to return the favor, {#DialogueItalicFormat}hm{#PreviousFormat}? Soon, I hope." },
			},
			HephaestusMiscPickup18 =
			{
				Name = "HephaestusMiscPickup18",
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp" },
				{ Cue = "/VO/Hephaestus_0019",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You have died many times by now. And yet, you've never given up. I can admit, I admire your perseverance, little hero." },
			},
			HephaestusMiscPickup19 =
			{
				Name = "HephaestusMiscPickup19",
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HephaestusFirstPickUp", "HephaestusGift07" },
				{ Cue = "/VO/Hephaestus_0020",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You could have given up, but I know it's my help that keeps you going, little hero. I won't give up on you, as long as you do the same." },
			},

			-- shorter acknowledgments
			HephaestusMiscPickup20 =
			{
				Name = "HephaestusMiscPickup20",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0021",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Off with their heads, Zagreus. Show no mercy." },
			},
			HephaestusMiscPickup21 =
			{
				Name = "HephaestusMiscPickup21",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0022",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Think like me, Zagreus. A queen is not afraid to fail. Failure is simply another steppingstone to greatness." },
			},
			HephaestusMiscPickup22 =
			{
				Name = "HephaestusMiscPickup22",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0023",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "When everyone else is losing their head, it is important to keep yours." },
			},
			HephaestusMiscPickup23 =
			{
				Name = "HephaestusMiscPickup23",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0024",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I am a queen, and I demand to be treated like a queen. Show them all, Zagreus." },
			},
			HephaestusMiscPickup24 =
			{
				Name = "HephaestusMiscPickup24",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0025",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The secret of a happy marriage remains a secret." },
			},
			HephaestusMiscPickup25 =
			{
				Name = "HephaestusMiscPickup25",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0026",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "A successful marriage requires falling in love over and over again with the same person." },
			},
			HephaestusMiscPickup26 =
			{
				Name = "HephaestusMiscPickup26",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0027",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Marriage is neither heaven nor hell, it is simply purgatory." },
			},
			HephaestusMiscPickup27 =
			{
				Name = "HephaestusMiscPickup27",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0028",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "By my name, Zagreus... wake up and show some results." },
			},
			HephaestusMiscPickup28 =
			{
				Name = "HephaestusMiscPickup28",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0029",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "For once, I believe you can succeed. Truly. After all, it is impossible to fail that many times in a row." },
			},
			HephaestusMiscPickup29 =
			{
				Name = "HephaestusMiscPickup29",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0030",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Of all the peasants of the Underworld, you could say you are not my least favorite. Feel free to take that as a compliment." },
			},

			HephaestusMiscPickup30 =
			{
				Name = "HephaestusMiscPickup30",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0031",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "If this was your father, I am sure he would be out by now. Olympus can't be that far, Zagreus." },
			},
			HephaestusMiscPickup31 =
			{
				Name = "HephaestusMiscPickup31",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0032",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Marriage is about commitment, and you have showed yours. Keep doing... whatever you do." },
			},
			HephaestusMiscPickup32 =
			{
				Name = "HephaestusMiscPickup32",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0033",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Is there something else I can help you with? I have others duties besides you, you know." },
			},
			HephaestusMiscPickup33 =
			{
				Name = "HephaestusMiscPickup33",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0034",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You are not the center of the world, Zagreus. Take this and get out." },
			},
			HephaestusMiscPickup34 =
			{
				Name = "HephaestusMiscPickup34",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0035",
					PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
					Emote = "PortraitEmoteMusical",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I am starting to doubt you ever want to come to Olympus. But you would never lie to your queen. Am I right?" },
			},
			HephaestusMiscPickup35 =
			{
				Name = "HephaestusMiscPickup35",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0036",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You won't find any more committed than me, Zagreus. I'll keep helping you until you join us." },
			},
			HephaestusMiscPickup36 =
			{
				Name = "HephaestusMiscPickup36",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0037",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Dying must be a common thing for you at this point. Strange hobby." },
			},
			HephaestusMiscPickup37 =
			{
				Name = "HephaestusMiscPickup37",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0038",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You are always welcome on Olympus. That is, if you can prove yourself worthy of it." },
			},
			HephaestusMiscPickup38 =
			{
				Name = "HephaestusMiscPickup38",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0039",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I have others duties to attend to. Take this and I'll be on my way." },
			},
			HephaestusMiscPickup39 =
			{
				Name = "HephaestusMiscPickup39",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HephaestusBasicPickUpTextLines,
				{ Cue = "/VO/Hephaestus_0040",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Another deed done. What's next on my list? A queen's job is never finished." },
			},
		},

		BoughtTextLines =
		{
			HephaestusLootBought01 =
			{
				Name = "HephaestusLootBought01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				-- You just did.
				EndCue = "/VO/ZagreusField_4988",
				EndWait = 0.45,
				{ Cue = "/VO/Hephaestus_0099",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Part of what you just gave to Charon is coming back to me; it's part of our trade arrangement. I won't say anything so prosaic as, \"thank you for your purchase.\"" },
			},
			HephaestusLootBought02 =
			{
				Name = "HephaestusLootBought02",
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },

				{ Cue = "/VO/Hephaestus_0100",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I suppose the cost was low enough for your rank, this time. Good for you." },
			},
			HephaestusLootBought03 =
			{
				Name = "HephaestusLootBought03",
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },

				{ Cue = "/VO/Hephaestus_0101",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "And here I thought you would never have enough obols for my blessings." },
			},
		},
		
		GiftTextLineSets =
		{
			-- gives gift in exchange
			HephaestusGift01 =
			{
				Name = "HephaestusGift01",
				PlayOnce = true,
				{ Cue = "/VO/ZagreusField_4965", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "You seemed to think little of me, Queen Hephaestus. I hope this gift may improve our relationship." },
				{ Cue = "/VO/Hephaestus_0132",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Pff{#PreviousFormat}. As queen of Olympus, I receive countless gifts and offerings each day. Yours makes no difference; you'll never be remembered as a true hero. Still, I suppose you could try by starting with this. Use it wisely." },
			},
			HephaestusGift02 =
			{
				Name = "HephaestusGift02",
				PlayOnce = true,
				RequiredTextLines = { "HephaestusGift01" },
				{ Cue = "/VO/ZagreusField_4966", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "I don't want to be remembered like the heroes stuck in Elysium. I just want to make a genuine connection with you, Queen Hephaestus." },
				{ Cue = "/VO/Hephaestus_0133",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "In order to form a connection, both parties must be in agreement, and I don't see any reason to connect with you. I don't fraternize with lower ranked little godlings." },
			},
			HephaestusGift03 =
			{
				Name = "HephaestusGift03",
				PlayOnce = true,
				RequiredTextLines = { "HephaestusGift02" },
				{ Cue = "/VO/ZagreusField_4967", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "I know you might never see me as an equal, Queen Hephaestus. But I am persistent, and this is my way to show you the truth of my words." },
				{ Cue = "/VO/Hephaestus_0134",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Truth? Hah. You speak like someone else I know, and I do not need another hero like him in my life. Cease with this nonsense, or I'll stop accepting your gifts." },
			},
			HephaestusGift04 =
			{
				Name = "HephaestusGift04",
				PlayOnce = true,
				RequiredTextLines = { "HephaestusGift03" },
				{ Cue = "/VO/ZagreusField_4968", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "I didn't mean to upset you, Queen Hephaestus. This gift is not to prove that I'm a hero. It's only to show my respect for you." },
				{ Cue = "/VO/Hephaestus_0135",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Many before you have given me gifts with ill intentions. I shall judge myself if you are worthy of my respect." },
			},
			HephaestusGift05 =
			{
				Name = "HephaestusGift05",
				PlayOnce = true,
				RequiredTextLines = { "HephaestusGift04" },
				{ Cue = "/VO/ZagreusField_4969", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "I don't know what it is with you and heroes, Queen Hephaestus, but I hope we can become friends." },
				{ Cue = "/VO/Hephaestus_0136",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Stop this nonsense, Zagreus. I don't have friends, I have servants. Now go fetch more gifts for your queen." },
			},
			HephaestusGift06 =
			{
				Name = "HephaestusGift06",
				PlayOnce = true,
				RequiredTextLines = { "HephaestusGift05" },
				{ Cue = "/VO/ZagreusField_4970", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "I found some more Nectar for you, Queen Hephaestus. Even though those aren't exactly rare in your realm." },
				{ Cue = "/VO/Hephaestus_0137",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Indeed. And I am growing tired of it. Unless you can find me something of more substance, I order you to cease with this meaningless gift giving." },
			},
			HephaestusGift07 =
			{
				Name = "HephaestusGift07",
				PlayOnce = true,
				RequiredTextLines = { "HephaestusGift06" },
				{ Cue = "/VO/ZagreusField_4971", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "This is no Nectar, my queen. And I know this doesn't make me a hero, or whatever, I just wanted you to have it. I promise I'll stop bothering you from now on, if that's what you'd prefer." },
				{ Cue = "/VO/Hephaestus_0138",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					PostLineThreadedFunctionName = "MaxedRelationshipPresentation",
					PostLineFunctionArgs = { Text = "NPC_Hephaestus_01", Icon = "Keepsake_HephaestusSticker_Max" },
					Text = "{#DialogueItalicFormat}Hmph{#PreviousFormat}. I see you went to a fair amount of trouble to bring me this bottle. Such a shame, when I already have several. You are obviously no hero... Perhaps, at best, a little hero. Maybe we will be able to make something of you, in the end." },
			},
			HephaestusGift08 =
			{
				Name = "HephaestusGift08",
				PlayOnce = true,
				RequiredTextLines = { "HephaestusGift07" },
				{ Cue = "/VO/ZagreusField_4971", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "This is no Nectar, my queen. And I know this doesn't make me a hero, or whatever, I just wanted you to have it. I promise I'll stop bothering you from now on, if that's what you'd prefer." },
				{ Cue = "/VO/Hephaestus_0138",
					PortraitExitWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					PostLineThreadedFunctionName = "MaxedRelationshipPresentation",
					PostLineFunctionArgs = { Text = "NPC_Hephaestus_01", Icon = "Keepsake_HephaestusSticker_Max" },
					Text = "{#DialogueItalicFormat}Hmph{#PreviousFormat}. I see you went to a fair amount of trouble to bring me this bottle. Such a shame, when I already have several. You are obviously no hero... Perhaps, at best, a little hero. Maybe we will be able to make something of you, in the end." },
			},
		},		
		GiftGivenVoiceLines =
		{
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			PlayFromTarget = true,

			-- I'll try, Lord Hephaestus.
			{ Cue = "/VO/ZagreusField_4972" },
		},

		--ShoutActivationSound = "/SFX/BurnDamage",
		ShoutVoiceLines =
		{
			{
				BreakIfPlayed = true,
				PlayFromTarget = true,
				RandomRemaining = true,
				RequiredKillEnemiesFound = true,
				RequiredFalseSpurnedGodName = "HermesUpgrade",

				-- The fury of Olympus!
				-- { Cue = "/VO/Athena_0065" },
			},
			{
				BreakIfPlayed = true,
				PlayFromTarget = true,
				RandomRemaining = true,
				RequiredKillEnemiesFound = true,
				RequiredSpurnedGodName = "HermesUpgrade",
				RequireCurrentEncounterNotComplete = true,

				-- I strongly disapprove.
				-- { Cue = "/VO/Athena_0103" },
			},
		},		
	}

	-- Gift Section
	local OlympusGiftOrdering = ModUtil.Entangled.ModData(GiftOrdering)
	local OlympusGiftData = ModUtil.Entangled.ModData(GiftData)
	table.insert(OlympusGiftOrdering, 22, "ForceHephaestusBoonTrait")

	OlympusGiftData.HephaestusUpgrade =
	{
		InheritFrom = { "DefaultGiftData" },
		MaxedIcon = "Keepsake_Hephaestus_Max",
		MaxedSticker = "Keepsake_HephaestusSticker_Max",
		MaxedRequirement = { RequiredTextLines = { "HephaestusGift07" }, },
		Value = 0,
		Maximum = 7,
		Locked = 7,
		[1] = { Gift = "ForceHephaestusBoonTrait" },
		[7] = { RequiredResource = "SuperGiftPoints" },
		UnlockGameStateRequirements = { RequiredTextLines = { "HephaestusBackstory04" } }
	}
	-- Multi Gods compatibility
	if ModUtil.Mods.Data["HestiaExtra"] ~= nil then 
		
	end
	if ModUtil.Mods.Data["ApolloExtra"] ~= nil then
        
    end
	-- FUNCTIONS
	ModUtil.Path.Wrap( "IsHermesBoon", 
		function(baseFunc, traitName)
			if traitName ~= nil then
				local result  = baseFunc(traitName)
				for i, loot in pairs (LootData) do
					if loot.Icon == "BoonSymbolHermes" and loot.TraitIndex[traitName] then
						return true
					end
				end
				return false
			end
			return false
		end
	)
	
	function CreateHephaestusLoot( args )
		args = args or {}
		return CreateLoot( MergeTables( args, { Name = "HephaestusUpgrade" } ) )
	end
	function AddArmor(number)
	
	end

	function AddMaxArmor(number)
		AddArmor(number)
	end

	ModUtil.Path.Wrap( "BeginOpeningCodex", 
		function(baseFunc)		
			-- if (not CanOpenCodex()) and IsSuperValid() then
			-- 	BuildSuperMeter(CurrentRun, 50)
			-- end
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString.Deep(GiftOrdering)) 
			CreateLoot({ Name = "HephaestusUpgrade", SpawnPoint = CurrentRun.Hero.ObjectId } )
			baseFunc()
		end
	)

end
