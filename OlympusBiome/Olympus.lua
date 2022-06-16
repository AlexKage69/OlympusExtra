-- Separate Gods from Goddess to add more gods

if ModUtil ~= nil then
	ModUtil.Mod.Register("OlympusBiome")
	local OlympusEnemySets = ModUtil.Entangled.ModData(EnemySets)
    OlympusEnemySets.EnemiesBiome5 =
	{
		"ShadeSwordUnit",
		"ShadeSwordUnitElite",
	}
	OlympusEnemySets.EnemiesBiome5Survival =
	{
		"ShadeSpearUnit",
		"ShadeSpearUnitElite",
	}
	OlympusEnemySets.EnemiesBiome5Hard =
	{
		"ChariotElite",
	}
	OlympusEnemySets.EnemiesBiome5Devotion =
	{
		"ShieldRangedElite",
	}
	local OlympusEncounterData = ModUtil.Entangled.ModData(EncounterData)
    OlympusEncounterData.GeneratedOlympus =
	{
		InheritFrom = { "Generated" },
		EnemySet = EnemySets.EnemiesBiome5,
		FastClearThreshold = 25,
		ActiveEnemyCapBase = 2.3,
		ActiveEnemyCapMax = 8,
		ActiveEnemyCapDepthRamp = 0.35,
		DepthDifficultyRamp = 11,
		MaxEliteTypes = 1,

		HardEncounterOverrideValues =
		{
			DepthDifficultyRamp = 12,
			EnemySet = EnemySets.EnemiesBiome5Hard,
			MaxEliteTypes = 5,
		},
	}
    OlympusEncounterData.SurvivalOlympus =
	{
		InheritFrom = { "BaseSurvival", "GeneratedOlympus" },
		EnemySet = EnemySets.EnemiesBiome5Survival,
		RequiredMinBiomeDepth = 6,
		ActiveEnemyCapBase = 6,
		ActiveEnemyCapMax = 6,

		SpawnIntervalMin = 0.5,
		SpawnIntervalMax = 0.8,
		MinWaves = 2,
		MaxWaves = 3,
		MinTypes = 2,
		MaxTypes = 2,
		TypeCountDepthRamp = 0.0,

		TimeLimit = 45,
		AddAtTimeInterval = 12,
		InfiniteSpawns = true,

		SpawnWaves =
		{
		},

		ManualWaveTemplates =
		{
			{
				AddAtTime = 45,
				Spawns = {},
				RequireCompletedIntro = true,
			}
		},

		WaveTemplate =
		{
			AddAtTime = 45,
			MinTypes = 1,
			MaxTypes = 1,
			Spawns = {},
			RequireCompletedIntro = true,
		},
		SpawnThreadName = "SurvivalSpawnThread",
	}
    OlympusEncounterData.TimeChallengeOlympus =
	{
		InheritFrom = { "Challenge", "GeneratedOlympus" },
		BaseDifficulty = 110,
	}    
	OlympusEncounterData.DevotionTestOlympus =
	{
		InheritFrom = { "BaseDevotion", "GeneratedOlympus" },
		EncounterType = "Devotion",
		DelayedStart = true,
		EnemySet = EnemySets.EnemiesBiome5Devotion,
		BaseDifficulty = 160,
	}
	local OlympusGameData = ModUtil.Entangled.ModData(GameData)
	table.insert(OlympusGameData.RunClearMessageData.ClearChallengeSwitches.GameStateRequirements.RequiredEncountersThisRun, "TimeChallengeOlympus")
    
	local OlympusEncounterSets = ModUtil.Entangled.ModData(EncounterSets)
    OlympusEncounterSets.OlympusEncountersDefault =
	{
		"GeneratedOlympus", "GeneratedOlympus", "GeneratedOlympus",
		"GeneratedOlympus", "GeneratedOlympus", "GeneratedOlympus", "SurvivalOlympus",
	}    
	OlympusEncounterSets.OlympusEncountersNoSurvival =
	{
		"GeneratedOlympus"
	}
	local OlympusRoomSetData = ModUtil.Entangled.ModData(RoomSetData)
    OlympusRoomSetData.Styx.D_Boss01.LinkedRoom = "RoomSimple02"
    OlympusRoomSetData.Tartarus.A_Boss01.LinkedRoom = "A_PostBoss01"
    OlympusRoomSetData.Tartarus.A_PostBoss01.NextRoomSet = { "Olympus", }
    OlympusRoomSetData.Olympus =
    {
        BaseOlympus =
        {
            DebugOnly = true,
    
            LegalEncounters = OlympusEncounterSets.OlympusEncountersDefault,
            ChallengeEncounterName = "TimeChallengeOlympus",
            LocationText = "Location_Olympus",
            LocationTextShort = "Location_Olympus_Short",
            ResultText = "RunHistoryScreenResult_Olympus",
            RichPresence = "#RichPresence_Olympus",
            DevotionEncounters = {"DevotionTestOlympus"},
            SecretSpawnChance = 0.15,
            SecretDoorRequirements =
            {
                RequiredTextLines = { "HermesFirstPickUp" },
                -- run rollout preqs
                RequiredFalseTextLinesThisRun = { "HermesFirstPickUp", "SisyphusFirstMeeting", "EurydiceFirstMeeting01_A", "EurydiceFirstMeeting01_B", "EurydiceFirstMeeting01_C", "PatroclusFirstMeeting", "ThanatosFirstAppearance" , "CharonFirstMeeting", "CharonFirstMeeting_Alt", "HermesFirstPickUp", "SisyphusFirstMeeting" },
    
                RequiredMinRoomsSinceSecretDoor = 10,
            },
            ShrinePointDoorCost = 5,
            ShrinePointDoorSpawnChance = 0.15,
            ShrinePointDoorRequirements =
            {
                RequiredScreenViewed = "ShrineUpgrade",
                RequiredMinRoomsSinceShrinePointDoor = 8,
                RequireEncounterCompleted = "EnemyIntroFight01",
                RequiredCosmetics = { "ShrinePointGates", },
            },
            ChallengeSpawnChance = 0.25,
            ChallengeSwitchRequirements =
            {
                RequiredMinBiomeDepth = 7,
                RequiredMinRoomsSinceChallengeSwitch = 7,
            },
            WellShopSpawnChance = 0.30,
            WellShopRequirements =
            {
                RequiredMinBiomeDepth = 4,
                RequiredMinCompletedRuns = 1,
                RequiredMinRoomsSinceWellShop = 3,
            },
            SellTraitShopChance = 0.15,
            SellTraitShopRequirements =
            {
                RequiredMinBiomeDepth = 4,
                RequiredMinCompletedRuns = 1,
                RequiredUpgradeableGodTraits = 3,
                RequiredMinRoomsSinceSellTraitShop = 6,
            },
            FishingPointChance = 0.25,
            FishingPointRequirements =
            {
                RequiredCosmetics = { "FishingUnlockItem" },
                RequiredMinRoomsSinceFishingPoint = 10,
            },
            TrapOptions = EnemySets.TrapsBiome1,
            UsePromptOffsetX = 20,
            UsePromptOffsetY = -100,
            StopSecretMusic = true,
            ShopSecretMusic = "/Music/CharonShopTheme",
            MaxAppearancesThisBiome = 1,
            SoftClamp = 0.75,
            BreakableOptions = { "BreakableIdle1", "BreakableIdle2", "BreakableIdle3" },
            BreakableValueOptions = { MaxHighValueBreakables = 3 },
    
            SwapSounds =
            {
                ["/SFX/Player Sounds/FootstepsHardSurface"] = "/SFX/Player Sounds/FootstepsHardSurface",
                ["/SFX/Player Sounds/FootstepsHardSurfaceRun"] = "/SFX/Player Sounds/FootstepsHardSurfaceRun",
            },
        },
    
        RoomSimple02 =
        {
            InheritFrom = { "BaseOlympus" },
    
            MaxAppearancesThisBiome = 1,
            ForceIfEncounterNotCompleted = "EnemyIntroFight01",
            LegalEncounters = { "EnemyIntroFight01", "GeneratedOlympus", },
            NumExits = 1,
            IneligibleRewards = { "Devotion" },
            
            GameStateRequirements =
            {
                RequiredMaxBiomeDepth = 5,
            },
    
            ForcedRewardStore = "RunProgress",
            ForcedRewards =
            {
                {
                    Name = "Boon",
                    LootName = "ArtemisUpgrade",
                    GameStateRequirements =
                    {
                        RequiredFalseTextLines = { "ArtemisFirstPickUp", },
                    }
                },
            },
    
            ForceCommonLootFirstRun = true,
            ForceLootTableFirstRun = { "ArtemisWeaponTrait", "ArtemisRushTrait", "AthenaRangedTrait" },
            IntroSequenceDuration = 0.8,
            EntranceDirection = "Right",
            ZoomFraction = 1.0,
            CameraZoomWeights =
            {
                [430025] = 0.94,
                [40012] = 1.0,
                [40020] = 1.0,
            },
    
            Ambience = "/Leftovers/Object Ambiences/EvilLairAmbienceMatchSiteE",
    
            FlipHorizontalChance = 0.0,
    
            DistanceTriggers =
            {
                -- Intro
                {
                    TriggerGroup = "GroundEnemies", WithinDistance = 600, RequiredCompletedRuns = 0,
                    TriggerOnceThisRun = true,
                    VoiceLines =
                    {
                        PreLineWait = 0.01,
                        -- I'm leaving. Try and stop me.
                        { Cue = "/VO/ZagreusScratch_0005", PlayOnce = true },
                    },
                },
            },
        },
    
        F_PreBoss01 =
        {
            InheritFrom = { "BaseOlympus" },
    
            LinkedRooms = { "F_Boss01", "F_Boss02", "F_Boss03" },
            ForceAtBiomeDepthMin = 11,
            ForceAtBiomeDepthMax = 11,
    
            GameStateRequirements =
            {
                -- None
            },
    
            Binks =
            {
                "CharonIdleShop_Bink",
                "CharonIdleGreeting_Bink",
            },
    
            LegalEncounters = { "Shop" },
            ForcedFirstReward = "Shop",
            ForcedRewardStore = "RunProgress",
            IneligibleRewards = { "Devotion", "RoomRewardMoneyDrop", },
            NumExits = 1,
    
            DisableRewardMagnetisim = true,
    
            ZoomFraction = 0.85,
    
            EntranceDirection = "LeftRight",
            FlipHorizontalChance = 0.0,
            BlockRunProgressUI = true,
    
            -- MusicActiveStems = { "Bass", "Drums" },
            -- MusicMutedStems = { "Guitar" },
    
            SpawnRewardOnId = 486416,
    
            InspectPoints =
            {
                [370027] =
                {
                    PlayOnce = true,
                    UseText = "UseExamineMisc",
                    InteractTextLineSets =
                    {
                        F_PreBoss_01_FirstInspect =
                        {
                            -- Let's not keep them waiting.
                            EndCue = "/VO/ZagreusField_0931",
                            EndWait = 0.3,
                            { Cue = "/VO/Storyteller_0195",
                                Text = "{#DialogueItalicFormat}Beyond the present chamber lies the last straight line to the gates of Olympus. Not much is separating the young Prince from his relatives." },
                        },
                    },
                },
            },
    
            DistanceTriggers =
            {
                {
                    TriggerObjectType = "WeaponShop", WithinDistance = 1600,
                    VoiceLines =
                    {
                        -- The gods were pleased with all his bravery.
                        -- { Cue = "/VO/Storyteller_0046", PreLineWait = 0.35 },
                    },
                },
            },
    
            ObstacleData =
            {
                [507864] = {
                    OnHitCrowdReaction =
                    {
                        AnimationName = "StatusIconFear",
                        ReactionChance = 0.55,
                        Shake = true,
                        Ids = { 508121, 508118, 508122, 508119, 508123, 508120, },
                        Cooldown = 8.0,
                    },
                },
                [507819] = {
                    OnHitCrowdReaction =
                    {
                        AnimationName = "StatusIconFear",
                        ReactionChance = 0.55,
                        Shake = true,
                        Ids = { 508084, 508083, 508088, 508086, 508085, 508087, },
                        Cooldown = 8.0,
                    },
                },
            },
    
            -- @ make GlobalVoiceLines &&& Check for Hercules.
            ExitVoiceLines =
            {
                PreLineWait = 0.35,
                BreakIfPlayed = true,
                RandomRemaining = true,
                SuccessiveChanceToPlayAll = 0.6,
                RequiredTextLines = { "Fury2FirstAppearance", "Fury3FirstAppearance" },
                RequiredInactiveMetaUpgrade = "BossDifficultyShrineUpgrade",
    
                -- Who's it going to be.
                { Cue = "/VO/ZagreusField_1567" },
                -- Which sister this time.
                { Cue = "/VO/ZagreusField_1568", RequiredPlayed = { "/VO/ZagreusField_1567" } },
                -- One Fury sister, coming up.
                { Cue = "/VO/ZagreusField_1569", RequiredPlayed = { "/VO/ZagreusField_1567" } },
                -- Time to face the Furies.
                { Cue = "/VO/ZagreusField_1570", RequiredPlayed = { "/VO/ZagreusField_1567" } },
                -- I bet Alecto's next.
                { Cue = "/VO/ZagreusField_1571", RequiredPlayed = { "/VO/ZagreusField_1567" } },
                -- I'll guess... Alecto.
                { Cue = "/VO/ZagreusField_1572", RequiredPlayed = { "/VO/ZagreusField_1567" } },
                -- Guessing Alecto.
                { Cue = "/VO/ZagreusField_1573", RequiredPlayed = { "/VO/ZagreusField_1567" } },
                -- I bet it's Meg again.
                { Cue = "/VO/ZagreusField_1574", RequiredPlayed = { "/VO/ZagreusField_1567" } },
                -- Please be Meg?
                { Cue = "/VO/ZagreusField_1575", RequiredPlayed = { "/VO/ZagreusField_1567" } },
                -- Please be Meg.
                { Cue = "/VO/ZagreusField_1576", RequiredPlayed = { "/VO/ZagreusField_1567" } },
                -- I bet Tisipone's up.
                { Cue = "/VO/ZagreusField_1577", RequiredPlayed = { "/VO/ZagreusField_1567" } },
                -- Time for Tisiphone maybe?
                { Cue = "/VO/ZagreusField_1578", RequiredPlayed = { "/VO/ZagreusField_1567" } },
                -- Got a feeling it's Tisiphone this time.
                { Cue = "/VO/ZagreusField_1579", RequiredPlayed = { "/VO/ZagreusField_1567" } },
            },
    
            MusicMutedStems = { "Drums" },
            ReverbValue = 2.0,
        },
    
        F_Boss01 =
        {
            InheritFrom = {"BaseOlympus", "RandomizeTrapTypes"},
            RewardPreviewIcon = "RoomElitePreview4",
            RewardPreviewFx = "RoomRewardAvailableRareSparkles",
            ResultText = "RunHistoryScreenResult_F_Boss01",
            RichPresence = "#RichPresence_ABoss01",
            TrapOptions = EnemySets.TrapsBiome1,
    
            GameStateRequirements =
            {
                -- None
            },
    
            RequiresLinked = true,
            ForceIfUnseenForRuns = 6,
            Milestone = true,
            MilestoneIcon = "BossIcon",
            ResetBinksOnEnter = true,
            ResetBinksOnExit = true,
            LegalEncounters = { "BossHarpy1", },
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
            GenusName = "F_Boss",
    
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
                        SetupBossIds = { 50002 },
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
                        F_Boss_01_Inspect01 =
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
        },

        F_MiniBoss01 =
        {
            InheritFrom = { "BaseOlympus" },
    
            IsMiniBossRoom = true,
            RewardPreviewIcon = "RoomElitePreview2",
            RewardPreviewFx = "RoomRewardAvailableRareSparkles",
            ResultText = "RunHistoryScreenResult_F_MiniBoss01",
            LegalEncounters = { "MiniBossGrenadier" },
    
            MaxCreationsThisRun = 1,
    
            GameStateRequirements =
            {
                RequiredFalseSeenRoomsThisRun = { "F_MiniBoss02", "F_MiniBoss03", "F_MiniBoss04" },
            },
    
            ResetBinksOnEnter = true,
            ResetBinksOnExit = true,
            ForceAtBiomeDepthMin = 5,
            ForceAtBiomeDepthMax = 9,
            NumExits = 1,
            MusicSection = 2,
            MusicActiveStems = { "Guitar", "Bass", "Drums", },
            EndMusicOnCombatOver = 20,
            WellShopSpawnChance = 0.0,
    
            CameraWalls = false,
    
            Ambience = "/Leftovers/Object Ambiences/EvilLairAmbienceMatchSiteE",
    
            MaxAppearancesThisBiome = 1,
            EntranceDirection = "Left",
            ForcedRewardStore = "RunProgress",
            EligibleRewards = { "Boon" },
            BlockTreasureImps = true,
            ZoomFraction = 0.95,
            CameraZoomWeights =
            {
                [50064] = 1.0,
                [40001] = 0.9,
            },
    
            BoonRaritiesOverride = { LegendaryChance = 0.1, EpicChance = 0.25, RareChance = 1.0 },
            SecretSpawnChance = 0.0,
    
            ThreadedEvents =
            {
                { FunctionName = "MiniBossRoomPresentation" },
            },
            UnthreadedEvents =
            {
                {
                    FunctionName = "CheckAssistHint",
                    Args =
                    {
                        Delay = 10.0,
                    }
                },
            },
    
            CombatResolvedVoiceLines =
            {
                RandomRemaining = true,
                BreakIfPlayed = true,
                PreLineWait = 2.0,
                SuccessiveChanceToPlayAll = 0.66,
                ThreadName = "RoomThread",
    
                -- Anyone else...?
                { Cue = "/VO/ZagreusField_0653" },
                -- Had enough?
                { Cue = "/VO/ZagreusField_0654" },
                -- That's what you get.
                { Cue = "/VO/ZagreusField_0655" },
            },
        },
    
        F_MiniBoss02 =
        {
            InheritFrom = { "F_MiniBoss01" },
            
            LegalEncounters = { "MiniBossHeavyRangedSplitter2" },
            ResultText = "RunHistoryScreenResult_F_MiniBoss02",		
    
            GameStateRequirements =
            {
                RequiredFalseSeenRoomsThisRun = { "F_MiniBoss01", "F_MiniBoss03", "F_MiniBoss04" },
                RequiredActiveMetaUpgrade = "MinibossCountShrineUpgrade",
                RequiredSeenEncounter = "BossHarpy1",
            },
    
            ZoomFraction = 0.95,
    
            NumExits = 1,
            EntranceDirection = "Left",
    
            CombatResolvedVoiceLines =
            {
                [1] = GlobalVoiceLines.CrystalMiniBossDefeatedVoiceLines,
            },
        },
    
        F_MiniBoss03 =
        {
            InheritFrom = { "F_MiniBoss01" },
            LegalEncounters = { "MiniBossWretchAssassin" },
            ResultText = "RunHistoryScreenResult_F_MiniBoss03",
            
            GameStateRequirements =
            {
                RequiredFalseSeenRoomsThisRun = { "F_MiniBoss01", "F_MiniBoss02", "F_MiniBoss04" },
                RequiredSeenEncounter = "BossHades",
            },
    
            ZoomFraction = 0.90,
    
            NumExits = 1,
            EntranceDirection = "Right",
    
            CombatResolvedVoiceLines =
            {
                RandomRemaining = true,
                BreakIfPlayed = true,
                PreLineWait = 2.0,
                SuccessiveChanceToPlayAll = 0.66,
                ThreadName = "RoomThread",
    
                -- That'll show you.
                { Cue = "/VO/ZagreusField_3718", RequiredPlayed = { "/VO/ZagreusField_3721" }, },
                -- See you next time, I'm sure?
                { Cue = "/VO/ZagreusField_3719", RequiredPlayed = { "/VO/ZagreusField_3721" }, },
                -- That's what you get.
                { Cue = "/VO/ZagreusField_3720", RequiredPlayed = { "/VO/ZagreusField_3721" }, },
                -- Back to the shadows.
                { Cue = "/VO/ZagreusField_3721" },
                -- Who's laughing now?
                { Cue = "/VO/ZagreusField_3952", RequiredPlayed = { "/VO/ZagreusField_3721" }, },
                -- Stay out of my way next time.
                { Cue = "/VO/ZagreusField_3953", RequiredPlayed = { "/VO/ZagreusField_3721" }, },
                -- Takes care of that.
                { Cue = "/VO/ZagreusField_3954", RequiredPlayed = { "/VO/ZagreusField_3721" }, },
                -- You stab me, I stab you.
                { Cue = "/VO/ZagreusField_3955", RequiredPlayed = { "/VO/ZagreusField_3721" }, },
            },
    
            InspectPoints =
            {
                [555812] =
                {
                    PlayOnce = true,
                    UseText = "UseExamineMisc",
                    RequiredMinCompletedRuns = 1,
                    InteractTextLineSets =
                    {
                        F_MiniBoss03_01_FirstInspect =
                        {
                            EndVoiceLines =
                            {
                                PreLineWait = 0.4,
                                RequiredMinElapsedTime = 3,
                                UsePlayerSource = true,
                                -- Let's do this again sometime!
                                { Cue = "/VO/ZagreusField_3905" },
                            },
                            { Cue = "/VO/Storyteller_0368",
                                Text = "{#DialogueItalicFormat}The most violent wretches of Olympus are sealed away even from other condemned souls; their only visitors, those fool enough to attempt escape." },
                        },
                    },
                },
            },
    
        },
    
        F_MiniBoss04 =
        {
            InheritFrom = { "F_MiniBoss01" },
            LegalEncounters = { "MiniBossHeavyRangedSplitter" },
            ResultText = "RunHistoryScreenResult_F_MiniBoss02",
    
            GameStateRequirements =
            {
                RequiredFalseSeenRoomsThisRun = { "F_MiniBoss01", "F_MiniBoss02", "F_MiniBoss03" },
                RequiredInactiveMetaUpgrade = "MinibossCountShrineUpgrade",
                RequiredSeenEncounter = "BossHarpy1",
            },
    
            ZoomFraction = 0.90,
    
            NumExits = 1,
            EntranceDirection = "Right",
    
            CombatResolvedVoiceLines =
            {
                [1] = GlobalVoiceLines.CrystalMiniBossDefeatedVoiceLines,
            },
    
            InspectPoints =
            {
                [555812] =
                {
                    PlayOnce = true,
                    UseText = "UseExamineMisc",
                    InteractTextLineSets =
                    {
                        F_MiniBoss04_01_FirstInspect =
                        {
                            EndVoiceLines =
                            {
                                PreLineWait = 0.4,
                                RequiredMinElapsedTime = 3,
                                UsePlayerSource = true,
                                -- They basically turn into big crystals.
                                { Cue = "/VO/ZagreusField_3904" },
    
                            },
                            { Cue = "/VO/Storyteller_0367",
                                Text = "{#DialogueItalicFormat}Damned, lost souls with nowhere left to turn congregate in deepest Olympus, where they fuse together with the earth itself into odious forms which defy description." },
                        },
                    },
                },
            },
    
        },
    
        -- small combat arena
        F_Combat01 =
        {
            InheritFrom = { "BaseOlympus", "RandomizeTrapTypes" },
            IneligibleRewards = { "Devotion" },
    
            GameStateRequirements =
            {
                RequiredMaxBiomeDepth = 6,
            },
    
            EntranceDirection = "Right",
            NumExits = 1,
            ZoomFraction = 0.95,
        },
    
        -- medium combat arena
        F_Combat02 =
        {
            InheritFrom = { "BaseOlympus", "RandomizeTrapTypes" },
    
            GameStateRequirements =
            {
                -- None
            },
    
            EntranceDirection = "LeftRight",
            NumExits = 1,
            ZoomFraction = 0.85,
            ZoomFractionSwitch = 0.9,
        },
    
        F_Combat03 =
        {
            InheritFrom = { "BaseOlympus", "RandomizeTrapTypes" },
    
            GameStateRequirements =
            {
                -- None
            },
    
            EntranceDirection = "Right",
            NumExits = 1,
            ZoomFraction = 0.9,
        },
    
        -- barrel + dart + small arena
        F_Combat04 =
        {
            InheritFrom = { "BaseOlympus" },
            LegalEncounters = EncounterSets.OlympusEncountersNoSurvival,
            IneligibleRewards = { "Devotion" },
    
            GameStateRequirements =
            {
                RequiredMaxBiomeDepth = 6,
            },
    
            EntranceDirection = "Right",
            NumExits = 1,
            ZoomFraction = 0.95,
        },
    
        -- guys in the middle
        F_Combat05 =
        {
            InheritFrom = { "BaseOlympus" },
            IneligibleRewards = { "Devotion" },
    
            GameStateRequirements =
            {
                -- None
            },
    
            EntranceDirection = "Right",
            NumExits = 2,
            ZoomFraction = 0.95,
    
            ExitsUnlockedDistanceTriggers =
            {
                {
                    TriggerObjectType = "HeroExit",
                    WithinDistance = 600,
                    GlobalVoiceLines = "ForkingPathVoiceLines",
                },
            },
        },
    
        -- smaller room l-shape cover
        F_Combat06 =
        {
            InheritFrom = { "BaseOlympus" },
            IneligibleRewards = { "Devotion" },
    
            GameStateRequirements =
            {
                RequiredMaxBiomeDepth = 6,
            },
    
            EntranceDirection = "Left",
            NumExits = 2,
            ZoomFraction = 0.95,
        },
    
        -- smaller room with gaps
        F_Combat07 =
        {
            InheritFrom = { "BaseOlympus", "RandomizeTrapTypes" },
    
            GameStateRequirements =
            {
                -- None
            },
    
            EntranceDirection = "Right",
            NumExits = 1,
            ZoomFraction = 0.95,
            RushMaxRangeOverride = 535,
        },
    
        -- Long room with enemies spawning near bombs
        F_Combat09 =
        {
            InheritFrom = { "BaseOlympus", "RandomizeTrapTypes" },
            IneligibleRewards = { "Devotion" },
    
            GameStateRequirements =
            {
                RequiredMaxBiomeDepth = 6,
            },
    
            StartUnthreadedEvents =
            {
                { FunctionName = "ActivatePrePlaced", Args = { FractionMin = 0.5, FractionMax = 1.0, Groups = { "Traps" } } },
            },
            EntranceDirection = "Right",
            NumExits = 1,
            ZoomFraction = 0.95,
        },
    
        -- U Shaped room with combat focused around pillars
        F_Combat10 =
        {
            InheritFrom = { "BaseOlympus", "RandomizeTrapTypes" },
    
            GameStateRequirements =
            {
                -- None
            },
    
            EntranceDirection = "Left",
            NumExits = 2,
            ZoomFraction = 0.9,
    
            Ambience = "/Leftovers/Ambience/MatchSiteIPoolAmbience",
    
            ExitsUnlockedDistanceTriggers =
            {
                {
                    TriggerObjectType = "HeroExit",
                    WithinDistance = 600,
                    GlobalVoiceLines = "ForkingPathVoiceLines",
                },
            },
        },
    
        -- Maze-like room where units can chase you into a corner
        F_Combat11 =
        {
            InheritFrom = { "BaseOlympus", "RandomizeTrapTypes" },
    
            GameStateRequirements =
            {
                RequiredMinBiomeDepth = 7,
            },
    
            EntranceDirection = "Left",
            LegalEncounters = EncounterSets.OlympusEncountersNoSurvival,
            RushMaxRangeOverride = 450,
            NumExits = 2,
            ZoomFraction = 0.9,
        },
    
        -- Arena Pit
        F_Combat12 =
        {
            InheritFrom = { "BaseOlympus", "RandomizeTrapTypes" },
    
            GameStateRequirements =
            {
                RequiredMaxBiomeDepth = 6,
            },
    
            EntranceDirection = "LeftRight",
            NumExits = 2,
            ZoomFraction = 0.9,
    
            ExitsUnlockedDistanceTriggers =
            {
                {
                    TriggerObjectType = "HeroExit",
                    WithinDistance = 600,
                    GlobalVoiceLines = "ForkingPathVoiceLines",
                },
            },
        },
    
        F_Combat13 =
        {
            InheritFrom = { "BaseOlympus", "AllPrePlacedTraps" },
    
            GameStateRequirements =
            {
                -- None
            },
    
            EntranceDirection = "LeftRight",
            NumExits = 1,
            ZoomFraction = 0.85,
            ZoomFractionSwitch = 0.9,
            RushMaxRangeOverride = 525,
    
            RemoteTrapChains =
            {
                [487027] =
                {
                    Chains =
                    {
                        { 410161, 410205, 410325, 410314, },
                    }
                }
            },
        },
    
        F_Combat14 =
        {
            InheritFrom = { "BaseOlympus", "AllPrePlacedTraps" },
    
            GameStateRequirements =
            {
                -- None
            },
    
            EntranceDirection = "Right",
            NumExits = 1,
            ZoomFraction = 0.85,
            ZoomFractionSwitch = 0.9,
            RushMaxRangeOverride = 525,
        },
    
        -- Bridge with attackers on both sides
        F_Combat15 =
        {
            InheritFrom = { "BaseOlympus", "RandomizeTrapTypesAll" },
    
            GameStateRequirements =
            {
                -- None
            },
    
            EntranceDirection = "Left",
            NumExits = 2,
            ZoomFraction = 0.95,
            RushMaxRangeOverride = 525,
    
            ExitsUnlockedDistanceTriggers =
            {
                {
                    TriggerObjectType = "HeroExit",
                    WithinDistance = 600,
                    GlobalVoiceLines = "ForkingPathVoiceLines",
                },
            },
        },
    
        F_Combat16 =
        {
            InheritFrom = { "BaseOlympus", "RandomizeTrapTypes" },
    
            GameStateRequirements =
            {
                -- None
            },
    
            EntranceDirection = "LeftRight",
            NumExits = 2,
            ZoomFraction = 0.9,
    
            ExitsUnlockedDistanceTriggers =
            {
                {
                    TriggerObjectType = "HeroExit",
                    WithinDistance = 600,
                    GlobalVoiceLines = "ForkingPathVoiceLines",
                },
            },
        },
    
        -- bridge with rows of low impassability
        F_Combat17 =
        {
            InheritFrom = { "BaseOlympus" },
    
            GameStateRequirements =
            {
                RequiredMinBiomeDepth = 7,
            },
    
            Ambience = "/Leftovers/Ambience/StillWaterAmbience",
            EntranceDirection = "Right",
            LegalEncounters = EncounterSets.OlympusEncountersNoSurvival,
            NumExits = 2,
            ZoomFraction = 0.95,
    
            ExitsUnlockedDistanceTriggers =
            {
                {
                    TriggerObjectType = "HeroExit",
                    WithinDistance = 600,
                    GlobalVoiceLines = "ForkingPathVoiceLines",
                },
            },
        },
    
        -- west-leaning corridor with dart traps
        F_Combat18 =
        {
            InheritFrom = { "BaseOlympus", "AllPrePlacedTraps" },
            
            GameStateRequirements =
            {
                RequiredMinBiomeDepth = 7,
            },
    
            EntranceDirection = "Right",
            LegalEncounters = EncounterSets.OlympusEncountersNoSurvival,
            NumExits = 1,
            ZoomFraction = 0.9,
        },
    
        -- antechamber w/ pillars & spikewalls
        F_Combat19 =
        {
            InheritFrom = { "BaseOlympus", "AllPrePlacedTraps" },
    
            GameStateRequirements =
            {
                -- None
            },
    
            EntranceDirection = "Right",
            NumExits = 2,
            ZoomFraction = 0.95,
    
            ExitsUnlockedDistanceTriggers =
            {
                {
                    TriggerObjectType = "HeroExit",
                    WithinDistance = 600,
                    GlobalVoiceLines = "ForkingPathVoiceLines",
                },
            },
        },
    
        -- wide chamber with central pillars and surrounding traps
        F_Combat20 =
        {
            InheritFrom = { "BaseOlympus", "RandomizeTrapTypes" },
            
            GameStateRequirements =
            {
                RequiredMinBiomeDepth = 7,
            },
    
            EntranceDirection = "LeftRight",
            NumExits = 2,
            ZoomFraction = 0.9,
    
            ExitsUnlockedDistanceTriggers =
            {
                {
                    TriggerObjectType = "HeroExit",
                    WithinDistance = 600,
                    GlobalVoiceLines = "ForkingPathVoiceLines",
                },
            },
        },
    
        -- apostrophe shape room with pillars and passive spiketraps
        F_Combat21 =
        {
            InheritFrom = { "BaseOlympus", "RandomizeTrapTypesAll" },
    
            GameStateRequirements =
            {
                RequiredMaxBiomeDepth = 6,
            },
    
            EntranceDirection = "LeftRight",
            LegalEncounters = EncounterSets.OlympusEncountersNoSurvival,
            NumExits = 1,
            ZoomFraction = 0.95,
        },
        --[[F_Reprieve01 =
        {
            InheritFrom = { "BaseOlympus" },
            IneligibleRewards = { "Devotion", },
            SuppressRewardSpawnSounds = true,
            
            MaxCreationsThisRun = 1,
            LegalEncounters = { "HealthRestore" },
            EntranceDirection = "LeftRight",
            SecretMusic = "/Music/BlankMusicCue",
            --ZoomFraction = 0.75,
            SpawnRewardOnId = 410000,
            IntroSequenceDuration = 0.02,
            NumExits = 2,
    
            GameStateRequirements =
            {
                RequiredCosmetics = { "OlympusReprieve" },
                RequiredMinCompletedRuns = 0,
                RequiredMinBiomeDepth = 3,
            },
    
            MusicMutedStems = { "Drums" },
            EnterGlobalVoiceLines = "EnteredReprieveRoomVoiceLines",
    
            ZoomFraction = 0.975,
            CameraZoomWeights =
            {
                [482574] = 0.90,
                [482572] = 1.10,
                [482573] = 0.90,
            },
    
            Ambience = "/Leftovers/Ambience/StillWaterAmbience",
    
            InspectPoints =
            {
                [480765] =
                {
                    PlayOnce = true,
                    UseText = "UseExamineMisc",
                    RequiredMinCompletedRuns = 1,
                    InteractTextLineSets =
                    {
                        F_Reprieve_01_FirstInspect =
                        {
                            -- And not a moment too soon.
                            EndCue = "/VO/ZagreusField_0532",
                            EndWait = 0.4,
                            { Cue = "/VO/Storyteller_0158",
                                Text = "{#DialogueItalicFormat}A place of calm and respite, whilst perhaps unimaginable in the Underworld, occasionally is to be found, in fact." },
                        },
                    },
                },
            },
        },]]
    
        F_Shop01 =
        {
            InheritFrom = { "BaseOlympus" },
            MaxCreationsThisRun = 1,
            ForceAtBiomeDepthMin = 4,
            ForceAtBiomeDepthMax = 7,
            LegalEncounters = { "Shop" },
            ForcedReward = "Shop",
            NoReroll = true,
    
            GameStateRequirements =
            {
                RequiredMinExits = 2,
                RequiredMaxBiomeDepth = 9,
            },
    
            Binks =
            {
                "CharonIdleShop_Bink",
                "CharonIdleGreeting_Bink",
            },
    
            SpawnRewardOnId = 486418,
    
            NumExits = 1,
            ZoomFraction = 0.85,
    
            EntranceDirection = "Right",
    
            Ambience = "/Leftovers/Object Ambiences/ShipwreckAmbience",
            SpawnRewardGlobalVoiceLines = "FoundShopVoiceLines",
    
            InspectPoints =
            {
                [390000] =
                {
                    PlayOnce = true,
                    UseText = "UseExamineMisc",
                    InteractTextLineSets =
                    {
                        CharonFirstInspect =
                        {
                            -- That would be me.
                            EndCue = "/VO/ZagreusField_0674",
                            EndWait = 0.3,
                            { Cue = "/VO/Storyteller_0116",
                                Text = "{#DialogueItalicFormat}The infernal wares of the stygian boatman, Charon, lie sprawled about, available for sale to whomever would be willing to quench the boatman's great thirst for riches." },
                        },
                    },
                },
                [515864] =
                {
                    PlayOnce = true,
                    UseText = "UseExamineMisc",
                    RequiredMinRunsCleared = 1,
                    InteractTextLineSets =
                    {
                        CharonFirstInspect =
                        {
                            -- Too bad I can't just take the ferry to the surface.
                            EndCue = "/VO/ZagreusField_1473",
                            EndWait = 0.3,
                            { Cue = "/VO/Storyteller_0221",
                                Text = "{#DialogueItalicFormat}The River Styx flows infamously through the Underworld, offering the boatman Charon expeditious travel from the realm of mortals to the lowest depths, where many of their shades reside forever." },
                        },
                    },
                },
            },
    
            DistanceTriggers =
            {
                {
                    TriggerObjectType = "NPC_Charon_01", WithinDistance = 1600,
                    VoiceLines =
                    {
                        -- The gods were pleased with all his bravery.
                        -- { Cue = "/VO/Storyteller_0046", PreLineWait = 0.35 },
                    },
                },
            },
    
            -- MusicMutedStems = { "Drums" },
            ReverbValue = 2.0,
    
            ThreadedEvents =
            {
                {
                    FunctionName = "PatrolPath",
                    Args =
                    {
                        GroupName = "GhostShoppers",
                        --NewGroupName= "Active3DGhosts",
                        --RemoveFromGroup = true,
                        --AddToGroup = true,
                        MaxPatrols = 40,
                        SendPatrolInterval = 0.0,
                        SpeedMin = 30,
                        SpeedMax = 60,
                        Loop = true,
                        Path =
                        {
                            { Id = 508114, OffsetRadius = 30 },
                            { Id = 508095, OffsetRadius = 50 },
                            { Id = 508096, OffsetRadius = 50 },
                            {
                                Branch =
                                {
                                    {
                                        { Id = 508097, OffsetRadius = 10 },
                                        { Id = 508098, OffsetRadius = 10, AngleTowardIdOnStop = 480237, PostArriveWait = 7 },
                                        { Id = 508097, OffsetRadius = 10 },
                                    },
                                    {
                                        { Id = 508099, OffsetRadius = 10 },
                                        { Id = 508100, OffsetRadius = 10, AngleTowardIdOnStop = 50074, PostArriveWait = 7 },
                                        { Id = 508099, OffsetRadius = 10 },
                                    },
                                    {
                                        { Id = 508101, OffsetRadius = 10 },
                                        { Id = 508102, OffsetRadius = 10, AngleTowardIdOnStop = 480238, PostArriveWait = 7 },
                                        { Id = 508101, OffsetRadius = 10 },
                                    },
                                    {
                                        { Id = 508105, OffsetRadius = 10, AngleTowardIdOnStop = 508106, PostArriveWait = 5, EmoteOnEnd = "Fear", MinUseInterval = 10 },
                                    },
                                },
                            },
                        },
                    },
                },
    
                {
                    FunctionName = "PatrolPath",
                    Args =
                    {
                        GroupName = "GhostBoaters",
                        --NewGroupName= "Active3DGhosts",
                        --RemoveFromGroup = true,
                        --AddToGroup = true,
                        MaxPatrols = 5,
                        SendPatrolInterval = 6,
                        SpeedMin = 40,
                        SpeedMax = 60,
                        Loop = true,
                        Path =
                        {
                            { Id = 508103, OffsetRadius = 50 },
                            { Id = 508104, OffsetRadius = 50, PostArriveWait = 10 },
                            { Id = 508103, OffsetRadius = 50 },
                            { Id = 508096, OffsetRadius = 50 },
                            { Id = 508113, OffsetRadius = 50, PostArriveWait = 10 },
                        },
                    },
                },
            },
        },
    
        -- NPC room layout 1
        F_Story01 =
        {
            InheritFrom = { "BaseOlympus" },
            ForcedReward = "Story",
            NoReroll = true,
            MaxCreationsThisRun = 1,
            RichPresence = "#RichPresence_AStory01",
    
            GameStateRequirements =
            {
                RequiredMinBiomeDepth = 4,
                RequiredMinCompletedRuns = 1,
                RequiredSeenRooms = { "F_Boss01" },
            },
    
            SecretMusic = "/Music/MusicExploration1_MC",
            ZoomFraction = 0.85,
            TimerBlock = "StoryRoom",
    
            FlipHorizontalChance = 0.0,
            LegalEncounters = { "Story_Sisyphus_01" },
            EntranceDirection = "LeftRight",
            NumExits = 1,
            InspectPoints =
            {
                [506297] =
                {
                    PlayOnce = true,
                    UseText = "UseExamineMisc",
                    RequiredTextLines = { "SisyphusFirstMeeting" },
                    InteractTextLineSets =
                    {
                        Inspect_F_Story_01_01 =
                        {
                            -- Lots of wretchedness to go around, I guess.
                            EndCue = "/VO/ZagreusField_0935",
                            EndWait = 0.3,
                            { Cue = "/VO/Storyteller_0199",
                                Text = "{#DialogueItalicFormat}Within the depths of T reside the most wretched of all the shades who linger for eternity within the Underworld, whose Lord and Master is especially unkind to those attempting to cheat death." },
                        },
                    },
                },
            },
    
            ThreadedEvents =
            {
                {
                    FunctionName = "PatrolPath",
                    Args =
                    {
                        GroupName = "GhostPatrols",
                        NewGroupName= "ActiveGhosts",
                        RemoveFromGroup = true,
                        AddToGroup = true,
                        MaxPatrols = 10,
                        SendPatrolInterval = 1.5,
                        SpeedMin = 20,
                        SpeedMax = 70,
                        Path =
                        {
                            --{ Id = 486417, OffsetRadius = 280 },
                            {
                                Branch =
                                {
                                    {
                                        { Id = 486418, OffsetRadius = 10, PostArriveWait = 5, EmoteOnEnd = "Fear", MinUseInterval = 10 },
                                    },
                                    {
                                        { Id = 486427, OffsetRadius = 50 },
                                        {
                                            Branch =
                                            {
                                                {
                                                    { Id = 486419, OffsetRadius = 10, AngleTowardIdOnStop = 370001, MinUseInterval = 7.1, PostArriveWait = 7.0, EmoteOnEnd = "OhBoy" },
                                                },
                                                {
                                                    { Id = 486420, OffsetRadius = 10, AngleTowardIdOnStop = 370001, MinUseInterval = 7.1, PostArriveWait = 7.0, EmoteOnEnd = "OhBoy" },
                                                },
                                                {
                                                    { Id = 486421, OffsetRadius = 10, AngleTowardIdOnStop = 486068, MinUseInterval = 7.1, PostArriveWait = 7.0, EmoteOnEnd = "Smile" },
                                                },
                                                {
                                                    { Id = 486422, OffsetRadius = 10, AngleTowardIdOnStop = 486068, MinUseInterval = 7.1, PostArriveWait = 7.0, EmoteOnEnd = "Smile" },
                                                },
                                            },
                                        },
                                    },
                                    {
                                        { Id = 486423, OffsetRadius = 20, MinUseInterval = 10, },
                                        { Id = 486424, OffsetRadius = 20, PostArriveWait = 10 },
                                    },
                                    {
                                        { Id = 486429, OffsetRadius = 10, MinUseInterval = 3.1, },
                                        { Id = 486430, OffsetRadius = 10, MinUseInterval = 10.1, PostArriveWait = 10.0, EmoteOnEnd = "OhBoy" },
                                    },
                                },
                            },
                        },
                    },
                },
            },
        },
    }    
    OverwriteTableKeys( RoomData, RoomSetData.Olympus )
    OverwriteTableKeys( RoomData, RoomSetData.Styx )
    OverwriteTableKeys( RoomData, RoomSetData.Tartarus )
    -- TESTING
	ModUtil.Path.Wrap( "StartRoom",
        function(baseFunc, currentRun, currentRoom)		
            ModUtil.Hades.PrintStackChunks(ModUtil.ToString(currentRoom.Name)) 
            baseFunc(currentRun, currentRoom)
        end
    )
	ModUtil.Path.Wrap( "LoadMap",
        function(baseFunc, argTable)	
            baseFunc(argTable)	
            wait( 2.0 )
            ModUtil.Hades.PrintStackChunks(ModUtil.ToString("After...")) 
            ModUtil.Hades.PrintStackChunks(ModUtil.ToString.Deep(argTable)) 
        end
    )
end