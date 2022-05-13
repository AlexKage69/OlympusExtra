-- Separate Gods from Goddess to add more gods

if ModUtil ~= nil then

ModUtil.Mod.Register("ApolloExtra")

local mod = "ApolloExtra"
local package = "ApolloPackage"
--Variables
local DepthDamageMultiplier = 0.0
local DuplicateMultiplier = -0.60
local DuplicateStrongMultiplier = -0.40
local DuplicateVeryStrongMultiplier = -0.20
--Color
local OlympusColor = ModUtil.Entangled.ModData(Color)
OlympusColor.ApolloVoice = {255,145,79,255}
OlympusColor.ApolloDamageLight = {255,145,79,255}
OlympusColor.ApolloDamage = {255,145,79,255}
--Assets
local package = "OEAssets"
ModUtil.Path.Wrap( "SetupMap", function(baseFunc)
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
--QuestData
local OlympusQuestData = ModUtil.Entangled.ModData(QuestData)
OlympusQuestData.ApolloUpgrades =
{
	InheritFrom = { "DefaultQuestItem" },
	RewardResourceName = "Gems",
	RewardResourceAmount = 150,
	UnlockGameStateRequirements =
	{
		RequiredTextLines = { "ApolloGift01", },
	},
	CompleteGameStateRequirements =
	{
		RequiredTraitsTaken =
		{
			"ApolloWeaponTrait",
			"ApolloDashTrait",
			"ApolloRangedTrait",
			"ApolloSecondaryTrait",
			"ApolloShoutTrait",
			
			"FountainDefenseTrait",
			"ApolloBlindedTrait",
			"ApolloRetaliateTrait",
			"FountainCoinTrait",			
			"ApolloHealTrait",

			"RerollBoonTrait",
			"RerollObolTrait",
			"MissChanceTrait",
		},
	},
}
local OlympusQuestOrderData = ModUtil.Entangled.ModData(QuestOrderData)
table.insert(OlympusQuestOrderData, 29, "ApolloUpgrades")

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
-- GlobalVoiceLines
local OlympusGlobalVoiceLines = ModUtil.Entangled.ModData(GlobalVoiceLines)
table.insert(OlympusGlobalVoiceLines.BoonUsedVoiceLines, {
	BreakIfPlayed = true,
	RandomRemaining = true,
	PreLineWait = 0.5,
	RequiredLastGodLoot = "ApolloUpgrade",
	RequiredEncounters = { "DevotionTestTartarus", "DevotionTestAsphodel", "DevotionTestElysium", },
	RequireCurrentEncounterNotComplete = true,
	Source = { SubtitleColor = Color.ApolloVoice },

	-- Well done, Zagzag.
	{ Cue = "/VO/Apollo_0149" },
	-- I knew you had it in you.
	{ Cue = "/VO/Apollo_0150" },
	-- I see a bright future.
	{ Cue = "/VO/Apollo_0151" },
	-- There's no one like you, Zagzag.
	{ Cue = "/VO/Apollo_0152" },
	-- I'll write you a song for this!
	{ Cue = "/VO/Apollo_0153" },
	-- Just... Thank you.
	{ Cue = "/VO/Apollo_0154" },
})
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
OlympusGameData.ApolloBasicPickUpTextLines = {
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
ModUtil.Table.Merge(OlympusGameData.GodAboutGodVoiceLines, { 
	"ApolloAboutZeus01", "ApolloAboutStepSiblings01", "ApolloAboutDaughters01",
	"ApolloAboutDaughters02", "ApolloAboutDaughters03", "ApolloAboutDaughters04",
	"ApolloAboutDaughters05", "ApolloAboutHydra", "ApolloAboutDaphne01",
	"ApolloAboutPan01", "ApolloAboutArtemis01", "ApolloAboutArtemis02",
	"ApolloAboutArtemis03", "ApolloAboutMusic01", "ApolloAboutHarpQuest01",
	"ApolloAboutHarpQuest02", "ApolloAboutOrpheus01", "ApolloAboutOrpheus02" }
)
--Keywords
local OlympusKeywordList = ModUtil.Entangled.ModData(KeywordList)
ModUtil.Table.Merge(OlympusKeywordList, { "ApolloBlind", "FlashBomb" })

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
		Icon = "Keepsake_Lyre",
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
        Format = "NegativePercentDelta"
      },
      {
        Key = "AccumulatedFountainDefenseBonus",
        ExtractAs = "TooltipAccumulatedBonus",
        Format = "NegativePercentDelta"
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
	Icon = "Boon_Apollo_12",
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
table.insert(OlympusTraitData.AresLongCurseTrait.PropertyChanges,{
	TraitName = "ApolloRangedTrait",
	WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
	EffectName = "DelayedDamage",
	EffectProperty = "Duration",
	DeriveValueFrom = "DurationSource"
})
table.insert(OlympusTraitData.AresLoadCurseTrait.PropertyChanges,{
	TraitName = "ApolloRangedTrait",
	WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
	EffectName = "DelayedDamage",
	EffectProperty = "StackAmount",
	DeriveValueFrom = "DamageSource"
})
table.insert(OlympusTraitData.AresLoadCurseTrait.PropertyChanges,{
	TraitName = "ApolloRangedTrait",
	WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
	EffectName = "DelayedDamage",
	EffectProperty = "Stacks",
	ChangeValue  = true,
})
OlympusTraitData.HyacinthTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Apollo_Aphrodite_01",
		RequiredFalseTraits = { "HyacinthTrait", "CharmTrait", "InstantChillKill"},
		OnDamageEnemyFunction = {
			FunctionName = "CheckHyacinthKill",
			FunctionArgs = {
				HyacinthDeathThreshold = 0.10,
				ExtractValues =
				{
					{
						Key = "HyacinthDeathThreshold",
						ExtractAs = "TooltipDeathThreshold",
						Format = "Percent",
					},
				}
			}
		},
		PreEquipWeapons = { "HyacinthChillKill" },
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

		PriorityUpgrades = { "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait", "ApolloRangedTrait"}, -- ShieldLoadAmmo_ApolloRangedTrait
		WeaponUpgrades = { "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait", "ApolloRangedTrait", "ApolloShoutTrait" }, --"ShieldLoadAmmo_ApolloRangedTrait"
		Traits = {"ApolloRetaliateTrait", "FountainDefenseTrait", "FountainCoinTrait", "RerollObolTrait", "RerollBoonTrait"}, 
		Consumables = { },

		LinkedUpgrades =
		{
			ApolloBlindedTrait  = {
				OneOf = { "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait", "ApolloRangedTrait", "ApolloRetaliateTrait"}, --"ShieldLoadAmmo_ApolloRangedTrait"
			},
			ApolloHealTrait  = {
				OneOf = { "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait", "ApolloRangedTrait", "ApolloRetaliateTrait"}, --"ShieldLoadAmmo_ApolloRangedTrait"
			},
			MissChanceTrait =
			{
				OneFromEachSet =
				{
					{ "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait", "ApolloRangedTrait" },-- "ShieldLoadAmmo_ApolloRangedTrait"
					{ "ApolloBlindedTrait", "ApolloRetaliateTrait", "RerollObolTrait", "RerollBoonTrait" }
				}
			},
			-- Duo
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
			HyacinthTrait = 
			{
				OneFromEachSet =
				{
					{ "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait", "ApolloRangedTrait" },
					{ "AphroditeWeaponTrait", "AphroditeSecondaryTrait", "AphroditeDashTrait", "AphroditeRangedTrait"}
				}
			},
			BlindDurationTrait = 
			{
				OneFromEachSet =
				{
					{ "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait" },-- "ShieldLoadAmmo_ApolloRangedTrait"
					{ "DemeterWeaponTrait", "DemeterSecondaryTrait", "DemeterRushTrait" }
				}
			}
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

			-- Lord Apollo...
			{ Cue = "/VO/ZagreusField_4816" },
			-- You found me, Apollo...
			{ Cue = "/VO/ZagreusField_4817" },
		},

		UpgradeMenuOpenVoiceLines =
		{
			[1] = GlobalVoiceLines.CheckOlympianReunionVoiceLines,
			[2] = GlobalVoiceLines.FoundRareBoonVoiceLines,
		},

		DuoPickupTextLineSets =
		{
			--Miss Trait
			ApolloWithZeus01 =
			{
                Name = "ApolloWithZeus01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "RegeneratingCappedSuperTrait",
				{ Cue = "/VO/Apollo_0187",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "Seeing you struggle with your father made me realise I must improve mine, Zagzag. We came up with something that might help you as well." },
				{ Cue = "/VO/Zeus_0199",
					PortraitExitWait = 0.35,
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
					StartSound = "/SFX/ZeusBoonThunder",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Zeus_01", Portrait = "Portrait_Zeus_Default_01",
					Text = "That's right, Nephew! I feel generous and I know you feel grateful. Let's show him our power, Young son." },
			},
			ApolloWithPoseidon01 =
			{
                Name = "ApolloWithPoseidon01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "BlindedRuptureTrait",
				{ Cue = "/VO/Apollo_0042",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "It's not the first time, Uncle and I work together. We have a little practice here. This is for you." },
				{ Cue = "/VO/Poseidon_0250",
					PortraitExitWait = 0.35,
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
					StartSound = "/SFX/PoseidonBoonWaveCrash",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Poseidon_01", Portrait = "Portrait_Poseidon_Default_01",
					Text = "That's right, Little Hades! With our help, I don't think it's possible for you to fail." },
			},
			-- Miss Trait
			ApolloWithAthena01 =
			{
                Name = "ApolloWithAthena01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "CastBackstabTrait",
				{ Cue = "/VO/Apollo_0182",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "Athena, maybe the three of us could start a band! I believe you used to play flute. We could play together sometime!" },
				{ Cue = "/VO/Athena_0123",
					PortraitExitWait = 0.35,
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
					StartSound = "/SFX/AthenaBoonHolyShield",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Athena_01", Portrait = "Portrait_Athena_Default_01",
					Text = "I have much responsibility, Step-Brother! I don't have time to ... start a band... Let's help our Cousin instead." },
			},
			ApolloWithAres01 =
			{
                Name = "ApolloWithAres01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "WarSongTrait",
				{ Cue = "/VO/Apollo_0044",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "Isn't it my dear Brother! You know what I was thinking? You should write a song or a poem. It would free your mind from all this violence." },
				{ Cue = "/VO/Ares_0240",
					PortraitExitWait = 0.35,
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
					StartSound = "/SFX/AresWrathBattle",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Ares_01", Portrait = "Portrait_Ares_Default_01",
					Text = "The only form of art I recognize is war. {#DialogueItalicFormat}Hm{#PreviousFormat}... I have never seen anybody killing with words. Zagreus, take this instead." },
			},
			ApolloWithAphrodite01 =
			{
                Name = "ApolloWithAphrodite01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "HyacinthTrait",
				RequiredTextLines = { "ApolloGift01", "AphroditeGift01" },
				{ Cue = "/VO/Apollo_0045",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "Aphrodite and I are here to help. We came to a conclusion. Without our help, you won't escape. Therefore... " },
				{ Cue = "/VO/Aphrodite_0230",
					PortraitExitWait = 0.35,
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
					Emote = "PortraitEmoteAffection",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Aphrodite_01", Portrait = "Portrait_Aphrodite_Default_01",
					Text = "This is for you, little godling! Oh my me! I can't wait until we are all here together!"
				},
			},
			ApolloWithArtemis01 =
			{
                Name = "ApolloWithArtemis01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "FamedDuetTrait",
				RequiredTextLines = { "ApolloGift01", "ArtemisGift01" },
				{ Cue = "/VO/Apollo_0046",
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "I brought my sister with me this time, Zagzag! With our help, you might stand a chance against your father. Go Zagzag!" },
				{ Cue = "/VO/Artemis_0250",
					PortraitExitWait = 0.35,
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
					StartSound = "/SFX/ArtemisBoonArrow",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Emote = "PortraitEmoteDepressed",
					Speaker = "NPC_Artemis_01", Portrait = "Portrait_Artemis_Default_01",
					Text = "Are you seriously calling him that? I am sorry Zagreus. I hope this can make him a little more to bearable..."
				},
			},
			ApolloWithDionysus01 =
			{
                Name = "ApolloWithDionysus01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "MaxHangoverTrait",
				{ Cue = "/VO/Apollo_0047",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "{#DialogueItalicFormat}Whoa{#PreviousFormat}, this wine is exquisite, Brother! I can't believe how well it goes with the cheese. The taste of both is just... Out of this world!" },
				{ Cue = "/VO/Dionysus_0230",
					PortraitExitWait = 0.35,
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
					StartSound = "/SFX/DionysusBoonWineLaugh",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Dionysus_01", Portrait = "Portrait_Dionysus_Default_01",
					Emote = "PortraitEmoteCheerful",
					Text = "{#DialogueItalicFormat}Haha{#PreviousFormat}, that's the trick, the combination of two great things together makes it all better. Like us. Let's combine our blessing to help, {#DialogueItalicFormat}um{#PreviousFormat}, how do you call him again, Zagzag?" },
			},
			ApolloWithDemeter01 =
			{
                Name = "ApolloWithDemeter01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				HasTraitNameInRoom = "BlindDurationTrait",
				{ Cue = "/VO/Apollo_0048",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort",
					Text = "You know what, Aunty, for someone who's that cold, you might want to chill out sometime." },
				{ Cue = "/VO/Demeter_0370",
					PortraitExitWait = 0.35,
					StartSound = "/SFX/DemeterBoonFrost",
					EndSound = "/Leftovers/World Sounds/MapZoomInShort",
					Speaker = "NPC_Demeter_01", Portrait = "Portrait_Demeter_Default_01",
					Text = "How dare you! That's no way to talk to your Elders! I order you to help Zagreus and stop calling him nicknames." },
			},
		},

		SuperPriorityPickupTextLineSets =
		{
			ApolloAboutZagzag01 =
			{
                Name = "ApolloAboutZagzag01",
				PlayOnce = true,
				RequiredTextLines = { "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0161",
					PortraitExitWait = 1.25,
					PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
					UseEventEndSound = true,
					Emote = "PortraitEmoteMusical",
					Text = "Hey, Zagzag. You don't mind me calling you Zagzag? Right? Because if you do, you'd better come and tell me face to face." },
			},
			ApolloAboutOlympianReunionQuest01 =
			{
                Name = "ApolloAboutOlympianReunionQuest01",
				PlayOnce = true,
				RequiredTextLines = { "ApolloFirstPickUp", "PersephoneAboutOlympianReunionQuest01", },
				{ Cue = "/VO/ZagreusField_4817", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 2.33 },
					PostLineAnim = "ZagreusInteractEquip", PostLineAnimTarget = "Hero", PostLineFunctionName = "BoonInteractPresentation",
					Text = "OK, I think I'm ready. In the name of Hades! Olympus, this is an official message! And I hope it finds you well, Lord Apollo!" },
				{ Cue = "/VO/Apollo_0058",
					PortraitExitWait = 1.25,
					PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
					UseEventEndSound = true,
					Emote = "PortraitEmoteDepressed",
					Text = "{#DialogueItalicFormat}Whoa{#PreviousFormat}! Is that a party invitation? Wait, it's part of an invitation and I need to talk to my relatives? Well, I guess I can give them my part of information, but I don't think I can make it, I'll ask my sister to tell me how it went. Sorry Zagzag." },
			},
			ApolloPostEpilogue01 =
			{
                Name = "ApolloPostEpilogue01",
				PlayOnce = true,
				RequiredTextLines = { "OlympianReunionQuestComplete" },
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Apollo_0057",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Emote = "PortraitEmoteAffection",
					Text = "Sorry I missed the big party in your father's domain. Dionysus told me it was quite exquisite. I wish I was able to be there, but maybe you could come visit us sometime instead?" },
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
				RequiredAnyTextLines = { "OrpheusFirstMeeting", "OrpheusFirstMeeting_Alt" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete", "ApolloWithZeus01", "ZeusWithApollo01" },
				RequiredGodLoot = "ZeusUpgrade",
				{ Cue = "/VO/Apollo_0059",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Is Orpheus playing music to your dad? Well, I play my music to mine. He can be pretty strict at times, but a good old jam always sooth his mood a bit. Fathers can be a bit tense... I am sure you understand what I mean..." },
			},
			ApolloAboutStepSiblings01 =
			{
                Name = "ApolloAboutStepSiblings01",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "ApolloFirstPickUp" },
				RequiredGodLoot = "ArtemisUpgrade",
				{ Cue = "/VO/Apollo_0060",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Ares, Aphrodite, Dionysus. I mean they are all great step-siblings, but Zeus sure loves a bit too much, hm... At least, I have Artemis. Don't tell her that" },
			},
			ApolloAboutDaughters01 =
			{
                Name = "ApolloAboutDaughters01",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp", "OrpheusMusicProgress01" },
				{ Cue = "/VO/Apollo_0061",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hey Zagzag, I believe you still haven't found your second half, am I right? Maybe, you would be a great match for one of my daughters." },
			},
			ApolloAboutDaughters02 =
			{
                Name = "ApolloAboutDaughters02",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp", "ApolloAboutDaughters01" },
				{ Cue = "/VO/Apollo_0062",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Of my three daughters, Apollonis is kind of emotional... Once, she burned our house, because her meal wasn't hot enough... Another time, she cried for a week because her hair brush broke... But, well, if you are looking to spice up your life, she's the one for you!" },
			},
			ApolloAboutDaughters03 =
			{
                Name = "ApolloAboutDaughters03",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloAboutDaughters01" },
				{ Cue = "/VO/Apollo_0063",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Her name Cephisso and she's probably my most shy daughter of the three. She's very quiet ... like very... Sometimes, she speaks and I didn't she was in the room... So, for a quiet lifestyle, she could be the one for you!" },
			},
			ApolloAboutDaughters04 =
			{
                Name = "ApolloAboutDaughters04",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloAboutDaughters01" },
				{ Cue = "/VO/Apollo_0064",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Borysthenis is the strong one, she's not nervous. She can even move mountains! Just be careful with her hugs, she cracked my back once and I still feel soar for it... But hey, if that's not showing love, what is? If you want someone to check your back, she's the one!" },
			},
			ApolloAboutDaughters05 =
			{
                Name = "ApolloAboutDaughters05",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				EndCue = "/VO/ZagreusHome_3760",
				RequiredTextLines = { "ApolloAboutDaughters02", "ApolloAboutDaughters03", "ApolloAboutDaughters04" },
				{ Cue = "/VO/Apollo_0065",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Well, I have talked to my daughters, and they kind of don't want, hm, a distant relationship, and since I don't see you going anywhere, I think they'll end this here." },
			},
			ApolloAboutHydra =
			{
                Name = "ApolloAboutHydra",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredBiome = "Asphodel",
				RequiredAnyRoomsLastRun = { "B_Boss01", "B_Boss02" },
				RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "ApolloGift01", "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0165",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hydra has snake's head, right? {#DialogueItalicFormat}Urf{#PreviousFormat}, I hate snakes, especially pythons, they are the worst. Still, I got the upper hand against them, here that should help." },
			},
			ApolloAboutDaphne01 =
			{
                Name = "ApolloAboutDaphne01",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "ApolloGift04", "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0162",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Were you looking at my laurel crown, Zagz... Oh Daphne, I miss you very much... Where are you?" },
			},
			ApolloAboutPan01 =
			{
                Name = "ApolloAboutPan01",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "ApolloGift02", "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0163",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "As you know, Zagzag, I am the god of music, but once the Nymph Pan tried to get my title, but he had no chance against my great taste in music. I still remember his face. Priceless..." },
			},
			ApolloAboutArtemis01 =
			{
                Name = "ApolloAboutArtemis01",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "ApolloFirstPickUp" },
				RequiredGodLoot = "ArtemisUpgrade",
				{ Cue = "/VO/Apollo_0066",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "My sister is a bit antisocial at times... I tried to get her off her shell... Even the Great Apollo can't do anything. Perhaps you can help her with that?" },
			},
			ApolloAboutArtemis02 =
			{
                Name = "ApolloAboutArtemis02",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloAboutArtemis01" },
				RequiredGodLoot = "ArtemisUpgrade",
				{ Cue = "/VO/Apollo_0067",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Artemis is older than me by seconds, but she loves to make me feel like the youngest. I mean by seconds... That doesn't count right?" },
			},
			ApolloAboutArtemis03 =
			{
                Name = "ApolloAboutArtemis03",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloAboutArtemis01" },
				RequiredGodLoot = "ArtemisUpgrade",
				{ Cue = "/VO/Apollo_0068",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I wonder if I could beat Artemis in a bow competition... We are both pretty good... Tell me, Zagzag... You would bet on me, right?" },
			},
			ApolloAboutMusic01 =
			{
                Name = "ApolloAboutMusic01",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "OrpheusWithEurydice01", "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0069",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "As the god of music, I know several of my relatives that contributed to what is is now. I always try to add my special spice to the recipe, but Art is a collective part of life. I hope you find music in your heart even while you are stuck down there." },
			},
			ApolloAboutHarpQuest01 =
			{
                Name = "ApolloAboutHarpQuest01",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "OrpheusMusicProgress02", "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0070",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Are you learning some art of music, Zagzag? I sense hours of practice over the tips of your fingers. Someday, you might want to quit, but you must persist like you are doing right now, it will be all worth in the end. Trust me." },
			},
			ApolloAboutHarpQuest02 =
			{
                Name = "ApolloAboutHarpQuest02",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "OrpheusMusicProgress04", "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0071",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I heard that you are a musician now, Zagzag? Maybe, Pan and Orpheus would like to join us and make a band, what do you say? Oh wait, you're still there, and I am still here... We'll think of something when we meet. I am sure of it." },
			},
			ApolloAboutOrpheus01 =
			{
                Name = "ApolloAboutOrpheus01",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "OrpheusTallTale03", "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0072",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Did you meet my old friend Orpheus down there? We used to play together, but he went to pick up a girl and never came back. It's a shame, he was pretty good." },
			},
			ApolloAboutOrpheus02 =
			{
                Name = "ApolloAboutOrpheus02",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloAboutOrpheus01", "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0073",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I don't like to brag, Zagzag, but I gave Orpheus his golden lyre, which he probably still have. Man, that thing is invaluable, such great instrument." },
			},
			ApolloAboutLeto01 =
			{
                Name = "ApolloAboutLeto01",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "ApolloGift01", "ZeusGift01", "ArtemisGift01", "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0084",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I am Zeus's son, Zagzag, but Hera is not my mother. Her name is Leto. **Pause** My mother I mean, she taught Artemis and I everything we know, Sometimes I wish she was in Olympus with us, but she doesn't go well with Hera." },
			},
			ApolloAboutLeto02 =
			{
                Name = "ApolloAboutLeto02",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloAboutLeto01", "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0085",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Leto gave birth to us on an island. Delos was the name. She was fleeing a Python, but don't worry, I defeated the mighty beast and now she's free to go anywhere... Except Olympus..." },
			},
			ApolloAboutArtemisLeto01 =
			{
                Name = "ApolloAboutArtemisLeto01",
				PlayOnce = true,
				RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloAboutLeto01", "ApolloAboutLeto02", "ApolloFirstPickUp" },
				RequiredGodLoot = "ArtemisUpgrade",
				{ Cue = "/VO/Apollo_0086",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "My sister doesn't talk much about our mother, Leto. I guess it's just how she is, not a very vocal character when it isn't about hunting something... But I am sure you have somehow notice. Am I right, Zagzag?" },
			},
			ApolloPostGiftPickup01 =
			{
                Name = "ApolloPostGiftPickup01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloGift01", },
				{ Cue = "/VO/Apollo_0087",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I don't know why, but you are in my mind a lot, lately. I just have this feeling I must meet you somehow... This here should help make it happen." },
			},
			ApolloPostGiftPickup02 =
			{
                Name = "ApolloPostGiftPickup02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloGift02", },
				{ Cue = "/VO/Apollo_0088",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I feel our friendship getting stronger on every encounter. I just hope you feel the same, Zagzag." },
			},

			ApolloPostGiftPickup03 =
			{
                Name = "ApolloPostGiftPickup03",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloGift03", },
				{ Cue = "/VO/Apollo_0089",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I see you are really trying this time. This could be the one. All you have to do is escape once, and it would be over. You would be with us. Keep going." },
			},
			ApolloAboutKeepsake01 =
			{
                Name = "ApolloAboutKeepsake01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTrait = "ForceApolloBoonTrait",

				{ Cue = "/VO/Apollo_0080",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Emote = "PortraitEmoteMusical",
					Text = "I am flattered that you brought my Shining Lyre with you. I knew we shared a special bond, Zagzag." },
			},
			ApolloRunCleared01 =
			{
                Name = "ApolloRunCleared01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp", "ApolloAboutPersephoneMeeting01" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				RequiresLastRunCleared = true,
				{ Cue = "/VO/Apollo_0079",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "What are you doing there, Zagzag. I saw in a vision that you escaped... Why did you go back? Forgot something, maybe? Oh well, I also saw that you would do it again. No worries." },
			},
			ApolloBackstory01 =
			{
                Name = "ApolloBackstory01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ArtemisFirstPickUp", "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0090",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Being the son of Uncle Hades must not be an easy task. I know the feeling since Zeus is not easy either. When Artemis told me about your existence, I knew I had to meet you." },
			},
			ApolloBackstory02 =
			{
                Name = "ApolloBackstory02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloBackstory01" },
				{ Cue = "/VO/Apollo_0091",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Sorry I didn't reach out sooner, Zagzag. I wish I had, but just couldn't. Hopefully, my help can make the difference in your escape." },
			},
			ApolloBackstory03 =
			{
                Name = "ApolloBackstory03",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "PersephoneMeeting02", "ApolloBackstory02" },
				{ Cue = "/VO/Apollo_0092",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I have a really good hearing and I heard that Hades once had a Queen. I assumed it was Nyx, but I had a vision lately... And... Well, I don't want to spoil it, just keep going." },
			},
			ApolloBackstory04 =
			{
                Name = "ApolloBackstory04",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloBackstory03", "ApolloAboutLeto02" },
				{ Cue = "/VO/Apollo_0093",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I have to speak out, Zagzag... I know about your secret, and I understand... I did what I had to do to protect my own mother and I can sense you would do the same. We are very alike, aren't we?" },
			},
			ApolloBackstory05 =
			{
                Name = "ApolloBackstory05",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloBackstory04" },
				RequiredFalseTextLines = { "PersephoneReturnsHome01" },
				{ Cue = "/VO/Apollo_0094",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I hope you find your mother once you have escaped. Just don't go back to your father's realm... Unless he's ready to change. May the fates be in your favour!" },
			},
			ApolloLowHealth01 =
			{
                Name = "ApolloLowHealth01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				RequiredMaxHealthFraction = 0.20,
				RequiredMaxLastStands = 1,

				{ Cue = "/VO/Apollo_0082",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Emote = "PortraitEmoteSurprise",					
					Text = "{#DialogueItalicFormat}Oh{#PreviousFormat}, that must hurt. Like really, really hurt. I don't think it will make the difference this time, but it's better than nothing." },
			},
			ApolloLowHealth02 =
			{
                Name = "ApolloLowHealth02",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				RequiredMaxHealthFraction = 0.15,
				RequiredMaxLastStands = 1,

				{ Cue = "/VO/Apollo_0083",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Emote = "PortraitEmoteSurprise",					
					Text = "My healing power would have come handy to you. You are just a bit too far to make me use them. I think I can manage give you this instead." },
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
				{ Cue = "/VO/Apollo_0081",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I gathered all my god-power to give you this. Don't let it go to waste, Zagzag. {#DialogueItalicFormat}Yawn{#PreviousFormat}, I'll rest now. You can do this." },
			},
		},

		PickupTextLineSets =
		{
			ApolloFirstPickUp =
			{
                Name = "ApolloFirstPickUp",
				PlayOnce = true,
				RequiredTextLines = { "AthenaFirstPickUp", "ArtemisFirstPickUp", },
				{ Cue = "/VO/ZagreusField_4800", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 4.23 },
					PostLineAnim = "ZagreusInteractEquip", PostLineAnimTarget = "Hero", PostLineFunctionName = "BoonInteractPresentation",
					Text = "This presence... It feels like Artemis, but something is different... In the name of Hades! Olympus! I accept this message." },
				{ Cue = "/VO/Apollo_0001",
					PortraitExitWait = 1.25,
					PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
					UseEventEndSound = true,
					Text = "I come here to help, and you confuse me with my sister, Cousin? Not cool, man." },
			},
			ApolloMiscPickup01 =
			{
                Name = "ApolloMiscPickup01",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0002",
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Dangers and vile creatures are hiding where you are. This blessing will keep them away. Take care." },
			},
			ApolloMiscPickup02 =
			{
                Name = "ApolloMiscPickup02",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0003",
					Emote = "PortraitEmoteCheerful",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Take my blessing, Cousin. It will light up your way to Olympus. " },
			},
			ApolloMiscPickup03 =
			{
                Name = "ApolloMiscPickup03",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				RequiredFalseRooms = { "RoomOpening" },
				RequiredMaxHealthFraction = 0.75,
				{ Cue = "/VO/Apollo_0004",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Emote = "PortraitEmoteDepressed",					
					Text = "ApolloMiscPickup03" },
			},
			ApolloMiscPickup04 =
			{
                Name = "ApolloMiscPickup04",
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				{ Cue = "/VO/Apollo_0005",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "ApolloMiscPickup04" },
			},
			ApolloMiscPickup05 =
			{
                Name = "ApolloMiscPickup05",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0006",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "ApolloMiscPickup05" },
			},
			ApolloMiscPickup06 =
			{
                Name = "ApolloMiscPickup06",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0007",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "ApolloMiscPickup06" },
			},
			ApolloMiscPickup07 =
			{
                Name = "ApolloMiscPickup07",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0008",
					Emote = "PortraitEmoteCheerful",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "By all the divines! You are still going at it, Zagzag. I see you are well determined to come meet us. Wish you the best!" },
			},
			ApolloMiscPickup08 =
			{
                Name = "ApolloMiscPickup08",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0009",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Let me play something for you, it might guide your way to us. " },
			},
			ApolloMiscPickup09 =
			{
                Name = "ApolloMiscPickup09",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0010",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "There you are, Zagzag. Are you hiding from me? I just wanted to give you this." },
			},
			ApolloMiscPickup10 =
			{
                Name = "ApolloMiscPickup10",
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				{ Cue = "/VO/Apollo_0011",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Let me light your path. That's the least I can do for a guy like you." },
			},
			ApolloMiscPickup11 =
			{
                Name = "ApolloMiscPickup11",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0012",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "{#DialogueItalicFormat}Hey, look here, Zagzag,\n Made a haiku just for you,\n Good luck escaping.{#PreviousFormat}" },
			},
			ApolloMiscPickup12 =
			{
                Name = "ApolloMiscPickup12",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0013",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Trying to escape again, Zagzag? I believe your fate is set on staying down there. But then again, I've been wrong before. Against all odds, I believe in you, young prince." },
			},
			ApolloMiscPickup13 =
			{
                Name = "ApolloMiscPickup13",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0014",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "ApolloMiscPickup13" },
			},
			ApolloMiscPickup14 =
			{
                Name = "ApolloMiscPickup14",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				MinRunsSinceAnyTextLines = { TextLines = { "ApolloPostEpilogue01" }, Count = 3 },				
				{ Cue = "/VO/Apollo_0015",
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Ob-La-Di, Ob-La-Da... Oh. Hello there. I was working on a song. I probably do have time to finish it by the time, you arrive. In the meantime, take this." },
			},
			ApolloMiscPickup15 =
			{
                Name = "ApolloMiscPickup15",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp", "ApolloGift01" },
				{ Cue = "/VO/Apollo_0016",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Did you know, Zagzag, every sound can be transformed into music? Melody, rhythm, percussions. Maybe you can use it for your escape." },
			},
			ApolloMiscPickup16 =
			{
                Name = "ApolloMiscPickup16",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0017",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Sometimes adversity is what you need to face in order to become successful. All the best, Zagzag." },
			},
			ApolloMiscPickup17 =
			{
                Name = "ApolloMiscPickup17",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				{ Cue = "/VO/Apollo_0018",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "ApolloMiscPickup17" },
			},
			ApolloMiscPickup18 =
			{
                Name = "ApolloMiscPickup18",
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				{ Cue = "/VO/Apollo_0019",
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I heard that you've never seen sunlight before! If you ever get out, take a moment to check it out, you'll see all the beautiful things the world has to offer up here." },
			},
			ApolloMiscPickup19 =
			{
                Name = "ApolloMiscPickup19",
				Priority = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = { "ApolloFirstPickUp" },
				RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
				{ Cue = "/VO/Apollo_0020",
					Emote = "PortraitEmoteCheerful",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Is your father keeping you into his realm, Zagzag. Sometimes fathers are strict, but we must show them who we are and take our place. We are very alike, Zagzag. The difference is I succeed in what I start. You should try it." },
			},

			-- shorter acknowledgments
			ApolloMiscPickup20 =
			{
                Name = "ApolloMiscPickup20",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0021",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I knew you would come, Zagzag. I prepared this in such case." },
			},
			ApolloMiscPickup21 =
			{
                Name = "ApolloMiscPickup21",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0022",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I can see you've got the music in you. It's just a matter of using it the right way." },
			},
			ApolloMiscPickup22 =
			{
                Name = "ApolloMiscPickup22",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0002",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "With this blessing, Zagzag. The light shall burn your enemies." },
			},
			ApolloMiscPickup23 =
			{
                Name = "ApolloMiscPickup23",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0024",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Like I used to say. Where words fail, music speaks." },
			},
			ApolloMiscPickup24 =
			{
                Name = "ApolloMiscPickup24",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0025",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "ApolloMiscPickup24" },
			},
			ApolloMiscPickup25 =
			{
                Name = "ApolloMiscPickup25",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0026",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "ApolloMiscPickup25" },
			},
			ApolloMiscPickup26 =
			{
                Name = "ApolloMiscPickup26",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0027",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "ApolloMiscPickup26" },
			},
			ApolloMiscPickup27 =
			{
                Name = "ApolloMiscPickup27",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0028",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "This shall light up your way to us. Just be quick before it fades." },
			},
			ApolloMiscPickup28 =
			{
                Name = "ApolloMiscPickup28",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0029",
					Emote = "PortraitEmoteCheerful",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You might not see the sun from down there, but you have my light, right there." },
			},
			ApolloMiscPickup29 =
			{
                Name = "ApolloMiscPickup29",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0030",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "As you work to create light for others, you naturally light your own way. Keep going." },
			},

			ApolloMiscPickup30 =
			{
                Name = "ApolloMiscPickup30",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0031",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Hope is being able to see that there is light despite all the darkness." },
			},
			ApolloMiscPickup31 =
			{
                Name = "ApolloMiscPickup31",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0032",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "History is but the unrolled scroll of prophecy. Write your own story, Zagzag." },
			},
			ApolloMiscPickup32 =
			{
                Name = "ApolloMiscPickup32",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0033",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I don't make mistakes. I make prophecies which immediately turn out to be wrong." },
			},
			ApolloMiscPickup33 =
			{
                Name = "ApolloMiscPickup33",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0034",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I sense your heart is pure. This blessing should be handy then. Good luck." },
			},
			ApolloMiscPickup34 =
			{
                Name = "ApolloMiscPickup34",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
				{ Cue = "/VO/Apollo_0035",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I am your sunshine~~\n Your only sunshine~~\n I make you happy~~\n when skies are gray~~" },
			}
		},

		BoughtTextLines =
		{
			ApolloLootBought01 =
			{
                Name = "ApolloLootBought01",
				PlayOnce = true,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },

				{ Cue = "/VO/Apollo_0095",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Emote = "PortraitEmoteCheerful",
					Text = "Stopping by Charon's shop, I see. This deal might be your best chance of escaping." },
			},
			ApolloLootBought02 =
			{
                Name = "ApolloLootBought02",
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },

				{ Cue = "/VO/Apollo_0096",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I would say you got rip off, but I had a vision of a sale coming soon... And I know Charon doesn't do take back." },
			},
			ApolloLootBought03 =
			{
                Name = "ApolloLootBought03",
				PlayOnce = true,
				ChanceToPlay = 0.33,
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },

				{ Cue = "/VO/Apollo_0097",
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You didn't have to pay for my blessing, Zagzag. I would have helped you if you only asked." },
			},
		},

		RejectionTextLines =
		{
			ApolloRejection01 =
			{
                Name = "ApolloRejection01",
				{ Cue = "/VO/Apollo_0098",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Did you just choose somebody else over me, Cousin? I guess you've decided to stay in the darkness down below." },
			},
			ApolloRejection02 =
			{
                Name = "ApolloRejection02",
				{ Cue = "/VO/Apollo_0099",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You know I can see what's going to happen, right? Let me just say you won't like it." },
			},
			ApolloRejection03 =
			{
                Name = "ApolloRejection03",
				{ Cue = "/VO/Apollo_0100",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "The moment I thought we could jam together. Let's just hope it's not the end of our duet." },
			},
			ApolloRejection04 =
			{
                Name = "ApolloRejection04",
				{ Cue = "/VO/Apollo_0101",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Are you blind, Cousin? I hope you you meant to choose me. If not, what I am going to do is justified." },
			},
			ApolloRejection05 =
			{
                Name = "ApolloRejection05",
				{ Cue = "/VO/Apollo_0102",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Emote = "PortraitEmoteCheerful",
					Text = "Are you serious, Cousin? Is it because I called you Zagzag? Because you just gave me a reason to keep using the nickname." },
			},
			ApolloRejection06 =
			{
                Name = "ApolloRejection06",
				{ Cue = "/VO/Apollo_0103",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Emote = "PortraitEmoteCheerful",
					Text = "Here I am, showing you the way out and this is the gratitude I get... Let me show you another, then." },
			},
			ApolloRejection07 =
			{
                Name = "ApolloRejection07",
				{ Cue = "/VO/Apollo_0104",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Emote = "PortraitEmoteCheerful",
					Text = "No ... way... Even I couldn't see that one coming. But you know what, I don't think you'll see what's coming for you either." },
			},
			ApolloRejection08 =
			{
                Name = "ApolloRejection08",
				{ Cue = "/VO/Apollo_0105",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Emote = "PortraitEmoteCheerful",
					Text = "I don't think this is your first mistake, Cousin. But it might be your last." },
			},
			ApolloRejection09 =
			{
                Name = "ApolloRejection09",
				{ Cue = "/VO/Apollo_0106",
					PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Let me sing you a song, Cousin. It's called {#DialogueItalicFormat}\"Zagreus dies once more\"{#PreviousFormat}. It's very catchy." },
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

				-- Sorry, Apollo.
				{ Cue = "/VO/ZagreusField_4801" },
				-- Nothing personal, Lord Apollo.
				{ Cue = "/VO/ZagreusField_4802" },
				-- Forgive me, Apollo.
				{ Cue = "/VO/ZagreusField_4803" },
				-- Apologies, Lord Apollo.
				{ Cue = "/VO/ZagreusField_4804" },
			},
			[2] = GlobalVoiceLines.GodRejectedVoiceLines,
		},

		MakeUpTextLines =
		{
			ApolloMakeUp01 =
			{
                Name = "ApolloMakeUp01",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Apollo_0110",
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I sense you've come back to the light, Zagzag. Sorry, I just had to make sure." },
			},
			ApolloMakeUp02 =
			{
                Name = "ApolloMakeUp02",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Apollo_0111",
					Emote = "PortraitEmoteCheerful",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I knew this moment would come. No hard feeling, Zagzag." },
			},
			ApolloMakeUp03 =
			{
                Name = "ApolloMakeUp03",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Apollo_0112",
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Why are we fighting again, Zagzag? You know what I forgive you. Just don't do it again." },
			},
			ApolloMakeUp04 =
			{
                Name = "ApolloMakeUp04",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Apollo_0113",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Stop! I got a song in my head and I got to go write it down. Let me be now." },
			},
			ApolloMakeUp05 =
			{
                Name = "ApolloMakeUp05",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Apollo_0114",
					PreLineThreadedFunctionName = "PlayEmoteAnimFromSource", PreLineThreadedFunctionArgs = { Emote = "PortraitEmoteAffection", WaitTime = 7.6 },
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Wait a second... You didn't die! Oh, I think that happens later, my bad." },
			},
			ApolloMakeUp06 =
			{
                Name = "ApolloMakeUp06",
				PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
				{ Cue = "/VO/Apollo_0115",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "You know respect goes both ways, right, Zagzag... I am willing to do my part, if you do yours." },
			},
		},

		GiftTextLineSets =
		{
			-- gives gift in exchange
			ApolloGift01 =
			{
                Name = "ApolloGift01",
				PlayOnce = true,
				{ Cue = "/VO/ZagreusHome_3761", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "Lord Apollo, you've shown me the way. Please accept this offering." },
				{ Cue = "/VO/Apollo_0122",
					PortraitExitWait = 1.0,
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I'd be lying if I said I didn't see that one coming. That's why I prepared this gift back. Now, we're even." },
			},
			ApolloGift02 =
			{
                Name = "ApolloGift02",
				PlayOnce = true,
				RequiredTextLines = { "ApolloGift01" },
				{ Cue = "/VO/ZagreusHome_3762", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "Lord Apollo, your light is very welcome in this darker part of the world. I must thank you for this." },
				{ Cue = "/VO/Apollo_0123",
					PortraitExitWait = 1.0,
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "It must be hard to find such Nectar where you are. I truly appreciate the gesture. Any future gift is unnecessary." },
			},
			ApolloGift03 =
			{
                Name = "ApolloGift03",
				PlayOnce = true,
				RequiredTextLines = { "ApolloGift02" },
				{ Cue = "/VO/ZagreusHome_3763", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "I know you said to stop this, Lord Apollo. This is just a little something for all your help." },
				{ Cue = "/VO/Apollo_0124",
					PortraitExitWait = 1.0,
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Another gift? You know what would be the best gift? Escape your eternal prison and come to Olympus." },
			},
			ApolloGift04 =
			{
                Name = "ApolloGift04",
				PlayOnce = true,
				RequiredTextLines = { "ApolloGift03" },
				{ Cue = "/VO/ZagreusHome_3764", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "I couldn't escape like you wanted, but this here could help you wait until I succeed. Thank you, Lord Apollo." },
				{ Cue = "/VO/Apollo_0125",
					PortraitExitWait = 1.0,
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "Well, until we meet, this could do the trick. But seriously, think a little more for yourself and just... you know... escape?" },
			},
			ApolloGift05 =
			{
                Name = "ApolloGift05",
				PlayOnce = true,
				RequiredTextLines = { "ApolloGift04" },
				{ Cue = "/VO/ZagreusHome_3765", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "Your blessings have made me grasp life more, and I wanted to show my appreciation towards you, Lord Apollo. It's all I can give you for now." },
				{ Cue = "/VO/Apollo_0126",
					PortraitExitWait = 1.0,
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "How do you have so much of these? Isn't Nectar rare where you stand? This is madness..." },
			},
			ApolloGift06 =
			{
                Name = "ApolloGift06",
				PlayOnce = true,
				RequiredTextLines = { "ApolloGift05" },
				{ Cue = "/VO/ZagreusHome_3766", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "As a gesture of appreciation, this gift is for you, Lord Apollo. I hope you accept this humble offering." },
				{ Cue = "/VO/Apollo_0127",
					PortraitExitWait = 1.0,
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					Text = "I will take this, but no more Nectar, Zagzag. You hear me, just get out. You have your place here. Everybody is waiting for you." },
			},
			ApolloGift07 =
			{
                Name = "ApolloGift07",
				PlayOnce = true,
				RequiredTextLines = { "ApolloGift06" },
				{ Cue = "/VO/ZagreusHome_3767", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "BoonInteractPresentation",
					Text = "I know you said no more Nectar, Lord Apollo. But I must show you what you mean to me. Here's something you probably already have up there... But it's important for me you have this." },
				{ Cue = "/VO/Apollo_0128",
					PortraitExitWait = 1.0,
					Emote = "PortraitEmoteAffection",
					StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
					PostLineThreadedFunctionName = "MaxedRelationshipPresentation",
					PostLineFunctionArgs = { Text = "NPC_Apollo_01", Icon = "Keepsake_ApolloSticker_Max" },
					Text = "{#DialogueItalicFormat}Um{#PreviousFormat}. This is no Nectar... Ambrosia now? How did you find this? What can I say? Thank you, my friend. I just hope we can see each other soon. Until then, take care and... Thank you." },
			},
		},

		GiftGivenVoiceLines =
		{
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			PlayFromTarget = true,

			-- This is too much, Lord Apollo.
			{ Cue = "/VO/ZagreusField_4812" },
		},

		ShoutActivationSound = "/SFX/LyreGood", -- "VO/ApolloWrathLight"
		ShoutVoiceLines =
		{
			Queue = "Interrupt",
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				RequiredKillEnemiesFound = true,
				RequiredFalseSpurnedGodName = "ApolloUpgrade",

				-- Put your fate in the light!
				{ Cue = "/VO/Apollo_0129" },
				-- Do, Re, Mi! The end I see!
				{ Cue = "/VO/Apollo_0130" },
				-- La, Si, Do! Your pain will grow!
				{ Cue = "/VO/Apollo_0164" },
				-- Purification time, am I right?
				{ Cue = "/VO/Apollo_0131" },
				-- Vile creatures don't stand a chance!
				{ Cue = "/VO/Apollo_0132" },
				-- Better keep the rhythm!
				{ Cue = "/VO/Apollo_0133" },
				-- Did you ask for an encore?
				{ Cue = "/VO/Apollo_0134", RequiredMinKillEnemies = 2 },
				-- I'll never get tired of this sound.
				{ Cue = "/VO/Apollo_0135", RequiredMinKillEnemies = 2 },
			},
			{
				BreakIfPlayed = true,
				PlayFromTarget = true,
				RandomRemaining = true,
				RequiredKillEnemiesFound = true,
				RequiredSpurnedGodName = "ApolloUpgrade",
				RequireCurrentEncounterNotComplete = true,

				-- Is it because I called you Zagzag?!
				{ Cue = "/VO/Apollo_0136" },
				-- You have chosen... Poorly!
				{ Cue = "/VO/Apollo_0137" },
				-- The light shall burn you, Zagzag.
				{ Cue = "/VO/Apollo_0138" },
				-- You were the chosen one!
				{ Cue = "/VO/Apollo_0139" },
				-- You were my brother, Zagzag. I loved you.
				{ Cue = "/VO/Apollo_0140" },
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

			-- Great trade, Lord Apollo.
			{ Cue = "/VO/ZagreusField_4813" },
			-- Lord Apollo, show me the path.
			{ Cue = "/VO/ZagreusField_4814" },
			-- Lord Apollo, I agree with the terms.
			{ Cue = "/VO/ZagreusField_4815" },
		},

		DeathTauntVoiceLines =
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.25,
			NoTarget = true,

			-- This is what happens to those who succumb to the darkness.
			{ Cue = "/VO/Apollo_0141" },
			-- Hear that? Silence shall be your only music.
			{ Cue = "/VO/Apollo_0142" },
			-- I already knew this choice would be your last.
			{ Cue = "/VO/Apollo_0143" },
		},

		BlindBoxOpenedVoiceLines =
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.3,
			Source = { SubtitleColor = Color.ApolloVoice },
			TriggerCooldowns = { "ZagreusBoonTakenSpeech" },

			-- Let's start a band.
			{ Cue = "/VO/Apollo_0144" },
			-- Zagzag is in the place.
			{ Cue = "/VO/Apollo_0145" },
			-- This is my holy blessing.
			{ Cue = "/VO/Apollo_0146" },
			-- I'll show you the way.
			{ Cue = "/VO/Apollo_0147" },
			-- Get ready to jam.
			{ Cue = "/VO/Apollo_0148" },
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
OlympusLootData.AphroditeUpgrade.LinkedUpgrades.HyacinthTrait = 
{
	OneFromEachSet =
	{
		{ "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait", "ApolloRangedTrait" },
		{ "AphroditeWeaponTrait", "AphroditeSecondaryTrait", "AphroditeDashTrait", "AphroditeRangedTrait"}
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
-- Other gods modification
-- AthenaUpgrade
table.insert(OlympusLootData.AthenaUpgrade.PriorityPickupTextLineSets.AthenaVsOlympians01.RequiredTextLines, "ApolloFirstPickUp")

-- HermesUpgrade
table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian01.RequiredMinAnyTextLines.TextLines, "HermesExpectingApollo01")
table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian01.RequiredFalseGodLoots, "ApolloUpgrade")
table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian01.RequiredOneOfTraits, "ForceApolloBoonTrait")
table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian02.RequiredMinAnyTextLines.TextLines, "HermesExpectingApollo01")
table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian02.RequiredFalseGodLoots, "ApolloUpgrade")
table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian02.RequiredOneOfTraits, "ForceApolloBoonTrait")
table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian03.RequiredMinAnyTextLines.TextLines, "HermesExpectingApollo01")
table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian03.RequiredFalseGodLoots, "ApolloUpgrade")
table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian03.RequiredOneOfTraits, "ForceApolloBoonTrait")
table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian04.RequiredMinAnyTextLines.TextLines, "HermesExpectingApollo01")
table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian04.RequiredFalseGodLoots, "ApolloUpgrade")
table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian04.RequiredOneOfTraits, "ForceApolloBoonTrait")
table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian05.RequiredMinAnyTextLines.TextLines, "HermesExpectingApollo01")
table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian05.RequiredFalseGodLoots, "ApolloUpgrade")
table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian05.RequiredOneOfTraits, "ForceApolloBoonTrait")
table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian06.RequiredMinAnyTextLines.TextLines, "HermesExpectingApollo01")
table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian06.RequiredFalseGodLoots, "ApolloUpgrade")
table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian06.RequiredOneOfTraits, "ForceApolloBoonTrait")

