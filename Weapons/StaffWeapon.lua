
if ModUtil ~= nil then
	
	local OlympusWeaponSets = ModUtil.Entangled.ModData(WeaponSets)
    table.insert(OlympusWeaponSets.HeroMeleeWeapons, "StaffWeapon")

	local OlympusWeaponData = ModUtil.Entangled.ModData(WeaponData)
	OlympusWeaponData.StaffWeapon =
	{
		InheritFrom = { "BaseUnlockableWeapon", },
		EquippedKitAnimation = "WeaponStaffFloatingIdleOff",
		UnequippedKitAnimation = "WeaponStaffFloatingIdle",
		BonusUnequippedKitAnimation = "WeaponStaffFloatingIdleBonus",
		BonusEquippedKitAnimation = "WeaponStaffFloatingIdleOffBonus",
		FirstTimeEquipAnimation = "ZagreusSwordAttack1",
		FirstTimeEquipSound = "/SFX/Enemy Sounds/Minotaur/HugeAxeSwing",
		UseText = "UseWeaponKit",
		UpgradeChoiceText = "UpgradeChoiceMenu_Melee",
		ShortName = "StaffWeapon_Short",
		--DashWeapon = "SwordWeaponDash",
		--ExpireDashWeaponOnDash = true,
		--SecondaryWeapon = "SwordParry",
		PostWeaponUpgradeScreenAnimation = "ZagreusSwordAttack2_ReturnToIdle_Loop",

		CompleteObjectivesOnFire = { "SwordWeapon", "SwordWeaponArthur" },

		KitInteractFunctionName = "WeaponKitSpecialInteractPresentation",
		KitInteractSpecialUnlockSound = "/Leftovers/Menu Sounds/EmoteAscendedArthurChoir",
		KitInteractGameStateRequirements =
		{
			RequiredTextLines = { "NyxRevealsArthurAspect01" },
			RequiredFalsePlayed = { "/VO/ZagreusHome_2047", },
		},

		SkipAttackNotReadySounds = true,

		CauseImpactReaction = true,

		--FireScreenshake = { Distance = 2, Speed = 200, FalloffSpeed = 1400, Duration = 0.1, Angle = 225 },

		HitSimSlowParameters =
		{
			{ ScreenPreWait = 0.04, Fraction = 0.1, LerpTime = 0 },
			{ ScreenPreWait = 0.01, Fraction = 1.0, LerpTime = 0.03 },
		},

		HitRumbleParameters =
		{
			{ ScreenPreWait = 0.02, RightFraction = 0.17, Duration = 0.15 },
		},

		EquipVoiceLines =
		{
			{
				Cooldowns =
				{
					{ Name = "ZagreusWeaponEquipSpeech", Time = 40 },
				},
				{
					BreakIfPlayed = true,
					PreLineWait = 0.35,

					ExplicitRequirements = true,
					GameStateRequirements =
					{
						-- None
					},

					-- Stygius, Blade of the Underworld; I need your strength.
					{ Cue = "/VO/ZagreusField_0151", GameStateRequirements = { RequiredMinCompletedRuns = 1, }, PlayOnce = true },
				},
				{
					RandomRemaining = true,
					PreLineWait = 0.35,
					SuccessiveChanceToPlay = 0.33,
					TriggerCooldowns = { "ZagreusMiscWeaponEquipSpeech", },

					ExplicitRequirements = true,
					GameStateRequirements =
					{
						-- None
					},

					-- My blade...
					{ Cue = "/VO/ZagreusField_1262" },
					-- Come, Stygius.
					{ Cue = "/VO/ZagreusField_1263" },
					-- Stygius hungers.
					{ Cue = "/VO/ZagreusField_1154", GameStateRequirements = { RequiredOneOfTraits = { "UnusedWeaponBonusTrait", "UnusedWeaponBonusTraitAddGems" }, }, },
				},
				[3] = GlobalVoiceLines.MiscWeaponEquipVoiceLines,
			},
			[2] = GlobalVoiceLines.SkellyWeaponEquipReactionVoiceLines,
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/VO/ZagreusEmotes/EmoteAttacking_Sword" },
				{ Name = "/SFX/Player Sounds/ZagreusSwordSwipe" },
			},
			ImpactSounds =
			{
				Invulnerable = "/SFX/SwordWallHitClank",
				Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
				Bone = "/SFX/MetalBoneSmash",
				Brick = "/SFX/MetalStoneClang",
				Stone = "/SFX/MetalStoneClang",
				Organic = "/SFX/StabSplatterSmall",
				StoneObstacle = "/SFX/SwordWallHitClank",
				BrickObstacle = "/SFX/SwordWallHitClank",
				MetalObstacle = "/SFX/SwordWallHitClank",
				BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
			},
		},

		WeaponBinks =
		{
			"ZagreusSword_Bink",
			"ZagreusSwordReturnToIdle_Bink",
			"ZagreusSwordDashAttack_Bink",
			"ZagreusSwordRun_Bink",
			"ZagreusSwordRunStop_Bink",
			"ZagreusSwordParry_Bink",
		},
	}

	OlympusWeaponData.StaffWeapon2 =
	{
		StartingWeapon = false,
		CauseImpactReaction = true,
		CodexWeaponName = "SwordWeapon",
		--FireScreenshake = { Distance = 2, Speed = 300, FalloffSpeed = 0, Duration = 0.1, Angle = 90 },
		HitScreenshake = { Distance = 6, Speed = 300, FalloffSpeed = 0, Duration = 0.1, Angle = 90 },

		HitSimSlowParameters =
		{
			{ ScreenPreWait = 0.02, Fraction = 0.1, LerpTime = 0 },
			{ ScreenPreWait = 0.02, Fraction = 1.0, LerpTime = 0.07 },
		},

		HitRumbleParameters =
		{
			{ ScreenPreWait = 0.02, RightFraction = 0.2, Duration = 0.15 },
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/VO/ZagreusEmotes/EmoteAttacking" },
				{ Name = "/SFX/Player Sounds/ZagreusSwordOverhead" },
			},
			ImpactSounds =
			{
				Invulnerable = "/SFX/SwordWallHitClank",
				Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
				Bone = "/SFX/MetalBoneSmash",
				Brick = "/SFX/MetalStoneClang",
				Stone = "/SFX/MetalStoneClang",
				Organic = "/SFX/StabSplatterSmall",
				StoneObstacle = "/SFX/SwordWallHitClank",
				BrickObstacle = "/SFX/SwordWallHitClank",
				MetalObstacle = "/SFX/SwordWallHitClank",
				BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
			},
		},

		Upgrades = { },
	}

	OlympusWeaponData.StaffWeapon3 =
	{
		StartingWeapon = false,
		CauseImpactReaction = true,
		CodexWeaponName = "SwordWeapon",

		--ChargeCameraMotion = { ZoomType = "Overshoot", Fraction = 0.96, Duration = 0.3 },
		--FireCameraMotion = { ZoomType = "Ease", Fraction = 1.0, Duration = 0.2 },
		--HitScreenshake = { Distance = 3, Speed = 10000, Duration = 0.08, FalloffSpeed = 30000 },

		--[[FireSimSlowParameters =
		{
			{ ScreenPreWait = 0.04, Fraction = 0.01, LerpTime = 0 },
			{ ScreenPreWait = 0.02, Fraction = 0.1, LerpTime = 0 },
			{ ScreenPreWait = 0.2, Fraction = 1.0, LerpTime = 0.1 },
		},
		]]

		HitSimSlowCooldown = 0.03,
		HitSimSlowParameters =
		{
			{ ScreenPreWait = 0.06, Fraction = 0.1, LerpTime = 0.0 },
			{ ScreenPreWait = 0.05, Fraction = 1.0, LerpTime = 0.07 },

			--{ ScreenPreWait = 0.01, Fraction = 0.01, LerpTime = 0 },
			--{ ScreenPreWait = 0.06, Fraction = 0.3, LerpTime = 0.07 },
			--{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0.07 },
		},

		HitRumbleParameters =
		{
			{ ScreenPreWait = 0.02, LeftFraction = 0.25, Duration = 0.2 },
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/VO/ZagreusEmotes/EmotePowerAttacking_Sword" },
			},
			ChargeSounds =
			{
				{
					Name = "/Leftovers/SFX/AuraCharge" ,
					StoppedBy = { "TriggerRelease" }
				},
			},
			ImpactSounds =
			{
				Invulnerable = "/SFX/SwordWallHitClank",
				Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
				Bone = "/SFX/MetalBoneSmash",
				Brick = "/SFX/MetalStoneClang",
				Stone = "/SFX/MetalStoneClang",
				Organic = "/SFX/StabSplatterSmall",
				StoneObstacle = "/SFX/SwordWallHitClank",
				BrickObstacle = "/SFX/SwordWallHitClank",
				MetalObstacle = "/SFX/SwordWallHitClank",
				BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
			},
		},

		Upgrades = { },
	}
	local OlympusWeaponUpgradeData = ModUtil.Entangled.ModData(WeaponUpgradeData)
	OlympusWeaponUpgradeData.StaffWeapon =
	{
		{
			Costs = { 1, 1, 1, 1, 1, },
			MaxUpgradeLevel = 5,
			UpgradeUnequippedId = "StaffWeapon_Unequipped",
			StartsUnlocked = true,
			RequiredInvestmentTraitName = "StaffBaseUpgradeTrait",
			Image = "Codex_Portrait_Sword"
		},
		{
			Costs = { 1, 2, 3, 4, 5 },
			MaxUpgradeLevel = 5,
			--TraitName = "SwordAmmoWaveTrait"
			TraitName = "SwordCriticalParryTrait",
			EquippedKitAnimation = "WeaponSwordAlt01FloatingIdleOff",
			UnequippedKitAnimation = "WeaponSwordAlt01FloatingIdle",
			BonusUnequippedKitAnimation = "WeaponSwordAlt01FloatingIdleBonus",
			BonusEquippedKitAnimation = "WeaponSwordAlt01FloatingIdleOffBonus",
			Image = "Codex_Portrait_SwordAlt01"
		},
		{
			Costs = { 2, 2, 3, 4, 5 },
			MaxUpgradeLevel = 5,
			TraitName = "DislodgeAmmoTrait",
			EquippedKitAnimation = "WeaponSwordAlt02FloatingIdleOff",
			UnequippedKitAnimation = "WeaponSwordAlt02FloatingIdle",
			BonusUnequippedKitAnimation = "WeaponSwordAlt02FloatingIdleBonus",
			BonusEquippedKitAnimation = "WeaponSwordAlt02FloatingIdleOffBonus",
			Image = "Codex_Portrait_SwordAlt02"
		},
		{
			Costs = { 3, 3, 3, 3, 3 },
			MaxUpgradeLevel = 5,
			GameStateRequirements =
			{
				RequiredTextLines = { "NyxRevealsArthurAspect01" },
			},
			TraitName = "SwordConsecrationTrait",
			EquippedKitAnimation = "WeaponSwordAlt03FloatingIdleOff",
			UnequippedKitAnimation = "WeaponSwordAlt03FloatingIdle",
			BonusUnequippedKitAnimation = "WeaponSwordAlt03FloatingIdleBonus",
			BonusEquippedKitAnimation = "WeaponSwordAlt03FloatingIdleOffBonus",
			Image = "Codex_Portrait_SwordAlt03"
		},
	}
	local OlympusTraitData = ModUtil.Entangled.ModData(TraitData)
	OlympusTraitData.StaffBaseUpgradeTrait =
	{
		Icon = "WeaponEnchantment_Staff01",
		InheritFrom = { "WeaponEnchantmentTrait" },
		CustomTrayText = "StaffBaseUpgradeTrait_Tray",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1,
				MaxMultiplier = 1,
			},
			Rare =
			{
				MinMultiplier = 2,
				MaxMultiplier = 2,
			},
			Epic =
			{
				MinMultiplier = 3,
				MaxMultiplier = 3,
			},
			Heroic =
			{
				MinMultiplier = 4,
				MaxMultiplier = 4,
			},
			Legendary =
			{
				MinMultiplier = 5.0,
				MaxMultiplier = 5.0,
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SwordWeapon", "SwordWeapon2", "SwordWeapon3" },
				WeaponProperty = "ChargeTime",
				BaseValue = 0.97,
				SourceIsMultiplier = true,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon" },
				EffectName = "SwordDisableHeavy",
				EffectProperty = "Duration",
				BaseValue = 0.97,
				SourceIsMultiplier = true,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SwordWeapon" },
				EffectName = "SwordDisableCancelableAndLockTrigger",
				EffectProperty = "Duration",
				BaseValue = 0.97,
				SourceIsMultiplier = true,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				EffectName = "SwordDisableCancelableAndLockTrigger2",
				EffectProperty = "Duration",
				BaseValue = 0.97,
				SourceIsMultiplier = true,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon3" },
				EffectName = "SwordDisable3",
				EffectProperty = "Duration",
				BaseValue = 0.97,
				SourceIsMultiplier = true,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon3" },
				EffectName = "SwordDisableAttackCancelable3",
				EffectProperty = "Duration",
				BaseValue = 0.97,
				SourceIsMultiplier = true,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				UnitProperty = "Speed",
				BaseValue = 1.03,
				ChangeType = "Multiply",
				SourceIsMultiplier = true,
			},
		},
		ExtractEntry =
		{
			BaseValue = 0.97,
			SourceIsMultiplier = true,
		},
		ExtractValues =
		{
			{
				Key = "ExtractEntry",
				DecimalPlaces = 2,
				Format = "NegativePercentDelta",
				ExtractAs = "TooltipSpeed",
			},
		}
	}
end
