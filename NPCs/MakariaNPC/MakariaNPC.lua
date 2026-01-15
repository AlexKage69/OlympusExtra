local OlympusDeathLoopData = ModUtil.Entangled.ModData(DeathLoopData)
local OlympusGameData = ModUtil.Entangled.ModData(GameData)
local OlympusGiftData = ModUtil.Entangled.ModData(GiftData)
local OlympusGiftOrdering = ModUtil.Entangled.ModData(GiftOrdering)
local OlympusTraitData = ModUtil.Entangled.ModData(TraitData)
local OlympusColor = ModUtil.Entangled.ModData(Color)
local OlympusRoomData = ModUtil.Entangled.ModData(RoomData)
local OlympusRoomSetData = ModUtil.Entangled.ModData(RoomSetData)
local OlympusGlobalVoiceLines = ModUtil.Entangled.ModData(GlobalVoiceLines)
local OlympusAssistUpgradeData = ModUtil.Entangled.ModData(AssistUpgradeData)
local OlympusCodexOrdering = ModUtil.Entangled.ModData(CodexOrdering)
local OlympusCodex = ModUtil.Entangled.ModData(Codex)
local OlympusQuestData = ModUtil.Entangled.ModData(QuestData)
local OlympusQuestOrderData = ModUtil.Entangled.ModData(QuestOrderData)
	


--Variables
local DepthDamageMultiplier = 0.0
local DuplicateMultiplier = -0.60
local DuplicateStrongMultiplier = -0.40
local DuplicateVeryStrongMultiplier = -0.20
OlympusColor.MakariaVoice = { 93, 19, 52, 255 }
--Quest
OlympusQuestData.StoneOfBanishmentQuest =
	{
		InheritFrom = { "DefaultQuestItem" },
		RewardResourceName = "GiftPoints",
		RewardResourceAmount = 3,
		UnlockGameStateRequirements =
		{
			RequiredTextLines = { "MakariaStartBanishmentQuest", },
		},
		CompleteGameStateRequirements =
		{
			RequiredCosmetics = { "StoneOfBanishmentWorkOrder" },
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

			-- 
			{ Cue = "/VO/ZagreusHome_4000" },
		},
		IncompleteName = "Quest_UnknownCondition",
	}
	
