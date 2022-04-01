-- Separate Gods from Goddess to add more gods

ModUtil.RegisterMod("ApolloExtra")

local mod = "ApolloExtra"
local package = "ApolloPackage"

ModUtil.WrapBaseFunction( "SetupMap", function(baseFunc)
    DebugPrint({Text = "@"..mod.." Trying to load package "..package..".pkg"})
    --LoadPackages({Name = package})
    return baseFunc()
end)
--Variables
local DepthDamageMultiplier = 0.0
local DuplicateMultiplier = -0.60
local DuplicateStrongMultiplier = -0.40
local DuplicateVeryStrongMultiplier = -0.20
--Color
local OlympusColor = ModUtil.Entangled.ModData(Color)
OlympusColor.ApolloDamageLight = {255,145,79,255}
OlympusColor.ApolloDamage = {255,145,79,255}
--Assets
local package = "OEAssets"
ModUtil.WrapBaseFunction( "SetupMap", function(baseFunc)
    DebugPrint({Text = "Trying to load package "..package..".pkg"})
    LoadPackages({Name = package})
    return baseFunc()
end)
--EnemyUpgradeData
local OlympusEnemyUpgradeData = ModUtil.Entangled.ModData(EnemyUpgradeData)
OlympusEnemyUpgradeData.ApolloUpgrade =
{
	ScreenPanel = nil,
	UpgradeString = "LtUpgrade_Apollo",
	--AddSpecialWeapons = { ContinuousWeapon = "DevotionZeus" },
	LieutenantsOnly = true,
	Hidden = true,
	PropertyChanges = { },
}
--UnitSetData
local OlympusEnemyData = ModUtil.Entangled.ModData(EnemyData)
OlympusEnemyData.ApolloUpgradeRoomWeapon = {
	InheritFrom = { "PassiveRoomWeapon" },

	DefaultAIData =
	{
		DeepInheritance = true,
		PreAttackDuration = 0,
		FireDuration = 0.0,
		PostAttackDuration = 0.0,
		PostAttackCooldownMin = 6.5,
		PostAttackCooldownMax = 7.5,
		CreateOwnTargetFromOriginalTarget = true,
		RandomTargetAngle = true,
		TargetOffsetDistanceMin = 0,
		TargetOffsetDistanceMax = 0,
		TeleportToTargetId = true,
		TargetFriends = true,
	},

	WeaponOptions =
	{
		"DevotionApollo",
	},
}
--WeaponData
local OlympusWeaponData = ModUtil.Entangled.ModData(WeaponData)
local OlympusEffectData = ModUtil.Entangled.ModData(EffectData)
OlympusWeaponData.ApolloShoutWeapon = {
	BlockWrathGain = true,
}
OlympusWeaponData.ApolloBeamWeapon = {
	InheritFrom = { "NoSlowFrameEffect", "NoShakeEffect", "WrathWeapon", },
	HitScreenshake = { Distance = 3, Speed = 300, Duration = 0.06, FalloffSpeed = 3000 },
	HitSimSlowParameters =
	{
		{ ScreenPreWait = 0.02, Fraction = 0.25, LerpTime = 0 },
		{ ScreenPreWait = 0.16, Fraction = 1.0, LerpTime = 0.1 },
	},
	ImpactReactionHitsOverride = 1,

	BlockInterrupt = true,
	Sounds =
	{
		FireSounds =
		{
			{ Name = "/SFX/HellFireShoot" },
			{ Name = "/SFX/Enemy Sounds/Hades/EmoteRangedSustained" },
			{ Name = "/SFX/Enemy Sounds/Tisiphone/TisiphoneHarpySlowBeam" },
		},
		ImpactSounds =
		{
			Invulnerable = "/SFX/ArrowWallHitClankSmall",
			BrickObstacle = "/SFX/SwordWallHitClankSmall",
			StoneObstacle = "/SFX/ArrowMetalStoneClang",
			MetalObstacle = "/SFX/ArrowMetalStoneClang",
			BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
		},
	},
}
OlympusWeaponData.DevotionApollo =
{
	HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.08, FalloffSpeed = 3000 },
	HitSimSlowParameters =
	{
		{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
		{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0 },
	},
}
OlympusEffectData.ApolloBlind =
{
	OnApplyFunctionName = "ApolloBlindApply",
	OnClearFunctionName = "ApolloBlindClear",
}

--BoonInfoScreenData
local OlympusBoonInfoScreenData = ModUtil.Entangled.ModData(BoonInfoScreenData)
table.insert(OlympusBoonInfoScreenData.Ordering, "ApolloUpgrade")

--ProjectileData
local OlympusProjectileData = ModUtil.Entangled.ModData(ProjectileData)
OlympusProjectileData.ApolloColorProjectile = {
	DamageTextStartColor = OlympusColor.ApolloDamageLight,
	DamageTextColor = OlympusColor.ApolloDamage
}
OlympusProjectileData.ApolloLobProjectile = {
	InheritFrom = { "NoSlowFrameProjectile", "NoShakeProjectile", "ApolloColorProjectile" },
	NeverStore = true,
}
OlympusProjectileData.ApolloBeowulfProjectile = {
	InheritFrom = { "ApolloLobProjectile" },
	NeverStore = true,
}
OlympusProjectileData.ApolloShoutWeapon = {
	InheritFrom = { "NoSlowFrameProjectile", "NoShakeProjectile" },
}
OlympusProjectileData.AreaWeakenApollo = {
	InheritFrom = { "ApolloColorProjectile" },
}
-- GameData
local OlympusGameData = ModUtil.Entangled.ModData(GameData)
OlympusGameData.ApolloBasicPickUpTextLines =
{
        "ApolloFirstPickUp",
        "ApolloMiscPickup01",
        "ApolloMiscPickup02",
        "ApolloMiscPickup03",
        -- "ApolloMiscPickup04",
        "ApolloMiscPickup05",
        "ApolloMiscPickup06",
        "ApolloMiscPickup07",
        "ApolloMiscPickup08",
        "ApolloMiscPickup09",
        -- "ApolloMiscPickup10",
        "ApolloMiscPickup11",
        "ApolloMiscPickup12",
        "ApolloMiscPickup13",
        "ApolloMiscPickup14",
        "ApolloMiscPickup15",
        "ApolloMiscPickup16",
        "ApolloMiscPickup17",
        -- "ApolloMiscPickup18",
        -- "ApolloMiscPickup19",
        "ApolloMiscPickup20",
        -- "ApolloMiscPickup21",
}
table.insert(OlympusGameData.ConversationOrder, "ApolloUpgrade")
table.insert(OlympusGameData.RunClearMessageData.ClearWeaponsFiredWrath.GameStateRequirements.RequiredWeaponsFiredThisRun.Names, "ApolloBeamWeapon")
--Keywords
local OlympusKeywordList = ModUtil.Entangled.ModData(KeywordList)
ModUtil.MapSetTable(OlympusKeywordList, { "ApolloBlind", "FlashBomb" })

-- Codex Section
local OlympusCodexOrdering = ModUtil.Entangled.ModData(CodexOrdering)
local OlympusCodex = ModUtil.Entangled.ModData(Codex)
table.insert(OlympusCodexOrdering.OlympianGods.Order, "ApolloUpgrade")

OlympusCodex.OlympianGods.Entries["ApolloUpgrade"] =
{
	Entries =
	{
		{
			UnlockThreshold = 1,
			Text = "CodexData_Apollo_0001"
		},
		{
		    UnlockThreshold = 5,
		    Text = "CodexData_Apollo_0002"
		},
		{
		    UnlockThreshold = 15,
		    Text = "CodexData_Apollo_0003"
		}
	},
	Image = "Codex_Portrait_Apollo",
}

-- Trait Section
local OlympusTraitData = ModUtil.Entangled.ModData(TraitData)

OlympusTraitData.ForceApolloBoonTrait = {
	Name = "ForceApolloBoonTrait",
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
		InRackTitle = "ForceApolloBoonTrait_Rack",
		Icon = "Keepsake_Harp",
		EquipSound = "/Leftovers/Menu Sounds/TalismanMetalClankDown",
		ForceBoonName = "ApolloUpgrade",
		Uses = 1,
		RarityBonus =
		{
			RequiredGod = "ApolloUpgrade",
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
			Text = "ApolloSignoff",
		  },
		  {
			RequiredTextLines = { "ApolloGift07" },
			Text = "ApolloSignoff_Max"
		  }
		},
}
    
