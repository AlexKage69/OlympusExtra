local OlympusUnitSetData = ModUtil.Entangled.ModData(UnitSetData)
local OlympusObstacleData = ModUtil.Entangled.ModData(ObstacleData)
local OlympusDeathLoopData = ModUtil.Entangled.ModData(DeathLoopData)
local OlympusRoomSetData = ModUtil.Entangled.ModData(RoomSetData)
local OlympusEncounterSets = ModUtil.Entangled.ModData(EncounterSets)
local OlympusGameData = ModUtil.Entangled.ModData(GameData)
local OlympusGiftData = ModUtil.Entangled.ModData(GiftData)
table.insert(OlympusGameData.ConversationOrder,1,"NPC_Moros_01")
local OlympusColor = ModUtil.Entangled.ModData(Color)
OlympusColor.MorosVoice = { 93,19,52,255 }
-- Makaria, Id = 370025, 370024, 370002
-- 3DGhostAltIdle for the Hypnos discussion
local OlympusEnemyData = ModUtil.Entangled.ModData(EnemyData)
OlympusEnemyData.NPC_Moros_01 =
{
	InheritFrom = { "NPC_Neutral", "NPC_Giftable" },
	CanReceiveGift = true,
	Name = "NPC_Moros_01",
	UseText = "UseTalkToChildGhost",
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
		RequiredFalseCompletedRuns = 5,
		RequiredTextLines = { "AthenaFirstPickUp" },
		--RequiredFalseTextLinesLastRun = {  },
		--RequiredFalseTextLinesThisRun = GameData.NyxWithChaosTextLines,
		RequiredFalseFlags = { "InFlashback" },
	},

	InteractTextLineSets =
	{
		MorosFirstMeeting =
		{
			Name = "MorosFirstMeeting",
			PlayOnce = false,
			UseableOffSource = true,
			RequiredFalseFlags = { "InFlashback", },
			--RequiredFalseTextLines = { "NyxFirstMeeting_B" },
			--RequiredMaxCompletedRuns = 9,
			EndVoiceLines =
			{
				{
					PreLineWait = 0.35,
					UsePlayerSource = true,
					RequiredMinElapsedTime = 3,
					-- Yes. We are.
					{ Cue = "/VO/ZagreusHome_3389" },
				},
				{
					PreLineWait = 0.5,
					ObjectType = "NPC_Nyx_01",
					PreLineAnim = "NyxIdleGreeting",
					-- Then, go.
					{ Cue = "/VO/Nyx_0384" },
				},
			},
			{ Cue = "/VO/Nyx_0382",
				Text = "Do not despair, child. Such setbacks are inevitable, and may be overcome with effort, and with time. You made contact with the goddess Athena. She shall be true to her word." },
			{ Cue = "/VO/ZagreusHome_3388", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "I believe it, Nyx. I'm grateful that you put us into contact. I know you took a considerable risk in reaching out." },
			{ Cue = "/VO/Nyx_0383",
				Text = "The risk is not to me. I expected the Olympians would involve themselves in this, eventually. Reveal to them no more than they already know. Are we understood?" },
		},
	},

	RepeatableTextLineSets =
	{
		MorosChat01 =
		{
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Nyx",
			{ Cue = "/VO/Nyx_0003",
				Text = "Darkness guide you, child." },
		},
	},

	GiftTextLineSets =
	{
		NyxGift01 =
			{
				Name = "NyxGift01",
				PlayOnce = true,
				{ Cue = "/VO/ZagreusHome_0118", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
					Text = "{#DialogueItalicFormat}Erm{#PreviousFormat}, Nyx? You've done so much for me, I.. thought you might like this." },
				{ Cue = "/VO/Nyx_0445",
					PreLineAnim = "NyxIdleGreeting",
					Text = "You know your father does not like it when Nectar is doled out on the premises, dear child. However, I am not he... and I wished, regardless, to provide to you a token of my affection." },
			},
			NyxGift02 =
			{
				Name = "NyxGift02",
				PlayOnce = true,
				RequiredTextLines = { "NyxGift01" },
				{ Cue = "/VO/Nyx_0045",
					PreLineAnim = "NyxIdleGreeting",
					Text = "How can I possibly accept such generosity, my child? Surely others whom you know are more deserving of such offerings." },
				{ Cue = "/VO/ZagreusHome_0196", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					Text = "Nonsense, Nyx. I want you to have it. You've always cared for me. I can't ever repay you for that." },
			},
			NyxGift03 =
			{
				Name = "NyxGift03",
				PlayOnce = true,
				RequiredTextLines = { "NyxGift02" },
				{ Cue = "/VO/Nyx_0046", Portrait = "Portrait_Nyx_Averted_01",
					PreLineAnim = "NyxIdleGreeting",
					Text = "Your kindness toward me is unnecessary, child. You know I have no expectation of such gifts, from you or anyone." },
				{ Cue = "/VO/ZagreusHome_0197", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					Text = "I think of you always, Nyx. You raised me as your own, and I am grateful for it." },
			},
			NyxGift04 =
			{
				Name = "NyxGift04",
				PlayOnce = true,
				RequiredTextLines = { "NyxGift03" },
				{ Cue = "/VO/Nyx_0047",
					PreLineAnim = "NyxIdleGreeting",
					Text = "You honor me, my child; although I dread that I am not deserving of such generosity. There is no need to flatter me like this." },
				{ Cue = "/VO/ZagreusHome_0198", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Be that as it may, Nyx! I would still like for you to have it, with my compliments." },
			},
			NyxGift05 =
			{
				Name = "NyxGift05",
				PlayOnce = true,
				RequiredTextLines = { "NyxGift04" },
				EndVoiceLines =
				{
					PreLineWait = 0.35,
					ObjectType = "NPC_Nyx_01",
					-- I am grateful.
					{ Cue = "/VO/Nyx_0238" },
				},
				{ Cue = "/VO/Nyx_0048",
					PreLineAnim = "NyxIdleGreeting",
					Text = "No gift which you could bring me can exceed the value of our kinship, child. Though, it moves me to receive this offering." },
				{ Cue = "/VO/ZagreusHome_3509", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
					Text = "It's nothing, Nyx, really. I know you've always believed in me, and it's not something I ever take for granted." },
			},
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
					RequiredFalseFlags = { "InFlashback", },
				},
				Args =
				{
					Types =
					{
						"NPC_Moros_01",
					},
					ActivationCapMin = 1,
					ActivationCapMax = 1,
					SkipPresentation = true,
				},
			})