OlympusLootData.HermesUpgrade.SuperPriorityPickupTextLineSets.HermesExpectingApollo01 =
{
	PlayOnce = true,
	PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
	MinRunsSinceSquelchedHermes = ConstantsData.SquelchedHermesRunCount,
	RequiredTextLines = { "HermesFirstPickUp" },
	RequiredFalseGodLoot = "ApolloUpgrade",
	RequiredTrait = "ForceApolloBoonTrait",
	EndVoiceLines = GlobalVoiceLines.RushedHermesVoiceLines,

	{ Cue = "/VO/Hermes_0240",
		StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
		Text = "Some say Apollo is faster than me. Well, here's your proof that I am the fastest among us, Boss!" },
}

-- Gift Section    
local OlympusGiftOrdering = ModUtil.Entangled.ModData(GiftOrdering)
local OlympusGiftData = ModUtil.Entangled.ModData(GiftData)
ModUtil.Table.Merge(OlympusGiftOrdering, { "ForceApolloBoonTrait" })

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
ModUtil.Path.Wrap( "CheckOnHitPowers", 

	function(baseFunc, victim, attacker, args)
		local missRate = 0.5
		if not HeroHasTrait("MissChanceTrait") then
			missRate = 0.75
		end
		if attacker and HasEffect({Id = attacker.ObjectId, EffectName = "ApolloBlind" }) and RandomFloat(0,1) <= missRate then
			thread( InCombatText, CurrentRun.Hero.ObjectId, "Combat_Miss", 0.4, {SkipShadow = true} )
			PlaySound({ Name = "/SFX/Player Sounds/HermesWhooshDodgeSFX", Id = CurrentRun.Hero.ObjectId })
			PlaySound({ Name = "/VO/ZagreusEmotes/EmoteDodgingAlt", Id = CurrentRun.Hero.ObjectId, Delay = 0.2 })
			if not HeroHasTrait("BlindDurationTrait") then
				ClearEffect({ Id = attacker.ObjectId, Name = "ApolloBlind" })
				BlockEffect({ Id = attacker.ObjectId, Name = "ApolloBlind", Duration = 3.0 })
			end
			args.DamageAmount = nil
			args.AttackerWeaponData = nil		
			args.IsInvulnerable = true	
		elseif attacker and HasEffect({Id = attacker.ObjectId, EffectName = "ZagreusApolloBlind" }) and attacker.ObjectId == CurrentRun.Hero.ObjectId then
			thread( InCombatText, CurrentRun.Hero.ObjectId, "Combat_Blinded", 1.0, {SkipShadow = true} )
			args.DamageAmount = nil
			args.AttackerWeaponData = nil		
			--args.IsInvulnerable = true	
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
ModUtil.Path.Wrap( "StartNewRun", 
	function(baseFunc, prevRun, args)
		baseFunc(prevRun, args)
		CurrentRun.RerollBoonTracker = 0
		CurrentRun.RerollObolTracker = 0
		return CurrentRun
	end
)

ModUtil.Path.Wrap( "AddMoney", 
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
ModUtil.Path.Wrap( "HandleLootPickup", 
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
				-- For notes, check MoneyPerRoom and SisyphusMoney
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
ModUtil.Path.Wrap( "Kill", 
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

-- Hyacinth Insta-kill function
function CheckHyacinthKill( args, attacker, victim )
	if (not victim.IsBoss) and attacker == CurrentRun.Hero and HasEffect({Id = victim.ObjectId, EffectName = "ApolloBlind" }) and HasEffect({Id = victim.ObjectId, EffectName = "ApolloBlind" }) and not victim.IsDead and victim.Health / victim.MaxHealth <= args.HyacinthDeathThreshold and ( victim.Phases == nil or victim.CurrentPhase == victim.Phases ) then
		FireWeaponFromUnit({ Weapon = "ApolloChillKill", AutoEquip = true, Id = CurrentRun.Hero.ObjectId, DestinationId = victim.ObjectId, FireFromTarget = true })
		PlaySound({ Name = "/SFX/DemeterEnemyFreezeShatter", Id = victim.ObjectId })
		
		--[[if victim.IsBoss then
	      BossHyacinthKillPresentation( victim )
		end]]

		if victim.DeathAnimation ~= nil and not victim.ManualDeathAnimation then
			SetAnimation({ Name = victim.DeathAnimation, DestinationId = victim.ObjectId })
			-- @todo Notify on death animation finish
		end
		thread( Kill, victim, { ImpactAngle = 0, AttackerTable = CurrentRun.Hero, AttackerId = CurrentRun.Hero.ObjectId })
	end
end

--[[function BossHyacinthKillPresentation(unit)
	AddSimSpeedChange( "HyacinthKill", { Fraction = 0.005, LerpTime = 0 } )
	local dropLocation = SpawnObstacle({ Name = "InvisibleTarget", DestinationId = unit.ObjectId })
	AdjustColorGrading({ Name = "Frozen", Duration = 0.4 })
	CreateAnimation({ DestinationId = dropLocation, Name = "DemeterWinterHarvest" })
	thread( PlayVoiceLines, OlympusGlobalVoiceLines.DemeterFatalityVoiceLines, true )
	waitScreenTime( 0.86) -- 52 frames for DemeterWinterHarvest Scythe to appear before slicing
	CreateAnimation({ DestinationId = dropLocation, Name = "DemeterBossIceShatter" })
	waitScreenTime( 0.85)
	AdjustColorGrading({ Name = "Off", Duration = 0.4 })
	RemoveSimSpeedChange( "HyacinthKill", { LerpTime = 0.3 } )
	Destroy({ Id = dropLocation })
end]]

-- For testing purposes
--[[ModUtil.Path.Wrap( "BeginOpeningCodex", 
	function(baseFunc)		
		--ModUtil.Hades.PrintStackChunks(ModUtil.ToString.Deep(ModUtil.Mods.Data["ApolloExtra2"] ))
		if (not CanOpenCodex()) and IsSuperValid() then
			wait(1, RoomThreadName)
			BuildSuperMeter(CurrentRun, 100)
			CommenceSuperMove()
			UpdateSuperDamageBonus()
			thread( MarkObjectiveComplete, "EXMove" )
		end
		baseFunc()
    end
)
ModUtil.Path.Wrap("ModUtil.Hades.Triggers.OnHit.Combat.1", 
function(triggerArgs)
	ModUtil.Hades.PrintStackChunks(ModUtil.ToString("OnHIT"))
end)]]

end