table.insert(OlympusQuestOrderData, 60, "StoneOfBanishmentQuest")
-- 3DGhostAltIdle for the Hypnos discussion
local OlympusEnemyData = ModUtil.Entangled.ModData(EnemyData)
OlympusEnemyData.NPC_Makaria_01 =
{
	InheritFrom = { "NPC_Neutral", "NPC_Giftable" },
	Name = "NPC_Makaria_01",
	UseText = "UseTalkToFemaleGhost",
	Portrait = "Portrait_Makaria_Default_01",
	AnimOffsetZ = 205,
	EmoteOffsetX = 50,
	EmoteOffsetY = -200,

	Groups = { "NPCs" },
	SubtitleColor = Color.MakariaVoice,

	Binks =
	{
		"NPC_MakIdle_Bink",
	},

	ActivateRequirements =
	{
		RequiredTextLines = { "HadesWithMakariaAndMelinoe01" },
		RequiredFalseTextLinesThisRun = { "HadesWithMakariaAndMelinoe01" },
		RequiredFalseFlags = { "InFlashback", }
		--RequiredFalseTextLinesLastRun = {  },
	},
	LocationsById = {
		[370136] = { -- DeathAreaOffice
			LocationX = 4488.060547,
			LocationY = 4552.947266,
		},
		[370036] = { -- DeathArea/ Near Office
			LocationX = 3472.402832,
			LocationY = 2483.359375,
		},
	},
	InteractTextLineSets =
	{
		MakariaFirstMeeting_A =
		{
			Name = "MakariaFirstMeeting_A",
			PlayOnce = true,
			UseableOffSource = true,
			RequiredTextLines = { "MakariaSnoopingScene", },
			EndVoiceLines =
			{
				{
					PreLineWait = 0.35,
					UsePlayerSource = true,
					RequiredMinElapsedTime = 3,
					-- You're welcome
					{ Cue = "/VO/ZagreusHome_3242" },
				},
			},
			{
				Cue = "/VO/ZagreusHome_4000",
				Portrait = "Portrait_Zag_Default_01",
				Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart",
				PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return",
				PostLineAnimTarget = "Hero",
				Text =
				"I know you. I saw in my room. You must be Melinoe's sister. It's nice to met you. I hope you'll feel welcome. Funny how you are trying to get in as I am trying to get out."
			},
			{
				Cue = "/VO/Makaria_0001",
				Portrait = "Portrait_Makaria_Smiling_03",
				Text =
				"{#DialogueItalicFormat}Hihi{#PreviousFormat}, and I know you will. I mean, get out. Just know, Mel and I will help you as much as we can. It was very nice of you to help us with getting Hades' approval."
			},
		},
		MakariaFirstMeeting_B =
		{
			Name = "MakariaFirstMeeting_B",
			PlayOnce = true,
			UseableOffSource = true,
			RequiredFalseTextLines = { "MakariaSnoopingScene", },
			EndVoiceLines =
			{
				{
					PreLineWait = 0.35,
					UsePlayerSource = true,
					RequiredMinElapsedTime = 3,
					-- You're welcome
					{ Cue = "/VO/ZagreusHome_3242" },
				},
			},
			{
				Cue = "/VO/ZagreusHome_4000",
				Portrait = "Portrait_Zag_Default_01",
				Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart",
				PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return",
				PostLineAnimTarget = "Hero",
				Text =
				"Makaria right? You must be Melinoe's sister. It's nice to met you. I hope you'll feel welcome. Funny how you are trying to get in as I am trying to get out."
			},
			{
				Cue = "/VO/Makaria_0001",
				Portrait = "Portrait_Makaria_Smiling_03",
				Text =
				"{#DialogueItalicFormat}Hihi{#PreviousFormat}, and I know you will. I mean, get out. Just know, Mel and I will help you as much as we can. It was very nice of you to help us with getting Hades' approval."
			},
		},
		MakariaWithHades01 =
		{
			Name = "MakariaWithHades01",
			PlayOnce = true,
			UseableOffSource = true,
			Partner = "NPC_Hades_01",
			RequiredMinNPCInteractions = { NPC_Makaria_01 = 1, NPC_Hades_01 = 1 },
			BlockDistanceTriggers = true,
			StatusAnimation = false,
			GiftableOffSource = true,
			UseText = "UseListenNPC",
			TeleportToId = 370006,
			TeleportOffsetX = -485,
			TeleportOffsetY = 350,
			AngleTowardTargetId = 370006,
			InteractDistance = 400,
			EndVoiceLines =
			{
				{
					PreLineWait = 0.35,
					UsePlayerSource = true,
					RequiredMinElapsedTime = 3,
					-- Hihi. Off I go.
					{ Cue = "/VO/Makaria_0001" },
				},
			},
			{
				Cue = "/VO/Hades_4000",
				Portrait = "Portrait_Hades_Default_01",
				Speaker = "NPC_Hades_01",
				Text =
				"I already accepted your request of refuge. What is it that you want again, girl? I don't have time to waste."
			},
			{
				Cue = "/VO/Makaria_0001",
				Portrait = "Portrait_Makaria_Default_01",
				Text =
				"Why are you angry at me? I don't think I have seen you angry before. I came to ask for work. I wanted to help out too."
			},
			{
				Cue = "/VO/Hades_4000",
				Portrait = "Portrait_Hades_Default_01",
				Speaker = "NPC_Hades_01",
				PostLineThreadedFunctionName = "MakariaExit",
				Text =
				"You just arrived and you have the audacity of commenting on my behavior? I'll speak however I please. What is it about work? Can't you see I am busy? Go bother someone else. I have wasted enough on this. Just go."
			},
		},
		MakariaWithThanatos01 =
		{
			Name = "MakariaWithThanatos01",
			PlayOnce = true,
			Partner = "NPC_Thanatos_01",
			UseText = "UseListenNPC",
			BlockDistanceTriggers = true,
			UseableOffSource = true,
			GiftableOffSource = true,
			TeleportToId = 423052,
			TeleportOffsetX = 90,
			TeleportOffsetY = -120,
			AngleTowardTargetId = 423052,
			InteractDistance = 375,
			RequiredTextLines = { "MakariaGift01", "ThanatosGift01" },
			EndVoiceLines =
			{
				{
					PreLineWait = 0.35,
					UsePlayerSource = true,
					RequiredMinElapsedTime = 3,
					-- Hihi. Off I go.
					{ Cue = "/VO/Makaria" },
				},
			},
			{
				Cue = "/VO/Makaria_0001",
				Portrait = "Portrait_Makaria_Default_01",
				Text =
				"Hades told me you have work for me. Actually he said Moros or you, but I don't feel like doing archive. And I heard you are reaping around. Might be my thing too. {#DialogueItalicFormat}Hihi{#PreviousFormat}."
			},
			{
				Cue = "/VO/Thanatos_4000",
				Portrait = "Portrait_Thanatos_Default_01",
				Speaker = "NPC_Thanatos_01",
				PostLineThreadedFunctionName = "MakariaThanatosExit",
				Text =
				"Let me doubt you would be capable of {#DialogueItalicFormat}reaping{#PreviousFormat} anything, little one. But if it's Hades' order. I'll show you the rope. Make sure to follow my every order."
			},
		},
		MakariaWithCerberus01 =
		{
			Name = "MakariaWithCerberus01",
			PlayOnce = true,
			UseableOffSource = true,
			Partner = "NPC_Cerberus_01",
			UseText = "UseListenNPC",
			RequiredTextLines = { "MakariaGift01", "CerberusGift01" },
			RequiredMinCompletedRuns = 10,
			BlockDistanceTriggers = true,
			GiftableOffSource = true,
			TeleportToId = 370007,
			TeleportOffsetX = -175,
			TeleportOffsetY = 275,
			AngleTowardTargetId = 370007,
			EndVoiceLines =
			{
				{
					PreLineWait = 0.35,
					UsePlayerSource = true,
					RequiredMinElapsedTime = 3,
					-- Hihi. Off I go.
					{ Cue = "/VO/Makaria" },
				},
			},
			{
				Cue = "/VO/Makaria_0001",
				Portrait = "Portrait_Makaria_Default_01",
				Text =
				"Hades told me you have work for me. Actually he said Moros or you, but I don't feel like doing archive. And I heard you are reaping around. Might be my thing too. {#DialogueItalicFormat}Hihi{#PreviousFormat}."
			},
			{
				Cue = "/VO/Thanatos_4000",
				Portrait = "Portrait_Thanatos_Default_01",
				Speaker = "NPC_Thanatos_01",
				PostLineThreadedFunctionName = "MakariaThanatosExit",
				Text =
				"Let me doubt you would be capable of {#DialogueItalicFormat}reaping{#PreviousFormat} anything, little one. But if it's Hades' order. I'll show you the rope. Make sure to follow my every order."
			},
		},
		MakariaStartBanishmentQuest =
		{
			SuperPriority = true,
			Name = "MakariaStartBanishmentQuest",
			StatusAnimation = "StatusIconWantsToTalkImportant",
			PlayOnce = true,
			UseableOffSource = true,
			RequiredMinNPCInteractions = { NPC_Makaria_01 = 1 },
			RequiredMinAnyTextLines = {
				TextLines = { "ZeusGift04", "PoseidonGift04", "AthenaGift04", "AphroditeGift04", "AresGift04",
					"ArtemisGift04", "DionysusGift04", "DemeterGift04", "ApolloGift04", "HestiaGift04", "HeraGift04" },
				Count = 3
			},
			EndVoiceLines =
			{
				{
					PreLineWait = 0.35,
					UsePlayerSource = true,
					RequiredMinElapsedTime = 3,
					-- I knew you would be up for it
					{ Cue = "/VO/Makaria_0000" },
				},
				{
					PreLineWait = 0.35,
					UsePlayerSource = true,
					RequiredMinElapsedTime = 3,
					-- Alright, let me look for it
					{ Cue = "/VO/ZagreusHome_4000" },
				},
			},
			{
				Cue = "/VO/Makaria_0001",
				Text =
				"Oh Zagreus! Always at the right place, right time. While arriving into your realm, I got distracted and lost an ancient artefact. I know you are always on the run. So."
			},
			{
				Cue = "/VO/ZagreusHome_4000",
				Portrait = "Portrait_Zag_Default_01",
				Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart",
				PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return",
				PostLineAnimTarget = "Hero",
				Text = "You want me to find it for you? Sure what does it look like?"
			},
			{
				Cue = "/VO/Makaria_0001",
				Text =
				"It's a giant stone. Can't miss it really. Which makes you wonder how I lost it in the first place. Hihi. "
			},
		},
		MakariaMiddleBanishmentQuest =
		{
			Name = "MakariaMiddleBanishmentQuest",
			PlayOnce = true,
			UseableOffSource = true,
			RequiredMinNPCInteractions = { NPC_Makaria_01 = 1 },
			RequiredTextLines = { "MakariaStartBanishmentQuest" },
			RequiredMinChallengeSwitchQuestItemTartarus = 1,
			RequiredNotCosmetics = { "StoneOfBanishmentWorkOrder", },
			EndVoiceLines =
			{
				{
					PreLineWait = 0.35,
					UsePlayerSource = true,
					RequiredMinElapsedTime = 3,
					-- To the house contractor!
					{ Cue = "/VO/ZagreusHome_1490" },
				},
			},
			{
				Cue = "/VO/ZagreusHome_4000",
				Portrait = "Portrait_Zag_Default_01",
				Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart",
				PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return",
				PostLineAnimTarget = "Hero",
				Text =
				"Makaria. I think I found your stone. Well. Some piece of it at least. Not sure if you want to me to find the other or its broken for good."
			},
			{
				Cue = "/VO/Makaria_0001",
				Text =
				"Oh silly. It's an ancient artefact. You really think it the first time it gets broken? Just bring it to the house contractor when you got them all. Thanks. You are the best."
			},
		},
		MakariaCompletedBanishmentQuest =
		{
			SuperPriority = true,
			Name = "MakariaCompletedBanishmentQuest",
			PlayOnce = true,
			UseableOffSource = true,
			RequiredTextLines = { "MakariaStartBanishmentQuest" },
			RequiredCosmetics = { "StoneOfBanishmentWorkOrder" },
			EndVoiceLines =
			{
				{
					PreLineWait = 0.35,
					UsePlayerSource = true,
					RequiredMinElapsedTime = 3,
					-- To the house contractor!
					{ Cue = "/VO/ZagreusHome_1490" },
				},
			},
			{
				Cue = "/VO/Makaria_0001",
				Text =
				"Looks like you did it! Now that you've got all the pieces, you repaired the Stone of Banishment! I mean the House Contractor. Hope it can be useful on your crusade once it's back to one piece."
			},
		},
	},

	RepeatableTextLineSets =
	{
		MakariaChat01 =
		{
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines",
			{
				Cue = "/VO/Makaria_0001",
				Text = "Make sure to enjoy yourself during your next escape."
			},
		},
		MakariaChat02 =
		{
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines",
			{
				Cue = "/VO/Makaria_0001",
				Text = "Going off again? Stay safe. As much as you can I mean."
			},
		},
		MakariaChat03 =
		{
			UseableOffSource = true,
			RequiredTextLines = { "CerberusStyxMeeting01" },
			EndGlobalVoiceLines = "MiscEndVoiceLines",
			{
				Cue = "/VO/Makaria_0001",
				Text = "Cerberus always leave the house when you escape. I guess he wants to follow you to make sure you are safe."
			},
		},
		MakariaChat04 =
		{
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines",
			{
				Cue = "/VO/Makaria_0001",
				Text = "The Chef's food is amazing! I meant some here would say it's to die for. Ha. Get it?"
			},
		},
		--[[MakariaChat05 =
		{
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines",
			{
				Cue = "/VO/Makaria_0001",
				Text = "Melinoe doesn't want me to mangle too much with you guys. But at the same time, she wanders around talking to everyone. I don't think it's fair."
			},
		},
		MakariaChat06 =
		{
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines",
			{
				Cue = "/VO/Makaria_0001",
				Text = "MakariaChat06"
			},
		},
		MakariaChat07 =
		{
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines",
			{
				Cue = "/VO/Makaria_0001",
				Text = "MakariaChat07"
			},
		},]]
		MakariaChat08 =
		{
			UseableOffSource = true,
			RequiredTextLines = { "MakariaWithThanatos01" },
			EndGlobalVoiceLines = "MiscEndVoiceLines",
			{
				Cue = "/VO/Makaria_0001",
				Text = "I started working with Thanatos lately. His way more fun than you would think. But I guess you know that already. Mmh?"
			},
		},
		--[[MakariaChat09 =
		{
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines",
			{
				Cue = "/VO/Makaria_0001",
				Text = "MakariaChat09"
			},
		},
		MakariaChat10 =
		{
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines",
			{
				Cue = "/VO/Makaria_0001",
				Text = "MakariaChat10"
			},
		},
		MakariaChat11 =
		{
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines",
			{
				Cue = "/VO/Makaria_0001",
				Text = "MakariaChat11"
			},
		},]]
	},

	GiftTextLineSets =
	{
		MakariaGift01 =
		{
			Name = "MakariaGift01",
			PlayOnce = true,
			{
				Cue = "/VO/ZagreusHome_4000",
				Portrait = "Portrait_Zag_Serious_01",
				Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart",
				PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return",
				PostLineAnimTarget = "Hero",
				Text = "We haven't known each other for long... But I prepared you this."
			},
			{
				Cue = "/VO/Makaria_0001",
				--PreLineAnim = "NyxIdleGreeting",
				Text =
				"{#DialogueItalicFormat}Oohh{#PreviousFormat} The well known Zagreus' gifts? I wasn't sure it would happen. Thanks. In such case, I prepared this. Hope you can make use of it."
			},
		},
		MakariaGift02 =
		{
			Name = "MakariaGift02",
			PlayOnce = true,
			RequiredTextLines = { "MakariaGift01" },
			{
				Cue = "/VO/Makaria_0001",
				Portrait = "Portrait_Makaria_Sorrow_04",
				--PreLineAnim = "NyxIdleGreeting",
				Text = "Very nice Zagreus."
			},
			{
				Cue = "/VO/ZagreusHome_4000",
				Portrait = "Portrait_Zag_Default_01",
				Speaker = "CharProtag",
				Text = "No Problem."
			},
		},
		MakariaGift03 =
		{
			Name = "MakariaGift03",
			PlayOnce = true,
			RequiredTextLines = { "MakariaGift02" },
			{
				Cue = "/VO/Makaria_0001",
				Text =
				"They keep coming, {#DialogueItalicFormat}huh{#PreviousFormat}? If you keep on giving them to whoever, we'll stop feeling special, you know."
			},
			{
				Cue = "/VO/ZagreusHome_4000",
				Portrait = "Portrait_Zag_Default_01",
				Speaker = "CharProtag",
				Text =
				"I don't mean it like that. It's just, everyone is special to me in their own way. And so are you. In more ways I can explain. I wanted my actions to reflect that."
			},
		},
		MakariaGift04 =
		{
			Name = "MakariaGift04",
			PlayOnce = true,
			RequiredTextLines = { "MakariaGift03" },
			-- A Chtonic Companion! How did you manage this?
			{
				Cue = "/VO/ZagreusHome_4000",
				Portrait = "Portrait_Zag_Default_01",
				Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkDenialStart",
				PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkDenialReturnToIdle",
				PostLineAnimTarget = "Hero",
				Text =
				"I found Ambrosia, and though. Makaria might have never tried it. Here's my chance to share it with your... brother."
			},
			{
				Cue = "/VO/Makaria_0001",
				Text =
				"Ambrosia! That is a very thoughful give and I was waiting for the right moment to be sharing this. From your beloved sister... Me. I mean me. Not Melinoë. Hihi"
			},
		},
		MakariaGift05 =
		{
			Name = "MakariaGift05",
			PlayOnce = true,
			RequiredTextLines = { "MakariaGift04" },
			-- Cheers
			{
				Cue = "/VO/ZagreusHome_4000",
				Portrait = "Portrait_Zag_Default_01",
				Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart",
				PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return",
				PostLineAnimTarget = "Hero",
				Text =
				"I know we can't talk about your past. Or my futur. But it doesn't stop us from sharing meaningful moment like this one. And I know one way. Look at this."
			},
			{
				Cue = "/VO/Makaria_0001",
				Text =
				"Ambrosia! You don't know how super rare it is where we are coming from. To have the honor of sharing this with you is out of this world. Cheers."
			},
		},
		MakariaGift06 =
		{
			Name = "MakariaGift06",
			PlayOnce = true,
			RequiredTextLines = { "MakariaGift05" },
			-- Sounds good.
			{
				Cue = "/VO/Makaria_0001",
				Text =
				"What is behind your back? Another gift? Zag, you shouldn't. But I don't know how long I get to share these times with the old you. So to family."
			},
			{
				Cue = "/VO/ZagreusHome_4000",
				Portrait = "Portrait_Zag_Default_01",
				Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart",
				PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return",
				PostLineAnimTarget = "Hero",
				Text = "You know what? Safe it. I have an idea. Let's met at the surface whenever you have the time."
			},
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
			AreIdsNotAlive = { 370036 },
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

		-- That's nice of you, Makaria
		{ Cue = "/VO/ZagreusHome_4000" },
	},
}
table.insert(OlympusDeathLoopData.DeathAreaBedroom.StartUnthreadedEvents, {
	FunctionName = "ActivatePrePlacedUnits",
	GameStateRequirements =
	{
		RequiredSeenRooms = { "D_Boss01" },
		RequiredFalseTextLines = { "MakariaSnoopingScene", "HadesWithMakariaAndMelinoe01" },
	},
	BreakIfPlayed = true,
	Args =
	{
		Ids = { 422256, },
		DistanceTrigger =
		{
			WithinDistance = 1000,
			FunctionName = "SurpriseNPCPresentation",
			Args =
			{
				VoiceLines =
				{
					Queue = "Interrupt",
					{
						PreLineWait = 0.55,
						BreakIfPlayed = true,
						ObjectType = "NPC_Thanatos_01",
						-- -Who was that?
						{ Cue = "/VO/Thanatos_0534" },
					},
				},
				TextLineSet =
				{
					MakariaSnoopingScene =
					{
						PlayOnce = true,
						--EndGlobalVoiceLines = "PostBedroomIntermissionVoiceLines",
						-- requirements are above
						{
							Cue = "/VO/ZagreusHome_4000",
							Portrait = "Portrait_Zag_Default_01",
							Speaker = "CharProtag",
							PreLineThreadedFunctionName = "BedroomMoveTowardMakariaApproach",
							PreLineWait = 1.1,
							--AngleHeroTowardSource = true,
							AngleTowardTargetId = 310036,
							PreLineAnim = "ZagreusTalkEmpathyStart",
							PreLineAnimTarget = "Hero",
							PostLineAnim = "ZagreusTalkEmpathy_Return",
							PostLineAnimTarget = "Hero",
							-- Emote = "PortraitEmoteSurprise",
							Text =
							"*Mmh* Hello? I don't think we've met. My name is Zagreus. You might telling me what you are doing in my room?"
						},

						{
							Cue = "/VO/Makaria_0001",
							PostLineThreadedFunctionName = "MakariaExit",
							AngleTowardHero = true,
							Text =
							"{#DialogueItalicFormat}Ohh{#PreviousFormat} shoot. Mel won't to be happy about that. Listen, Zagreus. You never saw me. I was just too curious to not look around. Just pretend you didn't see me, okay?"
						},

					},
				},
			},
		},
	}
})
table.insert(OlympusGameData.ConversationOrder, "NPC_Makaria_01")
OlympusDeathLoopData.DeathArea.ObstacleData[370036] = {
	Name = "NPC_Makaria_01",
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
OlympusTraitData.TroveUpgradeBoonTrait = {
	Name = "TroveUpgradeBoonTrait",
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
			Multiplier = 1.5,
		},
		Epic =
		{
			Multiplier = 2.0,
		}
	},
	--New Data
	InRackTitle = "TroveUpgradeBoonTrait_Rack",
	Icon = "Keepsake_Candle",
	EquipSound = "/SFX/Enemy Sounds/HydraHead/HydraMiscBoneRattle1",
	BaseChallengeSpawnChanceMultiplier = {
		BaseValue = 0.10
	},
	ExtractValues =
	{
		{
			Key = "BaseChallengeSpawnChanceMultiplier",
			ExtractAs = "TooltipBaseChallengeSpawnChanceMultiplier",
			Format = "Percent"
		},
	},
	SignOffData =
	{
		{
			Text = "MakariaSignoff",
		},
		{
			RequiredTextLines = { "MakariaGift07" },
			Text = "MakariaSignoff_Max"
		}
	},
}
OlympusTraitData.MakariaAssistTrait =
{
	Name = "MakariaAssistTrait",
	InheritFrom = { "AssistTrait" },
	InRackTitle = "MakariaAssistTrait_Rack",
	InRackIcon = "Keepsake_Makaria_Plush_Menu",
	Icon = "Keepsake_Makaria_Plush",
	EquipSound = "/SFX/Enemy Sounds/ButterflyDeathSFX",
	KeepsakeRarityGameStateRequirements =
	{
		[1] = {
			AssistUpgradeLevel =
			{
				Name = "MakariaAssistTrait",
				Level = 0,
			}
		},
		[2] = {
			AssistUpgradeLevel =
			{
				Name = "MakariaAssistTrait",
				Level = 1,
			}
		},
		[3] = {
			AssistUpgradeLevel =
			{
				Name = "MakariaAssistTrait",
				Level = 2,
			}
		},
		[4] = {
			AssistUpgradeLevel =
			{
				Name = "MakariaAssistTrait",
				Level = 3,
			}
		},
		[5] = {
			AssistUpgradeLevel =
			{
				Name = "MakariaAssistTrait",
				Level = 4,
			}
		},
	},
	--LoadPackages = { "NPC_Achilles_01_Assist", "NPC_Patroclus_01_Assist"},
	PreEquipWeapons = { "NPC_FurySister_01_Assist" },
	AddAssist =
	{
		--FunctionName = "MakariaAssist",
		WeaponName = "FlurrySpawnerWeapon",
		Range = 1500,
		GameStateRequirements = {
			CurrentRoomValueFalse = "BlockHadesAssistTraits",
		},
		AssistPresentationPortrait = "Portrait_Makaria_Default_01",
		AssistPresentationPortraitOffsetY = 55,
		AssistPresentationColor = { 200, 0, 255, 255 },
		AssistPostWeaponSlowDuration = 0.1,
	},
	PropertyChanges =
	{
		{
			WeaponName = "FlurrySpawnerWeapon",
			ProjectileProperty = "DamageLow",
			ChangeValue = 100,
			DepthMult = DepthDamageMultiplier,
			IdenticalMultiplier =
			{
				Value = DuplicateStrongMultiplier,
			},
			ExtractValue =
			{
				ExtractAs = "TooltipDamage",
			}
		},
		{
			WeaponName = "FlurrySpawnerWeapon",
			ProjectileProperty = "DamageHigh",
			DeriveValueFrom = "DamageLow"
		},
	},
	RemainingUses = { BaseValue = 1 },
	ExtractValues =
	{
		{
			Key = "RemainingUses",
			ExtractAs = "TooltipKeepsakeUses",
		},
	},
	SignOffData =
	{
		{
			Text = "MakariaSignoff",
		},
		{
			RequiredTextLines = { "MakariaGift06" },
			Text = "MakariaSignoff_AssistMax"
		}
	},
}
OlympusAssistUpgradeData.MakariaAssistTrait = {
	Costs = { 1, 2, 3, 4, 5, },
}
table.insert(OlympusGiftOrdering, "MakariaAssistTrait")
table.insert(OlympusCodexOrdering.Keepsakes.Order, "MakariaAssistTrait")

