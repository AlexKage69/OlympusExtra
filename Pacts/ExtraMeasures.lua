-- OlympusExtraMeasures

if ModUtil ~= nil then

	ModUtil.Mod.Register("ExtraMeasures")
	local mod = "ExtraMeasures"
    local package = "OEMPackage"
	local OlympusMetaUpgradeData = ModUtil.Entangled.ModData(MetaUpgradeData)
	OlympusMetaUpgradeData.BossDifficultyShrineUpgrade.CostTable = { 1, 2, 3, 4, 2, 2, 2, 2 }

	local OlympusEncounterData = ModUtil.Entangled.ModData(EncounterData)
	OlympusEncounterData.BossHarpyOE = {
		InheritFrom = { "BossEncounter" },
		StartRoomUnthreadedEvents =
		{
			{ FunctionName = "ActivatePrePlaced", Args = { FractionMin = 1.0, FractionMax = 1.0, LegalTypes = { "Harpy" }, IgnoreAI = true, SkipPresentation = true, PreLoadBinks = true } },
			{ FunctionName = "ActivatePrePlaced", Args = { FractionMin = 1.0, FractionMax = 1.0, LegalTypes = { "Harpy2" }, IgnoreAI = true, SkipPresentation = true, PreLoadBinks = true } },
			{ FunctionName = "ActivatePrePlaced", Args = { FractionMin = 1.0, FractionMax = 1.0, LegalTypes = { "Harpy3" }, IgnoreAI = true, SkipPresentation = true, PreLoadBinks = true } },
			--[[{
				FunctionName = "MultiFuryActivations",
				Args =
				{
					BossId = 50002,
					ObstacleIds = { Alecto = 510510, Tisiphone = 510511 }
				}
			},]]
		},
		SpawnIntervalMin = 5,
		SpawnIntervalMax = 7,
		EnemyCountDepthRamp = 0,
		ActiveEnemyCapBase = 4,
		ActiveEnemyCapMax = 7,
		EndMusicOnCombatOver = 20,
		SpawnAggroed = true,
		SkipLastKillPresentation = true,
		SkipIntroEncounterCheck = true,
		HoldKillPresentationForUnitDeaths = {"Harpy", "Harpy2", "Harpy3"}, -- Important

		MoneyDropCapMin = 20,
		MoneyDropCapMax = 20,
		MoneyDropCapDepthRamp = 0,
		FastClearThreshold = 75,

		WipeEnemiesOnKills = {"Harpy", "Harpy2", "Harpy3"}, -- Custom

		SpawnWaves =
		{
			{
				Spawns =
				{
					{
						Name = "LightRanged",
						InfiniteSpawns = true,
					},
					{
						Name = "HeavyMelee",
						InfiniteSpawns = true,
					},
				},
				StartDelay = 15
			},
		},
		CancelSpawnsOnKillAllTypes = { "Harpy", "Harpy2", "Harpy3" },
		--Spawns = { "Harpy", "Harpy2", "Harpy3" },
		SpawnThreadName = "Harpy1SpawnThread",

		PostUnthreadedEvents =
		{
			{
				FunctionName = "GiveRandomConsumablesSource",
				Args =
				{
					Delay = 0.5,
					NotRequiredPickup = true,
					LootOptions =
					{
						{
							Name = "GemDrop",
							SpawnSound = "/SFX/GemDropSFX",
							MinAmount = 1,
							MaxAmount = 1,
							Overrides =
							{
								AddResources =
								{
									Gems = 10,
								},
							}
						},
					},
				},
				GameStateRequirements =
				{
					RequiredCosmetics = { "BossAddGems" },
				},
			},
		},
	}
	local OlympusRoomSetData = ModUtil.Entangled.ModData(RoomSetData)
	OlympusRoomSetData.Tartarus.A_PreBoss01.LinkedRooms = nil
	OlympusRoomSetData.Tartarus.A_PreBoss01.LinkedRoomsByPactLevel =
	{
		[0] = { "A_Boss01", "A_Boss02", "A_Boss03" }, 
		[1] = { "A_Boss01", "A_Boss02", "A_Boss03" }, 
		[2] = { "A_Boss01", "A_Boss02", "A_Boss03" }, 
		[3] = { "A_Boss01", "A_Boss02", "A_Boss03" }, 
		[4] = { "A_Boss01", "A_Boss02", "A_Boss03" },
		[5] = { "A_Boss04" },
		[6] = { "A_Boss04" },
		[7] = { "A_Boss04" },
		[8] = { "A_Boss04" },
	}
	OlympusRoomSetData.Tartarus.A_PreBoss01.ShrineMetaUpgradeName = "BossDifficultyShrineUpgrade"
	OlympusRoomSetData.Asphodel.B_PreBoss01.LinkedRoomByPactLevel =
	{
		[0] = "B_Boss01", [1] = "B_Boss01", [2] = "B_Boss02", [3] = "B_Boss02", [4] = "B_Boss02", [5] = "B_Boss02", [6] = "B_Boss02", [7] = "B_Boss02", [8] = "B_Boss02"
	}

	OlympusRoomSetData.Tartarus.A_Boss04 =
	{
		InheritFrom = {"BaseTartarus", "RandomizeTrapTypes"},
		RewardPreviewIcon = "RoomElitePreview4",
		RewardPreviewFx = "RoomRewardAvailableRareSparkles",
		ResultText = "RunHistoryScreenResult_A_Boss04",
		RichPresence = "#RichPresence_ABoss04",
		TrapOptions = EnemySets.TrapsBiome1,

		GameStateRequirements =
		{
			-- None
		},

		RequiresLinked = true,
		LinkedRoom = "A_PostBoss01",
		ForceIfUnseenForRuns = 6,
		Milestone = true,
		MilestoneIcon = "BossIcon",
		ResetBinksOnEnter = true,
		ResetBinksOnExit = true,
		LegalEncounters = { "BossHarpyOE", },
		FirstClearRewardStore = "SuperMetaProgress",
		ForcedRewardStore = "MetaProgress",
		EligibleRewards = { "RoomRewardMetaPointDrop", "RoomRewardMetaPointDropRunProgress", "SuperLockKeyDrop" },
		NoReroll = true,
		RewardConsumableOverrides =
		{
			ValidRewardNames = { "RoomRewardMetaPointDrop", "RoomRewardMetaPointDropRunProgress", },
			AddResources =
			{
				MetaPoints = 50,
			},
		},
		EntranceDirection = "Right",
		BlockRunProgressUI = true,
		BlockTreasureImps = true,
		ZoomFraction = 0.9,
		NumExits = 1,
		SkipLastKillPresentation = true,
		LogShrineClears = true,
		GenusName = "A_Boss",

		FlipHorizontalChance = 0.0,

		EntranceFunctionName = "RoomEntranceBoss",
		EntranceFunctionArgs = { AngleTowardsIdOnEnd = 50002 },
		IntroSequenceDuration = 2.7,
		BlockCameraReattach = true,

		EnterGlobalVoiceLines = "EnteredFuryChamberVoiceLines",

		UnthreadedEvents =
		{
			{
				FunctionName = "BossIntro",
				Args =
				{
					ProcessTextLinesIds = { 50002 },
					SetupBossIds = { 50002, 520855, 520856 },
					VoiceLines =
					{
						PreLineWait = 0.2,
						BreakIfPlayed = true,
						RandomRemaining = true,
						SuccessiveChanceToPlay = 0.66,
						ObjectType = "Harpy",

						-- Hmm.
						{ Cue = "/VO/MegaeraHome_0061" },
						-- Tsch.
						{ Cue = "/VO/MegaeraHome_0053", RequiredPlayed = { "/VO/MegaeraHome_0061" }, },
						-- So...
						{ Cue = "/VO/MegaeraField_0407", RequiredTextLines = { "MegaeraGift03" }, },
						-- Oh.
						-- { Cue = "/VO/MegaeraHome_0074", RequiredTextLines = { "MegaeraGift02" }, },
						-- Hmph.
						{ Cue = "/VO/MegaeraHome_0057", RequiredTextLines = { "MegaeraGift02" }, },
						-- <Laughter>
						{ Cue = "/VO/MegaeraField_0375", RequiredTextLines = { "MegaeraGift10" }, },
						-- <Laughter>
						-- { Cue = "/VO/MegaeraField_0376", RequiredTextLines = { "MegaeraGift10" }, },
						-- <Laughter>
						-- { Cue = "/VO/MegaeraField_0377", RequiredTextLines = { "MegaeraGift10" }, },
						-- Ready, Alecto.
						{ Cue = "/VO/MegaeraField_0339", RequiredMaxSupportAINames = 1, RequiredSupportAINames = { "Alecto" }, },
						-- Ready, Sister!
						{ Cue = "/VO/MegaeraField_0340", RequiredMaxSupportAINames = 1, RequiredMinActiveMetaUpgradeLevel = { Name = "BossDifficultyShrineUpgrade", Count = 1 }, },
						-- Ready, Tis.
						{ Cue = "/VO/MegaeraField_0354", RequiredMaxSupportAINames = 1, RequiredSupportAINames = { "Tisiphone" }, },
						-- Ready, sisters.
						{ Cue = "/VO/MegaeraField_0359", RequiredSupportAINames = { "Tisiphone", "Alecto" }, },
						-- Ready, sisters?
						{ Cue = "/VO/MegaeraField_0360", RequiredSupportAINames = { "Tisiphone", "Alecto" }, },
						-- Alecto, Tis, you ready?
						{ Cue = "/VO/MegaeraField_0362", RequiredSupportAINames = { "Tisiphone", "Alecto" }, },
						-- Erinyes, ready.
						{ Cue = "/VO/MegaeraField_0363", RequiredSupportAINames = { "Tisiphone", "Alecto" }, },
					},
				},
			},
			--[[{
				FunctionName = "MultiFuryIntro",
				Args =
				{
					BossId = 50002,
				}
			},]]
			{
				FunctionName = "CheckAssistHint",
				Args =
				{
					Delay = 10.0,
				}
			},
		},

		InspectPoints =
		{
			[510795] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredTextLines = { "Fury2FirstAppearance", "Fury3FirstAppearance" },
				InteractTextLineSets =
				{
					A_Boss_01_Inspect01 =
					{
						EndVoiceLines =
						{
							PreLineWait = 0.4,
							UsePlayerSource = true,
							RequiredMinElapsedTime = 3,
							-- They'll just have to try harder next time.
							{ Cue = "/VO/ZagreusField_4673" },
						},
						{ Cue = "/VO/Storyteller_0411",
							Text = "{#DialogueItalicFormat}The Erinyes; known also as the Furies, they are the trusted sentinels of Lord Hades, charged with torturing the worst of mortalkind... and ridding the Underworld of any fool enough to trespass where they do not belong." },
					},
				},
			},
		},

		RequiredKillsObject = "Harpy",
		RequiredKillsCount = 1,

		Ambience = "/Leftovers/Ambience/CreepyHauntedWindLoop",
		MusicSection = 1,
		MusicActiveStems = { "Bass", "Drums" },
		MusicMutedStems = { "Guitar" },
		MusicStartDelay = 0.25,
	}
	local OlympusWeaponData = ModUtil.Entangled.ModData(WeaponData)
	OlympusWeaponData.SummonMegaeraWhipWhirlOE =
	{
		StartingWeapon = false,
		IgnoreOutgoingDamageModifiers = true,

		FireScreenshake = { Distance = 6, Speed = 400, FalloffSpeed = 1400, Duration = 0.4 },

		HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.12, FalloffSpeed = 3000 },
		HitSimSlowParameters =
		{
			{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
			{ ScreenPreWait = 0.20, Fraction = 1.0, LerpTime = 0 },
		},

		AIData =
		{
			SkipMovement = true,
			SkipStopBeforeAttack = true,
			SkipStopBeforePreAttackEnd = true,

			PreAttackAnimation = "FuryMultiFuryPreview",
			PreAttackDuration = 1.0,
			--FireAnimation = "MegaeraMultiFurySkyDive",

			--[[
			PreAttackVoiceLines =
			{
				{
					RandomRemaining = true,
					ObjectType = "Harpy2",
					RequiresSourceAlive = true,
					PreLineWait = 0.15,
					Cooldowns =
					{
						{ Name = "AlectoSupportSpeech" },
					},

					-- Megaera!
					{ Cue = "/VO/Alecto_0257" },
					-- Megaera...!
					{ Cue = "/VO/Alecto_0258" },
					-- Here, Megaera!
					{ Cue = "/VO/Alecto_0259" },
					-- Here, Megaera...!
					{ Cue = "/VO/Alecto_0260" },
					-- Megaera, now!
					{ Cue = "/VO/Alecto_0261" },
					-- Megaera, now!!
					{ Cue = "/VO/Alecto_0262" },
					-- Now, Megaera!
					{ Cue = "/VO/Alecto_0263" },
					-- Now, Megaera!!
					{ Cue = "/VO/Alecto_0264" },
					-- Megaera, get him!
					{ Cue = "/VO/Alecto_0265" },
					-- Megaera, bleed him!
					{ Cue = "/VO/Alecto_0266" },
				},
				{
					RandomRemaining = true,
					ObjectType = "Harpy3",
					RequiresSourceAlive = true,
					PreLineWait = 0.15,
					Cooldowns =
					{
						{ Name = "TisiphoneSupportSpeech" },
					},

					-- Murder. Murder!
					{ Cue = "/VO/Tisiphone_0089" },
					-- Murder...!
					{ Cue = "/VO/Tisiphone_0089" },
					-- Mmurdererr...
					{ Cue = "/VO/Tisiphone_0089" },
				},
			},
			]]--
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/SFX/Enemy Sounds/Megaera/EmotePowerAttacking" },
			},
		},

		FireScreenshake = { Distance = 6, Speed = 400, FalloffSpeed = 1400, Duration = 0.4 },

		HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.12, FalloffSpeed = 3000 },
		HitSimSlowParameters =
		{
			{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
			{ ScreenPreWait = 0.15, Fraction = 1.0, LerpTime = 0 },
		},

		Upgrades = { },
	}
	OlympusWeaponData.SummonMegaeraHarpyBeamOE =
	{
		StartingWeapon = false,
		IgnoreOutgoingDamageModifiers = true,

		HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.12, FalloffSpeed = 3000 },
		HitSimSlowParameters =
		{
			{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
			{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0 },
		},

		AIData =
		{
			SkipMovement = true,
			SkipStopBeforeAttack = true,
			SkipStopBeforePreAttackEnd = true,

			CreateOwnTargetFromOriginalTarget = true,
			RandomTargetAngle = true,
			TargetOffsetDistance = 350,
			ResetTargetPerTick = true,

			PreAttackAnimation = "FuryMultiFuryPreview",
			PreAttackDuration = 1.0,
			--FireAnimation = "MegaeraMultiFurySkyDive",

			--[[
			PreAttackVoiceLines =
			{
				{
					BreakIfPlayed = true,
					RandomRemaining = true,
					ObjectType = "Harpy2",
					RequiresSourceAlive = true,
					PreLineWait = 0.15,
					Cooldowns =
					{
						{ Name = "AlectoSupportSpeech" },
					},

					-- Megaera!
					{ Cue = "/VO/Alecto_0257" },
					-- Megaera...!
					{ Cue = "/VO/Alecto_0258" },
					-- Here, Megaera!
					{ Cue = "/VO/Alecto_0259" },
					-- Here, Megaera...!
					{ Cue = "/VO/Alecto_0260" },
					-- Megaera, now!
					{ Cue = "/VO/Alecto_0261" },
					-- Megaera, now!!
					{ Cue = "/VO/Alecto_0262" },
					-- Now, Megaera!
					{ Cue = "/VO/Alecto_0263" },
					-- Now, Megaera!!
					{ Cue = "/VO/Alecto_0264" },
					-- Megaera, get him!
					{ Cue = "/VO/Alecto_0265" },
					-- Megaera, bleed him!
					{ Cue = "/VO/Alecto_0266" },
				},
				{
					BreakIfPlayed = true,
					RandomRemaining = true,
					ObjectType = "Harpy3",
					RequiresSourceAlive = true,
					PreLineWait = 0.15,
					Cooldowns =
					{
						{ Name = "TisiphoneSupportSpeech" },
					},

					-- Murder. Murder!
					{ Cue = "/VO/Tisiphone_0089" },
					-- Murder...!
					{ Cue = "/VO/Tisiphone_0089" },
					-- Mmurdererr...
					{ Cue = "/VO/Tisiphone_0089" },
				}
			},
			]]--
		},

		Sounds =
		{
			ChargeSounds =
			{
				{ Name = "/SFX/Enemy Sounds/Megaera/EmoteCharging" },
			},
			FireSounds =
			{
				{ Name = "/SFX/Enemy Sounds/Megaera/MegaeraRapidEnergyBlastFire" },
			},
		},

		Upgrades = { },
	}
	OlympusWeaponData.SummonAlectoWhipShotOE =
	{
		StartingWeapon = false,
		IgnoreOutgoingDamageModifiers = true,

		CauseImpactReaction = true,
		ImpactReactionHitsOverride = 5,

		FireScreenshake = { Distance = 6, Speed = 400, FalloffSpeed = 1400, Duration = 0.4 },

		HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.12, FalloffSpeed = 3000 },
		HitSimSlowParameters =
		{
			{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
			{ ScreenPreWait = 0.02, Fraction = 0.3, LerpTime = 0 },
			{ ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0 },
		},

		AIData =
		{
			SkipMovement = true,
			SkipStopBeforeAttack = true,
			SkipStopBeforePreAttackEnd = true,

			PreAttackAnimation = "Fury2MultiFuryPreview",
			PreAttackDuration = 1.0,
      		--FireAnimation = "AlectoMultiFurySkyDive",

      		--[[
      		PreAttackVoiceLines =
			{
				RandomRemaining = true,
				ObjectType = "Harpy",
				RequiresSourceAlive = true,
				PreLineWait = 0.15,
				Cooldowns =
				{
					{ Name = "MegaeraSupportSpeech" },
				},

				-- Alecto!
				{ Cue = "/VO/MegaeraField_0326" },
				-- Alecto...!
				{ Cue = "/VO/MegaeraField_0327" },
				-- Here, Alecto!
				{ Cue = "/VO/MegaeraField_0328" },
				-- Here, Alecto...!
				{ Cue = "/VO/MegaeraField_0329" },
				-- Alecto, now!
				{ Cue = "/VO/MegaeraField_0330" },
				-- Alecto, now!!
				{ Cue = "/VO/MegaeraField_0331" },
				-- Now, Alecto!
				{ Cue = "/VO/MegaeraField_0332" },
				-- Now, Alecto!!
				{ Cue = "/VO/MegaeraField_0333" },
				-- Alecto, get him!
				{ Cue = "/VO/MegaeraField_0334" },
				-- Alecto, bleed him!
				{ Cue = "/VO/MegaeraField_0335" },
			},
			{
				RandomRemaining = true,
				ObjectType = "Harpy3",
				RequiresSourceAlive = true,
				PreLineWait = 0.15,
				Cooldowns =
				{
					{ Name = "TisiphoneSupportSpeech" },
				},

				-- Murder. Murder!
				{ Cue = "/VO/Tisiphone_0089" },
				-- Murder...!
				{ Cue = "/VO/Tisiphone_0089" },
				-- Mmurdererr...
				{ Cue = "/VO/Tisiphone_0089" },
			},
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 0.35,
				CooldownTime = 60,
				SuccessiveChanceToPlay = 0.5,

				-- I said die!
				{ Cue = "/VO/Alecto_0093" },
				-- Bleed!
				{ Cue = "/VO/Alecto_0091" },
				-- Nraaugh!
				{ Cue = "/VO/Alecto_0080" },
				-- Die!
				{ Cue = "/VO/Alecto_0087" },
				-- Kill!
				{ Cue = "/VO/Alecto_0088" },
			},
			]]--
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/SFX/Enemy Sounds/Alecto/EmotePowerAttacking" },
				{ Name = "/SFX/Player Sounds/ZagreusShieldRush" },
			},
		},
	}
	OlympusWeaponData.SummonAlectoLightningChaseOE =
	{
		StartingWeapon = false,
		IgnoreOutgoingDamageModifiers = true,

		HitSimSlowParameters =
		{
			{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
			{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0 },
		},

		AIData =
		{
			FireTicks = 12,
			FireCooldown = 0.6,
			SkipMovement = true,
			SkipStopBeforeAttack = true,
			SkipStopBeforePreAttackEnd = true,

			PreAttackAnimation = "Fury2MultiFuryPreview",
			PreAttackDuration = 1.0,
			--FireAnimation = "AlectoMultiFurySkyDive",
		},
	}
	OlympusWeaponData.SummonTisiphoneBombingRunOE =
	{
		StartingWeapon = false,
		IgnoreOutgoingDamageModifiers = true,

		HitSimSlowParameters =
		{
			{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
			{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0 },
		},

		AIData =
		{
			PreAttackAnimation = "Fury3MultiFuryPreview",
			PreAttackDuration = 1.0,
			--FireAnimation = "TisiphoneMultiFurySkyDive",

			SkipMovement = true,
			SkipStopBeforeAttack = true,
			SkipStopBeforePreAttackEnd = true,
			FireTicks = 1,
			AttackSlotsPerTickMin = 21,
			AttackSlotsPerTickMax = 21,
			AttackSlotInterval = 0.015,
			UseRandomAngle = true,
			AttackSlots =
			{
				{ AnchorAngleOffset = -550, OffsetDistance = -900, OffsetScaleY = 0.48 },
				{ AnchorAngleOffset = -550, OffsetDistance = -600, OffsetScaleY = 0.48 },
				{ AnchorAngleOffset = -550, OffsetDistance = -300, OffsetScaleY = 0.48 },
				{ AnchorAngleOffset = -550, OffsetDistance = 0, OffsetScaleY = 0.48 },
				{ AnchorAngleOffset = -550, OffsetDistance = 300, OffsetScaleY = 0.48 },
				{ AnchorAngleOffset = -550, OffsetDistance = 600, OffsetScaleY = 0.48 },
				{ AnchorAngleOffset = -550, OffsetDistance = 900, OffsetScaleY = 0.48, PauseDuration = 0.3 },

				{ OffsetDistance = 900, OffsetScaleY = 0.48 },
				{ OffsetDistance = 600, OffsetScaleY = 0.48 },
				{ OffsetDistance = 300, OffsetScaleY = 0.48 },
				{ OffsetDistance = 0, OffsetScaleY = 0.48 },
				{ OffsetDistance = -300, OffsetScaleY = 0.48 },
				{ OffsetDistance = -600, OffsetScaleY = 0.48 },
				{ OffsetDistance = -900, OffsetScaleY = 0.48, PauseDuration = 0.3 },

				{ AnchorAngleOffset = 550, OffsetDistance = -900, OffsetScaleY = 0.48 },
				{ AnchorAngleOffset = 550, OffsetDistance = -600, OffsetScaleY = 0.48 },
				{ AnchorAngleOffset = 550, OffsetDistance = -300, OffsetScaleY = 0.48 },
				{ AnchorAngleOffset = 550, OffsetDistance = 0, OffsetScaleY = 0.48 },
				{ AnchorAngleOffset = 550, OffsetDistance = 300, OffsetScaleY = 0.48 },
				{ AnchorAngleOffset = 550, OffsetDistance = 600, OffsetScaleY = 0.48 },
				{ AnchorAngleOffset = 550, OffsetDistance = 900, OffsetScaleY = 0.48 },
			},
			FireInterval = 3.0,
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/SFX/Player Sounds/ElectricZapSmall" },
			},
		},

		HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.12, FalloffSpeed = 3000 },

		Upgrades = { },
	}
	OlympusWeaponData.SummonTisiphoneFogOE =
	{
		StartingWeapon = false,
		IgnoreOutgoingDamageModifiers = true,
		IgnoreOnHitEffects = true,
		HitSimSlowParameters =
		{
			{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
			{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0 },
		},

		AIData =
		{
			PreAttackAnimation = "Fury3MultiFuryPreview",
			PreAttackDuration = 1.0,
			--FireAnimation = "TisiphoneMultiFurySkyDive",

			SkipMovement = true,
			SkipStopBeforeAttack = true,
			SkipStopBeforePreAttackEnd = true,
			FireTicks = 1,
			AttackSlotsPerTickMin = 21,
			AttackSlotsPerTickMax = 21,
			AttackSlotInterval = 0.04,
			UseRandomAngle = true,
			AttackSlots =
			{
				-- outer circle 2
				{ Angle = 337.5, OffsetDistance = 1350, OffsetScaleY = 0.55 },
				{ Angle = 315, OffsetDistance = 1350, OffsetScaleY = 0.55 },
				{ Angle = 292.5, OffsetDistance = 1350, OffsetScaleY = 0.55 },
				{ Angle = 270, OffsetDistance = 1350, OffsetScaleY = 0.55 },
				{ Angle = 247.5, OffsetDistance = 1350, OffsetScaleY = 0.55 },
				{ Angle = 225, OffsetDistance = 1350, OffsetScaleY = 0.55 },
				{ Angle = 202.5, OffsetDistance = 1350, OffsetScaleY = 0.55 },
				{ Angle = 180, OffsetDistance = 1350, OffsetScaleY = 0.55 },
				{ Angle = 157.5, OffsetDistance = 1800, OffsetScaleY = 0.55 },
				{ Angle = 135, OffsetDistance = 1350, OffsetScaleY = 0.55 },
				{ Angle = 112.5, OffsetDistance = 1350, OffsetScaleY = 0.55 },
				{ Angle = 90, OffsetDistance = 1350, OffsetScaleY = 0.55 },
				{ Angle = 67.5, OffsetDistance = 1350, OffsetScaleY = 0.55 },
				{ Angle = 45, OffsetDistance = 1350, OffsetScaleY = 0.55 },
				{ Angle = 22.5, OffsetDistance = 1350, OffsetScaleY = 0.55 },
				{ Angle = 0, OffsetDistance = 1350, OffsetScaleY = 0.55 },

				-- outer circle
				{ Angle = 337.5, OffsetDistance = 900, OffsetScaleY = 0.55 },
				{ Angle = 292.5, OffsetDistance = 900, OffsetScaleY = 0.55 },
				{ Angle = 247.5, OffsetDistance = 900, OffsetScaleY = 0.55 },
				{ Angle = 202.5, OffsetDistance = 900, OffsetScaleY = 0.55 },
				{ Angle = 157.5, OffsetDistance = 900, OffsetScaleY = 0.55 },
				{ Angle = 112.5, OffsetDistance = 900, OffsetScaleY = 0.55 },
				{ Angle = 67.5, OffsetDistance = 900, OffsetScaleY = 0.55 },
				{ Angle = 22.5, OffsetDistance = 900, OffsetScaleY = 0.55 },

				{ Angle = 270, OffsetDistance = 450, OffsetScaleY = 0.55 },
				{ Angle = 180, OffsetDistance = 450, OffsetScaleY = 0.55 },
				{ Angle = 90, OffsetDistance = 450, OffsetScaleY = 0.55 },
				{ Angle = 0, OffsetDistance = 450, OffsetScaleY = 0.55 },
			},
			FireInterval = 3.0,

		},

		Sounds =
		{
			ChargeSounds =
			{
				{ Name = "/SFX/GasBomb" },
			},
			FireSounds =
			{
				--
			},
		},

		HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.12, FalloffSpeed = 3000 },

		Upgrades = { },
	}
	
	OverwriteTableKeys(RoomData, OlympusRoomSetData.Tartarus)
	OverwriteTableKeys(RoomData, OlympusRoomSetData.Asphodel)

	
	ModUtil.Path.Wrap("StagedAI",
		function(baseFunc, enemy, currentRun)
			local shrineLevel = GetNumMetaUpgrades( enemy.ShrineMetaUpgradeName )
			if shrineLevel >= 5 then
				for k, aiStage in ipairs( enemy.AIStages ) do
					if aiStage.AddSupportAIWeaponOptions ~= nil then
						for supportAIName, addWeaponOptions in pairs(aiStage.AddSupportAIWeaponOptions) do
							if aiStage.AddSupportAIWeaponOptions[supportAIName] ~= nil and 
							(supportAIName == "Tisiphone" or supportAIName == "Alecto" or supportAIName == "Megaera") then
								aiStage.AddSupportAIWeaponOptions[supportAIName][1] = aiStage.AddSupportAIWeaponOptions[supportAIName][1].."OE"
							end
						end
					end
				end
			end
			baseFunc(enemy, currentRun)
		end
	)
	ModUtil.Path.Wrap("SelectHarpySupportAIs",
		function(baseFunc, enemy, currentRun)
			local shrineLevel = GetNumMetaUpgrades( enemy.ShrineMetaUpgradeName )
			if shrineLevel < 5 then
				baseFunc(enemy, currentRun)
			end
		end
	)
	ModUtil.Path.Wrap("BeginOpeningCodex",
		function(baseFunc)
			--PresentationNewSameGodIncrease()
			if (not CanOpenCodex()) and IsSuperValid() then
				BuildSuperMeter(CurrentRun, 50)
			end
			if CurrentRun.CurrentRoom.Encounter ~= nil then
				ModUtil.Hades.PrintStackChunks(ModUtil.ToString(CurrentRun.CurrentRoom.Name))	
				ModUtil.Hades.PrintStackChunks(ModUtil.ToString(CurrentRun.CurrentRoom.Encounter.Name))	
			end
			--CreateAnimation({ Name = "HeraWings", DestinationId = CurrentRun.Hero.ObjectId })
			--ForceNextRoomFunc("B_Shop01")
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString.TableKeys(CurrentRun.Hero.Traits))

			--LoadMap({ Name ="E_Story01", ResetBinks = true, ResetWeaponBinks = true })
			--LoadMap({ Name ="A_Shop01", ResetBinks = true, ResetWeaponBinks = true })
			baseFunc()
		end
	)
end