OlympusTraitData.ApolloWeaponTrait =
 {
		 Name = "ApolloWeaponTrait",
		 InheritFrom = { "ShopTier1Trait" },
		 God = "Apollo",
		 Slot = "Melee",
		 Icon =  "Boon_Apollo_01",
		 AddOutgoingDamageModifiers =
		 {
			 ValidWeaponMultiplier =
			 {
				 BaseValue = 1.50,
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
		 PropertyChanges =
		 {
			 {
				 WeaponNames = WeaponSets.HeroPhysicalWeapons,
				 EffectName = "ApolloBlind",
				 EffectProperty = "Active",
				 ChangeValue = true,
			 },
			 {
				 WeaponName = "SwordWeapon",
				 WeaponProperty = "FireFx",
				 ChangeValue = "SwordSwipeAFlipped-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 WeaponName = "SwordWeapon2",
				 WeaponProperty = "FireFx",
				 ChangeValue = "SwordSwipeB-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 WeaponName = "SwordWeapon3",
				 WeaponProperty = "FireFx",
				 ChangeValue = "SwordSwipeC-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 WeaponName = "SwordWeaponDash",
				 WeaponProperty = "FireFx",
				 ChangeValue = "SwordSwipeC-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 }, 
			 {
				 WeaponName = "SwordWeapon3",
				 WeaponProperty = "ChargeFx",
				 ChangeValue = "ChargeAttack-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 }, 
			 {
				 WeaponName = "SwordWeaponDash",
				 WeaponProperty = "ChargeFx",
				 ChangeValue = "ChargeAttack-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 }, 
			 {
				 WeaponName = "SpearWeapon",
				 ProjectileProperty = "Graphic",
				 ChangeValue = "SpearThrustProjectile-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 WeaponName = "SpearWeapon2",
				 ProjectileProperty = "Graphic",
				 ChangeValue = "SpearThrustProjectile-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 WeaponName = "SpearWeapon3",
				 ProjectileProperty = "Graphic",
				 ChangeValue = "SpearThrustProjectile-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 WeaponName = "SpearWeaponDash",
				 ProjectileProperty = "Graphic",
				 ChangeValue = "SpearDashSwipe-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
 
			 {
				 WeaponName = "SpearWeaponSpin",
				 ProjectileProperty = "DetonateGraphic",
				 ChangeValue = "SpearSwipe360-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
 
			 {
				 WeaponName = "SpearWeaponSpin2",
				 ProjectileProperty = "DetonateGraphic",
				 ChangeValue = "SpearSwipe360-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
 
			 {
				 WeaponName = "SpearWeaponSpin3",
				 ProjectileProperty = "DetonateGraphic",
				 ChangeValue = "SpearSwipe360-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
 
			 {
				 WeaponName = "BowWeapon",
				 ProjectileProperty = "Graphic",
				 ChangeValue = "BowWeaponArrow-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 WeaponName = "BowWeapon",
				 WeaponProperty = "MinChargeStartFx",
				 ChangeValue = "BowCharge-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 WeaponName = "BowWeaponDash",
				 ProjectileProperty = "Graphic",
				 ChangeValue = "BowWeaponArrow-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 WeaponName = "BowWeaponDash",
				 WeaponProperty = "ChargeStartFx",
				 ChangeValue = "BowChargeFast-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
 
			 {
				 WeaponName = "ShieldWeapon",
				 ProjectileProperty = "DetonateGraphic",
				 ChangeValue = "ShieldSwipe-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 WeaponName = "ShieldWeaponDash",
				 ProjectileProperty = "DetonateGraphic",
				 ChangeValue = "ShieldSwipeDash-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
 
			 {
				 WeaponName = "ShieldWeaponRush",
				 WeaponProperty = "ChargeStartFx",
				 ChangeValue = "ShieldCharge-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
 
			 {
				 WeaponName = "ShieldWeaponRush",
				 ProjectileProperty = "Graphic",
				 ChangeValue = "ShieldRush3D-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
 
			 {
				 WeaponName = "ShieldWeaponRush",
				 ProjectileProperty = "DissipateGraphic",
				 ChangeValue = "ShieldRush3D-Out-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
 
			 {
				 WeaponName = "GunWeapon",
				 ProjectileProperty = "Graphic",
				 ChangeValue = "GunWeaponProjectile-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
 
			 {
				 WeaponName = "GunWeapon",
				 WeaponProperty = "FireFx",
				 ChangeValue = "GunFire-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
 
			 {
				 WeaponName = "GunWeapon",
				 ProjectileProperty = "ImpactFx",
				 ChangeValue = "GunWeaponImpact-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
 
			 {
				 WeaponName = "GunWeaponDash",
				 ProjectileProperty = "Graphic",
				 ChangeValue = "GunWeaponProjectile-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
 
			 {
				 WeaponName = "GunWeaponDash",
				 WeaponProperty = "FireFx",
				 ChangeValue = "GunFire-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
 
			 {
				 WeaponName = "GunWeaponDash",
				 ProjectileProperty = "ImpactFx",
				 ChangeValue = "GunWeaponImpact-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
 
			 {
				 WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				 ProjectileProperty = "Graphic",
				 ChangeValue = "FistFxApollo",
				 ChangeType = "Absolute"
			 },
			 {
				 WeaponName = "FistWeaponDash",
				 ProjectileProperty = "StartFx",
				 ChangeValue = "FistFxSwipe",
				 ChangeType = "Absolute",
			 },
 
			 {
				 TraitName = "SwordConsecrationTrait",
				 WeaponNames = { "SwordWeapon" },
				 WeaponProperty = "FireFx",
				 ChangeValue = "SwordSwipeC-Apollo-Arthur",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 TraitName = "SwordConsecrationTrait",
				 WeaponNames = { "SwordWeapon2" },
				 WeaponProperty = "ChargeFx",
				 ChangeValue = "ChargeAttack-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 TraitName = "SwordConsecrationTrait",
				 WeaponNames = { "SwordWeapon2" },
				 WeaponProperty = "FireFx",
				 ChangeValue = "SwordSwipeA-Apollo-Arthur",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 TraitName = "SwordConsecrationTrait",
				 WeaponNames = { "SwordWeapon3" },
				 WeaponProperty = "FireFx",
				 ChangeValue = "SwordSwipeAFlipped-Apollo-Arthur",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 TraitName = "SwordConsecrationTrait",
				 WeaponNames = { "SwordWeapon3" },
				 WeaponProperty = "ChargeFx",
				 ChangeValue = "ChargeAttack-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 TraitName = "SwordConsecrationTrait",
				 WeaponNames = { "SwordWeaponDash" },
				 WeaponProperty = "FireFx",
				 ChangeValue = "SwordSwipeC-Apollo-Arthur",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
 
			 {
				 TraitName = "BowBondTrait",
				 WeaponName = "BowWeapon",
				 WeaponProperty = "MinChargeStartFx",
				 ChangeValue = "BowChargeRama-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
 
			 {
				 TraitName = "BowBondTrait",
				 WeaponName = "BowWeaponDash",
				 WeaponProperty = "ChargeStartFx",
				 ChangeValue = "BowChargeRamaDash-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
 
			 {
				 TraitName = "BowBondTrait",
				 WeaponNames = { "BowWeapon", "BowWeaponDash" },
				 ProjectileProperty = "AttachedAnim",
				 ChangeValue = "RamaWideShot-Apollo",
				 ChangeType = "Absoawlute",
				 ExcludeLinked = true,
			 },
 
			 {
				 TraitName = "GunLoadedGrenadeTrait",
				 WeaponName = "GunWeapon",
				 ProjectileProperty = "Graphic",
				 ChangeValue = "GunLaser-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 TraitName = "GunLoadedGrenadeTrait",
				 WeaponName = "GunWeapon",
				 ProjectileProperty = "AttachedAnim",
				 ChangeValue = "GunLaserOriginFlare-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 TraitName = "GunLoadedGrenadeTrait",
				 WeaponName = "GunWeapon",
				 ProjectileProperty = "TipFx",
				 ChangeValue = "GunLaserTipFlare-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 TraitName = "GunLoadedGrenadeTrait",
				 WeaponName = "GunWeapon",
				 WeaponProperty = "ChargeStartFx",
				 ChangeValue = "GunCharge-Apollo",
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
				 ChangeValue = "GunLaserEnd-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
 
			 {
				 TraitName = "ShieldLoadAmmoTrait",
				 WeaponName = "ShieldWeapon",
				 ProjectileProperty = "DetonateGraphic",
				 ChangeValue = "BeowulfShieldSlam-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
 
			 {
				 TraitName = "BowMarkHomingTrait",
				 WeaponNames = { "BowWeapon" },
				 ProjectileProperty = "Graphic",
				 ChangeValue = "BowWeaponArrow-Apollo-Alt01",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 TraitName = "BowLoadAmmoTrait",
				 WeaponNames = { "BowWeapon" },
				 ProjectileProperty = "Graphic",
				 ChangeValue = "BowWeaponArrow-Apollo-Alt02",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
 
			 {
				 WeaponNames = { "FistWeapon", "FistWeapon3", "FistWeapon5" },
				 TraitName = "FistDetonateTrait",
				 WeaponProperty = "FireFx",
				 ChangeValue = "ClawSwipe-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 WeaponNames = { "FistWeapon2", "FistWeapon4" },
				 TraitName = "FistDetonateTrait",
				 WeaponProperty = "FireFx",
				 ChangeValue = "ClawSwipeFlipped-Apollo",
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
				 ChangeValue = "ClawSwipeFlippedDash-Apollo",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
 
		 },
		 ExtractValues =
		 {
			{
				ExtractAs = "TooltipBlindDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ApolloBlind",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipBlindPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ApolloBlind",
				BaseProperty = "Amount",
				Format = "Percent"
			}
		 }
 } 
OlympusTraitData.ApolloSecondaryTrait =
 {
	 Name = "ApolloSecondaryTrait",
	 InheritFrom = { "ShopTier1Trait" },
	 God = "Apollo",
	 Slot = "Secondary",
	 Icon =  "Boon_Apollo_02",
	 AddOutgoingDamageModifiers =
	 {
		 ValidWeaponMultiplier =
		 {
			 BaseValue = 1.8,
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
	 PropertyChanges =
	 {
		 {
			 WeaponNames = WeaponSets.HeroSecondaryWeapons,
			 EffectName = "ApolloBlind",
			 EffectProperty = "Active",
			 ChangeValue = true,
		 },

		 {
			 WeaponName = "SwordParry",
			 ProjectileProperty = "DetonateGraphic",
			 ChangeValue = "RadialNovaSwordParry-Apollo",
			 ChangeType = "Absolute",
			 ExcludeLinked = true,
		 },

		 {
			 WeaponName = "SpearWeaponThrow",
			 ProjectileProperty = "Graphic",
			 ChangeValue = "SpearThrowProjectile-Apollo",
			 ChangeType = "Absolute",
			 ExcludeLinked = true,
		 },

		 {
			 WeaponName = "SpearWeaponThrowReturn",
			 ProjectileProperty = "Graphic",
			 ChangeValue = "SpearThrowProjectile-Apollo",
			 ChangeType = "Absolute",
			 ExcludeLinked = true,
		 },
		 {
			 WeaponName = "BowSplitShot",
			 ProjectileProperty = "Graphic",
			 ChangeValue = "BowWeaponArrow-Apollo-SplitShot",
			 ChangeType = "Absolute",
			 ExcludeLinked = true,
		 },

		 {
			 WeaponName = "BowSplitShot",
			 WeaponProperty = "MinChargeStartFx",
			 ChangeValue = "BowCharge-Apollo",
			 ChangeType = "Absolute",
			 ExcludeLinked = true,
		 },

		 {
			 WeaponNames = { "ShieldThrow", },
			 ProjectileName = "ShieldThrow",
			 ProjectileProperty = "DetonateGraphic",
			 ChangeValue = "ShieldSwipe-Apollo",
			 ChangeType = "Absolute",
			 ExcludeLinked = true,
		 },
		 {
			 WeaponNames = { "ShieldThrowDash" },
			 ProjectileName = "ShieldThrowDash",
			 ProjectileProperty = "DetonateGraphic",
			 ChangeValue = "ShieldSwipe-Apollo",
			 ChangeType = "Absolute",
			 ExcludeLinked = true,
		 },

		 {
			 WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
			 WeaponProperty = "ChargeStartFx",
			 ChangeValue = "ShieldCharge-Apollo",
			 ChangeType = "Absolute",
			 ExcludeLinked = true,
		 },

		 {
			 WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
			 ProjectileProperty = "Graphic",
			 ChangeValue = "ProjectileShield-Apollo",
			 ChangeType = "Absolute",
			 ExcludeLinked = true,
		 },
		 {
			 TraitName = "ShieldRushBonusProjectileTrait",
			 ProjectileProperty = "Graphic",
			 WeaponNames = { "ShieldThrow", "ShieldThrowDash", "ChaosShieldThrow" },
			 ChangeValue = "ProjectileShieldAlt01-Apollo",
			 ChangeType = "Absolute",
			 ExcludeLinked = true,
		 },
		 {
			 TraitName = "ShieldLoadAmmoTrait",
			 ProjectileProperty = "Graphic",
			 WeaponNames = { "ShieldThrow", "ShieldThrowDash", "ChaosShieldThrow" },
			 ChangeValue = "ProjectileShieldAlt03-Apollo",
			 ChangeType = "Absolute",
			 ExcludeLinked = true,
		 },
		 {
			 TraitName = "ShieldTwoShieldTrait",
			 ProjectileProperty = "Graphic",
			 WeaponName = "ShieldThrow",
			 ChangeValue = "ProjectileShieldAlt02-Apollo",
			 ChangeType = "Absolute",
			 ExcludeLinked = true,
		 },
		 {
			 TraitName = "ShieldTwoShieldTrait",
			 WeaponName = "ShieldThrow",
			 ProjectileName = "ShieldThrow",
			 ProjectileProperty = "DetonateGraphic",
			 ChangeValue = "ShieldThrowTrailMirage-Apollo",
			 ChangeType = "Absolute",
			 ExcludeLinked = true,
		 },
		 {
			 WeaponName = "GunGrenadeToss",
			 ProjectileProperty = "DetonateGraphic",
			 ChangeValue = "ZagGrenadeExplosionApollo",
			 ChangeType = "Absolute",
			 ExcludeLinked = true,
		 },
		 {
			 TraitName = "SpearTeleportTrait",
			 WeaponName = "SpearRushWeapon",
			 ProjectileName = "SpearRushWeapon",
			 ProjectileProperty = "DetonateGraphic",
			 ChangeValue = "SpearRushTrailFx-Apollo",
			 ChangeType = "Absolute",
			 ExcludeLinked = true,
		 },
		 {
			 WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
			 WeaponProperty = "FireFx",
			 ChangeValue = "FistFxUppercutDirectionalApollo",
			 ChangeType = "Absolute",
			 ExcludeLinked = true,
		 },

		 {
			 TraitName = "GunLoadedGrenadeTrait",
			 WeaponNames = { "GunGrenadeToss" },
			 ProjectileProperty = "Graphic",
			 ChangeValue = "GunGrenadeLuciferOrb-Apollo",
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
			 ChangeValue = "ZagGrenadeExplosionApollo",
			 ChangeType = "Absolute",
			 ExcludeLinked = true,
		 },
		 {
			 TraitName = "GunLoadedGrenadeTrait",
			 WeaponNames = { "GunBombImmolation" },
			 ProjectileProperty = "DetonateGraphic",
			 ChangeValue = "LuciferOrbAoE-Apollo",
			 ChangeType = "Absolute",
			 ExcludeLinked = true,
		 },

		 {
			 TraitName = "BowMarkHomingTrait",
			 WeaponNames = { "BowSplitShot" },
			 ProjectileProperty = "Graphic",
			 ChangeValue = "BowWeaponArrow-Apollo-SplitShot-Alt01",
			 ChangeType = "Absolute",
			 ExcludeLinked = true,
		 },
		 {
			 TraitName = "BowLoadAmmoTrait",
			 WeaponNames = { "BowSplitShot" },
			 ProjectileProperty = "Graphic",
			 ChangeValue = "BowWeaponArrow-Apollo-SplitShot-Alt02",
			 ChangeType = "Absolute",
			 ExcludeLinked = true,
		 },
		 {
			 TraitName = "FistDetonateTrait",
			 WeaponNames = { "FistWeaponSpecial" },
			 WeaponProperty = "FireFx",
			 ChangeValue = "ClawSwipeUppercut-Apollo",
			 ChangeType = "Absolute",
			 ExcludeLinked = true,
		 },
		 {
			 TraitName = "FistDetonateTrait",
			 WeaponNames = { "FistWeaponSpecialDash" },
			 WeaponProperty = "FireFx",
			 ChangeValue = "ClawSwipeUppercut-Apollo",
			 ChangeType = "Absolute",
			 ExcludeLinked = true,
		 },
		 {
			 TraitName = "FistDetonateTrait",
			 WeaponNames = { "FistWeaponSpecialDash" },
			 WeaponProperty = "FireFx",
			 ChangeValue = "ClawSwipeUppercutSpecial-Apollo",
			 ChangeType = "Absolute",
			 ExcludeLinked = true,
		 },
		 {
			 TraitName = "FistTeleportSpecialTrait",
			 WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
			 WeaponProperty = "FireFx",
			 ChangeValue = "FistFxUppercutDirectionalApollo_FlashKick",
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
			 ChangeValue = "LuciferBomb-Apollo",
			 ChangeType = "Absolute",
		 },

	 },
	 ExtractValues =
	 {
		{
			ExtractAs = "TooltipBlindDuration",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "ApolloBlind",
			BaseProperty = "Duration",
		},
		{
			ExtractAs = "TooltipBlindPower",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "ApolloBlind",
			BaseProperty = "Amount",
			Format = "Percent"
		}
	 }
 }
OlympusTraitData.ApolloDashTrait =
 {
	 Name = "ApolloDashTrait",
	 InheritFrom = { "ShopTier1Trait" },
	 -- Inherit
	 Cost = 30,
	 -- New Data
	 God = "Apollo",
	 Slot = "Rush",
	 Icon = "Boon_Apollo_03",
	 RarityLevels =
	 {
		 Common =
		 {
			 MinMultiplier = 1.0,
			 MaxMultiplier = 1.0,
		 },
		 Rare =
		 {
			 MinMultiplier = 1.5,
			 MaxMultiplier = 1.5,

		 },
		 Epic =
		 {
			 MinMultiplier = 2.0,
			 MaxMultiplier = 2.0,
		 },
		 Heroic =
		 {
			 MinMultiplier = 2.5,
			 MaxMultiplier = 2.5,
		 }
	 },
	 WeaponDataOverride =
	 {
		 RushWeapon =
		 {
			 CauseImpactReaction = false,
			 ImpactReactionHitsOverride = 0,
		 },
	 },
	 PropertyChanges =
	 {
		 {
			 WeaponNames = WeaponSets.HeroRushWeapons,
			 WeaponProperty = "Projectile",
			 ChangeValue = "ApolloDashProjectile",
			 ChangeType = "Absolute",
		 },
		 {
			 WeaponNames = WeaponSets.HeroRushWeapons,
			 ProjectileProperty = "DamageLow",
			 BaseMin = 20,
			 BaseMax = 20,
			 AsInt = true,
			 DepthMult = DepthDamageMultiplier,
			 IdenticalMultiplier =
			 {
				 Value = DuplicateVeryStrongMultiplier,
			 },
			 ExtractValue =
			 {
				 ExtractAs = "TooltipDamage",
			 }
		 },
		 {
			 WeaponNames = WeaponSets.HeroRushWeapons,
			 ProjectileProperty = "DamageHigh",
			 DeriveValueFrom = "DamageLow"
		 },
		 {
			 WeaponNames = WeaponSets.HeroRushWeapons,
			 WeaponProperty = "BlinkDetonateAtEndpointDelay",
			 ChangeValue = 0.01,
			 ChangeType = "Absolute",
		 },
		 {
			 WeaponNames = WeaponSets.HeroRushWeapons,
			 EffectName = "ApolloBlind",
			 EffectProperty = "Active",
			 ChangeValue = true,
		 },
		 {
			 WeaponNames = WeaponSets.HeroRushWeapons,
			 WeaponProperty = "FireFx",
			 ChangeValue = "BlinkTrailVerticalB-Apollo",
			 ChangeType = "Absolute",
		 },
		 {
			 WeaponNames = WeaponSets.HeroRushWeapons,
			 WeaponProperty = "FireGraphic",
			 ChangeValue = "ZagreusDashNoCollide_Apollo",
			 ChangeType = "Absolute",
		 },
		 {
			 WeaponNames = WeaponSets.HeroRushWeapons,
			 WeaponProperty = "BlinkDetonateAtOrigin",
			 ChangeValue = true,
			 ChangeType = "Absolute",
		 },
		 {
			 WeaponNames = WeaponSets.HeroRushWeapons,
			 WeaponProperty = "BlinkDetonateAtEndpoint",
			 ChangeValue = false,
			 ChangeType = "Absolute",
		 },
	 },
	 ExtractValues =
	 {
		 {
			 ExtractAs = "TooltipBlindDuration",
			 SkipAutoExtract = true,
			 External = true,
			 BaseType = "Effect",
			 WeaponName = "SwordWeapon",
			 BaseName = "ApolloBlind",
			 BaseProperty = "Duration",
		 },
		 {
			 ExtractAs = "TooltipBlindPower",
			 SkipAutoExtract = true,
			 External = true,
			 BaseType = "Effect",
			 WeaponName = "SwordWeapon",
			 BaseName = "ApolloBlind",
			 BaseProperty = "Amount",
			 Format = "Percent"
		 }
	 }
 }
OlympusTraitData.ApolloRangedTrait =
	{
		Name = "ApolloRangedTrait",
		InheritFrom = { "ShopTier1Trait" },
		God = "Apollo",
		Icon = "Boon_Apollo_04",
        RequiredFalseTrait = "ShieldLoadAmmoTrait",
		CustomTrayText = "ApolloRangedTrait_Tray",
		Slot = "Ranged",
		UnloadAmmoOffset = 
		{
			BaseValue = -20,
			MinMultiplier = 0,
			IdenticalMultiplier =
			{
				Value = -1,
			},
			IgnoreRarity = true,
		},
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.11,
			},
			Epic =
			{
				Multiplier = 1.22,
			},
			Heroic =
			{
				Multiplier = 1.33,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "ApolloLobProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "SilentImpactOnInvulnerable",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "AimLineAnimation",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "ManualAiming",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "AcceptTriggerLockRequests",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "AllowExternalForceRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "AutoLockRange",
				ChangeValue = 900,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "ManualAimingInitialOffset",
				ChangeValue = 420,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "TargetReticleAnimation",
				ChangeValue = "GunGrenadeWarningDecal",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusRangedWeapon_ChargeDionysusLob",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "ApolloLobProjectile",
				ProjectileProperty = "DamageLow",
				BaseMin = 90,
				BaseMax = 90,
				AsInt = true,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				ExtractSource = "ExtractSource",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "ApolloLobProjectile",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			-- Beowulf modifications
			{
				TraitName = "ShieldLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "ApolloLobProjectile",
				ProjectileProperty = "DamageLow",
				DeriveValueFrom = "ExtractSource",
				ExtractValue =
				{
					ExtractAs = "TooltipDamageBeowulf",
				},
			},
			{
				TraitName = "ShieldLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "ApolloLobProjectile",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "ExtractSource",
			},
			{
				TraitName = "ShieldLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ExcludeProjectileName = "ApolloLobProjectile",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "null",
			},
			-- In case bow load ammo is Active
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireOnRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "Type",
				ChangeValue = "INSTANT",
			},
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
			-- Flurry Shot
			{
				TraitName = "RapidCastTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireOnRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
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
			},
			{
				ExtractAs = "TooltipBlindDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ApolloBlind",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipBlindPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ApolloBlind",
				BaseProperty = "Amount",
				Format = "PercentDelta"
			}
		}
	}
OlympusTraitData.ApolloShoutTrait =
{
		InheritFrom = { "ShopTier1Trait" },
		RequiredTextLines = { "PoseidonWrathIntro01" },
		CustomTrayText = "ApolloShoutTrait_Tray",
		God = "Apollo",
		Slot = "Shout",
		Icon = "Boon_Apollo_06",
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
			FunctionName = "ApolloShout",
			Cost = 25,
			SuperDuration = 1.2,
			MaxDurationMultiplier = 6,
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
		EndShout = "EndApolloBeam",
		PreEquipWeapons = { "ApolloBeamWeapon", "ApolloBeamAim" },
		PropertyChanges =
		{
			{
				WeaponName = "ApolloBeamWeapon",
				ProjectileProperty = "DamageLow",
				BaseMin = 15,
				BaseMax = 15,
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
				WeaponName = "ApolloBeamWeapon",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		}
}
OlympusTraitData.FountainDefenseTrait =
{
    Icon = "Boon_Apollo_07",
    InheritFrom = { "ShopTier1Trait" },
    God = "Apollo",
    CustomTrayText = "FountainDefenseTrait_Tray",
    RequiredFalseTrait = "FountainDefenseTrait",    
	RequiredCosmetics = { "TartarusReprieve" },
	RarityLevels =
	{
		Common =
		{
			Multiplier = 1.00,
		},
		Rare =
		{
			Multiplier = 1.05,
		},
		Epic =
		{
			Multiplier = 1.10,
		},
		Heroic =
		{
			Multiplier = 1.15,
		}
	},
	FountainDefenseBonus = 
	{
		BaseValue = 0.95,
		MinMultiplier = 0.1,
		ToNearest = 0.01,
		SourceIsMultiplier = true,
		IdenticalMultiplier = 
		{
			Value = -0.5,
		},		
	},
	AccumulatedFountainDefenseBonus = 1,
	AddIncomingDamageModifiers =
	{
		DistanceThreshold = 400,
		DistanceMultiplier = AccumulatedFountainDefenseBonus,
	},
    ExtractValues =
    {
      {
        Key = "FountainDefenseBonus",
        ExtractAs = "TooltipFountainBonus",
        Format = "PercentDelta",
        DecimalPlaces = 1,
      },
      {
        Key = "AccumulatedFountainDefenseBonus",
        ExtractAs = "TooltipAccumulatedBonus",
        Format = "PercentDelta",
        DecimalPlaces = 1,
      },
    },
}
OlympusTraitData.ApolloBlindedTrait =
{
	Name = "ApolloBlindedTrait",
	God = "Apollo",
	InheritFrom = {"ShopTier2Trait"},
	--PreEquipWeapons = {"AphroditeShoutWeapon", "AreaWeakenAphrodite", "PoseidonAphroditeTouchWeapon"},
	Icon = "Boon_Apollo_08",
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
		},
		Heroic =
		{
			Multiplier = 2.5,
		}
	},
	PropertyChanges =
	{
		{
			TraitName = "ApolloWeaponTrait",
			WeaponNames = WeaponSets.HeroPhysicalWeapons,
			EffectName = "IncreaseDamageTaken",
			EffectProperty = "Active",
			ChangeValue = true,
		},
		{
			TraitName = "ApolloRangedTrait",
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			EffectName = "IncreaseDamageTaken",
			EffectProperty = "Active",
			ChangeValue = true,
		},
		{
			TraitName = "AreaWeakenApollo",
			EffectName = "IncreaseDamageTaken",
			EffectProperty = "Active",
			ChangeValue = true,
		},
		--[[
		{
			TraitName = "ShieldLoadAmmo_AphroditeRangedTrait",
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			EffectName = "IncreaseDamageTaken",
			EffectProperty = "Active",
			ChangeValue = true,
		},
		{
			WeaponNames = {"AphroditeShoutWeapon", "PoseidonAphroditeTouchWeapon" },
			EffectName = "IncreaseDamageTaken",
			EffectProperty = "Active",
			ChangeValue = true,
		},]]
		{
			WeaponNames = WeaponSets.HeroPhysicalWeapons,
			EffectName = "IncreaseDamageTaken",
			EffectProperty = "Modifier",
			BaseMin = 0.10,
			BaseMax = 0.10,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
			ExtractValue =
			{
				ExtractAs = "TooltipDamage",
				Format = "Percent",
			},
			ChangeType = "Add",
			DeriveSource = "DeriveSource"
		},
		{
			WeaponNames = {"AreaWeakenApollo"},
			EffectName = "IncreaseDamageTaken",
			EffectProperty = "Modifier",
			DeriveValueFrom = "DeriveSource",
		},
		--[[{
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			EffectName = "IncreaseDamageTaken",
			EffectProperty = "Modifier",
			DeriveValueFrom = "DeriveSource",
		},
		{
			WeaponNames = {"AphroditeShoutWeapon", "AreaWeakenAphrodite", "PoseidonAphroditeTouchWeapon" },
			EffectName = "IncreaseDamageTaken",
			EffectProperty = "Modifier",
			DeriveValueFrom = "DeriveSource",
		},]]
		{
			TraitName = "ApolloDashTrait",
			WeaponNames = WeaponSets.HeroRushWeapons,
			EffectName = "IncreaseDamageTaken",
			EffectProperty = "Active",
			ChangeValue = true,
		},
		{
			TraitName = "ApolloDashTrait",
			WeaponNames = WeaponSets.HeroRushWeapons,
			EffectName = "IncreaseDamageTaken",
			EffectProperty = "Modifier",
			DeriveValueFrom = "DeriveSource",
		},
		--[[{
			TraitName = "AphroditeSecondaryTrait",
			WeaponNames = WeaponSets.HeroSecondaryWeapons,
			EffectName = "IncreaseDamageTaken",
			EffectProperty = "Active",
			ChangeValue = true,
		},
		{
			TraitName = "AphroditeSecondaryTrait",
			WeaponNames = WeaponSets.HeroSecondaryWeapons,
			EffectName = "IncreaseDamageTaken",
			EffectProperty = "Modifier",
			DeriveValueFrom = "DeriveSource",
		},
		]]
	},
	ExtractValues =
	{
		{
			ExtractAs = "TooltipBlindDuration",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "ApolloBlind",
			BaseProperty = "Duration",
		},
		{
			ExtractAs = "TooltipBlindPower",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "ApolloBlind",
			BaseProperty = "Amount",
			Format = "Percent"
		}
	}
}
OlympusTraitData.ApolloRetaliateTrait =
 {
	God = "Apollo",
	InheritFrom = { "ShopTier1Trait" },
	AddOnHitWeapons = { "AreaWeakenApollo" },
	Icon = "Boon_Apollo_09",
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
			WeaponName = "AreaWeakenApollo",
			ProjectileProperty = "DamageLow",
			BaseMin = 50,
			BaseMax = 50,
			DepthMult = DepthDamageMultiplier,
			IdenticalMultiplier =
			{
				Value = DuplicateVeryStrongMultiplier,
			},
			ExtractValue =
			{
				ExtractAs = "TooltipDamage",
			}
		},
		{
			WeaponName = "AreaWeakenApollo",
			ProjectileProperty = "DamageHigh",
			DeriveValueFrom = "DamageLow",
		},
	},
	ExtractValues =
	{
		{
			ExtractAs = "TooltipBlindDuration",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "ApolloBlind",
			BaseProperty = "Duration",
		},
		{
			ExtractAs = "TooltipBlindPower",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "ApolloBlind",
			BaseProperty = "Amount",
			Format = "Percent"
		}
	}
}
OlympusTraitData.FountainCoinTrait =
{
    Icon = "Boon_Apollo_11",
    InheritFrom = { "ShopTier1Trait" },
    God = "Apollo",
    CustomTrayText = "FountainCoinTrait_Tray",
    RequiredFalseTrait = "FountainCoinTrait",    
	RequiredCosmetics = { "TartarusReprieve" },
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
			Multiplier = 2.00,
		}
	},
	FountainCoinBonus = { 
		BaseValue = 100
	},
}
OlympusTraitData.ApolloHealTrait =
{
    Icon = "Boon_Apollo_13",
    InheritFrom = { "ShopTier2Trait" },
    God = "Apollo",
	RarityLevels =
	{
		Common =
		{
			Multiplier = 1.00,
		},
		Rare =
		{
			Multiplier = 2.00,
		},
		Epic =
		{
			Multiplier = 3.00,
		},
		Heroic =
		{
			Multiplier = 4.00,
		}
	},
	ApolloHealDropChance = { 
		BaseValue = 0.01
	},
	ExtractValues =
    {
        {
            ExtractAs = "TooltipBlindDuration",
            SkipAutoExtract = true,
            External = true,
            BaseType = "Effect",
            WeaponName = "SwordWeapon",
            BaseName = "ApolloBlind",
            BaseProperty = "Duration",
        },
		{
			Key = "ApolloHealDropChance",
			ExtractAs = "TooltipDropChance",
			Format = "Percent"
		  },
    }
}
OlympusTraitData.RerollBoonTrait = -- Future Sight
{
	InheritFrom = { "ShopTier1Trait" },
	RequiredMetaUpgradeSelected = "RerollPanelMetaUpgrade",
	RequiredMetaUpgradeUnlocked = "RerollPanelMetaUpgrade",
	Icon = "Boon_Apollo_10",
	RequiredFalseTrait = {"RerollObolTrait", "RerollBoonTrait"},
	BoonCount = { 
		BaseValue = 1
	},
	RarityLevels =
	{
		Common =
		{
			Multiplier = 5,
		},
		Rare =
		{
			Multiplier = 4,
		},
		Epic =
		{
			Multiplier = 3,
		},
		Heroic =
		{
			Multiplier = 2,
		}
	},
	ExtractValues =
	{
		{
			Key = "BoonCount",
			ExtractAs = "TooltipBoonCount",
		}
	}
}
OlympusTraitData.RerollObolTrait = -- Golden Fleece
{
	InheritFrom = { "ShopTier1Trait" },
	RequiredMetaUpgradeSelected = "RerollMetaUpgrade",
	RequiredMetaUpgradeUnlocked = "RerollMetaUpgrade",
	Icon = "Boon_Apollo_12",--"Boon_Apollo_12",
	RequiredFalseTrait = {"RerollObolTrait", "RerollBoonTrait"},
	ObolCount = { 
		BaseValue = 1
	},
	RarityLevels =
	{
		Common =
		{
			Multiplier = 300,
		},
		Rare =
		{
			Multiplier = 250,
		},
		Epic =
		{
			Multiplier = 200,
		},
		Heroic =
		{
			Multiplier = 150,
		}
	},
	ExtractValues =
	{
		{
			Key = "ObolCount",
			ExtractAs = "TooltipObolCount",
		}
	}
}

OlympusTraitData.MissChanceTrait =
{
	Icon = "Boon_Apollo_14",
	RequiredFalseTrait = "MissChanceTrait",
	God = "Apollo",
	InheritFrom = { "ShopTier3Trait" },
	PropertyChanges =
	{
		{
			WeaponName = WeaponSets.HeroPhysicalWeapons,
			EffectName = "ApolloBlind",
			EffectProperty = "Amount",
			ChangeValue = 0.75,
			ChangeType = "Absolute",
		},
		{
			WeaponName = WeaponSets.HeroSecondaryWeapons,
			EffectName = "ApolloBlind",
			EffectProperty = "Amount",
			ChangeValue = 0.75,
			ChangeType = "Absolute",
		},
		{
			WeaponName = WeaponSets.HeroRushWeapons,
			EffectName = "ApolloBlind",
			EffectProperty = "Amount",
			ChangeValue = 0.75,
			ChangeType = "Absolute",
		},
		{
			WeaponName = WeaponSets.HeroNonPhysicalWeapons,
			EffectName = "ApolloBlind",
			EffectProperty = "Amount",
			ChangeValue = 0.75,
			ChangeType = "Absolute",
		},
		{
			WeaponNames = {"AreaWeakenApollo"},
			EffectName = "ApolloBlind",
			EffectProperty = "Amount",
			ChangeValue = 0.75,
			ChangeType = "Absolute",
		},
	},
	ExtractValues =
	{
		{
			ExtractAs = "TooltipBlindDuration",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "ApolloBlind",
			BaseProperty = "Duration",
		},
		{
			ExtractAs = "TooltipBlindPower",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "ApolloBlind",
			BaseProperty = "Amount",
			Format = "Percent"
		}
	}
}
-- Duo Traits
OlympusTraitData.BlindDurationTrait =
{
	InheritFrom = { "SynergyTrait" },
	Icon = "Apollo_Demeter_01",
	RequiredFalseTrait = "BlindDurationTrait",
	PropertyChanges =
	{
		{
			WeaponName = WeaponSets.HeroPhysicalWeapons,
			EffectName = "ApolloBlind",
			EffectProperty = "Duration",
			ChangeValue = 10,
			ChangeType = "Absolute",
			ExtractValue =
			{
				ExtractAs = "TooltipDuration",
			},
		},
		{
			WeaponName = WeaponSets.HeroSecondaryWeapons,
			EffectName = "ApolloBlind",
			EffectProperty = "Duration",
			ChangeValue = 10,
			ChangeType = "Absolute",
		},
		{
			WeaponName = WeaponSets.HeroRushWeapons,
			EffectName = "ApolloBlind",
			EffectProperty = "Duration",
			ChangeValue = 10,
			ChangeType = "Absolute",
		},
		{
			WeaponName = WeaponSets.HeroNonPhysicalWeapons,
			EffectName = "ApolloBlind",
			EffectProperty = "Duration",
			ChangeValue = 10,
			ChangeType = "Absolute",
		},
		{
			WeaponNames = {"AreaWeakenApollo"},
			EffectName = "ApolloBlind",
			EffectProperty = "Duration",
			ChangeValue = 10,
			ChangeType = "Absolute",
		},		
	},
	ExtractValues =
	{
		{
			ExtractAs = "TooltipBlindDuration",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "ApolloBlind",
			BaseProperty = "Duration",
		},
		{
			ExtractAs = "TooltipBlindPower",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "ApolloBlind",
			BaseProperty = "Amount",
			Format = "Percent"
		}
	}		
}
OlympusTraitData.FamedDuetTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Apollo_Artemis_01",
		RequiredFalseTrait = "FamedDuetTrait",
		PropertyChanges =
		{
			{
				TraitName = "ApolloShoutTrait",
				WeaponName = "ApolloBeamWeapon",
				WeaponProperty = "NumProjectiles",
				ChangeValue = 12,
				ExcludeLinked = true,
			},			
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipWrathStocks",
				Format = "ExistingWrathStocks",
				SkipAutoExtract = true
			}
		}		
	}
OlympusTraitData.WarSongTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Apollo_Ares_01",
		RequiredFalseTraits = { "WarSongTrait" },
		PropertyChanges =
		{
			{
				TraitName = "ApolloRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "ApolloField",
				EffectName = "DelayedDamage",
				EffectProperty = "Active",
				ChangeValue = true
			}
		},	
		ExtractValues =
		{
			{
				ExtractAs = "TooltipCurseDamage",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				TraitName = "ApolloRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "ApolloField",
				EffectName = "DelayedDamage",
				EffectProperty = "Amount",
			}
		}
	}
-- LootData
local OlympusLootData = ModUtil.Entangled.ModData(LootData)
OlympusLootData.ApolloUpgrade = {
        Name = "ApolloUpgrade",
		InheritFrom = { "BaseLoot", "BaseSoundPackage"},
		CanReceiveGift = true,
		AlwaysShowDefaultUseText = true,
		Weight = 10,
		Icon = "BoonSymbolApollo",
		BoonInfoIcon = "BoonInfoSymbolApolloIcon",
		DoorIcon = "BoonSymbolApolloIsometric",
		Color = { 255, 162, 105, 255 },
		LightingColor = {255, 146, 79, 255},
		LootColor = {255, 114, 30, 255},
		SubtitleColor = {1.000, 0.353, 0.675, 1.0},
		EventEndSound = "/SFX/ApolloBoonLoveChimes",
		UpgradeSelectedSound = "/SFX/ApolloBoonChoice",
		LootRejectionAnimation = "BoonDissipateA_Apollo",

		RequiredMinCompletedRuns = 1,
		RequiredTextLines = { "ArtemisFirstPickUp" },

		TraitsList = { "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait" },

		PriorityUpgrades = { "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait", "ApolloRangedTrait"}, -- ShieldLoadAmmo_ApolloRangedTrait },
		WeaponUpgrades = { "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait", "ApolloRangedTrait", "ApolloShoutTrait" }, --   "ApolloShoutTrait", "ShieldLoadAmmo_ApolloRangedTrait" },
		Traits = {"ApolloRetaliateTrait", "FountainDefenseTrait", "FountainCoinTrait", "RerollObolTrait", "RerollBoonTrait"}, --"ApolloHealingTrait", "ApolloFountainTrait", "ApolloRerollTrait" },
		Consumables = { },

		LinkedUpgrades =
		{
			ApolloBlindedTrait  = {
				OneOf = { "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait", "ApolloRangedTrait", "ApolloRetaliateTrait"}, --"ShieldLoadAmmo_ApolloRangedTrait", "ApolloShoutTrait" },
			},
			ApolloHealTrait  = {
				OneOf = { "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait", "ApolloRangedTrait", "ApolloRetaliateTrait"}, --"ShieldLoadAmmo_ApolloRangedTrait", "ApolloShoutTrait" },
			},
			MissChanceTrait =
			{
				OneFromEachSet =
				{
					{ "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait", "ApolloRangedTrait" },-- "ShieldLoadAmmo_ApolloRangedTrait", "ApolloShoutTrait" },
					{ "ApolloBlindedTrait" } --"ApolloDurationTrait",  "ApolloChanceMissTrait", "ApolloChanceHitTrait" },
				}
			},
			FamedDuetTrait = 
			{
				OneFromEachSet =
				{
					{ "ApolloShoutTrait" },
					{ "ArtemisWeaponTrait", "ArtemisSecondaryTrait", "ArtemisRushTrait", "ArtemisRangedTrait" }
				}
			},
			WarSongTrait = 
			{
				OneFromEachSet =
				{
					{ "ApolloRangedTrait" },
					{ "AresWeaponTrait", "AresSecondaryTrait", "AresRetaliateTrait"}
				}
			},
			BlindDurationTrait = 
			{
				OneFromEachSet =
				{
					{ "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait" },-- "ShieldLoadAmmo_ApolloRangedTrait", "ApolloShoutTrait" },
					{ "DemeterWeaponTrait", "DemeterSecondaryTrait", "DemeterRushTrait" } --"ApolloDurationTrait",  "ApolloChanceMissTrait", "ApolloChanceHitTrait" },
				}
			},
			--[[ApolloDurationTrait =
			{
				OneOf = { "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait", "ApolloRangedTrait", "ShieldLoadAmmo_ApolloRangedTrait", "ApolloShoutTrait" },
			},
			ApolloChanceMissTrait =
			{
				OneOf = { "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait", "ApolloRangedTrait", "ShieldLoadAmmo_ApolloRangedTrait", "ApolloShoutTrait" },
			},
			ApolloChanceHitTrait =
			{
				OneOf = { "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait", "ShieldLoadAmmo_ApolloRangedTrait" },
			},]]--
		},

		Speaker = "NPC_Apollo_01",
		Portrait = "Portrait_Apollo_Default_01",
		WrathPortrait = "Portrait_Apollo_Wrath_01",
		OverlayAnim = "ApolloOverlay",
		Gender = "Male",
		SpawnSound = "/SFX/ApolloBoonLoveChimes",
		FlavorTextIds =
		{
			"ApolloUpgrade_FlavorText01",
			"ApolloUpgrade_FlavorText02",
			"ApolloUpgrade_FlavorText03",
		},

		OnSpawnVoiceLines =
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			PlayOnceThisRun = true,
			PreLineWait = 0.85,
			ChanceToPlay = 0.33,
			RequiredTextLines = { "ApolloFirstPickUp" },
			RequiredFalseEncounters = { "DevotionTestTartarus", "DevotionTestAsphodel", "DevotionTestElysium", "Shop" },

			-- 
			{ Cue = "/VO/ZagreusField_6000" },
			-- 
			{ Cue = "/VO/ZagreusField_6000" },
		},

		UpgradeMenuOpenVoiceLines =
		{
			[1] = GlobalVoiceLines.CheckOlympianReunionVoiceLines,
			[2] = GlobalVoiceLines.FoundRareBoonVoiceLines,
		},

		DuoPickupTextLineSets =
		{
			ApolloWithZeus01 =
			{
                Name = "ApolloWithZeus01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "RegeneratingCappedSuperTrait",
				{ Cue = "/VO/Apollo_0187",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "Apollo to Zeus" },
				{ Cue = "/VO/Zeus_0199",
					PortraitExitWait = 0.35,
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
					StartSound = "/SFX/ZeusBoonThunder",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Zeus_01", Portrait = "Portrait_Zeus_Default_01",
					Text = "Zeus to Apollo" },
			},
			ApolloWithPoseidon01 =
			{
                Name = "ApolloWithPoseidon01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "ImprovedPomTrait",
				{ Cue = "/VO/Apollo_0050",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "The thing to know about this family, dearest, is that, each of us, we have our little quirks. Although, we always stick together and our love for one another perseveres!" },
				{ Cue = "/VO/Poseidon_0131",
					PortraitExitWait = 0.35,
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
					StartSound = "/SFX/PoseidonBoonWaveCrash",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Poseidon_01", Portrait = "Portrait_Poseidon_Default_01",
					Text = "Oh, {#DialogueItalicFormat}hoh{#PreviousFormat}! What do we have here, little Hades? Seems to me that you have {#DialogueItalicFormat}company{#PreviousFormat}! Well, I'll just leave the two of you alone. My lips are sealed tighter than a warship hull!" },
				{ Cue = "/VO/Apollo_0051",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Emote = "PortraitEmoteCheerful",
					Text = "Oh, feel free to stay, Poseidon! I was just explaining what an idiot you are, though you're able to articulate this best! Anyway, dearest, what was I on about...?" },
			},
			ApolloWithAthena01 =
			{
                Name = "ApolloWithAthena01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "CastBackstabTrait",
				{ Cue = "/VO/Apollo_0182",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "You must forgive us, little godling, meaning our extended family here upon Olympus! Some of us are terribly stuck up, and must be making matters much more complicated than they have to be." },
				{ Cue = "/VO/Athena_0123",
					PortraitExitWait = 0.35,
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
					StartSound = "/SFX/AthenaBoonHolyShield",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Athena_01", Portrait = "Portrait_Athena_Default_01",
					Text = "I wonder, dearest Apollo, whether you'd be willing to repeat such things directly to my countenance?" },
				{ Cue = "/VO/Apollo_0183",
					Emote = "PortraitEmoteCheerful",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "Oh, you must know full well that I would do much more than that directly to your countenance, Athena dear! Quite frankly, you could use a lot of work!" },
			},
			ApolloWithAres01 =
			{
                Name = "ApolloWithAres01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "CurseSickTrait",
				{ Cue = "/VO/Apollo_0189",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "I think for many of us, dearest, it can come as a surprise to learn that love and war often go hand in hand. Opposite forces, yet this connects them, doesn't it. The fiercest passions of gods and mortals! Isn't that right, Lord Ares?" },
				{ Cue = "/VO/Ares_0226",
					PortraitExitWait = 0.35,
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
					StartSound = "/SFX/AresWrathBattle",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Ares_01", Portrait = "Portrait_Ares_Default_01",
					Text = "Mortals are so bent on clinging to their lives, that many among them would gladly kill for it. The surge of emotion which they feel... one passion is no different from another, Lord Apollo, dear." },
			},
			ApolloWithArtemis01 =
			{
                Name = "ApolloWithArtemis01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "HeartsickCritDamageTrait",
				RequiredTextLines = { "ApolloGift01", "ArtemisGift01" },
				{ Cue = "/VO/Apollo_0185",
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "Oh dearest! I have brought you keen-eyed Artemis, who, in her focus on the hunt, has not developed social graces suitable enough to come to you herself!" },
				{ Cue = "/VO/Artemis_0239",
					PortraitExitWait = 0.35,
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
					StartSound = "/SFX/ArtemisBoonArrow",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Emote = "PortraitEmoteDepressed",
					Speaker = "NPC_Artemis_01", Portrait = "Portrait_Artemis_Default_01",
					Text = "Social graces, she says! Going about like {#DialogueItalicFormat}that{#PreviousFormat}! I'm sure you know that I can find you when it's necessary, Zagreus. Though, how to get away from Apollo, I have no idea."
				},
			},
			ApolloWithDionysus01 =
			{
                Name = "ApolloWithDionysus01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "DionysusApolloStackIncreaseTrait",
				{ Cue = "/VO/Apollo_0211",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "My powers, dearest, oft go hand-in-hand with those of Dionysus, with his power to persuade the mind to find such beauty where it isn't, really!" },
				{ Cue = "/VO/Dionysus_0211",
					PortraitExitWait = 0.35,
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
					StartSound = "/SFX/DionysusBoonWineLaugh",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Dionysus_01", Portrait = "Portrait_Dionysus_Default_01",
					Emote = "PortraitEmoteCheerful",
					Text = "{#DialogueItalicFormat}Ah, haha{#PreviousFormat}, no need to flatter me like that, there, Lord Apollo! Beauty's almost entirely within the mind, I'm sure! And in the muscles and the jawline and the winning smile and, well, who am I to tell you, yeah?" },
			},
			ApolloWithDemeter01 =
			{
                Name = "ApolloWithDemeter01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "SelfLaserTrait",
				{ Cue = "/VO/Apollo_0191",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "The venerable goddess of the seasons, Demeter, chooses to look as stately as can be, can you believe it, dearest? Although, why one would mark so many fine lines upon their face, I wouldn't know." },
				{ Cue = "/VO/Demeter_0152",
					PortraitExitWait = 0.35,
					StartSound = "/SFX/DemeterBoonFrost",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Demeter_01", Portrait = "Portrait_Demeter_Default_01",
					Text = "Oh, Apollo, dear... you wouldn't know a thing of substance if it offered you a cloak. Your chosen countenance makes plain the full extent of your intentions, and your interests alike." },
			},
		},

		SuperPriorityPickupTextLineSets =
		{
			ApolloAboutOlympianReunionQuest01 =
			{
                Name = "ApolloAboutOlympianReunionQuest01",
				PlayOnce = true,
				RequiredTextLines = { "ApolloFirstPickUp", "PersephoneAboutOlympianReunionQuest01", },
				{ Cue = "/VO/ZagreusField_4339", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 2.33 },
					PostLineAnim = "ZagreusInteractEquip", PostLineAnimTarget = "Hero", PostLineFunctionName = "BoonInteractPresentation",
					Text = "OK, I think I'm ready. In the name of Hades! Olympus, this is an official message! And I hope it finds you well, Lord Apollo!" },
				{ Cue = "/VO/Apollo_0207",
					PortraitExitWait = 1.25,
					PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
					UseEventEndSound = true,
					Emote = "PortraitEmoteAffection",
					Text = "Why, {#DialogueItalicFormat}this {#PreviousFormat}is something, dearest! Such an enigmatic message you have sent. How positively captivating; I must know what it says. It bears the marks of others on Olympus, so... perhaps we ought to share some common knowledge on the subject, hm?" },
			},
			ApolloPostEpilogue01 =
			{
                Name = "ApolloPostEpilogue01",
				PlayOnce = true,
				RequiredTextLines = { "OlympianReunionQuestComplete" },
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Apollo_0208",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Emote = "PortraitEmoteAffection",
					Text = "Oh, dearest, you've no idea what a delightful time I had while visiting you recently! So many new sights and sounds and smells, why, it was wonderful! And you are burdened with a big responsibility, aren't you? Mind if I lend my graces to you still from time to time...?" },
			},
		},

		PriorityPickupTextLineSets =
		{
			-- about other gods
			ApolloAboutZeus01 =
			{
                Name = "ApolloAboutZeus01",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "ApolloFirstPickUp" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete", "ApolloWithZeus01" },
				RequiredGodLoot = "ZeusUpgrade",
				{ Cue = "/VO/Apollo_0044",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Lord Zeus has made acquaintances with you? Oh I sometimes forget that he's your uncle! His favor's well worth having, I assure you." },
			},
			ApolloAboutPoseidon01 =
			{
                Name = "ApolloAboutPoseidon01",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "ApolloFirstPickUp" },
				RequiredGodLoot = "PoseidonUpgrade",
				{ Cue = "/VO/Apollo_0045",
					Emote = "PortraitEmoteDepressed",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "That oaf Poseidon spoke to you already, didn't he? All bluster, muscles, and bravado, that one. I'm glad you're not the type." },
			},
			ApolloAboutAthena01 =
			{
                Name = "ApolloAboutAthena01",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "ApolloFirstPickUp" },
				RequiredGodLoot = "AthenaUpgrade",
				{ Cue = "/VO/Apollo_0042",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You've met Athena, dearest, so you know not all the ladies on Olympus are alike. And I, for one, am grateful to our forebears for {#DialogueItalicFormat}that{#PreviousFormat}!" },
			},
			ApolloAboutAres01 =
			{
                Name = "ApolloAboutAres01",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "ApolloGift01", "ApolloFirstPickUp" },
				RequiredGodLoot = "AresUpgrade",
				{ Cue = "/VO/Apollo_0046",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I sense the mark of my Lord Ares on you, love. He's poorly understood among the gods, yet surely you can see fair qualities in him, and me?" },
			},
			ApolloAboutArtemis01 =
			{
                Name = "ApolloAboutArtemis01",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "ApolloFirstPickUp" },
				RequiredGodLoot = "ArtemisUpgrade",
				{ Cue = "/VO/Apollo_0047",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The sullen Artemis reached out to you, did she? Oh, that's adorable, dearest! Just don't make any sudden movements with her, {#DialogueItalicFormat}hm{#PreviousFormat}?" },
			},
			ApolloAboutDionysus01 =
			{
                Name = "ApolloAboutDionysus01",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "ApolloFirstPickUp" },
				RequiredGodLoot = "DionysusUpgrade",
				{ Cue = "/VO/Apollo_0048",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You are so fortunate to have received the Boon of Dionysus prior to my own! He, the most noble and important of us all, the god of wine, himself!" },
			},
			ApolloAboutDemeter01 =
			{
                Name = "ApolloAboutDemeter01",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "ApolloFirstPickUp" },
				RequiredFalseTextLines = { "DemeterLiftsWinterCurse01" },
				RequiredGodLoot = "DemeterUpgrade",
				{ Cue = "/VO/Apollo_0181",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Why, did sorrowful old Demeter get all the way to you before I did? She stubbornly refuses me when I offer to help! Unlike you, little godling!" },
			},

			ApolloPostGiftPickup01 =
			{
                Name = "ApolloPostGiftPickup01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloGift01", },
				{ Cue = "/VO/Apollo_0040",
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "How I {#DialogueItalicFormat}love {#PreviousFormat}to have these unexpected little run-ins with you, love! You are just so spontaneous, and I've a liking for that sort of thing!" },
			},
			ApolloPostGiftPickup02 =
			{
                Name = "ApolloPostGiftPickup02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloGift02", },
				{ Cue = "/VO/Apollo_0041",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Keep following that heart of yours, dearest! It's good enough a guide, believe you me. Mine tells me you are going to succeed!" },
			},

			ApolloPostGiftPickup04 =
			{
                Name = "ApolloPostGiftPickup04",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloGift04", },
				{ Cue = "/VO/Apollo_0058",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You {#DialogueItalicFormat}do {#PreviousFormat}know that I'm married, don't you, love...? I'd forgive you if you didn't, for my husband, he's always... busy with his work. I'm grateful that you're there for me to talk to." },
			},
			ApolloAboutKeepsake01 =
			{
                Name = "ApolloAboutKeepsake01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTrait = "ForceApolloBoonTrait",

				{ Cue = "/VO/Apollo_0197",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Emote = "PortraitEmoteAffection",
					Text = "Why, you have my Eternal Rose, don't you? I am so very touched that you'd think first of me among my mighty kin. It pleases me to know I'm in your thoughts!" },
			},
			ApolloRunCleared01 =
			{
                Name = "ApolloRunCleared01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp", "ApolloAboutPersephoneMeeting01" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				RequiresLastRunCleared = true,
				{ Cue = "/VO/Apollo_0180",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Oh what is going {#DialogueItalicFormat}on {#PreviousFormat}down there, dearest? I thought for certain you would make it out, but seems that nasty place has kept you grounded, hasn't it. But don't despair, and you take heart, won't you?" },
			},
			ApolloHighAffinity01 =
			{
                Name = "ApolloHighAffinity01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloGift07" },
				RequiredFalseTextLinesLastRun = { "ApolloGift07" },
				{ Cue = "/VO/Apollo_0206",
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "My dearest little godling, how fares everything with you of late? I love to have these little interactions with you, simple as they are, for they have brightened many of my evenings here." },
			},
			ApolloBackstory01 =
			{
                Name = "ApolloBackstory01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				RequiredAnyTextLines = { "Flashback_Mother_01", "CerberusStyxMeeting01" },
				{ Cue = "/VO/Apollo_0053",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I cannot help but wonder, dearest, why Lord Hades would have kept your mere existence hidden from us all this time. Perhaps he knew that, once you met us, you would stop at nothing to come seek us out!" },
			},
			ApolloLowHealth01 =
			{
                Name = "ApolloLowHealth01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				RequiredMaxHealthFraction = 0.20,
				RequiredMaxLastStands = 1,

				{ Cue = "/VO/Apollo_0078",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Emote = "PortraitEmoteSurprise",					
					Text = "Oh, look at you, you poor, poor thing, you're hurt! Though, let me see if I can make it better." },
			},
			ApolloLegendaryPickUp01 =
			{
                Name = "ApolloLegendaryPickUp01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp", "ApolloGift01" },
				ValuableUpgradeInRoom = {
					AllAtLeastRarity = "Rare",
					HasAtLeastRarity = "Epic",
				},
				{ Cue = "/VO/Apollo_0032",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I have been waiting for a special moment to confess my great appreciation for your deeds... this moment's special enough, isn't it?" },
			},
		},

		PickupTextLineSets =
		{
			ApolloFirstPickUp =
			{
                Name = "ApolloFirstPickUp",
				PlayOnce = true,
				RequiredTextLines = { "AthenaFirstPickUp", },
				{ Cue = "/VO/ZagreusField_0268", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 4.23 },
					PostLineAnim = "ZagreusInteractEquip", PostLineAnimTarget = "Hero", PostLineFunctionName = "BoonInteractPresentation",
					Text = "Artemis? No, wait. Something is different. In the name of Hades! Olympus, I accept this message." },
				{ Cue = "/VO/Apollo_0001",
					PortraitExitWait = 1.25,
					PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
					UseEventEndSound = true,
					Text = "Hi there, young fella. Everyone is talking about you around here. I just had to see it for myself. Here take this." },
			},
			ApolloMiscPickup01 =
			{
                Name = "ApolloMiscPickup01",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0011",
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Did you miss me, little godling, {#DialogueItalicFormat}hm{#PreviousFormat}? I thought I'd steal away a bit and that together we might make up for lost time." },
			},
			ApolloMiscPickup02 =
			{
                Name = "ApolloMiscPickup02",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0012",
					Emote = "PortraitEmoteCheerful",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hello again, there, little godling, let's get to it, {#DialogueItalicFormat}hm{#PreviousFormat}? I want what you want; there's no further need for words." },
			},
			ApolloMiscPickup03 =
			{
                Name = "ApolloMiscPickup03",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				RequiredFalseRooms = { "RoomOpening" },
				RequiredMaxHealthFraction = 0.75,
				{ Cue = "/VO/Apollo_0013",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Emote = "PortraitEmoteDepressed",					
					Text = "Oh, boo, looks like you've rather got yourself into a bind, there, haven't you. Though, not to worry, dearest. I can pull some strings." },
			},
			ApolloMiscPickup04 =
			{
                Name = "ApolloMiscPickup04",
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				{ Cue = "/VO/Apollo_0014",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hey Zagzag, are you still down there? Do you mind when I call you Zagzag? Because if you do, you better come and tell me face to face." },
			},
			ApolloMiscPickup05 =
			{
                Name = "ApolloMiscPickup05",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0015",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Are you still down there, Zagzag? I'll give you my help once more. Don't waste it." },
			},
			ApolloMiscPickup06 =
			{
                Name = "ApolloMiscPickup06",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0016",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "What did I miss since last time, anything of interest, {#DialogueItalicFormat}hm{#PreviousFormat}? You'll have to fill me in once you break free, dearest." },
			},
			ApolloMiscPickup07 =
			{
                Name = "ApolloMiscPickup07",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0017",
					Emote = "PortraitEmoteCheerful",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Well, look at you, there, love! So well-prepared to take on any danger that may come! But, I must wonder, are you well-prepared for {#DialogueItalicFormat}this{#PreviousFormat}?" },
			},
			ApolloMiscPickup08 =
			{
                Name = "ApolloMiscPickup08",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0018",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Ready yourself, dearest, because you and I? We're going to have ourselves a little outing I expect that neither one of us shall soon forget." },
			},
			ApolloMiscPickup09 =
			{
                Name = "ApolloMiscPickup09",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0019",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Would you by any chance have room, there, in your heart for a most-gentle blessing from a goddess such as me?" },
			},
			ApolloMiscPickup10 =
			{
                Name = "ApolloMiscPickup10",
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				{ Cue = "/VO/Apollo_0020",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Don't lose heart, now, little godling! I won't have you giving up before you get to see me in the flesh among the gardens of Olympus here...!" },
			},
			ApolloMiscPickup11 =
			{
                Name = "ApolloMiscPickup11",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0021",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Dearest, I've known many gods and godlings through the ages. And, I have to say, you're {#DialogueItalicFormat}quite {#PreviousFormat}intriguing, even for our kind." },
			},
			ApolloMiscPickup12 =
			{
                Name = "ApolloMiscPickup12",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0022",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Oh, dearest, I suspect we'll have ourselves a most exciting time together, you and I! Just do your best and it'll all be fine!" },
			},
			ApolloMiscPickup13 =
			{
                Name = "ApolloMiscPickup13",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0023",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I am always here, or close enough, to help you through whatever troubles you may face, my little godling. So do not hesitate to call upon me, {#DialogueItalicFormat}hm{#PreviousFormat}?" },
			},
			ApolloMiscPickup14 =
			{
                Name = "ApolloMiscPickup14",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				MinRunsSinceAnyTextLines = { TextLines = { "ApolloPostEpilogue01" }, Count = 3 },				
				{ Cue = "/VO/Apollo_0024",
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I'd ask you show me a good time, there, love, although I almost can't imagine a good time where you reside! So dreary, constantly!" },
			},
			ApolloMiscPickup15 =
			{
                Name = "ApolloMiscPickup15",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp", "ApolloGift01" },
				{ Cue = "/VO/Apollo_0025",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I missed you terribly, my little godling! All that I ask is that you do not die on me again, why, I don't think that I can take it anymore!" },
			},
			ApolloMiscPickup16 =
			{
                Name = "ApolloMiscPickup16",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0026",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "How you must yearn to reach the surface, little godling! It likewise stirs in me a yearning to assist you, by all means at my disposal!" },
			},
			ApolloMiscPickup17 =
			{
                Name = "ApolloMiscPickup17",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0027",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "No need to worry any longer, dearest! I bring you strength and comfort, and I shall be watching every step of yours most carefully." },
			},
			ApolloMiscPickup18 =
			{
                Name = "ApolloMiscPickup18",
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				{ Cue = "/VO/Apollo_0028",
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Ah, how I long to see you face-to-face! Until such time, however, this old means of keeping touch shall have to do. So you take care, now, {#DialogueItalicFormat}hm{#PreviousFormat}?" },
			},
			ApolloMiscPickup19 =
			{
                Name = "ApolloMiscPickup19",
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				{ Cue = "/VO/Apollo_0029",
					Emote = "PortraitEmoteCheerful",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You know I would do anything to have you here among us, don't you, love? Oh, I just hope my blessings are enough...!" },
			},
			ApolloMiscPickup20 =
			{
                Name = "ApolloMiscPickup20",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0030",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Love tends to blossom in the strangest places at the strangest times, you know that, don't you, dearest? All one can do is entertain the chance." },
			},
			ApolloMiscPickup21 =
			{
                Name = "ApolloMiscPickup21",
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				{ Cue = "/VO/Apollo_0031",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Don't work yourself too hard down there, you promise, little godling? We need you in good shape and spirits on Olympus here." },
			},

			-- shorter acknowledgments
			ApolloMiscPickup22 =
			{
                Name = "ApolloMiscPickup22",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0002",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "What do you say we skip the chat and get right to it, {#DialogueItalicFormat}hm{#PreviousFormat}?" },
			},
			ApolloMiscPickup23 =
			{
                Name = "ApolloMiscPickup23",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0003",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Oh, would you look at whom I found, all by his lonely self." },
			},
			ApolloMiscPickup24 =
			{
                Name = "ApolloMiscPickup24",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0004",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Let's see what mischief we can make, between the two of us!" },
			},
			ApolloMiscPickup25 =
			{
                Name = "ApolloMiscPickup25",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0005",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You want my blessings, dearest, here they are!" },
			},
			ApolloMiscPickup26 =
			{
                Name = "ApolloMiscPickup26",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0006",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I hope I didn't keep you waiting very long, did I?" },
			},
			ApolloMiscPickup27 =
			{
                Name = "ApolloMiscPickup27",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0007",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Even immortal hearts can break, my little godling." },
			},
			ApolloMiscPickup28 =
			{
                Name = "ApolloMiscPickup28",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0008",
					Emote = "PortraitEmoteCheerful",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "What do you say we go and make new friends together, {#DialogueItalicFormat}hm{#PreviousFormat}?" },
			},
			ApolloMiscPickup29 =
			{
                Name = "ApolloMiscPickup29",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0009",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You seem like you could use a helping hand, there, love." },
			},

			ApolloMiscPickup30 =
			{
                Name = "ApolloMiscPickup30",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0142",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The bond of love is strong enough to suffer any hardship, dearest." },
			},
			ApolloMiscPickup31 =
			{
                Name = "ApolloMiscPickup31",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0143",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Times of adversity make love grow even stronger, little godling." },
			},
			ApolloMiscPickup32 =
			{
                Name = "ApolloMiscPickup32",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0144",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I hate to see you struggling, dearest! Please do be careful, {#DialogueItalicFormat}hm{#PreviousFormat}?" },
			},
			ApolloMiscPickup33 =
			{
                Name = "ApolloMiscPickup33",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0145",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Love conquers everything, you see that, don't you, dearest?" },
			},
			ApolloMiscPickup34 =
			{
                Name = "ApolloMiscPickup34",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0146",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Think of all those you love, and may they spur your courage, little godling." },
			},
			ApolloMiscPickup35 =
			{
                Name = "ApolloMiscPickup35",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0147",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Your passion to achieve your goal is quite inspiring, I have to say!" },
			},
			ApolloMiscPickup36 =
			{
                Name = "ApolloMiscPickup36",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0148",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "It's such a pity I can barely see you in that awful darkness, little godling." },
			},
			ApolloMiscPickup37 =
			{
                Name = "ApolloMiscPickup37",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0149",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Love spurs the heart to greater acts of valor, doesn't it, dearest?" },
			},
			ApolloMiscPickup38 =
			{
                Name = "ApolloMiscPickup38",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0150",
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Take heart, now, little godling. And how about you take this from me, as well." },
			},
			ApolloMiscPickup39 =
			{
                Name = "ApolloMiscPickup39",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0151",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I'd love to help you however best I'm able, my little godling." },
			},

			ApolloMiscPickupRare01 =
			{
                Name = "ApolloMiscPickupRare01",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				ValuableUpgradeInRoom = {
					AllAtLeastRarity = "Rare",
					HasAtLeastRarity = "Epic",
				},
				{ Cue = "/VO/Apollo_0152",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I have the loveliest selection of my blessings for you this time, dearest!" },
			},
			ApolloMiscPickupRare02 =
			{
                Name = "ApolloMiscPickupRare02",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				ValuableUpgradeInRoom = {
					AllAtLeastRarity = "Rare",
					HasAtLeastRarity = "Epic",
				},
				{ Cue = "/VO/Apollo_0153",
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I think I'll give you something very special this time, little godling." },
			},
			ApolloMiscPickupRare03 =
			{
                Name = "ApolloMiscPickupRare03",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				ValuableUpgradeInRoom = {
					AllAtLeastRarity = "Rare",
					HasAtLeastRarity = "Epic",
				},
				{ Cue = "/VO/Apollo_0154",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Is not the purest act of love to aid somebody in their time of need?" },
			},
			ApolloMiscPickupRare04 =
			{
                Name = "ApolloMiscPickupRare04",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				ValuableUpgradeInRoom = {
					AllAtLeastRarity = "Rare",
					HasAtLeastRarity = "Epic",
				},
				{ Cue = "/VO/Apollo_0155",
					Emote = "PortraitEmoteCheerful",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I'm feeling wonderful of late, dearest, so here, enjoy the benefits!" },
			},

		},

		BoughtTextLines =
		{
			ApolloLootBought01 =
			{
                Name = "ApolloLootBought01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },

				{ Cue = "/VO/Apollo_0061",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Emote = "PortraitEmoteCheerful",
					Text = "Looks like we meet again, dearest, here among the foul detritus of the boatman's wares! You truly take me to the best of places!" },
			},
			ApolloLootBought02 =
			{
                Name = "ApolloLootBought02",
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },

				{ Cue = "/VO/Apollo_0062",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "At first I didn't know how to get through to that odd river-boatman, Charon. Turns out he lusts for coin, and now I understand him well!" },
			},
			ApolloLootBought03 =
			{
                Name = "ApolloLootBought03",
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },

				{ Cue = "/VO/Apollo_0156",
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You spent your hard-earned wealth on my account, dearest? Why if that isn't just the sweetest thing!" },
			},
			ApolloLootBought04 =
			{
                Name = "ApolloLootBought04",
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },

				{ Cue = "/VO/Apollo_0157",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "One cannot put a price on love, but on my blessings, from the boatman, for my dearest? I'd say we're settled up." },
			},
		},

		RejectionTextLines =
		{
			ApolloRejection01 =
			{
                Name = "ApolloRejection01",
				{ Cue = "/VO/Apollo_0063",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "And here I was beginning to think that we had something special going, no...? Look here, little godling, let me save you lots of future suffering: I happen to be the jealous type." },
			},
			ApolloRejection02 =
			{
                Name = "ApolloRejection02",
				{ Cue = "/VO/Apollo_0064",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You'd best not take for granted my affection, godling. Yes, I've lots of it to go around; but I can just as easily rescind such privileges." },
			},
			ApolloRejection03 =
			{
                Name = "ApolloRejection03",
				{ Cue = "/VO/Apollo_0065",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "They say a lot of things about me, dearest; and they'll tell you, in your dealings with me, ample caution is in order. Let me show you why." },
			},
			ApolloRejection04 =
			{
                Name = "ApolloRejection04",
				{ Cue = "/VO/Apollo_0066",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Don't {#DialogueItalicFormat}ever {#PreviousFormat}take me for some thoughtless nymph to be manipulated, dearest. I expect reciprocal devotion from you. Do you understand?" },
			},
			ApolloRejection05 =
			{
                Name = "ApolloRejection05",
				{ Cue = "/VO/Apollo_0067",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Emote = "PortraitEmoteCheerful",
					Text = "Oh, {#DialogueItalicFormat}really{#PreviousFormat}? You shall find I don't take such rejections lying down. And you shall find it out the hard way." },
			},
			ApolloRejection06 =
			{
                Name = "ApolloRejection06",
				{ Cue = "/VO/Apollo_0068",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Emote = "PortraitEmoteCheerful",
					Text = "If it's your wish to test the limits of the fine relationship we've built, why then... I can confirm you're testing them, all right!" },
			},
			ApolloRejection07 =
			{
                Name = "ApolloRejection07",
				{ Cue = "/VO/Apollo_0133",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Emote = "PortraitEmoteCheerful",
					Text = "Now, dearest... surely there's no way that could have been one of the wiser choices that you've lately made?" },
			},
			ApolloRejection08 =
			{
                Name = "ApolloRejection08",
				{ Cue = "/VO/Apollo_0134",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Emote = "PortraitEmoteCheerful",
					Text = "Dearest, just in case it hasn't been made clear as crystal lately, let me tell you: When presented with the opportunity, don't {#DialogueItalicFormat}ever {#PreviousFormat}reject me." },
			},
			ApolloRejection09 =
			{
                Name = "ApolloRejection09",
				{ Cue = "/VO/Apollo_0135",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You'd spurn my love this easily, dearest? You are about to find the consequences are much harder to dismiss without a second thought." },
			},
			ApolloRejection10 =
			{
                Name = "ApolloRejection10",
				{ Cue = "/VO/Apollo_0136",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Emote = "PortraitEmoteCheerful",
					Text = "I must admit I'm unaccustomed to rejection, love. But {#DialogueItalicFormat}you {#PreviousFormat}must be accustomed to swift death! Here comes one for you now." },
			},
			ApolloRejection11 =
			{
                Name = "ApolloRejection11",
				{ Cue = "/VO/Apollo_0213",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Emote = "PortraitEmoteDepressed",
					Text = "Oh, but this is such a heartbreak, dearest! Why would you do that? You know that I won't take this lying down." },
			},
			ApolloRejection12 =
			{
                Name = "ApolloRejection12",
				{ Cue = "/VO/Apollo_0214",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Emote = "PortraitEmoteAnger",
					Text = "You {#DialogueItalicFormat}dare {#PreviousFormat}to play with {#DialogueItalicFormat}my {#PreviousFormat}heart, little godling? I'll just take yours, and shatter it to pieces, then, I think!" },
			},
			ApolloRejection13 =
			{
                Name = "ApolloRejection13",
				{ Cue = "/VO/Apollo_0215",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Sometimes I think that you're quite {#DialogueItalicFormat}different {#PreviousFormat}than most all the others here, darling. And then, you go and do something like {#DialogueItalicFormat}this{#PreviousFormat}." },
			},
			ApolloRejection14 =
			{
                Name = "ApolloRejection14",
				{ Cue = "/VO/Apollo_0216",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Emote = "PortraitEmoteAnger",
					Text = "You think you can brush me aside like that? Well, I think I can crush you into tiny, little bits! Let's see who's right, shall we?" },
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

				-- 
				{ Cue = "/VO/ZagreusField_6000" },
				-- 
				{ Cue = "/VO/ZagreusField_6000" },
				-- 
				{ Cue = "/VO/ZagreusField_6000" },
				-- 
				{ Cue = "/VO/ZagreusField_6000" },
			},
			[2] = GlobalVoiceLines.GodRejectedVoiceLines,
		},

		MakeUpTextLines =
		{
			ApolloMakeUp01 =
			{
                Name = "ApolloMakeUp01",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Apollo_0069",
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Let's say we kissed and made up, dearest. Just, do not anger me again, or I might come down and kill you there myself!" },
			},
			ApolloMakeUp02 =
			{
                Name = "ApolloMakeUp02",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Apollo_0070",
					Emote = "PortraitEmoteCheerful",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Alas that passion sometimes drives me into vengeance, dearest! Yet, who among us isn't without vices, {#DialogueItalicFormat}hm{#PreviousFormat}?" },
			},
			ApolloMakeUp03 =
			{
                Name = "ApolloMakeUp03",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Apollo_0071",
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Oh, how I hate to fight with you like this! Let's forgive each other and forget, go back to how things used to be?" },
			},
			ApolloMakeUp04 =
			{
                Name = "ApolloMakeUp04",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Apollo_0072",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I'm not angry with you any longer, dearest! Though, might I suggest you take some extra steps to keep it that way, hm?" },
			},
			ApolloMakeUp05 =
			{
                Name = "ApolloMakeUp05",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Apollo_0073",
					PreLineThreadedFunctionName = "PlayEmoteAnimFromSource", PreLineThreadedFunctionArgs = { Emote = "PortraitEmoteAffection", WaitTime = 7.6 },
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "A loving heart is a forgiving heart, don't you agree? So I shall let this little matter slide, and you've my loving heart to thank for it, {#DialogueItalicFormat}hm-hm{#PreviousFormat}!" },
			},
			ApolloMakeUp06 =
			{
                Name = "ApolloMakeUp06",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Apollo_0074",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The truth is I'm a lover, not a fighter, dearest. So how about we call this matter put to bed, and get on with our lives?" },
			},
			ApolloMakeUp07 =
			{
                Name = "ApolloMakeUp07",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Apollo_0137",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I'd say this little squabble can be put to bed, for now. I'm better for the moment, but I was very angry with you, love!" },
			},
			ApolloMakeUp08 =
			{
                Name = "ApolloMakeUp08",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Apollo_0138",
					Emote = "PortraitEmoteCheerful",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I cannot bring myself to stay upset with you forever, little godling, so let's move along from that small misunderstanding there." },
			},
			ApolloMakeUp09 =
			{
                Name = "ApolloMakeUp09",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Apollo_0139",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "There is no common sense with love, godling, so... why don't we pretend your indiscretion there did not occur." },
			},
			ApolloMakeUp10 =
			{
                Name = "ApolloMakeUp10",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Apollo_0140",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "It is through times of difficulty that the love we share is tested and reforged. But you just watch yourself when testing it like that." },
			},
			ApolloMakeUp11 =
			{
                Name = "ApolloMakeUp11",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Apollo_0141",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Love and jealousy go hand in hand, don't they, dearest? Although the former's much more pleasant, isn't it." },
			},
			ApolloMakeUp12 =
			{
                Name = "ApolloMakeUp12",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Apollo_0217",
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Oh, all this fighting! It's just not like us at {#DialogueItalicFormat}all{#PreviousFormat}, dearest! Let's say we kissed and then made up, all right?" },
			},
		},

		GiftTextLineSets =
		{
			-- gives gift in exchange
			ApolloGift01 =
			{
                Name = "ApolloGift01",
				PlayOnce = true,
				{ Cue = "/VO/ZagreusHome_0125", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "Lord Apollo, I am truly blessed simply to have made your acquaintance, so, this is for you." },
				{ Cue = "/VO/Apollo_0037",
					PortraitExitWait = 1.0,
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Lasting relationships are built on reciprocity. So if you lavish me with gifts, why, what am I to do but give you something in return?" },
			},
			ApolloGift02 =
			{
                Name = "ApolloGift02",
				PlayOnce = true,
				RequiredTextLines = { "ApolloGift01" },
				{ Cue = "/VO/ZagreusHome_0536", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "My Lord Apollo, if not for our acquaintance, I am certain that my days or nights would be much drearier indeed." },
				{ Cue = "/VO/Apollo_0034",
					PortraitExitWait = 1.0,
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Why, dearest, such a wonderfully thoughtful gift, for me? I love it, and I would be lying if I said you shouldn't have!" },
			},
			ApolloGift03 =
			{
                Name = "ApolloGift03",
				PlayOnce = true,
				RequiredTextLines = { "ApolloGift02" },
				{ Cue = "/VO/ZagreusHome_0537", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "Lord Apollo, I'm afraid there really isn't much here worthy of you, but perhaps this can suffice." },
				{ Cue = "/VO/Apollo_0035",
					PortraitExitWait = 1.0,
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "My, but if this isn't such a treasure to behold, and I accept it as a sign of your affection! Of something even more, perhaps...?" },
			},
			ApolloGift04 =
			{
                Name = "ApolloGift04",
				PlayOnce = true,
				RequiredTextLines = { "ApolloGift03" },
				{ Cue = "/VO/ZagreusHome_0538", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "Dear Apollo, surely you have all the offerings you can stand, but I would ask that you accept one more." },
				{ Cue = "/VO/Apollo_0036",
					PortraitExitWait = 1.0,
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Ah, dearest, but it stirs my heart to know you care so deeply for our wonderful relationship! To celebrate it with such princely gifts!" },
			},
			ApolloGift05 =
			{
                Name = "ApolloGift05",
				PlayOnce = true,
				RequiredTextLines = { "ApolloGift04" },
				{ Cue = "/VO/ZagreusField_3469", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "Dear Apollo, the incomparable beauty of Olympus is less difficult to fathom, having already met you. I am so grateful to have earned your favor." },
				{ Cue = "/VO/Apollo_0203",
					PortraitExitWait = 1.0,
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "My, but don't {#DialogueItalicFormat}you {#PreviousFormat}come on rather strong, there, little godling! Though, I can take much more of your affections, you shall see!" },
			},
			ApolloGift06 =
			{
                Name = "ApolloGift06",
				PlayOnce = true,
				RequiredTextLines = { "ApolloGift05" },
				{ Cue = "/VO/ZagreusField_3470", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "Apollo, you must have more worshipers and suitors than all your kin upon Olympus combined. I may not fall exactly into either category, though I hope you know my gratitude for all you've done for me is true." },
				{ Cue = "/VO/Apollo_0204",
					PortraitExitWait = 1.0,
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You know, dearest, I am more worshiped than perhaps anybody else upon Olympus! You'd think getting such praise would roll right off my back by now, but no! I love receiving it. Especially from you." },
			},
			ApolloGift07 =
			{
                Name = "ApolloGift07",
				PlayOnce = true,
				RequiredTextLines = { "ApolloGift06" },
				{ Cue = "/VO/ZagreusField_3471", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "My lord Apollo, once more you've graced me with your presence and your favor, which inspire the best from me. Let this modest gift of Ambrosia signify I'm forever in your debt." },
				{ Cue = "/VO/Apollo_0205",
					PortraitExitWait = 1.0,
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					PostLineThreadedFunctionName = "MaxedRelationshipPresentation",
					PostLineFunctionArgs = { Text = "NPC_Apollo_01", Icon = "Keepsake_ApolloSticker_Max" },
					Text = "My little godling. I'd say you've honored me more times than I could count, but that would be a lie, now, wouldn't it. I so admire your devotion and your perseverance! If ever you do reach us on Olympus, I should very much enjoy getting to know you even better, then." },
			},
		},

		GiftGivenVoiceLines =
		{
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			PlayFromTarget = true,

			-- Hey.
			{ Cue = "/VO/ZagreusField_2457" },
		},

		ShoutActivationSound = "/SFX/ApolloWrathLoveChimes",
		ShoutVoiceLines =
		{
			Queue = "Interrupt",
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				RequiredKillEnemiesFound = true,
				RequiredFalseSpurnedGodName = "ApolloUpgrade",

				-- You're going to love this!
				{ Cue = "/VO/Apollo_0075" },
				-- Who dares threaten my little godling?
				{ Cue = "/VO/Apollo_0076" },
				-- Just leave it to me, dearest!
				{ Cue = "/VO/Apollo_0077" },
				-- Would be my pleasure!
				{ Cue = "/VO/Apollo_0087" },
				-- I like the sound of that.
				{ Cue = "/VO/Apollo_0088" },
				-- When shall they ever learn?
				{ Cue = "/VO/Apollo_0104" },
				-- I'll pierce them through the heart!
				{ Cue = "/VO/Apollo_0166", RequiredMinKillEnemies = 2 },
				-- Let's complicate things, hm?
				{ Cue = "/VO/Apollo_0167" },
				-- Oh it shall be my pleasure!
				{ Cue = "/VO/Apollo_0168" },
				-- Pure passion, coming up!
				{ Cue = "/VO/Apollo_0169" },
			},
			{
				BreakIfPlayed = true,
				PlayFromTarget = true,
				RandomRemaining = true,
				RequiredKillEnemiesFound = true,
				RequiredSpurnedGodName = "ApolloUpgrade",
				RequireCurrentEncounterNotComplete = true,

				-- Of all the nerve, dearest!!
				{ Cue = "/VO/Apollo_0170" },
				-- You call upon me now?
				{ Cue = "/VO/Apollo_0171" },
				-- I'll break your heart next!
				{ Cue = "/VO/Apollo_0172" },
				-- Best not to anger me.
				{ Cue = "/VO/Apollo_0108" },
				-- You are impossible!
				{ Cue = "/VO/Apollo_0110" },
				-- What has gotten into you?
				{ Cue = "/VO/Apollo_0111" },
				-- You truly dare?
				{ Cue = "/VO/Apollo_0112" },
				-- Such utter foolishness.
				{ Cue = "/VO/Apollo_0113" },
				-- You don't want to make me angrier.
				{ Cue = "/VO/Apollo_0114" },
			},
		},

		SwapUpgradePickedVoiceLines =
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			PreLineWait = 1.05,
			SuccessiveChanceToPlay = 0.33,
			CooldownName = "SaidApolloRecently",
			CooldownTime = 40,
			RequiresLastUpgradeSwapped = true,
			UsePlayerSource = true,

			-- Lady Aphrodite, how can I say no?
			{ Cue = "/VO/ZagreusField_6000" },
			-- A lovely offer, Apollo.
			{ Cue = "/VO/ZagreusField_6000" },
			-- Lady Aphrodite, I gladly accept.
			{ Cue = "/VO/ZagreusField_6000" },
		},

		DeathTauntVoiceLines =
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.25,
			NoTarget = true,

			-- You break my heart, I break your body, little godling.
			{ Cue = "/VO/Apollo_0194" },
			-- You ought to worship me, rather than anger me.
			{ Cue = "/VO/Apollo_0195" },
			-- Don't you refuse my good graces like that again.
			{ Cue = "/VO/Apollo_0196" },
		},

		BlindBoxOpenedVoiceLines =
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.3,
			Source = { SubtitleColor = Color.ApolloVoice },
			TriggerCooldowns = { "ZagreusBoonTakenSpeech" },

			-- Lovely to see you, hm?
			{ Cue = "/VO/Apollo_0081" },
			-- Well look at you, hm-hm.
			{ Cue = "/VO/Apollo_0083" },
			-- Oh good, we meet again!
			{ Cue = "/VO/Apollo_0084" },
			-- You're such a sweetheart.
			{ Cue = "/VO/Apollo_0129" },
			-- How lovely.
			{ Cue = "/VO/Apollo_0130" },
		},
}
-- Duo LootData
OlympusLootData.ArtemisUpgrade.LinkedUpgrades.FamedDuetTrait = 
{
	OneFromEachSet =
	{
		{ "ApolloShoutTrait" },
		{ "ArtemisWeaponTrait", "ArtemisSecondaryTrait", "ArtemisRushTrait", "ArtemisRangedTrait" }
	}
}
OlympusLootData.AresUpgrade.LinkedUpgrades.WarSongTrait = 
{
	OneFromEachSet =
	{
		{ "ApolloRangedTrait" },
		{ "AresWeaponTrait", "AresSecondaryTrait", "AresRetaliateTrait"}
	}
}
OlympusLootData.DemeterUpgrade.LinkedUpgrades.BlindDurationTrait = 
{
	OneFromEachSet =
	{
		{ "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait" },
		{ "DemeterWeaponTrait", "DemeterSecondaryTrait", "DemeterRushTrait" }
	}
}

-- Gift Section    
local OlympusGiftOrdering = ModUtil.Entangled.ModData(GiftOrdering)
local OlympusGiftData = ModUtil.Entangled.ModData(GiftData)
ModUtil.MapSetTable(OlympusGiftOrdering, { "ForceApolloBoonTrait" })

OlympusGiftData.ApolloUpgrade =
{
	InheritFrom = {"DefaultGiftData"},
	MaxedIcon = "Keepsake_Apollo_Max",
	MaxedSticker = "Keepsake_ApolloSticker_Max",
	MaxedRequirement = { RequiredTextLines = { "ApolloGift07" }, },
	Value = 0,
	Maximum = 7,
	Locked = 7,
	[1] = { Gift = "ForceApolloBoonTrait" },
	[7] = { RequiredResource = "SuperGiftPoints" },
	UnlockGameStateRequirements = { RequiredTextLines = { "ApolloAboutArtemis01" } }
}
-- FUNCTIONS

-- Shout Functions
function ApolloShout()
	SetWeaponProperty({ WeaponName = "ApolloBeamAim", DestinationId = CurrentRun.Hero.ObjectId, Property = "Enabled", Value = true })
	FireWeaponFromUnit({ Weapon = "ApolloBeamWeapon", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId, AutoEquip = true, ClearAllFireRequests = true })
	FireWeaponFromUnit({ Weapon = "LaserEnabledWeapon", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId, AutoEquip = true, ClearAllFireRequests = true })
	SetUnitInvulnerable( CurrentRun.Hero , "Invulnerable" )
end
function EndApolloBeam()
	SetWeaponProperty({ WeaponName = "ApolloBeamAim", DestinationId = CurrentRun.Hero.ObjectId, Property = "Enabled", Value = false })
	SetUnitVulnerable( CurrentRun.Hero , "Invulnerable" )
	ClearEffect({ Id = CurrentRun.Hero.ObjectId, Name = "ZagreusStun" })
	ExpireProjectiles({ Names = { "ApolloCastBeam", "LaserEnabled" } })
end
-- Blind Functions
-- Bug: still need to remove Effects on Hit like ZagreusOnHitStun...
ModUtil.WrapBaseFunction( "CheckOnHitPowers", 

	function(baseFunc, victim, attacker, args)
		local missRate = 0.5
		if not HeroHasTrait("MissChanceTrait") then
			missRate = 0.75
		end
		if attacker and HasEffect({Id = attacker.ObjectId, EffectName = "ApolloBlind" }) and victim == CurrentRun.Hero and RandomFloat(0,1) <= missRate then
			thread( InCombatText, CurrentRun.Hero.ObjectId, "Combat_Miss", 0.4, {SkipShadow = true} )
			PlaySound({ Name = "/SFX/Player Sounds/HermesWhooshDodgeSFX", Id = CurrentRun.Hero.ObjectId })
			PlaySound({ Name = "/VO/ZagreusEmotes/EmoteDodgingAlt", Id = CurrentRun.Hero.ObjectId, Delay = 0.2 })
			if not HeroHasTrait("BlindDurationTrait") then
				ClearEffect({ Id = attacker.ObjectId, Name = "ApolloBlind" })
				BlockEffect({ Id = triggerArgs.TriggeredByTable.ObjectId, Name = "ApolloBlind", Duration = 3.0 })
			end
			args.DamageAmount = nil
			args.AttackerWeaponData = nil		
			args.IsInvulnerable = true	
		else
			baseFunc(victim, attacker, args)
		end
	end
)
function ApolloBlindApply( triggerArgs )
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Start"))
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString.TableKeys(triggerArgs.TriggeredByTable))
end
function ApolloBlindClear(triggerArgs)
	if HeroHasTrait("BlindDurationTrait") then
		BlockEffect({ Id = triggerArgs.TriggeredByTable.ObjectId, Name = "ApolloBlind", Duration = 3.0 })
	end
