-- Separate Gods from Goddess to add more gods

if ModUtil ~= nil then

	ModUtil.Mod.Register("HestiaExtra")
	
	local mod = "HestiaExtra"
	local package = "HestiaPackage"
	--Variables
	local DepthDamageMultiplier = 0.0
	local DuplicateMultiplier = -0.60
	local DuplicateStrongMultiplier = -0.40
	local DuplicateVeryStrongMultiplier = -0.20
	--Color
	local OlympusColor = ModUtil.Entangled.ModData(Color)
	OlympusColor.HestiaVoice = {123, 22, 53,255}
	OlympusColor.HestiaDamageLight = {123, 22, 53,255} 
	OlympusColor.HestiaDamage = {123, 22, 53,255}
	--EnemyUpgradeData
	local OlympusEnemyUpgradeData = ModUtil.Entangled.ModData(EnemyUpgradeData)
	OlympusEnemyUpgradeData.HestiaUpgrade =
	{
		ScreenPanel = nil,
		UpgradeString = "LtUpgrade_Hestia",
		--AddSpecialWeapons = { ContinuousWeapon = "DevotionZeus" },
		LieutenantsOnly = true,
		Hidden = true,
		PropertyChanges = { },
	}
	--QuestData
	local OlympusQuestData = ModUtil.Entangled.ModData(QuestData)
	OlympusQuestData.HestiaUpgrades =
	{
		InheritFrom = { "DefaultQuestItem" },
		RewardResourceName = "Gems",
		RewardResourceAmount = 150,
		UnlockGameStateRequirements =
		{
			RequiredTextLines = { "HestiaGift01", },
		},
		CompleteGameStateRequirements =
		{
			RequiredTraitsTaken =
			{
				"HestiaWeaponTrait",
				"HestiaDashTrait",
				"HestiaRangedTrait",
				"HestiaSecondaryTrait",
				--"HestiaShoutTrait",				
				--"StrongAttractionTrait",
				--"HestiaRevengeTrait",
				--"HealthDefianceTrait",
				--"HealthDamageTrait",			
				--"LavaDeathTrait",	
				--"LavaResistTrait",
				--"LavaLongerTrait",
				--"LavaAutoTrait",
			},
		},
	}
	local OlympusQuestOrderData = ModUtil.Entangled.ModData(QuestOrderData)
	table.insert(OlympusQuestOrderData, 30, "HestiaUpgrades")
	
	--UnitSetData
	local OlympusEnemyData = ModUtil.Entangled.ModData(EnemyData)
	OlympusEnemyData.HestiaUpgradeRoomWeapon = {
		InheritFrom = { "PassiveRoomWeapon" },
	
		DefaultAIData =
		{
			DeepInheritance = true,
			PreAttackDuration = 0,
			FireDuration = 0.0,
			PostAttackDuration = 0.0,
			PostAttackCooldownMin = 2.0,
			PostAttackCooldownMax = 2.5,
			CreateOwnTargetFromOriginalTarget = true,
			RandomTargetAngle = true,
			TargetOffsetDistanceMin = 0,
			TargetOffsetDistanceMax = 0,
			TeleportToTargetId = true,
			TargetFriends = true,
		},
	
		WeaponOptions =
		{
			"DevotionHestia",
		},
	}
	--WeaponData
	local OlympusWeaponSets = ModUtil.Entangled.ModData(WeaponSets)
	local OlympusWeaponData = ModUtil.Entangled.ModData(WeaponData)
	local OlympusEffectData = ModUtil.Entangled.ModData(EffectData)

	table.insert(OlympusWeaponSets.ExpireProjectileExcludeProjectileNames, "HestiaProjectile")	
	OlympusWeaponData.HestiaShoutWeapon = {
		BlockWrathGain = true,
	}
	OlympusWeaponData.DevotionHestia =
	{
		HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.08, FalloffSpeed = 3000 },
		HitSimSlowParameters =
		{
			{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
			{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0 },
		},
	}
	OlympusWeaponData.TheseusHestiaUpgradeWrath =
	{
		HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.08, FalloffSpeed = 3000 },
		HitSimSlowParameters =
		{
			{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
			{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0 },
		},
		BlockInterrupt = true,

		AIData =
		{
			FireTicks = 30,
			FireCooldown = 0.15,
			ResetTargetPerTick = true,
			AIAngleTowardsPlayerWhileFiring = true,
			PreAttackAnimation ="Theseus_WrathStart",
			FireAnimation = "Theseus_WrathAirLoop",
			PostAttackAnimation = "Theseus_WrathReturnToIdle",
			PostAttackDuration = 0.6,

			WrathVoiceLines =
			{
				Queue = "Interrupt",
				{
					RandomRemaining = true,
					PreLineWait = 0.1,
					CooldownTime = 40,
					CooldownName = "TheseusWrathLinesPlayedRecently",
					SuccessiveChanceToPlay = 0.5,

					-- Lord Hestia, sing for me!
					{ Cue = "/VO/Theseus_0600" },
					-- Lord Hestia, play me a song!
					{ Cue = "/VO/Theseus_0601" },
				},
				[2] = GlobalVoiceLines.TheseusWrathActivationVoiceLines,
				[3] = HeroVoiceLines.TheseusWrathReactionVoiceLines_M,
			},
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/SFX/Player Sounds/ElectricZapSmall" },
			},
		},
	}
	OlympusWeaponData.TheseusHestiaUpgradePassive =
	{
		HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.08, FalloffSpeed = 3000 },
		HitSimSlowParameters =
		{
			{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
			{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0 },
		},

		AIData = {
			FireTicks = 1,
			FireInterval = 3,

			AttackSlotsPerTick = 15,
			AttackSlotInterval = 0.01,
			AttackSlots =
			{
				-- inner circle
				{ Angle = 0, OffsetDistance = 0, OffsetScaleY = 0.48, UseTargetPosition = true },
				{ Angle = 30, OffsetDistance = 750, OffsetScaleY = 0.48, UseTargetPosition = true},
				{ Angle = 150, OffsetDistance = 750, OffsetScaleY = 0.48, UseTargetPosition = true},
				{ Angle = 210, OffsetDistance = 750, OffsetScaleY = 0.48, UseTargetPosition = true},
				{ Angle = 330, OffsetDistance = 750, OffsetScaleY = 0.48, UseTargetPosition = true, PauseDuration = 1.0},
				{ Angle = 0, OffsetDistance = 0, OffsetScaleY = 0.48, UseTargetPosition = true },
				{ Angle = 30, OffsetDistance = 750, OffsetScaleY = 0.48, UseTargetPosition = true},
				{ Angle = 90, OffsetDistance = 750, OffsetScaleY = 0.48, UseTargetPosition = true},
				{ Angle = 210, OffsetDistance = 750, OffsetScaleY = 0.48, UseTargetPosition = true},
				{ Angle = 270, OffsetDistance = 750, OffsetScaleY = 0.48, UseTargetPosition = true, PauseDuration = 1.0},
				{ Angle = 0, OffsetDistance = 0, OffsetScaleY = 0.48, UseTargetPosition = true },
				{ Angle = 90, OffsetDistance = 750, OffsetScaleY = 0.48, UseTargetPosition = true},
				{ Angle = 150, OffsetDistance = 750, OffsetScaleY = 0.48, UseTargetPosition = true},
				{ Angle = 270, OffsetDistance = 750, OffsetScaleY = 0.48, UseTargetPosition = true},
				{ Angle = 330, OffsetDistance = 750, OffsetScaleY = 0.48, UseTargetPosition = true, PauseDuration = 1.0},
			},
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/SFX/Player Sounds/ElectricZapSmall" },
			},
		},
	}
	-- GlobalVoiceLines
	local OlympusGlobalVoiceLines = ModUtil.Entangled.ModData(GlobalVoiceLines)
	local OlympusHeroVoiceLines = ModUtil.Entangled.ModData(HeroVoiceLines)
	table.insert(OlympusGlobalVoiceLines.BoonUsedVoiceLines, {
		BreakIfPlayed = true,
		RandomRemaining = true,
		PreLineWait = 0.5,
		RequiredLastGodLoot = "HestiaUpgrade",
		RequiredEncounters = { "DevotionTestTartarus", "DevotionTestAsphodel", "DevotionTestElysium", },
		RequireCurrentEncounterNotComplete = true,
		Source = { SubtitleColor = Color.HestiaVoice },
	
		-- Well done, Zagzag.
		{ Cue = "/VO/Hestia_0149" },
		-- I knew you had it in you.
		{ Cue = "/VO/Hestia_0150" },
		-- I see a bright future.
		{ Cue = "/VO/Hestia_0151" },
		-- There's no one like you, Zagzag.
		{ Cue = "/VO/Hestia_0152" },
		-- I'll write you a song for this!
		{ Cue = "/VO/Hestia_0153" },
		-- Just... Thank you.
		{ Cue = "/VO/Hestia_0154" },
		-- Underworld, I want to hear you make some noise!
		{ Cue = "/VO/Hestia_0155" },
		-- Let's get you out this time around!
		{ Cue = "/VO/Hestia_0156" },
		-- We can go the distance together!
		{ Cue = "/VO/Hestia_0157" },
		-- Another one bites the Styx!
		{ Cue = "/VO/Hestia_0158" },
		-- Light is on your side!
		{ Cue = "/VO/Hestia_0159" },
		-- Let's try this once more, with feeling!
		{ Cue = "/VO/Hestia_0160" },
	})
	table.insert(OlympusHeroVoiceLines.UpgradePickedVoiceLines, {
		RandomRemaining = true,
		BreakIfPlayed = true,
		SuccessiveChanceToPlay = 0.5,
		PreLineWait = 0.75,
		RequiredLastGodLoot = "HestiaUpgrade",
		-- For the light.
		{ Cue = "/VO/ZagreusField_4819" },
		-- I can hear it.
		{ Cue = "/VO/ZagreusField_4820" },
		-- That's my jam.
		{ Cue = "/VO/ZagreusField_4821" },
		-- Music to my ears.
		{ Cue = "/VO/ZagreusField_4822" },
		-- Nice beat.
		{ Cue = "/VO/ZagreusField_4823" },
		-- Musical.
		{ Cue = "/VO/ZagreusField_4824" },
		-- Our duet continues.
		{ Cue = "/VO/ZagreusField_4825" },
		-- Beat it.
		{ Cue = "/VO/ZagreusField_4826" },
		-- That's bright.
		{ Cue = "/VO/ZagreusField_4827" },
		-- Flashy.
		{ Cue = "/VO/ZagreusField_4828" },
	})
	--BoonInfoScreenData
	local OlympusBoonInfoScreenData = ModUtil.Entangled.ModData(BoonInfoScreenData)
	table.insert(OlympusBoonInfoScreenData.Ordering, "HestiaUpgrade")
	
	--ProjectileData
	local OlympusProjectileData = ModUtil.Entangled.ModData(ProjectileData)
	OlympusProjectileData.HestiaColorProjectile = {
		DamageTextStartColor = OlympusColor.HestiaDamageLight,
		DamageTextColor = OlympusColor.HestiaDamage
	}
	OlympusProjectileData.HestiaProjectile = {
		InheritFrom = { "HestiaColorProjectile" },
	}
	OlympusProjectileData.HestiaShoutWeapon = {
		InheritFrom = { "NoSlowFrameProjectile", "NoShakeProjectile" },
	}
	-- GameData
	local OlympusGameData = ModUtil.Entangled.ModData(GameData)
	OlympusGameData.HestiaBasicPickUpTextLines = {
		"HestiaFirstPickUp",
		"HestiaMiscPickup01",
		"HestiaMiscPickup02",
		"HestiaMiscPickup03",
		-- "HestiaMiscPickup04",
		"HestiaMiscPickup05",
		"HestiaMiscPickup06",
		"HestiaMiscPickup07",
		"HestiaMiscPickup08",
		"HestiaMiscPickup09",
		-- "HestiaMiscPickup10",
		"HestiaMiscPickup11",
		"HestiaMiscPickup12",
		"HestiaMiscPickup13",
		"HestiaMiscPickup14",
		"HestiaMiscPickup15",
		"HestiaMiscPickup16",
		"HestiaMiscPickup17",
		-- "HestiaMiscPickup18",
		-- "HestiaMiscPickup19",
		"HestiaMiscPickup20",
		-- "HestiaMiscPickup21",
	}
	table.insert(OlympusGameData.ConversationOrder, "HestiaUpgrade")
	table.insert(OlympusGameData.RunClearMessageData.ClearWeaponsFiredWrath.GameStateRequirements.RequiredWeaponsFiredThisRun.Names, "HestiaBeamWeapon")
	ModUtil.Table.Merge(OlympusGameData.GodAboutGodVoiceLines, { 
		"HestiaAboutZeus01", "HestiaAboutStepSiblings01", "HestiaAboutDaughters01",
		"HestiaAboutDaughters02", "HestiaAboutDaughters03", "HestiaAboutDaughters04",
		"HestiaAboutDaughters05", "HestiaAboutHydra", "HestiaAboutDaphne01",
		"HestiaAboutPan01", "HestiaAboutArtemis01", "HestiaAboutArtemis02",
		"HestiaAboutArtemis03", "HestiaAboutMusic01", "HestiaAboutHarpQuest01",
		"HestiaAboutHarpQuest02", "HestiaAboutOrpheus01", "HestiaAboutOrpheus02" }
	)
	--Keywords
	local OlympusKeywordList = ModUtil.Entangled.ModData(KeywordList)
	ModUtil.Table.Merge(OlympusKeywordList, { "LavaSplash", "CentaurHeart", "CentaurSoul", "MiniBoss" })

	-- This is not working since the Icons are too big or small to be used and there's no Scale.
	--[[local OlympusIconData = ModUtil.Entangled.ModData(IconData)
	OlympusIconData.CentaurHeart = {
		TexturePath = "GUI\\Icons\\HealthExtra",
		UseTooltip = false,
		TextSymbolScale = 0.5,
	}
	OlympusIconData.CentaurSoul = {
		TexturePath = "GUI\\Icons\\UnLife",
		UseTooltip = false,
		TextSymbolScale = 0.5,
	}
	for iconName, iconData in pairs( OlympusIconData ) do
		Icons[iconName] = iconData.TexturePath
		IconTooltips[iconName] = iconData.UseTooltip
	end]]
	
	-- Codex Section
	local OlympusCodexOrdering = ModUtil.Entangled.ModData(CodexOrdering)
	local OlympusCodex = ModUtil.Entangled.ModData(Codex)
	table.insert(OlympusCodexOrdering.OlympianGoddess.Order, "HestiaUpgrade")
	
	OlympusCodex.OlympianGoddess.Entries["HestiaUpgrade"] =
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
	
	-- Trait Section
	local OlympusTraitData = ModUtil.Entangled.ModData(TraitData)
	
	OlympusTraitData.ForceHestiaBoonTrait = {
		Name = "ForceHestiaBoonTrait",
			InheritFrom = { "GiftTrait" },
			--Inherit		
			Frame = "Gift",
			Slot = "Keepsake",
			RecordCacheOnEquip = true,
			ChamberThresholds =  { 25, 50 },
	
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
			InRackTitle = "ForceHestiaBoonTrait_Rack",
			Icon = "Keepsake_Ember",
			EquipSound = "/SFX/Enemy Sounds/Megaera/MegaeraFlameBurst",
			ForceBoonName = "HestiaUpgrade",
			Uses = 1,
			RarityBonus =
			{
				RequiredGod = "HestiaUpgrade",
				RareBonus = { BaseValue = 0.1 },
				EpicBonus = 0.1,
				LegendaryBonus = 0.1,
				ExtractValues =
				{
					{
						Key = "RareBonus",
						ExtractAs = "TooltipBonusChance",
						Format = "Percent",
					}
				}
			},
			SignOffData =
			{
			  {
				Text = "HestiaSignoff",
			  },
			  {
				RequiredTextLines = { "HestiaGift07" },
				Text = "HestiaSignoff_Max"
			  }
			},
	}
	OlympusTraitData.HestiaWeaponTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Hestia",
		Slot = "Melee",
		Icon = "Boon_Hestia_01",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.20,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		OnWeaponProjectileDeathFunction =
		{ -- "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3", 
			ValidWeapons = { "ShieldWeaponRush", "SniperGunWeapon", "SniperGunWeaponDash", "GunWeapon", "GunWeaponDash","BowWeapon", "BowWeaponDash" },
			FunctionName = "CheckProjectileVacuumAllNearbyEnemies",
			FunctionArgs =
			{
				From = "OnWeaponProjectileDeathFunction",
				SpearWeaponSpin = {
					Range = 1000,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 50,
				},
				SpearWeaponSpin2 = {
					Range = 1000,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 50,
				},
				SpearWeaponSpin3 = {
					Range = 1000,
					PullForce = 2000,
					Arc = 90,
					Count = 3,
					Distance = 50,
				},
				ShieldWeaponRush = {
					Range = 700,
					PullForce = 1000,
					Arc = 360,
					Count = 3,
					Distance = 50,
					RequireFirstHit = true,
				},
				SniperGunWeapon = {
					Range = 700,
					PullForce = 900,
					Arc = 360,
					Count = 3,
					Distance = 50,
					RequireFirstHit = true,
				},
				SniperGunWeaponDash = {
					Range = 700,
					PullForce = 900,
					Arc = 360,
					Count = 3,
					Distance = 50,
					RequireFirstHit = true,
				},
				GunWeapon = {
					Range = 700,
					PullForce = 900,
					Arc = 360,
					Count = 3,
					Distance = 50,
					RequireFirstHit = true,
				},
				GunWeaponDash = {
					Range = 700,
					PullForce = 900,
					Arc = 360,
					Count = 3,
					Distance = 50,
					RequireFirstHit = true,
				},
				BowWeapon = {
					Range = 700,
					PullForce = 4000,
					Arc = 360,
					Count = 3,
					Distance = 50,
					RequireFirstHit = true,
				},
				BowWeaponDash = {
					Range = 700,
					PullForce = 4000,
					Arc = 360,
					Count = 3,
					Distance = 50,
					RequireFirstHit = true,
				},
			}
		},
		OnWeaponChargeFunctions =
		{
			ValidWeapons = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
			FunctionName = "CheckChargeVacuumAllNearbyEnemies",
			FunctionArgs =
			{
				From = "OnWeaponChargeFunctions",
				SpearWeaponSpin = {
					Range = 1000,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 100,
				},
				SpearWeaponSpin2 = {
					Range = 1000,
					PullForce = 2000,
					Arc = 360,
					Count = 3,
					Distance = 100,
				},
				SpearWeaponSpin3 = {
					Range = 1000,
					PullForce = 2000,
					Arc = 90,
					Count = 3,
					Distance = 100,
				},
			}
		},
		OnWeaponFiredFunctions =
		{
			ValidWeapons = { "SwordWeapon", "SwordWeapon2", "SwordWeapon3", "SwordWeaponDash", "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash", "ShieldWeapon", "ShieldWeaponDash", "FistWeaponDash", "FistWeapon", "FistWeapon2","FistWeapon3","FistWeapon4","FistWeapon5", },
			FunctionName = "CheckFiredVacuumAllNearbyEnemies",
			FunctionArgs =
			{
				From = "OnWeaponFiredFunctions",
				SwordWeapon = {
					Range = 800,
					PullForce = 1500,
					Arc = 90,
					Count = 3,
					Distance = 100,
					RequireFacing = true,
				},
				SwordWeapon2 = {
					Range = 800,
					PullForce = 1500,
					Arc = 90,
					Count = 3,
					Distance = 100,
					RequireFacing = true,
				},
				SwordWeapon3 = {
					Range = 800,
					PullForce = 1500,
					Arc = 90,
					Count = 3,
					Distance = 100,
					RequireFacing = true,
				},
				SwordWeaponDash = {
					Range = 800,
					PullForce = 1500,
					Arc = 90,
					Count = 3,
					Distance = 100,
					RequireFacing = true,
				},
				SpearWeapon = {
					Range = 1100,
					PullForce = 1500,
					Arc = 60,
					Count = 3,
					Distance = 300,
					RequireFacing = true,
				},
				SpearWeapon2 = {
					Range = 1100,
					PullForce = 1500,
					Arc = 60,
					Count = 3,
					Distance = 300,
					RequireFacing = true,
				},
				SpearWeapon3 = {
					Range = 1100,
					PullForce = 1500,
					Arc = 60,
					Count = 3,
					Distance = 300,
					RequireFacing = true,
				},
				SpearWeaponDash = {
					Range = 1100,
					PullForce = 1500,
					Arc = 60,
					Count = 3,
					Distance = 300,
					RequireFacing = true,
				},
				ShieldWeapon = {
					Range = 700,
					PullForce = 1000,
					Arc = 120,
					Count = 3,
					Distance = 150,
					RequireFacing = true,
				},
				ShieldWeaponDash = {
					Range = 700,
					PullForce = 1000,
					Arc = 120,
					Count = 3,
					Distance = 150,
					RequireFacing = true,
				},
				FistWeaponDash = {
					Range = 800,
					PullForce = 500,
					Arc = 90,
					Count = 3,
					Distance = 50,
					RequireFacing = true,
				},
				FistWeapon = {
					Range = 800,
					PullForce = 500,
					Arc = 90,
					Count = 3,
					Distance = 50,
					RequireFacing = true,
				},
				FistWeapon2 = {
					Range = 800,
					PullForce = 500,
					Arc = 90,
					Count = 3,
					Distance = 50,
					RequireFacing = true,
				},
				FistWeapon3 = {
					Range = 800,
					PullForce = 500,
					Arc = 90,
					Count = 3,
					Distance = 50,
					RequireFacing = true,
				},
				FistWeapon4 = {
					Range = 800,
					PullForce = 500,
					Arc = 90,
					Count = 3,
					Distance = 50,
					RequireFacing = true,
				},
				FistWeapon5 = {
					Range = 800,
					PullForce = 500,
					Arc = 90,
					Count = 3,
					Distance = 50,
					RequireFacing = true,
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "SwordWeapon",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeB-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon2",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon3",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearDashSwipe-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin2",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowCharge-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponName = "BowWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeFast-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponDash",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipeDash-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "Graphic",
				ChangeValue = "ShieldRush3D-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "ShieldRush3D-Out-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxHestia",
				ChangeType = "Absolute"
			},
			{
				WeaponName = "FistWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "FistFxSwipeHestia",
				ChangeType = "Absolute",
			},

			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Hestia-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeA-Hestia-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Hestia-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Hestia-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowBondTrait",
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowChargeRama-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowBondTrait",
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeRamaDash-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowBondTrait",
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "RamaWideShot-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunLaser-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "GunLaserOriginFlare-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "TipFx",
				ChangeValue = "GunLaserTipFlare-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "GunCharge-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "GunLaserEnd-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "ShieldLoadAmmoTrait",
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "BeowulfShieldSlam-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowMarkHomingTrait",
				WeaponNames = { "BowWeapon" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Hestia-Alt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = { "BowWeapon" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Hestia-Alt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon", "FistWeapon3", "FistWeapon5" },
				TraitName = "FistDetonateTrait",
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipe-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2", "FistWeapon4" },
				TraitName = "FistDetonateTrait",
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeFlipped-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				TraitName = "FistDetonateTrait",
				ProjectileProperty = "Graphic",
				ChangeValue = "null",
				ChangeType = "Absolute"
			},
			{
				WeaponNames = { "FistWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "ClawSwipeFlippedDash-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	}
	OlympusTraitData.HestiaSecondaryTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Hestia",
		Slot = "Secondary",
		Icon = "Boon_Hestia_00",
		RequiredFalseTraits = { "FistVacuumTrait", "FistChargeSpecialTrait", "FistSpecialFireballTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.4,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroSecondaryWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		OnWeaponProjectileDeathFunction =
		{ -- "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3", 
			ValidWeapons = { "SpearWeaponThrow", "ShieldThrow", "ShieldThrowDash", "BowSplitShot", "GunBombImmolation", "GunGrenadeToss" },
			FunctionName = "CheckProjectileVacuumAllNearbyEnemies",
			FunctionArgs =
			{
				From = "OnWeaponProjectileDeathFunction",
				SwordParry = {
					Range = 1000,
					PullForce = 990,
					Arc = 360,
					Count = 3,
					Distance = 150,
				},
				SpearWeaponThrow = {
					Range = 1000,
					PullForce = 990,
					Arc = 180,
					Count = 3,
					Distance = 150,
				},
				ShieldThrow = {
					Range = 1000,
					PullForce = 990,
					Arc = 360,
					Count = 3,
					Distance = 150,
				},
				ShieldThrowDash = {
					Range = 1000,
					PullForce = 990,
					Arc = 360,
					Count = 3,
					Distance = 150,
				},
				BowSplitShot = {
					Range = 1000,
					PullForce = 990,
					Arc = 360,
					Count = 3,
					Distance = 150,
				},
				GunBombImmolation = {
					Range = 1000,
					PullForce = 990,
					Arc = 360,
					Count = 3,
					Distance = 150,
					RequireFirstHit = true,
				},
				GunGrenadeToss = {
					Range = 1000,
					PullForce = 990,
					Arc = 360,
					Count = 3,
					Distance = 150,
					RequireFirstHit = true,
				},
				FistWeaponSpecial = {
					Range = 1000,
					PullForce = 990,
					Arc = 90,
					Count = 3,
					Distance = 50,
					RequireFacing = true,
				},
				FistWeaponSpecialDash = {
					Range = 1000,
					PullForce = 990,
					Arc = 90,
					Count = 3,
					Distance = 50,
					RequireFacing = true,
				},
			}
		},
		OnWeaponChargeFunctions =
		{
			ValidWeapons = {"SpearWeaponThrow", },
			FunctionName = "CheckChargeVacuumAllNearbyEnemies",
			FunctionArgs =
			{
				From = "OnWeaponChargeFunctions",
				SwordParry = {
					Range = 1000,
					PullForce = 990,
					Arc = 360,
					Count = 3,
					Distance = 150,
				},
				SpearWeaponThrow = {
					Range = 1000,
					PullForce = 990,
					Arc = 180,
					Count = 3,
					Distance = 150,
				},
				ShieldThrow = {
					Range = 1000,
					PullForce = 990,
					Arc = 360,
					Count = 3,
					Distance = 150,
				},
				ShieldThrowDash = {
					Range = 1000,
					PullForce = 990,
					Arc = 360,
					Count = 3,
					Distance = 150,
				},
				BowSplitShot = {
					Range = 1000,
					PullForce = 990,
					Arc = 360,
					Count = 3,
					Distance = 150,
				},
				GunBombImmolation = {
					Range = 1000,
					PullForce = 990,
					Arc = 360,
					Count = 3,
					Distance = 150,
					RequireFirstHit = true,
				},
				GunGrenadeToss = {
					Range = 1000,
					PullForce = 990,
					Arc = 360,
					Count = 3,
					Distance = 150,
					RequireFirstHit = true,
				},
				FistWeaponSpecial = {
					Range = 1000,
					PullForce = 990,
					Arc = 90,
					Count = 3,
					Distance = 50,
					RequireFacing = true,
				},
				FistWeaponSpecialDash = {
					Range = 1000,
					PullForce = 990,
					Arc = 90,
					Count = 3,
					Distance = 50,
					RequireFacing = true,
				},
			}
		},
		OnWeaponFiredFunctions =
		{
			ValidWeapons = {"SwordParry", "SpearWeaponThrow", "FistWeaponSpecial", "FistWeaponSpecialDash" },
			FunctionName = "CheckFiredVacuumAllNearbyEnemies",
			FunctionArgs =
			{
				From = "OnWeaponFiredFunctions",
				SwordParry = {
					Range = 1000,
					PullForce = 990,
					Arc = 360,
					Count = 3,
					Distance = 150,
				},
				SpearWeaponThrow = {
					Range = 1000,
					PullForce = 990,
					Arc = 180,
					Count = 3,
					Distance = 150,
				},
				ShieldThrow = {
					Range = 1000,
					PullForce = 990,
					Arc = 360,
					Count = 3,
					Distance = 150,
				},
				ShieldThrowDash = {
					Range = 1000,
					PullForce = 990,
					Arc = 360,
					Count = 3,
					Distance = 150,
				},
				BowSplitShot = {
					Range = 1000,
					PullForce = 990,
					Arc = 360,
					Count = 3,
					Distance = 150,
				},
				GunBombImmolation = {
					Range = 1000,
					PullForce = 990,
					Arc = 360,
					Count = 3,
					Distance = 150,
					RequireFirstHit = true,
				},
				GunGrenadeToss = {
					Range = 1000,
					PullForce = 990,
					Arc = 360,
					Count = 3,
					Distance = 150,
					RequireFirstHit = true,
				},
				FistWeaponSpecial = {
					Range = 1000,
					PullForce = 990,
					Arc = 90,
					Count = 3,
					Distance = 50,
					RequireFacing = true,
				},
				FistWeaponSpecialDash = {
					Range = 1000,
					PullForce = 990,
					Arc = 90,
					Count = 3,
					Distance = 50,
					RequireFacing = true,
				},
			}
		},
		
		PropertyChanges =
		{
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordParry",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "RadialNovaSwordParry-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrowReturn",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "StartFx",
				ChangeValue = "HestiaSplashNovaSpearThrow",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowSplitShot",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Hestia-SplitShot",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow" },
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrowDash" },
				ProjectileName = "ShieldThrowDash",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "Graphic",
				ChangeValue = "ProjectileShield-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldRushBonusProjectileTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ShieldThrowDash", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt01-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldLoadAmmoTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ShieldThrowDash", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt03-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				ProjectileProperty = "Graphic",
				WeaponName = "ShieldThrow",
				ChangeValue = "ProjectileShieldAlt02-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldThrowTrailMirage-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionHestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearTeleportTrait",
				WeaponName = "SpearRushWeapon",
				ProjectileName = "SpearRushWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearRushTrailFx-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalHestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "Graphic",
				ChangeValue = "GunGrenadeLuciferOrb-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "GroupName",
				ChangeValue = "FX_Standing_Add",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunBombWeapon" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionHestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunBombImmolation" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "LuciferOrbAoE-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowMarkHomingTrait",
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Hestia-SplitShot-Alt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Hestia-SplitShot-Alt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeUppercut-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeUppercutSpecial-Hestia",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistTeleportSpecialTrait",
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalHestia_FlashKick",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
		EnemyPropertyChanges =
		{
			{
				TraitName = "GunLoadedGrenadeTrait",
				LegalUnits = { "GunBombUnit" },
				ThingProperty = "Graphic",
				ChangeValue = "LuciferBomb-Hestia",
				ChangeType = "Absolute",
			},
		}
	}

	OlympusTraitData.HestiaDashTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredFalseTraits = { "GunLoadedGrenadeTrait" },
		God = "Hestia",
		Icon = "Boon_Hestia_03",
		Slot = "Rush",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.20,
			},
			Epic =
			{
				Multiplier = 1.40,
			},
			Heroic =
			{
				Multiplier = 1.60,
			}
		},
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = {
				BaseValue = 1.5,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = -0.8,
				},
			},
			ValidWeapons = WeaponSets.HeroDashWeapons,
			ExcludeLinked = true,
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
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "BlinkTrailVerticalB-Hestia",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusDashNoCollide_Hestia",
				ChangeType = "Absolute",
			},
		},
	}
	OlympusTraitData.HestiaRangedTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Hestia",
		Slot = "Ranged",
		Icon = "Boon_Hestia_02",
		CustomTrayText = "HestiaRangedTrait_Tray",
        RequiredFalseTrait = "ShieldLoadAmmoTrait",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.000,
			},
			Rare =
			{
				Multiplier = 1.145,
			},
			Epic =
			{
				Multiplier = 1.290,
			},
			Heroic =
			{
				Multiplier = 1.435,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "HestiaProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "ProjectileFireRing-Hestia",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 70,
				BaseMax = 70,
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
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "CriticalHitChance",
				ChangeValue = 0.10,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipCritChance",
					Format = "Percent",
					SkipAutoExtract = true
				}
			},
			-- Beowulf
			{
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                WeaponProperty = "FireOnRelease",
                ChangeValue = false,
                ChangeType = "Absolute",
            },
            {
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "Type",
                ChangeValue = "INSTANT",
            },
            {
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DamageRadius",
                ChangeValue = 400
            },
            {
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DetonateGraphic",
                ChangeValue = "RadialNovaSwordParry-Hestia"
            },
		},
		ExtractValues =
		{
			{
				ExtractAs = "BaseRangedDamage",
				External = true,
				BaseType = "Projectile",
				BaseName = "RangedWeapon",
				BaseProperty = "DamageLow",
			}
		}
	}
	OlympusTraitData.ShieldLoadAmmo_HestiaRangedTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Hestia",
		Slot = "Ranged",
		Icon = "Boon_Hestia_02",
		CustomTrayText = "ShieldLoadAmmo_HestiaRangedTrait_Tray",
        RequiredTrait = "ShieldLoadAmmoTrait",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.000,
			},
			Rare =
			{
				Multiplier = 1.145,
			},
			Epic =
			{
				Multiplier = 1.290,
			},
			Heroic =
			{
				Multiplier = 1.435,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "HestiaProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "ProjectileFireRing-Hestia",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 55,
				BaseMax = 55,
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
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "CriticalHitChance",
				ChangeValue = 0.10,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipCritChance",
					Format = "Percent",
					SkipAutoExtract = true
				}
			},
			{
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                WeaponProperty = "FireOnRelease",
                ChangeValue = false,
                ChangeType = "Absolute",
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "Type",
                ChangeValue = "INSTANT",
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DamageRadius",
                ChangeValue = 330
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "IgnoreCoverageAngles",
                ChangeValue = false
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DetonateGraphic",
                ChangeValue = "RadialNovaSwordParry-Hestia"
            },
		},
		ExtractValues =
		{
			{
				ExtractAs = "BaseRangedDamage",
				External = true,
				BaseType = "Projectile",
				BaseName = "RangedWeapon",
				BaseProperty = "DamageLow",
			}
		}
	}	
	--[[OlympusTraitData.ShieldLoadAmmo_HestiaRangedTrait = 
	{
		
	}--]]
	OlympusTraitData.HestiaShoutTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredTextLines = { "PoseidonWrathIntro01" },
		CustomTrayText = "HestiaShoutTrait_Tray",
		God = "Hestia",
		Slot = "Shout",
		Icon = "Boon_Hestia_04",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.1,
			},
			Epic =
			{
				Multiplier = 1.2,
			},
			Heroic =
			{
				Multiplier = 1.3,
			}
		},
		AddShout =
		{
			FunctionName = "HestiaShout",
			MaxFunctionName = "HestiaMaxShout",
			Cost = 25,
			MaxDurationMultiplier = 2,
			SuperDuration = 5,
			IsBurst = true,
			ExtractValues =
			{
				{
					Key = "Cost",
					ExtractAs = "TooltipWrathStocks",
					Format = "WrathStocks",
					SkipAutoExtract = true
				},
				{
					Key = "MaxDurationMultiplier",
					ExtractAs = "TooltipDuration",
					Format = "EXWrathDuration",
					DecimalPlaces = 2,
					SkipAutoExtract = true
				}
			}
		},
		EndShout = "EndHestia",
		PreEquipWeapons = { "HestiaSuper", "HestiaMaxSuper", },
		PropertyChanges =
		{
			{
				WeaponNames = { "HestiaSuper", "HestiaMaxSuper", },
				ProjectileProperty = "DamageLow",
				BaseMin = 10,
				BaseMax = 10,
				MinMultiplier = 0.2,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponNames = { "HestiaSuper", "HestiaMaxSuper", },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
			{
				WeaponNames = { "HestiaSuper", "HestiaMaxSuper", },
				ProjectileProperty = "Fuse",
				ChangeValue = 0.25,
				ExtractValue =
				{
					ExtractAs = "TooltipInterval",
					SkipAutoExtract = true,
					DecimalPlaces = 2,
				}
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipChillDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipChillPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "ElapsedTimeMultiplier",
				Format = "NegativePercentDelta"
			},
			{
				ExtractAs = "TooltipChillStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "MaxStacks",
			},
		}
	}
	OlympusTraitData.StrongAttractionTrait =
	{
		Icon = "Boon_Hestia_05",
		InheritFrom = { "ShopTier2Trait" },
		RequiredFalseTrait = "StrongAttractionTrait",
		God = "Hestia",
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
			}
		},
		AttractionCount = { 
			BaseValue = 1.0
		},
		AttractionForce = { 
			BaseValue = 500.0
		},
		ExtractValues =
		{

		}
	}
	OlympusTraitData.HestiaRevengeTrait =
	{
		Icon = "Boon_Hestia_06",
		InheritFrom = { "ShopTier1Trait" },
		God = "Hestia",
		AddOnHitWeapons = { "HestiaRetaliate" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.20,
			},
			Epic =
			{
				Multiplier = 1.40,
			},
			Heroic =
			{
				Multiplier = 1.60,
			}
		},
		PropertyChanges =
		{
			
			{
				WeaponName = "HestiaRetaliate",
				ProjectileProperty = "DamageLow",
				BaseMin = 1,
				BaseMax = 1,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "HestiaRetaliate",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	}
	OlympusTraitData.HealthDefianceTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Hestia",
		Icon = "Boon_Hestia_07",
		LootSource = "HestiaUpgrade",
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
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		DefianceExtraHealth = {
			BaseValue = 15
		}
	}
	OlympusTraitData.HealthDamageTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Hestia",
		Icon = "Boon_Hestia_07",
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
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
	}
	OlympusTraitData.LavaDeathTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Hestia",
		Icon = "Boon_Hestia_08",
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
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		OnEnemyDeathWeapon = { Weapon = "HestiaOnDeath", FireAtDeathLocation = true },
		PropertyChanges =
		{
			{
				WeaponName = "HestiaOnDeath",
				ProjectileProperty = "DamageLow",
				BaseMin = 2,
				BaseMax = 2,
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
				WeaponName = "HestiaOnDeath",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	}
	OlympusTraitData.LavaResistTrait = 
	{
		InheritFrom = { "ShopTier2Trait" },
		God = "Hestia",
		Icon = "Boon_Hestia_09",
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
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		PropertyChanges =
		{
			{
				TraitName = "HestiaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName= "LavaPuddleDefense",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "HestiaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName= "LavaPuddleDefense",
				EffectProperty = "Modifier",
				BaseMin = 0.85,
				BaseMax = 0.90,
				SourceIsMultiplier = true,
				DeriveSource = "ModifierSource",
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipDamageReduction",
					Format = "NegativePercentDelta",
				}
			},
			-- Active
			{
				TraitName = "LavaDeathTrait",
				WeaponName = "HestiaOnDeath",
				EffectName= "LavaPuddleDefense",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "LavaDeathTrait",
				WeaponName = "HestiaOnDeath",
				EffectName= "LavaPuddleDefense",
				EffectProperty = "Modifier",
				DeriveValueFrom = "ModifierSource"
			},
			{
				TraitName = "HestiaRevengeTrait",
				WeaponName = "HestiaRetaliate",
				EffectName= "LavaPuddleDefense",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "HestiaRevengeTrait",
				WeaponName = "HestiaRetaliate",
				EffectName= "LavaPuddleDefense",
				EffectProperty = "Modifier",
				DeriveValueFrom = "ModifierSource"
			},
		},
	}
	OlympusTraitData.LavaLongerTrait = 
	{
		InheritFrom = { "ShopTier2Trait" },
		God = "Hestia",
		Icon = "Boon_Hestia_10",
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
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "HestiaRangedTrait", "HestiaOnDeath", "HestiaRevengeTrait" },
				ProjectileName = "SecondLavaPuddleLarge",
				ProjectileProperty = "Scale",
				ChangeValue = 15.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			--[[{
				WeaponNames = { "HestiaRangedTrait", "HestiaOnDeath", "HestiaRevengeTrait" },
				ProjectileName = "SecondLavaPuddleLarge",
				ProjectileProperty = "TotalFuse",
				ChangeValue = 12.0,
				ChangeType = "Absolute",
			},]]
		},
	}	
	OlympusTraitData.LavaAutoTrait =
	{
		InheritFrom = { "ShopTier3Trait" },
		RequiredFalseTrait = "LavaAutoTrait",
		God = "Hestia",
		Icon = "Boon_Hestia_11",
		PropertyChanges =
		{
			{
				WeaponNames = { "HestiaRangedTrait", "HestiaOnDeath", "HestiaRevengeTrait" },
				ProjectileName = "SecondLavaPuddleLarge",
				ProjectileProperty = "VacuumStrength",
				ChangeValue = 2000,
				ChangeType = "Add",
			},
		},
	}
	-- Consumable Data
	local OlympusConsumableData = ModUtil.Entangled.ModData(ConsumableData)
	OlympusConsumableData.LastStandHealthDrop =
	{
		InheritFrom = { "BaseConsumable", "Tier1Consumable" },
		RequiredFalseTrait = "HealthDefianceTrait",
		RequiredOneOfTraits = { "HestiaWeaponTrait", "HestiaRangedTrait", "HestiaDashTrait", "HestiaSecondaryTrait" },
		RequiredMinMaximumLastStands = 1,
		Icon = "Boon_Hestia_11",
		ConsumeSound = "/EmptyCue",
		Cost = 0,
		UseFunctionNames =  { "AddLastStand", "AddTraitToHero", "GainLastStandPresentation" } ,
		UseFunctionArgs = {
			{
				Icon = "ExtraLifeHestia",
				WeaponName = "LastStandMetaUpgradeShield",
				HealFraction = 0.5,
			},
			{ TraitName = "HealthDefianceTrait" },
			{ },
		},
	}
	-- Duo Traits
	OlympusTraitData.MoreTrapDamageTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Hestia_Athena_01",
		RequiredFalseTrait = "MoreTrapDamageTrait",	
	}
	--
	OlympusTraitData.FreeHealthTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Hestia_Aphrodite_01",
		RequiredFalseTrait = "FreeHealthTrait",		
		AddMaxHealth = 25,
		ExtractValues =
		{
			{
				Key = "AddMaxHealth",
				ExtractAs = "TooltipMaxHealth",
				Format = "MaxHealth"
			},
		}
	}

	--
	OlympusTraitData.ExplosionTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Hestia_Artemis_01",
		RequiredFalseTrait = "ExplosionTrait",
	}	
	OlympusTraitData.ChillFireTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Hestia_Demeter_01",
		RequiredFalseTrait = "ChillFireTrait",
	}
	OlympusTraitData.FestiveFogHealTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Hestia_Dionysus_01",
		RequiredFalseTrait = "FestiveFogHealTrait",
	}			
	OlympusTraitData.LavaDoomTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Hestia_Ares_01",
		RequiredFalseTrait = "LavaDoomTrait",
	}		
	OlympusTraitData.MoreHellringTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Hestia_Zeus_01",
		RequiredFalseTrait = "MoreHellringTrait",
	}	
	OlympusTraitData.FishingHealTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Hestia_Poseidon_01",
		RequiredFalseTrait = "FishingHealTrait",	
	}
	
	-- LootData
	local OlympusLootData = ModUtil.Entangled.ModData(LootData)
	OlympusLootData.HestiaUpgrade = {
			Name = "HestiaUpgrade",
			InheritFrom = { "BaseLoot", "BaseSoundPackage"},
			CanReceiveGift = true,
			AlwaysShowDefaultUseText = true,
			Weight = 10,
			Icon = "BoonSymbolHestia",
			BoonInfoIcon = "BoonInfoSymbolHestiaIcon",
			DoorIcon = "BoonSymbolApolloIsometric",
			Color = { 123, 22, 53, 255 },
			LightingColor = {123, 22, 53, 255},
			LootColor = {123, 22, 53, 255},
			SubtitleColor = {0.48, 0.09, 0.21, 1.0},
			EventEndSound = "/SFX/ArtemisBoonArrow",
			UpgradeSelectedSound = "/SFX/ArtemisBoonChoice",
			LootRejectionAnimation = "BoonDissipateA_Hestia",
	
			RequiredMinCompletedRuns = 1,
			RequiredTextLines = { "DionysusFirstPickUp" },
	
			TraitsList = { "HestiaWeaponTrait", "HestiaSecondaryTrait", "HestiaDashTrait" },
	
			PriorityUpgrades = { "HestiaWeaponTrait", "HestiaSecondaryTrait", "HestiaDashTrait", "HestiaRangedTrait" },--, "HestiaSecondaryTrait", "HestiaDashTrait", "HestiaRangedTrait", "ShieldLoadAmmo_HestiaRangedTrait" },
			WeaponUpgrades = { "HestiaWeaponTrait", "HestiaSecondaryTrait", "HestiaDashTrait", "HestiaRangedTrait"},--, "HestiaSecondaryTrait", "HestiaDashTrait", "HestiaRangedTrait", "ShieldLoadAmmo_HestiaRangedTrait", "HestiaShoutTrait" },
			Traits = { "HestiaRevengeTrait", "LavaDeathTrait", "HealthDamageTrait" },
			Consumables = { "LastStandHealthDrop" },
	
			LinkedUpgrades =
			{
				StrongAttractionTrait = {
					OneOf = { "ApolloWeaponTrait", "HestiaSecondaryTrait"},
				},
				LavaResistTrait = {
					OneOf = { "HestiaRangedTrait", "HestiaRevengeTrait", "LavaDeathTrait"},
				},
				LavaLongerTrait = {
					OneOf = { "HestiaRangedTrait", "HestiaRevengeTrait", "LavaDeathTrait"},
				},
				LavaAutoTrait = {
					OneFromEachSet =
					{
						{ "ApolloWeaponTrait", "HestiaSecondaryTrait" },
						{ "HestiaRangedTrait", "HestiaRevengeTrait", "LavaDeathTrait"},
					}
				},
				-- Duo Boon
				FreeHealthTrait = 
				{
					OneFromEachSet =
					{
						{ "HestiaWeaponTrait", "HestiaSecondaryTrait", "HestiaDashTrait", "HestiaRangedTrait", "ShieldLoadAmmo_HestiaRangedTrait"},
						{ "AphroditeWeaponTrait", "AphroditeSecondaryTrait", "AphroditeRushTrait", "AphroditeRangedTrait", "HealthRewardBonusTrait"}
					}
				},
			},
	
			Speaker = "NPC_Hestia_01",
			Portrait = "Portrait_Hestia_Default_01",
			WrathPortrait = "Portrait_Hestia_Wrath_01",
			OverlayAnim = "HestiaOverlay",
			Gender = "Female",
			SpawnSound = "/SFX/GoldCoinRewardDrop",
			FlavorTextIds =
			{
				"HestiaUpgrade_FlavorText01",
				"HestiaUpgrade_FlavorText02",
				"HestiaUpgrade_FlavorText03",
			},
	
			OnSpawnVoiceLines =
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				PlayOnceThisRun = true,
				PreLineWait = 0.85,
				ChanceToPlay = 0.33,
				RequiredTextLines = { "HestiaFirstPickUp" },
				RequiredFalseEncounters = { "DevotionTestTartarus", "DevotionTestAsphodel", "DevotionTestElysium", "Shop" },
	
				-- Lord Hestia...
				{ Cue = "/VO/ZagreusField_4816" },
				-- You found me, Hestia...
				{ Cue = "/VO/ZagreusField_4817" },
			},
	
			UpgradeMenuOpenVoiceLines =
			{
				[1] = GlobalVoiceLines.CheckOlympianReunionVoiceLines,
				[2] = GlobalVoiceLines.FoundRareBoonVoiceLines,
			},
	
			DuoPickupTextLineSets =
			{
				HestiaWithZeus01 =
				{
					Name = "HestiaWithZeus01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					HasTraitNameInRoom = "MasterBoltTrait",
					{ Cue = "/VO/Hestia_0041",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort",
						Text = "Seeing you struggle with your father made me realise something, Zagzag. Fathers and sons work much better together. My father and I put together something that might help you." },
					{ Cue = "/VO/Zeus_0250",
						PortraitExitWait = 0.35,
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
						StartSound = "/SFX/ZeusBoonThunder",
						EndSound = "/Leftovers/World Sounds/MapZoomInShort",
						Speaker = "NPC_Zeus_01", Portrait = "Portrait_Zeus_Default_01",
						Text = "That's right, Nephew! I feel generous and I know you feel grateful. Let's show him our power, young son." },
				},
				HestiaWithPoseidon01 =
				{
					Name = "HestiaWithPoseidon01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					HasTraitNameInRoom = "SeaChanteyTrait",
					{ Cue = "/VO/Hestia_0042",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort",
						Text = "This is far from the first time Uncle Poseidon and I have composed together. We decided to create a little Sea Chantey to keep your spirit up. This is for you!" },
					{ Cue = "/VO/Poseidon_0250",
						PortraitExitWait = 0.35,
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
						StartSound = "/SFX/PoseidonBoonWaveCrash",
						EndSound = "/Leftovers/World Sounds/MapZoomInShort",
						Speaker = "NPC_Poseidon_01", Portrait = "Portrait_Poseidon_Default_01",
						Text = "That's right, Little Hades! With our help, I don't think it's possible for you to fail." },
				},
				HestiaWithAthena01 =
				{
					Name = "HestiaWithAthena01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					HasTraitNameInRoom = "DamageReduceDistanceTrait",
					{ Cue = "/VO/Hestia_0182",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort",
						Text = "Athena, maybe the three of us could start a band! I believe you used to play the flute. We could create a divine musical trio!" },
					{ Cue = "/VO/Athena_0240",
						PortraitExitWait = 0.35,
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
						StartSound = "/SFX/AthenaBoonHolyShield",
						EndSound = "/Leftovers/World Sounds/MapZoomInShort",
						Speaker = "NPC_Athena_01", Portrait = "Portrait_Athena_Default_01",
						Text = "I have much responsibility, Step-Brother! I don't have time to ... start a band... Let's help our Cousin instead." },
				},
				HestiaWithAres01 =
				{
					Name = "HestiaWithAres01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					HasTraitNameInRoom = "WarSongTrait",
					{ Cue = "/VO/Hestia_0044",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort",
						Text = "Well, if it isn't my dear Brother! You know what I was thinking? You should write a song or maybe a poem. It would free your mind from all this needless violence." },
					{ Cue = "/VO/Ares_0240",
						PortraitExitWait = 0.35,
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
						StartSound = "/SFX/AresWrathBattle",
						EndSound = "/Leftovers/World Sounds/MapZoomInShort",
						Speaker = "NPC_Ares_01", Portrait = "Portrait_Ares_Default_01",
						Text = "The only form of art I recognize is war. {#DialogueItalicFormat} Hm {#PreviousFormat} ... I have never seen anybody killing with words. Zagreus, take this instead." },
				},
				HestiaWithAphrodite01 =
				{
					Name = "HestiaWithAphrodite01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					HasTraitNameInRoom = "HyacinthTrait",
					RequiredTextLines = { "HestiaGift01", "AphroditeGift01" },
					{ Cue = "/VO/Hestia_0045",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort",
						Text = "Aphrodite and I decided to combine our efforts in order to help you escape that realm of yours, Zagzag." },
					{ Cue = "/VO/Aphrodite_0230",
						PortraitExitWait = 0.35,
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
						EndSound = "/Leftovers/World Sounds/MapZoomInShort",
						Speaker = "NPC_Aphrodite_01", Portrait = "Portrait_Aphrodite_Default_01",
						Text = "And... This is for you, little godling! Oh my me! I can't wait until we are all here together!"
					},
				},
				HestiaWithArtemis01 =
				{
					Name = "HestiaWithArtemis01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					HasTraitNameInRoom = "FamedDuetTrait",
					RequiredTextLines = { "HestiaGift01", "ArtemisGift01" },
					{ Cue = "/VO/Hestia_0046",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort",
						Text = "I've brought my sister with me this time, Zagzag! Our combine symphony will shake the underworld to its core. Go team Zagzag!" },
					{ Cue = "/VO/Artemis_0250",
						PortraitExitWait = 0.35,
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
						StartSound = "/SFX/ArtemisBoonArrow",
						EndSound = "/Leftovers/World Sounds/MapZoomInShort",
						Speaker = "NPC_Artemis_01", Portrait = "Portrait_Artemis_Default_01",
						Text = "Are you seriously calling him that? I am sorry Zagreus. I hope this can make him a little more to bearable..."
					},
				},
				HestiaWithDionysus01 =
				{
					Name = "HestiaWithDionysus01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					HasTraitNameInRoom = "DazzledTrait",
					{ Cue = "/VO/Hestia_0047",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort",
						Text = "{#DialogueItalicFormat} Whoa {#PreviousFormat}, this wine is exquisite, Brother! It goes excellently with the cheese. To taste them both is like a glorious symphony!" },
					{ Cue = "/VO/Dionysus_0230",
						PortraitExitWait = 0.35,
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
						StartSound = "/SFX/DionysusBoonWineLaugh",
						EndSound = "/Leftovers/World Sounds/MapZoomInShort",
						Speaker = "NPC_Dionysus_01", Portrait = "Portrait_Dionysus_Default_01",
						Text = "{#DialogueItalicFormat} Haha {#PreviousFormat}, that's the trick, the combination of two great things together makes it all better. Like us. Let's combine our blessing to help, um, how do you call him again, Zagzag?" },
				},
				HestiaWithDemeter01 =
				{
					Name = "HestiaWithDemeter01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					HasTraitNameInRoom = "BlindDurationTrait",
					{ Cue = "/VO/Hestia_0048",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort",
						Text = "You know, Aunty. For someone that's so cold, you might want to chill out sometime." },
					{ Cue = "/VO/Demeter_0370",
						PortraitExitWait = 0.35,
						StartSound = "/SFX/DemeterBoonFrost",
						EndSound = "/Leftovers/World Sounds/MapZoomInShort",
						Speaker = "NPC_Demeter_01", Portrait = "Portrait_Demeter_Default_01",
						Text = "How dare you! That's no way to talk to your elders! I order you to help Zagreus and stop calling him nicknames." },
				},
			},
	
			SuperPriorityPickupTextLineSets =
			{
				HestiaAboutZagzag01 =
				{
					Name = "HestiaAboutZagzag01",
					PlayOnce = true,
					RequiredTextLines = { "HestiaFirstPickUp" },
					{ Cue = "/VO/Hestia_0161",
						PortraitExitWait = 1.25,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Hey, Zagzag. You don't mind me calling you Zagzag, right? Because if you do, you'd better come and tell me face to face." },
				},
				HestiaAboutOlympianReunionQuest01 =
				{
					Name = "HestiaAboutOlympianReunionQuest01",
					PlayOnce = true,
					RequiredTextLines = { "HestiaFirstPickUp", "PersephoneAboutOlympianReunionQuest01", },
					{ Cue = "/VO/ZagreusField_4818", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
						PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 2.33 },
						PostLineAnim = "ZagreusInteractEquip", PostLineAnimTarget = "Hero", PostLineFunctionName = "BoonInteractPresentation",
						Text = "OK, I think I'm ready. In the name of Hades! Olympus, this is an official message! And I hope it finds you well, Lord Hestia!" },
					{ Cue = "/VO/Hestia_0058",
						PortraitExitWait = 1.25,
						PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
						UseEventEndSound = true,
						Emote = "PortraitEmoteDepressed",
						Text = "{#DialogueItalicFormat} Whoa {#PreviousFormat}! Is that a party invitation? Oh wait, it's part of an invitation for me and my relatives, hm? Oh well, I am flattered, but I don't think I can make it, I'll give my relatives my half of the information and ask Artemis how it went. Maybe some other time Zagzag." },
				},
				HestiaPostEpilogue01 =
				{
					Name = "HestiaPostEpilogue01",
					PlayOnce = true,
					RequiredTextLines = { "OlympianReunionQuestComplete" },
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					{ Cue = "/VO/Hestia_0057",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Sorry I missed the big party in your father's domain, Zagzag. Dionysus told me it was quite exquisite. I wish I was able to be there, but maybe you could try visiting us sometime instead?" },
				},
			},
	
			PriorityPickupTextLineSets =
			{
				-- about other gods
				HestiaAboutZeus01 =
				{
					Name = "HestiaAboutZeus01",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "HestiaFirstPickUp" },
					RequiredAnyTextLines = { "OrpheusFirstMeeting", "OrpheusFirstMeeting_Alt" },
					RequiredFalseTextLines = { "OlympianReunionQuestComplete", "HestiaWithZeus01", "ZeusWithHestia01" },
					RequiredGodLoot = "ZeusUpgrade",
					{ Cue = "/VO/Hestia_0059",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I heard Orpheus plays music for your court. I take care of all the music playing here in Olympus. My father can be strict, but a good jam has always put him in a good mood. Fathers can be tense... I am sure you understand what I mean..." },
				},
				HestiaAboutStepSiblings01 =
				{
					Name = "HestiaAboutStepSiblings01",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "HestiaFirstPickUp" },
					RequiredGodLoot = "ArtemisUpgrade",
					{ Cue = "/VO/Hestia_0060",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "You know, Zagzag. I don't think I can ever imagine living a life without all my step-siblings. Ares, Aphrodite, Dionysus. I mean they are all great, but Zeus loves them a bit more than me... At least, I have Artemis. Don't tell her I said that." },
				},
				HestiaAboutDaughters01 =
				{
					Name = "HestiaAboutDaughters01",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp", "OrpheusMusicProgress01" },
					{ Cue = "/VO/Hestia_0061",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Hey Zagzag, I believe you still haven't found your second half, am I right? Maybe, you could be a great match for one of my daughters." },
				},
				HestiaAboutDaughters02 =
				{
					Name = "HestiaAboutDaughters02",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaAboutDaughters01" },
					{ Cue = "/VO/Hestia_0062",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Of my three daughters, Hestianis is kind of emotional... Once, she burned down our house, because her meal wasn't hot enough... Oh! Another time, she cried for a week because her hair brush broke... Well, if you are looking to spice up your life, she's an excellent catch!" },
				},
				HestiaAboutDaughters03 =
				{
					Name = "HestiaAboutDaughters03",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaAboutDaughters01" },
					{ Cue = "/VO/Hestia_0063",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "The most shy of my daughters is certainly Cephisso. She's extremely quiet. She could be next to me and I wouldn't even hear what she said. Good for settling down with a more quiet lifestyle, I suppose." },
				},
				HestiaAboutDaughters04 =
				{
					Name = "HestiaAboutDaughters04",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaAboutDaughters01" },
					{ Cue = "/VO/Hestia_0064",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Borysthenis is the strongest of my daughters, she can move mountains! Just be careful with her hugs. She cracked my back a century ago and I still feel sore from it. But hey, if that's not showing love, what is?" },
				},
				HestiaAboutDaughters05 =
				{
					Name = "HestiaAboutDaughters05",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					EndCue = "/VO/ZagreusHome_3760",
					RequiredTextLines = { "HestiaAboutDaughters02", "HestiaAboutDaughters03", "HestiaAboutDaughters04" },
					{ Cue = "/VO/Hestia_0065",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Well, I have talked to my daughters, and they are not really looking for a... long distant relationship. And since I don't see you going anywhere anytime soon, I think they'll end this here." },
				},
				HestiaAboutHydra =
				{
					Name = "HestiaAboutHydra",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredBiome = "Asphodel",
					RequiredAnyRoomsLastRun = { "B_Boss01", "B_Boss02" },
					RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "HestiaGift01", "HestiaFirstPickUp" },
					{ Cue = "/VO/Hestia_0165",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "The bone hydra has a snake's head, right? {#DialogueItalicFormat} Arg {#PreviousFormat}. I hate snakes, especially pythons. They are the worst. Still, I have quite a bit of experience getting the upper hand on them. This should help." },
				},
				HestiaAboutDaphne01 =
				{
					Name = "HestiaAboutDaphne01",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "HestiaFirstPickUp" },
					{ Cue = "/VO/Hestia_0162",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Were you staring at my laurel crown, Zagzag? It's beautiful, is it not? Made by my beloved Daphne. I miss her everyday." },
				},
				HestiaAboutPan01 =
				{
					Name = "HestiaAboutPan01",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "HestiaGift01", "HestiaFirstPickUp" },
					{ Cue = "/VO/Hestia_0163",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "As you know, Zagzag, I am the god of music, but once the Nymph Pan tried to get my title, he stood no chance against my excellent taste in music. I still remember his face. Ha-ha-ha. Priceless." },
				},
				HestiaAboutArtemis01 =
				{
					Name = "HestiaAboutArtemis01",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "HestiaAboutStepSiblings01", "HestiaFirstPickUp" },
					RequiredGodLoot = "ArtemisUpgrade",
					{ Cue = "/VO/Hestia_0066",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "My sister is a bit antisocial at times. I tried to help her out of her shell, but even I can't do anything. Maybe you can help her out." },
				},
				HestiaAboutArtemis02 =
				{
					Name = "HestiaAboutArtemis02",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaAboutArtemis01" },
					RequiredGodLoot = "ArtemisUpgrade",
					{ Cue = "/VO/Hestia_0067",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Artemis is older than me by a few seconds, but she loves to make me feel like I am the youngest. I mean it was only a few seconds... That doesn't count, right?" },
				},
				HestiaAboutArtemis03 =
				{
					Name = "HestiaAboutArtemis03",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaAboutArtemis02" },
					RequiredGodLoot = "ArtemisUpgrade",
					{ Cue = "/VO/Hestia_0068",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I wonder if I could beat Artemis in an archery competition... We are both pretty good... Tell me, Zagzag... You would bet on me, right?" },
				},
				HestiaAboutMusic01 =
				{
					Name = "HestiaAboutMusic01",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "OrpheusWithEurydice01", "HestiaFirstPickUp" },
					{ Cue = "/VO/Hestia_0069",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "As the god of music, I know better than most of my relatives that cooperation is key. I always try to add my special spice to the mix, but I know art is always better as a collective effort. I hope our cooperation will help you escape." },
				},
				HestiaAboutHarpQuest01 =
				{
					Name = "HestiaAboutHarpQuest01",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "OrpheusMusicProgress02", "HestiaFirstPickUp" },
					{ Cue = "/VO/Hestia_0070",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Are you learning some form of music, Zagzag? I sense hours of practice over the tips of your fingers. Someday, you might want to quit, but you must persist like you are now! It will be all worth in the end. Trust me." },
				},
				HestiaAboutHarpQuest02 =
				{
					Name = "HestiaAboutHarpQuest02",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "OrpheusMusicProgress04", "HestiaFirstPickUp" },
					{ Cue = "/VO/Hestia_0071",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I heard that you are a musician now, Zagzag? Ooh! Maybe Pan and Orpheus would like to join us, and we can make a band! What do you say? Oh wait, you're still there, and I am still here... hmm. We'll workshop." },
				},
				HestiaAboutOrpheus01 =
				{
					Name = "HestiaAboutOrpheus01",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "OrpheusTallTale03", "HestiaFirstPickUp" },
					{ Cue = "/VO/Hestia_0072",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Did you meet my old friend Orpheus down there? We used to play together all the time, but he went to pick up a girl and never came back. It's a shame too, he was pretty good." },
				},
				HestiaAboutOrpheus02 =
				{
					Name = "HestiaAboutOrpheus02",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaAboutOrpheus01", "HestiaFirstPickUp" },
					{ Cue = "/VO/Hestia_0073",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "You know. I don't like to brag, Zagzag, but I did give Orpheus his golden lyre. He probably still has it! A perfect instrument for a near-perfect musician. Okay, I might like to brag a little bit." },
				},
				HestiaAboutLeto01 =
				{
					Name = "HestiaAboutLeto01",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "HestiaGift01", "PersephoneMeeting02", "HestiaFirstPickUp" },
					{ Cue = "/VO/Hestia_0084",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I may be Zeus's son, Zagzag, but Hera is not my mother. My mother's name is Leto. She taught Artemis and I everything we know. Uh. Sometimes I wish she was here in Olympus with us, but that just can't happen. Hera kind of hates her." },
				},
				HestiaAboutLeto02 =
				{
					Name = "HestiaAboutLeto02",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaAboutLeto01", "HestiaFirstPickUp" },
					RequiredMinRunsCleared = 2,
					{ Cue = "/VO/Hestia_0085",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Leto gave birth to my sister and I on an island. I believe, Delos was the name. She was fleeing a Python, but not to worry, I defeated the mighty beast and now she's free to go anywhere she pleases... Well, except for Olympus..." },
				},
				HestiaAboutArtemisLeto01 =
				{
					Name = "HestiaAboutArtemisLeto01",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaAboutLeto01", "HestiaAboutLeto02", "HestiaFirstPickUp" },
					RequiredGodLoot = "ArtemisUpgrade",
					RequiredMinRunsCleared = 2,
					{ Cue = "/VO/Hestia_0086",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "My sister doesn't speak much about our mother, Leto. Though, I guess that's just how she is. She's not a very vocal character when it isn't about hunting something... Though I'm sure you have noticed that by now." },
				},
				HestiaPostGiftPickup01 =
				{
					Name = "HestiaPostGiftPickup01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaGift02", },
					{ Cue = "/VO/Hestia_0087",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I don't know why, but you are in my mind a lot lately. I just have this feeling that I must meet you somehow... This here should help make it happen." },
				},
				HestiaPostGiftPickup02 =
				{
					Name = "HestiaPostGiftPickup02",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaGift03", },
					{ Cue = "/VO/Hestia_0088",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I feel our kinship getting stronger on every encounter. I hope you feel the same, Zagzag." },
				},
	
				HestiaPostGiftPickup03 =
				{
					Name = "HestiaPostGiftPickup03",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaGift04", },
					{ Cue = "/VO/Hestia_0089",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I can see you are really trying to escape this time, Zagzag. And you know what? This could be the one. All you have to do is escape once, and it would be over. And you can finally be with us. I believe in you, Zagzag." },
				},
				HestiaAboutKeepsake01 =
				{
					Name = "HestiaAboutKeepsake01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTrait = "ForceHestiaBoonTrait",	
					{ Cue = "/VO/Hestia_0080",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Emote = "PortraitEmoteMusical",
						Text = "I am flattered that you brought my Harmonious Harp with you. I knew we shared a special bond, Zagzag." },
				},
				HestiaRunCleared01 =
				{
					Name = "HestiaRunCleared01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp", "HestiaAboutPersephoneMeeting01" },
					RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
					RequiredMinRunsCleared = 2,
					RequiresLastRunCleared = true,					
					{ Cue = "/VO/Hestia_0079",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "What are you doing there, Zagzag? I saw in a vision that you escaped. Why did you go back? Maybe you forgot something? Oh well, I also saw that you would do it again. So, no worries." },
				},
				HestiaBackstory01 =
				{
					Name = "HestiaBackstory01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ZeusFirstPickUp", "ArtemisFirstPickUp", "HestiaFirstPickUp" },
					{ Cue = "/VO/Hestia_0090",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Being the son of Uncle Hades must not be an easy task. I know the feeling. Zeus isn't exactly easy either. When Artemis told me about your existence, I just knew I had to meet you." },
				},
				HestiaBackstory02 =
				{
					Name = "HestiaBackstory02",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaBackstory01" },
					{ Cue = "/VO/Hestia_0091",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I'm sorry I didn't reach out sooner, Zagzag. I tried to, but it seemed the fates were intending on keeping us apart. I wonder what changed." },
				},
				HestiaBackstory03 =
				{
					Name = "HestiaBackstory03",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "PersephoneMeeting02", "HestiaBackstory02" },
					{ Cue = "/VO/Hestia_0092",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I try not to eavesdrop, but I heard that Hades once had a Queen. I assumed it was Nyx, but I had a vision lately and...  Oh, I won't give away to much of the fun. You'll see what I mean." },
				},
				HestiaBackstory04 =
				{
					Name = "HestiaBackstory04",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaBackstory03", "HestiaAboutLeto01" },
					{ Cue = "/VO/Hestia_0093",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I have to tell you the truth, Zagzag. I know about your secret... Don't worry! I understand. I did what I had to do to protect my own mother and I sense you would do the same. We're very alike, aren't we? We are very alike, aren't we?" },
				},
				HestiaBackstory05 =
				{
					Name = "HestiaBackstory05",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaBackstory04", "PersephoneMeeting04" },
					RequiredFalseTextLines = { "PersephoneReturnsHome01" },
					{ Cue = "/VO/Hestia_0094",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I hope you find your mother once you have escaped. Be rid of that place and until your father is ready to change never return. May the fates be ever in your favor, Cousin." },
				},
				HestiaRunProgress01 =
				{
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp" },
					RequiredMinRunsCleared = 4,
					{ Cue = "/VO/Hestia_0074",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I had a vision of you with someone from the surface. She was somehow related to... Demeter? I guess my vision isn't what it used to be, Zagzag." },
				},
				HestiaRunProgress02 =
				{
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp" },
					{ Cue = "/VO/Hestia_0075",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "{#DialogueItalicFormat}Okay, {#PreviousFormat}I saw you escape at least once. Seriously! I'm not lying! If you got out of the Underworld, you would tell me, right?" },
				},
				HestiaRunProgress03 =
				{
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp" },
					RequiredRoomLastRun = "C_Intro",
					RequiredFalseRoomLastRun = "D_Intro",
					RequiredMinRunsCleared = 2,
					{ Cue = "/VO/Hestia_0076",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Trust me, Zagzag. Going through Elysium is no walk in the park. I've written songs and stories about their heroes and all of their legends. Maybe just try being nice to them, some of them have ego issues after all that glory went to their heads." },
				},
				HestiaRunProgress04 =
				{
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp" },
					RequiredAnyRoomsLastRun = { "D_Intro" },
					RequiresLastRunCleared = false,
					{ Cue = "/VO/Hestia_0077",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "You almost had a glimpse of light, I heard. I believe you can go further this time. And this here might be exactly what you needed." },
				},
				HestiaRunProgress05 =
				{
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredRoom = "D_Hub",
					{ Cue = "/VO/Hestia_0078",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Facing a three-headed dogs, eh Zagzag. Well, I'll offer you a bit of informational poetry. {#DialogueItalicFormat} Um-um {#PreviousFormat}. “The trick with any beast is ter know how to calms 'em. Jus” play “im a bit o” music an' he'll go straight ter sleep—'" },
				},
				HestiaLowHealth01 =
				{
					Name = "HestiaLowHealth01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp" },
					RequiredMaxHealthFraction = 0.20,
					RequiredMaxLastStands = 1,
	
					{ Cue = "/VO/Hestia_0082",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Emote = "PortraitEmoteSurprise",
						Text = "{#DialogueItalicFormat} Oh {#PreviousFormat}, that must hurt. Like really, really hurt. I don't think it will make the difference this time, but this is better than nothing." },
				},
				HestiaLowHealth02 =
				{
					Name = "HestiaLowHealth02",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp" },
					RequiredMaxHealthFraction = 0.15,
					RequiredMaxLastStands = 1,
	
					{ Cue = "/VO/Hestia_0083",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I see my healing power would be very useful to you right now. You are just a bit too far away for me to use it. I can manage to give you this instead thought." },
				},
				HestiaLegendaryPickUp01 =
				{
					Name = "HestiaLegendaryPickUp01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp", "HestiaGift01" },
					ValuableUpgradeInRoom = {
						AllAtLeastRarity = "Rare",
						HasAtLeastRarity = "Epic",
					},
					{ Cue = "/VO/Hestia_0081",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I gathered all my divine power to give you this blessing, Zagzag. Don't let it go to waste. {#DialogueItalicFormat} Yawn {#PreviousFormat}, I get to take a small nap. You got this." },
				},
			},
	
			PickupTextLineSets =
			{
				HestiaFirstPickUp =
				{
					Name = "HestiaFirstPickUp",
					PlayOnce = true,
					RequiredTextLines = { "AthenaFirstPickUp", "ArtemisFirstPickUp", },
					{ Cue = "/VO/ZagreusField_4800", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
						PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 4.23 },
						PostLineAnim = "ZagreusInteractEquip", PostLineAnimTarget = "Hero", PostLineFunctionName = "BoonInteractPresentation",
						Text = "This presence... It feels like Artemis, but something is different... In the name of Hades! Olympus! I accept this message." },
					{ Cue = "/VO/Hestia_0001",
						PortraitExitWait = 1.25,
						PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
						UseEventEndSound = true,
						Text = "I come all this way to help you out and the first thing you do is confuse me with my sister? Not the best first impression, Cousin." },
				},
				HestiaMiscPickup01 =
				{
					Name = "HestiaMiscPickup01",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp" },
					{ Cue = "/VO/Hestia_0002",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Dangers and vile creatures are hiding where you are. This blessing will keep them away." },
				},
				HestiaMiscPickup02 =
				{
					Name = "HestiaMiscPickup02",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp" },
					{ Cue = "/VO/Hestia_0003",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Take my blessing, Cousin. It will light up your way to Olympus." },
				},
				HestiaMiscPickup03 =
				{
					Name = "HestiaMiscPickup03",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp" },
					RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
					RequiredMaxHealthFraction = 0.75,
					{ Cue = "/VO/Hestia_0004",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Are you still down there, Zagzag? Maybe this blessing is what's been missing to get you out!" },
				},
				HestiaMiscPickup04 =
				{
					Name = "HestiaMiscPickup04",
					Priority = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp" },
					{ Cue = "/VO/Hestia_0005",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Only those who are pure of heart can handle the light from my blessings. I knew you were one of us!" },
				},
				HestiaMiscPickup05 =
				{
					Name = "HestiaMiscPickup05",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp" },
					{ Cue = "/VO/Hestia_0006",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "A real musician knows when to persevere. And you, Zagzag, have a real musician heart." },
				},
				HestiaMiscPickup06 =
				{
					Name = "HestiaMiscPickup06",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp" },
					{ Cue = "/VO/Hestia_0007",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Tag! You're it. Now you have to come to me. Just the rules of the game, Zagzag. Maybe this will help you catch up." },
				},
				HestiaMiscPickup07 =
				{
					Name = "HestiaMiscPickup07",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp" },
					{ Cue = "/VO/Hestia_0008",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "By the fates! You are still going at it, Zagzag. I see you are well determined to come meet us then. Wish you all the best!" },
				},
				HestiaMiscPickup08 =
				{
					Name = "HestiaMiscPickup08",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp" },
					{ Cue = "/VO/Hestia_0009",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Let me play something for you, it might guide your way to us." },
				},
				HestiaMiscPickup09 =
				{
					Name = "HestiaMiscPickup09",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp" },
					{ Cue = "/VO/Hestia_0010",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "There you are, Zagzag. Are you hiding from me? I just wanted to give you this." },
				},
				HestiaMiscPickup10 =
				{
					Name = "HestiaMiscPickup10",
					Priority = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp" },
					RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
					{ Cue = "/VO/Hestia_0011",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Let me light your path. It's the least I can do for a guy like you." },
				},
				HestiaMiscPickup11 =
				{
					Name = "HestiaMiscPickup11",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp" },
					{ Cue = "/VO/Hestia_0012",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "{#DialogueItalicFormat}Hey, look here, Zagzag,\nMade a haiku just for you,\nGood luck escaping.{#PreviousFormat}" },
				},
				HestiaMiscPickup12 =
				{
					Name = "HestiaMiscPickup12",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp" },
					{ Cue = "/VO/Hestia_0013",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Trying to escape again, Zagzag? I believe the fates are set on keeping you down there. But then again, I've been wrong before. Against all odds, I believe in you, Cousin." },
				},
				HestiaMiscPickup13 =
				{
					Name = "HestiaMiscPickup13",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp" },
					{ Cue = "/VO/Hestia_0014",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "You know, Zagzag? Your perseverance inspires me! I mean, I'm writing songs like crazy up here. You have escape if you wanna hear them though!" },
				},
				HestiaMiscPickup14 =
				{
					Name = "HestiaMiscPickup14",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp" },
					MinRunsSinceAnyTextLines = { TextLines = { "HestiaPostEpilogue01" }, Count = 3 },				
					{ Cue = "/VO/Hestia_0015",
						PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
						Emote = "PortraitEmoteMusical",	
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Da-Da-Dum... Da-Da-Dum... Oh. Hello there. Sorry I was working on a song. I can probably finish it by the time you arrive. In the meantime, take this." },
				},
				HestiaMiscPickup15 =
				{
					Name = "HestiaMiscPickup15",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp", "HestiaGift01" },
					{ Cue = "/VO/Hestia_0016",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Zagzag, did you know every sound can be transformed into music? Melody, rhythm, percussions. Maybe you can use that information to help you escape." },
				},
				HestiaMiscPickup16 =
				{
					Name = "HestiaMiscPickup16",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp" },
					{ Cue = "/VO/Hestia_0017",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Sometimes adversity is what you need to face in order to become successful. All the best, Zagzag." },
				},
				HestiaMiscPickup17 =
				{
					Name = "HestiaMiscPickup17",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp" },
					{ Cue = "/VO/Hestia_0018",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I keep giving you my finest blessings but I'm not seeing any results, Zagzag. Luckily for you, I'm willing to wait as long as you need." },
				},
				HestiaMiscPickup18 =
				{
					Name = "HestiaMiscPickup18",
					Priority = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp" },
					RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
					{ Cue = "/VO/Hestia_0019",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I heard that you've never seen sunlight before! If you ever get out, take a moment to check it out, you'll see all the beautiful things the world has to offer up here." },
				},
				HestiaMiscPickup19 =
				{
					Name = "HestiaMiscPickup19",
					Priority = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "HestiaFirstPickUp" },
					RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
					{ Cue = "/VO/Hestia_0020",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Is your father keeping you in his realm, Zagzag. Sometimes fathers are strict, but we must show them we are our own gods. You and I are very alike, Zagzag. The difference between us is I usually succeed in what I start. You should probably give that a try sometime." },
				},
	
				-- shorter acknowledgments
				HestiaMiscPickup20 =
				{
					Name = "HestiaMiscPickup20",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
					{ Cue = "/VO/Hestia_0021",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I knew you would come, Zagzag. I prepared this just for the occasion." },
				},
				HestiaMiscPickup21 =
				{
					Name = "HestiaMiscPickup21",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
					{ Cue = "/VO/Hestia_0022",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I can see you've got the music in you, Cousin. It's just a matter of using it the right way." },
				},
				HestiaMiscPickup22 =
				{
					Name = "HestiaMiscPickup22",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
					{ Cue = "/VO/Hestia_0023",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "With this blessing, Zagzag. The light shall burn your enemies." },
				},
				HestiaMiscPickup23 =
				{
					Name = "HestiaMiscPickup23",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
					{ Cue = "/VO/Hestia_0024",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Like I always say. Where words failed, music thrives." },
				},
				HestiaMiscPickup24 =
				{
					Name = "HestiaMiscPickup24",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
					{ Cue = "/VO/Hestia_0025",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Music brings people together, Zagzag. Just like how this blessing will help bring you to us!" },
				},
				HestiaMiscPickup25 =
				{
					Name = "HestiaMiscPickup25",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
					{ Cue = "/VO/Hestia_0026",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Music is an escape for many mortals, and it'll be your escape too! ...From your father's realm, I mean." },
				},
				HestiaMiscPickup26 =
				{
					Name = "HestiaMiscPickup26",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
					{ Cue = "/VO/Hestia_0027",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Mortals come and go like the wind, but music has always been there for me." },
				},
				HestiaMiscPickup27 =
				{
					Name = "HestiaMiscPickup27",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
					{ Cue = "/VO/Hestia_0028",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "This blessing will light your way to us. Just get here quickly before it fades." },
				},
				HestiaMiscPickup28 =
				{
					Name = "HestiaMiscPickup28",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
					{ Cue = "/VO/Hestia_0029",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "You might not be able to see the sun from down there, but you have my light right here." },
				},
				HestiaMiscPickup29 =
				{
					Name = "HestiaMiscPickup29",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
					{ Cue = "/VO/Hestia_0030",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "As you work to create light for others, you naturally light your own way. Keep going, Cousin." },
				},
	
				HestiaMiscPickup30 =
				{
					Name = "HestiaMiscPickup30",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
					{ Cue = "/VO/Hestia_0031",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Hope is being able to always see the light despite the darkness." },
				},
				HestiaMiscPickup31 =
				{
					Name = "HestiaMiscPickup31",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
					{ Cue = "/VO/Hestia_0032",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "History is but the unrolled scroll of prophecy. Your fate is yours to write, Zagzag." },
				},
				HestiaMiscPickup32 =
				{
					Name = "HestiaMiscPickup32",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
					{ Cue = "/VO/Hestia_0033",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I don't make mistakes. I make prophecies which immediately turn out to be wrong." },
				},
				HestiaMiscPickup33 =
				{
					Name = "HestiaMiscPickup33",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
					{ Cue = "/VO/Hestia_0034",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I sense your heart is pure. This blessing should be handy then. Good luck." },
				},
				HestiaMiscPickup34 =
				{
					Name = "HestiaMiscPickup34",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
					{ Cue = "/VO/Hestia_0035",
						PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
						Emote = "PortraitEmoteMusical",	
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I am your sunshine~~\nYour only sunshine~~\nI give you blessings~~\nwhen skies are gray~~" },
				},
				HestiaMiscPickup35 =
				{
					Name = "HestiaMiscPickup35",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
					{ Cue = "/VO/Hestia_0036",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Another ray of sunshine coming your way!" },
				},
				HestiaMiscPickup36 =
				{
					Name = "HestiaMiscPickup36",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
					{ Cue = "/VO/Hestia_0037",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "You've always got a friend in me, Zagzag. One day, we'll find each other." },
				},
				HestiaMiscPickup37 =
				{
					Name = "HestiaMiscPickup37",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
					{ Cue = "/VO/Hestia_0038",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "When it comes down to it, it's quite simple, Zagzag. Just beat it. No one wants to be defeated!" },
				},
				HestiaMiscPickup38 =
				{
					Name = "HestiaMiscPickup38",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
					{ Cue = "/VO/Hestia_0039",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I have given you all I can. You'll have to do the rest on your own." },
				},
				HestiaMiscPickup39 =
				{
					Name = "HestiaMiscPickup39",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.HestiaBasicPickUpTextLines,
					{ Cue = "/VO/Hestia_0040",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "You seem to be under a lot of pressure down there. I guess it really does split a family in two." },
				},
			},
	
			BoughtTextLines =
			{
				HestiaLootBought01 =
				{
					Name = "HestiaLootBought01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
	
					{ Cue = "/VO/Hestia_0095",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Stopping by Charon's shop, I see. This deal might be your best chance of escaping." },
				},
				HestiaLootBought02 =
				{
					Name = "HestiaLootBought02",
					PlayOnce = true,
					ChanceToPlay = 0.33,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
	
					{ Cue = "/VO/Hestia_0096",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "You know, I saw a vision of a sale coming soon. I'd say you got ripped off, but I know Charon doesn't do well with haggling." },
				},
				HestiaLootBought03 =
				{
					Name = "HestiaLootBought03",
					PlayOnce = true,
					ChanceToPlay = 0.33,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
	
					{ Cue = "/VO/Hestia_0097",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "You didn't have to pay for my blessing, Zagzag. I would have helped you if you would just asked." },
				},
			},
	
			RejectionTextLines =
			{
				HestiaRejection01 =
				{
					Name = "HestiaRejection01",
					{ Cue = "/VO/Hestia_0098",
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Did you just choose somebody else over me, Cousin? I guess you've decided to stay down there." },
				},
				HestiaRejection02 =
				{
					Name = "HestiaRejection02",
					{ Cue = "/VO/Hestia_0099",
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "You know I can see what's going to happen, right? Let me just say you won't like what comes next." },
				},
				HestiaRejection03 =
				{
					Name = "HestiaRejection03",
					{ Cue = "/VO/Hestia_0100",
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Man. The moment I thought we could jam together. Let's just hope this doesn't mark the end of our duet." },
				},
				HestiaRejection04 =
				{
					Name = "HestiaRejection04",
					{ Cue = "/VO/Hestia_0101",
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Are you blind, Cousin? I hope you meant to choose me. Because, if not, what I am going to do is very justified." },
				},
				HestiaRejection05 =
				{
					Name = "HestiaRejection05",
					{ Cue = "/VO/Hestia_0102",
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Are you serious, Cousin? Is it because I called you Zagzag? Because you just gave me a reason to keep using the nickname." },
				},
				HestiaRejection06 =
				{
					Name = "HestiaRejection06",
					{ Cue = "/VO/Hestia_0103",
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Here I am, trying to help guide you out of your father's realm and this is the gratitude I get in return. Allow me to show you something else then." },
				},
				HestiaRejection07 =
				{
					Name = "HestiaRejection07",
					{ Cue = "/VO/Hestia_0104",
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "No way. Even I couldn't see that one coming. But you know what, I don't think you'll see what's coming for you either." },
				},
				HestiaRejection08 =
				{
					Name = "HestiaRejection08",
					{ Cue = "/VO/Hestia_0105",
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I don't think this was your first mistake, Cousin. But it might be your last." },
				},
				HestiaRejection09 =
				{
					Name = "HestiaRejection09",
					{ Cue = "/VO/Hestia_0106",
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Let me sing you a song, Cousin. It's called “Zagreus dies once more”. It's very catchy." },
				},
				HestiaRejection10 =
				{
					Name = "HestiaRejection10",
					{ Cue = "/VO/Hestia_0107",
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I can't believe you've done this, Cousin. I though we were friends." },
				},
				HestiaRejection11 =
				{
					Name = "HestiaRejection11",
					{ Cue = "/VO/Hestia_0108",
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "You know what, I accept your decision. As long as you accept the decision I'm about to make." },
				},
				HestiaRejection12 =
				{
					Name = "HestiaRejection12",
					{ Cue = "/VO/Hestia_0109",
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Seems like you have death wish. Wait, that's an excellent name for a band! Here, deal with these guys while I go write that down." },
				},
			},
	
			RejectionVoiceLines =
			{
				{
					RandomRemaining = true,
					BreakIfPlayed = true,
					PreLineWait = 1.3,
					RequiredEncounters = { "DevotionTestTartarus", "DevotionTestAsphodel", "DevotionTestElysium", },
					SuccessiveChanceToPlay = 0.33,
					UsePlayerSource = true,
	
					-- Sorry, Hestia.
					{ Cue = "/VO/ZagreusField_4801" },
					-- Nothing personal, Lord Hestia.
					{ Cue = "/VO/ZagreusField_4802" },
					-- Forgive me, Hestia.
					{ Cue = "/VO/ZagreusField_4803" },
					-- Apologies, Lord Hestia.
					{ Cue = "/VO/ZagreusField_4804" },
				},
				[2] = GlobalVoiceLines.GodRejectedVoiceLines,
			},
	
			MakeUpTextLines =
			{
				HestiaMakeUp01 =
				{
					Name = "HestiaMakeUp01",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					{ Cue = "/VO/Hestia_0110",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I sense you've come back to the light, Zagzag. Sorry, I just had to make sure." },
				},
				HestiaMakeUp02 =
				{
					Name = "HestiaMakeUp02",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					{ Cue = "/VO/Hestia_0111",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I knew this moment would come. Don't worry, Zagzag. No hard feeling." },
				},
				HestiaMakeUp03 =
				{
					Name = "HestiaMakeUp03",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					{ Cue = "/VO/Hestia_0112",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Why are we fighting again, Zagzag? You know what I forgive you. Just don't do it again." },
				},
				HestiaMakeUp04 =
				{
					Name = "HestiaMakeUp04",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					{ Cue = "/VO/Hestia_0113",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Everybody stops! I've got a song in my head and I need to go write it down. We are done here." },
				},
				HestiaMakeUp05 =
				{
					Name = "HestiaMakeUp05",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					{ Cue = "/VO/Hestia_0114",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Wait a second... You didn't die. Oh, I think that might actually happen later. Um, yea. My bad. Carry on." },
				},
				HestiaMakeUp06 =
				{
					Name = "HestiaMakeUp06",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					{ Cue = "/VO/Hestia_0115",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "You know respect is like a duet, Zagzag. I am willing to play my part, if you play yours." },
				},
				HestiaMakeUp07 =
				{
					Name = "HestiaMakeUp07",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					{ Cue = "/VO/Hestia_0116",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Friendship is all about its lows and its highs. That was our low,  so how about a high?" },
				},
				HestiaMakeUp08 =
				{
					Name = "HestiaMakeUp08",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					{ Cue = "/VO/Hestia_0117",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "You know what? Music is all about experimentation, and I'm sure that's what you were doing. I forgive you." },
				},
				HestiaMakeUp09 =
				{
					Name = "HestiaMakeUp09",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					{ Cue = "/VO/Hestia_0118",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "{#DialogueItalicFormat} Hahaha {#PreviousFormat}, you almost had me there for a second, Zagzag! Now, let's get back to the matter at hand." },
				},
				HestiaMakeUp10 =
				{
					Name = "HestiaMakeUp10",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					{ Cue = "/VO/Hestia_0119",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I don't want to brag, but if our fight was in my domain, you'd be pretty sorry right now." },
				},
				HestiaMakeUp11 =
				{
					Name = "HestiaMakeUp11",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					{ Cue = "/VO/Hestia_0120",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Alright, I know when something has gone on long enough. You win this round, Zagzag, and your prize is right here!" },
				},
				HestiaMakeUp12 =
				{
					Name = "HestiaMakeUp12",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					{ Cue = "/VO/Hestia_0121",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Let's put the past in the past. The show must go on, Zagzag." },
				},
			},
	
			GiftTextLineSets =
			{
				-- gives gift in exchange
				HestiaGift01 =
				{
					Name = "HestiaGift01",
					PlayOnce = true,
					{ Cue = "/VO/ZagreusHome_3761", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
						PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
						PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
						PostLineFunctionName = "BoonInteractPresentation",
						Text = "Lord Hestia, you've shown me the way. Please accept this offering." },
					{ Cue = "/VO/Hestia_0122",
						PortraitExitWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I'd be lying if I said I didn't see that one coming. That's why I prepared this gift back. Now, we're even." },
				},
				HestiaGift02 =
				{
					Name = "HestiaGift02",
					PlayOnce = true,
					RequiredTextLines = { "HestiaGift01" },
					{ Cue = "/VO/ZagreusHome_3762", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
						PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
						PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
						PostLineFunctionName = "BoonInteractPresentation",
						Text = "Lord Hestia, your light is very welcome in this darker part of the world. I must thank you for this." },
					{ Cue = "/VO/Hestia_0123",
						PortraitExitWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "It must be hard to find such good Nectar where you are. I truly appreciate the gesture. Any future gift is completely unnecessary." },
				},
				HestiaGift03 =
				{
					Name = "HestiaGift03",
					PlayOnce = true,
					RequiredTextLines = { "HestiaGift02" },
					{ Cue = "/VO/ZagreusHome_3763", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
						PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
						PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
						PostLineFunctionName = "BoonInteractPresentation",
						Text = "I know you said to stop this, Lord Hestia. This is just a little something for all your help." },
					{ Cue = "/VO/Hestia_0124",
						PortraitExitWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Yet another gift? You know what is an even better gift you could give me, Zagzag? Coming to visit us sometime soon." },
				},
				HestiaGift04 =
				{
					Name = "HestiaGift04",
					PlayOnce = true,
					RequiredTextLines = { "HestiaGift03" },
					{ Cue = "/VO/ZagreusHome_3764", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
						PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
						PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
						PostLineFunctionName = "BoonInteractPresentation",
						Text = "I couldn't escape like you wanted, but this here could help you wait until I succeed. Thank you, Lord Hestia." },
					{ Cue = "/VO/Hestia_0125",
						PortraitExitWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Well, until we meet, this could do the trick. But seriously, think a little more about yourself and... Just focus on escaping." },
				},
				HestiaGift05 =
				{
					Name = "HestiaGift05",
					PlayOnce = true,
					RequiredTextLines = { "HestiaGift04" },
					{ Cue = "/VO/ZagreusHome_3765", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
						PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
						PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
						PostLineFunctionName = "BoonInteractPresentation",
						Text = "Your blessings have made me grasp life more, and I wanted to show my appreciation towards you, Lord Hestia. It's all I can give you for now." },
					{ Cue = "/VO/Hestia_0126",
						PortraitExitWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "How do you have so much of these? Isn't Nectar rare in your realm? I mean I saw it coming. Just wow." },
				},
				HestiaGift06 =
				{
					Name = "HestiaGift06",
					PlayOnce = true,
					RequiredTextLines = { "HestiaGift05" },
					{ Cue = "/VO/ZagreusHome_3766", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
						PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
						PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
						PostLineFunctionName = "BoonInteractPresentation",
						Text = "As a gesture of appreciation, this gift is for you, Lord Hestia. I hope you accept this humble offering." },
					{ Cue = "/VO/Hestia_0127",
						PortraitExitWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I will take this, but no more Nectar, Zagzag. I mean it. Just escape. You have your place here. And everybody is rooting for you." },
				},
				HestiaGift07 =
				{
					Name = "HestiaGift07",
					PlayOnce = true,
					RequiredTextLines = { "HestiaGift06" },
					{ Cue = "/VO/ZagreusHome_3767", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
						PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
						PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
						PostLineFunctionName = "BoonInteractPresentation",
						Text = "I know you said no more Nectar, Lord Hestia. But I must show you what you mean to me. Here's something you probably already have up there... But it's important for me you have this." },
					{ Cue = "/VO/Hestia_0128",
						PortraitExitWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						PostLineThreadedFunctionName = "MaxedRelationshipPresentation",
						PostLineFunctionArgs = { Text = "NPC_Hestia_01", Icon = "Keepsake_HestiaSticker_Max" },
						Text = "Is that Ambrosia? How did you find this? I don't know what to say beside thank you my friend. I just hope we can see each other soon. So, I may share it with you. For now, thought, have this. And take care of yourself." },
				},
			},
	
			GiftGivenVoiceLines =
			{
				BreakIfPlayed = true,
				PreLineWait = 1.0,
				PlayFromTarget = true,
	
				-- This is too much, Lord Hestia.
				{ Cue = "/VO/ZagreusField_4812" },
			},
	
			ShoutActivationSound = "/SFX/LyreGood", -- "VO/HestiaWrathLight"
			ShoutVoiceLines =
			{
				Queue = "Interrupt",
				{
					BreakIfPlayed = true,
					RandomRemaining = true,
					RequiredKillEnemiesFound = true,
					RequiredFalseSpurnedGodName = "HestiaUpgrade",
	
					-- Put your fate in the light!
					{ Cue = "/VO/Hestia_0129" },
					-- Do, Re, Mi! Your end I see!
					{ Cue = "/VO/Hestia_0130" },
					-- La, Si, Do! Your pain will grow!
					{ Cue = "/VO/Hestia_0164" },
					-- You're in Treble now!
					{ Cue = "/VO/Hestia_0131" },
					-- Back for another round?
					{ Cue = "/VO/Hestia_0132" },
					-- Better keep up with the rhythm!
					{ Cue = "/VO/Hestia_0133" },
					-- Didn't I hear someone ask for an encore?
					{ Cue = "/VO/Hestia_0134", RequiredMinKillEnemies = 2 },
					-- I'll never get tired of this sound.
					{ Cue = "/VO/Hestia_0135", RequiredMinKillEnemies = 2 },
				},
				{
					BreakIfPlayed = true,
					PlayFromTarget = true,
					RandomRemaining = true,
					RequiredKillEnemiesFound = true,
					RequiredSpurnedGodName = "HestiaUpgrade",
					RequireCurrentEncounterNotComplete = true,
	
					-- Is it because I called you Zagzag?
					{ Cue = "/VO/Hestia_0136" },
					-- You have chosen... Poorly!
					{ Cue = "/VO/Hestia_0137" },
					-- Let's go then! Double Time!
					{ Cue = "/VO/Hestia_0138" },
					-- You were the chosen one!
					{ Cue = "/VO/Hestia_0139" },
					-- You were my cousin, Zagzag. I loved you.
					{ Cue = "/VO/Hestia_0140" },
				},
			},
	
			SwapUpgradePickedVoiceLines =
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 1.05,
				SuccessiveChanceToPlay = 0.33,
				CooldownName = "SaidHestiaRecently",
				CooldownTime = 40,
				RequiresLastUpgradeSwapped = true,
				UsePlayerSource = true,
	
				-- Great trade, Lord Hestia.
				{ Cue = "/VO/ZagreusField_4813" },
				-- Lord Hestia, show me the path.
				{ Cue = "/VO/ZagreusField_4814" },
				-- Lord Hestia, I agree with the terms.
				{ Cue = "/VO/ZagreusField_4815" },
			},
	
			DeathTauntVoiceLines =
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 1.25,
				NoTarget = true,
	
				-- This is what happens to those who succumb to the darkness.
				{ Cue = "/VO/Hestia_0141" },
				-- Hear that? Silence shall be your only music.
				{ Cue = "/VO/Hestia_0142" },
				-- I already knew this choice would be your last.
				{ Cue = "/VO/Hestia_0143" },
			},
	
			BlindBoxOpenedVoiceLines =
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 0.3,
				Source = { SubtitleColor = Color.HestiaVoice },
				TriggerCooldowns = { "ZagreusBoonTakenSpeech" },
	
				-- You want to start a band?
				{ Cue = "/VO/Hestia_0144" },
				-- You've got this!
				{ Cue = "/VO/Hestia_0145" },
				-- This is my divine blessing.
				{ Cue = "/VO/Hestia_0146" },
				-- My light will guide you!
				{ Cue = "/VO/Hestia_0147" },
				-- Get ready to jam.
				{ Cue = "/VO/Hestia_0148" },
			},
	}
	-- Duo PickupLines	
	OlympusLootData.ZeusUpgrade.DuoPickupTextLineSets.ZeusWithHestia01 = {
		Name = "ZeusWithHestia01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "MasterBoltTrait",
		{ Cue = "/VO/Zeus_0251",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "Is that the bow I gave to Artemis and you, Young Son! {#DialogueItalicFormat} Haha {#PreviousFormat}, it's been awhile since I saw this old recurve." },
		{ Cue = "/VO/Hestia_0049",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			StartSound = "/SFX/LyreMedium",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
			Text = "Of course, I never leave without it, Father. Perhabs we could give the young prince here something just as valuable. I am sure he can make it worth the effort." },
	}
	OlympusLootData.PoseidonUpgrade.DuoPickupTextLineSets.PoseidonWithHestia01 = {
		Name = "PoseidonWithHestia01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "SeaChanteyTrait",
		{ Cue = "/VO/Poseidon_0251",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "Hey ho, isn't it another one of my Nephew! Let's sing a sailor's song." },
		{ Cue = "/VO/Hestia_0050",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			StartSound = "/SFX/LyreMedium",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
			Text = "As much as I would love that, Uncle, I am sure Zagzag here would appreciate something more... tangible? Let's keep the singing for when he arrives on Olympus." },
	}
	OlympusLootData.AthenaUpgrade.DuoPickupTextLineSets.AthenaWithHestia01 = {
		Name = "AthenaWithHestia01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "RegeneratingCappedSuperTrait",
		{ Cue = "/VO/Athena_0241",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "I see. You are helping Zagreus as well, Step-brother. For someone who claims to be faster than Hermes, you took your sweet time." },
		{ Cue = "/VO/Hestia_0051",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			StartSound = "/SFX/LyreMedium",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
			Text = "You know what, step-sister, just because I appreciate the finer things in life doesn't mean I want to help him any less than you do. And help him we shall!" },
	}
	OlympusLootData.AresUpgrade.DuoPickupTextLineSets.AresWithHestia01 = {
		Name = "AresWithHestia01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "RegeneratingCappedSuperTrait",
		{ Cue = "/VO/Ares_0241",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "My kin, I wish to help you once more, but in order to not fail this time, Hestia here will help me with his foresight. There's no failing this time." },
		{ Cue = "/VO/Hestia_0052",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			StartSound = "/SFX/LyreMedium",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
			Text = "Um, Brother... I really don't think my Foresight is an instrument to be used. How about we try working together instead?  {#DialogueItalicFormat} Urgh, {#PreviousFormat}  do you see what I put up with to try to help you, Zagzag? You owe me one." },
	}
	OlympusLootData.AphroditeUpgrade.DuoPickupTextLineSets.AphroditeWithHestia01 = {
		Name = "AphroditeWithHestia01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "RegeneratingCappedSuperTrait",
		{ Cue = "/VO/Aphrodite_0231",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "Well, lovely as ever, Hestia. From all my relatives, you are by far the only one to understand beauty and perfection." },
		{ Cue = "/VO/Hestia_0053",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			StartSound = "/SFX/LyreMedium",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
			Text = "{#DialogueItalicFormat}Ah{#PreviousFormat}! Well thank you, Aphrodite. You are not too bad yourself. Let's help Zagzag here step up to our league." },
	}
	OlympusLootData.ArtemisUpgrade.DuoPickupTextLineSets.ArtemisWithHestia01 = {
		Name = "ArtemisWithHestia01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "RegeneratingCappedSuperTrait",
		{ Cue = "/VO/Artemis_0251",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "Hestia! How many times did I ask you not to include me in any forms of get together! {#DialogueItalicFormat} Arrg {#PreviousFormat}! I'll make an exception, only because it's Zagreus, but it's the last time." },
		{ Cue = "/VO/Hestia_0054",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			StartSound = "/SFX/LyreMedium",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
			Text = "Oh, is my sister going soft? Is she ready to have a social life? I think I found her weak spot, Zagzag. Let me thank you with this!" },
	}
	OlympusLootData.DionysusUpgrade.DuoPickupTextLineSets.DionysusWithHestia01 = {
		Name = "DionysusWithHestia01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "RegeneratingCappedSuperTrait",
		{ Cue = "/VO/Dionysus_0231",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "Hey Zag, Hestia helped me prepare this awesome welcome party for you. We hope you can get here in time." },
		{ Cue = "/VO/Hestia_0055",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			StartSound = "/SFX/LyreMedium",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
			Text = "Bad news, Brother. My foresight tells me he won't make it here in time. Here, we can try sharing a bit of the party with him through a blessing. How does that sound, Zagzag?" },
	}
	OlympusLootData.DemeterUpgrade.DuoPickupTextLineSets.DemeterWithHestia01 = {
		Name = "DemeterWithHestia01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "RegeneratingCappedSuperTrait",
		{ Cue = "/VO/Demeter_0371",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "Since Hestia is here, I figured we must help you, young Zagreus. Even if Hestia's flare is a bit much for me." },
		{ Cue = "/VO/Hestia_0056",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			StartSound = "/SFX/LyreMedium",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Hestia_01", Portrait = "Portrait_Hestia_Default_01",
			Text = "My flare makes me who I am, Aunty! {#DialogueItalicFormat}Pff{#PreviousFormat} But she's right, Zagzag we'll do what it takes to help you." },
	}
	-- Duo LootData	
	OlympusLootData.AphroditeUpgrade.LinkedUpgrades.FreeHealthTrait = 
	{
		OneFromEachSet =
		{
			{ "HestiaWeaponTrait", "HestiaSecondaryTrait", "HestiaDashTrait", "HestiaRangedTrait", "ShieldLoadAmmo_HestiaRangedTrait"},
			{ "AphroditeWeaponTrait", "AphroditeSecondaryTrait", "AphroditeRushTrait", "AphroditeRangedTrait", "HealthRewardBonusTrait"}
		}
	}

	-- Other gods modification
	-- AthenaUpgrade
	table.insert(OlympusLootData.AthenaUpgrade.PriorityPickupTextLineSets.AthenaVsOlympians01.RequiredTextLines, "HestiaFirstPickUp")
	
	-- HermesUpgrade
	--[[table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian01.RequiredMinAnyTextLines.TextLines, "HermesExpectingHestia01")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian01.RequiredFalseGodLoots, "HestiaUpgrade")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian01.RequiredOneOfTraits, "ForceHestiaBoonTrait")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian02.RequiredMinAnyTextLines.TextLines, "HermesExpectingHestia01")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian02.RequiredFalseGodLoots, "HestiaUpgrade")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian02.RequiredOneOfTraits, "ForceHestiaBoonTrait")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian03.RequiredMinAnyTextLines.TextLines, "HermesExpectingHestia01")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian03.RequiredFalseGodLoots, "HestiaUpgrade")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian03.RequiredOneOfTraits, "ForceHestiaBoonTrait")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian04.RequiredMinAnyTextLines.TextLines, "HermesExpectingHestia01")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian04.RequiredFalseGodLoots, "HestiaUpgrade")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian04.RequiredOneOfTraits, "ForceHestiaBoonTrait")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian05.RequiredMinAnyTextLines.TextLines, "HermesExpectingHestia01")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian05.RequiredFalseGodLoots, "HestiaUpgrade")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian05.RequiredOneOfTraits, "ForceHestiaBoonTrait")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian06.RequiredMinAnyTextLines.TextLines, "HermesExpectingHestia01")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian06.RequiredFalseGodLoots, "HestiaUpgrade")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian06.RequiredOneOfTraits, "ForceHestiaBoonTrait")]]
	
	--[[OlympusLootData.HermesUpgrade.SuperPriorityPickupTextLineSets.HermesExpectingHestia01 =
	{
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		MinRunsSinceSquelchedHermes = ConstantsData.SquelchedHermesRunCount,
		RequiredTextLines = { "HermesFirstPickUp" },
		RequiredFalseGodLoot = "HestiaUpgrade",
		RequiredTrait = "ForceHestiaBoonTrait",
		EndVoiceLines = GlobalVoiceLines.RushedHermesVoiceLines,
	
		{ Cue = "/VO/Hermes_0240",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
			Text = "Some say Hestia is faster than me. Well, here's your proof that I am the fastest among us, Boss!" },
	}]]
	
	-- Gift Section    
	local OlympusGiftOrdering = ModUtil.Entangled.ModData(GiftOrdering)
	local OlympusGiftData = ModUtil.Entangled.ModData(GiftData)
	table.insert(OlympusGiftOrdering, 21, "ForceHestiaBoonTrait")
	
	OlympusGiftData.HestiaUpgrade =
	{
		InheritFrom = {"DefaultGiftData"},
		MaxedIcon = "Keepsake_Hestia_Max",
		MaxedSticker = "Keepsake_HestiaSticker_Max",
		MaxedRequirement = { RequiredTextLines = { "HestiaGift07" }, },
		Value = 0,
		Maximum = 7,
		Locked = 7,
		[1] = { Gift = "ForceHestiaBoonTrait" },
		[7] = { RequiredResource = "SuperGiftPoints" },
		UnlockGameStateRequirements = { RequiredTextLines = { "HestiaAboutArtemis03" } }
	}
	-- FUNCTIONS
	-- Attraction functions
	function GetAllNearestEnemiesArgs( args, targetId )
		local range = args.Range or 500
		local count = args.Count or 3
		if HeroHasTrait("StrongAttractionTrait") then
			count = count + GetTotalHeroTraitValue("AttractionCount")
		end
		local arc = args.Arc or 90
		local nearestEnemyTargetIds =  GetClosestIds({ Id = targetId, DestinationName = "EnemyTeam", IgnoreInvulnerable = true, IgnoreHomingIneligible = true, Distance = range, MaximumCount = count })
		local facingAngle = GetAngle({ Id = CurrentRun.Hero.ObjectId })
		local allNearbyEnemies = {}
		for _, id in pairs( nearestEnemyTargetIds ) do
			local enemy = ActiveEnemies[id]
			if enemy ~= nil and not enemy.IsDead and not enemy.IgnoreAutoLock then
				local angleToTarget = GetAngleBetween({ Id = targetId, DestinationId = id })
				local distance = GetDistance({ Id = targetId, DestinationId = id })
				if CalcArcDistance( facingAngle, angleToTarget ) <= arc then
					if distance < range * 2 then
						table.insert(allNearbyEnemies, id)
					end
				elseif not args.RequireFacing then
					if distance < range * 2 then
						table.insert(allNearbyEnemies, id)
					end
				end
			end
		end
		return allNearbyEnemies
	end
	function CheckChargeVacuumAllNearbyEnemies(weaponData, args)
		CheckProjectileVacuumAllNearbyEnemies(weaponData, CurrentRun.Hero.ObjectId, args)
	end
	function CheckFiredVacuumAllNearbyEnemies(weaponData, args)
		CheckProjectileVacuumAllNearbyEnemies(weaponData, CurrentRun.Hero.ObjectId, args)
	end
	function CheckProjectileVacuumAllNearbyEnemies(weaponData, triggerArgs, args)
		--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(weaponData.Name))
		--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(weaponData.Name)) 	
		
		local args = args[weaponData.Name] or {PullForce = 1000, Range = 500, Count = 3, Arc = 90, Distance = 10}
		args.PullForce = 999
		local pullTarget
		if type(triggerArgs) ~= "number" then
			if args.RequireFirstHit and triggerArgs.FirstUnitInVolley then
				pullTarget = triggerArgs.FirstUnitInVolley.ObjectId
			elseif triggerArgs.LocationX and triggerArgs.LocationY then
				pullTarget = SpawnObstacle({ Name = "InvisibleTarget", LocationX = triggerArgs.LocationX, LocationY = triggerArgs.LocationY })
			else
				pullTarget = CurrentRun.Hero.ObjectId
			end
			
		else
			pullTarget = triggerArgs
		end
		local targetIds = GetAllNearestEnemiesArgs(args, pullTarget)	
		for _, id in pairs( targetIds ) do
			if id ~= 0 and ActiveEnemies[id] ~= nil and not ActiveEnemies[id].IsDead then	
				local force = GetRequiredForceToEnemy( id, pullTarget, -1 * args.Distance )
				if( type(force) ~= "number" or args.PullForce < force ) then
					force = args.PullForce
					if HeroHasTrait("StrongAttractionTrait") then
						force = force + 500
					end
				end
				if not args.RequireFirstHit or pullTarget ~= id then
					ApplyForce({ Id = id, Speed = force, Angle = GetAngleBetween({ Id = id, DestinationId = pullTarget, SelfApplied = true }) })
					HestiaPullPresentation( id, args, pullTarget )
				end
			end
		end
	end
	function HestiaPullPresentation( victimId, args, dropLocation )
		CreateAnimationsBetween({ Animation = "FistVacuumFx", DestinationId = victimId, Id = dropLocation, Length = args.distanceBuffer, Stretch = true, UseZLocation = false, Group = "FX_Standing_Add" })
		PlaySound({ Name = "/SFX/Player Sounds/ZagreusFistMagnetismVacuumActivate", Id = victimId })
	end
	OnProjectileDeath{
		function( triggerArgs )
			local attacker = triggerArgs.AttackerTable
			local weaponData = GetWeaponData( attacker, triggerArgs.WeaponName)

			if CurrentRun.Hero and attacker == CurrentRun.Hero then	
				for i, traitData in pairs( GetHeroTraitValues("OnWeaponProjectileDeathFunction")) do
					if ( traitData.ValidWeapons == nil or Contains(traitData.ValidWeapons, triggerArgs.name )) and traitData.FunctionName and _G[traitData.FunctionName] then
						thread( _G[traitData.FunctionName], weaponData, triggerArgs, traitData.FunctionArgs )
					end					
				end
			end
		end
	}	
	-- Shout functions
	function HestiaShout()
		FireWeaponFromUnit({ Weapon = "HestiaSuper", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId, AutoEquip = true, ClearAllFireRequests = true })
	end
	function HestiaMaxShout()
		FireWeaponFromUnit({ Weapon = "HestiaMaxSuper", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId, AutoEquip = true, ClearAllFireRequests = true })
	end
	function EndHestia()
		ExpireProjectiles({ Names = { "HestiaSuper", "HestiaMaxSuper" } })
	end
	-- LastStand Hestia functions
	ModUtil.Path.Wrap( "CheckLastStand", 
		function ( baseFunc, victim, triggerArgs )
			local hasLastStand = baseFunc(victim, triggerArgs)
			if HeroHasTrait("HealthDefianceTrait") and hasLastStand then
				AddMaxHealth( GetTotalHeroTraitValue("DefianceExtraHealth"), "HealthDefianceTrait", {Delay = 0.1} )
			end
			return hasLastStand
		end
	)
	-- For testing purposes 
    

	-- Hestia FreeHealthTrait
	ModUtil.Path.Wrap( "SpawnRoomReward", 
		function(baseFunc, eventSource, args )
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(CurrentRun.CurrentRoom.Encounter.EncounterType)) 
			if HeroHasTrait("FreeHealthTrait") and CurrentRun.CurrentRoom.Encounter ~= nil and CurrentRun.CurrentRoom.Encounter.EncounterType ~= nil then
				if CurrentRun.CurrentRoom.Encounter.EncounterType == "Boss" or CurrentRun.CurrentRoom.Encounter.EncounterType == "OptionalBoss" then
					local consumableId = SpawnObstacle({ Name = "RoomRewardMaxHealthDrop", DestinationId = CurrentRun.Hero.ObjectId, Group = "Standing"})
					local cost = 0
					local consumable = CreateConsumableItem( consumableId, "RoomRewardMaxHealthDrop", cost )
					ActivatedObjects[consumable.ObjectId] = consumable
					PlaySound({ Name = "/Leftovers/World Sounds/TrainingMontageWhoosh", Id = consumableId })
					thread( InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text = "FreeHealthText", Duration = 1})
				-- end
				-- { "WretchAssassinMiniboss", "HeavyRangedSplitterMiniboss", "RatThugMiniboss", "ThiefImpulseMineLayerMinoboss", "HeavyRangedForkedMiniboss", "StayrRangedMiniboss", "CrawlerMiniboss" }
				elseif CurrentRun.CurrentRoom.IsMiniBossRoom then
					local consumableId = SpawnObstacle({ Name = "RoomRewardEmptyHealthDrop", DestinationId = CurrentRun.Hero.ObjectId, Group = "Standing"})
					local cost = 0
					local consumable = CreateConsumableItem( consumableId, "RoomRewardEmptyHealthDrop", cost )
					ActivatedObjects[consumable.ObjectId] = consumable
					PlaySound({ Name = "/Leftovers/World Sounds/TrainingMontageWhoosh", Id = consumableId })
					thread( InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text = "FreeHealthText", Duration = 1})
				end
				
			end
			baseFunc(eventSource, args)
		end
	)

	ConsumableData.RoomRewardEmptyHealthDrop =
	{
		InheritFrom = { "BaseConsumable", },
		Cost =
		{
			BaseValue = 100,
			DepthMult = 0,
			AsInt = true,
		},
		AddMaxHealth = 25,
		AddMaxHealthArgs =
		{
			Thread = true,
			Delay = 0.5,
			NoHealing = true,
		},
		UseText = "UseEmptyHealthDrop",
		UsePromptOffsetY = 30,
		BlockExitText = "ExitBlockedByHeal",
		SpawnSound = "/SFX/HealthIncreaseDrop",
		ConsumeSound = "/SFX/HealthIncreasePickup",
		PlayInteract = true,
		HideWorldText = true,

		ConsumedVoiceLines =
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.55,
			SuccessiveChanceToPlayAll = 0.5,
			Cooldowns =
			{
				{ Name = "ZagreusAnyQuipSpeech", Time = 60 },
			},

			-- That ought to keep me going for a bit.
			{ Cue = "/VO/ZagreusField_0737", },
			-- Strength of the Centaurs.
			{ Cue = "/VO/ZagreusField_0940", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- That's good.
			{ Cue = "/VO/ZagreusField_0386", RequiredPlayed = { "/VO/ZagreusField_0737" }, CooldownName = "SaidGoodRecently", CooldownTime = 40, },
			-- Yes.
			{ Cue = "/VO/ZagreusField_0387", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- Better.
			{ Cue = "/VO/ZagreusField_0388", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- Good for the health.
			{ Cue = "/VO/ZagreusField_0389", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- That's a relief.
			{ Cue = "/VO/ZagreusField_0299", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- Much better.
			{ Cue = "/VO/ZagreusField_0300", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- That's better.
			{ Cue = "/VO/ZagreusField_0133", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- I feel stronger.
			{ Cue = "/VO/ZagreusField_3995", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- Feeling stronger.
			{ Cue = "/VO/ZagreusField_3996", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- Feeling good.
			{ Cue = "/VO/ZagreusField_3997", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- Feeling tough.
			{ Cue = "/VO/ZagreusField_3998", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- Centaur strength.
			{ Cue = "/VO/ZagreusField_3999", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- Vitality.
			{ Cue = "/VO/ZagreusField_4000", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- That's life.
			{ Cue = "/VO/ZagreusField_4001", RequiredPlayed = { "/VO/ZagreusField_0737" } },
			-- Should keep me going.
			{ Cue = "/VO/ZagreusField_4002", RequiredPlayed = { "/VO/ZagreusField_0737" } },
		},
		ExtractValues =
		{
			{
				Key = "AddMaxHealth",
				ExtractAs = "TooltipMaxHealth",
				Format = "MaxHealth"
			},
		}
	}
	-- For testing purposes
	--[[ModUtil.Path.Wrap( "BeginOpeningCodex", 
		function(baseFunc)		
			if (not CanOpenCodex()) and IsSuperValid() then
				BuildSuperMeter(CurrentRun, 50)
			end
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString.Deep(GiftOrdering)) 
			baseFunc()
		end
	)]]
	--[[ModUtil.Path.Wrap("ModUtil.Hades.Triggers.OnHit.Combat.1.Call", function( base, triggerArgs ) 
		ModUtil.Hades.PrintStackChunks(ModUtil.ToString(ModUtil.Hades.Triggers)) 
		return base( triggerArgs ) 
	end )]]
	
	--[[OnControlPressed{ "Codex",
		function( triggerArgs )
			CreateLoot({ Name = "HestiaUpgrade", OffsetX = 100, SpawnPoint = CurrentRun.Hero.ObjectId })
		end 
	}]]

end