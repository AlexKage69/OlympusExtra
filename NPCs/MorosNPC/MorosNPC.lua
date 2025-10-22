local OlympusDeathLoopData = ModUtil.Entangled.ModData(DeathLoopData)
local OlympusGameData = ModUtil.Entangled.ModData(GameData)
local OlympusGiftData = ModUtil.Entangled.ModData(GiftData)
local OlympusGiftOrdering = ModUtil.Entangled.ModData(GiftOrdering)
local OlympusTraitData = ModUtil.Entangled.ModData(TraitData)
local OlympusColor = ModUtil.Entangled.ModData(Color)
--Variables
local DepthDamageMultiplier = 0.0
local DuplicateMultiplier = -0.60
local DuplicateStrongMultiplier = -0.40
local DuplicateVeryStrongMultiplier = -0.20
OlympusColor.MorosVoice = { 93,19,52,255 }
-- 3DGhostAltIdle for the Hypnos discussion
local OlympusEnemyData = ModUtil.Entangled.ModData(EnemyData)
OlympusEnemyData.NPC_Moros_01 =
{
	InheritFrom = { "NPC_Neutral", "NPC_Giftable" },
	Name = "NPC_Moros_01",
	UseText = "UseTalkToMaleGhost",
	Portrait = "Portrait_Moros_Default_01",
	AnimOffsetZ = 205,
	EmoteOffsetX = 50,
	EmoteOffsetY = -200,

	Groups = { "NPCs" },
	SubtitleColor = Color.MorosVoice,

	Binks =
	{
		"CthonicIdle_Bink",
	},

	ActivateRequirements =
	{
		--RequiredCompletedRuns = 5,
		RequiredTextLines = { "AthenaFirstPickUp" },
		--RequiredFalseTextLinesLastRun = {  },
		--RequiredFalseTextLinesThisRun = GameData.NyxWithChaosTextLines,
		--RequiredFalseFlags = { "InFlashback" },
	},
	LocationsById = {
		[370126] = { -- DeathAreaOffice
            LocationX = 4488.060547,
            LocationY = 4552.947266,
		},
		[370026] = { -- DeathArea/ Near Office
			LocationX = 2432.402832,
			LocationY = 3512.359375,
		},
	},
	InteractTextLineSets =
	{
		MorosFirstMeeting =
		{
			Name = "MorosFirstMeeting",
			PlayOnce = true,
			UseableOffSource = true,
			RequiredFalseFlags = { "InFlashback", },
			--InOffice = true,
			EndVoiceLines =
			{
				{
					PreLineWait = 0.35,
					UsePlayerSource = true,
					RequiredMinElapsedTime = 3,
					-- Another time, then.
					{ Cue = "/VO/ZagreusHome_3389" },
				},
			},
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "Is that you, Moros? I haven't seen you much lately. I assumed you were out collecting souls for my father." },
			{ Cue = "/VO/Moros_0001", PostLineThreadedFunctionName = "MorosExit", PostLineFunctionArgs = { AnimationState = "NPCMorosExited", WaitTime = 0.35, },
				Text = "Unfortunately, Prince, that is not the case. Lord Hades assigned me to the archive. Now, if you'll excuse me; there's much to do." },
		},
		MorosGrantMirror =
		{
			Name = "MorosGrantMirror",
			PlayOnce = true,
			Priority = true,
			UseableOffSource = true,
			RequiredFalseFlags = { "InFlashback", },
			RequiredTextLines = { "NyxGrantsRespec", "MorosFirstMeeting" },
			RequiredCosmetics = { "QuestLog", "OfficeDoorUnlockItem" },
			RequiredAccumulatedMetaPoints = 600, 
			RequiredMinNPCInteractions = { NPC_Nyx_01 = 1 , NPC_Moros_01 = 1},
			--InOffice = true,
			EndVoiceLines =
			{
				{
					PreLineWait = 0.35,
					UsePlayerSource = true,
					RequiredMinElapsedTime = 3,
					-- I don't know what to say. I'm sure it will help.
					{ Cue = "/VO/ZagreusHome_3389" },
				},
			},
			{ Cue = "/VO/Nyx_4000", Portrait = "Portrait_Nyx_Default_01", Speaker = "NPC_Nyx_01", PreLineWait = 0.35,
					PreLineAnim = "NyxIdleGreeting", PreLineAnimTarget = 370010,
				Text = "Come, child. Moros has something to discuss with you. Moros?" },
			{ Cue = "/VO/Moros_0001",
				Text = "As I was archiving the recent deaths, I couldn't help but notice a specific pile increasing in height alarmingly fast. Imagine my surprise when I found it to belong to a certain Underworld Prince. Don't worry - it is my duty, it is no problem. However; I believe I can help you achieve your goal. Whatever that goal is. Nobody has properly filled me in on that." },
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "Help is always welcome. But how? It would be convenient if you were able to bring me with you to one of your trips to the surface." },
			{ Cue = "/VO/Moros_0001",
				Text = "Sorry to dissappoint you, Prince, but Lord Hades would never allow such a thing. No, my help would reach you through a certain tool which I believe has already helped you greatly... the Mirror of Night." },
			{ Cue = "/VO/Nyx_4000", Portrait = "Portrait_Nyx_Default_01", Speaker = "NPC_Nyx_01", PreLineWait = 0.35,
					PreLineAnim = "NyxIdleGreeting", PreLineAnimTarget = 370010, PostLineThreadedFunctionName = "EnableMirrorCSwap",
					PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 3.7 },
				Text = "Moros' suggestion intrigued me. I already added the adjustments to it. Hopefully, both of you will gain something from this." },
		},
		--[[MorosAboutOfficeUnlock =
		{
			Name = "MorosAboutOfficeUnlock",
			PlayOnce = true,
			Priority = true,
			UseableOffSource = true,
			RequiredTextLines = { "MorosFirstMeeting" },
			RequiredCosmetics = { "OfficeDoorUnlockItem" },
			--InOffice = true,
			EndVoiceLines =
			{
				{
					PreLineWait = 0.35,
					UsePlayerSource = true,
					RequiredMinElapsedTime = 3,
					-- I don't know what to say. I'm sure it will help.
					{ Cue = "/VO/ZagreusHome_3389" },
				},
			},
			{ Cue = "/VO/Moros_0001",
				Text = "I've heard you were granted back access to the administrative chamber. Congratulations, Prince. I look forward to working with you. While on that topic, I have just received the final copies of the latest arrivals of Shades-" },
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "Help is always welcome. But how? It would be convenient if you were able to bring me with you to one of your trips to the surface." },
			{ Cue = "/VO/Moros_0001",
				Text = "Sorry to dissappoint you, Prince, but Lord Hades would never allow such a thing. No, my help would reach you through a certain tool which I believe has already helped you greatly... the Mirror of Night." },
			{ Cue = "/VO/Nyx_4000", Portrait = "Portrait_Nyx_Default_01", Speaker = "NPC_Nyx_01", PreLineWait = 0.35,
					PreLineAnim = "NyxIdleGreeting", PreLineAnimTarget = 370010, PostLineThreadedFunctionName = "EnableMirrorCSwap",
					PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 3.7 },
				Text = "Moros' suggestion intrigued me. I already added the adjustments to it. Hopefully, both of you will gain something from this." },
		}]]
		MorosPreGrantsMirror =
		{
			Name = "MorosPreGrantsMirror",
			PlayOnce = true,
			Priority = true,
			UseableOffSource = true,
			RequiredTextLines = { "MorosFirstMeeting", "NyxGrantsRespec" },
			RequiredFalseTextLines = { "MorosGrantMirror" },
			--InOffice = true,
			EndVoiceLines =
			{
				{
					PreLineWait = 0.35,
					UsePlayerSource = true,
					RequiredMinElapsedTime = 3,
					-- I don't know what to say. I'm sure it will help.
					{ Cue = "/VO/ZagreusHome_3389" },
				},
			},
			{ Cue = "/VO/Moros_0001",
				Text = "My Prince... Can I talk to you about something? I am not sure how to bring it up..." },
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "What's up Moros? You look bothered by something. Have I done something wrong?" },
			{ Cue = "/VO/Moros_0001",
				Text = "Well, yes... and no... You see, ever since you started going to the surface you've been... dying... more than usual. The amount of paperwork that's been piling on me is now doubled, logging all your vain efforts to escape. Maybe if you could die less often..." },
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "Oh, I didn't know you've been record all my escape attempts. I suppose I'll make sure I get out this time." },
		},
		MorosHomeRunProgress02 =
		{
			Name = "MorosHomeRunProgress02",
			PlayOnce = true,
			Priority = true,
			UseableOffSource = true,		
			RequiredTextLines = { "MorosFirstMeeting" },
			RequiredTextLinesThisRun = { "PersephoneFirstMeeting" },
			--InOffice = true,
			EndVoiceLines =
			{
				{
					PreLineWait = 0.35,
					UsePlayerSource = true,
					RequiredMinElapsedTime = 3,
					-- I expect no less from you.
					{ Cue = "/VO/ZagreusHome_3389" },
				},
			},
			{ Cue = "/VO/Moros_0001",
				Text = "I couldn't believe my last report. You've made it out, Prince Zagreus. But I heard that the harsh enviornement got the better of you." },
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "Death by exposure... I didn't even think I could die that way. But it won't stop me from returning. I have unfinished business at the surface." },
		},
		MorosHomeRunProgress01 =
		{
			Name = "MorosHomeRunProgress01",
			PlayOnce = true,
			UseableOffSource = true,		
			RequiredMinCompletedRuns = 10,
			RequiredTextLines = { "MorosFirstMeeting" },
			RequiredFalseTextLines = {  "PersephoneFirstMeeting" },
			--InOffice = true,
			EndVoiceLines =
			{
				{
					PreLineWait = 0.35,
					UsePlayerSource = true,
					RequiredMinElapsedTime = 3,
					-- I don't know what to say. I'm sure it will help.
					{ Cue = "/VO/ZagreusHome_3389" },
				},
			},
			{ Cue = "/VO/Moros_0001",
				Text = "My Prince... Can I talk to you about something? I am not sure how to bring it up..." },
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "What's up Moros? You look bothered by something. Have I done something wrong?" },
			{ Cue = "/VO/Moros_0001",
				Text = "Well, yes... and no... You see, ever since you started going to the surface you've been... dying... more than usual. The amount of paperwork that's been piling on me is now doubled, logging all your vain efforts to escape. Maybe if you could die less often..." },
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "Oh, I didn't know you've been record all my escape attempts. I suppose I'll make sure I get out this time." },
		},
		
	},

	RepeatableTextLineSets =
	{
		MorosChat01 =
		{
			Name = "MorosChat01",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Orpheus",
			{ Cue = "/VO/Moros_0000",
				Text = "I have reports, Prince. Not now." },
		},
		MorosChat02 =
		{
			Name = "MorosChat02",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Orpheus",
			{ Cue = "/VO/Moros_0000",
				Text = "I can't talk now. Deadlines to met." },
		},
		MorosChat03 =
		{
			Name = "MorosChat03",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Orpheus",
			{ Cue = "/VO/Moros_0000",
				Text = "I have paperwork. Later, please, Prince." },
		},
		MorosChat04 =
		{
			Name = "MorosChat04",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Orpheus",
			{ Cue = "/VO/Moros_0000",
				Text = "Please excuse me, Lord Hades is waiting for my report." },
		},
		MorosChat05 =
		{
			Name = "MorosChat05",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Orpheus",
			{ Cue = "/VO/Moros_0000",
				Text = "I need to file those. Maybe later." },
		},
		MorosChat06 =
		{
			Name = "MorosChat06",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Orpheus",
			{ Cue = "/VO/Moros_0000",
				Text = "You died again, Zagreus. Let me file that real quick." },
		},
		MorosChat07 =
		{
			Name = "MorosChat07",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Orpheus",
			{ Cue = "/VO/Moros_0000",
				Text = "Let me finish this report and then I'll get back to you." },
		},
		MorosChat08 =
		{
			Name = "MorosChat08",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Orpheus",
			{ Cue = "/VO/Moros_0000",
				Text = "A shade calls. I'll see you soon." },
		},
		MorosChat09 =
		{
			Name = "MorosChat09",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Orpheus",
			{ Cue = "/VO/Moros_0000", PostLineThreadedFunctionName = "MorosExit", PostLineFunctionArgs = { AnimationState = "NPCMorosExited", WaitTime = 0.35, },
				Text = "The surface is calling. This will be rather messy." },
		},
		MorosChat10 =
		{
			Name = "MorosChat10",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Orpheus",
			{ Cue = "/VO/Moros_0000",
				Text = "Well, this is the first time I have to censor a cause of death in my report." },
		},
		--[[MorosChat11 =
		{
			Name = "MorosChat11",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Orpheus",
			{ Cue = "/VO/Nyx_0003",
				Text = "Darkness guide you, child." },
		},
		MorosChat12 =
		{
			Name = "MorosChat12",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Orpheus",
			{ Cue = "/VO/Nyx_0003",
				Text = "Darkness guide you, child." },
		},
		MorosChat13 =
		{
			Name = "MorosChat13",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Orpheus",
			{ Cue = "/VO/Nyx_0003",
				Text = "Darkness guide you, child." },
		},
		MorosChat14 =
		{
			Name = "MorosChat14",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Orpheus",
			{ Cue = "/VO/Nyx_0003",
				Text = "Darkness guide you, child." },
		},
		MorosChat15 =
		{
			Name = "MorosChat15",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Orpheus",
			{ Cue = "/VO/Nyx_0003",
				Text = "Darkness guide you, child." },
		},
		MorosChat16 =
		{
			Name = "MorosChat16",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Orpheus",
			{ Cue = "/VO/Nyx_0003",
				Text = "Darkness guide you, child." },
		},
		MorosChat17 =
		{
			Name = "MorosChat17",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Orpheus",
			{ Cue = "/VO/Nyx_0003",
				Text = "Darkness guide you, child." },
		},
		MorosChat18 =
		{
			Name = "MorosChat18",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Orpheus",
			{ Cue = "/VO/Nyx_0003",
				Text = "Darkness guide you, child." },
		},
		MorosChat19 =
		{
			Name = "MorosChat19",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Orpheus",
			{ Cue = "/VO/Nyx_0003",
				Text = "Darkness guide you, child." },
		},
		MorosChat20 =
		{
			Name = "MorosChat20",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Orpheus",
			{ Cue = "/VO/Nyx_0003",
				Text = "Darkness guide you, child." },
		},
		MorosChat21 =
		{
			Name = "MorosChat21",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Orpheus",
			{ Cue = "/VO/Nyx_0003",
				Text = "Darkness guide you, child." },
		},
		MorosChat22 =
		{
			Name = "MorosChat22",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Orpheus",
			{ Cue = "/VO/Nyx_0003",
				Text = "Darkness guide you, child." },
		},
		MorosChat23 =
		{
			Name = "MorosChat23",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Orpheus",
			{ Cue = "/VO/Nyx_0003",
				Text = "Darkness guide you, child." },
		},
		MorosChat24 =
		{
			Name = "MorosChat24",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Orpheus",
			{ Cue = "/VO/Nyx_0003",
				Text = "Darkness guide you, child." },
		},
		MorosChat25 =
		{
			Name = "MorosChat25",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Orpheus",
			{ Cue = "/VO/Nyx_0003",
				Text = "Darkness guide you, child." },
		},]]
	},

	GiftTextLineSets =
	{
		MorosGift01 =
			{
				Name = "MorosGift01",
				PlayOnce = true,
				{ Cue = "/VO/ZagreusHome_0118", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
					Text = "{#DialogueItalicFormat}Erm{#PreviousFormat}, Moros? You've done so much for me, I.. thought you might like this." },
				{ Cue = "/VO/Moros_0445",
					PreLineAnim = "NyxIdleGreeting",
					Text = "You know your father does not like it when Nectar is doled out on the premises, dear child. However, I am not he... and I wished, regardless, to provide to you a token of my affection." },
			},
			MorosGift02 =
			{
				Name = "MorosGift02",
				PlayOnce = true,
				RequiredTextLines = { "MorosGift01" },
				{ Cue = "/VO/Nyx_0045",
					PreLineAnim = "NyxIdleGreeting",
					Text = "How can I possibly accept such generosity, my child? Surely others whom you know are more deserving of such offerings." },
				{ Cue = "/VO/ZagreusHome_0196", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					Text = "Nonsense, Nyx. I want you to have it. You've always cared for me. I can't ever repay you for that." },
			},
			MorosGift03 =
			{
				Name = "MorosGift03",
				PlayOnce = true,
				RequiredTextLines = { "MorosGift02" },
				{ Cue = "/VO/Nyx_0046", Portrait = "Portrait_Nyx_Averted_01",
					PreLineAnim = "NyxIdleGreeting",
					Text = "Your kindness toward me is unnecessary, child. You know I have no expectation of such gifts, from you or anyone." },
				{ Cue = "/VO/ZagreusHome_0197", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					Text = "I think of you always, Nyx. You raised me as your own, and I am grateful for it." },
			},
			MorosGift04 =
			{
				Name = "MorosGift04",
				PlayOnce = true,
				RequiredTextLines = { "MorosGift03" },
				{ Cue = "/VO/Nyx_0047",
					PreLineAnim = "NyxIdleGreeting",
					Text = "You honor me, my child; although I dread that I am not deserving of such generosity. There is no need to flatter me like this." },
				{ Cue = "/VO/ZagreusHome_0198", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Be that as it may, Nyx! I would still like for you to have it, with my compliments." },
			},
			MorosGift05 =
			{
				Name = "MorosGift05",
				PlayOnce = true,
				RequiredTextLines = { "MorosGift04" },
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
-- Nyx Partnership
OlympusEnemyData.NPC_Nyx_01.MorosGrantMirror = 
{
	PlayOnce = true,
	UseableOffSource = true,
	GiftableOffSource = true,
	StatusAnimation = false,
	Skip = true,
}
-- Moros activation requirements
--table.insert(OlympusDeathLoopData.DeathArea.StartUnthreadedEvents[17].Args.Types, "NPC_Moros_01")
--OlympusDeathLoopData.DeathArea.StartUnthreadedEvents[17].Args.ActivationCapMin = 6
--OlympusDeathLoopData.DeathArea.StartUnthreadedEvents[17].Args.ActivationCapMax = 6
function OENPCSpawner(eventSource, args)
	local npc = ActiveEnemies[args.Id]	
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString.TableKeys(npc))
end
table.insert(OlympusGameData.ConversationOrder,"NPC_Moros_01")
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
-- Keepsake
OlympusTraitData.BonusRangedBoonTrait = {
		Name = "BonusRangedBoonTrait",
		InheritFrom = { "GiftTrait" },
		--Inherit
		Frame = "Gift",
		Slot = "Keepsake",
		RecordCacheOnEquip = true,
		ChamberThresholds = { 25, 50 },

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
			}
		},
		--New Data
		InRackTitle = "BonusRangedBoonTrait_Rack",
		Icon = "Keepsake_Ouroboros",
		EquipSound = "/SFX/Enemy Sounds/HydraHead/HydraMiscBoneRattle1",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.33,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
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
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "MaxAmmo",
				ChangeValue = 1.0,
				ChangeType = "Add",
				MinMultiplier = 1,
				ExtractValue =
				{
					ExtractAs = "TooltipCapacity",
				}
			},
		},
		SignOffData =
		{
			{
				Text = "MorosSignoff",
			},
			{
				RequiredTextLines = { "MorosGift07" },
				Text = "MorosSignoff_Max"
			}
		},
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
		Gift = true,
		InheritFrom = {"DefaultGiftData"},
		Name = "NPC_Moros_01",
		MaxedIcon = "Keepsake_Achilles_Max",
		MaxedSticker = "Keepsake_AchillesSticker_Max",
		MaxedRequirement = { RequiredTextLines = { "Test2" }, },
		Locked = 4,
		Maximum = 5,
		[1] = { Gift = "BonusRangedBoonTrait" },
		[4] = { RequiredResource = "SuperGiftPoints" },
		UnlockGameStateRequirements = { RequiredTextLines = { "Test1" } }
	}
	
