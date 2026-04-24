local OlympusRoomSetData = ModUtil.Entangled.ModData(RoomSetData)
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
OlympusColor.MelinoeVoice = { 93,19,52,255 }
-- 3DGhostAltIdle for the Hypnos discussion
local OlympusEnemyData = ModUtil.Entangled.ModData(EnemyData)
OlympusEnemyData.NPC_Melinoe_01 =
{
	InheritFrom = { "NPC_Neutral", "NPC_Giftable" },
	Name = "NPC_Melinoe_01",
	UseText = "UseTalkToFemaleGhost",
	Portrait = "Portrait_Melinoe_Default_01",
	AnimOffsetZ = 205,
	EmoteOffsetX = 50,
	EmoteOffsetY = -200,

	Groups = { "NPCs" },
	SubtitleColor = Color.MelinoeVoice,

	Binks =
	{
		"CthonicIdle_Bink",
	},

	ActivateRequirements =
	{
		--RequiredCompletedRuns = 5,
		RequiredTextLines = { "HadesWithMakariaAndMelinoe01" },
		RequiredFalseTextLinesThisRun = { "HadesWithMakariaAndMelinoe01" },
		--RequiredFalseTextLinesThisRun = GameData.NyxWithChaosTextLines,
		RequiredFalseFlags = { "InFlashback", },
	},
	LocationsById = {
		[370046] = { -- DeathArea/ Near Office
			LocationX = 3574.027588,
			LocationY = 3885.013672,
		},
	},
	InteractTextLineSets =
	{
		MelinoeFirstMeeting =
		{
			Name = "MelinoeFirstMeeting",
			PlayOnce = true,
			UseableOffSource = true,
			{ Cue = "/VO/Melinoe_0001",
				Text = "Zagreus, I wanted to thank you on our behave for assisting us. My sister and I wouldn't have been welcomed without your intervention. We are only here because you made it happen." },
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "I will always there to help friends or strangers. Still, I am not sure how you know so much about me." },
			{ Cue = "/VO/Melinoe_0001",
				Text = "You know, from here and there. But girls has to keep a few secrets, right? Don't worry to much. We just wanted to thanks." },
		},
		MelinoeAboutTimetravel01 =
		{
			Name = "MelinoeAboutTimetravel01",
			PlayOnce = true,
			UseableOffSource = true,
			RequiredTextLines = {"MelinoeFirstMeeting"},
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "Melinoë. You never mentioned where you were coming from. You told me your came from far away. Did you mean the surface and beyond? Or maybe deeper than the depth of Erebus?" },
			{ Cue = "/VO/Melinoe_0001",
				Text = "It's... It's a long story. One day I hope to be able to tell it and you can tell me about your adventure as well. Right now, might not be the right time. Let me think more before I tell you my story. I need to be sure." },
		},
		MelinoeAboutTimetravel02 =
		{
			Name = "MelinoeAboutTimetravel02",
			PlayOnce = true,
			UseableOffSource = true,
			RequiredTextLines = {"MelinoeFirstMeeting", "MelinoeAboutTimetravel01", "PersephoneMeeting02"},
			{ Cue = "/VO/Melinoe_0001",
				Text = "Prince... I've been thinking. You asked me about my origins, are you aware of story between your father and his father Chronos?" },
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "I heard the name once or twice. God of Time, Not very friendly from what I heard. Last time I heard he's imprisoned somewhere no one speaks of." },
			{ Cue = "/VO/Melinoe_0001",
				Text = "He is. And he should stay there for as long as possible... But that's not what I wanted to talk about. I encountered him at some point. Learned a few spells from him. And there goes my sister and I. Do you see what I mean?" },
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "I can't say that I do... What spell did you learn? I though you said he was locked up. How could you have met him?" },
			{ Cue = "/VO/Melinoe_0001",
				Text = "{#DialogueItalicFormat}Sign{#PreviousFormat}. This is what I mean by it's {#DialogueItalicFormat}complicated{#PreviousFormat}. You know what, I'll think of another way to explain it. Talk to you later." },
		},
		MelinoeAboutTimetravel03 =
		{
			Name = "MelinoeAboutTimetravel03",
			PlayOnce = true,
			UseableOffSource = true,
			RequiredTextLines = {"MelinoeFirstMeeting"},
			MinRunsSinceAnyTextLines = { TextLines = { "MelinoeAboutTimetravel02" }, Count = 5 },
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "Melinoë! I think I started to understand what you meant by mentioning Chronos. You were not trying to tell me where you were coming from, but rather when?" },
			{ Cue = "/VO/Melinoe_0001",
				Text = "Yes... Makaria and I, we used one of Chronos' incantation and we went too far in time. Leading us to now, weaken. I didn't know what impact this would have in our timeline if I were to tell you. You never mention any of this in our timeline." }, 
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "I am starting to understand why you hesitated to tell me. That means we meet in the future? I can try to not mention any of this to your future self if that can keep your timeline safe." },
			{ Cue = "/VO/Melinoe_0001",
				Text = "{#DialogueItalicFormat}Oh{#PreviousFormat}, we meet.? I already feel like I told you too much so here goes. Makaria and I... We're Hades' and Persephone's offspring. We are your sibling, Zagreus." }, 
		},
		MelinoeAboutTimetravel04 =
		{
			Name = "MelinoeAboutTimetravel04",
			StatusAnimation = "StatusIconWantsToTalkImportant",
			PlayOnce = true,
			UseableOffSource = true,
			RequiredTextLines = {"MelinoeFirstMeeting"},
			MinRunsSinceAnyTextLines = { TextLines = { "MelinoeAboutTimetravel03" }, Count = 2 },
			EndVoiceLines =
			{
				{
					PreLineWait = 0.35,
					UsePlayerSource = true,
					RequiredMinElapsedTime = 3,
					-- -Hecate, Asphodel. Got it.
					{ Cue = "/VO/ZagreusHome_4000" },
				},
			},
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "What made you decide to tell me the truth, Melinoë? Are you certain it won't affect your timeline when you get back there." },
			{ Cue = "/VO/Melinoe_0001",
				Text = "It might. Or not. Only the Fates know. But I decided to tell you because I need your help. The spell which brought us here took my powers away." },
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "Oh no, what can we do? Maybe ask for help from Nyx? She might know a way to get them back." }, 
			{ Cue = "/VO/Melinoe_0001",
				Text = "I might have a way to get them back already. I need to find Hecate, Titaness of Witchcraft. She might know a way to bring back my powers. Rumors says she's with the witches of Asphodel, but I couldn't find her. If you could cross her path, let me know. I would be very grateful." },
		},
		MelinoeAboutTimetravel05 =
		{
			Name = "MelinoeAboutTimetravel05",
			PlayOnce = true,
			UseableOffSource = true,
			RequiredTextLines = {"MelinoeFirstMeeting", "MelinoeAboutTimetravel03"},
			EndVoiceLines =
			{
				{
					PreLineWait = 0.35,
					UsePlayerSource = true,
					RequiredMinElapsedTime = 3,
					--Good to hear.					
					{ Cue = "/VO/Melinoe_4000" },
				},
			},
			{ Cue = "/VO/Melinoe_0001",
				Text = "I am suprised you didn't ask me more about what is going to happen. I assumed you would ask what lies ahead. You did say you had many question." },
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "At first, I did. but then I thought, what's the fun in knowing what's to come? And now, I know we will met each other someday, and that's enough for me to go on." },
		},
		MelinoeAboutZagreus01 =
		{
			Name = "MelinoeAboutZagreus01",
			PlayOnce = true,
			UseableOffSource = true,
			RequiredTextLines = {"MelinoeFirstMeeting", "MelinoeGift01"},
			RequiredFalseTextLines = {"MelinoeAboutTimetravel03"},
			EndVoiceLines =
			{
				{
					PreLineWait = 0.35,
					UsePlayerSource = true,
					RequiredMinElapsedTime = 3,
					-- I suppose that's who you are.		
					{ Cue = "/VO/Melinoe_4000" },
				},
			},
			{ Cue = "/VO/Melinoe_0001",
				Text = "Are you always this trustful? You don't know my siser or I. Yet, you decided to vouch for our safety in your home. Why?" },
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "Why wouldn't I? I believe that trusting you will all you to trust me in return. There's no harm in giving someone a chance. You'd be suprised what greatness is hiding in all of us." },
		},
		MelinoeAboutMakariaJob01 =
		{
			Name = "MelinoeAboutMakariaJob01",
			PlayOnce = true,
			UseableOffSource = true,
			RequiredTextLines = {"MelinoeFirstMeeting", "MakariaWithThanatos01"},
			RequiredFalseTextLines = {"MelinoeAboutTimetravel03"},
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "Did you know Makaria started working with Thanatos? She's helping him in getting mortals here. I don't know all the details, but I hear she's doing her part." },
			{ Cue = "/VO/Melinoe_0001",
				Text = "That's good to hear, she needs to keep herself busy. And in the end, she always did as she wanted. Once she sets her mind to something, there's no stopping her." }, 
		},
		MelinoeAboutHecate01 =
		{
			Name = "MelinoeAboutHecate01",
			PlayOnce = true,
			UseableOffSource = true,
			RequiredTextLines = {"MelinoeFirstMeeting", "MelinoeAboutTimetravel04", "HecateFirstMeeting"},
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "I found the Titaness. Hecate is somewhere in Erebus. She opened to gate for me to visit her again. I think you should be able to find her now." },
			{ Cue = "/VO/Melinoe_0001",
				Text = "You did it? Finally, I'll get my powers back!" }, 
		},
	},

	RepeatableTextLineSets =
	{
		MelinoeChat01 =
		{
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines",
			{ Cue = "/VO/Melinoe_0001",
				Text = "Stay safe out there, Zagreus." },
		},
	},

	GiftTextLineSets =
	{
		MelinoeGift01 =
			{
				Name = "MelinoeGift01",
				PlayOnce = true,
				EndVoiceLines =
				{
					{
						PreLineWait = 0.35,
						UsePlayerSource = true,
						RequiredMinElapsedTime = 3,
						-- No worries.
						{ Cue = "/VO/ZagreusHome_4000" },
					},
				},
				{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
					Text = "If I may, Melinoë, I know you just arrived, but I wanted you to have this, as a welcome gift." },
				{ Cue = "/VO/Melinoe_0001",
					Text = "It's a nice gesture, Zagreus. I wish that I had all of my powers back, so that I could give you something in exchange for this. Once I do, I'll be sure to trade you for it." }, 
			},
			MelinoeGift02 =
			{
				Name = "MelinoeGift02",
				PlayOnce = true,
				RequiredTextLines = { "MelinoeGift01" },
				{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					Text = "Is Hecate's training hard? I know Achilles wasn't easy on me. I hope you can enjoy this, if you ever have the chance. Everyone deserves a break now and then." }, 
				{ Cue = "/VO/Melinoe_0001",
					Text = "It's going well, brother. And I told you I would lend you my strength once I got it back, and as promised, I hope this can help you defeating our father." },
			},
			MelinoeGift03 =
			{
				Name = "MelinoeGift03",
				PlayOnce = true,
				RequiredTextLines = { "MelinoeGift02" },
				EndVoiceLines =
				{
					{
						PreLineWait = 0.35,
						UsePlayerSource = true,
						RequiredMinElapsedTime = 3,
						-- Definitely drinking it
						{ Cue = "/VO/Melinoe_4000" },
					},
				},
				-- Definitely drinking it
				{ Cue = "/VO/Melinoe_0001",
					Text = "I still can taste the nectar you gave me. I used to give to other, but never bothered drinking some myself." },
				{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					Text = "You're in luck, then! I know the feeling of giving might be more rewarding than that of drinking it by yourself; not that you shouldn't drink it. It's a gift afterall, you can do whatever you want with it." },
			},
			MelinoeGift04 =
			{
				Name = "MelinoeGift04",
				PlayOnce = true,
				RequiredTextLines = { "MelinoeGift03" },
				{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "I know you appreciated the nectar I've been finding around. But I feel you should have a taste of this." },
				{ Cue = "/VO/Melinoe_0001",
					--PreLineAnim = "NyxIdleGreeting",
					Text = "Is it what I think it is? How did you find such quality Ambrosia? If it's a gift from you, brother, then I can't refuse." }, --fixed grammatical error.

			},
			MelinoeGift05 =
			{
				Name = "MelinoeGift05",
				PlayOnce = true,
				RequiredTextLines = { "MelinoeGift04" },
				{ Cue = "/VO/Melinoe_0001",
					--PreLineAnim = "NyxIdleGreeting",
					Text = "How do you get all of this Ambrosia? I have been in your realm for a while now and still haven't found any on my own. Why won't you enjoy some yourself." },
				{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
					Text = "I found it, so I get to do what I want with it. If I decide to give it to my family as appreciation. Then... Oh. I know! Save it, and meet me at the surface. We'll both get to enjoy it." }, 
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
			AreIdsNotAlive = { 370046 },
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

		-- No worries.
		{ Cue = "/VO/ZagreusHome_4000" },
	},
}

