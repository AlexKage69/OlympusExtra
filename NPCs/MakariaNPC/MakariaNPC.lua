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
OlympusColor.MakariaVoice = { 93,19,52,255 }
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
		MakariaFirstMeeting =
		{
			Name = "MakariaFirstMeeting",
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
				Text = "Hey Makaria" },
			{ Cue = "/VO/Makaria_0001",
				Text = "Default Makaria " },
			{ Cue = "/VO/Makaria_0001", Portrait = "Portrait_Makaria_Sad_02",
				Text = "Sad Makaria" },
			{ Cue = "/VO/Makaria_0001", Portrait = "Portrait_Makaria_Smiling_03",
				Text = "Smiling Makaria" },
			{ Cue = "/VO/Makaria_0001", Portrait = "Portrait_Makaria_Sorrow_04",
				Text = "Sorrow Makaria" },
			{ Cue = "/VO/ZagreusHome_4000", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
				PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
				PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
				Text = "Still seems like a lot of effort to be working in the archive all the time. You could say you were send to your doom" },
		},
	},

	RepeatableTextLineSets =
	{
		MakariaChat01 =
		{
			UseableOffSource = true,
			EndGlobalVoiceLines = "MiscEndVoiceLines_Nyx",
			{ Cue = "/VO/Nyx_0003",
				Text = "Darkness guide you, child." },
		},
	},

	GiftTextLineSets =
	{
		MakariaGift01 =
			{
				Name = "MakariaGift01",
				PlayOnce = true,
				{ Cue = "/VO/ZagreusHome_0118", Portrait = "Portrait_Zag_Serious_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
					Text = "{#DialogueItalicFormat}Erm{#PreviousFormat}, Makaria? You've done so much for me, I.. thought you might like this." },
				{ Cue = "/VO/Makaria_0445",
					PreLineAnim = "NyxIdleGreeting",
					Text = "You know your father does not like it when Nectar is doled out on the premises, dear child. However, I am not he... and I wished, regardless, to provide to you a token of my affection." },
			},
			MakariaGift02 =
			{
				Name = "MakariaGift02",
				PlayOnce = true,
				RequiredTextLines = { "MakariaGift01" },
				{ Cue = "/VO/Nyx_0045",
					PreLineAnim = "NyxIdleGreeting",
					Text = "How can I possibly accept such generosity, my child? Surely others whom you know are more deserving of such offerings." },
				{ Cue = "/VO/ZagreusHome_0196", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					Text = "Nonsense, Nyx. I want you to have it. You've always cared for me. I can't ever repay you for that." },
			},
			MakariaGift03 =
			{
				Name = "MakariaGift03",
				PlayOnce = true,
				RequiredTextLines = { "MakariaGift02" },
				{ Cue = "/VO/Nyx_0046", Portrait = "Portrait_Nyx_Averted_01",
					PreLineAnim = "NyxIdleGreeting",
					Text = "Your kindness toward me is unnecessary, child. You know I have no expectation of such gifts, from you or anyone." },
				{ Cue = "/VO/ZagreusHome_0197", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					Text = "I think of you always, Nyx. You raised me as your own, and I am grateful for it." },
			},
			MakariaGift04 =
			{
				Name = "MakariaGift04",
				PlayOnce = true,
				RequiredTextLines = { "MakariaGift03" },
				{ Cue = "/VO/Nyx_0047",
					PreLineAnim = "NyxIdleGreeting",
					Text = "You honor me, my child; although I dread that I am not deserving of such generosity. There is no need to flatter me like this." },
				{ Cue = "/VO/ZagreusHome_0198", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Be that as it may, Nyx! I would still like for you to have it, with my compliments." },
			},
			MakariaGift05 =
			{
				Name = "MakariaGift05",
				PlayOnce = true,
				RequiredTextLines = { "MakariaGift04" },
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
table.insert(OlympusGameData.ConversationOrder,"NPC_Makaria_01")
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
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.5,
			}
		},
		--New Data
		InRackTitle = "TroveUpgradeBoonTrait_Rack",
		Icon = "Keepsake_Candle",
		EquipSound = "/SFX/Enemy Sounds/HydraHead/HydraMiscBoneRattle1",
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
		InheritFrom = {"DefaultGiftData"},
		Name = "NPC_Makaria_01",
		MaxedIcon = "Keepsake_Achilles_Max",
		MaxedSticker = "Keepsake_AchillesSticker_Max",
		MaxedRequirement = { RequiredTextLines = { "Test2" }, },
		Locked = 4,
		Maximum = 5,
		[1] = { Gift = "TroveUpgradeBoonTrait" },
		[4] = { RequiredResource = "SuperGiftPoints" },
		UnlockGameStateRequirements = { RequiredTextLines = { "Test1" } }
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
		SpawnPointId = 370036
	},
})
-- Code for ChallengeSwitch modification
ModUtil.Path.Wrap( "HandleChallengeLootDecay", 
	function(baseFunc, challengeSwitch, challengeEncounter )	
		if challengeSwitch.RewardType == "ExtraChance" or challengeSwitch.RewardType == "Boon" or challengeSwitch.RewardType == "CentaurHeart" 
			or challengeSwitch.RewardType == "StackUpgrade" or challengeSwitch.RewardType == "GiftDrop" then
			challengeEncounter.MinValue = 0
		end
		baseFunc(challengeSwitch, challengeEncounter)
	end
)
ModUtil.Path.Wrap( "HandleChallengeLoot", 
	function(baseFunc, challengeSwitch, challengeEncounter )	
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
				GameState.CompletedSwitchChallengeReward.Money =  GameState.CompletedSwitchChallengeReward.Money + 1
			elseif challengeSwitch.RewardType == "Health" then
				CurrentRun.SwitchChallengeReward.Health = CurrentRun.SwitchChallengeReward.Health + 1
				GameState.CompletedSwitchChallengeReward.Health =  GameState.CompletedSwitchChallengeReward.Health + 1
			elseif challengeSwitch.RewardType == "MetaPoints" then
				CurrentRun.SwitchChallengeReward.MetaPoints = CurrentRun.SwitchChallengeReward.MetaPoints + 1
				GameState.CompletedSwitchChallengeReward.MetaPoints =  GameState.CompletedSwitchChallengeReward.MetaPoints + 1
			elseif challengeSwitch.RewardType == "Gems" then
				CurrentRun.SwitchChallengeReward.Gems = CurrentRun.SwitchChallengeReward.Gems + 1
				GameState.CompletedSwitchChallengeReward.Gems =  GameState.CompletedSwitchChallengeReward.Gems + 1
			end
			local angle = GetAngleBetween({ Id = challengeSwitch.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
			if challengeSwitch.CurrentValue == 0 then
				GameState.CompletedSwitchChallengeReward.Failed =  GameState.CompletedSwitchChallengeReward.Failed + 1
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
					GameState.CompletedSwitchChallengeReward.ExtraChance =  GameState.CompletedSwitchChallengeReward.ExtraChance + 1
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
					GameState.CompletedSwitchChallengeReward.Boon =  GameState.CompletedSwitchChallengeReward.Boon + 1
					local reward = GiveLoot({ SpawnPoint = CurrentRun.Hero.ObjectId })
					ApplyUpwardForce({ Id = reward.Id, Speed = RandomFloat( 500, 700 ) })
					ApplyForce({ Id = reward.Id, Speed = RandomFloat( 50, 100 ), Angle = angle, SelfApplied = true })
				elseif challengeSwitch.RewardType == "CentaurHeart" then
					CurrentRun.SwitchChallengeReward.CentaurHeart = CurrentRun.SwitchChallengeReward.CentaurHeart + 1
					GameState.CompletedSwitchChallengeReward.CentaurHeart =  GameState.CompletedSwitchChallengeReward.CentaurHeart + 1
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
					GameState.CompletedSwitchChallengeReward.StackUpgrade =  GameState.CompletedSwitchChallengeReward.StackUpgrade + 1
					local reward = CreateStackLoot({ SpawnPoint = CurrentRun.Hero.ObjectId, Cost = 0, DoesNotBlockExit = false, StackNum = 1 })
					ApplyUpwardForce({ Id = reward.Id, Speed = RandomFloat( 500, 700 ) })
					ApplyForce({ Id = reward.Id, Speed = RandomFloat( 50, 100 ), Angle = angle, SelfApplied = true })
				elseif challengeSwitch.RewardType == "GiftDrop" then
					CurrentRun.SwitchChallengeReward.GiftDrop = CurrentRun.SwitchChallengeReward.GiftDrop + 1
					GameState.CompletedSwitchChallengeReward.GiftDrop =  GameState.CompletedSwitchChallengeReward.GiftDrop + 1
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
					CurrentRun.SwitchChallengeReward[challengeSwitch.RewardType] = CurrentRun.SwitchChallengeReward[challengeSwitch.RewardType] + 1
					GameState.CompletedSwitchChallengeReward[challengeSwitch.RewardType] =  GameState.CompletedSwitchChallengeReward[challengeSwitch.RewardType] + 1
					
				end
			end
		end
	end
)
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
})