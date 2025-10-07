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
OlympusColor.ErisVoice = { 93,19,52,255 }
-- 3DGhostAltIdle for the Hypnos discussion
local OlympusEnemyData = ModUtil.Entangled.ModData(EnemyData)
OlympusEnemyData.NPC_Eris_01 =
{
	InheritFrom = { "NPC_Neutral", "NPC_Giftable" },
	Name = "NPC_Eris_01",
	UseText = "UseTalkToMaleGhost",
	Portrait = "Portrait_Eris_Default_01",
	AnimOffsetZ = 205,
	EmoteOffsetX = 50,
	EmoteOffsetY = -200,

	Groups = { "NPCs" },
	SubtitleColor = Color.ErisVoice,

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
		[370066] = { -- DeathArea/ Near Office
			LocationX = 4819.635742,
			LocationY = 5516.157715,
		},
	},
	InteractTextLineSets =
	{
		ErisFirstMeeting =
		{
			Name = "ErisFirstMeeting",
			PlayOnce = false,
			UseableOffSource = true,
			RequiredFalseFlags = { "InFlashback", },
			--InOffice = true,
			EndVoiceLines =
			{
				{
					PreLineWait = 0.35,
					UsePlayerSource = true,
					RequiredMinElapsedTime = 3,
					-- Not funny.
					{ Cue = "/VO/ZagreusHome_3389" },
				},
			},
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "Eris? How long has it been? Is my father making you work too much again? I haven't seen you of late." },
			{ Cue = "/VO/Eris_0001",
				Text = "Prince! Your father does nothing of the sort. Archive needs to be manage. Therefort here I am. " },
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "Still seems like a lot of effort to be working in the archive all the time. You could say you were send to your doom" },
		},
	},

	RepeatableTextLineSets =
	{
		ErisChat01 =
		{
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Nyx",
			{ Cue = "/VO/Nyx_0003",
				Text = "Darkness guide you, child." },
		},
	},

	GiftTextLineSets =
	{
		ErisGift01 =
			{
				Name = "ErisGift01",
				PlayOnce = true,
				{ Cue = "/VO/ZagreusHome_0118", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
					Text = "{#DialogueItalicFormat}Erm{#PreviousFormat}, Eris? You've done so much for me, I.. thought you might like this." },
				{ Cue = "/VO/Eris_0445",
					PreLineAnim = "NyxIdleGreeting",
					Text = "You know your father does not like it when Nectar is doled out on the premises, dear child. However, I am not he... and I wished, regardless, to provide to you a token of my affection." },
			},
			ErisGift02 =
			{
				Name = "ErisGift02",
				PlayOnce = true,
				RequiredTextLines = { "ErisGift01" },
				{ Cue = "/VO/Nyx_0045",
					PreLineAnim = "NyxIdleGreeting",
					Text = "How can I possibly accept such generosity, my child? Surely others whom you know are more deserving of such offerings." },
				{ Cue = "/VO/ZagreusHome_0196", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					Text = "Nonsense, Nyx. I want you to have it. You've always cared for me. I can't ever repay you for that." },
			},
			ErisGift03 =
			{
				Name = "ErisGift03",
				PlayOnce = true,
				RequiredTextLines = { "ErisGift02" },
				{ Cue = "/VO/Nyx_0046", Portrait = "Portrait_Nyx_Averted_01",
					PreLineAnim = "NyxIdleGreeting",
					Text = "Your kindness toward me is unnecessary, child. You know I have no expectation of such gifts, from you or anyone." },
				{ Cue = "/VO/ZagreusHome_0197", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					Text = "I think of you always, Nyx. You raised me as your own, and I am grateful for it." },
			},
			ErisGift04 =
			{
				Name = "ErisGift04",
				PlayOnce = true,
				RequiredTextLines = { "ErisGift03" },
				{ Cue = "/VO/Nyx_0047",
					PreLineAnim = "NyxIdleGreeting",
					Text = "You honor me, my child; although I dread that I am not deserving of such generosity. There is no need to flatter me like this." },
				{ Cue = "/VO/ZagreusHome_0198", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Be that as it may, Nyx! I would still like for you to have it, with my compliments." },
			},
			ErisGift05 =
			{
				Name = "ErisGift05",
				PlayOnce = true,
				RequiredTextLines = { "ErisGift04" },
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
-- Eris activation requirements
--table.insert(OlympusDeathLoopData.DeathArea.StartUnthreadedEvents[17].Args.Types, "NPC_Eris_01")
--OlympusDeathLoopData.DeathArea.StartUnthreadedEvents[17].Args.ActivationCapMin = 6
--OlympusDeathLoopData.DeathArea.StartUnthreadedEvents[17].Args.ActivationCapMax = 6
function OENPCSpawner(eventSource, args)
	local npc = ActiveEnemies[args.Id]	
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString.TableKeys(npc))
end
table.insert(OlympusGameData.ConversationOrder,"NPC_Eris_01")
OlympusDeathLoopData.DeathArea.ObstacleData[370066] = {
	Name = "NPC_Eris_01",
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
				Text = "ErisSignoff",
			},
			{
				RequiredTextLines = { "ErisGift07" },
				Text = "ErisSignoff_Max"
			}
		},
	}
-- Codex Section
local OlympusCodexOrdering = ModUtil.Entangled.ModData(CodexOrdering)
local OlympusCodex = ModUtil.Entangled.ModData(Codex)
table.insert(OlympusCodexOrdering.ChthonicGods.Order, "NPC_Eris_01")
OlympusCodex.ChthonicGods.Entries["NPC_Eris_01"] =
{
	Entries =
	{
		{
			UnlockThreshold = 1,
			Text = "CodexData_Eris_01"
		},
		{
			UnlockThreshold = 5,
			Text = "CodexData_Eris_02"
		},
		{
			UnlockThreshold = 15,
			Text = "CodexData_Eris_03"
		}
	},
	Image = "Codex_Portrait_Eris",
}
OlympusGiftData.NPC_Eris_01 =
	{
		Gift = true,
		InheritFrom = {"DefaultGiftData"},
		Name = "NPC_Eris_01",
		MaxedIcon = "Keepsake_Achilles_Max",
		MaxedSticker = "Keepsake_AchillesSticker_Max",
		MaxedRequirement = { RequiredTextLines = { "ErisGift08" }, },
		Locked = 7,
		Maximum = 8,
		[1] = { Gift = "BonusRangedBoonTrait" },
		[7] = { RequiredResource = "SuperGiftPoints" },
		[8] = { RequiredResource = "SuperGiftPoints" },
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
		Name = "NPC_Eris_01", 
		SpawnPointId = 370066
	},
})