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
			PlayOnce = false,
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
				{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
					Text = "If I may, Melinoë, I know you just arrived, but I wanted you to have this. As a welcome gift." },
				{ Cue = "/VO/Melinoe_0001",
					Text = "It's a nice gesture, Zagreus. I wish I had all my powers back to give you something in exchange. Once I do, I'll trade you for it next time." },
			},
			MelinoeGift02 =
			{
				Name = "MelinoeGift02",
				PlayOnce = true,
				RequiredTextLines = { "MelinoeGift01" },
				{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					Text = "Is Hecate's training hard? I know Achilles wasn't easy on me. I hope you can enjoy this, if you ever have the chance. Everyone deserve a break." },
				{ Cue = "/VO/Melinoe_0001",
					Text = "It's going well, brother. And I told you I would led you my strength once I get it back. As promised. Hope this can help you defeating our father." },
			},
			MelinoeGift03 =
			{
				Name = "MelinoeGift03",
				PlayOnce = true,
				RequiredTextLines = { "MelinoeGift02" },
				-- Definitely drinking it
				{ Cue = "/VO/Melinoe_0001",
					Text = "I still can taste the nectar you gave me. I used to give to other, but never bothered drinking some myself." },
				{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					Text = "You're in luck, then. I know the feeling of giving might be more rewarding than drinking by your own. Not that you shouldn't drink it. It's a gift. You can do what you want with it." },
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
					PreLineAnim = "NyxIdleGreeting",
					Text = "Is it what I think it is? How did you find such quality Ambrosia? It's coming from you brother. I can't refuse." },

			},
			MelinoeGift05 =
			{
				Name = "MelinoeGift05",
				PlayOnce = true,
				RequiredTextLines = { "MelinoeGift04" },
				{ Cue = "/VO/Melinoe_0001",
					PreLineAnim = "NyxIdleGreeting",
					Text = "How do you get all these Ambrosia? I have been in your realm for a while now and still haven't found any on my own. Why won't you enjoy some yourself." },
				{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
					Text = "I found it, I get to do what I want with it. If I decide to give it to my family as appreciation. Then... Oh. I know. Safe it and met me at the surface. We'll both get to enjoy it." },
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
								Text = "Hello... Zagreus... You don't know me. But I do... I wasn't sure if I should come to you. But I think it's time. I am Meli... Melinoë. I... I..." },
							-- requirements are above
							{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
								--PreLineThreadedFunctionName = "BedroomMoveTowardMakariaApproach",	
								--PreLineWait = 1.1,
								--AngleHeroTowardSource = true,
								PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
								PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
								-- Emote = "PortraitEmoteSurprise",
								Text = "Are you okay? It's really nice to met you Melinoë. You don't have to be scared or anything. I don't know how you know me but you look like you have something to say or ask." },
							{ Cue = "/VO/Melinoe_0002",
								Text = "Not scared. Just cautious. And I do. May I ask you to have a word with Lord Hades. We would like to have an audience. My sister and I we come from very far and would like to stay in the underworld for a while. Not sure if he'll allow it." },
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
							Text = "Father. I request audience to allow these travelers to stay in the courthouse. How long did you say you were staying?" },
						{ Cue = "/VO/Melinoe_1476", Portrait = "Portrait_Melinoe_Default_01", Speaker = "NPC_Melinoe_01",
							Text = "I didn't mention it... Great Lord of the Underworld! We don't know how long we would stay in your domain, but we can garantee we won't nuisance to its order." },
						{ Cue = "/VO/Hades_0417",
							Text = "And how can you garantee? I don't know you and I know everyone. How can I accept such request without knowing your names? It might not be common courtesy in your lands but it is here." },
						{ Cue = "/VO/Makaria_1476", Portrait = "Portrait_Makaria_Smiling_03", Speaker = "NPC_Makaria_01",
							Text = "Oh that's easy! I'm Makaria. It so great to see you. I can believe we get to see the courthouse. How awesome is this!" },
						{ Cue = "/VO/Melinoe_1476", Portrait = "Portrait_Melinoe_Default_01", Speaker = "NPC_Melinoe_01",
							Text = "{#DialogueItalicFormat}Shh!{#PreviousFormat} Don't pay attention to my sister, she's just my easily excited. I am Melinoë and you have my word, we don't mean trouble. We are even willing to clean the courthouse or brush Cerberus if needed." },
						{ Cue = "/VO/Hades_0417",
							Text = "{#DialogueItalicFormat}Mmmh!{#PreviousFormat} Something is off, yet familiar. You make me think of someone. Could it be... {#DialogueItalicFormat}Arg!{#PreviousFormat} Zagreus! You asked the audience, therefore they are now your responsability. They cause trouble, you pay the price. Understood?" },
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
		Locked = 1,
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
		SpawnPointId = 370046
	},
})