OlympusRoomSetData.Tartarus.A_PostBoss01.StartUnthreadedEvents = { 
	{
		FunctionName = "ActivatePrePlacedUnitsForMelinoeEncounterScene",
		GameStateRequirements =
		{
			RequiredTextLines = { "PersephoneFirstMeeting" },		--PersephoneFirstMeeting
			RequiredFalseTextLines = { "MelinoeFirstEncounter" },
		},
		BreakIfPlayed = true,
		Args =
		{
			Ids = { 370046, },
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
							PreLineWait = 1.1,
							BreakIfPlayed = true,
								-- -Who was that?
							{ Cue = "/VO/ZagreusHome_4000" },
						},
					},
					TextLineSet =
					{
						MelinoeFirstEncounter =
						{
							--EndGlobalVoiceLines = "PostBedroomIntermissionVoiceLines",
							{ Cue = "/VO/Melinoe_0001",
								PreLineWait = 1.0,
								PreLineThreadedFunctionName = "StartMoveTowardMelinoeApproach",	
								PreLineThreadedFunctionArgs = { DestinationId = 370046, OffsetX = -135, OffsetY = 80, Walk = true },
								Text = "Hello... Zagreus... You don't know me, but I know you... I wasn't sure if I should come to you or not, but I think it's time. I am Meli... Melinoë. I... I..." },
							-- requirements are above
							{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
								--PreLineThreadedFunctionName = "BedroomMoveTowardMakariaApproach",	
								--PreLineWait = 1.1,
								--AngleHeroTowardSource = true,
								PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
								PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
								-- Emote = "PortraitEmoteSurprise",
								Text = "Are you okay? It's really nice to meet you Melinoë. You don't have to be scared or anything. I don't know how you know me, but you look like you have something to say or ask." },
							{ Cue = "/VO/Melinoe_0002",
								Text = "Not scared. Just cautious. And I do. May I ask you to have a word with Lord Hades. We would like to request an audience with him. My sister and I, we come from very far, and would like to stay in the underworld for a while. Not sure if he'll allow it." },
							-- requirements are above
							{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
								PostLineThreadedFunctionName = "EndMoveTowardMelinoeApproach",	
								--PreLineWait = 1.1,
								--AngleHeroTowardSource = true,
								PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
								PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
								-- Emote = "PortraitEmoteSurprise",
								Text = "There's no harm in asking. Just bring your sister to the courthouse. We'll ask him together. I can see you don't mean any harm." },
						},
					},
				},
			},
		}
	} 
}
-- Dialog with Hades to spawns Melinoe Makaria in Courthouse
table.insert(OlympusDeathLoopData.DeathArea.StartUnthreadedEvents, 
{
	FunctionName = "ActivatePrePlacedUnitsForMelinoeHadesScene",
	GameStateRequirements =
	{
		RequiredTextLines = { "MelinoeFirstEncounter" },
		RequiredFalseTextLines = { "HadesWithMakariaAndMelinoe01" },
	},
	BreakIfPlayed = true,
	Args =
	{
		Ids = { 370006 },
		DistanceTrigger =
		{
			WithinDistance = 900,
			FunctionName = "SurpriseNPCPresentation",
			Args =
			{
				VoiceLines =
				{
					Queue = "Interrupt",
					{
						PreLineWait = 0.15,
						BreakIfPlayed = true,
							-- Here they are.
						{ Cue = "/VO/ZagreusHome_4000" },
					},
				},
				EndVoiceLines =
				{
					{
						PreLineWait = 0.35,
						UsePlayerSource = true,
						ObjectType = "NPC_Melinoe_01",
						-- Aww, thanks!
						{ Cue = "/VO/Hypnos_0200" },
					},
					{
						PreLineWait = 0.45,
						UsePlayerSource = true,
						ObjectType = "NPC_Makaria_01",
						-- Good work, Hypnos!
						{ Cue = "/VO/ZagreusHome_4000" },
					},
					{
						PreLineWait = 0.15,
						BreakIfPlayed = true,
						-- Very well, Father.
						{ Cue = "/VO/ZagreusHome_4000" },
					},
				},
				TextLineSet =
				{
					HadesWithMakariaAndMelinoe01 =
					{
						IgnoreResumeGhostProcessionOnUseableOff = true,
						--EndGlobalVoiceLines = "PostBedroomIntermissionVoiceLines",
						{ Cue = "/VO/ZagreusHome_1476", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
							PreLineThreadedFunctionName = "StartMoveTowardMelinoeApproach",	
							PreLineThreadedFunctionArgs = { DestinationId = 370006, OffsetX = -600, OffsetY = 450 },
							PreLineWait = 1.0,
							PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
							PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
							Text = "Father. I request an audience with you, and request that you allow these travelers to stay in the courthouse. How long did you say you were staying?" },
						{ Cue = "/VO/Melinoe_1476", Portrait = "Portrait_Melinoe_Default_01", Speaker = "NPC_Melinoe_01",
							Text = "I didn't mention it... Great Lord of the Underworld! We don't know how long we would stay in your domain, but we can garantee we won't nuisance to its order." },
						{ Cue = "/VO/Hades_0417",
							Text = "And how can you garantee that? I don't know you and I know everyone, so how can I accept such request without even knowing your names? It might not be common courtesy in your lands, but it is here." }, 
						{ Cue = "/VO/Makaria_1476", Portrait = "Portrait_Makaria_Smiling_03", Speaker = "NPC_Makaria_01",
							Text = "Oh that's easy! I'm Makaria. It so great to see you. I can't believe we get to see the courthouse! How awesome is this!?" }, 
						{ Cue = "/VO/Melinoe_1476", Portrait = "Portrait_Melinoe_Default_01", Speaker = "NPC_Melinoe_01",
							Text = "{#DialogueItalicFormat}Shh!{#PreviousFormat} Please, don't pay attention to my sister, she's just easily excited. I am Melinoë, and you have my word, we don't mean any trouble. We are even willing to clean the courthouse or brush Cerberus if needed." }, 
						{ Cue = "/VO/Hades_0417",
							Text = "{#DialogueItalicFormat}Mmmh!{#PreviousFormat} Something is off, yet familiar. You make me think of someone. Could it be... {#DialogueItalicFormat}Arg!{#PreviousFormat} Zagreus! You asked the audience, therefore they are now your responsability. If they cause trouble, you pay the price. Understood?" },
					},
				},
			},
		},
	}
})
-- For HadesWithMakariaAndMelinoe01 Scene Prep

