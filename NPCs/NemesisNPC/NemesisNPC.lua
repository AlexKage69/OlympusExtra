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
OlympusColor.NemesisVoice = { 93,19,52,255 }
-- 3DGhostAltIdle for the Hypnos discussion
local OlympusEnemyData = ModUtil.Entangled.ModData(EnemyData)
OlympusEnemyData.NPC_Nemesis_01 =
{
	InheritFrom = { "NPC_Neutral", "NPC_Giftable" },
	Name = "NPC_Nemesis_01",
	UseText = "UseTalkToMaleGhost",
	Portrait = "Portrait_Nemesis_Default_01",
	AnimOffsetZ = 205,
	EmoteOffsetX = 50,
	EmoteOffsetY = -200,

	Groups = { "NPCs" },
	SubtitleColor = Color.NemesisVoice,

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
		[370056] = { -- DeathArea/ Near Office
			LocationX = 6231.498047,
			LocationY = 5053.426758,
		},
	},
	InteractTextLineSets =
	{
		NemesisFirstMeeting =
		{
			Name = "NemesisFirstMeeting",
			PlayOnce = true,
			UseableOffSource = true,
			EndVoiceLines =
			{
				{
					PreLineWait = 0.35,
					UsePlayerSource = true,
					RequiredMinElapsedTime = 3,
					--Be gone then
					{ Cue = "/VO/Nemesis_0001" },
				},
			},

			{ Cue = "/VO/Nemesis_0001",
				Text = "How was your futile attempt? Not well, if you are still here. There's other way to spend your time. Keep guard with me instead." },
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "As tempting as it sounds, I'll be on my way. I have my own reasons for trying the impossible. Keep the house safe." },
		},
		NemesisOrders01 =
		{
			Name = "NemesisOrders01",
			PlayOnce = true,
			UseableOffSource = true,
			RequiredTextLines = { "NemesisFirstMeeting", },
			RequiredMinNPCInteractions = { NPC_Nyx_01 = 1 },
			EndVoiceLines =
			{
				{
					PreLineWait = 0.35,
					UsePlayerSource = true,
					RequiredMinElapsedTime = 3,
					--Thanks for keeping us safe.
					{ Cue = "/VO/ZagreusHome_4000" },
				},
			},

			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "Nemesis, can I ask why you are guarding my room? You didn't move an inch since I left." },
			{ Cue = "/VO/Nemesis_0001",
				Text = "Mother Nyx gave me orders. Keep the courthouse safe. This is the most strategic point to keep it safe." },
		},		
		NemesisAboutGods =
		{
			Name = "NemesisOrders01",
			PlayOnce = true,
			UseableOffSource = true,
			RequiredTextLines = { "NemesisFirstMeeting", "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp",
					"AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
			EndVoiceLines =
			{
				{
					PreLineWait = 0.35,
					UsePlayerSource = true,
					RequiredMinElapsedTime = 3,
					--
					{ Cue = "/VO/ZagreusHome_4000" },
				},
			},

			{ Cue = "/VO/Nemesis_0001",
				Text = "You can't be serious?! You are getting help from those above? You know what they are. You know what they do. You can't be associated to them." },
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "I need all the help I can get if I want to make it out of here. I can't be selective on who offers." },
		},
	},

	RepeatableTextLineSets =
	{
		NemesisChat01 =
		{
			Name = "NemesisChat01",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Nyx",
			{ Cue = "/VO/Nyx_0003",
				Text = "Keep moving. I have nothing to tell you." },
		},
		NemesisChat02 =
		{
			Name = "NemesisChat02",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Nyx",
			{ Cue = "/VO/Nyx_0003",
				Text = "Still trying to escape?" },
		},
		NemesisChat03 =
		{
			Name = "NemesisChat03",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Nyx",
			{ Cue = "/VO/Nyx_0003",
				Text = "Can't you see I am standing guard. Move on." },
		},
		NemesisChat04 =
		{
			Name = "NemesisChat04",
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Nyx",
			{ Cue = "/VO/Nyx_0003",
				Text = "Want my picture? Just get in your room." },
		},

	},

	GiftTextLineSets =
	{
		NemesisGift01 =
			{
				Name = "NemesisGift01",
				PlayOnce = true,
				{ Cue = "/VO/ZagreusHome_0118", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
					Text = "I know you are on duty, Nemesis. But I hope you can appreciate this on your next break." },
				{ Cue = "/VO/Nemesis_0445",
					PreLineAnim = "NyxIdleGreeting",
					Text = "I don't take {#DialogueItalicFormat}breaks{#PreviousFormat}. I must keep the realm safe. I see you are making an effort. I believe this is a good time to give you this back. Just to keep the courthouse more safe." },
			},
			NemesisGift02 =
			{
				Name = "NemesisGift02",
				PlayOnce = true,
				RequiredTextLines = { "NemesisGift01" },
				{ Cue = "/VO/Nyx_0045",
					PreLineAnim = "NyxIdleGreeting",
					Text = "Again. I don't need this. My orders are to keep the courthouse safe. I didn't get any order to accept your gifts." },
				{ Cue = "/VO/ZagreusHome_0196", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					Text = "But you didn't get order to not accept gift either. There's no harm in getting a treat from time to time. Enjoy." },
			},
			NemesisGift03 =
			{
				Name = "NemesisGift03",
				PlayOnce = true,
				RequiredTextLines = { "NemesisGift02" },
				{ Cue = "/VO/Nyx_0046", Portrait = "Portrait_Nyx_Averted_01",
					PreLineAnim = "NyxIdleGreeting",
					Text = "I know you are not found of my gifts, Nemesis. But you can't stop me from finding ways to show my gratitude for keeping us safe." },
				{ Cue = "/VO/ZagreusHome_0197", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					Text = "I can't tell if you are mocking me or your serious. I know there's not much threat towards Lord Hades' realm. Nevertherless someone's got to look after it. I won't stop my guard until Nyx tells me so." },
			},
			NemesisGift04 =
			{
				Name = "NemesisGift04",
				PlayOnce = true,
				RequiredTextLines = { "NemesisGift03" },
				EndVoiceLines =
				{
					{
						PreLineWait = 0.35,
						UsePlayerSource = true,
						RequiredMinElapsedTime = 3,
						-- If you say so.
						{ Cue = "/VO/ZagreusHome_0001" },
					},
				},
				{ Cue = "/VO/Nyx_0047",
					PreLineAnim = "NyxIdleGreeting",
					Text = "Why? I am sure Dusa or Achilles would appreciate more than I do. Is it because I am on your way to your room?" },
				{ Cue = "/VO/ZagreusHome_0198", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Of course not. I want to you to know what you do matters. And I know you do it because you want to keep the house safe, not just because Nyx told you so." },
			},
			NemesisGift05 =
			{
				Name = "NemesisGift05",
				PlayOnce = true,
				RequiredTextLines = { "NemesisGift04" },
				{ Cue = "/VO/Nyx_0048",
					PreLineAnim = "NyxIdleGreeting",
					Text = "Your kind. Too kind. This will be the end of you. Just... be careful out there." },
				{ Cue = "/VO/ZagreusHome_3509", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
					Text = "Am I getting to you somehow? Don't worry. I am starting to get the way up to the surface. I'll make sure to bring you more." },
			},
			NemesisGift06 =
			{
				Name = "NemesisGift06",
				PlayOnce = true,
				RequiredTextLines = { "NemesisGift05" },
				{ Cue = "/VO/Nyx_0175",
					PreLineAnim = "NyxIdleGreeting",
					Text = "Prince... Would it be wrong to say I am getting bored? Like I know how important my orders are, but I must say, more responsability wouldn't hurt." },
				{ Cue = "/VO/ZagreusHome_2232", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
					Text = "I can tell. You drink this and I'll see what I can do. I am sure we'll find something else to guard." },
			},

			-- Arena Unlock / locked gifts
			NemesisGift07 =
			{
				Name = "NemesisGift07",
				PlayOnce = true,
				RequiredTextLines = { "NemesisGift06" },
				{ Cue = "/VO/ZagreusHome_2233", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
					Text = "Cheers. To your new position as Arena Manager. I am sure you'll make a great difference there." },
				{ Cue = "/VO/Nyx_0176",
					Text = "It's thanks to you. I won't stop guarding the house, but the arena was a great idea. I'll make sure you get the best out of it." },
			},
			NemesisGift08 =
			{
				Name = "NemesisGift08",
				PlayOnce = true,
				RequiredTextLines = { "NemesisGift07" },
				-- That's quite all right. It never spoils and you have all the time in the world.
				EndCue = "/VO/ZagreusHome_2236",
				EndWait = 0.35,
				{ Cue = "/VO/Nyx_0178",
					Text = "By the way, I meant to tell you, child. The Ambrosia that you gave me? Rather than hold onto it indefinitely, I decided recently to sample it. Your father's claims about its flavor are quite false. I have never tasted anything like it." },
				{ Cue = "/VO/ZagreusHome_2235", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "So glad you liked it, Nyx! And, good timing, too, because... I have for you another bottle, here. They say each one is different in its own respect! And besides, the pleasures of Olympus should be shared. Please, take it, won't you?" },
				{ Cue = "/VO/Nyx_0179",
					PreLineAnim = "NyxIdleGreeting",
					Text = "You are persuasive like your mother, and determined like your father, child. But if you so insist, then I shall not deny myself the simple pleasures of this drink. Though rare is the occasion for it here." },
			},
			NemesisGift09 =
			{
				Name = "NemesisGift09",
				PlayOnce = true,
				RequiredTextLines = { "NemesisGift08" },
				EndVoiceLines =
				{
					PreLineWait = 0.35,
					ObjectType = "NPC_Nyx_01",
					-- I love you, too, my child.
					{ Cue = "/VO/Nyx_0181" },
				},
				{ Cue = "/VO/ZagreusHome_2237", Portrait = "Portrait_Zag_Empathetic_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
					Text = "Nyx, along with giving you this bottle of Ambrosia here, there's something I have meant to say to you. The Three Fates have been very kind to me. Because, in denying me my birthmother... they gave me you. Without your steady presence here, I... can't imagine what it would be like." },
				{ Cue = "/VO/Nyx_0180", Portrait = "Portrait_Nyx_Averted_01",
					PreLineAnim = "NyxIdleGreeting",
					Text = "{#DialogueItalicFormat}Oh{#PreviousFormat}. Then, the Three Fates are whimsical, indeed. When you were born, and I was filled with fear for what it meant for you to be alive, to be responsible for you... I must admit I did not guess that, one evening, you would provide for me both such a gift, and such a sentiment." },
				{ Cue = "/VO/ZagreusHome_2238", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PostLineThreadedFunctionName = "MaxedRelationshipPresentation",
					PostLineFunctionArgs = { Text = "NPC_Nyx_01", Icon = "Keepsake_NyxSticker_Max" },
					Text = "Well, I mean every word. I love you, Nyx." },
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

		-- That was unexpected. Thanks Nemesis.
		{ Cue = "/VO/ZagreusHome_0310" },
	},
}
-- Nemesis activation requirements
function OENPCSpawner(eventSource, args)
	local npc = ActiveEnemies[args.Id]	
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString.TableKeys(npc))
end
table.insert(OlympusGameData.ConversationOrder,"NPC_Nemesis_01")
OlympusDeathLoopData.DeathArea.ObstacleData[370056] = {
	Name = "NPC_Nemesis_01",
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
OlympusTraitData.NemesisRevengeTrait = {
		Name = "NemesisRevengeTrait",
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
		InRackTitle = "NemesisRevengeTrait_Rack",
		Icon = "Keepsake_ShieldPlate_Child",
		EquipSound = "/SFX/Enemy Sounds/HydraHead/HydraMiscBoneRattle1",
		AddOnHitWeapons = { "NemesisRevengeWeapon" },
		PropertyChanges =
		{
			{
				WeaponName = "NemesisRevengeWeapon",
				ProjectileProperty = "DamageLow",
				BaseMin = 50,
				BaseMax = 50,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "NemesisRevengeWeapon",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
		SignOffData =
		{
			{
				Text = "NemesisSignoff",
			},
			{
				RequiredTextLines = { "NemesisGift07" },
				Text = "NemesisSignoff_Max"
			}
		},
	}
-- Codex Section
local OlympusCodexOrdering = ModUtil.Entangled.ModData(CodexOrdering)
local OlympusCodex = ModUtil.Entangled.ModData(Codex)
table.insert(OlympusCodexOrdering.ChthonicGods.Order, "NPC_Nemesis_01")
OlympusCodex.ChthonicGods.Entries["NPC_Nemesis_01"] =
{
	Entries =
	{
		{
			UnlockThreshold = 1,
			Text = "CodexData_Nemesis_01"
		},
		{
			UnlockThreshold = 5,
			Text = "CodexData_Nemesis_02"
		},
		{
			UnlockThreshold = 15,
			Text = "CodexData_Nemesis_03"
		}
	},
	Image = "Codex_Portrait_Nemesis",
}
OlympusGiftData.NPC_Nemesis_01 =
	{
		Gift = true,
		InheritFrom = {"DefaultGiftData"},
		Name = "NPC_Nemesis_01",
		MaxedIcon = "Keepsake_Achilles_Max",
		MaxedSticker = "Keepsake_AchillesSticker_Max",
		MaxedRequirement = { RequiredTextLines = { "NemesisGift05" }, },
		Locked = 7,
		Maximum = 8,
		[1] = { Gift = "NemesisRevengeTrait" },
		[7] = { RequiredResource = "SuperGiftPoints" },
		[8] = { RequiredResource = "SuperGiftPoints" },
		UnlockGameStateRequirements = { RequiredTextLines = { "Test1" } }
	}
	
table.insert(OlympusGiftOrdering, 7, "NemesisRevengeTrait")
table.insert(OlympusDeathLoopData.DeathArea.StartUnthreadedEvents, {
	FunctionName = "SpawnExtraNPCs",
	GameStateRequirements =
	{
		RequiredFalseFlags = { "InFlashback" },
	},
	Args =
	{
		Name = "NPC_Nemesis_01", 
		SpawnPointId = 370056,
		SpawnChance = 0.0,
	},
})