table.insert(OlympusGiftOrdering, 7, "BonusRangedBoonTrait")
table.insert(OlympusDeathLoopData.DeathArea.StartUnthreadedEvents, {
	FunctionName = "SpawnExtraNPCs",
	GameStateRequirements =
	{
		RequiredFalseFlags = { "InFlashback" },
	},
	Args =
	{
		Name = "NPC_Moros_01", 
		SpawnPointId = 370026
	},
})

function MorosExit( source, args )

	args = args or {}
	if args.UseMaxedPresentation then
		AddInputBlock({ Name = "MorosExit" })
	end
	UseableOff({ Id = source.ObjectId })
	source.CanReceiveGift = false
	source.InteractTextLineSets = nil
	wait( args.WaitTime or 0 )

	SetAnimation({ Name = "NPCThanatosExit", DestinationId = source.ObjectId })
	CreateAnimation({ Name = "ThanatosTeleport", DestinationId = source.ObjectId })
	SetAlpha({ Id = source.ObjectId, Fraction = 0.0, Duration = 0.35 })
	AdjustColorGrading({ Name = "Thanatos", Duration = 0.25 })

	if not args.IgnoreMusic then
		StopSecretMusic( true )
	end

	source.NextInteractLines = nil
	RefreshUseButton( source.ObjectId, source )
	StopStatusAnimation( source )

	if not args.SkipExitReaction then
		thread( PlayVoiceLines, HeroVoiceLines.ThanatosExitReactionVoiceLines, true )
	end

	wait( 0.5, RoomThreadName )
	AdjustColorGrading({ Name = "Off", Duration = 1.35 })

	--[[if args.UseMaxedPresentation then
		MaxedRelationshipPresentation( source, { Text = "NPC_Thanatos_01", Icon = "Keepsake_ThanatosSticker_Max" } )
	end]]

	--[[source.Mute = true
	CurrentRun.EventState[source.ObjectId] = { FunctionName = "ThanatosExitSilent", Args = args }]]

	if args.UseMaxedPresentation then
		RemoveInputBlock({ Name = "MorosExit" })
	end

	wait( 1.0, RoomThreadName )

	if ActivatedObjects[source.ObjectId] ~= nil and not CurrentRun.Hero.IsDead then
		ActivatedObjects[source.ObjectId] = nil
		wait( 0.2, RoomThreadName )
		if CheckRoomExitsReady( CurrentRun.CurrentRoom ) then
			UnlockRoomExits( CurrentRun, CurrentRun.CurrentRoom )
		end
	end

end


function EnableMirrorCSwap()
	GameState.Flags.MirrorCEnabled = true
	wait(0.25)
	DisplayUnlockText({
		TitleText = "MetaUpgradeRespec_Unlocked",
		SubtitleText = "MetaUpgradeRespec_Unlocked_Subtitle",
		SubtitleData = { LuaKey = "TempTextData", LuaValue = { Name = weaponName }},
		AnimationName = "LocationTextBGGeneric_Mirror",
		AnimationOutName = "LocationTextBGGenericOut_Mirror",
		-- Duration = 4.5,
	})
end