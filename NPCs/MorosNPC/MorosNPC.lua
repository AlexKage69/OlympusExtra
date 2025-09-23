local OlympusUnitSetData = ModUtil.Entangled.ModData(UnitSetData)
local OlympusObstacleData = ModUtil.Entangled.ModData(ObstacleData)
local OlympusDeathLoopData = ModUtil.Entangled.ModData(DeathLoopData)
local OlympusRoomSetData = ModUtil.Entangled.ModData(RoomSetData)
local OlympusEncounterSets = ModUtil.Entangled.ModData(EncounterSets)
local OlympusGameData = ModUtil.Entangled.ModData(GameData)
local OlympusGiftData = ModUtil.Entangled.ModData(GiftData)
local OlympusGiftOrdering = ModUtil.Entangled.ModData(GiftOrdering)
local OlympusColor = ModUtil.Entangled.ModData(Color)
OlympusColor.MorosVoice = { 93,19,52,255 }
-- Makaria, Id = 370025, 370024, 370002
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
					-- Not funny.
					{ Cue = "/VO/ZagreusHome_3389" },
				},
			},
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "Moros? How long has it been? Is my father making you work too much again? I haven't seen you of late." },
			{ Cue = "/VO/Moros_0001",
				Text = "Prince! Your father does nothing of the sort. Archive needs to be manage. Therefort here I am. " },
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "Still seems like a lot of effort to be working in the archive all the time. You could say you were send to your doom" },
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
		[1] = { },
		[4] = { RequiredResource = "SuperGiftPoints" },
		UnlockGameStateRequirements = { RequiredTextLines = { "Test1" } }
	}
	
table.insert(OlympusGiftOrdering, 1, "ForceZeusBoonTrait")
--[[table.insert(OlympusDeathLoopData.DeathArea.StartUnthreadedEvents, {
	FunctionName = "HandleMorosSpawn",
	GameStateRequirements =
	{
		RequiredFalseFlags = { "InFlashback" },
	},
})]]

function HandleMorosSpawn( eventSource )
	local currentRun = CurrentRun
	local currentRoom = CurrentRun.CurrentRoom
	local newUnit = DeepCopyTable( EnemyData.NPC_Nyx_01 )
	local spawnPointId = 370026
	newUnit.ObjectId = SpawnUnit({ Name = "NPC_Nyx_01", Group = "Standing", DestinationId = spawnPointId })
	
	--newUnit.ObjectId = SpawnUnit({ Name = "NPC_Nyx_01", Group = "Standing", DestinationId = spawnPointId })
	newUnit.OeId = newUnit.ObjectId
	--currentRun.TheseusId = newUnit.TheseusId
	SetupEnemyObject( newUnit, CurrentRun, { IgnoreAI = true, PreLoadBinks = true, } )
	UseableOn({ Ids = newUnit.ObjectId })
	--SetupAI( CurrentRun, newUnit )

	local enemyData = DeepCopyTable( EnemyData.NPC_Nyx_01 )
	if IsActivationEligible( newUnit.ObjectId, enemyData ) then
		ModUtil.Hades.PrintStackChunks(ModUtil.ToString(newUnit.Name)) 		
		Activate({ Ids = newUnit.ObjectId })
	end
	newUnit.CanReceiveGift = true