end
-- Prophecy and Sight
ModUtil.WrapBaseFunction( "StartNewRun", 
	function(baseFunc, prevRun, args)
		baseFunc(prevRun, args)
		CurrentRun.RerollBoonTracker = 0
		CurrentRun.RerollObolTracker = 0
		return CurrentRun
	end
)

ModUtil.WrapBaseFunction( "AddMoney", 
	function(baseFunc, amount, source)
		baseFunc(amount, source)	
		if amount == nil or round( amount ) <= 0 then
			return
		end
		if HeroHasTrait("RerollObolTrait") then
			if(not CurrentRun.RerollObolTracker) then
				ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Doesnt exist"))
				return
			end
			local count = GetTotalHeroTraitValue("ObolCount")
			CurrentRun.RerollObolTracker = CurrentRun.RerollObolTracker + amount
			if(CurrentRun.RerollObolTracker >= count) then
				local times = math.floor(CurrentRun.RerollObolTracker/count);
				AddRerolls( times, source, { IgnoreMetaUpgrades = true } )
				CurrentRun.RerollObolTracker = CurrentRun.RerollObolTracker - (times * count)
			end
		end
	end
)
ModUtil.WrapBaseFunction( "HandleLootPickup", 
function(baseFunc, currentRun, loot)
	baseFunc(currentRun, loot)
	if (not loot.Name == "StackUpgrade") and HeroHasTrait("RerollBoonTrait") then
		if(not CurrentRun.RerollBoonTracker) then
			ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Doesnt exist"))
			return
		end
		CurrentRun.RerollBoonTracker = CurrentRun.RerollBoonTracker + 1
		local count = GetTotalHeroTraitValue("BoonCount")
		if(CurrentRun.RerollBoonTracker >= count) then
			local times = math.floor(CurrentRun.RerollBoonTracker/count);
			AddRerolls( times, source, { IgnoreMetaUpgrades = true } )
			CurrentRun.RerollBoonTracker = CurrentRun.RerollBoonTracker - (times * count)
		end
	end
end
)
-- Fountain Coin/Defense Functions
function FountainDefensePresentation()
	PlaySound({ Name = "/SFX/Player Sounds/DionysusBlightWineDash", Id = CurrentRun.Hero.ObjectId })
	thread( InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text = "FountainDefenseText_Alt", Duration = 1, LuaKey = "TempTextData", LuaValue = { TraitName = "FountainDefenseTrait", Amount = (1 - GetTotalHeroTraitValue("FountainDefenseBonus", {IsMultiplier = true})) * 100 } })
