local OlympusUnitSetData = ModUtil.Entangled.ModData(UnitSetData)
local OlympusObstacleData = ModUtil.Entangled.ModData(ObstacleData)
local OlympusDeathLoopData = ModUtil.Entangled.ModData(DeathLoopData)
local OlympusRoomSetData = ModUtil.Entangled.ModData(RoomSetData)
local OlympusEncounterSets = ModUtil.Entangled.ModData(EncounterSets)
local OlympusGameData = ModUtil.Entangled.ModData(GameData)
table.insert(OlympusGameData.ConversationOrder,"NPC_Moros_01")
local OlympusColor = ModUtil.Entangled.ModData(Color)
OlympusColor.MorosVoice = { 93,19,52,255 }
-- Makaria, Id = 370025, 370024, 370002
-- 3DGhostAltIdle for the Hypnos discussion
OlympusUnitSetData.NPCs.NPC_Moros_01 =
{
	InheritFrom = { "NPC_Neutral", "NPC_Giftable" },
	Name = "NPC_Moros_01",
	UseText = "UseTalkToMoros",
	Portrait = "Portrait_Moros_Default_01",
	AnimOffsetZ = 220,
	EmoteOffsetX = -20,
	EmoteOffsetY = -160,

	Groups = { "NPCs" },
	SubtitleColor = Color.MorosVoice,

	Binks =
	{
		"CthonicIdle_Bink",
	},

	ActivateRequirements =
	{
		RequiredFalseFlags = { "InFlashback" },
	},

	InteractTextLineSets =
	{
		MorosFirstMeeting =
		{
			TeleportToId = 370006,
			TeleportOffsetX = -330,
			TeleportOffsetY = 270,
			AngleTowardTargetId = 370006,
			InteractDistance = 400,
			--PlayOnce = true,
			UseableOffSource = true,
			--RequiredCompletedRuns = 0,
			--RequiredFalseTextLines = { "MorosFirstMeetingAlt" },
			EndVoiceLines =
			{
				PreLineWait = 0.35,
				RequiredMinElapsedTime = 4,
				UsePlayerSource = true,
				-- Hope to see you again, Moros
				{ Cue = "/VO/ZagreusScratch_0013" },
			},
			{ Cue = "/VO/Moros_0001",
				--Emote = "PortraitEmoteCheerful",
				--PreLineAnim = "HypnosIdleGreeting",
				Text = "Prince Zagreus. Good to see you. Did I miss something it feels like I was gone for a while." },
			{ Cue = "/VO/ZagreusHome_0236", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
				Text = "Actually, it hasn't been too long, Moros. But is everything okay? Where have you've been?" },
			{ Cue = "/VO/Moros_0003",
				--Emote = "PortraitEmoteCheerful",
				--PreLineAnim = "HypnosIdleGreeting",
				Text = "Lord Hades assigned me to the archive. Somehow, death records are getting out of hand lately. We all have a job to do." },
			--OnQueuedFunctionName = "CheckDistanceTriggerThread",
			--OnQueuedFunctionArgs = PresetEventArgs.Sleeping,
			--StatusAnimation = false,
		},
		MorosFirstMeetingAlt = 
		{
			PlayOnce = true,
			UseableOffSource = true,
			RequiredCompletedRuns = 0,
			RequiredFalseTextLines = { "MorosFirstMeeting" },
			EndVoiceLines =
			{
				PreLineWait = 0.35,
				RequiredMinElapsedTime = 4,
				UsePlayerSource = true,
				-- Hope to see you again, Moros
				{ Cue = "/VO/ZagreusScratch_0013" },
			},
			{ Cue = "/VO/Hypnos_0002",
				Emote = "PortraitEmoteCheerful",
				PreLineAnim = "HypnosIdleGreeting",
				Text = "Prince Zagreus. Good to see you. Did I miss something it feels like I was gone for a while." },
			{ Cue = "/VO/ZagreusHome_0236", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
				Text = "Actually, you've been gone for quite a while, Moros. So much happened since I saw you. Where have you've been?" },
			{ Cue = "/VO/Hypnos_0002",
				Emote = "PortraitEmoteCheerful",
				PreLineAnim = "HypnosIdleGreeting",
				Text = "Hades assigned me to the archive. Somehow, death records are getting out of hand lately. We all have a job to do." },
			OnQueuedFunctionName = "CheckDistanceTriggerThread",
			OnQueuedFunctionArgs = PresetEventArgs.Sleeping,
			StatusAnimation = false,
		},
	},

	RepeatableTextLineSets =
	{
		MorosChat01 =
		{
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Hypnos",
			{ Cue = "/VO/Hypnos_0024",
				Emote = "PortraitEmoteCheerful",
				PreLineAnim = "HypnosIdleGreeting",
				Text = "I have reports, Prince. Not now." },
			OnQueuedFunctionName = "CheckDistanceTriggerThread",
			OnQueuedFunctionArgs = PresetEventArgs.SleepingRepeatable,
			StatusAnimation = false,
		},
	},

	GiftTextLineSets =
	{
		
	},

	MissingDistanceTrigger =
	{
		WithinDistance = 375,
		RequiredFalseFlags = { "InFlashback", },
		VoiceLines =
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			UsePlayerSource = true,
			SuccessiveChanceToPlay = 0.1,
			AreIdsNotAlive = { 370025 },
			Cooldowns =
			{
				{ Name = "ZagreusAnyQuipSpeech", Time = 30 },
			},

			-- Hey where's Hypnos?
			{ Cue = "/VO/ZagreusHome_0441" },
			-- Hypnos must be on break.
			{ Cue = "/VO/ZagreusHome_0442" },
			-- What happened to Hypnos?
			{ Cue = "/VO/ZagreusHome_0443" },
		},
	},

	GiftGivenVoiceLines =
	{
		BreakIfPlayed = true,
		PreLineWait = 1.0,
		PlayFromTarget = true,

		-- Cheers, Hypnos!
		{ Cue = "/VO/ZagreusHome_0310" },
	},
}
-- Moros activation requirements
table.insert(OlympusDeathLoopData.DeathArea.StartUnthreadedEvents, 3, {
	FunctionName = "ActivateRotatingNPCs",
	GameStateRequirements =
	{
		RequiredFalseFlags = { "InFlashback" },
	},
	Args =
	{
		Ids = { 370026 },
	},
})
-- Codex Section
local OlympusCodexOrdering = ModUtil.Entangled.ModData(CodexOrdering)
local OlympusCodex = ModUtil.Entangled.ModData(Codex)
table.insert(OlympusCodexOrdering.ChthonicGods.Order, "NPC_Moros_01")
OlympusCodex.ChthonicGods.Entries["NPC_Moros_01"] =
{
	Entries =
	{
		{
			UnlockThreshold = 1,
			Text = "CodexData_Moros_01"
		},
		{
			UnlockThreshold = 5,
			Text = "CodexData_Moros_02"
		},
		{
			UnlockThreshold = 15,
			Text = "CodexData_Moros_03"
		}
	},
	Image = "Codex_Portrait_Moros",
}

