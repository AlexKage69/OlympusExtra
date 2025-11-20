-- Separate Gods from Goddess to add more gods

if ModUtil ~= nil then
	ModUtil.Mod.Register("HecateExtra")

	local mod = "HecateExtra"
	local package = "HecatePackage"
	--Variables
	local DepthDamageMultiplier = 0.0
	local DuplicateMultiplier = -0.60
	local DuplicateStrongMultiplier = -0.40
	local DuplicateVeryStrongMultiplier = -0.20
	--Color
	local OlympusColor = ModUtil.Entangled.ModData(Color)
	OlympusColor.HecateVoice = { 158, 136, 121, 255 }
	OlympusColor.HecateDamageLight = { 158, 136, 121, 255 }
	OlympusColor.HecateDamage = { 128, 111, 104, 255 }
	--QuestData
	local OlympusQuestData = ModUtil.Entangled.ModData(QuestData)
	OlympusQuestData.HecateDeeds =
	{
		Name = "HecateDeeds",
		InheritFrom = { "DefaultQuestItem" },
		RewardResourceName = "LockKeys",
		RewardResourceAmount = 30,
		UnlockGameStateRequirements =
		{
			RequiredTextLines = { "HecateGift02", },
		},
		CompleteGameStateRequirements =
		{
			RequiredTraitsTaken =
			{
				"HecateDeedCentaurHeartTrait",
				"HecateDeedDifferentGodTrait",
				"HecateDeedSpendObolTrait",
				"HecateDeedMetaPointsTrait",
				"HecateDeedChallengeSwitchTrait",
				"HecateDeedSameGodTrait",
				"HecateDeedNoDamageTrait",
				"HecateDeedFastEncounterTrait",
				"HecateDeedHealingTrait",
				"HecateDeedMaxShoutTrait",
				"HecateDeedSellTrait",
				"HecateDeedStoreTrait",
				"HecateDeedDodgeTrait",
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
	table.insert(OlympusQuestOrderData, 40, "HecateDeeds")
	
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
		Source = { SubtitleColor = Color.HecateVoice },

		-- A fine performance.
		{ Cue = "/VO/Hecate_0162" },
		-- You can do better.
		{ Cue = "/VO/Hecate_0163" },
		-- Do it for your queen.
		{ Cue = "/VO/Hecate_0164" },
		-- Lasted longer than I expected.
		{ Cue = "/VO/Hecate_0165" },
		-- Barely made it, I assume.
		{ Cue = "/VO/Hecate_0166" },
		-- With this, you'd better not lose.
		{ Cue = "/VO/Hecate_0167" },
		-- There's nothing better than my blessings.
		{ Cue = "/VO/Hecate_0168" },
		-- You never give up, do you?
		{ Cue = "/VO/Hecate_0169" },
		-- That's right, bow to your queen.
		{ Cue = "/VO/Hecate_0170" },
		-- Likely to fail, but I am still helping you.
		{ Cue = "/VO/Hecate_0171" },
		-- I can be generous.
		{ Cue = "/VO/Hecate_0172" },
		-- The best of all Olympus.
		{ Cue = "/VO/Hecate_0173" },
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
		-- Queen Hecate!!
		Cue = "/VO/ZagreusField_4987",
		RequiredTrait = "HecateShoutTrait",
		RequiredFalseSpurnedGodName = "GardenUpgrade"
	})
	table.insert(OlympusHeroVoiceLines.SwapUpgradePickedVoiceLines, {
		RandomRemaining = true,
		BreakIfPlayed = true,
		PreLineWait = 0.65,
		SuccessiveChanceToPlayAll = 0.33,
		RequiredFalseEncounters = { "DevotionTestTartarus", "DevotionTestAsphodel", "DevotionTestElysium", },
		RequiredSwappedGodLoot = "GardenUpgrade",
		CooldownName = "SaidHecateRecently",
		CooldownTime = 40,

		-- I'm sure Queen Hecate won't mind.
		{ Cue = "/VO/ZagreusField_4983" },
		-- Surely Hecate won't mind.
		{ Cue = "/VO/ZagreusField_4984" },
		-- Queen Hecate won't mind, will she?
		{ Cue = "/VO/ZagreusField_4985" },
	})
	--BoonInfoScreenData
	local OlympusBoonInfoScreenData = ModUtil.Entangled.ModData(BoonInfoScreenData)
	table.insert(OlympusBoonInfoScreenData.Ordering, "GardenUpgrade")

	--ProjectileData
	local OlympusProjectileData = ModUtil.Entangled.ModData(ProjectileData)
	OlympusProjectileData.HecateColorProjectile = {
		DamageTextStartColor = OlympusColor.HecateDamageLight,
		DamageTextColor = OlympusColor.HecateDamage
	}
	-- GameData
	local OlympusGameData = ModUtil.Entangled.ModData(GameData)
	OlympusGameData.HecateBasicPickUpTextLines = {
		"HecateFirstPickUp",
		"HecateMiscPickup01",
		"HecateMiscPickup02",
		"HecateMiscPickup03",
		"HecateMiscPickup04",
		"HecateMiscPickup05",
		"HecateMiscPickup06",
		"HecateMiscPickup07",
		"HecateMiscPickup08",
		"HecateMiscPickup09",
		"HecateMiscPickup10",
		"HecateMiscPickup11",
		"HecateMiscPickup12",
		"HecateMiscPickup13",
		"HecateMiscPickup14",
		"HecateMiscPickup15",
		"HecateMiscPickup16",
		"HecateMiscPickup17"
	}
	GameData.RunClearMessageData.ClearRequiredTraitsHecate =
	{
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements =
		{
			RequiredCountOfTraitsCount = 3,
			RequiredCountOfTraits =
			{
				"HecateBlessingMeleeTrait",
				"HecateBlessingRangedTrait",
				"HecateBlessingAmmoTrait",
				"HecateBlessingMaxHealthTrait",
				"HecateBlessingBoonRarityTrait",
				"HecateBlessingMoneyTrait",
				"HecateBlessingMetapointTrait",
				"HecateBlessingTrapDamageTrait",
				"HecateBlessingSecondaryTrait",
				"HecateBlessingDashAttackTrait",
				"HecateBlessingExtraPomsTrait"
			},
			RequiredOneOfTraits = { "HecateBlessingExtraPomsTrait" },
		},
	}
	table.insert(OlympusGameData.ConversationOrder, "GardenUpgrade")
	--Keywords
	local OlympusKeywordList = ModUtil.Entangled.ModData(KeywordList)
	--ModUtil.Table.Merge(OlympusKeywordList, { "JealousyCurse", "EnvyCurse", "HecateTrap", "Aura", "SpecialDiscount" })
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
				Text = "CodexData_Hecate_0001"
			},
			{
				UnlockThreshold = 5,
				Text = "CodexData_Hecate_0002"
			},
			{
				UnlockThreshold = 15,
				Text = "CodexData_Hecate_0003"
			}
		},
		Image = "Codex_Portrait_Hecate",
	}

	-- Trait Section
	local OlympusTraitData = ModUtil.Entangled.ModData(TraitData)
	OlympusTraitData.HecateDeedTrait =
	{
		Icon = "Shop_Vial",
	}

	OlympusTraitData.HecateDeedRemainingEncounters =
	{
		--[[RemainingUses =
		{
			BaseMin = 3,
			BaseMax = 4,
			AsInt = true,
		},
		UsesAsEncounters = true,]]
	}

	OlympusTraitData.HecateBlessingTrait =
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
	OlympusTraitData.HecateBoonTrait =
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
	-- Hecate Deeds
	OlympusTraitData.HecateDeedCentaurHeartTrait =
	{
		InheritFrom = { "HecateDeedTrait", "HecateDeedRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
	}
	OlympusTraitData.HecateDeedDifferentGodTrait =
	{
		InheritFrom = { "HecateDeedTrait", "HecateDeedRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
	}
	OlympusTraitData.HecateDeedSpendObolTrait =
	{
		InheritFrom = { "HecateDeedTrait", "HecateDeedRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
	}
	OlympusTraitData.HecateDeedMetaPointsTrait =
	{
		InheritFrom = { "HecateDeedTrait", "HecateDeedRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
	}
	OlympusTraitData.HecateDeedChallengeSwitchTrait =
	{
		InheritFrom = { "HecateDeedTrait", "HecateDeedRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
	}
	OlympusTraitData.HecateDeedSameGodTrait =
	{
		InheritFrom = { "HecateDeedTrait", "HecateDeedRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
	}
	OlympusTraitData.HecateDeedNoDamageTrait =
	{
		InheritFrom = { "HecateDeedTrait", "HecateDeedRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
	}
	OlympusTraitData.HecateDeedFastEncounterTrait =
	{
		InheritFrom = { "HecateDeedTrait", "HecateDeedRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
	}
	OlympusTraitData.HecateDeedHealingTrait =
	{
		InheritFrom = { "HecateDeedTrait", "HecateDeedRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
	}
	OlympusTraitData.HecateDeedMaxShoutTrait =
	{
		InheritFrom = { "HecateDeedTrait", "HecateDeedRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
	}
	OlympusTraitData.HecateDeedSellTrait =
	{
		InheritFrom = { "HecateDeedTrait", "HecateDeedRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
	}
	OlympusTraitData.HecateDeedStoreTrait =
	{
		InheritFrom = { "HecateDeedTrait", "HecateDeedRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
	}
	OlympusTraitData.HecateDeedDodgeTrait =
	{
		InheritFrom = { "HecateDeedTrait", "HecateDeedRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
	}
	-- Hecate Blessings
	OlympusTraitData.HecateBlessingMoneyTrait =
	{
		InheritFrom = { "HecateBlessingTrait" },
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
	OlympusTraitData.HecateBlessingBackstabTrait =
	{
		InheritFrom = { "HecateBlessingTrait" },
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
	OlympusTraitData.HecateBlessingAlphaStrikeTrait =
	{
		InheritFrom = { "HecateBlessingTrait" },
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
	OlympusTraitData.HecateBlessingMetapointTrait = {
		InheritFrom = { "HecateBlessingTrait" },
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
	OlympusTraitData.HecateBlessingBoonRarityTrait =
	{
		InheritFrom = { "HecateBlessingTrait" },
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
	OlympusTraitData.HecateBlessingSecondaryTrait =
	{
		InheritFrom = { "HecateBlessingTrait" },
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
	OlympusTraitData.HecateBlessingAmmoTrait =
	{
		InheritFrom = { "HecateBlessingTrait" },
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
	OlympusTraitData.HecateBlessingDashAttackTrait =
	{
		InheritFrom = { "HecateBlessingTrait" },
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
	OlympusTraitData.HecateBlessingRangedTrait =
	{
		InheritFrom = { "HecateBlessingTrait" },
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
	OlympusTraitData.HecateBlessingMaxHealthTrait =
	{
		InheritFrom = { "HecateBlessingTrait" },
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
	OlympusTraitData.HecateBlessingMeleeTrait =
	{
		InheritFrom = { "HecateBlessingTrait" },
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
	OlympusTraitData.HecateBlessingExtraPomsTrait =
	{
		InheritFrom = { "HecateBlessingTrait" },
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
		Icon = "BoonSymbolHecate",
		BoonInfoIcon = "BoonInfoSymbolHecateIcon",
		DoorIcon = "BoonSymbolHecateIsometric",
		ConfirmSound = "/SFX/Menu Sounds/HecateBoonConfirm",
		Color = { 100, 25, 255, 255 },
		LightingColor = { 100, 25, 255, 255 },
		LootColor = { 100, 25, 255, 255 },
		SubtitleColor = { 1.000, 0.973, 0.733, 1.0 },
		EventEndSound = "/Leftovers/Menu Sounds/SkillUpgradeConfirm",
		UpgradeSelectedSound = "/SFX/HecateBoonChoice",

		TransformingTraits = true,
		PermanentTraits = { "HecateBlessingMeleeTrait", "HecateBlessingRangedTrait", "HecateBlessingAmmoTrait",
			"HecateBlessingMaxHealthTrait", "HecateBlessingBoonRarityTrait", "HecateBlessingMoneyTrait",
			"HecateBlessingMetapointTrait", "HecateBlessingSecondaryTrait", "HecateBlessingDashAttackTrait",
			"HecateBlessingExtraPomsTrait", "HecateBlessingBackstabTrait", "HecateBlessingAlphaStrikeTrait", },
		TemporaryTraits = { "HecateDeedCentaurHeartTrait", "HecateDeedDifferentGodTrait", "HecateDeedSpendObolTrait",
			"HecateDeedMetaPointsTrait", "HecateDeedChallengeSwitchTrait", "HecateDeedSameGodTrait",
			"HecateDeedNoDamageTrait", "HecateDeedFastEncounterTrait", "HecateDeedHealingTrait", "HecateDeedMaxShoutTrait",
			"HecateDeedSellTrait", "HecateDeedStoreTrait", "HecateDeedDodgeTrait", },

		Speaker = "NPC_Hecate_01",
		Portrait = "Portrait_Hecate_Default_01",
		OverlayAnim = "HecateOverlay",
		Gender = "X",
		SpawnSound = "/SFX/Menu Sounds/KeepsakeChaosEgg",
		FlavorTextIds =
		{
			"GardenUpgrade_FlavorText01",
			"GardenUpgrade_FlavorText02",
			"GardenUpgrade_FlavorText03",
		},

		PickupFunctionName = "HecateInteractPresentation",
		PickupGlobalVoiceLines = "HecateBoonUsedVoiceLines",

		--[[UpgradeMenuOpenVoiceLines =
		{
			{
				PlayOnce = true,
				BreakIfPlayed = true,
				PreLineWait = 1.3,
				RequiredTextLinesThisRoom = { "HecateRevealsBeowulfAspect01", },
				Queue = "Always",

				-- I see you stand your ground against the serpent's flame...
				{ Cue = "/VO/ZagreusField_3579" },
			},
			{
				PlayOnce = true,
				BreakIfPlayed = true,
				PreLineWait = 1.3,
				RequiredTextLinesThisRoom = { "HecateSurfaceQuest01", },
				Queue = "Always",

				-- Um... yes? Was I supposed to respond there?
				{ Cue = "/VO/ZagreusField_3805" },
			},
			[3] = GlobalVoiceLines.CheckOlympianReunionVoiceLines,
			[4] = GlobalVoiceLines.FoundRareBoonVoiceLines,
		},]]

		SuperPriorityPickupTextLineSets =
		{
			--[[HecateAboutBeowulfAspect01_A =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateRevealsBeowulfAspect01" },
				RequiredFalseTextLines = { "HecateAboutBeowulfAspect02" },
				RequiredFalseTraits = { "ShieldLoadAmmoTrait" },
				RequiredFalsePlayed = { "/VO/ZagreusHome_2648" },
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",

				{
					Cue = "/VO/Hecate_0316",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					UseEventEndSound = true,
					Text =
					"I sense that you have not yet spoken with the all-seeing artifact you call Aegis. Tamper with the Fates' design, then, all you like. But if you change your mind, do speak the words to it: {#DialogueItalicFormat}I see you stand your ground against the serpent's flame.{#PreviousFormat}"
				},
			},
			HecateAboutBeowulfAspect01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateAboutBeowulfAspect01_A", "HecateAboutShieldWeapon01" },
				RequiredFalseTextLines = { "HecateAboutBeowulfAspect02" },
				RequiredFalseTraits = { "ShieldLoadAmmoTrait" },
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },

				{
					Cue = "/VO/Hecate_0293",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					UseEventEndSound = true,
					Text =
					"You have not yet used the waking-phrase that I imparted? Or perhaps you merely chose not to present me the result. I would quite like to see it, at some point. Remember, Son of Hades: Say to the all-seeing artifact, {#DialogueItalicFormat}I see you stand your ground against the serpent's flame.{#PreviousFormat}"
				},
			},
			HecateAboutBeowulfAspect02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateRevealsBeowulfAspect01" },
				RequiredTrait = "ShieldLoadAmmoTrait",
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },

				{
					Cue = "/VO/Hecate_0179",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					UseEventEndSound = true,
					Text =
					"Out of the infinitely spanning possibilities, here before me stands the Son of Hades, bearing my all-seeing artifact, appearing in the aspect of a bearer yet unborn, who shall be known throughout the north as Beowulf. How very droll."
				},
			},

			HecateSurfaceQuestComplete =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "LordHadesHecateSurfaceQuestDefeat01" },
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },
				{
					Cue = "/VO/Hecate_0320",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"I faintly sensed that you were able to confront your father while in possession of my small round catalyst. It seems my asking you, and your success, was in accordance with the Fates' design, as well. The result is more amusing even than expected. Thus, thank you."
				},
			},

			-- NyxHecateReunionQuest
			HecateAboutNyx05 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				Priority = true,
				RequiredCosmetics = { "NyxQuestItem" },
				RequiredFalseQueuedTextLines = { "NyxInHecate01" },
				RequiredFalseTextLines = { "NyxInHecate01" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0283",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"I have detected some unusual activity within the reaches of the Underworld, Son of Hades... vast sums of Darkness, collected in an ancient catalyst, which I see now almost like a beacon, shining in the night. This either is the work of Nyx, or you, or both. I am anticipating the result."
				},
			},

			-- NyxHecateReunionQuest Complete
			HecateAboutNyx06 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredUnitAlive = "NPC_Nyx_Story_01",
				RequiredCosmetics = { "NyxQuestItem" },
				RequiredTextLines = { "NyxAboutHecate07" },
				{
					Cue = "/VO/Hecate_0284",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					SetFlagFalse = "NyxHecateReunionInProgress",
					Text =
					"It pleases me immensely, Son of Hades, to have seen the goddess Nyx again. The significant amount of time that has elapsed since last this happened dulled sufficiently old pains, I think. Thus, it becomes a basis on which our connection may, in time, take shape again."
				},
			},

			HecateAboutResponding01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03", "HecateGift01", },
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },

				{
					Cue = "/VO/Hecate_0168",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					Text =
					"As we become acquainted, Son of Hades, I shall make myself quite clear in one respect: I fear I have a lack of patience for discussion. When visiting, please merely listen, then accept my mark, and then depart. Respond only when necessary. Or when prompted. Yes?"
				},
				{
					Cue = "/VO/ZagreusField_3458",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Defiant_01",
					SecretMusicMutedStems = { "HecateBass" },
					PreLineWait = 0.4,
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"...Merely listen, so it's just like when I get those messages from the Olympians. Wait, you did just prompt me, Master Hecate, didn't you? Or should I have remained silent just now?"
				},
				{
					Cue = "/VO/Hecate_0169",
					SecretMusicActiveStems = { "HecateBass" },
					UseEventEndSound = true,
					Text =
					"I cannot offer you advice. But you were prompted, yes. You may speak freely, then, or anytime, despite my wishes that you not do so. Absolute silence is my general preference. It may not be yours."
				},
			},

			HecateAboutNyx01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateAboutResponding01", "HecateGift01", "NyxAboutHecate01" },
				RequiredAnyTextLines = { "NyxPostFlashback01", "ZeusBackstory01", "AresAboutNyx01", "AthenaBackstory01" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete", "HecateAboutNyx01_B" },
				{
					Cue = "/VO/Hecate_0081",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					Text =
					"I understand that Zeus and all his kin on Mount Olympus think that you are born of Hades and the goddess Nyx? I was amused to learn of this deception. Nyx has mothered many of the Underworld's own, so, why not you?"
				},
				{
					Cue = "/VO/ZagreusField_0541",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Serious_01",
					SecretMusicMutedStems = { "HecateBass" },
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "She isn't my birthmother, no, but she is like a mother to me. Do you know her?"
				},
				{
					Cue = "/VO/Hecate_0082",
					SecretMusicActiveStems = { "HecateBass" },
					UseEventEndSound = true,
					Text =
					"Oh, I know the goddess Nyx quite well, of course. Though, it has been a while since we last communicated, and I fear... well, I was not the charitable sort, back then. It is my hope that Nyx is faring well."
				},
			},

			HecateAboutNyx01_B =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				Priority = true,
				RequiredTextLines = { "NyxAboutHecate02", "NyxGrantsRespec", "HecateAboutResponding01" },
				RequiredAccumulatedMetaPoints = 1250,
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },
				{
					Cue = "/VO/Hecate_0277",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					Text =
					"I knew you would arrive. But only in the moments prior to the fact. Thus, I am experiencing residual surprise. Your movements through the Underworld are as though a veil of darkness enshrouds you. The goddess Nyx's influence, perhaps? Respond."
				},
				{
					Cue = "/VO/ZagreusField_3400",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Defiant_01",
					SecretMusicMutedStems = { "HecateBass" },
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"I... do not know how to respond to that, exactly, Master Hecate, but, Nyx, yes, she has been aiding me, in my attempts to flee my father's realm."
				},
				{
					Cue = "/VO/Hecate_0278",
					SecretMusicActiveStems = { "HecateBass" },
					UseEventEndSound = true,
					Text =
					"You move in darkness, not as infinitely black as hers, but reminiscent to me, nonetheless. I would invite her to try to elude me, and then attempt to locate her. A minor amusement for the both of us. Now, I have you for this, I see."
				},
			},

			HecatePostEnding01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateFirstPickUp", "Ending01", "HecateGift01" },
				MaxRunsSinceAnyTextLines = { TextLines = { "Ending01" }, Count = 20 },
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },
				{
					Cue = "/VO/Hecate_0307",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					Text =
					"Lately, Son of Hades, I have sensed what I would call a sort of shift within your father's residence. Did something noteworthy occur, perhaps? Respond."
				},
				{
					Cue = "/VO/ZagreusField_4297",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Default_01",
					SecretMusicMutedStems = { "HecateBass" },
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Master Hecate, it's Persephone, my mother. She's returned! She's chosen to return. So... things feel different, certainly, with her around, although... I didn't feel any sort of shift."
				},
				{
					Cue = "/VO/Hecate_0308",
					UseEventEndSound = true,
					SecretMusicActiveStems = { "HecateBass" },
					Text =
					"You may not sense these shifts as I. The lightness of this space bends and adjusts with time. What you describe... it must have been the cause. I trust that the occasion is a welcome one. And I am pleased that you returned, nevertheless."
				},
			},

			HecateAboutOlympianReunionQuest01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecatePostEnding01", },
				RequiredAnyTextLines = { "PersephoneAboutOlympianReunionQuest03", "NyxAboutOlympianReunionQuest02" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },
				{
					Cue = "/VO/Hecate_0313",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					Text =
					"Again I sensed some sort of shifting in your father's residence. You seek to ask something of me about it, do you not? Respond."
				},
				{
					Cue = "/VO/ZagreusField_4299",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Default_01",
					SecretMusicMutedStems = { "HecateBass" },
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Oh, I'm glad you asked, it's just... my mother, she's... we're reaching out to the Olympians. Trying to reconnect the family. It's been a while, relatively, since she and Father saw the others, but... in case a gathering occurs, I did wish you to know you're cordially invited, too."
				},
				{
					Cue = "/VO/Hecate_0314",
					UseEventEndSound = true,
					SecretMusicActiveStems = { "HecateBass" },
					PreLineWait = 0.35,
					Text =
					"Cordially invited...? A generous proposal, Son of Hades, though unless your gathering is to occur within my space, please understand it would be difficult for me to bring the full entirety of my presence there. However... I think I can arrange to be with you in some capacity. Thank you."
				},
			},

			-- alt below
			HecatePostEpilogue01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateAboutOlympianReunionQuest01", "OlympianReunionQuestComplete" },
				RequiredFalseTextLines = { "HecatePostEpilogue01_B" },
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },
				{
					Cue = "/VO/Hecate_0315",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"It pleases me your gathering of the Olympians occurred. I must inform you... I had never once before detected quite so many of my offspring in a single space. At least not without violent intent. I appreciate that you included me, and that you have returned. Shall we continue, then?"
				},
			},
			HecatePostEpilogue01_B =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "OlympianReunionQuestComplete" },
				RequiredFalseTextLines = { "HecateAboutOlympianReunionQuest01", "HecatePostEpilogue01" },
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },
				{
					Cue = "/VO/Hecate_0335",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"It pleases me your gathering of the Olympians occurred. I must inform you... I had never once before detected quite so many of my offspring in a single space. At least not without violent intent."
				},
			},]]
		},

		PriorityPickupTextLineSets =
		{
			-- about other gods
			HecateAboutZeus01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03", "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp",
					"AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp" },
				RequiredGodLoot = "ZeusUpgrade",
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },

				{
					Cue = "/VO/Hecate_0072",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"You bear the blessing of the great Lord Zeus. He still believes he holds dominion over both heaven and earth. I think, perhaps, he has forgotten about me."
				},
			},
			HecateAboutPoseidon01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03", "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp",
					"AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp" },
				RequiredGodLoot = "PoseidonUpgrade",
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },

				{
					Cue = "/VO/Hecate_0073",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"Lord Poseidon offered you his blessing, it would seem. He can be rather boastful and belligerent, exhibiting the most unattractive manners of your father and Lord Zeus alike."
				},
			},
			HecateAboutAthena01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03", "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp",
					"AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp" },
				RequiredGodLoot = "AthenaUpgrade",
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },

				{
					Cue = "/VO/Hecate_0074",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"This wise goddess Athena has imbued you with her charms, I see, O Son of Hades. Perhaps to her you are a tool with which her broken family may as yet be mended."
				},
			},
			HecateAboutAres01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03", "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp",
					"AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp" },
				RequiredGodLoot = "AresUpgrade",
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },

				{
					Cue = "/VO/Hecate_0075",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"It is not unexpected that you consorted with the violent Ares, and now bear his Boon. He still worships me, you know; yet, I would say he does not know me very well."
				},
			},
			HecateAboutAphrodite01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03", "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp",
					"AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp" },
				RequiredGodLoot = "AphroditeUpgrade",
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },

				{
					Cue = "/VO/Hecate_0077",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"The charms of goddess Aphrodite are upon you unmistakably, although I shall be curious to see if her command over one's sense of love shall have any effect beneath the earth."
				},
			},
			HecateAboutArtemis01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03", "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp",
					"AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp" },
				RequiredGodLoot = "ArtemisUpgrade",
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },

				{
					Cue = "/VO/Hecate_0076",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"I understand the hunting-goddess Artemis recently has turned her gaze towards you. It is unexpected she would offer her assistance, even to a relative in need."
				},
			},
			HecateAboutDionysus01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03", "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp",
					"AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
				RequiredGodLoot = "DionysusUpgrade",
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },

				{
					Cue = "/VO/Hecate_0078",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"The drunkard Dionysus offered you his services, I see? He can be rather unpredictable, and therefore offers me a source of some amusement."
				},
			},
			HecateAboutHermes01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03", "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp",
					"AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp" },
				RequiredGodLoot = "HermesUpgrade",
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },

				{
					Cue = "/VO/Hecate_0294",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"Swift Hermes spurs you on, I see, O Son of Hades. Beware the narrow distance between hastiness and swiftness; a distinction I am not so sure the god of travel fully understands."
				},
			},
			HecateAboutDemeter01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03", "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp",
					"AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp" },
				RequiredGodLoot = "DemeterUpgrade",
				RequiredFalseTextLines = { "DemeterLiftsWinterCurse01" },
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },

				{
					Cue = "/VO/Hecate_0295",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"Embittered Demeter has reached you, hasn't she? She once was full of warmth, you know; but lately, as I understand, she is more prone to taking it away."
				},
			},

			-- backstory
			HecateAboutOlympians01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03", "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp",
					"AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "HermesFirstPickUp", "HecateGift01" },
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },
				RequiredAnyTextLines = { "Flashback_Mother_01", "CerberusStyxMeeting01" },
				{
					Cue = "/VO/Hecate_0085",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"You have met many of the Olympians by now, each spurring you toward their mountaintop. They place such value on familial bonds, yet none of them remember who I am. Do not place too much faith in them, O Son of Hades."
				},
			},
			HecateAboutOlympians02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateAboutOlympians01", "HecateAboutResponding01" },
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },
				{
					Cue = "/VO/Hecate_0170",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"I ask you listen but not speak, O Son of Hades, whilst the Olympians? They do not ask at all. They merely send their messages to you, unprompted, providing a choice of blessing, but no say. I seek to understand their point of view. But it is difficult."
				},
			},
			HecateAboutOlympians03 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateAboutOlympians01", },
				RequiredMinAnyTextLines = {
					TextLines = { "ZeusGift01", "PoseidonGift01", "AthenaGift01", "AphroditeGift01", "AresGift01",
						"ArtemisGift01", "DionysusGift01", "HermesGift01", "DemeterGift01" }, Count = 4 },
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },
				{
					Cue = "/VO/Hecate_0171",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"When you extend an offering to the Olympians, for a fleeting instant, it appears as though they are able to hear your prayer. Or so I have observed. How interesting that your thoughts are capable of breaking free, yet you cannot."
				},
			},

			HecateAboutHades01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03", "ZeusFirstPickUp", "PoseidonFirstPickUp", "HecateGift02" },
				RequiredMinNPCInteractions = { NPC_Hades_01 = 5 },
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },

				{
					Cue = "/VO/Hecate_0086",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"Your father and his brothers, when they sealed the Titans in the darkest reaches of this world, that was the last they saw of me, as well. You are dissimilar from them, and I feel safe communicating thus with you."
				},
			},

			HecateAboutNyx01_C =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateAboutNyx01_B", "NyxAboutHecate03", "HecateGift03" },
				{
					Cue = "/VO/Hecate_0321",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"I was at times uncharitable with the goddess Nyx, when we were closer, long ago. After she bore her first children, I nevertheless expected her attention to remain undivided. I kept creating. When finally I slowed, I realized my mistake. But our connection had been severed, by that point."
				},
			},

			HecateAboutNyx02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateAboutNyx01_B", "NyxAboutHecate04" },
				-- for backwards compatibility
				RequiredFalseTextLines = { "NyxHecateReunionQuestComplete" },
				{
					Cue = "/VO/Hecate_0083",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					Text =
					"I sense that something is the matter, Son of Hades. Speak, then, what is on your mind? I can decipher some of it without your telling though would rather hear it from you voluntarily."
				},
				{
					Cue = "/VO/ZagreusField_0542",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Serious_01",
					SecretMusicMutedStems = { "HecateBass" },
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"{#DialogueItalicFormat}Erm{#PreviousFormat}, Master Hecate? The goddess Nyx, she... seems to want to speak with you again. I wonder, would you maybe contact her sometime? She seems convinced it is your move to make if you so choose."
				},
				{
					Cue = "/VO/Hecate_0279",
					SecretMusicActiveStems = { "HecateBass" },
					UseEventEndSound = true,
					Text =
					"The goddess Nyx wishes to hear from me...? Now that is unexpected, Son of Hades, and I wonder if, perhaps, this is a jest of yours. Though, your intentions evidently are sincere. Then, I shall make no promises in this, except that... I am considering the possibility."
				},
			},
			HecateAboutNyx03 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateAboutNyx01_C" },
				RequiredFalseTextLinesLastRun = { "HecateAboutNyx01_C" },
				{
					Cue = "/VO/Hecate_0280",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"Son of Hades, should eventually you spawn your own offspring... I recommend maintaining sub-infinite distances with them in space and time. Even if they are most tiresome, there always seems to come a point when one wishes to be in their presence once again."
				},
			},

			-- NyxHecateReunionQuest
			HecateAboutNyx04 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "NyxAboutHecate05" },
				{
					Cue = "/VO/Hecate_0281",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					Text =
					"After some consideration, and on your recommendation, I attempted lately to make contact with the goddess Nyx again. She is quite distant from me now, of course. If you happen to know... did she receive the message well? Respond."
				},
				{
					Cue = "/VO/ZagreusField_3401",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Serious_01",
					SecretMusicMutedStems = { "HecateBass" },
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Well, Master Hecate, she can be a little difficult to read at times, but... I got the impression she was quite surprised, even excited to have heard from you again. She said that she would think about how to respond. Or, whether to respond."
				},
				{
					Cue = "/VO/Hecate_0282",
					SecretMusicActiveStems = { "HecateBass" },
					UseEventEndSound = true,
					Text =
					"I see. Well, she shall find a way, if it is warranted. I always did expect the world from her. There were times when I expected her to shine as bright as day, though she is Night. When she achieved a certain level of ability... she left. And I could not find her."
				},
			},

			-- NyxHecateReunionQuest Post-Quest
			HecatePostReunionQuest01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				RequiredCosmetics = { "NyxQuestItem" },
				RequiredTextLines = { "HecateAboutNyx06", "HecateGift07" },
				MinRunsSinceAnyTextLines = { TextLines = { "HecateAboutNyx06" }, Count = 2 },
				{
					Cue = "/VO/Hecate_0322",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"My daughter, the goddess Nyx. When I learned the Olympians mistakenly assumed she was your mother, I did not fully consider the possibility that she essentially was a mother to you... the technicality of birth, aside. She cares for you to the extent a mother can."
				},
			},
			HecatePostReunionQuest02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				RequiredCosmetics = { "NyxQuestItem" },
				RequiredTextLines = { "HecatePostReunionQuest01" },
				MinRunsSinceAnyTextLines = { TextLines = { "HecatePostReunionQuest01", }, Count = 3 },
				{
					Cue = "/VO/Hecate_0323",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"Prior to your intervention, Son of Hades, I expected that the goddess Nyx had forgotten about me... whether purposefully, or from passage of time. I believed that to be forgotten was the one true inevitability. Perhaps, however, I was incorrect."
				},
			},
			HecatePostReunionQuest03 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				RequiredCosmetics = { "NyxQuestItem" },
				RequiredTextLines = { "HecatePostReunionQuest02", "HecateGift08" },
				MinRunsSinceAnyTextLines = { TextLines = { "HecatePostReunionQuest02" }, Count = 3 },
				{
					Cue = "/VO/Hecate_0324",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"I find that it is difficult maintaining my connection with many consciousnesses, such as yours, and that of the goddess Nyx. Yet I am also finding that this difficulty is fully warranted. Our connections give me much to consider as I await our next exchange."
				},
			},

			-- relationship improved
			HecateStatusImproved01 =
			{
				PlayOnce = true,
				RequiredTextLines = { "HecateGift07" },
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },
				{
					Cue = "/VO/Hecate_0070",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"Ah, here is my favorite among those immortals dwelling underneath the Earth. How may I change your life today, O Son of Hades?"
				},
			},
			HecateStatusImproved02 =
			{
				RequiredTextLines = { "HecateGift04" },
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },

				{
					Cue = "/VO/Hecate_0071",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"May you enjoy a moment's peace within my space before venturing on in uncertainty. To my surprise, I must admit I do appreciate the company."
				},
			},

			HecatePostFlashback01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "PersephoneFirstMeeting", "HecateFirstPickUp", "AthenaFirstPickUp",
					"ZeusFirstPickUp", "PoseidonFirstPickUp", "ArtemisFirstPickUp", "AphroditeFirstPickUp",
					"DionysusFirstPickUp", "AresFirstPickUp", "HermesFirstPickUp", "DemeterFirstPickUp",
					"HecateAboutResponding01" },
				RequiredAnyTextLines = { "HecateAboutPersephone01", "HecateAboutPersephone01_B" },
				RequiredFalseTextLines = { "PersephoneAboutOlympianReunionQuest01" },
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },
				{
					Cue = "/VO/Hecate_0079",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					Text =
					"Have you grown trusting yet of the Olympians, for all their generosity? Perhaps you ought to let them know the truth about your journey's goal. They are vain, and think that it is them you seek."
				},
				{
					Cue = "/VO/ZagreusField_0540",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Serious_01",
					SecretMusicMutedStems = { "HecateBass" },
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"I'll never get out of here if not for their help, but... I can't let them know about Mother. She wants to remain hidden from them."
				},
				{
					Cue = "/VO/Hecate_0080",
					UseEventEndSound = true,
					SecretMusicActiveStems = { "HecateBass" },
					Text =
					"A difficult position to be in, Son of Hades. The Olympians may not appreciate being misled. But you can trust that I shall keep your secret. I wish to see how your predicament plays out."
				},
			},

			HecateDarknessProgress01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateFirstPickUp" },
				RequiredAccumulatedMetaPoints = 10000,
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },
				{
					Cue = "/VO/Hecate_0298",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"Such darkness emanates from you, O Son of Hades, that I once again did not entirely anticipate you would arrive just now. I suspect even your father must have difficulty keeping track of you through the domain he calls his own."
				},
			},
			HecateDarknessProgress02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateFirstPickUp" },
				RequiredAccumulatedMetaPoints = 600,
				{
					Cue = "/VO/Hecate_0325",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"You move in darkness, practically unseen, Son of Hades. It is quite difficult even for me to sense your presence at times. The Olympians catch their glimpses now and then. But you are always in a shroud. Thus is the influence of Nyx."
				},
			},

			-- high affinity
			HecateAboutFates01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateGift07" },
				{
					Cue = "/VO/Hecate_0299",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"How strange it is to be subjected to the Fates. But do not fall into the cognitive delusion that they have already made your choices for you, Son of Hades. Rather, they are keen about anticipating every choice that everyone shall make. Such as the following."
				},
			},
			HecateAboutInfinity01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateGift08", "HecateAboutResponding01" },
				{
					Cue = "/VO/Hecate_0296",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					Text =
					"I sense your consternation, Son of Hades, as you look about this space; you have another question, and are free to ask."
				},
				{
					Cue = "/VO/ZagreusField_3402",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Empathetic_01",
					SecretMusicMutedStems = { "HecateBass" },
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Oh, it's just... I sometimes wonder, Master Hecate... if you created all of this, then... who created {#DialogueItalicFormat}you{#PreviousFormat}? What was this place before you arrived?"
				},
				{
					Cue = "/VO/Hecate_0297",
					UseEventEndSound = true,
					SecretMusicActiveStems = { "HecateBass" },
					Text =
					"All of this simply came to be, and so did I, presumably after a former time had finally reached its end. I hesitate to say it was an act of will. It was more like a sudden shift, as when a conflagration happens from a spark. I arrived at such a time, and all else then arrived, from me."
				},
			},
			HecateAboutDeath01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateAboutInfinity01" },
				RequiredFalseTextLinesLastRun = { "HecateAboutInfinity01" },
				{
					Cue = "/VO/Hecate_0300",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"When you expire, and then suddenly return to life within your father's residence, perhaps it is akin to when I first gained consciousness so long ago. Perhaps I, too, had just expired, only to reawaken."
				},
			},
			HecateAboutDiscovery01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateGift07", "NyxGift07" },
				{
					Cue = "/VO/Hecate_0301",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"You may have wondered, Son of Hades, how it is you came to find me in this space, when I have gone unseen by most for quite some time. I have wondered this, as well, and think that our connection to Goddess Nyx is the most likely answer."
				},
			},

			-- alt below (if you met persephone already)
			HecateAboutPersephone01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateAboutResponding01", "HecateGift01" },
				RequiredAnyTextLines = { "Flashback_Mother_01", "CerberusStyxMeeting01" },
				RequiredFalseTextLines = { "HecateAboutPersephone01_B", "PersephoneFirstMeeting" },
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },
				{
					Cue = "/VO/Hecate_0302",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					Text =
					"Son of Hades, I believe I have deduced something I ought have sooner recognized. Your mother must have been one who called herself Persephone. Her stay within the Underworld was brief, from my perspective, but impactful, nonetheless. You seek her now? Respond."
				},
				{
					Cue = "/VO/ZagreusField_3403",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Serious_01",
					SecretMusicMutedStems = { "HecateBass" },
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"I do. She's somewhere on the surface. That's why I keep on finding you like this. I'm trying to find her."
				},
				{
					Cue = "/VO/Hecate_0303",
					UseEventEndSound = true,
					SecretMusicActiveStems = { "HecateBass" },
					Text =
					"I hope that your attempts achieve success. She is beyond my senses, presently, though of course I am still able to assist you in your journey, thus."
				},
			},
			HecateAboutPersephone01_B =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateAboutResponding01", "HecateGift01", "PersephoneFirstMeeting" },
				RequiredAnyTextLines = { "Flashback_Mother_01", "CerberusStyxMeeting01" },
				RequiredFalseTextLines = { "Ending01", "HecateAboutPersephone01" },
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },
				{
					Cue = "/VO/Hecate_0302",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					Text =
					"Son of Hades, I believe I have deduced something I ought have sooner recognized. Your mother must have been one who called herself Persephone. Her stay within the Underworld was brief, from my perspective, but impactful, nonetheless. You seek her now? Respond."
				},
				{
					Cue = "/VO/ZagreusField_4296",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Empathetic_01",
					SecretMusicMutedStems = { "HecateBass" },
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Oh, Master Hecate... you should know I have located her, already. Though where she is, I cannot stay for long. So I am visiting, as often as I can. It's... not unlike our visits here. Only, somehow, even harder to get to where she is."
				},
				{
					Cue = "/VO/Hecate_0306",
					UseEventEndSound = true,
					SecretMusicActiveStems = { "HecateBass" },
					Text =
					"I see. Then, it is good to know that you have been in contact. And I trust that your successive visits shall be worth their while. Not unlike our visits here."
				},
			},

			HecateAboutPersephone02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateAboutPersephone01", "HecateGift05", },
				RequiredFalseTextLines = { "PersephoneFirstMeeting", "HecateAboutPersephone01_B" },
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },
				{
					Cue = "/VO/Hecate_0304",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					Text =
					"Son of Hades, if you locate the one who called herself Persephone, shall it then come to pass that we no longer see each other in this way? Respond."
				},
				{
					Cue = "/VO/ZagreusField_3404",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Empathetic_01",
					SecretMusicMutedStems = { "HecateBass" },
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Oh! I... Master Hecate, I don't know what to expect from there. But, to be direct with you, if I could leave the Underworld forever... I think I would. Though, I would miss you. Many others here."
				},
				{
					Cue = "/VO/Hecate_0305",
					UseEventEndSound = true,
					SecretMusicActiveStems = { "HecateBass" },
					PreLineWait = 0.5,
					Text = "...I would miss you as well. Thank you for telling me."
				},
			},

			HecatePostEnding02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecatePostEnding01" },
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },
				{
					Cue = "/VO/Hecate_0309",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					Text =
					"Tell me something, Son of Hades. If the one who called herself Persephone is back, then... why do you continue to return? Respond."
				},
				{
					Cue = "/VO/ZagreusField_4298",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Default_01",
					SecretMusicMutedStems = { "HecateBass" },
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Master Hecate, it seems I've developed something of a talent around breaking out of here. Or, there, I mean, the Underworld, so... it's become more of an official role for me, I guess. If escape shouldn't be possible, then someone needs to find the gaps."
				},
				{
					Cue = "/VO/Hecate_0310",
					UseEventEndSound = true,
					SecretMusicActiveStems = { "HecateBass" },
					PreLineWait = 0.35,
					Text =
					"Indeed. Then, you shall visit with me still, despite accomplishing the principal object of your journey back when first we met. Good."
				},
			},

			HecateAboutFishing01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredCosmetics = { "FishingUnlockItem" },
				RequiredAnyCaughtFishTypes = { "Fish_Hecate_Common_01", "Fish_Hecate_Rare_01", "Fish_Hecate_Legendary_01" },
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },

				{
					Cue = "/VO/Hecate_0176",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"I am impressed that you were able to procure a specimen out from the flowing currents here in my domain, with nothing but a simple instrument. I shall look forward to your subsequent attempts."
				},
			},
			HecateAboutKeepsake01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTrait = "HecateBoonTrait",
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },

				{
					Cue = "/VO/Hecate_0292",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"I trust the small round catalyst which I provided you has been of value, Son of Hades? It is my hope it makes your journeys to this space less difficult, perhaps inducing them on a more frequent interval."
				},
			},
			HecateAboutBlackShawl01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateFirstPickUp" },
				RequiredTrait = "BackstabAlphaStrikeTrait",
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },

				{
					Cue = "/VO/Hecate_0291",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"You have arrived within a certain shroud of darkness, Son of Hades. The goddess Nyx's ancient shawl. I had not sensed its void in a considerable amount of time."
				},
			},

			HecateAboutStyx01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateFirstPickUp" },
				RequiredRoomLastRun = "D_Intro",
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },

				{
					Cue = "/VO/Hecate_0317",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"You have traveled recently beyond my senses, Son of Hades. I persist here only in the fathomless depths. I know what lies out there, having created it. But I know nothing of what it is like, right now. Do not tell me. I prefer to think of all the possibilities."
				},
			},
			HecateSurfaceQuest01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateAboutStyx01", "HecateGift06", "LordHadesDefeated02" },
				RequiredRoomLastRun = "D_Intro",
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },
				RequiredMinRunsCleared = 2,

				{
					Cue = "/VO/Hecate_0318",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					Text =
					"From the rumblings of the earth, I have deduced your father, himself, stands against you when at last you are about to leave these depths. It must be quite an interaction between you. Have I deduced correctly? Respond."
				},
				{
					Cue = "/VO/ZagreusField_3804",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Default_01",
					SecretMusicMutedStems = { "HecateBass" },
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"That's right, Master Hecate. My father personally takes it upon himself to stop me in the event none of his underlings beat him to it. He... can be a handful."
				},
				{
					Cue = "/VO/Hecate_0319",
					UseEventEndSound = true,
					SecretMusicActiveStems = { "HecateBass" },
					Text =
					"Well, then. Consider bringing to one of your future interactions the small round catalyst, which I provided you. The one in the shape you call an egg? It shall serve no purpose there at all. Yet if you succeed, then it shall bring us some amusement, shall it not?"
				},
			},
			-- low health
			HecateLowHealth01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateFirstPickUp" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },

				{
					Cue = "/VO/Hecate_0103",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					UseEventEndSound = true,
					Text =
					"It seems to me that you are very close to death, O Son of Hades, and yet you deigned to visit me within my space. I could hasten your demise, if you so choose?"
				},
			},
			HecateLowHealth02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateFirstPickUp" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },

				{
					Cue = "/VO/Hecate_0104",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					UseEventEndSound = true,
					Text =
					"I almost did not notice you, O Son of Hades, for you are closer now to death than life. Perhaps, though, we can stave off the inevitable for a little while."
				},
			},
			HecateLowHealth03 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateFirstPickUp" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },

				{
					Cue = "/VO/Hecate_0180",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					UseEventEndSound = true,
					Text =
					"Your deaths are but a temporary setback, Son of Hades. Though it appears to me you are quite close to having such a setback, now."
				},
			},
			HecateLowHealth04 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateFirstPickUp" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },

				{
					Cue = "/VO/Hecate_0181",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					UseEventEndSound = true,
					Text =
					"Your next experience with death seems to be imminent, though let us see if I can hasten or forestall it."
				},
			},
			HecateLowHealth05 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateFirstPickUp", "HecateGift03" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },

				{
					Cue = "/VO/Hecate_0182",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					UseEventEndSound = true,
					Text =
					"It may seem cruel that I would wish you death, O Son of Hades. But from my perspective, it means you are much more likely to return to me."
				},
			},
			HecateLowHealth06 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateFirstPickUp" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },

				{
					Cue = "/VO/Hecate_0183",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					UseEventEndSound = true,
					Text =
					"Although you may succumb soon to your injuries, please make the most of your remaining life, rather than anticipate the next. The future is uncertain to all save the Fates."
				},
			},

			-- weapons & weapon enchantments
			HecateAboutShieldWeapon01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateFirstPickUp" },
				RequiredFalseTextLines = { "HecateAboutWeaponEnchantments01", "HecateAboutShieldWeapon01" },
				RequiredWeapon = "ShieldWeapon",
				RequiredFalseTraits = { "ShieldRushBonusProjectileTrait", "ShieldTwoShieldTrait", },
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },
				{
					Cue = "/VO/Hecate_0172",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"You come to my domain bearing an all-seeing artifact that sprang from me after the dawn of time. It is considered a defensive instrument, I do believe. Though, I suspect you have discovered, or soon shall discover, it is nothing of the sort."
				},
			},
			HecateAboutWeaponEnchantments01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateFirstPickUp", },
				RequiredTrait = "ShieldRushBonusProjectileTrait",
				RequiredWeapon = "ShieldWeapon",
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },

				{
					Cue = "/VO/Hecate_0173",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					Text =
					"I expected your arrival, Son of Hades. For I am able to see through you. Rather, through the all-seeing artifact, which sprang from me after the dawn of time, and now resembles, in your hands, its foremost form. Respond."
				},
				{
					Cue = "/VO/ZagreusField_2692",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Serious_01",
					SecretMusicMutedStems = { "HecateBass" },
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"What, you must mean the Shield of Hecate, here? {#DialogueItalicFormat}Your {#PreviousFormat}shield, Master Hecate, I should say. It's a remarkable artifact. Imposing, too! Your original creations must have been astounding."
				},
				{
					Cue = "/VO/Hecate_0174",
					UseEventEndSound = true,
					SecretMusicActiveStems = { "HecateBass" },
					Text =
					"Your response is acceptable. And I am grateful to have had my recent firsthand glimpses of this vast domain."
				},
			},
			HecateAboutZeusAspect01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateFirstPickUp", },
				RequiredTrait = "ShieldTwoShieldTrait",
				RequiredWeapon = "ShieldWeapon",
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },

				{
					Cue = "/VO/Hecate_0175",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"Ah, you have that all-seeing artifact of mine, but in the old guise that the great Lord Zeus once used when he retaliated violently against his parentage. I watched his movements through it for some time."
				},
			},
			HecateRevealsBeowulfAspect01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateFirstPickUp", "AchillesRevealsGuanYuAspect01" },
				RequiredAnyTextLines = { "HecateAboutShieldWeapon01", "HecateAboutZeusAspect01",
					"HecateAboutWeaponEnchantments01", },
				RequiredPlayed = { "/VO/ZagreusHome_2027" },
				RequiredMinSuperLockKeysSpentOnWeapon = { Name = "ShieldWeapon", Count = 5 },
				RequiredFalseTextLinesThisRun = GameData.LegendaryAspectIntroTextLines,
				RequiredFalseTextLinesLastRun = GameData.LegendaryAspectIntroTextLines,
				RequiredFalseFlags = { "NyxHecateReunionInProgress" },
				{
					Cue = "/VO/Hecate_0177",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					Text =
					"I bear a message for you, Son of Hades. One recorded in an age when certain concepts it describes did not yet all exist. Remember this: {#DialogueItalicFormat}I see you stand your ground against the serpent's flame. {#PreviousFormat}A waking-phrase, to which you and the all-seeing artifact of my creation may respond."
				},
				{
					Cue = "/VO/ZagreusField_3394",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Serious_01",
					SecretMusicMutedStems = { "HecateBass" },
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"A waking-phrase... and an all-seeing artifact, you must mean Aegis, right? So I'm to say to it, {#DialogueItalicFormat}I see you stand your ground against the serpent's flame{#PreviousFormat}, and it'll wake right up. Though, can you tell me what it means, or who?"
				},
				{
					Cue = "/VO/Hecate_0178",
					SecretMusicActiveStems = { "HecateBass" },
					UseEventEndSound = true,
					Text =
					"Oh, I can tell you almost anything. However, I would much prefer it if you learned most of the answers you seek by yourself."
				},
			},

		},

		PickupTextLineSets =
		{
			HecateFirstPickUp =
			{
				PlayOnce = true,
				RequiredTextLines = { "AthenaFirstPickUp", },

				{
					Cue = "/VO/ZagreusField_1069",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					SecretMusicMutedStems = { "HecateBass" },
					PreLineThreadedFunctionName = "PowerWordPresentation",
					PreLineThreadedFunctionArgs = { WaitTime = 4.9 },
					Text =
					"This is the first dialog, in the name of Hades!"
				},
			},
			HecateMiscPickup01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateFirstPickUp", },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0050",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"I sensed a certain rumbling here within the bowels of the earth. It is as though it had ingested something that did not sit well... perhaps the earth itself wishes to spit you up and out...?"
				},
			},
			HecateMiscPickup02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup01" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0051",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"The Olympians are vying for your favor, are they not? So often they forget themselves. They force their blessings onto you, whilst I? I merely offer you a choice."
				},
			},
			HecateMiscPickup03 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup02" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0052",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"Your path is yours to shape as you see fit, regardless of the Fates' design. Together we may twist that path a bit, if you would like."
				},
			},
			HecateMiscPickup04 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0053",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"I both expected you to come and am surprised to see you, Son of Hades. Where shall your journey take you from this point?"
				},
			},
			HecateMiscPickup05 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0054",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"Please tell me how my power over all existence may be of small assistance to you this time, Son of Hades?"
				},
			},
			HecateMiscPickup06 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0055",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"The tremors underneath the earth foretold of your arrival at this very moment, Son of Hades; and, I have anticipated it."
				},
			},
			HecateMiscPickup07 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0056",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"You chose to visit me again within these darkest reaches of the earth, as I, in turn, now choose to offer you the means to alter your reality."
				},
			},
			HecateMiscPickup08 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0057",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"Back when I conceived the world and the immortals, Son of Hades, I did not expect you would be standing here before me now."
				},
			},
			HecateMiscPickup09 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0058",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"You have arrived at last, just as I wondered how we might best alter one another's courses of existence here today."
				},
			},
			HecateMiscPickup10 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0059",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"Son of Hades, let me welcome your return here to my space within the Underworld, and bid you choose an alteration to the fabric of reality."
				},
			},
			HecateMiscPickup11 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0060",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"It pleases me that you are here again; for, through you I can tinker with reality, along the fringes that are not yet fully formed."
				},
			},
			HecateMiscPickup12 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredFalseTextLines = { "HecatePostEpilogue01" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0061",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"Your presence never ceases to intrigue me, Son of Hades; for you are not like the Olympians on high, who have forgotten me, or thusly choose to act."
				},
			},
			HecateMiscPickup13 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0062",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"From my perspective I have summoned you, whilst you believe you came of your volition; both statements can be true, is that not so?"
				},
			},
			HecateMiscPickup14 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0063",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"Come forth, O Son of Hades, and together, let us sow my namesake through the depths of what your father thinks his own domain."
				},
			},
			HecateMiscPickup15 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0064",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"How fares these days the never-ending cycle of rebirth and death for you, O Son of Hades? Sufficiently amusing, I should hope?"
				},
			},
			HecateMiscPickup16 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredLootChoices = 3,
				RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0065",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"Out of the infinitely spanning possibilities before us, Son of Hades, I have arbitrarily selected only three again from which to let you choose."
				},
			},
			HecateMiscPickup17 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0066",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"The Fates have much in store for you, O Son of Hades. Perhaps, however, we can tamper with their weavings here to some extent."
				},
			},
			HecateMiscPickup18 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0067",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"Let us conspire to expand and frustrate your lord father's sense of both what is and is not possible within his Underworld."
				},
			},
			HecateMiscPickup19 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredLootChoices = 3,
				RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0068",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"Infinite possibilities can be tedious to choose from, so, let me provide you with a significantly smaller set with which you may yet change the Fates' designs."
				},
			},
			HecateMiscPickup20 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0069",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"Through the expanse of time, I often wondered, is it necessary to be fair? The immortals are my offspring; surely I should treat them equally. And yet I find that there is little sport in doing so."
				},
			},

			HecateMiscPickupExtra01 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredLootChoices = 3,
				RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0154",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "Among infinite possibilities, consider only these."
				},
			},
			HecateMiscPickupExtra02 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredLootChoices = 3,
				RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0155",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "Choose carefully, in general, and now."
				},
			},
			HecateMiscPickupExtra03 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				{
					Cue = "/VO/Hecate_0156",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "We are the sum of all decisions that we make, and that are made for us."
				},
			},
			HecateMiscPickupExtra04 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0157",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "This space grows far more interesting when you occupy a small amount of it."
				},
			},
			HecateMiscPickupExtra05 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredLootChoices = 3,
				RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0158",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "How you evaluate decisions is of limitless interest to me."
				},
			},
			HecateMiscPickupExtra06 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredLootChoices = 3,
				RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0159",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "The burden of the passing time shall force a choice from you."
				},
			},
			HecateMiscPickupExtra07 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0160",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "Is there not pleasure in determining an outcome, Son of Hades?"
				},
			},
			HecateMiscPickupExtra08 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredLootChoices = 3,
				RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0161",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "My mark be with you, Son of Hades. You need merely choose its shape."
				},
			},
			HecateMiscPickupExtra09 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0162",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "Though the waters of the Styx may wash away my mark, I can restore it."
				},
			},
			HecateMiscPickupExtra10 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0163",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "The rhythm of your visits here over the course of time is pleasant, Son of Hades."
				},
			},
			HecateMiscPickupExtra11 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0164",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "You are already back, and you are always welcome, Son of Hades."
				},
			},
			HecateMiscPickupExtra12 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03", "HecateGift05" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0165",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "Please visit me as frequently as you would like or dare."
				},
			},
			HecateMiscPickupExtra13 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03", "HecateGift06" },
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0166",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "I find myself anticipating your arrivals, Son of Hades."
				},
			},
			HecateMiscPickupExtra14 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateMiscPickup03" },
				RequiredLootChoices = 3,
				RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0167",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "I require no exchange of words with you. Merely a choice."
				},
			},

			HecateMiscPickup21 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HecateBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0002",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "Once more you have returned to my domain."
				},
			},
			HecateMiscPickup22 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HecateBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0003",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "I have a proposition, Son of Hades."
				},
			},
			HecateMiscPickup23 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HecateBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0004",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "I bid you welcome here within my space."
				},
			},
			HecateMiscPickup24 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HecateBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0005",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "How fares the solitary Son of Hades?"
				},
			},
			HecateMiscPickup25 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HecateBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0006",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "What shall we do for one another, Son of Hades?"
				},
			},
			HecateMiscPickup26 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HecateBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0007",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "You are within my presence, Son of Hades."
				},
			},
			HecateMiscPickup27 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HecateBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0008",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "What brings you here to me this time around?"
				},
			},
			HecateMiscPickup28 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HecateBasicPickUpTextLines,
				{
					Cue = "/VO/Hecate_0009",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "Your such visits are agreeable with me."
				},
			},
			HecateMiscPickup29 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HecateBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0010",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "How may the force of Hecate alter you?"
				},
			},
			HecateMiscPickup30 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HecateBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0011",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "You have arrived before me once again."
				},
			},
			HecateMiscPickup31 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HecateBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0012",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "I see that you are here, and so am I."
				},
			},
			HecateMiscPickup32 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HecateBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0013",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "You stand before me, Son of Hades."
				},
			},
			HecateMiscPickup33 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HecateBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0014",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "How shall we alter the intentions of the Fates?"
				},
			},
			HecateMiscPickup33 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HecateBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0015",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "How might I mend the fabric of existence for you, Son of Hades?"
				},
			},
			HecateMiscPickup34 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HecateBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0016",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "There need not be a reason for your visit."
				},
			},
			HecateMiscPickup35 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HecateBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0017",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "How may I shape reality for you?"
				},
			},
			HecateMiscPickup36 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HecateBasicPickUpTextLines,
				{
					Cue = "/VO/Hecate_0018",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "You are always welcome here within this space."
				},
			},
			HecateMiscPickup37 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HecateBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0019",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "What occupies your mind at this occasion?"
				},
			},
			HecateMiscPickup38 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HecateBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0020",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "Let us consider certain possibilities."
				},
			},
			HecateMiscPickup39 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredLootChoices = 3,
				RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
				RequiredTextLines = GameData.HecateBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0021",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "Among infinite outcomes, I propose these three."
				},
			},
			HecateMiscPickup40 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HecateBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0022",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "Choose how to circumvent the Fates' design."
				},
			},
			HecateMiscPickup41 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HecateBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0105",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "Hail, Son of Hades."
				},
			},
			HecateMiscPickup42 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HecateBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0106",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "I am amused to see you once again."
				},
			},
			HecateMiscPickup43 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HecateBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0107",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "You have descended to my space once more."
				},
			},
			HecateMiscPickup45 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HecateBasicPickUpTextLines,
				RequiredUnitNotAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0108",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "You have returned to me."
				},
			},
			HecateMiscPickup46 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.HecateBasicPickUpTextLines,
				RequiredAnyTextLines = { "HecateGift06" },
				{
					Cue = "/VO/Hecate_0109",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "You are most welcome here."
				},
			},

			HecateWithNyx01 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredUnitAlive = "NPC_Nyx_Story_01",
				{
					Cue = "/VO/Hecate_0285",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "Your presence is appreciated, Son of Hades, but please leave us here, for now."
				},
			},
			HecateWithNyx02 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredUnitAlive = "NPC_Nyx_Story_01",
				RequiredTextLines = { "HecateWithNyx01" },
				{
					Cue = "/VO/Hecate_0286",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "Forgive us, Son of Hades, as we are amid exchanging memories."
				},
			},
			HecateWithNyx03 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredUnitAlive = "NPC_Nyx_Story_01",
				RequiredTextLines = { "HecateWithNyx01" },
				{
					Cue = "/VO/Hecate_0287",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "Son of Hades, I am pleased the goddess Nyx returned to me."
				},
			},
			HecateWithNyx04 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredUnitAlive = "NPC_Nyx_Story_01",
				RequiredTextLines = { "HecateWithNyx01" },
				{
					Cue = "/VO/Hecate_0288",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "Forgive me, Son of Hades, but I must continue this discussion with the goddess Nyx."
				},
			},
			HecateWithNyx05 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredUnitAlive = "NPC_Nyx_Story_01",
				RequiredTextLines = { "HecateWithNyx01" },
				{
					Cue = "/VO/Hecate_0289",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "I had not seen the goddess Nyx in quite some time."
				},
			},
			HecateWithNyx06 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredUnitAlive = "NPC_Nyx_Story_01",
				RequiredTextLines = { "HecateWithNyx01" },
				{
					Cue = "/VO/Hecate_0290",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "I am quite unaccustomed to having all this company of late."
				},
			},
			HecateWithNyx07 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredUnitAlive = "NPC_Nyx_Story_01",
				RequiredTextLines = { "HecateWithNyx01" },
				{
					Cue = "/VO/Hecate_0326",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "My daughter was just in the midst of telling me the latest occurrences about your House."
				},
			},
			HecateWithNyx08 =
			{
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredUnitAlive = "NPC_Nyx_Story_01",
				RequiredTextLines = { "HecateWithNyx01" },
				{
					Cue = "/VO/Hecate_0327",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text = "As you are able to observe, the goddess Nyx and I are in the midst of conversation now."
				},
			},

		},

		BoughtTextLines =
		{
			HecateLootBought01 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },

				{
					Cue = "/VO/Hecate_0087",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"Perhaps you did not think that I would seek you out among the boatman Charon's trifles, which precisely is the reason I have done it."
				},
			},
			HecateLootBought02 =
			{
				PlayOnce = true,
				PreEventFunctionName = "HecateInteractPresentation",
				PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "HecateLootBought01" },

				{
					Cue = "/VO/Hecate_0088",
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"The boatman Charon understands my whims, and his loyalty is purchased easily by one for whom base wealth is meaningless, so, I am here."
				},
			},
		},

		GiftTextLineSets =
		{
			-- gives gift in exchange
			HecateGift01 =
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
					SecretMusicMutedStems = { "HecateBass" },
					PostLineFunctionName = "HecateInteractPresentation",
					Text =
					"Master Hecate? Everyone makes offerings to my relatives upon Olympus. I wish to make an offering to you. Thank you for... everything."
				},
				{
					Cue = "/VO/Hecate_0094",
					PortraitExitWait = 1.0,
					SecretMusicActiveStems = { "HecateBass" },
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					UseEventEndSound = true,
					Text =
					"How droll of you to make attempts to tempt me with material things. Here, then, please in turn allow me this attempt at reciprocity."
				},
			},
			HecateGift02 =
			{
				PlayOnce = true,
				RequiredTextLines = { "HecateGift01", },
				{
					Cue = "/VO/ZagreusHome_0580",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					SecretMusicMutedStems = { "HecateBass" },
					PostLineFunctionName = "HecateInteractPresentation",
					Text = "This is for you, Master Hecate. Everyone beneath the heavens and earth enjoys this stuff."
				},
				{
					Cue = "/VO/Hecate_0089",
					PortraitExitWait = 1.0,
					SecretMusicActiveStems = { "HecateBass" },
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"You honor me in making such an offering, though please; it is not necessary to endear yourself using material means, for it is the thought alone which counts."
				},
			},
			HecateGift03 =
			{
				PlayOnce = true,
				RequiredTextLines = { "HecateGift02", },
				{
					Cue = "/VO/ZagreusHome_0128",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					SecretMusicMutedStems = { "HecateBass" },
					PostLineFunctionName = "HecateInteractPresentation",
					Text =
					"Master Hecate, forebear of the gods, it is an honor to have met you. Please, accept this gift."
				},
				{
					Cue = "/VO/Hecate_0090",
					PortraitExitWait = 1.0,
					SecretMusicActiveStems = { "HecateBass" },
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"Seldom do mortals or immortals think of making offerings to me. As I do not expect such token gestures, I am very much amused, and I accept."
				},
			},
			HecateGift04 =
			{
				PlayOnce = true,
				RequiredTextLines = { "HecateGift03", },
				{
					Cue = "/VO/ZagreusHome_0581",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					SecretMusicMutedStems = { "HecateBass" },
					PostLineFunctionName = "HecateInteractPresentation",
					Text =
					"Master Hecate, I pledge never to forget you or your good graces. May your wisdom and your whim forever guide me."
				},
				{
					Cue = "/VO/Hecate_0091",
					PortraitExitWait = 1.0,
					SecretMusicActiveStems = { "HecateBass" },
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"Is this an offering of fealty or friendship, Son of Hades? I do not wish to know from you the answer, so that I might dwell on it and all the possibilities."
				},
			},
			HecateGift05 =
			{
				PlayOnce = true,
				RequiredTextLines = { "HecateGift04", },
				{
					Cue = "/VO/ZagreusHome_0582",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					SecretMusicMutedStems = { "HecateBass" },
					PostLineFunctionName = "HecateInteractPresentation",
					Text =
					"I'm ever-grateful that my journeys through the Underworld mean that we can get to know each other, Master Hecate."
				},
				{
					Cue = "/VO/Hecate_0092",
					PortraitExitWait = 1.0,
					SecretMusicActiveStems = { "HecateBass" },
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"Your repeated generosity with me is starting to become a bit predictable, and yet... somehow, I nonetheless appreciate it, still. How very odd."
				},
			},
			HecateGift06 =
			{
				PlayOnce = true,
				RequiredTextLines = { "HecateGift05", },
				{
					Cue = "/VO/ZagreusField_3395",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					SecretMusicMutedStems = { "HecateBass" },
					PostLineFunctionName = "HecateInteractPresentation",
					Text =
					"Master Hecate, it's little wonder all existence sprang from you, because I see the noble qualities in so many I've met embodied in you. Please, accept this gift."
				},
				{
					Cue = "/VO/Hecate_0184",
					PortraitExitWait = 1.0,
					SecretMusicActiveStems = { "HecateBass" },
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					UseEventEndSound = true,
					Text =
					"If it is unclear yet, Son of Hades, I shall not be giving more to you in exchange for your repeated offerings. You give them to me knowing it shall serve no purpose and achieve no end. I know that there are some among both mortals and your kind for whom this is quite unacceptable."
				},
			},
			-- high relationship / locked gifts
			HecateGift07 =
			{
				PlayOnce = true,
				RequiredTextLines = { "HecateGift06", },
				{
					Cue = "/VO/ZagreusField_3396",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					SecretMusicMutedStems = { "HecateBass" },
					PostLineFunctionName = "HecateInteractPresentation",
					Text =
					"This is the greatest delicacy of Olympus, Master Hecate. It's for you. I think normally it would be difficult for the Olympians to get it to you here."
				},
				{
					Cue = "/VO/Hecate_0185",
					SecretMusicActiveStems = { "HecateBass" },
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
					Text =
					"You make an even greater offering to me, knowing it shall produce no material result. You are aware that I am not persuadable? Yours is a squandering of resources and time. Although, of course, we do have each of these in great supply. Now then, respond."
				},
				{
					Cue = "/VO/ZagreusField_3397",
					Speaker = "CharProtag",
					Portrait = "Portrait_Zag_Empathetic_01",
					PortraitExitAnimation = "Portrait_Zag_Empathetic_01_Exit",
					PreLineWait = 0.35,
					SecretMusicMutedStems = { "HecateBass" },
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"...I just think the act of giving isn't quite the same as an exchange. I know I won't be getting any sort of other talisman or something in return. But, through these offerings, I can express my thanks. That's worth it by itself."
				},
				{
					Cue = "/VO/Hecate_0186",
					PreLineWait = 0.5,
					PortraitExitWait = 1.0,
					SecretMusicActiveStems = { "HecateBass" },
					UseEventEndSound = true,
					Text =
					"...I see. So then, the action is akin to theft. For you are getting something in return that I did not intend to give. I still have much to learn from my creations, Son of Hades. So let us say that we have made an even trade. My learning for your worth."
				},
			},
			HecateGift08 =
			{
				PlayOnce = true,
				RequiredTextLines = { "HecateGift07", },
				{
					Cue = "/VO/ZagreusField_3398",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					SecretMusicMutedStems = { "HecateBass" },
					PostLineFunctionName = "HecateInteractPresentation",
					Text =
					"If you'll forgive me, Master Hecate, this Ambrosia is intended to be given to those whom I care about, and I can think of few recipients I'd like to have it more. Please."
				},
				{
					Cue = "/VO/Hecate_0187",
					SecretMusicActiveStems = { "HecateBass" },
					StartSound = "/SFX/Menu Sounds/HecateMiscSFX",
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
					SecretMusicMutedStems = { "HecateBass" },
					Text =
					"Don't even mention it, please, Master Hecate. All of this is new for me, as well. I try never to overanalyze... my father does enough of that for all of us. I just know, when I encounter the primordial creator, I am going to give thanks. For everything."
				},
				{
					Cue = "/VO/Hecate_0188",
					PreLineWait = 0.5,
					PortraitExitWait = 1.0,
					SecretMusicActiveStems = { "HecateBass" },
					UseEventEndSound = true,
					PostLineThreadedFunctionName = "MaxedRelationshipPresentation",
					PostLineFunctionArgs = { Text = "NPC_Hecate_01", Icon = "Keepsake_HecateSticker_Max" },
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

			-- Master Hecate, thank you.
			{ Cue = "/VO/ZagreusHome_0328" },
		},

		DeathTauntVoiceLines =
		{
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 1.51,
				NoTarget = true,
				Source = { SubtitleColor = Color.HecateVoice },
				Cooldowns =
				{
					{ "HecateDeathReactionSpeech", Time = 20 },
				},

				-- This was one of the potential outcomes of my gift.
				{ Cue = "/VO/Hecate_0331" },
				-- All of this was in accordance with the Fates' design; or perhaps not.
				{ Cue = "/VO/Hecate_0332" },
				-- I expected you would perish soon; but I knew not exactly how.
				{ Cue = "/VO/Hecate_0333" },
				-- Your demises are unfortunate and yet a source of some amusement.
				{ Cue = "/VO/Hecate_0334" },
				-- Be careful with me, Son of Hades.
				{ Cue = "/VO/Hecate_0133",
					                          RequiredPlayed = { "/VO/Hecate_0331", "/VO/Hecate_0332", "/VO/Hecate_0333",
						"/VO/Hecate_0334" }, },
				-- That was perhaps unwise.
				{ Cue = "/VO/Hecate_0134",
					                          RequiredPlayed = { "/VO/Hecate_0331", "/VO/Hecate_0332", "/VO/Hecate_0333",
						"/VO/Hecate_0334" }, },
				-- You have provided me amusement.
				{ Cue = "/VO/Hecate_0150",
					                          RequiredPlayed = { "/VO/Hecate_0331", "/VO/Hecate_0332", "/VO/Hecate_0333",
						"/VO/Hecate_0334" }, },
			},
		},
	}

	-- Gift Section
	local OlympusGiftOrdering = ModUtil.Entangled.ModData(GiftOrdering)
	local OlympusGiftData = ModUtil.Entangled.ModData(GiftData)
	table.insert(OlympusGiftOrdering, 22, "HecateBoonTrait")

	OlympusGiftData.GardenUpgrade =
	{
		InheritFrom = { "DefaultGiftData" },
		MaxedIcon = "Keepsake_Hecate_Max",
		MaxedSticker = "Keepsake_HecateSticker_Max",
		MaxedRequirement = { RequiredTextLines = { "HecateGift07" }, },
		Value = 0,
		Maximum = 7,
		Locked = 7,
		[1] = { Gift = "HecateBoonTrait" },
		[7] = { RequiredResource = "SuperGiftPoints" },
		UnlockGameStateRequirements = { RequiredTextLines = { "HecateBackstory04" } }
	}
	-- Multi Gods compatibility

	-- FUNCTIONS
	
	-- New BIOME FOR SECRET GARDEN
	local OlympusRoomSetData = ModUtil.Entangled.ModData(RoomSetData)
	OlympusRoomSetData.Secrets.BaseSecretG = {
		DebugOnly = true,

		EntranceFunctionName = "RoomEntrancePortal",
		NextRoomEntranceFunctionName = "RoomEntrancePortal",
		EntranceAnimation = "ZagreusDashEntrance",
		EntranceVfx = "ZagreusSecretDoorDiveFadeFx",
		ExitAnimation = "ZagreusSecretDoorExit",
		ExitVfx = "ZagreusSecretDoorDiveFadeFx",
		ExitDoorOpenAnimation = "ExitDoorLinesSpecial",
		ExitDoorCloseAnimation = "ExitDoorLinesSpecial",
		SkipLastKillPresentation = true,
		UsePromptOffsetY = 120,
		LocationText = "Location_Secret_G",
		ResultText = "RunHistoryScreenResult_Secret_G",
		RichPresence = "#RichPresence_Chaos",
		BiomeName = "Secrets",
		LocationTextColor = { 20, 0, 255, 255 },
		Ambience = "/Leftovers/Ambience/MountainAmbience",
		SecretMusic = "/Music/ChaosTheme_MC",
		SkipLeavePrevRoomSFX = true,
		UsePreviousRoomSet = true,
		BlockHeroLight = true,
		ForcedRewardStore = "Secrets",
		LegalEncounters = { "Secret" },
		ZoomFraction = 0.75,
		--BreakableOptions = { "BreakableIdle1", "BreakableIdle2", "BreakableIdle3" },
		--BreakableValueOptions = { MaxHighValueBreakables = 3 },
		SoftClamp = 0.75,
		FishingPointChance = 0.15,
		FishingPointRequirements =
		{
			RequiredCosmetics = { "FishingUnlockItem" },
			RequiredMinRoomsSinceFishingPoint = 5,
			RequiredAccumulatedMetaPoints = 1000,
		},
		EnterVoiceLines =
		{
		},
	}
	OlympusRoomSetData.Secrets.RoomSecretG01 =
	{
		InheritFrom = { "BaseSecretG" },
		SpawnRewardOnId = 412405,
		NumExits=1,

		InspectPoints =
		{
			[505097] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				InteractTextLineSets =
				{
					Inspect_RoomSecret01_01 =
					{
						-- Could you keep it down?
						EndCue = "/VO/ZagreusField_0535",
						EndWait = 0.35,
						{ Cue = "/VO/Storyteller_0161",
							Text = "{#DialogueItalicFormat}The deepest reaches of the Underworld... the void from which all life and consciousness sprang forth during the dawn of time... the realm of Chaos. A land almost unseen even to denizens of death's kingdom." },
					},
				},
			},
		},
	}

	OlympusRoomSetData.Secrets.RoomSecretG02 =
	{
		InheritFrom = { "BaseSecretG" },
		SpawnRewardOnId = 412428,
		NumExits=1,

		InspectPoints =
		{
			[505099] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				InteractTextLineSets =
				{
					Inspect_RoomSecret02_01 =
					{
						-- It wasn't all that hard to find really.
						EndCue = "/VO/ZagreusField_0937",
						EndWait = 0.35,
						{ Cue = "/VO/Storyteller_0201",
							Text = "{#DialogueItalicFormat}The fathomless expanses hidden in darkest corners of the Underworld stretch well past the notice of Lord Hades himself; and yet, the interfering Prince somehow discovers passage there." },
					},
				},
			},
		},
	}

	OlympusRoomSetData.Secrets.RoomSecretG03 =
	{
		InheritFrom = { "BaseSecretG" },
		SpawnRewardOnId = 412426,
		NumExits=1,

		InspectPoints =
		{
			[505098] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				InteractTextLineSets =
				{
					Inspect_RoomSecret03_01 =
					{
						-- I'd best take all the evidence I find.
						EndCue = "/VO/ZagreusField_0938",
						EndWait = 0.35,
						{ Cue = "/VO/Storyteller_0202",
							Text = "{#DialogueItalicFormat}Within the Underworld's quietest, most solitary, darkest abyss lies hidden evidence of the beginning of all things, of Chaos! The most ancient sculptor that has shaped this world." },
					},
				},
			},
		},
	}
	OverwriteTableKeys(RoomData, RoomSetData.Secrets)
end