end

function ApolloMoney(args)
	local amount = round(GetTotalHeroTraitValue("FountainCoinBonus"))
	local moneyMultiplier = GetTotalHeroTraitValue( "MoneyMultiplier", { IsMultiplier = true } )
	amount = round( amount * moneyMultiplier )
	thread( InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text = "FountainCoinText_Alt", Duration = 1, LuaKey = "TempTextData", LuaValue = { TraitName = "FountainCoinTrait", Amount = amount }})
	thread( GushMoney, { Amount = amount, LocationId = CurrentRun.Hero.ObjectId, Radius = 100, Source = args.triggeredById, } )
end

OnUsed{ "HealthFountain HealthFountainAsphodel HealthFountainElysium HealthFountainStyx",
	function( triggerArgs )
		wait(0.4)
		local hasDamageBonus = false
		local hasDefenseBonus = false
		local hasCoinBonus = false
		for k, traitData in pairs(CurrentRun.Hero.Traits) do
			if traitData.FountainDamageBonus then
				hasDamageBonus = true
			end 
			if traitData.FountainDefenseBonus then
				hasDefenseBonus = true
				traitData.AccumulatedFountainDefenseBonus = traitData.AccumulatedFountainDefenseBonus- (1-traitData.FountainDefenseBonus)
				ExtractValues( CurrentRun.Hero, traitData, traitData )
			end
			if traitData.FountainCoinBonus then
				-- For notes,check MoneyPerRoom and SisyphusMoney
				hasCoinBonus = true
			end 
		end
		wait(1.0)
		if hasDamageBonus then
			wait(1.0)
		end
		if hasDefenseBonus then
			FountainDefensePresentation()
			wait(1.0)
		end
		if hasCoinBonus then
			ApolloMoney(triggerArgs)
			wait(1.0)
		end
	end
}
-- Song of Healing functions
ModUtil.WrapBaseFunction( "Kill", 
	function(baseFunc, victim, triggerArgs)
		if HeroHasTrait("ApolloHealTrait") and HasEffect({Id = victim.ObjectId, EffectName = "ApolloBlind" }) then
			victim.HealDropOnDeath = {
				Name = "HealDropMinor",
				Radius = 50,
				Chance = GetTotalHeroTraitValue("ApolloHealDropChance")
			}
		end
		baseFunc(victim, triggerArgs)
	end
)

-- For testing purposes
--[[ModUtil.WrapBaseFunction( "BeginOpeningCodex", 
	function(baseFunc)
		if (not CanOpenCodex()) and IsSuperValid() then
			wait(1, RoomThreadName)
			BuildSuperMeter(CurrentRun, 100)
			CommenceSuperMove()
			UpdateSuperDamageBonus()
			thread( MarkObjectiveComplete, "EXMove" )
		end
		baseFunc()
    end
)]]