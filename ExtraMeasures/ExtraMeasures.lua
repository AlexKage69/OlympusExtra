-- OlympusExtraMeasures

if ModUtil ~= nil then

	ModUtil.Mod.Register("ExtraMeasures")
	local mod = "ExtraMeasures"
    local package = "OEMPackage"

	local OlympusEncounterData = ModUtil.Entangled.ModData(EncounterData)
	OlympusEncounterData.BossHarpyOE ={
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
		MoneyDropCapMin = 20,
		MoneyDropCapMax = 20,
		MoneyDropCapDepthRamp = 0,
		FastClearThreshold = 55,

		--WipeEnemiesOnKills = {"Harpy", "Harpy2", "Harpy3"},

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

		--CancelSpawnsOnKill = { "Harpy", "Harpy2", "Harpy3" },
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
	OlympusRoomSetData.Tartarus.A_PreBoss01.LinkedRooms = { "A_Boss04" }

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
			{
				FunctionName = "MultiFuryIntro",
				Args =
				{
					BossId = 50002,
				}
			},
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
	
	OverwriteTableKeys(RoomData, OlympusRoomSetData.Tartarus)

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
