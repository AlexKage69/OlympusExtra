
if ModUtil ~= nil then

	ModUtil.Mod.Register("CerberusAssist")
--Variables
local DepthDamageMultiplier = 0.0
local DuplicateMultiplier = -0.60
local DuplicateStrongMultiplier = -0.40
local DuplicateVeryStrongMultiplier = -0.20
local OlympusTraitData = ModUtil.Entangled.ModData(TraitData)
OlympusTraitData.GoodBoyAssistTrait =
	{
		Name = "GoodBoyAssistTrait",
		Frame = "Gift",
		Slot = "Assist",
		Icon = "Keepsake_Cerberus_Plush",

		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 2.0,
			},
			Epic =
			{
				Multiplier = 3.0,
			},
			Heroic =
			{
				Multiplier = 4.0,
			},
			Legendary =
			{
				Multiplier = 5.0,
			},
		},
		InRackTitle = "GoodBoyAssistTrait_Rack",
		InRackIcon = "Keepsake_Cerberus_Plush_Menu",

		--PreEquipWeapons = { "NPC_Goodboy_01_Assist" },
		-- EquipSound = "/SFX/Menu Sounds/KeepsakeMegLegendary",
		EquipSound = "/VO/CerberusCuteGrowl_2", 
		KeepsakeRarityGameStateRequirements =
		{
			[1] = {
				AssistUpgradeLevel =
				{
					Name = "GoodBoyAssistTrait",
					Level = 0,
				}
			},
			[2] = {
				AssistUpgradeLevel =
				{
					Name = "GoodBoyAssistTrait",
					Level = 1,
				}
			},
			[3] = {
				AssistUpgradeLevel =
				{
					Name = "GoodBoyAssistTrait",
					Level = 2,
				}
			},
			[4] = {
				AssistUpgradeLevel =
				{
					Name = "GoodBoyAssistTrait",
					Level = 3,
				}
			},
			[5] = {
				AssistUpgradeLevel =
				{
					Name = "GoodBoyAssistTrait",
					Level = 4,
				}
			},
		},
		AddAssist =
		{
			FunctionName = "GoodboyAttackSpawn",
			WeaponName = "NPC_Goodboy_01_Assist",
			GameStateRequirements = {
				CurrentRoomValueFalse = "BlockHadesAssistTraits",
				--RequiredFalseRooms = { "D_Boss01" },
			},
			AssistPresentationPortrait = "Portrait_Cerberus_Default_01",
			AssistPresentationPortraitOffsetY = 55,
			AssistPresentationColor = { 200, 0, 255, 255 },
			AssistPostWeaponSlowDuration = 0.1,
		},
		PropertyChanges =
		{

			{
				WeaponName = "NPC_Goodboy_01_Assist",
				ProjectileProperty = "DamageLow",
				ChangeValue = 2000,
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
				WeaponName = "NPC_Goodboy_01_Assist",
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
		LoadBinks =
		{
			"Cerberus_HadesAssistJumpIn_Bink",
			"Cerberus_HadesAssistRun_Bink"
		},
		SignOffData =
		{
		  {
			Text = "CerberusSignoff",
		  },
		  {
		  	RequiredTextLines = { "CerberusGift09" },
			Text = "CerberusSignoff_AssistMax"
		  }
		},
	}
    local OlympusAssistUpgradeData = ModUtil.Entangled.ModData(AssistUpgradeData)
	OlympusAssistUpgradeData.GoodBoyAssistTrait = {
		Costs = { 1, 2, 3, 4, 5, },
	}
    local OlympusGiftData = ModUtil.Entangled.ModData(GiftData)    
    OlympusGiftData.NPC_Cerberus_01[7] = { Gift = "GoodBoyAssistTrait", RequiredResource = "SuperGiftPoints" }
    local OlympusGiftOrdering = ModUtil.Entangled.ModData(GiftOrdering)    
	table.insert(OlympusGiftOrdering, "GoodBoyAssistTrait")

    local OlympusCodexOrdering = ModUtil.Entangled.ModData(CodexOrdering)
	local OlympusCodex = ModUtil.Entangled.ModData(Codex)
	table.insert(OlympusCodexOrdering.Keepsakes.Order, "GoodBoyAssistTrait")
	
	OlympusCodex.Keepsakes.Entries["GoodBoyAssistTrait"] =
	{
        Entries =
        {
            {
                UnlockThreshold = 1,
                Text = "CodexData_GoodBoyAssistTrait_01",
            },
            {
                UnlockThreshold = 10,
                Text = "CodexData_GoodBoyAssistTrait_02",
            },
        },
        Image = "Codex_Portrait_GoodBoyAssistTrait",
    }
    local OlympusWeaponData = ModUtil.Entangled.ModData(WeaponData)
    OlympusWeaponData.NPC_Goodboy_01_Assist =
	{
		Name = "NPC_Goodboy_01_Assist",
		StartingWeapon = false,
		IgnoreOutgoingDamageModifiers = true,

		FireScreenshake = { Distance = 6, Speed = 200, FalloffSpeed = 1400, Duration = 0.4 },

		AIData =
		{
			PreAttackDuration = 0.0,
			PostAttackDuration = 0.5,

			PreAttackEndFunctionName = "EmptyAI",
			PostTeleportWaitDurationMin = 0.0,
			PostTeleportWaitDurationMax = 0.0,

			AIAttackDistance = 9999,
			AIBufferDistance = 9999,
			SkipMovement = true,
			SkipAngleTowardTarget = true,

			PostAttackTeleportToSpawnPoints = true,
			TeleportationInterval = 0,

			AITrackTargetDuringCharge = false,

			AIFireTicksMin = 60,
			AIFireTicksMax = 60,
			FireCooldown = 0.03,
			CreateOwnTarget = true,
			RandomTargetAngle = true,
			TargetOffsetDistanceMin = 450,
			TargetOffsetDistanceMax = 1450,
			OffsetDistanceScaleY = 0.5,
			ResetTargetPerTick = true,
		},

		HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.12, FalloffSpeed = 3000 },
		HitSimSlowParameters =
		{
			{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
			{ ScreenPreWait = 0.1, Fraction = 1.0, LerpTime = 0 },
		},
		Binks =
		{
			"Cerberus_HadesAssistJumpIn_Bink"
		},
	}
	function GoodboyAttackSpawn( assistData )
		local targetId = SpawnObstacle({ Name = "BlankObstacle", Group = "FX_Terrain", DestinationId = CurrentRun.Hero.ObjectId, OffsetX = -1200, OffsetY = 865 })
		CreateAnimation({ Name = "CerberusAssist", DestinationId = targetId, GroupName = "Overlay" })
		Move({Id = targetId, Angle = 30, Distance = 4000, Duration = 3, SmoothStep = true })
		wait( 0.3 )
		PlaySound({ Name = "/VO/CerberusBarks2" })
		wait( 0.4 )
		PlaySound({ Name = "/VO/CerberusBarks" })
		wait( 0.3 )
		ShakeScreen({ Speed = 900, Distance = 15, Duration = 4, FalloffSpeed = 1400 })
		thread( DoRumble, { { ScreenPreWait = 0.02, LeftFraction = 0.3, Duration = 4.0 }, } )
		PlaySound({ Name = "/SFX/Enemy Sounds/Hades/CerberusSummonCanned" })
		wait( 2.0 )
		StopAnimation({ Name = "CerberusAssist", DestinationId = targetId })
		Destroy({ Id = targetId })
	end
end