OlympusDeathLoopData.DeathArea.ObstacleData[370026] = {
	Name = "NPC_Moros_01",
	DistanceTriggers =
	{
		{
			WithinDistance = 600,
			VoiceLines =
			{
				{
					PlayOnceFromTableThisRun = true,
					RandomRemaining = true,
					UsePlayerSource = true,
					RequiredTextLines = { "Ending01" },
					Cooldowns =
					{
						{ Name = "ZagreusGardenSpeech", Time = 20 },
					},
					-- The garden's always open now...
					{ Cue = "/VO/ZagreusHome_3700", PlayOnce = true, },
					-- Should check the garden.
					{ Cue = "/VO/ZagreusHome_3700", RequiredAnyQueuedTextLines = GameData.GardenTextLines, ChanceToPlayAgain = 0.66 },
				},
			},
		},
	}
}
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
OlympusGiftData.NPC_Moros_01 =
	{
		InheritFrom = {"DefaultGiftData"},
		Name = "NPC_Moros_01",
		MaxedIcon = "Keepsake_Achilles_Max",
		MaxedSticker = "Keepsake_AchillesSticker_Max",
		MaxedRequirement = { RequiredTextLines = { "Test2" }, },
		Locked = 4,
		Maximum = 5,
		[1] = { },
		[4] = { RequiredResource = "SuperGiftPoints" },
		UnlockGameStateRequirements = { RequiredTextLines = { "Test1" } }
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
ModUtil.Path.Wrap( "CanReceiveGift", 
function(baseFunc, npcData)		
	if npcData ~= nil then
		if GetGenusName( npcData ) == "NPC_Moros_01" then
			ModUtil.Hades.PrintStackChunks(ModUtil.ToString(GetGenusName( npcData ))) 		
			local textLineSets = npcData.InteractTextLineSets or {}
			local repeatableLineSets = npcData.RepeatableTextLineSets or {}
			--local name = GetGenusName( npcData )
			textLineSets = CombineTables( textLineSets, repeatableLineSets )
			if GameState.Flags.InFlashback then
				ModUtil.Hades.PrintStackChunks(ModUtil.ToString("In Flashback")) 	
			end
			for k, textLineSet in pairs( textLineSets ) do
				ModUtil.Hades.PrintStackChunks(ModUtil.ToString(textLineSet.Name)) 	
				if CurrentRun.TextLinesRecord[textLineSet.Name] and textLineSet.GiftableOffSource then
					ModUtil.Hades.PrintStackChunks(ModUtil.ToString("return false")) 	
				end
			end				
		end
	end
	return baseFunc(npcData)
end
)
ModUtil.Path.Wrap( "AttemptGift", 
	function(baseFunc, CurrentRun, target)		
		baseFunc(CurrentRun, target)
		if target ~= nil then
			ModUtil.Hades.PrintStackChunks(ModUtil.ToString(GetGenusName( target ))) 		
			ModUtil.Hades.PrintStackChunks(ModUtil.ToString(CanReceiveGift( target )))
			
		end
	end
)
ModUtil.Path.Wrap( "BeginOpeningCodex", 
	function(baseFunc)		
		if (not CanOpenCodex()) and IsSuperValid() then
			BuildSuperMeter(CurrentRun, 50)
		end
		--ForceNextRoomFunc("A_Makaria01")
		--local challengeBaseIds = GetIdsByType({ Name = "NPC_Makaria_01" })
		--GameState.Gift["NPC_Moros_01"] = nil
		--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(GameState.Gift["NPC_Moros_01"])) 
		baseFunc()
	end
)
--OverwriteTableKeys( EnemyData, OlympusUnitSetData.NPCs )