OlympusCodex.Keepsakes.Entries["MakariaAssistTrait"] =
{
	Entries =
	{
		{
			UnlockThreshold = 1,
			Text = "CodexData_MakariaAssistTrait_01",
		},
		{
			UnlockThreshold = 10,
			Text = "CodexData_MakariaAssistTrait_02",
		},
	},
	Image = "Codex_Portrait_MakariaAssistTrait",
}
-- Codex Section
table.insert(OlympusCodexOrdering.ChthonicGods.Order, "NPC_Makaria_01")
OlympusCodex.ChthonicGods.Entries["NPC_Makaria_01"] =
{
	Entries =
	{
		{
			UnlockThreshold = 1,
			Text = "CodexData_Makaria_01"
		},
		{
			UnlockThreshold = 5,
			Text = "CodexData_Makaria_02"
		},
		{
			UnlockThreshold = 15,
			Text = "CodexData_Makaria_03"
		}
	},
	Image = "Codex_Portrait_Makaria",
}
OlympusGiftData.NPC_Makaria_01 =
{
	Gift = true,
	InheritFrom = { "DefaultGiftData" },
	Name = "NPC_Makaria_01",
	MaxedIcon = "Keepsake_Makaria_Max",
	MaxedSticker = "Keepsake_Makaria_Max",
	MaxedRequirement = { RequiredTextLines = { "MakariaGift06" }, },
	Locked = 4,
	Maximum = 6,
	[1] = { Gift = "TroveUpgradeBoonTrait" },
	[3] = { Gift = "MakariaAssistTrait" },
	[4] = { RequiredResource = "SuperGiftPoints" },
	--[4] = { Gift = "MakariaAssistTrait", RequiredResource = "SuperGiftPoints" },
	[5] = { RequiredResource = "SuperGiftPoints" },
	[6] = { RequiredResource = "SuperGiftPoints" },
	UnlockGameStateRequirements = { RequiredTextLines = { "MelinoeGift05" } }
}

