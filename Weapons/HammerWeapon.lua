
	local OlympusCodexOrdering = ModUtil.Entangled.ModData(CodexOrdering)
	local OlympusCodex = ModUtil.Entangled.ModData(Codex)
	table.insert(OlympusCodexOrdering.Weapons.Order, "HammerWeapon")
    OlympusCodex.Weapons.Entries["HammerWeapon"] = {
        Entries =
        {
            {
                UnlockThreshold = 1,
                Text = "CodexData_SwordWeapon_01",
            },
            {
                UnlockThreshold = 100,
                Text = "CodexData_SwordWeapon_02",
            },
            {
                UnlockThreshold = 250,
                Text = "CodexData_SwordWeapon_03",
            },
            {
                UnlockThreshold = 500,
                Text = "CodexData_SwordWeapon_04",
            },
        },
        Image = "Codex_Portrait_Sword",
    }

	local OlympusWeaponSets = ModUtil.Entangled.ModData(WeaponSets)
    table.insert(OlympusWeaponSets.HeroMeleeWeapons, 7, "HammerWeapon")

	local OlympusWeaponData = ModUtil.Entangled.ModData(WeaponData)
    

    OlympusWeaponData.HammerWeapon =
	{
		InheritFrom = { "BaseUnlockableWeapon", },
		EquippedKitAnimation = "WeaponHammerFloatingIdleOff",
		UnequippedKitAnimation = "WeaponHammerFloatingIdle",
		BonusUnequippedKitAnimation = "WeaponHammerFloatingIdleBonus",
		BonusEquippedKitAnimation = "WeaponHammerFloatingIdleOffBonus",
		FirstTimeEquipAnimation = "ZagreusSwordAttack1",
		FirstTimeEquipSound = "/SFX/Enemy Sounds/Minotaur/HugeAxeSwing",
		UseText = "UseWeaponKit",
		UpgradeChoiceText = "UpgradeChoiceMenu_Melee",
		ShortName = "HammerWeapon_Short",
		DashWeapon = "SwordWeaponDash",
		ExpireDashWeaponOnDash = true,
		SecondaryWeapon = "HammerSwirl",
		PostWeaponUpgradeScreenAnimation = "ZagreusSwordAttack2_ReturnToIdle_Loop",

		CompleteObjectivesOnFire = { "HammerWeapon", "HammerWeaponThor" },

		--[[KitInteractFunctionName = "WeaponKitSpecialInteractPresentation",
		KitInteractSpecialUnlockSound = "/Leftovers/Menu Sounds/EmoteAscendedArthurChoir",
		KitInteractGameStateRequirements =
		{
			RequiredTextLines = { "NyxRevealsArthurAspect01" },
			RequiredFalsePlayed = { "/VO/ZagreusHome_2047", },
		},]]

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

					-- Malleus, Hammer of the Underworld; I need your strength.
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

					-- Hammer time...
					{ Cue = "/VO/ZagreusField_1262" },
					-- Come, Malleus.
					{ Cue = "/VO/ZagreusField_1263" },
					-- Malleus smash.
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
    OlympusWeaponData.HammerSwirl =
	{
		StartingWeapon = false,
		CodexWeaponName = "HammerWeapon",

		CauseImpactReaction = true,
		ImpactReactionHitsOverride = 2,

		SkipAttackNotReadySounds = true,

		FireScreenshake = { Distance = 4, Speed = 300, FalloffSpeed = 4000, Duration = 0.25, Angle = 0 },
		ChargeCameraMotion = { ZoomType = "Ease", Fraction = 1.05, Duration = 0.04, HoldDuration = 0.4, RestoreDefaultDuration = 0.8 },

		FireSimSlowParameters =
		{
			--{ ScreenPreWait = 0.0, Fraction = 0.01, LerpTime = 0 },
			--{ ScreenPreWait = 0.04, Fraction = 0.1, LerpTime = 0.07 },
			--{ ScreenPreWait = 0.14, Fraction = 1.0, LerpTime = 0.1 },
		},

		FireRumbleParameters =
		{
			{ ScreenPreWait = 0.08, Fraction = 0.2, Duration = 0.22 },
		},

		Sounds =
		{
			ChargeSounds =
			{
				{ Name = "/VO/ZagreusEmotes/EmoteCharging_Bow" },
				{ Name = "/SFX/Player Sounds/ZagreusSwordSwipe" },
			},
			FireSounds =
			{
				{ Name = "/VO/ZagreusEmotes/EmoteParry_Sword" },
			},
			ImpactSounds =
			{
				Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
				Bone = "/SFX/ArrowMetalBoneSmash",
				Brick = "/SFX/ArrowMetalStoneClang",
				Stone = "/SFX/ArrowMetalStoneClang",
				Organic = "/SFX/ArrowImpactSplatter",
				StoneObstacle = "/SFX/SwordWallHitClankSmall",
				BrickObstacle = "/SFX/SwordWallHitClankSmall",
				MetalObstacle = "/SFX/SwordWallHitClankSmall",
				BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
			},
		},

		Binks =
		{
			"ZagreusSwordParry_Bink",
		},

		Upgrades = { },
	}