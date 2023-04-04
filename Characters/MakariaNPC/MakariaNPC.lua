local OlympusUnitSetData = ModUtil.Entangled.ModData(UnitSetData)
local OlympusObstacleData = ModUtil.Entangled.ModData(ObstacleData)
local OlympusDeathLoopData = ModUtil.Entangled.ModData(DeathLoopData)
local OlympusRoomSetData = ModUtil.Entangled.ModData(RoomSetData)
local OlympusEncounterSets = ModUtil.Entangled.ModData(EncounterSets)
-- Makaria, Id = 370025, 370024, 370002

OlympusUnitSetData.NPCs.NPC_Makaria_01 =
{
	InheritFrom = { "NPC_Neutral", "NPC_Giftable" },
	Name = "NPC_Makaria_01",
	UseText = "UseTalkToChildGhost",
	Portrait = "Portrait_ChildGhost_Default_01",
	AnimOffsetZ = 220,
	EmoteOffsetX = -20,
	EmoteOffsetY = -160,

	Groups = { "NPCs" },
	SubtitleColor = Color.HypnosVoice,

	Binks =
	{
		"HypnosIdleSitting_Bink",
		"HypnosSleepWakingSurprise_Bink",
		"HypnosSittingToSleep_Bink",
		"HypnosIdleSleeping_Bink",
		"HypnosIdleGreeting_Bink",
	},

	ActivateRequirements =
	{
		RequiredFalseFlags = { "InFlashback" },
	},

	InteractTextLineSets =
	{
		MakariaFirstMeeting =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				{ Cue = "/VO/Sisyphus_0129",
					PreLineAnim = "SisyphusExplaining",
					Text = "Hey, Prince Z. Must look like I'm slacking off with the old boulder, here, but... I was just getting back on my feet. The Fury Sisters don't often leave me be. Where'd they go, anyway? And... what are you doing here?" },
				{ Cue = "/VO/ZagreusField_0522", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
					Text = "Oh, you know, just out on a little stroll is all. Do me a favor, though, you see the Fury Sisters, let them know I was headed down the way I came from, will you...?" },
				{ Cue = "/VO/Sisyphus_0130",
					Text = "Oh I'll let them know, all right, I hear you loud and clear, Your Highness. I'll just go about my business now, and you take care." },
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
	},

	RepeatableTextLineSets =
	{
		MakariaRepeat01 =
		{
			UseableOffSource = true,
			InitialGiftableOffSource = true,
			GiftableOffSource = true,
			{ Cue = "/VO/Nyx_0367",
				Text = "Chaos and I have much catching up to do." },
		},
	},

	GiftTextLineSets =
	{
		-- grants a gift
		MakariaGift01 =
		{
			PlayOnce = true,
			{ Cue = "/VO/ZagreusHome_0114", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
				Text = "Surprise, Hypnos! I got you this." },
			{ Cue = "/VO/Hypnos_0067",
				Emote = "PortraitEmoteSurprise",
				PreLineAnim = "HypnosIdleGreeting",
				Text = "Whoa whoa {#DialogueItalicFormat}whoa {#PreviousFormat}you can't bring that in here! Hah, just kidding, thanks! But wait, I'll trade you, look!" },
		},
		HypnosGift02 =
		{
			PlayOnce = true,
			RequiredTextLines = { "HypnosGift01", },
			{ Cue = "/VO/Hypnos_0062",
				Emote = "PortraitEmoteCheerful",
				PreLineAnim = "HypnosIdleGreeting",
				Text = "Oh! Wow! Thanks! This is real nice of you, hah! I sure am glad you died out there just now!" },
			{ Cue = "/VO/ZagreusHome_0234", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
				Text = "I'm glad I died, as well, Hypnos! I'm glad I died, as well." },
		},
		HypnosGift03 =
		{
			PlayOnce = true,
			RequiredTextLines = { "HypnosGift02", },
			{ Cue = "/VO/Hypnos_0063",
				Emote = "PortraitEmoteCheerful",
				PreLineAnim = "HypnosIdleGreeting",
				Text = "Ah, neat! {#DialogueItalicFormat}Huh{#PreviousFormat}, thanks!! It's not so bad that you keep coming back like this, is it? At least for me it isn't!" },
			{ Cue = "/VO/ZagreusHome_0235", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
				Text = "I'm getting used to it. Though I don't think I'd feel particularly welcome anymore if not for you, Hypnos." },
		},
		HypnosGift04 =
		{
			PlayOnce = true,
			RequiredTextLines = { "HypnosGift03", },
			{ Cue = "/VO/Hypnos_0064",
				Emote = "PortraitEmoteCheerful",
				PreLineAnim = "HypnosIdleGreeting",
				Text = "{#DialogueItalicFormat}Whoaaa {#PreviousFormat}you must've really gotten pretty far out there if you could get me one of these, so, wow! And thanks for stopping by!" },
			{ Cue = "/VO/ZagreusHome_0517", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
				Text = "You lighten up my numerous untimely deaths, Hypnos." },
		},
		HypnosGift05 =
		{
			PlayOnce = true,
			RequiredTextLines = { "HypnosGift04", },
			{ Cue = "/VO/Hypnos_0065",
				Emote = "PortraitEmoteCheerful",
				PreLineAnim = "HypnosIdleGreeting",
				Text = "Hah, well this is like a dream come true! I mean, how come you're always being so darn nice to me? But anyway, {#DialogueItalicFormat}um{#PreviousFormat}, thanks!" },
			{ Cue = "/VO/ZagreusHome_0518", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				Text = "Sure thing, Hypnos! Knock yourself out." },
		},
		HypnosGift06 =
		{
			RequiredTextLines = { "HypnosGift05", },
			PlayOnce = true,
			GiftableOffSource = true,
			{ Cue = "/VO/Hypnos_0066",
				Emote = "PortraitEmoteCheerful",
				PreLineAnim = "HypnosIdleGreeting",
				Text = "Oh you are just the best, I bet you died on purpose just to get this back to me, didn't you! Didn't you?" },
			{ Cue = "/VO/ZagreusHome_0519", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "I have a secret, Hypnos. I've died on purpose every single time, just to see you." },
		},
		HypnosGift07 =
		{
			RequiredTextLines = { "HypnosGift06" },
			PlayOnce = true,
			GiftableOffSource = true,
			EndVoiceLines =
			{
				PreLineWait = 0.4,
				ObjectType = "NPC_Hypnos_01",
				-- Oh you bet!
				{ Cue = "/VO/Hypnos_0211" },
			},
			{ Cue = "/VO/ZagreusHome_2792", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
				Text = "Hypnos, wanted to say you have really helped the thought of my coming back here time after time, painful death by death, not be inherently abhorrent. Your greetings really help! So I wanted you to have this." },
			{ Cue = "/VO/Hypnos_0210",
				PreLineAnim = "HypnosIdleGreeting",
				PreLineThreadedFunctionName = "PlayEmoteAnimFromSource",
				PreLineThreadedFunctionArgs = { Emote = "PortraitEmoteAffection", WaitTime = 3.0 },
				Text = "But, but, but, wait, this, it's {#DialogueItalicFormat}Ambrosia{#PreviousFormat}! You are not supposed to have this here! We could both get in a lot of trouble, and I mean a {#DialogueItalicFormat}lot{#PreviousFormat}, if they catch us in the middle of this totally forbidden exchange!" },
			{ Cue = "/VO/ZagreusHome_2793", Portrait = "Portrait_Zag_Defiant_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "I notice that you haven't yet returned the bottle to me, which I'm going to take as an indication that you're going to hang onto it." },
		},
		HypnosGift08 =
		{
			RequiredTextLines = { "HypnosGift07" },
			PlayOnce = true,
			GiftableOffSource = true,
			EndVoiceLines =
			{
				PreLineWait = 0.4,
				UsePlayerSource = true,
				-- I'll have to give that a shot.
				{ Cue = "/VO/ZagreusHome_2796" },
			},
			{ Cue = "/VO/ZagreusHome_2794", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
				Text = "One more forbidden exchange, Hypnos. Sometimes when I'm out there and about to die, I catch myself thinking... well, at least Hypnos will share one of his deep insights about why it is I utterly failed. So here! For all your generous advice." },
			{ Cue = "/VO/Hypnos_0212",
				PreLineAnim = "HypnosIdleGreeting",
				Emote = "PortraitEmoteCheerful",
				Text = "Aww, I... feel like I am going to cry, I mean, all my advice is free! You really didn't have to do this. But I sure am glad you did! Even if it is highly illegal! I... I... I...!" },
			{ Cue = "/VO/ZagreusHome_2795", Portrait = "Portrait_Zag_Defiant_01", Speaker = "CharProtag",
				Text = "You what, Hypnos? You what?" },
			{ Cue = "/VO/Hypnos_0213", PreLineWait = 0.35,
				PreLineAnim = "HypnosIdleGreeting",
				Emote = "PortraitEmoteAffection",
				PostLineThreadedFunctionName = "MaxedRelationshipPresentation",
				PostLineFunctionArgs = { Text = "NPC_Hypnos_01", Icon = "Keepsake_HypnosSticker_Max" },
				Text = "...I think you could be my best friend! Have you... tried being my best friend?" },
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
OlympusEncounterSets.EncounterEventsMakariaPool =
{
	{ FunctionName = "StartCinematicMakariaPool" },
}
function StartCinematicMakariaPool()
	ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Cinematic")) 
end
-- New rooms section
OlympusRoomSetData.Tartarus.A_Makaria01 =
	{
		Name = "A_Makaria01",
		InheritFrom = { "BaseTartarus" },
		LegalEncounters = { "Empty" },
		UnthreadedEvents = EncounterSets.EncounterEventsNonCombat,
		TimerBlock = "StoryRoom",
		GameStateRequirements =
		{
			RequiredMaxBiomeDepth = 12,
		},
		NoReward = true,
		EntranceDirection = "Right",
		NumExits = 0,
		ZoomFraction = 0.95,
	}
-- Gift Section
--[[local OlympusGiftOrdering = ModUtil.Entangled.ModData(GiftOrdering)
local OlympusGiftData = ModUtil.Entangled.ModData(GiftData)
table.insert(OlympusGiftOrdering, 29, "NewRoomsTrait")

OlympusGiftData.NPC_Makaria_01 =
{
	InheritFrom = { "DefaultGiftData" },
	MaxedIcon = "Keepsake_Hypnos_Max",
	MaxedSticker = "Keepsake_HypnosSticker_Max",
	MaxedRequirement = { RequiredTextLines = { "MakariaGift08" }, },
	Locked = 7,
	Maximum = 8,
	[1] = { Gift = "NewRoomsTrait" },
	[7] = { RequiredResource = "SuperGiftPoints" },
	[8] = { RequiredResource = "SuperGiftPoints" },
	UnlockGameStateRequirements = { RequiredTextLines = { "HypnosAboutThanatos04" } }
}
-- Keepsake
local OlympusTraitData = ModUtil.Entangled.ModData(TraitData)
OlympusTraitData.NewRoomsTrait =
	{
		Icon = "Keepsake_Purse",
		EquipSound = "/SFX/Menu Sounds/KeepsakeHypnosCoinPurse",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "BonusMoneyTrait_Rack",
		CustomTrayText = "BonusMoneyTrait_Tray",
		UnequippedKeepsakeTitle = "BonusMoneyTrait_Dead",
		CustomTrayNameWhileDead = "BonusMoneyTrait_Tray",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			}
		},
		SignOffData =
		{
		  {
			Text = "MakariaSignoff",
		  },
		  {
			RequiredTextLines = { "MakariaGift08" },
			Text = "MakariaSignoff_Max"
		  }
		},
	}]]
-- Makaria activation requirements
table.insert(OlympusDeathLoopData.RoomPreRun.StartUnthreadedEvents, {
	FunctionName = "ActivateRotatingNPCs",
	GameStateRequirements =
	{
		RequiredFalseFlags = { "InFlashback" },
	},
	Args =
	{
		Types =
		{
			"NPC_Makaria_01",
		},
		ActivationCapMin = 3,
		ActivationCapMax = 3,
		SkipPresentation = true,
	},
})
-- Codex Section
local OlympusCodexOrdering = ModUtil.Entangled.ModData(CodexOrdering)
local OlympusCodex = ModUtil.Entangled.ModData(Codex)
table.insert(OlympusCodexOrdering.ChthonicGods.Order, "NPC_Makaria_01")
OlympusCodex.ChthonicGods.Entries["NPC_Makaria_01"] =
{
	Entries =
	{
		{
			UnlockThreshold = 1,
			Text = "CodexData_Hestia_0001"
		},
		{
			UnlockThreshold = 5,
			Text = "CodexData_Hestia_0002"
		},
		{
			UnlockThreshold = 15,
			Text = "CodexData_Hestia_0003"
		}
	},
	Image = "Codex_Portrait_Hestia",
}
-- Fountain Divination
OlympusDeathLoopData.RoomPreRun.Binks = {
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
}

--[[ModUtil.Path.Wrap( "BeginOpeningCodex", 
	function(baseFunc)		
		if (not CanOpenCodex()) and IsSuperValid() then
			BuildSuperMeter(CurrentRun, 50)
		end
		ForceNextRoomFunc("A_Makaria01")
		--local challengeBaseIds = GetIdsByType({ Name = "NPC_Makaria_01" })
		--ModUtil.Hades.PrintStackChunks(ModUtil.ToString.Deep(challengeBaseIds)) 
		baseFunc()
	end
)]]

OnUsed{ "NPCs",
	function( triggerArgs )
		ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Interact")) 
	end
}
OverwriteTableKeys( EnemyData, UnitSetData.NPCs )
OverwriteTableKeys( RoomData, OlympusRoomSetData.Tartarus)