table.insert(OlympusGiftOrdering, 8, "TroveUpgradeBoonTrait")
table.insert(OlympusDeathLoopData.DeathArea.StartUnthreadedEvents, {
	FunctionName = "SpawnExtraNPCs",
	GameStateRequirements =
	{
		RequiredFalseFlags = { "InFlashback" },
	},
	Args =
	{
		Name = "NPC_Makaria_01",
		SpawnPointId = 370036,
		SpawnChance = 0.9,
		Angle = 270,
	},
})
-- Code for ChallengeSwitch modification
ModUtil.Path.Wrap("HandleChallengeLootDecay",
	function(baseFunc, challengeSwitch, challengeEncounter)
		if challengeSwitch.RewardType == "ExtraChance" or challengeSwitch.RewardType == "Boon" or challengeSwitch.RewardType == "CentaurHeart"
			or challengeSwitch.RewardType == "StackUpgrade" or challengeSwitch.RewardType == "GiftDrop" or challengeSwitch.RewardType == "QuestItemTartarus" then
			challengeEncounter.MinValue = 0
		end
		baseFunc(challengeSwitch, challengeEncounter)
	end
)
ModUtil.Path.Wrap("HandleChallengeLoot",
	function(baseFunc, challengeSwitch, challengeEncounter)
		baseFunc(challengeSwitch, challengeEncounter)
		if challengeEncounter ~= nil then
			if CurrentRun.SwitchChallengeReward == nil then
				CurrentRun.SwitchChallengeReward = {
					Money = 0,
					Health = 0,
					MetaPoints = 0,
					Gems = 0,
					ExtraChance = 0,
					Boon = 0,
					CentaurHeart = 0,
					StackUpgrade = 0,
					GiftDrop = 0,
					QuestItemTartarus = 0,
					QuestItemAsphodel = 0,
					QuestItemElysium = 0,
					QuestItemStyx = 0,
				}
			end
			if GameState.CompletedSwitchChallengeReward == nil then
				GameState.CompletedSwitchChallengeReward = {
					Money = 0,
					Health = 0,
					MetaPoints = 0,
					Gems = 0,
					ExtraChance = 0,
					Boon = 0,
					CentaurHeart = 0,
					StackUpgrade = 0,
					GiftDrop = 0,
					QuestItemTartarus = 0,
					QuestItemAsphodel = 0,
					QuestItemElysium = 0,
					QuestItemStyx = 0,
					Failed = 0,
				}
			end
			if challengeSwitch.RewardType == "Money" then
				CurrentRun.SwitchChallengeReward.Money = CurrentRun.SwitchChallengeReward.Money + 1
				GameState.CompletedSwitchChallengeReward.Money = GameState.CompletedSwitchChallengeReward.Money + 1
			elseif challengeSwitch.RewardType == "Health" then
				CurrentRun.SwitchChallengeReward.Health = CurrentRun.SwitchChallengeReward.Health + 1
				GameState.CompletedSwitchChallengeReward.Health = GameState.CompletedSwitchChallengeReward.Health + 1
			elseif challengeSwitch.RewardType == "MetaPoints" then
				CurrentRun.SwitchChallengeReward.MetaPoints = CurrentRun.SwitchChallengeReward.MetaPoints + 1
				GameState.CompletedSwitchChallengeReward.MetaPoints = GameState.CompletedSwitchChallengeReward
				.MetaPoints + 1
			elseif challengeSwitch.RewardType == "Gems" then
				CurrentRun.SwitchChallengeReward.Gems = CurrentRun.SwitchChallengeReward.Gems + 1
				GameState.CompletedSwitchChallengeReward.Gems = GameState.CompletedSwitchChallengeReward.Gems + 1
			elseif challengeSwitch.RewardType == "QuestItemTartarus" then
				CurrentRun.SwitchChallengeReward.Gems = CurrentRun.SwitchChallengeReward.Gems + 1
				GameState.CompletedSwitchChallengeReward.Gems = GameState.CompletedSwitchChallengeReward.Gems + 1
			end

			local angle = GetAngleBetween({ Id = challengeSwitch.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
			if challengeSwitch.CurrentValue == 0 then
				GameState.CompletedSwitchChallengeReward.Failed = GameState.CompletedSwitchChallengeReward.Failed + 1
				GiveRandomConsumables({
					Delay = 0.2,
					NotRequiredPickup = true,
					LootOptions =
					{
						{
							Name = "RoomRewardConsolationPrize",
							Chance = 1,
						}
					}
				})
			else
				if challengeSwitch.RewardType == "ExtraChance" then
					CurrentRun.SwitchChallengeReward.ExtraChance = CurrentRun.SwitchChallengeReward.ExtraChance + 1
					GameState.CompletedSwitchChallengeReward.ExtraChance = GameState.CompletedSwitchChallengeReward
						.ExtraChance + 1
					AddLastStand({
						Name = "ExtraChanceReplenishMetaUpgrade",
						Unit = CurrentRun.Hero,
						Icon = "ExtraLifeReplenish",
						WeaponName = "LastStandMetaUpgradeShield",
						HealFraction = MetaUpgradeData.ExtraChanceReplenishMetaUpgrade.HealPercent,
						Silent = true
					})
				elseif challengeSwitch.RewardType == "Boon" then
					CurrentRun.SwitchChallengeReward.Boon = CurrentRun.SwitchChallengeReward.Boon + 1
					GameState.CompletedSwitchChallengeReward.Boon = GameState.CompletedSwitchChallengeReward.Boon + 1
					local reward = GiveLoot({ SpawnPoint = CurrentRun.Hero.ObjectId })
					ApplyUpwardForce({ Id = reward.Id, Speed = RandomFloat(500, 700) })
					ApplyForce({ Id = reward.Id, Speed = RandomFloat(50, 100), Angle = angle, SelfApplied = true })
				elseif challengeSwitch.RewardType == "CentaurHeart" then
					CurrentRun.SwitchChallengeReward.CentaurHeart = CurrentRun.SwitchChallengeReward.CentaurHeart + 1
					GameState.CompletedSwitchChallengeReward.CentaurHeart = GameState.CompletedSwitchChallengeReward
						.CentaurHeart + 1
					GiveRandomConsumables({
						Delay = 0.2,
						NotRequiredPickup = true,
						LootOptions =
						{
							{
								Name = "CentaurHeart",
								Chance = 1,
							}
						}
					})
				elseif challengeSwitch.RewardType == "StackUpgrade" then
					CurrentRun.SwitchChallengeReward.StackUpgrade = CurrentRun.SwitchChallengeReward.StackUpgrade + 1
					GameState.CompletedSwitchChallengeReward.StackUpgrade = GameState.CompletedSwitchChallengeReward
						.StackUpgrade + 1
					local reward = CreateStackLoot({ SpawnPoint = CurrentRun.Hero.ObjectId, Cost = 0, DoesNotBlockExit = false, StackNum = 1 })
					ApplyUpwardForce({ Id = reward.Id, Speed = RandomFloat(500, 700) })
					ApplyForce({ Id = reward.Id, Speed = RandomFloat(50, 100), Angle = angle, SelfApplied = true })
				elseif challengeSwitch.RewardType == "GiftDrop" then
					CurrentRun.SwitchChallengeReward.GiftDrop = CurrentRun.SwitchChallengeReward.GiftDrop + 1
					GameState.CompletedSwitchChallengeReward.GiftDrop = GameState.CompletedSwitchChallengeReward
						.GiftDrop + 1
					local dropItemName = "GiftDrop"
					if GameState.Cosmetics and GameState.Cosmetics.GiftDropRunProgress then
						dropItemName = "GiftDropRunProgress"
					end
					GiveRandomConsumables({
						Delay = 0.2,
						NotRequiredPickup = true,
						LootOptions =
						{
							{
								Name = dropItemName,
								Chance = 1,
							}
						}
					})
				elseif challengeSwitch.RewardType == "QuestItemTartarus" or challengeSwitch.RewardType == "QuestItemAsphodel" or
					challengeSwitch.RewardType == "QuestItemElysium" or challengeSwitch.RewardType == "QuestItemStyx" then
					CurrentRun.SwitchChallengeReward[challengeSwitch.RewardType] = CurrentRun.SwitchChallengeReward
						[challengeSwitch.RewardType] + 1
					GameState.CompletedSwitchChallengeReward[challengeSwitch.RewardType] = GameState
						.CompletedSwitchChallengeReward[challengeSwitch.RewardType] + 1
					local currentAmount = GameState.CompletedSwitchChallengeReward["QuestItemTartarus"] + GameState.CompletedSwitchChallengeReward["QuestItemAsphodel"] + GameState.CompletedSwitchChallengeReward["QuestItemElysium"] + GameState.CompletedSwitchChallengeReward["QuestItemStyx"]
					DisplayUnlockText({
						TitleText = "StoneOfBanishmentQuestPiece_Unlocked",
						SubtitleText = "StoneOfBanishmentQuestPiece_Unlocked_Subtitle",
						SubtitleData = { LuaKey = "TempTextData", LuaValue = { CurrentAmount = 12-currentAmount }},
						AnimationName = "LocationTextBGGeneric_Mirror",
						AnimationOutName = "LocationTextBGGenericOut_Mirror",
						-- Duration = 4.5,
					})
					--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Stone complete"))
				end
			end
		end
	end
)
--[[function MakariaAssist()
	local enemyName = "TrainingMeleeSummon"
	local enemyData = EnemyData[enemyName]
	local newEnemy = DeepCopyTable( enemyData )
	newEnemy.BlocksLootInteraction = false

	local invaderSpawnPoint = CurrentRun.Hero.ObjectId
	newEnemy.ObjectId = SpawnUnit({
			Name = enemyData.Name,
			Group = "Standing",
			DestinationId = invaderSpawnPoint, OffsetX = 0, OffsetY = 0 })

	SetupEnemyObject( newEnemy, CurrentRun )

	CurrentRun.CurrentRoom.TauntTargetId = newEnemy.ObjectId
end]]
function BedroomMoveTowardMakariaApproach(source, args)
	wait(1.0)

	AddInputBlock({ Name = "MoveHeroToRoomPosition" })
	local initialSpeed = GetUnitDataValue({ Id = CurrentRun.Hero.ObjectId, Property = "Speed", Destination })
	SetUnitProperty({ DestinationId = CurrentRun.Hero.ObjectId, Property = "CollideWithObstacles", Value = false })
	SetUnitProperty({ Property = "StartGraphic", Value = nil, DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "MoveGraphic", Value = "ZagreusWalk", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "Speed", Value = 160, DestinationId = CurrentRun.Hero.ObjectId })

	Move({ Id = CurrentRun.Hero.ObjectId, DestinationId = 422258, Mode = "Precise" })

	local notifyName = "ApproachStopped"
	NotifyOnStopped({ Id = CurrentRun.Hero.ObjectId, Notify = notifyName })
	waitUntil(notifyName)

	SetUnitProperty({ Property = "StartGraphic", Value = "ZagreusStart", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "MoveGraphic", Value = "ZagreusRun", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "Speed", Value = initialSpeed, DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "CollideWithObstacles", Value = true, DestinationId = CurrentRun.Hero.ObjectId })
	RemoveInputBlock({ Name = "MoveHeroToRoomPosition" })

	wait(0.1)

	AngleTowardTarget({ Id = CurrentRun.Hero.ObjectId, DestinationId = 422256 })
end

-- Common Troves
local OlympusObstacleData = ModUtil.Entangled.ModData(ObstacleData)
OlympusObstacleData.MoneyChallengeSwitch.Requirements.RequiredFalseTrait = "TroveUpgradeBoonTrait"
OlympusObstacleData.MakariaMoneyChallengeSwitch =
{
	InheritFrom = { "ChallengeSwitch" },
	ChallengeAvailableUseText = "UseChallengeSwitch_Unlocked",
	ChallengeResolvedUseText = "UseChallengeSwitch_MoneyRewardAvailable",
	RewardMultiplier = 1.50,
	IntervalMultiplier = 0.4,
	Requirements =
	{
		RequiredTrait = "TroveUpgradeBoonTrait",
		RequiredCosmetics = { "ChallengeSwitches1" },
		RequiredFalseCosmetics = { "ChallengeSwitches2" },
	},
}

OlympusObstacleData.MoneyChallengeSwitch2.Requirements.RequiredFalseTrait = "TroveUpgradeBoonTrait"
OlympusObstacleData.MakariaMoneyChallengeSwitch2 =
{
	InheritFrom = { "MoneyChallengeSwitch" },
	RewardMultiplier = 1.75,
	IntervalMultiplier = 0.3,
	DifficultyModifier = 1.3,
	Requirements =
	{
		RequiredTrait = "TroveUpgradeBoonTrait",
		RequiredCosmetics = { "ChallengeSwitches2" },
		RequiredFalseCosmetics = { "ChallengeSwitches3" },
	},
}

OlympusObstacleData.MoneyChallengeSwitch3.Requirements.RequiredFalseTrait = "TroveUpgradeBoonTrait"
OlympusObstacleData.MakariaMoneyChallengeSwitch3 =
{
	InheritFrom = { "MoneyChallengeSwitch" },
	RewardMultiplier = 2.00,
	IntervalMultiplier = 0.2,
	DifficultyModifier = 1.6,
	Requirements =
	{
		RequiredTrait = "TroveUpgradeBoonTrait",
		RequiredCosmetics = { "ChallengeSwitches3" },
	},
}
OlympusObstacleData.HealthChallengeSwitch.Requirements.RequiredFalseTrait = "TroveUpgradeBoonTrait"
OlympusObstacleData.MakariaHealthChallengeSwitch =
{
	InheritFrom = { "ChallengeSwitch" },
	ChallengeText = "ChallengeSwitch_HealthValue",
	ChallengeAvailableUseText = "UseHealthChallengeSwitch_Unlocked",
	ChallengeResolvedUseText = "UseChallengeSwitch_HealthRewardAvailable",
	RewardType = "Health",
	RewardMultiplier = 1.50,
	IntervalMultiplier = 0.4,
	DifficultyModifier = 0.7,
	Requirements =
	{
		RequiredTrait = "TroveUpgradeBoonTrait",
		RequiredCosmetics = { "ChallengeSwitches1" },
		RequiredFalseCosmetics = { "ChallengeSwitches2" },
	},
}
OlympusObstacleData.HealthChallengeSwitch2.Requirements.RequiredFalseTrait = "TroveUpgradeBoonTrait"
OlympusObstacleData.MakariaHealthChallengeSwitch2 =
{
	InheritFrom = { "HealthChallengeSwitch" },
	RewardMultiplier = 1.75,
	DifficultyModifier = 1.2,
	IntervalMultiplier = 0.3,
	Requirements =
	{
		RequiredTrait = "TroveUpgradeBoonTrait",
		RequiredCosmetics = { "ChallengeSwitches2" },
		RequiredFalseCosmetics = { "ChallengeSwitches3" },
	},
}
OlympusObstacleData.HealthChallengeSwitch3.Requirements.RequiredFalseTrait = "TroveUpgradeBoonTrait"
OlympusObstacleData.MakariaHealthChallengeSwitch3 =
{
	InheritFrom = { "HealthChallengeSwitch" },
	RewardMultiplier = 2.0,
	DifficultyModifier = 1.4,
	IntervalMultiplier = 0.2,
	Requirements =
	{
		RequiredTrait = "TroveUpgradeBoonTrait",
		RequiredCosmetics = { "ChallengeSwitches3" },
	},
}
OlympusObstacleData.DarknessChallengeSwitch.Requirements.RequiredFalseTrait = "TroveUpgradeBoonTrait"
OlympusObstacleData.MakariaDarknessChallengeSwitch =
{
	InheritFrom = { "ChallengeSwitch" },
	UseText = "UseChallengeSwitch_Locked",
	ChallengeText = "ChallengeSwitch_DarknessValue",
	ChallengeAvailableUseText = "UseDarknessChallengeSwitch_Unlocked",
	ChallengeResolvedUseText = "UseChallengeSwitch_DarknessRewardAvailable",
	RewardMultiplier = 1.0,
	RewardType = "MetaPoints",
	IntervalMultiplier = 0.9,
	DifficultyModifier = 0.7,
	Requirements =
	{
		RequiredTrait = "TroveUpgradeBoonTrait",
		RequiredCosmetics = { "ChallengeSwitches1" },
		RequiredFalseCosmetics = { "ChallengeSwitches2" },
	},
}

OlympusObstacleData.DarknessChallengeSwitch2.Requirements.RequiredFalseTrait = "TroveUpgradeBoonTrait"
OlympusObstacleData.MakariaDarknessChallengeSwitch2 =
{
	InheritFrom = { "DarknessChallengeSwitch" },
	RewardMultiplier = 1.50,
	IntervalMultiplier = 0.6,
	Requirements =
	{
		RequiredTrait = "TroveUpgradeBoonTrait",
		RequiredCosmetics = { "ChallengeSwitches2" },
		RequiredFalseCosmetics = { "ChallengeSwitches3" },
	},
}

OlympusObstacleData.DarknessChallengeSwitch3.Requirements.RequiredFalseTrait = "TroveUpgradeBoonTrait"
OlympusObstacleData.MakariaDarknessChallengeSwitch3 =
{
	InheritFrom = { "DarknessChallengeSwitch" },
	RewardMultiplier = 2.0,
	IntervalMultiplier = 0.3,
	Requirements =
	{
		RequiredTrait = "TroveUpgradeBoonTrait",
		RequiredCosmetics = { "ChallengeSwitches3" },
	},
}

OlympusObstacleData.GemChallengeSwitch.Requirements.RequiredFalseTrait = "TroveUpgradeBoonTrait"
OlympusObstacleData.MakariaGemChallengeSwitch =
{
	InheritFrom = { "ChallengeSwitch" },
	UseText = "UseChallengeSwitch_Locked",
	ChallengeText = "ChallengeSwitch_GemValue",
	ChallengeAvailableUseText = "UseGemChallengeSwitch_Unlocked",
	ChallengeResolvedUseText = "UseChallengeSwitch_GemRewardAvailable",
	RewardMultiplier = 0.75,
	RewardType = "Gems",
	IntervalMultiplier = 1.4,
	DifficultyModifier = 0.7,
	Requirements =
	{
		RequiredTrait = "TroveUpgradeBoonTrait",
		RequiredCosmetics = { "ChallengeSwitches1" },
		RequiredFalseCosmetics = { "ChallengeSwitches2" },
	},
}
OlympusObstacleData.GemChallengeSwitch2.Requirements.RequiredFalseTrait = "TroveUpgradeBoonTrait"
OlympusObstacleData.MakariaGemChallengeSwitch2 =
{
	InheritFrom = { "GemChallengeSwitch" },
	RewardMultiplier = 1.0,
	IntervalMultiplier = 0.9,
	DifficultyModifier = 1.1,
	Requirements =
	{
		RequiredTrait = "TroveUpgradeBoonTrait",
		RequiredCosmetics = { "ChallengeSwitches2" },
		RequiredFalseCosmetics = { "ChallengeSwitches3" },
	},
}

OlympusObstacleData.GemChallengeSwitch3.Requirements.RequiredFalseTrait = "TroveUpgradeBoonTrait"
OlympusObstacleData.MakariaGemChallengeSwitch3 =
{
	InheritFrom = { "GemChallengeSwitch" },
	RewardMultiplier = 1.25,
	IntervalMultiplier = 0.5,
	DifficultyModifier = 1.4,
	Requirements =
	{
		RequiredTrait = "TroveUpgradeBoonTrait",
		RequiredCosmetics = { "ChallengeSwitches3" },
	},
}
-- Rare Trove
OlympusObstacleData.MakariaExtraChanceChallengeSwitch =
{
	InheritFrom = { "ChallengeSwitch" },
	UseText = "UseChallengeSwitch_Locked",
	ChallengeText = "ChallengeSwitch_ExtraChanceValue",
	ChallengeAvailableUseText = "UseExtraChanceChallengeSwitch_Unlocked",
	ChallengeResolvedUseText = "UseChallengeSwitch_ExtraChanceRewardAvailable",
	RewardMultiplier = 0.2,
	RewardType = "ExtraChance",
	IntervalMultiplier = 1.1,
	DifficultyModifier = 1.8,
	Requirements =
	{
		RequiredMinMaximumLastStands = 1,
		NotMaxLastStands = true,
		RequiredTrait = "TroveUpgradeBoonTrait",
		RequiredCosmetics = { "ChallengeSwitches1" },
		RequiredMaxAdvancedChallengeSwitchThisRun = 5,
		RequiredMaxExtraChanceChallengeSwitchThisRun = 1,
	},
}

OlympusObstacleData.MakariaBoonChallengeSwitch =
{
	InheritFrom = { "ChallengeSwitch" },
	UseText = "UseChallengeSwitch_Locked",
	ChallengeText = "ChallengeSwitch_BoonValue",
	ChallengeAvailableUseText = "UseBoonChallengeSwitch_Unlocked",
	ChallengeResolvedUseText = "UseChallengeSwitch_BoonRewardAvailable",
	RewardMultiplier = 0.3,
	RewardType = "Boon",
	IntervalMultiplier = 0.8,
	DifficultyModifier = 1.8,
	Requirements =
	{
		RequiredTrait = "TroveUpgradeBoonTrait",
		RequiredCosmetics = { "ChallengeSwitches1" },
		RequiredMaxAdvancedChallengeSwitchThisRun = 5,
		RequiredMaxBoonChallengeSwitchThisRun = 2,
	},
}

OlympusObstacleData.MakariaCentaurHeartChallengeSwitch =
{
	InheritFrom = { "ChallengeSwitch" },
	UseText = "UseChallengeSwitch_Locked",
	ChallengeText = "ChallengeSwitch_CentaurHeartValue",
	ChallengeAvailableUseText = "UseCentaurHeartChallengeSwitch_Unlocked",
	ChallengeResolvedUseText = "UseChallengeSwitch_CentaurHeartRewardAvailable",
	RewardMultiplier = 0.3,
	RewardType = "CentaurHeart",
	IntervalMultiplier = 0.8,
	DifficultyModifier = 1.6,
	Requirements =
	{
		RequiredTrait = "TroveUpgradeBoonTrait",
		RequiredCosmetics = { "ChallengeSwitches1" },
		RequiredMaxAdvancedChallengeSwitchThisRun = 5,
		RequiredMaxCentaurHeartChallengeSwitchThisRun = 2,
	},
}

OlympusObstacleData.MakariaStackUpgradeChallengeSwitch =
{
	InheritFrom = { "ChallengeSwitch" },
	UseText = "UseChallengeSwitch_Locked",
	ChallengeText = "ChallengeSwitch_StackUpgradeValue",
	ChallengeAvailableUseText = "UseStackUpgradeChallengeSwitch_Unlocked",
	ChallengeResolvedUseText = "UseChallengeSwitch_StackUpgradeRewardAvailable",
	RewardMultiplier = 0.3,
	RewardType = "StackUpgrade",
	IntervalMultiplier = 0.8,
	DifficultyModifier = 1.6,
	Requirements =
	{
		RequiredTrait = "TroveUpgradeBoonTrait",
		RequiredCosmetics = { "ChallengeSwitches1" },
		RequiredMaxAdvancedChallengeSwitchThisRun = 5,
		RequiredMaxStackUpgradeChallengeSwitchThisRun = 3,
	},
}

OlympusObstacleData.MakariaGiftDropChallengeSwitch =
{
	InheritFrom = { "ChallengeSwitch" },
	UseText = "UseChallengeSwitch_Locked",
	ChallengeText = "ChallengeSwitch_GiftDropValue",
	ChallengeAvailableUseText = "UseGiftDropChallengeSwitch_Unlocked",
	ChallengeResolvedUseText = "UseChallengeSwitch_GiftDropRewardAvailable",
	RewardMultiplier = 0.3,
	RewardType = "GiftDrop",
	IntervalMultiplier = 0.8,
	DifficultyModifier = 1.8,
	Requirements =
	{
		RequiredTrait = "TroveUpgradeBoonTrait",
		RequiredCosmetics = { "ChallengeSwitches1" },
		RequiredMaxAdvancedChallengeSwitchThisRun = 5,
		RequiredMaxGiftDropChallengeSwitchThisRun = 1,
	},
}

-- Quest Trove
OlympusObstacleData.MakariaTartarusQuestChallengeSwitch =
{
	InheritFrom = { "ChallengeSwitch" },
	UseText = "UseChallengeSwitch_Locked",
	ChallengeText = "ChallengeSwitch_QuestItemValue",
	ChallengeAvailableUseText = "UseQuestItemChallengeSwitch_Unlocked",
	ChallengeResolvedUseText = "UseChallengeSwitch_QuestItemRewardAvailable",
	RewardMultiplier = 0.2,
	RewardType = "QuestItemTartarus",
	IntervalMultiplier = 1.1,
	DifficultyModifier = 2.2,
	Requirements =
	{
		RequiredMaxChallengeSwitchQuestItemTartarus = 3,
		RequiredTextLines = { "MakariaStartBanishmentQuest" }
	},
}
OlympusObstacleData.MakariaAsphodelQuestChallengeSwitch =
{
	InheritFrom = { "ChallengeSwitch" },
	UseText = "UseChallengeSwitch_Locked",
	ChallengeText = "ChallengeSwitch_QuestItemValue",
	ChallengeAvailableUseText = "UseQuestItemChallengeSwitch_Unlocked",
	ChallengeResolvedUseText = "UseChallengeSwitch_QuestItemRewardAvailable",
	RewardMultiplier = 0.2,
	RewardType = "QuestItemAsphodel",
	IntervalMultiplier = 1.1,
	DifficultyModifier = 2.2,
	Requirements =
	{
		RequiredMaxChallengeSwitchQuestItemAsphodel = 3,
		RequiredTextLines = { "MakariaStartBanishmentQuest" }
	},
}
OlympusObstacleData.MakariaElysiumQuestChallengeSwitch =
{
	InheritFrom = { "ChallengeSwitch" },
	UseText = "UseChallengeSwitch_Locked",
	ChallengeText = "ChallengeSwitch_QuestItemValue",
	ChallengeAvailableUseText = "UseQuestItemChallengeSwitch_Unlocked",
	ChallengeResolvedUseText = "UseChallengeSwitch_QuestItemRewardAvailable",
	RewardMultiplier = 0.2,
	RewardType = "QuestItemElysium",
	IntervalMultiplier = 1.1,
	DifficultyModifier = 2.2,
	Requirements =
	{
		RequiredMaxChallengeSwitchQuestItemElysium = 3,
		RequiredTextLines = { "MakariaStartBanishmentQuest" }
	},
}
OlympusObstacleData.MakariaStyxQuestChallengeSwitch =
{
	InheritFrom = { "ChallengeSwitch" },
	UseText = "UseChallengeSwitch_Locked",
	ChallengeText = "ChallengeSwitch_QuestItemValue",
	ChallengeAvailableUseText = "UseQuestItemChallengeSwitch_Unlocked",
	ChallengeResolvedUseText = "UseChallengeSwitch_QuestItemRewardAvailable",
	RewardMultiplier = 0.2,
	RewardType = "QuestItemStyx",
	IntervalMultiplier = 1.1,
	DifficultyModifier = 2.2,
	Requirements =
	{
		RequiredMaxChallengeSwitchQuestItemStyx = 3,
		RequiredTextLines = { "MakariaStartBanishmentQuest" }
	},
}

local OlympusEncounterSets = ModUtil.Entangled.ModData(EncounterSets)
ModUtil.Table.Merge(OlympusEncounterSets.ChallengeOptions, {
	--[["MakariaMoneyChallengeSwitch",
	"MakariaMoneyChallengeSwitch2",
	"MakariaMoneyChallengeSwitch3",
	"MakariaHealthChallengeSwitch",
	"MakariaHealthChallengeSwitch2",
	"MakariaHealthChallengeSwitch3",
	"MakariaDarknessChallengeSwitch",
	"MakariaDarknessChallengeSwitch2",
	"MakariaDarknessChallengeSwitch3",
	"MakariaGemChallengeSwitch",
	"MakariaGemChallengeSwitch2",
	"MakariaGemChallengeSwitch3",]]
	"MakariaExtraChanceChallengeSwitch",
	"MakariaBoonChallengeSwitch",
	"MakariaCentaurHeartChallengeSwitch",
	"MakariaStackUpgradeChallengeSwitch",
	"MakariaGiftDropChallengeSwitch",
	--"MakariaQuestChallengeSwitch",
})
-- Styx Management
OlympusRoomSetData.Styx.D_Reprieve01.EnterVoiceLines[1].RequiredFalseTrait = "TroveUpgradeBoonTrait"
OlympusRoomSetData.Styx.D_Reprieve01.GameStateRequirements = { RequiredMinWingDepth = 3, RequiredSpecialStyxTroveCondition = { RequiredTraitName = "TroveUpgradeBoonTrait", RequiredMinBiomeDepth = 7 } }
OlympusGlobalVoiceLines.ForkingPathVoiceLines[3].RequiredFalseTrait = "TroveUpgradeBoonTrait"
OverwriteTableKeys(OlympusRoomData, OlympusRoomSetData.Styx)


function MakariaThanatosExit(source, args)
	ThanatosExit(source, args)
	wait(0.5)
	MakariaExit(source, args)
end

function MakariaExit(source, args)
	args = args or {}
	if args.UseMaxedPresentation then
		AddInputBlock({ Name = "MakariaExit" })
	end
	UseableOff({ Id = source.ObjectId })
	source.CanReceiveGift = false
	source.InteractTextLineSets = nil
	wait(args.WaitTime or 0)

	SetAnimation({ Name = "NPCThanatosExit", DestinationId = source.ObjectId })
	CreateAnimation({ Name = "ThanatosTeleport", DestinationId = source.ObjectId })
	SetAlpha({ Id = source.ObjectId, Fraction = 0.0, Duration = 0.35 })
	AdjustColorGrading({ Name = "Thanatos", Duration = 0.25 })

	if not args.IgnoreMusic then
		StopSecretMusic(true)
	end

	source.NextInteractLines = nil
	RefreshUseButton(source.ObjectId, source)
	StopStatusAnimation(source)

	if not args.SkipExitReaction then
		thread(PlayVoiceLines, HeroVoiceLines.ThanatosExitReactionVoiceLines, true)
	end

	wait(0.5, RoomThreadName)
	AdjustColorGrading({ Name = "Off", Duration = 1.35 })

	--[[if args.UseMaxedPresentation then
		MaxedRelationshipPresentation( source, { Text = "NPC_Thanatos_01", Icon = "Keepsake_ThanatosSticker_Max" } )
	end]]

	--[[source.Mute = true
	CurrentRun.EventState[source.ObjectId] = { FunctionName = "ThanatosExitSilent", Args = args }]]

	if args.UseMaxedPresentation then
		RemoveInputBlock({ Name = "MakariaExit" })
	end

	wait(1.0, RoomThreadName)

	if ActivatedObjects[source.ObjectId] ~= nil and not CurrentRun.Hero.IsDead then
		ActivatedObjects[source.ObjectId] = nil
		wait(0.2, RoomThreadName)
		if CheckRoomExitsReady(CurrentRun.CurrentRoom) then
			UnlockRoomExits(CurrentRun, CurrentRun.CurrentRoom)
		end
	end
end
