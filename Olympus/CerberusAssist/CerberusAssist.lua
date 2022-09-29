
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
		Icon = "Keepsake_Unknown",
		ChamberThresholds =  { 25, 50 },
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
		InRackIcon = "Keepsake_Meg_Plush_Menu",

		--PreEquipWeapons = { "NPC_Goodboy_01_Assist" },
		EquipSound = "/SFX/Menu Sounds/KeepsakeMegLegendary",
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
			CerberusWeapon = "NPC_Goodboy_01_Assist",
			GameStateRequirements = {
				CurrentRoomValueFalse = "BlockHadesAssistTraits",
				RequiredFalseRooms = { "D_Boss01" },
				},
			AssistPresentationPortrait = "Portrait_Cerberus_Default_01",
			AssistPresentationPortraitOffsetY = 55,
			AssistPresentationColor = { 200, 0, 255, 255 },
			AssistPostWeaponSlowDuration = 0.1,
		},
		PropertyChanges =
		{

			--[[{
				WeaponName = "NPC_Goodboy_01_Assist",
				ProjectileProperty = "DamageLow",
				ChangeValue = 5000,
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
			},]]
		},
		RemainingUses = { BaseValue = 1 },
		ExtractValues =
		{
			{
				Key = "RemainingUses",
				ExtractAs = "TooltipKeepsakeUses",
			},
		},
		--[[LoadBinks =
		{
			"Enemy_MegaeraMultiFurySkyDive_Bink",
		},]]
		SignOffData =
		{
		  {
			Text = "MegaeraSignoff",
		  },
		  {
			RequiredAnyTextLines = { "BecameCloseWithMegaera01Meg_GoToHer", "BecameCloseWithMegaera01_BMeg_GoToHer" },
			RequiredFalseTextLines = { "BecameCloseWithMegaera01Meg_BackOff", "BecameCloseWithMegaera01_BMeg_BackOff" },
			Text = "MegaeraSignoff_AssistMax_A"
		  },
		  {
		  	RequiredTextLines = { "MegaeraGift10" },
			RequiredFalseTextLines = { "BecameCloseWithMegaera01Meg_GoToHer", "BecameCloseWithMegaera01_BMeg_GoToHer" },
			Text = "MegaeraSignoff_AssistMax_B"
		  }
		},
	}
    local OlympusAssistUpgradeData = ModUtil.Entangled.ModData(AssistUpgradeData)
	OlympusAssistUpgradeData.GoodBoyAssistTrait = {
		Costs = { 1, 2, 3, 4, 5, },
	}
    local OlympusGiftData = ModUtil.Entangled.ModData(GiftData)    
    --OlympusGiftData.NPC_Cerberus_01[2] = { Gift = "GoodBoyAssistTrait" }
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
        Image = "Codex_Portrait_FuryAssistTrait",
    }
    local OlympusWeaponData = ModUtil.Entangled.ModData(WeaponData)
    OlympusWeaponData.NPC_Goodboy_01_Assist =
	{
		Name = "NPC_Goodboy_01_Assist",
		StartingWeapon = false,
		IgnoreOutgoingDamageModifiers = true,

		FireScreenshake = { Distance = 6, Speed = 400, FalloffSpeed = 1400, Duration = 0.4 },

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
			"Enemy_MegaeraMultiFurySkyDive_Bink"
		},
	}
	function GoodboyAttackSpawn( assistData )
		--ModUtil.Hades.PrintStackChunks(ModUtil.ToString.Deep(assistData)) 
		--[[local locationId = GetClosest({ Id = CurrentRun.Hero.ObjectId, DestinationName = "EnemyTeam", IgnoreInvulnerable = true, IgnoreHomingIneligible = true, Distance = 500, RequiredLocationUnblocked = true })
		if locationId == 0 then
			-- Try again, allowing for blocked targets
			locationId = GetClosest({ Id = CurrentRun.Hero.ObjectId, DestinationName = "EnemyTeam", IgnoreInvulnerable = true, IgnoreHomingIneligible = true, Distance = 500 })
		end
		if locationId == 0 then
			locationId = CurrentRun.Hero.ObjectId
		end]]
		EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = assistData.CerberusWeapon, LoadPackages = true })
		--for i = 1, 2, 1 do
			--local targetId = SpawnObstacle({ Name = "BlankObstacle", Group = "FX_Terrain", DestinationId = locationId, OffsetX = 0, OffsetY = 0 })
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("1")) 
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("2")) 
			FireWeaponFromUnit({ Weapon = assistData.CerberusWeapon, Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })		
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("3")) 
			--Destroy({ Id = targetId })	
			--wait(2, RoomThreadName)
		--end
		ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Finish")) 
	
		--[[wait(1, RoomThreadName)
		local consumableData = DeepCopyTable( assistData )
		consumableData.DestinationId = targetId
		consumableData.NotRequiredPickup = true
		GiveRandomConsumables( consumableData )]]
	end
	
	ModUtil.Path.Wrap( "DoAssist", 
		function(baseFunc, unit)	
			baseFunc(unit)	
			ModUtil.Hades.PrintStackChunks(ModUtil.ToString("After Do Assist")) 
		end)
	ModUtil.Path.Wrap( "BeginOpeningCodex", 
		function(baseFunc)		
			if (not CanOpenCodex()) and IsSuperValid() then
				BuildSuperMeter(CurrentRun, 50)
			end
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString.TableKeys(ModUtil.Mods.Data)) 
			
			--InitializeGiftData()
			baseFunc()
		end
	)
	--[[OnWeaponFired{
		function( triggerArgs )
	
			if triggerArgs.OwnerTable.ObjectId == CurrentRun.Hero.ObjectId then
				CheckPlayerOnFirePowers( triggerArgs )
			end
			local weaponData = GetWeaponData(triggerArgs.OwnerTable, triggerArgs.name)
			ModUtil.Hades.PrintStackChunks(ModUtil.ToString.Deep(weaponData)) 
			if weaponData == nil then
				return
			end	
			--CurrentRun.WeaponsFiredRecord[weaponData.Name] = (CurrentRun.WeaponsFiredRecord[weaponData.Name] or 0) + 1
		end}]]
end