--[[ModUtil.Path.Wrap( "ActivateRotatingNPCs", 
	function(baseFunc, eventSource, args)		
		if args.Ids then
			local id = args.Ids
			local name = GetName({ Id = id, CheckInactive = true })
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(name)) 
		end
		baseFunc(eventSource, args)
	end
)]]
-- Fountain Divination
--[[OlympusDeathLoopData.RoomPreRun.Binks = {
	"CharonIdleShop_Bink",
	"CharonIdleGreeting_Bink",
}
OlympusDeathLoopData.RoomPreRun.ObstacleData[557483] =
{
	Template = "HealthFountain",
	Activate = true,
	ActivateIds = { 557483, },
	SetupGameStateRequirements = { },
}
OlympusObstacleData.DivinationGods =
{
	UseText = "UseWell_Locked",
	AvailableUseText = "UseWell_Unlocked",
	ChallengeSwitchUseFunctionName = "UseWellShop",
	CannotUseText = "WellShopBlockedByEncounter",
	BlockDuringChallenge = true,

	UsePromptOffsetX = 40,

	SpawnPropertyChanges =
	{
		{
			ThingProperty = "Tallness",
			ChangeValue = 225,
		},
	},
}]]

ModUtil.Path.Wrap( "BeginOpeningCodex", 
	function(baseFunc)		
		if (not CanOpenCodex()) and IsSuperValid() then
			BuildSuperMeter(CurrentRun, 50)
		end
		--ForceNextRoomFunc("A_Makaria01")
		--local challengeBaseIds = GetIdsByType({ Name = "NPC_Makaria_01" })
		ModUtil.Hades.PrintStackChunks(ModUtil.ToString.TableKeys(CurrentRun.ActivationRecord)) 
		baseFunc()
	end
)
OverwriteTableKeys( EnemyData, UnitSetData.NPCs )