OlympusRoomSetData.Tartarus.A_PostBoss01.ThreadedEvents[1].GameStateRequirements =
{
	AreIdsNotAlive = {370046},
}
-- Melinoe activation requirements
--table.insert(OlympusDeathLoopData.DeathArea.StartUnthreadedEvents[17].Args.Types, "NPC_Melinoe_01")
--OlympusDeathLoopData.DeathArea.StartUnthreadedEvents[17].Args.ActivationCapMin = 6
--OlympusDeathLoopData.DeathArea.StartUnthreadedEvents[17].Args.ActivationCapMax = 6
function OENPCSpawner(eventSource, args)
	local npc = ActiveEnemies[args.Id]	
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString.TableKeys(npc))
end
table.insert(OlympusGameData.ConversationOrder,"NPC_Melinoe_01")
OlympusDeathLoopData.DeathArea.ObstacleData[370046] = {
	Name = "NPC_Melinoe_01",
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
OlympusTraitData.UnlockManaSkillBoonTrait = {
		Name = "UnlockManaSkill",
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
		InRackTitle = "UnlockManaSkillBoonTrait_Rack",
		Icon = "Keepsake_MoonSigil",
		EquipSound = "/SFX/Enemy Sounds/HydraHead/HydraMiscBoneRattle1",
		SignOffData =
		{
			{
				Text = "MelinoeSignoff",
			},
			{
				RequiredTextLines = { "MelinoeGift07" },
				Text = "MelinoeSignoff_Max"
			}
		},
	}
function StartMoveTowardMelinoeApproach( source, args )
	UseableOff({ Id = args.DestinationId })

	wait( 0.1 )

	AddInputBlock({ Name = "MoveHeroToRoomPosition" })
	local initialSpeed = GetUnitDataValue({ Id = CurrentRun.Hero.ObjectId, Property = "Speed", Destination})
	SetUnitProperty({ DestinationId = CurrentRun.Hero.ObjectId, Property = "CollideWithObstacles", Value = false })
	if args ~= nil and args.Walk then
		SetUnitProperty({ Property = "StartGraphic", Value = nil, DestinationId = CurrentRun.Hero.ObjectId })
		SetUnitProperty({ Property = "MoveGraphic", Value = "ZagreusWalk", DestinationId = CurrentRun.Hero.ObjectId })
		SetUnitProperty({ Property = "Speed", Value = 130, DestinationId = CurrentRun.Hero.ObjectId })	
	end
	if args ~= nil and args.DestinationId ~= nil then
		Move({ Id = CurrentRun.Hero.ObjectId, DestinationId = args.DestinationId, Mode = "Precise", OffsetX = args.OffsetX or 0, OffsetY = args.OffsetY or 0 })

		local notifyName = "ApproachStopped"
		NotifyOnStopped({ Id = CurrentRun.Hero.ObjectId, Notify = notifyName })
		waitUntil( notifyName )
	end
	if args ~= nil and args.Walk then
		SetUnitProperty({ Property = "StartGraphic", Value = "ZagreusStart", DestinationId = CurrentRun.Hero.ObjectId })
		SetUnitProperty({ Property = "MoveGraphic", Value = "ZagreusRun", DestinationId = CurrentRun.Hero.ObjectId })
		SetUnitProperty({ Property = "Speed", Value = initialSpeed, DestinationId = CurrentRun.Hero.ObjectId })
	end
	
	SetUnitProperty({ Property = "CollideWithObstacles", Value = true, DestinationId = CurrentRun.Hero.ObjectId })
	RemoveInputBlock({ Name = "MoveHeroToRoomPosition" })

	wait( 0.1 )

	AngleTowardTarget({ Id = CurrentRun.Hero.ObjectId, DestinationId = args.DestinationId })
end

--[[function SurpriseNPCPresentation( source, args )
	SurpriseNPCPresentation(source, args)
end]]

function ActivatePrePlacedUnitsForMelinoeHadesScene( eventSource, args )
	ActivatePrePlacedUnits( eventSource, args )
	UseableOff({ Id = 370006 })
	ActivatePrePlacedUnits( eventSource, {Ids = { 370046, 370036 }})	
	Teleport({ Id = 370046, DestinationId = 370006, OffsetX = -700, OffsetY = 400 })
	AngleTowardTarget({ Id = 370046, DestinationId = 370006 })
	UseableOff({ Id = 370046 })
	Teleport({ Id = 370036, DestinationId = 370006, OffsetX = -500, OffsetY = 500 })
	AngleTowardTarget({ Id = 370036, DestinationId = 370006 })
	UseableOff({ Id = 370036 })
end
function ActivatePrePlacedUnitsForMelinoeEncounterScene( eventSource, args )
	ActivatePrePlacedUnits( eventSource, args )
	UseableOff({ Id = 370046 })
end
function EndMoveTowardMelinoeApproach( source, args )
	--SetUnitProperty({ DestinationId = 370046, Property = "CollideWithObstacles", Value = false })
	wait(1.1)
	Move({ Id = 370046, Angle = 210, Distance = 3000, Speed = 160, Duration = 20.0})
	
	wait(20.0)
	Destroy({Id = 370046})
end
-- Codex Section
local OlympusCodexOrdering = ModUtil.Entangled.ModData(CodexOrdering)
local OlympusCodex = ModUtil.Entangled.ModData(Codex)
table.insert(OlympusCodexOrdering.ChthonicGods.Order, "NPC_Melinoe_01")
OlympusCodex.ChthonicGods.Entries["NPC_Melinoe_01"] =
{
	Entries =
	{
		{
			UnlockThreshold = 1,
			Text = "CodexData_Melinoe_01"
		},
		{
			UnlockThreshold = 5,
			Text = "CodexData_Melinoe_02"
		},
		{
			UnlockThreshold = 15,
			Text = "CodexData_Melinoe_03"
		}
	},
	Image = "Codex_Portrait_Melinoe",
}
OlympusGiftData.NPC_Melinoe_01 =
	{
		Gift = true,
		InheritFrom = {"DefaultGiftData"},
		Name = "NPC_Melinoe_01",
		MaxedIcon = "Keepsake_Melinoe_Max",
		MaxedSticker = "Keepsake_MelinoeSticker_Max",
		MaxedRequirement = { RequiredTextLines = { "MelinoeGift05" }, },
		Locked = 2,
		Maximum = 5,
		[2] = { Gift = "UnlockManaSkillBoonTrait" },
		[3] = { RequiredResource = "SuperGiftPoints" },
		[4] = { RequiredResource = "SuperGiftPoints" },
		[5] = { RequiredResource = "SuperGiftPoints" },
		UnlockGameStateRequirements = { RequiredTextLines = { "MelinoeAboutTimetravel03" } }
	}
	
table.insert(OlympusGiftOrdering, "UnlockManaSkillBoonTrait")
table.insert(OlympusDeathLoopData.DeathArea.StartUnthreadedEvents, {
	FunctionName = "SpawnExtraNPCs",
	GameStateRequirements =
	{
		RequiredFalseFlags = { "InFlashback" },
	},
	Args =
	{
		Name = "NPC_Melinoe_01", 
		SpawnPointId = 370046,
		Angle = 280,
	},
})