end
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
OnAnyLoad{"RoomOpening", function()
	SpawnExtraNPCs({Name = "NPC_Moros_01", SpawnPointId = 410716}) -- 370026
end
}
OnAnyLoad{"DeathAreaBedroom", function()
	ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Calling"))
	SpawnExtraNPCs({Name = "NPC_Moros_01", SpawnPointId = 426209}) -- 370026
end
}
OnAnyLoad{"DeathArea", function()
	ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Calling"))
	SpawnExtraNPCs({Name = "NPC_Moros_01", LocationX = 2153.402832, LocationY = 3660.359375}) -- 370026
	--SpawnExtraNPCs({Name = "NPC_Moros_01", SpawnPointId = CurrentRun.Hero.ObjectId}) -- 370026
end
}
OnAnyLoad{"DeathAreaOffice", function()
	ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Calling"))
	SpawnExtraNPCs({Name = "NPC_Moros_01", SpawnPointId = 487882}) -- 370026
end
}
function SpawnExtraNPCs(args)
	local obstacleId = GetFirstValue(GetInactiveIdsByType({ Name = args.Name }))
	if args.Name == nil or obstacleId == nil then
		ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Fail loading character")) 				
		return
	end
	if args.SpawnPointId == nil then
		if args.LocationX ~= nil and args.LocationY ~= nil then
			args.SpawnPointId = SpawnObstacle({ Name = "InvisibleTarget", LocationX = args.LocationX, LocationY = args.LocationY })
		else
			args.SpawnPointId = CurrentRun.Hero.ObjectId
		end
	end

	local newUnit = DeepCopyTable( EnemyData[args.Name] )
	
	ModUtil.Hades.PrintStackChunks(ModUtil.ToString(IsActivationEligible( obstacleId, newUnit ))) 		
	if IsActivationEligible( obstacleId, newUnit ) then
		newUnit.ObjectId = SpawnUnit({ Name = args.Name, Group = "Standing", DestinationId = args.SpawnPointId })

		SetupEnemyObject( newUnit, CurrentRun, { IgnoreAI = true, PreLoadBinks = true, } )
		UseableOn({ Ids = newUnit.ObjectId })
		SetupAI( CurrentRun, newUnit )		
		if GameState.Gift[args.Name] == nil then
			GameState.Gift[args.Name] = {
				Value =  0,
				--NewTraits = GameState.BefriendPersistentVals["TheseusGiftNewTraits"],
			}
		end

		local enemyData = DeepCopyTable( EnemyData.NPC_Moros_01 )
		if IsActivationEligible( newUnit.ObjectId, enemyData ) then
			Activate({ Ids = newUnit.ObjectId })
		end
		CheckConversations()	
		ModUtil.Hades.PrintStackChunks(ModUtil.ToString(args.Name.." Spawned:"..newUnit.ObjectId)) 		
		ModUtil.Hades.PrintStackChunks(ModUtil.ToString(GameState.Gift[args.Name])) 	
	end
	--[[if IsActivationEligible( id, unitData ) then
			if ShouldRotatorActivate( id, unitData, numActivations, activationCap ) then

				if unitData.Binks ~= nil then
					PreLoadBinks({ Names = unitData.Binks })
				end
				Activate({ Ids = id, DoPresentation = doPresentation })

				local newUnit = DeepCopyTable( unitData )
				newUnit.ObjectId = id
				SetupEnemyObject( newUnit, CurrentRun, args )
				if CurrentRun.AnimationState[newUnit.ObjectId] ~= nil then
					SetAnimation({ DestinationId = newUnit.ObjectId, Name = CurrentRun.AnimationState[newUnit.ObjectId] })
				end
				if CurrentRun.EventState ~= nil then
					local eventState = CurrentRun.EventState[newUnit.ObjectId]
					if eventState ~= nil then
						local eventFunction = _G[eventState.FunctionName]
						if eventFunction ~= nil then
							thread( eventFunction, newUnit, eventState.Args )
						end
					end
				end

				CurrentRun.ActivationRecord[id] = true
				numActivations = numActivations + 1
			else
				if unitData.MissingDistanceTrigger ~= nil then
					local missingUnit = {}
					missingUnit.Name = name
					missingUnit.ObjectId = SpawnObstacle({ Name = "BlankObstacle" })
					local location = GetLocation({ Id = id, CheckInactive = true })
					Teleport({ Id = missingUnit.ObjectId, OffsetX = location.X, OffsetY = location.Y })
					thread( CheckDistanceTrigger, unitData.MissingDistanceTrigger, missingUnit )
				end
			end
		else
			if unitData.ActivationFailedDistanceTrigger ~= nil then
				local missingUnit = {}
				missingUnit.Name = name
				missingUnit.ObjectId = SpawnObstacle({ Name = "BlankObstacle" })
				local location = GetLocation({ Id = id, CheckInactive = true })
				Teleport({ Id = missingUnit.ObjectId, OffsetX = location.X, OffsetY = location.Y })
				thread( CheckDistanceTrigger, unitData.ActivationFailedDistanceTrigger, missingUnit )
			end
		end]]
end
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
ModUtil.Path.Wrap( "BeginOpeningCodex", 
	function(baseFunc)		
		if (not CanOpenCodex()) and IsSuperValid() then
			BuildSuperMeter(CurrentRun, 50)
		end
		--ActivateRotatingNPCs({},{Types={"NPC_Moros_01"}})
		--ForceNextRoomFunc("A_Makaria01")
		--local challengeBaseIds = GetIdsByType({ Name = "NPC_Makaria_01" })
		--GameState.Gift["NPC_Moros_01"] = nil
		--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(GameState.Gift["NPC_Moros_01"])) 
		baseFunc()
	end
)
--OverwriteTableKeys( EnemyData, OlympusUnitSetData.NPCs )(  )
--[[ModUtil.Path.Wrap( "GetGenusName", 
	function(baseFunc, npc)		
		--ForceNextRoomFunc("A_Makaria01")
		--local challengeBaseIds = GetIdsByType({ Name = "NPC_Makaria_01" })
		--GameState.Gift["NPC_Moros_01"] = nil
		--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(GameState.Gift["NPC_Moros_01"])) 
		local npcName =  baseFunc(npc)
		if npcName == "NPC_Moros_01" then
			ModUtil.Hades.PrintStackChunks(ModUtil.ToString(npc)..":"..ModUtil.ToString(npcName))
			ModUtil.Hades.PrintStackChunks(ModUtil.ToString(GiftData[npcName])..":"..ModUtil.ToString(not IsGameStateEligible(CurrentRun, GiftData[npcName].UnlockGameStateRequirements )))
			
		end
		return npcName
	end
)]]

--[[OnUsed{ "NPCs",
	function( triggerArgs )
		if not CurrentRun.Hero.IsDead and triggerArgs.TriggeredByTable ~= nil and triggerArgs.TriggeredByTable.RequiresRoomCleared and not CheckRoomExitsReady( CurrentRun.CurrentRoom ) then
			thread( CannotUseLootPresentation, triggerArgs.triggeredById, triggerArgs.TriggeredByTable )
			return
		end
		local npc = triggerArgs.AttachedTable
		if npc ~= nil then
			--ActivateRotatingNPCs({},{Types={"NPC_Moros_01"}})
			ModUtil.Hades.PrintStackChunks(ModUtil.ToString.TableKeys(npc))
		end
	end
}]]
--Ov
