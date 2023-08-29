-- Separate Gods from Goddess to add more gods

if ModUtil ~= nil then
	ModUtil.Mod.Register("GaiaExtra")

	local mod = "GaiaExtra"
	local package = "GaiaPackage"
	--Variables
	local DepthDamageMultiplier = 0.0
	local DuplicateMultiplier = -0.60
	local DuplicateStrongMultiplier = -0.40
	local DuplicateVeryStrongMultiplier = -0.20
	--Color
	local OlympusColor = ModUtil.Entangled.ModData(Color)
	OlympusColor.GaiaVoice = { 158, 136, 121, 255 }
	OlympusColor.GaiaDamageLight = { 158, 136, 121, 255 }
	OlympusColor.GaiaDamage = { 128, 111, 104, 255 }
	--QuestData
	local OlympusQuestData = ModUtil.Entangled.ModData(QuestData)
	OlympusQuestData.GaiaDeeds =
	{
		Name = "GaiaDeeds",
		InheritFrom = { "DefaultQuestItem" },
		RewardResourceName = "LockKeys",
		RewardResourceAmount = 30,
		UnlockGameStateRequirements =
		{
			RequiredTextLines = { "GaiaGift02", },
		},
		CompleteGameStateRequirements =
		{
			RequiredTraitsTaken =
			{
				"GaiaDeedCentaurHeartTrait",
				"GaiaDeedDifferentGodTrait",
				"GaiaDeedSpendObolTrait",
				"GaiaDeedMetaPointsTrait",
				"GaiaDeedChallengeSwitchTrait",
				"GaiaDeedSameGodTrait",
				"GaiaDeedNoDamageTrait",
				"GaiaDeedFastEncounterTrait",
				"GaiaDeedHealingTrait",
				"GaiaDeedMaxShoutTrait",
				"GaiaDeedSellTrait",
				"GaiaDeedStoreTrait",
				"GaiaDeedDodgeTrait",
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

			-- I think Master Chaos just likes messing with me.
			{ Cue = "/VO/ZagreusHome_2982" },
		},
	}
	local OlympusQuestOrderData = ModUtil.Entangled.ModData(QuestOrderData)
	table.insert(OlympusQuestOrderData, 40, "GaiaDeeds")
	
	-- GlobalVoiceLines
	local OlympusGlobalVoiceLines = ModUtil.Entangled.ModData(GlobalVoiceLines)
	local OlympusHeroVoiceLines = ModUtil.Entangled.ModData(HeroVoiceLines)
	table.insert(OlympusGlobalVoiceLines.BoonUsedVoiceLines, {
		BreakIfPlayed = true,
		RandomRemaining = true,
		PreLineWait = 0.5,
		RequiredLastGodLoot = "GardenUpgrade",
		RequiredEncounters = { "DevotionTestTartarus", "DevotionTestAsphodel", "DevotionTestElysium", },
		RequireCurrentEncounterNotComplete = true,
		Source = { SubtitleColor = Color.GaiaVoice },

		-- A fine performance.
		{ Cue = "/VO/Gaia_0162" },
		-- You can do better.
		{ Cue = "/VO/Gaia_0163" },
		-- Do it for your queen.
		{ Cue = "/VO/Gaia_0164" },
		-- Lasted longer than I expected.
		{ Cue = "/VO/Gaia_0165" },
		-- Barely made it, I assume.
		{ Cue = "/VO/Gaia_0166" },
		-- With this, you'd better not lose.
		{ Cue = "/VO/Gaia_0167" },
		-- There's nothing better than my blessings.
		{ Cue = "/VO/Gaia_0168" },
		-- You never give up, do you?
		{ Cue = "/VO/Gaia_0169" },
		-- That's right, bow to your queen.
		{ Cue = "/VO/Gaia_0170" },
		-- Likely to fail, but I am still helping you.
		{ Cue = "/VO/Gaia_0171" },
		-- I can be generous.
		{ Cue = "/VO/Gaia_0172" },
		-- The best of all Olympus.
		{ Cue = "/VO/Gaia_0173" },
	})
	table.insert(OlympusHeroVoiceLines.UpgradePickedVoiceLines, {
		RandomRemaining = true,
		BreakIfPlayed = true,
		SuccessiveChanceToPlay = 0.5,
		PreLineWait = 0.75,
		RequiredLastGodLoot = "GardenUpgrade",
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
		-- Queen Gaia!!
		Cue = "/VO/ZagreusField_4987",
		RequiredTrait = "GaiaShoutTrait",
		RequiredFalseSpurnedGodName = "GardenUpgrade"
	})
	table.insert(OlympusHeroVoiceLines.SwapUpgradePickedVoiceLines, {
		RandomRemaining = true,
		BreakIfPlayed = true,
		PreLineWait = 0.65,
		SuccessiveChanceToPlayAll = 0.33,
		RequiredFalseEncounters = { "DevotionTestTartarus", "DevotionTestAsphodel", "DevotionTestElysium", },
		RequiredSwappedGodLoot = "GardenUpgrade",
		CooldownName = "SaidGaiaRecently",
		CooldownTime = 40,

		-- I'm sure Queen Gaia won't mind.
		{ Cue = "/VO/ZagreusField_4983" },
		-- Surely Gaia won't mind.
		{ Cue = "/VO/ZagreusField_4984" },
		-- Queen Gaia won't mind, will she?
		{ Cue = "/VO/ZagreusField_4985" },
	})
	--BoonInfoScreenData
	local OlympusBoonInfoScreenData = ModUtil.Entangled.ModData(BoonInfoScreenData)
	table.insert(OlympusBoonInfoScreenData.Ordering, "GardenUpgrade")

	--ProjectileData
	local OlympusProjectileData = ModUtil.Entangled.ModData(ProjectileData)
	OlympusProjectileData.GaiaColorProjectile = {
		DamageTextStartColor = OlympusColor.GaiaDamageLight,
		DamageTextColor = OlympusColor.GaiaDamage
	}
	-- GameData
	local OlympusGameData = ModUtil.Entangled.ModData(GameData)
	OlympusGameData.GaiaBasicPickUpTextLines = {
		"GaiaFirstPickUp",
		"GaiaMiscPickup01",
		"GaiaMiscPickup02",
		"GaiaMiscPickup03",
		"GaiaMiscPickup04",
		"GaiaMiscPickup05",
		"GaiaMiscPickup06",
		"GaiaMiscPickup07",
		"GaiaMiscPickup08",
		"GaiaMiscPickup09",
		"GaiaMiscPickup10",
		"GaiaMiscPickup11",
		"GaiaMiscPickup12",
		"GaiaMiscPickup13",
		"GaiaMiscPickup14",
		"GaiaMiscPickup15",
		"GaiaMiscPickup16",
		"GaiaMiscPickup17"
	}
	GameData.RunClearMessageData.ClearRequiredTraitsGaia =
	{
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements =
		{
			RequiredCountOfTraitsCount = 3,
			RequiredCountOfTraits =
			{
				"GaiaBlessingMeleeTrait",
				"GaiaBlessingRangedTrait",
				"GaiaBlessingAmmoTrait",
				"GaiaBlessingMaxHealthTrait",
				"GaiaBlessingBoonRarityTrait",
				"GaiaBlessingMoneyTrait",
				"GaiaBlessingMetapointTrait",
				"GaiaBlessingTrapDamageTrait",
				"GaiaBlessingSecondaryTrait",
				"GaiaBlessingDashAttackTrait",
				"GaiaBlessingExtraPomsTrait"
			},
			RequiredOneOfTraits = { "GaiaBlessingExtraPomsTrait" },
		},
	}
	table.insert(OlympusGameData.ConversationOrder, "GardenUpgrade")
	--Keywords
	local OlympusKeywordList = ModUtil.Entangled.ModData(KeywordList)
	--ModUtil.Table.Merge(OlympusKeywordList, { "JealousyCurse", "EnvyCurse", "GaiaTrap", "Aura", "SpecialDiscount" })
	--ResetKeywords()

	-- Codex Section
	local OlympusCodexOrdering = ModUtil.Entangled.ModData(CodexOrdering)
	local OlympusCodex = ModUtil.Entangled.ModData(Codex)
	table.insert(OlympusCodexOrdering.ChthonicGods.Order, "GardenUpgrade")
	--table.insert(OlympusCodexOrdering.Items.Order, 6, "RoomRewardEmptyHealthDrop")

	OlympusCodex.ChthonicGods.Entries["GardenUpgrade"] =
	{
		Entries =
		{
			{
				UnlockThreshold = 1,
				Text = "CodexData_Gaia_0001"
			},
			{
				UnlockThreshold = 5,
				Text = "CodexData_Gaia_0002"
			},
			{
				UnlockThreshold = 15,
				Text = "CodexData_Gaia_0003"
			}
		},
		Image = "Codex_Portrait_Gaia",
	}

	-- Trait Section
	local OlympusTraitData = ModUtil.Entangled.ModData(TraitData)
	OlympusTraitData.GaiaDeedTrait =
	{
		Icon = "Shop_Vial",
	}

	OlympusTraitData.GaiaDeedRemainingEncounters =
	{
		--[[RemainingUses =
		{
			BaseMin = 3,
			BaseMax = 4,
			AsInt = true,
		},
		UsesAsEncounters = true,]]
	}

	OlympusTraitData.GaiaBlessingTrait =
	{
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.00,
				MaxMultiplier = 1.00,
			},
			Rare =
			{
				MinMultiplier = 1.5,
				MaxMultiplier = 1.5,
			},
			Epic =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
		}
	}
	OlympusTraitData.GaiaBoonTrait =
	{
		Icon = "Keepsake_Egg",
		EquipSound = "/SFX/Menu Sounds/KeepsakeChaosEgg",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ChaosBoonTrait_Rack",
		SecretDoorCostMultiplier =
		{
			BaseMin = 0,
			BaseMax = 0,
		},
		RarityBonus =
		{
			RequiredGod = "GardenUpgrade",
			RareBonus = { BaseValue = 0.2 },
			EpicBonus = 0.15,
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
			Text = "ChaosSignoff",
		  },
		  {
			RequiredTextLines = { "ChaosGift08" },
			Text = "ChaosSignoff_Max"
		  }
		},
	}
	-- Gaia Deeds
	OlympusTraitData.GaiaDeedCentaurHeartTrait =
	{
		InheritFrom = { "GaiaDeedTrait", "GaiaDeedRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
	}
	OlympusTraitData.GaiaDeedDifferentGodTrait =
	{
		InheritFrom = { "GaiaDeedTrait", "GaiaDeedRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
	}
	OlympusTraitData.GaiaDeedSpendObolTrait =
	{
		InheritFrom = { "GaiaDeedTrait", "GaiaDeedRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
	}
	OlympusTraitData.GaiaDeedMetaPointsTrait =
	{
		InheritFrom = { "GaiaDeedTrait", "GaiaDeedRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
	}
	OlympusTraitData.GaiaDeedChallengeSwitchTrait =
	{
		InheritFrom = { "GaiaDeedTrait", "GaiaDeedRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
	}
	OlympusTraitData.GaiaDeedSameGodTrait =
	{
		InheritFrom = { "GaiaDeedTrait", "GaiaDeedRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
	}
	OlympusTraitData.GaiaDeedNoDamageTrait =
	{
		InheritFrom = { "GaiaDeedTrait", "GaiaDeedRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
	}
	OlympusTraitData.GaiaDeedFastEncounterTrait =
	{
		InheritFrom = { "GaiaDeedTrait", "GaiaDeedRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
	}
	OlympusTraitData.GaiaDeedHealingTrait =
	{
		InheritFrom = { "GaiaDeedTrait", "GaiaDeedRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
	}
	OlympusTraitData.GaiaDeedMaxShoutTrait =
	{
		InheritFrom = { "GaiaDeedTrait", "GaiaDeedRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
	}
	OlympusTraitData.GaiaDeedSellTrait =
	{
		InheritFrom = { "GaiaDeedTrait", "GaiaDeedRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
	}
	OlympusTraitData.GaiaDeedStoreTrait =
	{
		InheritFrom = { "GaiaDeedTrait", "GaiaDeedRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
	}
	OlympusTraitData.GaiaDeedDodgeTrait =
	{
		InheritFrom = { "GaiaDeedTrait", "GaiaDeedRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
	}
	-- Gaia Blessings
	OlympusTraitData.GaiaBlessingMoneyTrait =
	{
		InheritFrom = { "GaiaBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_05",
		CustomName = "ChaosBlessingMoneyTrait_Complete",
		MoneyMultiplier =
		{
			BaseMin = 1.3,
			BaseMax = 1.5,
			ToNearest = 0.05,
			SourceIsMultiplier = true,
		},
		ExtractValues =
		{
			{
				Key = "MoneyMultiplier",
				ExtractAs = "TooltipMoneyRewardIncrease",
				Format = "PercentDelta",
			},
		}
	}
	OlympusTraitData.GaiaBlessingBackstabTrait =
	{
		InheritFrom = { "GaiaBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_15",
		CustomName = "ChaosBlessingBackstabTrait_Complete",
		RequiredMetaUpgradeSelected = "BackstabMetaUpgrade",
		AddOutgoingDamageModifiers =
		{
            HitVulnerabilityMultiplier = { BaseMin = 1.6, BaseMax = 1.8, SourceIsMultiplier = true },
            ExtractValues =
            {
                {
                    Key = "HitVulnerabilityMultiplier",
                    ExtractAs = "TooltipDamageBonus",
                    Format = "PercentDelta",
                },
            }
		},
	}
	OlympusTraitData.GaiaBlessingAlphaStrikeTrait =
	{
		InheritFrom = { "GaiaBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_14",
		CustomName = "ChaosBlessingAlphaStrikeTrait_Complete",
		RequiredMetaUpgradeSelected = "FirstStrikeMetaUpgrade",
		AddOutgoingDamageModifiers =
		{
            HitMaxHealthMultiplier = { BaseMin = 1.3, BaseMax = 1.5, SourceIsMultiplier = true },
            ExtractValues =
            {
                {
                    Key = "HitMaxHealthMultiplier",
                    ExtractAs = "TooltipDamageBonus",
                    Format = "PercentDelta",
                },
            }
		},
	}
	OlympusTraitData.GaiaBlessingMetapointTrait = {
		InheritFrom = { "GaiaBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_06",
		CustomName = "ChaosBlessingMetapointTrait_Complete",
		MetaPointMultiplier =
			{
				BaseMin = 1.50,
				BaseMax = 1.80,
				SourceIsMultiplier = true,
			},
		ExtractValues =
		{
			{
				Key = "MetaPointMultiplier",
				ExtractAs = "TooltipMetaPointRewardIncrease",
				Format = "PercentDelta",
			},
		},
		GemMultiplier = { ReplaceWithKeyValue = "MetaPointMultiplier"},
	}
	OlympusTraitData.GaiaBlessingBoonRarityTrait =
	{
		InheritFrom = { "GaiaBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_10",
		CustomName = "ChaosBlessingBoonRarityTrait_Complete",
		RarityBonus =
		{
			RareBonus =
			{
				BaseMin = 0.11,
				BaseMax = 0.20,
			},
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
	}
	OlympusTraitData.GaiaBlessingSecondaryTrait =
	{
		InheritFrom = { "GaiaBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_12",
		CustomName = "ChaosBlessingSecondaryTrait_Complete",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = { BaseMin = 1.3, BaseMax = 1.6, SourceIsMultiplier = true },
			ValidWeapons = WeaponSets.HeroSecondaryWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
	}
	OlympusTraitData.GaiaBlessingAmmoTrait =
	{
		InheritFrom = { "GaiaBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_03",
		CustomName = "ChaosBlessingAmmoTrait_Complete",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Epic =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "MaxAmmo",
				BaseMin = 1,
				BaseMax = 1,
				AsInt = true,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipCapacity",
				}
			},
		},
	}
	OlympusTraitData.GaiaBlessingDashAttackTrait =
	{
		InheritFrom = { "GaiaBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_13",
		CustomName = "ChaosBlessingDashAttackTrait_Complete",
		RequiredFalseTraits = { "GunLoadedGrenadeTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = { BaseMin = 1.4, BaseMax = 1.6, SourceIsMultiplier = true },
			ValidWeapons = WeaponSets.HeroDashWeapons,
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
	}
	OlympusTraitData.GaiaBlessingRangedTrait =
	{
		InheritFrom = { "GaiaBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_02",
		CustomName = "ChaosBlessingRangedTrait_Complete",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = { BaseMin = 1.3, BaseMax = 1.4, SourceIsMultiplier = true },
			ValidWeapons = WeaponSets.HeroNonPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
	}
	OlympusTraitData.GaiaBlessingMaxHealthTrait =
	{
		InheritFrom = { "GaiaBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_04",
		CustomName = "ChaosBlessingMaxHealthTrait_Complete",
		PropertyChanges =
		{
			{
				LuaProperty = "MaxHealth",
				BaseMin = 30,
				BaseMax = 40,
				AsInt = true,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipHealth",
				}
			},
		},
	}
	OlympusTraitData.GaiaBlessingMeleeTrait =
	{
		InheritFrom = { "GaiaBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_01",
		CustomName = "ChaosBlessingMeleeTrait_Complete",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = { BaseMin = 1.3, BaseMax = 1.4, SourceIsMultiplier = true },
			ValidWeapons = WeaponSets.HeroPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
	}
	OlympusTraitData.GaiaBlessingExtraPomsTrait =
	{
		InheritFrom = { "GaiaBlessingTrait" },
		RequiredOneOfTraits =  { "ChaosBlessingMeleeTrait", "ChaosBlessingRangedTrait", "ChaosBlessingAmmoTrait", "ChaosBlessingMaxHealthTrait", "ChaosBlessingBoonRarityTrait", "ChaosBlessingMoneyTrait", "ChaosBlessingMetapointTrait", "ChaosBlessingSecondaryTrait", "ChaosBlessingDashAttackTrait","ChaosBlessingBackstabTrait", "ChaosBlessingAlphaStrikeTrait" },
		ChanceToPlay = 0.20,
		RarityLevels =
		{
			Legendary =
			{
				MinMultiplier = 1,
				MaxMultiplier = 1,
			},
		},
		Icon = "Boon_Chaos_Blessing_08",
		CustomName = "ChaosBlessingExtraChanceTrait_Complete",
		DummyTrait = true,
		AddLastStand =
		{
			Icon = "ExtraLifeChaos",
			WeaponName = "LastStandMetaUpgradeShield",
			HealFraction = 0.5,
			IncreaseMax = true,
		}
	}

	-- LootData
	local OlympusLootData = ModUtil.Entangled.ModData(LootData)
	OlympusLootData.GardenUpgrade =
	{
		Name = "GardenUpgrade",
		InheritFrom = { "BaseLoot", "BaseSoundPackage" },
		GodLoot = false,
		CanReceiveGift = true,
		AlwaysShowDefaultUseText = true,
		Weight = 10,
		Icon = "BoonSymbolGaia",
		BoonInfoIcon = "BoonInfoSymbolGaiaIcon",
		DoorIcon = "BoonSymbolGaiaIsometric",
		ConfirmSound = "/SFX/Menu Sounds/GaiaBoonConfirm",
		Color = { 100, 25, 255, 255 },
		LightingColor = { 100, 25, 255, 255 },
		LootColor = { 100, 25, 255, 255 },
		SubtitleColor = { 1.000, 0.973, 0.733, 1.0 },
		EventEndSound = "/Leftovers/Menu Sounds/SkillUpgradeConfirm",
		UpgradeSelectedSound = "/SFX/GaiaBoonChoice",

		TransformingTraits = true,
		PermanentTraits = { "GaiaBlessingMeleeTrait", "GaiaBlessingRangedTrait", "GaiaBlessingAmmoTrait",
			"GaiaBlessingMaxHealthTrait", "GaiaBlessingBoonRarityTrait", "GaiaBlessingMoneyTrait",
			"GaiaBlessingMetapointTrait", "GaiaBlessingSecondaryTrait", "GaiaBlessingDashAttackTrait",
			"GaiaBlessingExtraPomsTrait", "GaiaBlessingBackstabTrait", "GaiaBlessingAlphaStrikeTrait", },
		TemporaryTraits = { "GaiaDeedCentaurHeartTrait", "GaiaDeedDifferentGodTrait", "GaiaDeedSpendObolTrait",
			"GaiaDeedMetaPointsTrait", "GaiaDeedChallengeSwitchTrait", "GaiaDeedSameGodTrait",
			"GaiaDeedNoDamageTrait", "GaiaDeedFastEncounterTrait", "GaiaDeedHealingTrait", "GaiaDeedMaxShoutTrait",
			"GaiaDeedSellTrait", "GaiaDeedStoreTrait", "GaiaDeedDodgeTrait", },

		Speaker = "NPC_Gaia_01",
		Portrait = "Portrait_Gaia_Default_01",
		OverlayAnim = "GaiaOverlay",
		Gender = "X",
		SpawnSound = "/SFX/Menu Sounds/KeepsakeChaosEgg",
		FlavorTextIds =
		{
			"GardenUpgrade_FlavorText01",
			"GardenUpgrade_FlavorText02",
			"GardenUpgrade_FlavorText03",
		},

		PickupFunctionName = "GaiaInteractPresentation",
		PickupGlobalVoiceLines = "GaiaBoonUsedVoiceLines",

		--[[UpgradeMenuOpenVoiceLines =
		{
			{
				PlayOnce = true,
				BreakIfPlayed = true,
				PreLineWait = 1.3,
				RequiredTextLinesThisRoom = { "GaiaRevealsBeowulfAspect01", },
				Queue = "Always",

				-- I see you stand your ground against the serpent's flame...
				{ Cue = "/VO/ZagreusField_3579" },
			},
			{
				PlayOnce = true,
				BreakIfPlayed = true,
				PreLineWait = 1.3,
				RequiredTextLinesThisRoom = { "GaiaSurfaceQuest01", },
				Queue = "Always",

				-- Um... yes? Was I supposed to respond there?
				{ Cue = "/VO/ZagreusField_3805" },
			},
			[3] = GlobalVoiceLines.CheckOlympianReunionVoiceLines,
			[4] = GlobalVoiceLines.FoundRareBoonVoiceLines,
		},]]

		SuperPriorityPickupTextLineSets =
		{
			--[[GaiaAboutBeowulfAspect01_A =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaRevealsBeowulfAspect01" },
				RequiredFalseTextLines = { "GaiaAboutBeowulfAspect02" },
				RequiredFalseTraits = { "ShieldLoadAmmoTrait" },
				RequiredFalsePlayed = { "/VO/ZagreusHome_2648" },
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",

				{
					Cue = "/VO/Gaia_0316",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					UseEventEndSound = true,
					Text =
					"I sense that you have not yet spoken with the all-seeing artifact you call Aegis. Tamper with the Fates' design, then, all you like. But if you change your mind, do speak the words to it: {#DialogueItalicFormat}I see you stand your ground against the serpent's flame.{#PreviousFormat}"
				},
			},
			GaiaAboutBeowulfAspect01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaAboutBeowulfAspect01_A", "GaiaAboutShieldWeapon01" },
				RequiredFalseTextLines = { "GaiaAboutBeowulfAspect02" },
				RequiredFalseTraits = { "ShieldLoadAmmoTrait" },
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },

				{
					Cue = "/VO/Gaia_0293",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					UseEventEndSound = true,
					Text =
					"You have not yet used the waking-phrase that I imparted? Or perhaps you merely chose not to present me the result. I would quite like to see it, at some point. Remember, Son of Hades: Say to the all-seeing artifact, {#DialogueItalicFormat}I see you stand your ground against the serpent's flame.{#PreviousFormat}"
				},
			},
			GaiaAboutBeowulfAspect02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaRevealsBeowulfAspect01" },
				RequiredTrait = "ShieldLoadAmmoTrait",
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },

				{
					Cue = "/VO/Gaia_0179",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					UseEventEndSound = true,
					Text =
					"Out of the infinitely spanning possibilities, here before me stands the Son of Hades, bearing my all-seeing artifact, appearing in the aspect of a bearer yet unborn, who shall be known throughout the north as Beowulf. How very droll."
				},
			},

			GaiaSurfaceQuestComplete =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "LordHadesGaiaSurfaceQuestDefeat01" },
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },
				{
					Cue = "/VO/Gaia_0320",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"I faintly sensed that you were able to confront your father while in possession of my small round catalyst. It seems my asking you, and your success, was in accordance with the Fates' design, as well. The result is more amusing even than expected. Thus, thank you."
				},
			},

			-- NyxGaiaReunionQuest
			GaiaAboutNyx05 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				Priority = true,
				RequiredCosmetics = { "NyxQuestItem" },
				RequiredFalseQueuedTextLines = { "NyxInGaia01" },
				RequiredFalseTextLines = { "NyxInGaia01" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0283",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"I have detected some unusual activity within the reaches of the Underworld, Son of Hades... vast sums of Darkness, collected in an ancient catalyst, which I see now almost like a beacon, shining in the night. This either is the work of Nyx, or you, or both. I am anticipating the result."
				},
			},

			-- NyxGaiaReunionQuest Complete
			GaiaAboutNyx06 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredUnitAlive = "NPC_Nyx_Story_01",
				RequiredCosmetics = { "NyxQuestItem" },
				RequiredTextLines = { "NyxAboutGaia07" },
				{
					Cue = "/VO/Gaia_0284",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					SetFlagFalse = "NyxGaiaReunionInProgress",
					Text =
					"It pleases me immensely, Son of Hades, to have seen the goddess Nyx again. The significant amount of time that has elapsed since last this happened dulled sufficiently old pains, I think. Thus, it becomes a basis on which our connection may, in time, take shape again."
				},
			},

			GaiaAboutResponding01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03", "GaiaGift01", },
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },

				{
					Cue = "/VO/Gaia_0168",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					Text =
					"As we become acquainted, Son of Hades, I shall make myself quite clear in one respect: I fear I have a lack of patience for discussion. When visiting, please merely listen, then accept my mark, and then depart. Respond only when necessary. Or when prompted. Yes?"
				},
				{
					Cue = "/VO/ZagreusField_3458",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Defiant_01",
					SecretMusicMutedStems = { "GaiaBass" },
					PreLineWait = 0.4,
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"...Merely listen, so it's just like when I get those messages from the Olympians. Wait, you did just prompt me, Master Gaia, didn't you? Or should I have remained silent just now?"
				},
				{
					Cue = "/VO/Gaia_0169",
					SecretMusicActiveStems = { "GaiaBass" },
					UseEventEndSound = true,
					Text =
					"I cannot offer you advice. But you were prompted, yes. You may speak freely, then, or anytime, despite my wishes that you not do so. Absolute silence is my general preference. It may not be yours."
				},
			},

			GaiaAboutNyx01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaAboutResponding01", "GaiaGift01", "NyxAboutGaia01" },
				RequiredAnyTextLines = { "NyxPostFlashback01", "ZeusBackstory01", "AresAboutNyx01", "AthenaBackstory01" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete", "GaiaAboutNyx01_B" },
				{
					Cue = "/VO/Gaia_0081",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					Text =
					"I understand that Zeus and all his kin on Mount Olympus think that you are born of Hades and the goddess Nyx? I was amused to learn of this deception. Nyx has mothered many of the Underworld's own, so, why not you?"
				},
				{
					Cue = "/VO/ZagreusField_0541",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Serious_01",
					SecretMusicMutedStems = { "GaiaBass" },
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "She isn't my birthmother, no, but she is like a mother to me. Do you know her?"
				},
				{
					Cue = "/VO/Gaia_0082",
					SecretMusicActiveStems = { "GaiaBass" },
					UseEventEndSound = true,
					Text =
					"Oh, I know the goddess Nyx quite well, of course. Though, it has been a while since we last communicated, and I fear... well, I was not the charitable sort, back then. It is my hope that Nyx is faring well."
				},
			},

			GaiaAboutNyx01_B =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				Priority = true,
				RequiredTextLines = { "NyxAboutGaia02", "NyxGrantsRespec", "GaiaAboutResponding01" },
				RequiredAccumulatedMetaPoints = 1250,
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },
				{
					Cue = "/VO/Gaia_0277",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					Text =
					"I knew you would arrive. But only in the moments prior to the fact. Thus, I am experiencing residual surprise. Your movements through the Underworld are as though a veil of darkness enshrouds you. The goddess Nyx's influence, perhaps? Respond."
				},
				{
					Cue = "/VO/ZagreusField_3400",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Defiant_01",
					SecretMusicMutedStems = { "GaiaBass" },
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"I... do not know how to respond to that, exactly, Master Gaia, but, Nyx, yes, she has been aiding me, in my attempts to flee my father's realm."
				},
				{
					Cue = "/VO/Gaia_0278",
					SecretMusicActiveStems = { "GaiaBass" },
					UseEventEndSound = true,
					Text =
					"You move in darkness, not as infinitely black as hers, but reminiscent to me, nonetheless. I would invite her to try to elude me, and then attempt to locate her. A minor amusement for the both of us. Now, I have you for this, I see."
				},
			},

			GaiaPostEnding01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaFirstPickUp", "Ending01", "GaiaGift01" },
				MaxRunsSinceAnyTextLines = { TextLines = { "Ending01" }, Count = 20 },
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },
				{
					Cue = "/VO/Gaia_0307",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					Text =
					"Lately, Son of Hades, I have sensed what I would call a sort of shift within your father's residence. Did something noteworthy occur, perhaps? Respond."
				},
				{
					Cue = "/VO/ZagreusField_4297",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Default_01",
					SecretMusicMutedStems = { "GaiaBass" },
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Master Gaia, it's Persephone, my mother. She's returned! She's chosen to return. So... things feel different, certainly, with her around, although... I didn't feel any sort of shift."
				},
				{
					Cue = "/VO/Gaia_0308",
					UseEventEndSound = true,
					SecretMusicActiveStems = { "GaiaBass" },
					Text =
					"You may not sense these shifts as I. The lightness of this space bends and adjusts with time. What you describe... it must have been the cause. I trust that the occasion is a welcome one. And I am pleased that you returned, nevertheless."
				},
			},

			GaiaAboutOlympianReunionQuest01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaPostEnding01", },
				RequiredAnyTextLines = { "PersephoneAboutOlympianReunionQuest03", "NyxAboutOlympianReunionQuest02" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },
				{
					Cue = "/VO/Gaia_0313",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					Text =
					"Again I sensed some sort of shifting in your father's residence. You seek to ask something of me about it, do you not? Respond."
				},
				{
					Cue = "/VO/ZagreusField_4299",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Default_01",
					SecretMusicMutedStems = { "GaiaBass" },
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Oh, I'm glad you asked, it's just... my mother, she's... we're reaching out to the Olympians. Trying to reconnect the family. It's been a while, relatively, since she and Father saw the others, but... in case a gathering occurs, I did wish you to know you're cordially invited, too."
				},
				{
					Cue = "/VO/Gaia_0314",
					UseEventEndSound = true,
					SecretMusicActiveStems = { "GaiaBass" },
					PreLineWait = 0.35,
					Text =
					"Cordially invited...? A generous proposal, Son of Hades, though unless your gathering is to occur within my space, please understand it would be difficult for me to bring the full entirety of my presence there. However... I think I can arrange to be with you in some capacity. Thank you."
				},
			},

			-- alt below
			GaiaPostEpilogue01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaAboutOlympianReunionQuest01", "OlympianReunionQuestComplete" },
				RequiredFalseTextLines = { "GaiaPostEpilogue01_B" },
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },
				{
					Cue = "/VO/Gaia_0315",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"It pleases me your gathering of the Olympians occurred. I must inform you... I had never once before detected quite so many of my offspring in a single space. At least not without violent intent. I appreciate that you included me, and that you have returned. Shall we continue, then?"
				},
			},
			GaiaPostEpilogue01_B =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "OlympianReunionQuestComplete" },
				RequiredFalseTextLines = { "GaiaAboutOlympianReunionQuest01", "GaiaPostEpilogue01" },
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },
				{
					Cue = "/VO/Gaia_0335",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"It pleases me your gathering of the Olympians occurred. I must inform you... I had never once before detected quite so many of my offspring in a single space. At least not without violent intent."
				},
			},]]
		},

		PriorityPickupTextLineSets =
		{
			-- about other gods
			GaiaAboutZeus01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03", "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp",
					"AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp" },
				RequiredGodLoot = "ZeusUpgrade",
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },

				{
					Cue = "/VO/Gaia_0072",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"You bear the blessing of the great Lord Zeus. He still believes he holds dominion over both heaven and earth. I think, perhaps, he has forgotten about me."
				},
			},
			GaiaAboutPoseidon01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03", "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp",
					"AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp" },
				RequiredGodLoot = "PoseidonUpgrade",
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },

				{
					Cue = "/VO/Gaia_0073",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"Lord Poseidon offered you his blessing, it would seem. He can be rather boastful and belligerent, exhibiting the most unattractive manners of your father and Lord Zeus alike."
				},
			},
			GaiaAboutAthena01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03", "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp",
					"AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp" },
				RequiredGodLoot = "AthenaUpgrade",
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },

				{
					Cue = "/VO/Gaia_0074",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"This wise goddess Athena has imbued you with her charms, I see, O Son of Hades. Perhaps to her you are a tool with which her broken family may as yet be mended."
				},
			},
			GaiaAboutAres01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03", "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp",
					"AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp" },
				RequiredGodLoot = "AresUpgrade",
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },

				{
					Cue = "/VO/Gaia_0075",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"It is not unexpected that you consorted with the violent Ares, and now bear his Boon. He still worships me, you know; yet, I would say he does not know me very well."
				},
			},
			GaiaAboutAphrodite01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03", "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp",
					"AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp" },
				RequiredGodLoot = "AphroditeUpgrade",
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },

				{
					Cue = "/VO/Gaia_0077",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"The charms of goddess Aphrodite are upon you unmistakably, although I shall be curious to see if her command over one's sense of love shall have any effect beneath the earth."
				},
			},
			GaiaAboutArtemis01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03", "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp",
					"AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp" },
				RequiredGodLoot = "ArtemisUpgrade",
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },

				{
					Cue = "/VO/Gaia_0076",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"I understand the hunting-goddess Artemis recently has turned her gaze towards you. It is unexpected she would offer her assistance, even to a relative in need."
				},
			},
			GaiaAboutDionysus01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03", "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp",
					"AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
				RequiredGodLoot = "DionysusUpgrade",
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },

				{
					Cue = "/VO/Gaia_0078",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"The drunkard Dionysus offered you his services, I see? He can be rather unpredictable, and therefore offers me a source of some amusement."
				},
			},
			GaiaAboutHermes01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03", "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp",
					"AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp" },
				RequiredGodLoot = "HermesUpgrade",
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },

				{
					Cue = "/VO/Gaia_0294",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"Swift Hermes spurs you on, I see, O Son of Hades. Beware the narrow distance between hastiness and swiftness; a distinction I am not so sure the god of travel fully understands."
				},
			},
			GaiaAboutDemeter01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03", "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp",
					"AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp" },
				RequiredGodLoot = "DemeterUpgrade",
				RequiredFalseTextLines = { "DemeterLiftsWinterCurse01" },
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },

				{
					Cue = "/VO/Gaia_0295",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"Embittered Demeter has reached you, hasn't she? She once was full of warmth, you know; but lately, as I understand, she is more prone to taking it away."
				},
			},

			-- backstory
			GaiaAboutOlympians01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03", "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp",
					"AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "HermesFirstPickUp", "GaiaGift01" },
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },
				RequiredAnyTextLines = { "Flashback_Mother_01", "CerberusStyxMeeting01" },
				{
					Cue = "/VO/Gaia_0085",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"You have met many of the Olympians by now, each spurring you toward their mountaintop. They place such value on familial bonds, yet none of them remember who I am. Do not place too much faith in them, O Son of Hades."
				},
			},
			GaiaAboutOlympians02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaAboutOlympians01", "GaiaAboutResponding01" },
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },
				{
					Cue = "/VO/Gaia_0170",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"I ask you listen but not speak, O Son of Hades, whilst the Olympians? They do not ask at all. They merely send their messages to you, unprompted, providing a choice of blessing, but no say. I seek to understand their point of view. But it is difficult."
				},
			},
			GaiaAboutOlympians03 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaAboutOlympians01", },
				RequiredMinAnyTextLines = {
					TextLines = { "ZeusGift01", "PoseidonGift01", "AthenaGift01", "AphroditeGift01", "AresGift01",
						"ArtemisGift01", "DionysusGift01", "HermesGift01", "DemeterGift01" }, Count = 4 },
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },
				{
					Cue = "/VO/Gaia_0171",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"When you extend an offering to the Olympians, for a fleeting instant, it appears as though they are able to hear your prayer. Or so I have observed. How interesting that your thoughts are capable of breaking free, yet you cannot."
				},
			},

			GaiaAboutHades01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03", "ZeusFirstPickUp", "PoseidonFirstPickUp", "GaiaGift02" },
				RequiredMinNPCInteractions = { NPC_Hades_01 = 5 },
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },

				{
					Cue = "/VO/Gaia_0086",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"Your father and his brothers, when they sealed the Titans in the darkest reaches of this world, that was the last they saw of me, as well. You are dissimilar from them, and I feel safe communicating thus with you."
				},
			},

			GaiaAboutNyx01_C =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaAboutNyx01_B", "NyxAboutGaia03", "GaiaGift03" },
				{
					Cue = "/VO/Gaia_0321",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"I was at times uncharitable with the goddess Nyx, when we were closer, long ago. After she bore her first children, I nevertheless expected her attention to remain undivided. I kept creating. When finally I slowed, I realized my mistake. But our connection had been severed, by that point."
				},
			},

			GaiaAboutNyx02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaAboutNyx01_B", "NyxAboutGaia04" },
				-- for backwards compatibility
				RequiredFalseTextLines = { "NyxGaiaReunionQuestComplete" },
				{
					Cue = "/VO/Gaia_0083",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					Text =
					"I sense that something is the matter, Son of Hades. Speak, then, what is on your mind? I can decipher some of it without your telling though would rather hear it from you voluntarily."
				},
				{
					Cue = "/VO/ZagreusField_0542",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Serious_01",
					SecretMusicMutedStems = { "GaiaBass" },
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"{#DialogueItalicFormat}Erm{#PreviousFormat}, Master Gaia? The goddess Nyx, she... seems to want to speak with you again. I wonder, would you maybe contact her sometime? She seems convinced it is your move to make if you so choose."
				},
				{
					Cue = "/VO/Gaia_0279",
					SecretMusicActiveStems = { "GaiaBass" },
					UseEventEndSound = true,
					Text =
					"The goddess Nyx wishes to hear from me...? Now that is unexpected, Son of Hades, and I wonder if, perhaps, this is a jest of yours. Though, your intentions evidently are sincere. Then, I shall make no promises in this, except that... I am considering the possibility."
				},
			},
			GaiaAboutNyx03 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaAboutNyx01_C" },
				RequiredFalseTextLinesLastRun = { "GaiaAboutNyx01_C" },
				{
					Cue = "/VO/Gaia_0280",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"Son of Hades, should eventually you spawn your own offspring... I recommend maintaining sub-infinite distances with them in space and time. Even if they are most tiresome, there always seems to come a point when one wishes to be in their presence once again."
				},
			},

			-- NyxGaiaReunionQuest
			GaiaAboutNyx04 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "NyxAboutGaia05" },
				{
					Cue = "/VO/Gaia_0281",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					Text =
					"After some consideration, and on your recommendation, I attempted lately to make contact with the goddess Nyx again. She is quite distant from me now, of course. If you happen to know... did she receive the message well? Respond."
				},
				{
					Cue = "/VO/ZagreusField_3401",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Serious_01",
					SecretMusicMutedStems = { "GaiaBass" },
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Well, Master Gaia, she can be a little difficult to read at times, but... I got the impression she was quite surprised, even excited to have heard from you again. She said that she would think about how to respond. Or, whether to respond."
				},
				{
					Cue = "/VO/Gaia_0282",
					SecretMusicActiveStems = { "GaiaBass" },
					UseEventEndSound = true,
					Text =
					"I see. Well, she shall find a way, if it is warranted. I always did expect the world from her. There were times when I expected her to shine as bright as day, though she is Night. When she achieved a certain level of ability... she left. And I could not find her."
				},
			},

			-- NyxGaiaReunionQuest Post-Quest
			GaiaPostReunionQuest01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				RequiredCosmetics = { "NyxQuestItem" },
				RequiredTextLines = { "GaiaAboutNyx06", "GaiaGift07" },
				MinRunsSinceAnyTextLines = { TextLines = { "GaiaAboutNyx06" }, Count = 2 },
				{
					Cue = "/VO/Gaia_0322",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"My daughter, the goddess Nyx. When I learned the Olympians mistakenly assumed she was your mother, I did not fully consider the possibility that she essentially was a mother to you... the technicality of birth, aside. She cares for you to the extent a mother can."
				},
			},
			GaiaPostReunionQuest02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				RequiredCosmetics = { "NyxQuestItem" },
				RequiredTextLines = { "GaiaPostReunionQuest01" },
				MinRunsSinceAnyTextLines = { TextLines = { "GaiaPostReunionQuest01", }, Count = 3 },
				{
					Cue = "/VO/Gaia_0323",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"Prior to your intervention, Son of Hades, I expected that the goddess Nyx had forgotten about me... whether purposefully, or from passage of time. I believed that to be forgotten was the one true inevitability. Perhaps, however, I was incorrect."
				},
			},
			GaiaPostReunionQuest03 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				RequiredCosmetics = { "NyxQuestItem" },
				RequiredTextLines = { "GaiaPostReunionQuest02", "GaiaGift08" },
				MinRunsSinceAnyTextLines = { TextLines = { "GaiaPostReunionQuest02" }, Count = 3 },
				{
					Cue = "/VO/Gaia_0324",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"I find that it is difficult maintaining my connection with many consciousnesses, such as yours, and that of the goddess Nyx. Yet I am also finding that this difficulty is fully warranted. Our connections give me much to consider as I await our next exchange."
				},
			},

			-- relationship improved
			GaiaStatusImproved01 =
			{
				PlayOnce = true,
				RequiredTextLines = { "GaiaGift07" },
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },
				{
					Cue = "/VO/Gaia_0070",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"Ah, here is my favorite among those immortals dwelling underneath the Earth. How may I change your life today, O Son of Hades?"
				},
			},
			GaiaStatusImproved02 =
			{
				RequiredTextLines = { "GaiaGift04" },
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },

				{
					Cue = "/VO/Gaia_0071",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"May you enjoy a moment's peace within my space before venturing on in uncertainty. To my surprise, I must admit I do appreciate the company."
				},
			},

			GaiaPostFlashback01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "PersephoneFirstMeeting", "GaiaFirstPickUp", "AthenaFirstPickUp",
					"ZeusFirstPickUp", "PoseidonFirstPickUp", "ArtemisFirstPickUp", "AphroditeFirstPickUp",
					"DionysusFirstPickUp", "AresFirstPickUp", "HermesFirstPickUp", "DemeterFirstPickUp",
					"GaiaAboutResponding01" },
				RequiredAnyTextLines = { "GaiaAboutPersephone01", "GaiaAboutPersephone01_B" },
				RequiredFalseTextLines = { "PersephoneAboutOlympianReunionQuest01" },
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },
				{
					Cue = "/VO/Gaia_0079",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					Text =
					"Have you grown trusting yet of the Olympians, for all their generosity? Perhaps you ought to let them know the truth about your journey's goal. They are vain, and think that it is them you seek."
				},
				{
					Cue = "/VO/ZagreusField_0540",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Serious_01",
					SecretMusicMutedStems = { "GaiaBass" },
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"I'll never get out of here if not for their help, but... I can't let them know about Mother. She wants to remain hidden from them."
				},
				{
					Cue = "/VO/Gaia_0080",
					UseEventEndSound = true,
					SecretMusicActiveStems = { "GaiaBass" },
					Text =
					"A difficult position to be in, Son of Hades. The Olympians may not appreciate being misled. But you can trust that I shall keep your secret. I wish to see how your predicament plays out."
				},
			},

			GaiaDarknessProgress01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaFirstPickUp" },
				RequiredAccumulatedMetaPoints = 10000,
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },
				{
					Cue = "/VO/Gaia_0298",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"Such darkness emanates from you, O Son of Hades, that I once again did not entirely anticipate you would arrive just now. I suspect even your father must have difficulty keeping track of you through the domain he calls his own."
				},
			},
			GaiaDarknessProgress02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaFirstPickUp" },
				RequiredAccumulatedMetaPoints = 600,
				{
					Cue = "/VO/Gaia_0325",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"You move in darkness, practically unseen, Son of Hades. It is quite difficult even for me to sense your presence at times. The Olympians catch their glimpses now and then. But you are always in a shroud. Thus is the influence of Nyx."
				},
			},

			-- high affinity
			GaiaAboutFates01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaGift07" },
				{
					Cue = "/VO/Gaia_0299",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"How strange it is to be subjected to the Fates. But do not fall into the cognitive delusion that they have already made your choices for you, Son of Hades. Rather, they are keen about anticipating every choice that everyone shall make. Such as the following."
				},
			},
			GaiaAboutInfinity01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaGift08", "GaiaAboutResponding01" },
				{
					Cue = "/VO/Gaia_0296",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					Text =
					"I sense your consternation, Son of Hades, as you look about this space; you have another question, and are free to ask."
				},
				{
					Cue = "/VO/ZagreusField_3402",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Empathetic_01",
					SecretMusicMutedStems = { "GaiaBass" },
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Oh, it's just... I sometimes wonder, Master Gaia... if you created all of this, then... who created {#DialogueItalicFormat}you{#PreviousFormat}? What was this place before you arrived?"
				},
				{
					Cue = "/VO/Gaia_0297",
					UseEventEndSound = true,
					SecretMusicActiveStems = { "GaiaBass" },
					Text =
					"All of this simply came to be, and so did I, presumably after a former time had finally reached its end. I hesitate to say it was an act of will. It was more like a sudden shift, as when a conflagration happens from a spark. I arrived at such a time, and all else then arrived, from me."
				},
			},
			GaiaAboutDeath01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaAboutInfinity01" },
				RequiredFalseTextLinesLastRun = { "GaiaAboutInfinity01" },
				{
					Cue = "/VO/Gaia_0300",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"When you expire, and then suddenly return to life within your father's residence, perhaps it is akin to when I first gained consciousness so long ago. Perhaps I, too, had just expired, only to reawaken."
				},
			},
			GaiaAboutDiscovery01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaGift07", "NyxGift07" },
				{
					Cue = "/VO/Gaia_0301",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"You may have wondered, Son of Hades, how it is you came to find me in this space, when I have gone unseen by most for quite some time. I have wondered this, as well, and think that our connection to Goddess Nyx is the most likely answer."
				},
			},

			-- alt below (if you met persephone already)
			GaiaAboutPersephone01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaAboutResponding01", "GaiaGift01" },
				RequiredAnyTextLines = { "Flashback_Mother_01", "CerberusStyxMeeting01" },
				RequiredFalseTextLines = { "GaiaAboutPersephone01_B", "PersephoneFirstMeeting" },
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },
				{
					Cue = "/VO/Gaia_0302",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					Text =
					"Son of Hades, I believe I have deduced something I ought have sooner recognized. Your mother must have been one who called herself Persephone. Her stay within the Underworld was brief, from my perspective, but impactful, nonetheless. You seek her now? Respond."
				},
				{
					Cue = "/VO/ZagreusField_3403",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Serious_01",
					SecretMusicMutedStems = { "GaiaBass" },
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"I do. She's somewhere on the surface. That's why I keep on finding you like this. I'm trying to find her."
				},
				{
					Cue = "/VO/Gaia_0303",
					UseEventEndSound = true,
					SecretMusicActiveStems = { "GaiaBass" },
					Text =
					"I hope that your attempts achieve success. She is beyond my senses, presently, though of course I am still able to assist you in your journey, thus."
				},
			},
			GaiaAboutPersephone01_B =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaAboutResponding01", "GaiaGift01", "PersephoneFirstMeeting" },
				RequiredAnyTextLines = { "Flashback_Mother_01", "CerberusStyxMeeting01" },
				RequiredFalseTextLines = { "Ending01", "GaiaAboutPersephone01" },
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },
				{
					Cue = "/VO/Gaia_0302",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					Text =
					"Son of Hades, I believe I have deduced something I ought have sooner recognized. Your mother must have been one who called herself Persephone. Her stay within the Underworld was brief, from my perspective, but impactful, nonetheless. You seek her now? Respond."
				},
				{
					Cue = "/VO/ZagreusField_4296",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Empathetic_01",
					SecretMusicMutedStems = { "GaiaBass" },
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Oh, Master Gaia... you should know I have located her, already. Though where she is, I cannot stay for long. So I am visiting, as often as I can. It's... not unlike our visits here. Only, somehow, even harder to get to where she is."
				},
				{
					Cue = "/VO/Gaia_0306",
					UseEventEndSound = true,
					SecretMusicActiveStems = { "GaiaBass" },
					Text =
					"I see. Then, it is good to know that you have been in contact. And I trust that your successive visits shall be worth their while. Not unlike our visits here."
				},
			},

			GaiaAboutPersephone02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaAboutPersephone01", "GaiaGift05", },
				RequiredFalseTextLines = { "PersephoneFirstMeeting", "GaiaAboutPersephone01_B" },
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },
				{
					Cue = "/VO/Gaia_0304",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					Text =
					"Son of Hades, if you locate the one who called herself Persephone, shall it then come to pass that we no longer see each other in this way? Respond."
				},
				{
					Cue = "/VO/ZagreusField_3404",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Empathetic_01",
					SecretMusicMutedStems = { "GaiaBass" },
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Oh! I... Master Gaia, I don't know what to expect from there. But, to be direct with you, if I could leave the Underworld forever... I think I would. Though, I would miss you. Many others here."
				},
				{
					Cue = "/VO/Gaia_0305",
					UseEventEndSound = true,
					SecretMusicActiveStems = { "GaiaBass" },
					PreLineWait = 0.5,
					Text = "...I would miss you as well. Thank you for telling me."
				},
			},

			GaiaPostEnding02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaPostEnding01" },
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },
				{
					Cue = "/VO/Gaia_0309",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					Text =
					"Tell me something, Son of Hades. If the one who called herself Persephone is back, then... why do you continue to return? Respond."
				},
				{
					Cue = "/VO/ZagreusField_4298",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Default_01",
					SecretMusicMutedStems = { "GaiaBass" },
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Master Gaia, it seems I've developed something of a talent around breaking out of here. Or, there, I mean, the Underworld, so... it's become more of an official role for me, I guess. If escape shouldn't be possible, then someone needs to find the gaps."
				},
				{
					Cue = "/VO/Gaia_0310",
					UseEventEndSound = true,
					SecretMusicActiveStems = { "GaiaBass" },
					PreLineWait = 0.35,
					Text =
					"Indeed. Then, you shall visit with me still, despite accomplishing the principal object of your journey back when first we met. Good."
				},
			},

			GaiaAboutFishing01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredCosmetics = { "FishingUnlockItem" },
				RequiredAnyCaughtFishTypes = { "Fish_Gaia_Common_01", "Fish_Gaia_Rare_01", "Fish_Gaia_Legendary_01" },
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },

				{
					Cue = "/VO/Gaia_0176",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"I am impressed that you were able to procure a specimen out from the flowing currents here in my domain, with nothing but a simple instrument. I shall look forward to your subsequent attempts."
				},
			},
			GaiaAboutKeepsake01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTrait = "GaiaBoonTrait",
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },

				{
					Cue = "/VO/Gaia_0292",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"I trust the small round catalyst which I provided you has been of value, Son of Hades? It is my hope it makes your journeys to this space less difficult, perhaps inducing them on a more frequent interval."
				},
			},
			GaiaAboutBlackShawl01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaFirstPickUp" },
				RequiredTrait = "BackstabAlphaStrikeTrait",
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },

				{
					Cue = "/VO/Gaia_0291",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"You have arrived within a certain shroud of darkness, Son of Hades. The goddess Nyx's ancient shawl. I had not sensed its void in a considerable amount of time."
				},
			},

			GaiaAboutStyx01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaFirstPickUp" },
				RequiredRoomLastRun = "D_Intro",
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },

				{
					Cue = "/VO/Gaia_0317",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"You have traveled recently beyond my senses, Son of Hades. I persist here only in the fathomless depths. I know what lies out there, having created it. But I know nothing of what it is like, right now. Do not tell me. I prefer to think of all the possibilities."
				},
			},
			GaiaSurfaceQuest01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaAboutStyx01", "GaiaGift06", "LordHadesDefeated02" },
				RequiredRoomLastRun = "D_Intro",
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },
				RequiredMinRunsCleared = 2,

				{
					Cue = "/VO/Gaia_0318",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					Text =
					"From the rumblings of the earth, I have deduced your father, himself, stands against you when at last you are about to leave these depths. It must be quite an interaction between you. Have I deduced correctly? Respond."
				},
				{
					Cue = "/VO/ZagreusField_3804",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Default_01",
					SecretMusicMutedStems = { "GaiaBass" },
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"That's right, Master Gaia. My father personally takes it upon himself to stop me in the event none of his underlings beat him to it. He... can be a handful."
				},
				{
					Cue = "/VO/Gaia_0319",
					UseEventEndSound = true,
					SecretMusicActiveStems = { "GaiaBass" },
					Text =
					"Well, then. Consider bringing to one of your future interactions the small round catalyst, which I provided you. The one in the shape you call an egg? It shall serve no purpose there at all. Yet if you succeed, then it shall bring us some amusement, shall it not?"
				},
			},
			-- low health
			GaiaLowHealth01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaFirstPickUp" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },

				{
					Cue = "/VO/Gaia_0103",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					UseEventEndSound = true,
					Text =
					"It seems to me that you are very close to death, O Son of Hades, and yet you deigned to visit me within my space. I could hasten your demise, if you so choose?"
				},
			},
			GaiaLowHealth02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaFirstPickUp" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },

				{
					Cue = "/VO/Gaia_0104",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					UseEventEndSound = true,
					Text =
					"I almost did not notice you, O Son of Hades, for you are closer now to death than life. Perhaps, though, we can stave off the inevitable for a little while."
				},
			},
			GaiaLowHealth03 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaFirstPickUp" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },

				{
					Cue = "/VO/Gaia_0180",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					UseEventEndSound = true,
					Text =
					"Your deaths are but a temporary setback, Son of Hades. Though it appears to me you are quite close to having such a setback, now."
				},
			},
			GaiaLowHealth04 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaFirstPickUp" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },

				{
					Cue = "/VO/Gaia_0181",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					UseEventEndSound = true,
					Text =
					"Your next experience with death seems to be imminent, though let us see if I can hasten or forestall it."
				},
			},
			GaiaLowHealth05 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaFirstPickUp", "GaiaGift03" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },

				{
					Cue = "/VO/Gaia_0182",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					UseEventEndSound = true,
					Text =
					"It may seem cruel that I would wish you death, O Son of Hades. But from my perspective, it means you are much more likely to return to me."
				},
			},
			GaiaLowHealth06 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaFirstPickUp" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },

				{
					Cue = "/VO/Gaia_0183",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					UseEventEndSound = true,
					Text =
					"Although you may succumb soon to your injuries, please make the most of your remaining life, rather than anticipate the next. The future is uncertain to all save the Fates."
				},
			},

			-- weapons & weapon enchantments
			GaiaAboutShieldWeapon01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaFirstPickUp" },
				RequiredFalseTextLines = { "GaiaAboutWeaponEnchantments01", "GaiaAboutShieldWeapon01" },
				RequiredWeapon = "ShieldWeapon",
				RequiredFalseTraits = { "ShieldRushBonusProjectileTrait", "ShieldTwoShieldTrait", },
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },
				{
					Cue = "/VO/Gaia_0172",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"You come to my domain bearing an all-seeing artifact that sprang from me after the dawn of time. It is considered a defensive instrument, I do believe. Though, I suspect you have discovered, or soon shall discover, it is nothing of the sort."
				},
			},
			GaiaAboutWeaponEnchantments01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaFirstPickUp", },
				RequiredTrait = "ShieldRushBonusProjectileTrait",
				RequiredWeapon = "ShieldWeapon",
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },

				{
					Cue = "/VO/Gaia_0173",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					Text =
					"I expected your arrival, Son of Hades. For I am able to see through you. Rather, through the all-seeing artifact, which sprang from me after the dawn of time, and now resembles, in your hands, its foremost form. Respond."
				},
				{
					Cue = "/VO/ZagreusField_2692",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Serious_01",
					SecretMusicMutedStems = { "GaiaBass" },
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"What, you must mean the Shield of Gaia, here? {#DialogueItalicFormat}Your {#PreviousFormat}shield, Master Gaia, I should say. It's a remarkable artifact. Imposing, too! Your original creations must have been astounding."
				},
				{
					Cue = "/VO/Gaia_0174",
					UseEventEndSound = true,
					SecretMusicActiveStems = { "GaiaBass" },
					Text =
					"Your response is acceptable. And I am grateful to have had my recent firsthand glimpses of this vast domain."
				},
			},
			GaiaAboutZeusAspect01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaFirstPickUp", },
				RequiredTrait = "ShieldTwoShieldTrait",
				RequiredWeapon = "ShieldWeapon",
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },

				{
					Cue = "/VO/Gaia_0175",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"Ah, you have that all-seeing artifact of mine, but in the old guise that the great Lord Zeus once used when he retaliated violently against his parentage. I watched his movements through it for some time."
				},
			},
			GaiaRevealsBeowulfAspect01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaFirstPickUp", "AchillesRevealsGuanYuAspect01" },
				RequiredAnyTextLines = { "GaiaAboutShieldWeapon01", "GaiaAboutZeusAspect01",
					"GaiaAboutWeaponEnchantments01", },
				RequiredPlayed = { "/VO/ZagreusHome_2027" },
				RequiredMinSuperLockKeysSpentOnWeapon = { Name = "ShieldWeapon", Count = 5 },
				RequiredFalseTextLinesThisRun = GameData.LegendaryAspectIntroTextLines,
				RequiredFalseTextLinesLastRun = GameData.LegendaryAspectIntroTextLines,
				RequiredFalseFlags = { "NyxGaiaReunionInProgress" },
				{
					Cue = "/VO/Gaia_0177",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					Text =
					"I bear a message for you, Son of Hades. One recorded in an age when certain concepts it describes did not yet all exist. Remember this: {#DialogueItalicFormat}I see you stand your ground against the serpent's flame. {#PreviousFormat}A waking-phrase, to which you and the all-seeing artifact of my creation may respond."
				},
				{
					Cue = "/VO/ZagreusField_3394",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Serious_01",
					SecretMusicMutedStems = { "GaiaBass" },
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"A waking-phrase... and an all-seeing artifact, you must mean Aegis, right? So I'm to say to it, {#DialogueItalicFormat}I see you stand your ground against the serpent's flame{#PreviousFormat}, and it'll wake right up. Though, can you tell me what it means, or who?"
				},
				{
					Cue = "/VO/Gaia_0178",
					SecretMusicActiveStems = { "GaiaBass" },
					UseEventEndSound = true,
					Text =
					"Oh, I can tell you almost anything. However, I would much prefer it if you learned most of the answers you seek by yourself."
				},
			},

		},

		PickupTextLineSets =
		{
			GaiaFirstPickUp =
			{
				PlayOnce = true,
				RequiredTextLines = { "AthenaFirstPickUp", },

				{
					Cue = "/VO/ZagreusField_1069",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					SecretMusicMutedStems = { "GaiaBass" },
					PreLineThreadedFunctionName = "PowerWordPresentation",
					PreLineThreadedFunctionArgs = { WaitTime = 4.9 },
					Text =
					"This is the first dialog, in the name of Hades!"
				},
			},
			GaiaMiscPickup01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaFirstPickUp", },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0050",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"I sensed a certain rumbling here within the bowels of the earth. It is as though it had ingested something that did not sit well... perhaps the earth itself wishes to spit you up and out...?"
				},
			},
			GaiaMiscPickup02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup01" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0051",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"The Olympians are vying for your favor, are they not? So often they forget themselves. They force their blessings onto you, whilst I? I merely offer you a choice."
				},
			},
			GaiaMiscPickup03 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup02" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0052",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"Your path is yours to shape as you see fit, regardless of the Fates' design. Together we may twist that path a bit, if you would like."
				},
			},
			GaiaMiscPickup04 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0053",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"I both expected you to come and am surprised to see you, Son of Hades. Where shall your journey take you from this point?"
				},
			},
			GaiaMiscPickup05 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0054",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"Please tell me how my power over all existence may be of small assistance to you this time, Son of Hades?"
				},
			},
			GaiaMiscPickup06 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0055",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"The tremors underneath the earth foretold of your arrival at this very moment, Son of Hades; and, I have anticipated it."
				},
			},
			GaiaMiscPickup07 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0056",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"You chose to visit me again within these darkest reaches of the earth, as I, in turn, now choose to offer you the means to alter your reality."
				},
			},
			GaiaMiscPickup08 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0057",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"Back when I conceived the world and the immortals, Son of Hades, I did not expect you would be standing here before me now."
				},
			},
			GaiaMiscPickup09 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0058",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"You have arrived at last, just as I wondered how we might best alter one another's courses of existence here today."
				},
			},
			GaiaMiscPickup10 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0059",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"Son of Hades, let me welcome your return here to my space within the Underworld, and bid you choose an alteration to the fabric of reality."
				},
			},
			GaiaMiscPickup11 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0060",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"It pleases me that you are here again; for, through you I can tinker with reality, along the fringes that are not yet fully formed."
				},
			},
			GaiaMiscPickup12 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredFalseTextLines = { "GaiaPostEpilogue01" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0061",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"Your presence never ceases to intrigue me, Son of Hades; for you are not like the Olympians on high, who have forgotten me, or thusly choose to act."
				},
			},
			GaiaMiscPickup13 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0062",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"From my perspective I have summoned you, whilst you believe you came of your volition; both statements can be true, is that not so?"
				},
			},
			GaiaMiscPickup14 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0063",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"Come forth, O Son of Hades, and together, let us sow my namesake through the depths of what your father thinks his own domain."
				},
			},
			GaiaMiscPickup15 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0064",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"How fares these days the never-ending cycle of rebirth and death for you, O Son of Hades? Sufficiently amusing, I should hope?"
				},
			},
			GaiaMiscPickup16 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredLootChoices = 3,
				RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0065",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"Out of the infinitely spanning possibilities before us, Son of Hades, I have arbitrarily selected only three again from which to let you choose."
				},
			},
			GaiaMiscPickup17 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0066",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"The Fates have much in store for you, O Son of Hades. Perhaps, however, we can tamper with their weavings here to some extent."
				},
			},
			GaiaMiscPickup18 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0067",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"Let us conspire to expand and frustrate your lord father's sense of both what is and is not possible within his Underworld."
				},
			},
			GaiaMiscPickup19 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredLootChoices = 3,
				RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0068",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"Infinite possibilities can be tedious to choose from, so, let me provide you with a significantly smaller set with which you may yet change the Fates' designs."
				},
			},
			GaiaMiscPickup20 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0069",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"Through the expanse of time, I often wondered, is it necessary to be fair? The immortals are my offspring; surely I should treat them equally. And yet I find that there is little sport in doing so."
				},
			},

			GaiaMiscPickupExtra01 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredLootChoices = 3,
				RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0154",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "Among infinite possibilities, consider only these."
				},
			},
			GaiaMiscPickupExtra02 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredLootChoices = 3,
				RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0155",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "Choose carefully, in general, and now."
				},
			},
			GaiaMiscPickupExtra03 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				{
					Cue = "/VO/Gaia_0156",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "We are the sum of all decisions that we make, and that are made for us."
				},
			},
			GaiaMiscPickupExtra04 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0157",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "This space grows far more interesting when you occupy a small amount of it."
				},
			},
			GaiaMiscPickupExtra05 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredLootChoices = 3,
				RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0158",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "How you evaluate decisions is of limitless interest to me."
				},
			},
			GaiaMiscPickupExtra06 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredLootChoices = 3,
				RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0159",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "The burden of the passing time shall force a choice from you."
				},
			},
			GaiaMiscPickupExtra07 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0160",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "Is there not pleasure in determining an outcome, Son of Hades?"
				},
			},
			GaiaMiscPickupExtra08 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredLootChoices = 3,
				RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0161",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "My mark be with you, Son of Hades. You need merely choose its shape."
				},
			},
			GaiaMiscPickupExtra09 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0162",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "Though the waters of the Styx may wash away my mark, I can restore it."
				},
			},
			GaiaMiscPickupExtra10 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0163",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "The rhythm of your visits here over the course of time is pleasant, Son of Hades."
				},
			},
			GaiaMiscPickupExtra11 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0164",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "You are already back, and you are always welcome, Son of Hades."
				},
			},
			GaiaMiscPickupExtra12 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03", "GaiaGift05" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0165",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "Please visit me as frequently as you would like or dare."
				},
			},
			GaiaMiscPickupExtra13 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03", "GaiaGift06" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0166",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "I find myself anticipating your arrivals, Son of Hades."
				},
			},
			GaiaMiscPickupExtra14 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaMiscPickup03" },
				RequiredLootChoices = 3,
				RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0167",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "I require no exchange of words with you. Merely a choice."
				},
			},

			GaiaMiscPickup21 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.GaiaBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0002",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "Once more you have returned to my domain."
				},
			},
			GaiaMiscPickup22 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.GaiaBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0003",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "I have a proposition, Son of Hades."
				},
			},
			GaiaMiscPickup23 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.GaiaBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0004",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "I bid you welcome here within my space."
				},
			},
			GaiaMiscPickup24 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.GaiaBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0005",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "How fares the solitary Son of Hades?"
				},
			},
			GaiaMiscPickup25 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.GaiaBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0006",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "What shall we do for one another, Son of Hades?"
				},
			},
			GaiaMiscPickup26 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.GaiaBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0007",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "You are within my presence, Son of Hades."
				},
			},
			GaiaMiscPickup27 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.GaiaBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0008",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "What brings you here to me this time around?"
				},
			},
			GaiaMiscPickup28 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.GaiaBasicPickUpTextLines,
				{
					Cue = "/VO/Gaia_0009",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "Your such visits are agreeable with me."
				},
			},
			GaiaMiscPickup29 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.GaiaBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0010",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "How may the force of Gaia alter you?"
				},
			},
			GaiaMiscPickup30 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.GaiaBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0011",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "You have arrived before me once again."
				},
			},
			GaiaMiscPickup31 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.GaiaBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0012",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "I see that you are here, and so am I."
				},
			},
			GaiaMiscPickup32 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.GaiaBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0013",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "You stand before me, Son of Hades."
				},
			},
			GaiaMiscPickup33 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.GaiaBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0014",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "How shall we alter the intentions of the Fates?"
				},
			},
			GaiaMiscPickup33 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.GaiaBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0015",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "How might I mend the fabric of existence for you, Son of Hades?"
				},
			},
			GaiaMiscPickup34 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.GaiaBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0016",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "There need not be a reason for your visit."
				},
			},
			GaiaMiscPickup35 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.GaiaBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0017",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "How may I shape reality for you?"
				},
			},
			GaiaMiscPickup36 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.GaiaBasicPickUpTextLines,
				{
					Cue = "/VO/Gaia_0018",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "You are always welcome here within this space."
				},
			},
			GaiaMiscPickup37 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.GaiaBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0019",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "What occupies your mind at this occasion?"
				},
			},
			GaiaMiscPickup38 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.GaiaBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0020",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "Let us consider certain possibilities."
				},
			},
			GaiaMiscPickup39 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredLootChoices = 3,
				RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
				RequiredTextLines = GameData.GaiaBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0021",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "Among infinite outcomes, I propose these three."
				},
			},
			GaiaMiscPickup40 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.GaiaBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0022",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "Choose how to circumvent the Fates' design."
				},
			},
			GaiaMiscPickup41 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.GaiaBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0105",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "Hail, Son of Hades."
				},
			},
			GaiaMiscPickup42 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.GaiaBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0106",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "I am amused to see you once again."
				},
			},
			GaiaMiscPickup43 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.GaiaBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0107",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "You have descended to my space once more."
				},
			},
			GaiaMiscPickup45 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.GaiaBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0108",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "You have returned to me."
				},
			},
			GaiaMiscPickup46 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.GaiaBasicPickUpTextLines,
				RequiredAnyTextLines = { "GaiaGift06" },
				{
					Cue = "/VO/Gaia_0109",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "You are most welcome here."
				},
			},

			GaiaWithNyx01 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredUnitAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Gaia_0285",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "Your presence is appreciated, Son of Hades, but please leave us here, for now."
				},
			},
			GaiaWithNyx02 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredUnitAlive = "NPC_Nyx_Story_01",
				RequiredTextLines = { "GaiaWithNyx01" },
				{
					Cue = "/VO/Gaia_0286",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "Forgive us, Son of Hades, as we are amid exchanging memories."
				},
			},
			GaiaWithNyx03 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredUnitAlive = "NPC_Nyx_Story_01",
				RequiredTextLines = { "GaiaWithNyx01" },
				{
					Cue = "/VO/Gaia_0287",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "Son of Hades, I am pleased the goddess Nyx returned to me."
				},
			},
			GaiaWithNyx04 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredUnitAlive = "NPC_Nyx_Story_01",
				RequiredTextLines = { "GaiaWithNyx01" },
				{
					Cue = "/VO/Gaia_0288",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "Forgive me, Son of Hades, but I must continue this discussion with the goddess Nyx."
				},
			},
			GaiaWithNyx05 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredUnitAlive = "NPC_Nyx_Story_01",
				RequiredTextLines = { "GaiaWithNyx01" },
				{
					Cue = "/VO/Gaia_0289",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "I had not seen the goddess Nyx in quite some time."
				},
			},
			GaiaWithNyx06 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredUnitAlive = "NPC_Nyx_Story_01",
				RequiredTextLines = { "GaiaWithNyx01" },
				{
					Cue = "/VO/Gaia_0290",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "I am quite unaccustomed to having all this company of late."
				},
			},
			GaiaWithNyx07 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredUnitAlive = "NPC_Nyx_Story_01",
				RequiredTextLines = { "GaiaWithNyx01" },
				{
					Cue = "/VO/Gaia_0326",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "My daughter was just in the midst of telling me the latest occurrences about your House."
				},
			},
			GaiaWithNyx08 =
			{
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredUnitAlive = "NPC_Nyx_Story_01",
				RequiredTextLines = { "GaiaWithNyx01" },
				{
					Cue = "/VO/Gaia_0327",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text = "As you are able to observe, the goddess Nyx and I are in the midst of conversation now."
				},
			},

		},

		BoughtTextLines =
		{
			GaiaLootBought01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },

				{
					Cue = "/VO/Gaia_0087",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"Perhaps you did not think that I would seek you out among the boatman Charon's trifles, which precisely is the reason I have done it."
				},
			},
			GaiaLootBought02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "GaiaInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "GaiaLootBought01" },

				{
					Cue = "/VO/Gaia_0088",
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"The boatman Charon understands my whims, and his loyalty is purchased easily by one for whom base wealth is meaningless, so, I am here."
				},
			},
		},

		GiftTextLineSets =
		{
			-- gives gift in exchange
			GaiaGift01 =
			{
				PlayOnce = true,
				{
					Cue = "/VO/ZagreusHome_0578",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					SecretMusicMutedStems = { "GaiaBass" },
					PostLineFunctionName = "GaiaInteractPresentation",
					Text =
					"Master Gaia? Everyone makes offerings to my relatives upon Olympus. I wish to make an offering to you. Thank you for... everything."
				},
				{
					Cue = "/VO/Gaia_0094",
					PortraitExitWait = 1.0,
					SecretMusicActiveStems = { "GaiaBass" },
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					UseEventEndSound = true,
					Text =
					"How droll of you to make attempts to tempt me with material things. Here, then, please in turn allow me this attempt at reciprocity."
				},
			},
			GaiaGift02 =
			{
				PlayOnce = true,
				RequiredTextLines = { "GaiaGift01", },
				{
					Cue = "/VO/ZagreusHome_0580",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					SecretMusicMutedStems = { "GaiaBass" },
					PostLineFunctionName = "GaiaInteractPresentation",
					Text = "This is for you, Master Gaia. Everyone beneath the heavens and earth enjoys this stuff."
				},
				{
					Cue = "/VO/Gaia_0089",
					PortraitExitWait = 1.0,
					SecretMusicActiveStems = { "GaiaBass" },
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"You honor me in making such an offering, though please; it is not necessary to endear yourself using material means, for it is the thought alone which counts."
				},
			},
			GaiaGift03 =
			{
				PlayOnce = true,
				RequiredTextLines = { "GaiaGift02", },
				{
					Cue = "/VO/ZagreusHome_0128",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					SecretMusicMutedStems = { "GaiaBass" },
					PostLineFunctionName = "GaiaInteractPresentation",
					Text =
					"Master Gaia, forebear of the gods, it is an honor to have met you. Please, accept this gift."
				},
				{
					Cue = "/VO/Gaia_0090",
					PortraitExitWait = 1.0,
					SecretMusicActiveStems = { "GaiaBass" },
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"Seldom do mortals or immortals think of making offerings to me. As I do not expect such token gestures, I am very much amused, and I accept."
				},
			},
			GaiaGift04 =
			{
				PlayOnce = true,
				RequiredTextLines = { "GaiaGift03", },
				{
					Cue = "/VO/ZagreusHome_0581",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					SecretMusicMutedStems = { "GaiaBass" },
					PostLineFunctionName = "GaiaInteractPresentation",
					Text =
					"Master Gaia, I pledge never to forget you or your good graces. May your wisdom and your whim forever guide me."
				},
				{
					Cue = "/VO/Gaia_0091",
					PortraitExitWait = 1.0,
					SecretMusicActiveStems = { "GaiaBass" },
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"Is this an offering of fealty or friendship, Son of Hades? I do not wish to know from you the answer, so that I might dwell on it and all the possibilities."
				},
			},
			GaiaGift05 =
			{
				PlayOnce = true,
				RequiredTextLines = { "GaiaGift04", },
				{
					Cue = "/VO/ZagreusHome_0582",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					SecretMusicMutedStems = { "GaiaBass" },
					PostLineFunctionName = "GaiaInteractPresentation",
					Text =
					"I'm ever-grateful that my journeys through the Underworld mean that we can get to know each other, Master Gaia."
				},
				{
					Cue = "/VO/Gaia_0092",
					PortraitExitWait = 1.0,
					SecretMusicActiveStems = { "GaiaBass" },
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"Your repeated generosity with me is starting to become a bit predictable, and yet... somehow, I nonetheless appreciate it, still. How very odd."
				},
			},
			GaiaGift06 =
			{
				PlayOnce = true,
				RequiredTextLines = { "GaiaGift05", },
				{
					Cue = "/VO/ZagreusField_3395",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					SecretMusicMutedStems = { "GaiaBass" },
					PostLineFunctionName = "GaiaInteractPresentation",
					Text =
					"Master Gaia, it's little wonder all existence sprang from you, because I see the noble qualities in so many I've met embodied in you. Please, accept this gift."
				},
				{
					Cue = "/VO/Gaia_0184",
					PortraitExitWait = 1.0,
					SecretMusicActiveStems = { "GaiaBass" },
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					UseEventEndSound = true,
					Text =
					"If it is unclear yet, Son of Hades, I shall not be giving more to you in exchange for your repeated offerings. You give them to me knowing it shall serve no purpose and achieve no end. I know that there are some among both mortals and your kind for whom this is quite unacceptable."
				},
			},
			-- high relationship / locked gifts
			GaiaGift07 =
			{
				PlayOnce = true,
				RequiredTextLines = { "GaiaGift06", },
				{
					Cue = "/VO/ZagreusField_3396",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					SecretMusicMutedStems = { "GaiaBass" },
					PostLineFunctionName = "GaiaInteractPresentation",
					Text =
					"This is the greatest delicacy of Olympus, Master Gaia. It's for you. I think normally it would be difficult for the Olympians to get it to you here."
				},
				{
					Cue = "/VO/Gaia_0185",
					SecretMusicActiveStems = { "GaiaBass" },
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					Text =
					"You make an even greater offering to me, knowing it shall produce no material result. You are aware that I am not persuadable? Yours is a squandering of resources and time. Although, of course, we do have each of these in great supply. Now then, respond."
				},
				{
					Cue = "/VO/ZagreusField_3397",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Empathetic_01",
					PortraitExitAnimation = "Portrait_Zag_Empathetic_01_Exit",
					PreLineWait = 0.35,
					SecretMusicMutedStems = { "GaiaBass" },
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"...I just think the act of giving isn't quite the same as an exchange. I know I won't be getting any sort of other talisman or something in return. But, through these offerings, I can express my thanks. That's worth it by itself."
				},
				{
					Cue = "/VO/Gaia_0186",
					PreLineWait = 0.5,
					PortraitExitWait = 1.0,
					SecretMusicActiveStems = { "GaiaBass" },
					UseEventEndSound = true,
					Text =
					"...I see. So then, the action is akin to theft. For you are getting something in return that I did not intend to give. I still have much to learn from my creations, Son of Hades. So let us say that we have made an even trade. My learning for your worth."
				},
			},
			GaiaGift08 =
			{
				PlayOnce = true,
				RequiredTextLines = { "GaiaGift07", },
				{
					Cue = "/VO/ZagreusField_3398",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					SecretMusicMutedStems = { "GaiaBass" },
					PostLineFunctionName = "GaiaInteractPresentation",
					Text =
					"If you'll forgive me, Master Gaia, this Ambrosia is intended to be given to those whom I care about, and I can think of few recipients I'd like to have it more. Please."
				},
				{
					Cue = "/VO/Gaia_0187",
					SecretMusicActiveStems = { "GaiaBass" },
					StartSound = "/SFX/Menu Sounds/GaiaMiscSFX",
					Text =
					"I shall accept this, as a final offering, O Son of Hades. For I have given it additional consideration, and decided that my previous analysis of your intentions was too narrow, too inaccurate. And, I regret comparing what you have been doing to an act of theft. Respond?"
				},
				{
					Cue = "/VO/ZagreusField_3399",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Default_01",
					PortraitExitAnimation = "Portrait_Zag_Default_01_Exit",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					SecretMusicMutedStems = { "GaiaBass" },
					Text =
					"Don't even mention it, please, Master Gaia. All of this is new for me, as well. I try never to overanalyze... my father does enough of that for all of us. I just know, when I encounter the primordial creator, I am going to give thanks. For everything."
				},
				{
					Cue = "/VO/Gaia_0188",
					PreLineWait = 0.5,
					PortraitExitWait = 1.0,
					SecretMusicActiveStems = { "GaiaBass" },
					UseEventEndSound = true,
					PostLineThreadedFunctionName = "MaxedRelationshipPresentation",
					PostLineFunctionArgs = { Text = "NPC_Gaia_01", Icon = "Keepsake_GaiaSticker_Max" },
					Text =
					"...I see. Then, your response is quite acceptable. And, since the act of giving is not an exchange, let us say that you already had my gratitude."
				},
			},
		},

		GiftGivenVoiceLines =
		{
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			PlayFromTarget = true,

			-- Master Gaia, thank you.
			{ Cue = "/VO/ZagreusHome_0328" },
		},

		DeathTauntVoiceLines =
		{
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 1.51,
				NoTarget = true,
				Source = { SubtitleColor = Color.GaiaVoice },
				Cooldowns =
				{
					{ "GaiaDeathReactionSpeech", Time = 20 },
				},

				-- This was one of the potential outcomes of my gift.
				{ Cue = "/VO/Gaia_0331" },
				-- All of this was in accordance with the Fates' design; or perhaps not.
				{ Cue = "/VO/Gaia_0332" },
				-- I expected you would perish soon; but I knew not exactly how.
				{ Cue = "/VO/Gaia_0333" },
				-- Your demises are unfortunate and yet a source of some amusement.
				{ Cue = "/VO/Gaia_0334" },
				-- Be careful with me, Son of Hades.
				{ Cue = "/VO/Gaia_0133",
					                          RequiredPlayed = { "/VO/Gaia_0331", "/VO/Gaia_0332", "/VO/Gaia_0333",
						"/VO/Gaia_0334" }, },
				-- That was perhaps unwise.
				{ Cue = "/VO/Gaia_0134",
					                          RequiredPlayed = { "/VO/Gaia_0331", "/VO/Gaia_0332", "/VO/Gaia_0333",
						"/VO/Gaia_0334" }, },
				-- You have provided me amusement.
				{ Cue = "/VO/Gaia_0150",
					                          RequiredPlayed = { "/VO/Gaia_0331", "/VO/Gaia_0332", "/VO/Gaia_0333",
						"/VO/Gaia_0334" }, },
			},
		},
	}

	-- Gift Section
	local OlympusGiftOrdering = ModUtil.Entangled.ModData(GiftOrdering)
	local OlympusGiftData = ModUtil.Entangled.ModData(GiftData)
	table.insert(OlympusGiftOrdering, 22, "GaiaBoonTrait")

	OlympusGiftData.GardenUpgrade =
	{
		InheritFrom = { "DefaultGiftData" },
		MaxedIcon = "Keepsake_Gaia_Max",
		MaxedSticker = "Keepsake_GaiaSticker_Max",
		MaxedRequirement = { RequiredTextLines = { "GaiaGift07" }, },
		Value = 0,
		Maximum = 7,
		Locked = 7,
		[1] = { Gift = "GaiaBoonTrait" },
		[7] = { RequiredResource = "SuperGiftPoints" },
		UnlockGameStateRequirements = { RequiredTextLines = { "GaiaBackstory04" } }
	}
	-- Multi Gods compatibility

	-- FUNCTIONS
	
end
