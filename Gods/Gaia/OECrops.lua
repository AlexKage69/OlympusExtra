local OlympusGameData = ModUtil.Entangled.ModData(GameData)
local OlympusMetaUpgradeOrder = ModUtil.Entangled.ModData(MetaUpgradeOrder)
local OlympusKeywordList = ModUtil.Entangled.ModData(KeywordList)
local OlympusObstacleData = ModUtil.Entangled.ModData(ObstacleData)
local OlympusCodexUnlockTypes = ModUtil.Entangled.ModData(CodexUnlockTypes)
local OlympusCodexOrdering = ModUtil.Entangled.ModData(CodexOrdering)
local OlympusCodex = ModUtil.Entangled.ModData(Codex)
local OlympusGlobalVoiceLines = ModUtil.Entangled.ModData(GlobalVoiceLines)
local OlympusDeathLoopData = ModUtil.Entangled.ModData(DeathLoopData)
--[[
Meeting a boss all dirt patch grow counter reduce by 1 even if you die.
If you water them, dirt patch grow counter reduce by 3.
]]

OlympusGameData.FishOrder =
{
	"Fish_Tartarus_Common_01",
	"Fish_Tartarus_Rare_01",
	"Fish_Tartarus_Legendary_01",
	"Fish_Asphodel_Common_01",
	"Fish_Asphodel_Rare_01",
	"Fish_Asphodel_Legendary_01",
	"Fish_Elysium_Common_01",
	"Fish_Elysium_Rare_01",
	"Fish_Elysium_Legendary_01",
	"Fish_Styx_Common_01",
	"Fish_Styx_Rare_01",
	"Fish_Styx_Legendary_01",
	"Fish_Chaos_Common_01",
	"Fish_Chaos_Rare_01",
	"Fish_Chaos_Legendary_01",
	"Fish_Surface_Common_01",
	"Fish_Surface_Rare_01",
	"Fish_Surface_Legendary_01",
	--"Fish_Test_01",
}
OlympusGameData.GrowOrder =
{
	"Vegetable_Tartarus_Common_01",
	"Vegetable_Styx_Common_01",
	"Vegetable_Erebus_Common_01",
	"Vegetable_Asphodel_Rare_01",
	"Vegetable_Chaos_Rare_01",
	"Vegetable_Chaos_Legendary_01",
	"Fruit_Elysium_Common_01",
	"Fruit_Surface_Common_01",
	"Fruit_Home_Common_01",
	"Fruit_Gaia_Rare_01",
	"Fruit_Tartarus_Rare_01",
	"Fruit_Gaia_Legendary_01",
	"Herb_Asphodel_Common_01",
	"Herb_Chaos_Common_01",
	"Herb_Gaia_Common_01",
	"Herb_Elysium_Rare_01",
	"Herb_Styx_Rare_01",
	"Herb_Surface_Legendary_01",
	--"Fish_Test_01",
}
-- Chaos
OlympusGlobalVoiceLines.SeedChaosComplimentVoiceLines =
{
	{
		BreakIfPlayed = true,
		RandomRemaining = true,
		PreLineWait = 0.89,
		NoTarget = true,
		RequiredTextLines = { "ChaosFirstPickUp" },
		SuccessiveChanceToPlayAll = 0.5,
		Source = { SubtitleColor = Color.ChaosVoice },
		RequiredBiome = "Secrets",

		-- A good procurement.
		{ Cue = "/VO/Chaos_0241", },
		-- A perfect specimen.
		{ Cue = "/VO/Chaos_0242", },
		-- Keep it, Son of Hades.
		{ Cue = "/VO/Chaos_0243", },
		-- Specimen received.
		{ Cue = "/VO/Chaos_0244", },
		-- Specimen procured.
		{ Cue = "/VO/Chaos_0245", },
		-- You caught a specimen.
		{ Cue = "/VO/Chaos_0246", },
		-- You have outsmarted it.
		{ Cue = "/VO/Chaos_0247", },
		-- A fine display.
		{ Cue = "/VO/Chaos_0248", },
	},
	{
		BreakIfPlayed = true,
		RandomRemaining = true,
		PreLineWait = 0.89,
		NoTarget = true,
		RequiredTextLines = { "ChaosFirstPickUp" },
		Source = { SubtitleColor = Color.ChaosVoice },
		RequiredBiome = "Secrets",

		-- That was commendable.
		{ Cue = "/VO/Chaos_0148", },
		-- A praiseworthy attempt.
		{ Cue = "/VO/Chaos_0149", },
		-- You have provided me amusement.
		{ Cue = "/VO/Chaos_0150", },
		-- You are quite different, Son of Hades.
		{ Cue = "/VO/Chaos_0151", },
		-- Amusingly accomplished.
		{ Cue = "/VO/Chaos_0152", },
		-- That was enjoyable I have to say.
		{ Cue = "/VO/Chaos_0153", },
		-- Most interesting.
		{ Cue = "/VO/Chaos_0096", },
		-- How unexpected.
		{ Cue = "/VO/Chaos_0097", },
	}
}
OlympusGlobalVoiceLines.PatroclusSeedCaughtVoiceLines =
{
	BreakIfPlayed = true,
	RandomRemaining = true,
	PreLineWait = 0.8,
	RequiredTextLines = { "PatroclusFirstMeeting" },
	ObjectType = "NPC_Patroclus_01",
	RequiredRoom = "C_Story01",
	Actor = "StrangerOcclusionP",

	-- You caught one there, did you?
	{ Cue = "/VO/Patroclus_0243" },
	-- Did you just catch another?
	{ Cue = "/VO/Patroclus_0244" },
	-- Good fishing, stranger.
	{ Cue = "/VO/Patroclus_0245" },
	-- You showed that fish all right.
	{ Cue = "/VO/Patroclus_0246" },
	-- Very clever, stranger.
	{ Cue = "/VO/Patroclus_0247" },
	-- Another catch.
	{ Cue = "/VO/Patroclus_0248" },
	-- Another catch, huh.
	{ Cue = "/VO/Patroclus_0249" },
	-- Please leave me be.
	{ Cue = "/VO/Patroclus_0250", RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" } },
	-- A noble victory.
	{ Cue = "/VO/Patroclus_0251" },
	-- Skilfully done.
	{ Cue = "/VO/Patroclus_0252" },
	-- What good's a fish down here?
	{ Cue = "/VO/Patroclus_0253" },
	-- Fool of a fish.
	{ Cue = "/VO/Patroclus_0254" },
	-- It should have been more careful.
	{ Cue = "/VO/Patroclus_0255" },
	-- At last, the rivers are safe.
	{ Cue = "/VO/Patroclus_0256" },
}

OlympusGlobalVoiceLines.PersephoneSeedCaughtVoiceLines =
{
	BreakIfPlayed = true,
	RandomRemaining = true,
	PreLineWait = 0.8,
	RequiredTextLines = { "PersephoneFirstMeeting" },
	ObjectType = "NPC_Persephone_01",
	RequiredRoom = "E_Story01",
	Actor = "StrangerOcclusionP",
	PreLineAnim = "PersephoneGarden_Greeting",
	SubtitleMinDistance = 1200,

	-- Good catch!
	{ Cue = "/VO/Persephone_0284" },
	-- Oh, good catch!
	{ Cue = "/VO/Persephone_0285" },
	-- Well caught.
	{ Cue = "/VO/Persephone_0286" },
	-- Nicely done!
	{ Cue = "/VO/Persephone_0287" },
	-- Ooh look at that!
	{ Cue = "/VO/Persephone_0288" },
	-- Got that one all right!
	{ Cue = "/VO/Persephone_0289" },
}

OlympusGlobalVoiceLines.SeedCaughtVoiceLines =
{
	BreakIfPlayed = true,
	RandomRemaining = true,
	PreLineWait = 0.35,
	Queue = "Interrupt",

	-- Got you!
	{ Cue = "/VO/ZagreusField_3044" },
	-- You're mine.
	{ Cue = "/VO/ZagreusField_3045" },
	-- Come on up!
	{ Cue = "/VO/ZagreusField_3046" },
	-- Right there!
	{ Cue = "/VO/ZagreusField_3047" },
	-- That's a bite!
	{ Cue = "/VO/ZagreusField_3048" },
	-- Got a bite!
	{ Cue = "/VO/ZagreusField_3049" },
	-- Now!
	{ Cue = "/VO/ZagreusField_3050" },
	-- Mine!
	{ Cue = "/VO/ZagreusField_3051" },
	-- There!
	{ Cue = "/VO/ZagreusField_3052" },
	-- Fish!
	{ Cue = "/VO/ZagreusField_3053" },
	-- Bite this!
	{ Cue = "/VO/ZagreusField_3054" },
	-- Come on out!
	{ Cue = "/VO/ZagreusField_3055" },
	-- Got it!
	{ Cue = "/VO/ZagreusField_3056" },
	-- Think I got one!
	{ Cue = "/VO/ZagreusField_3057" },
	-- I got one!
	{ Cue = "/VO/ZagreusField_3058" },
}
OlympusGlobalVoiceLines.SeedFinishVoiceLines =
{
	BreakIfPlayed = true,
	RandomRemaining = true,
	PreLineWait = 0.35,
	Queue = "Interrupt",

	-- Got you!
	{ Cue = "/VO/ZagreusField_3044" },
	-- You're mine.
	{ Cue = "/VO/ZagreusField_3045" },
	-- Come on up!
	{ Cue = "/VO/ZagreusField_3046" },
	-- Right there!
	{ Cue = "/VO/ZagreusField_3047" },
	-- That's a bite!
	{ Cue = "/VO/ZagreusField_3048" },
	-- Got a bite!
	{ Cue = "/VO/ZagreusField_3049" },
	-- Now!
	{ Cue = "/VO/ZagreusField_3050" },
	-- Mine!
	{ Cue = "/VO/ZagreusField_3051" },
	-- There!
	{ Cue = "/VO/ZagreusField_3052" },
	-- Fish!
	{ Cue = "/VO/ZagreusField_3053" },
	-- Bite this!
	{ Cue = "/VO/ZagreusField_3054" },
	-- Come on out!
	{ Cue = "/VO/ZagreusField_3055" },
	-- Got it!
	{ Cue = "/VO/ZagreusField_3056" },
	-- Think I got one!
	{ Cue = "/VO/ZagreusField_3057" },
	-- I got one!
	{ Cue = "/VO/ZagreusField_3058" },
}
OlympusGlobalVoiceLines.SeedIdentifiedVoiceLines =
{
	{
		RandomRemaining = true,
		PreLineWait = 1.0,
		--[[Cooldowns =
		{
			{ Name = "ZagreusGlobalFishCaughtVoiceLinesPlayed", Time = 30 },
		},]]

		-- Huzzah!
		{ Cue = "/VO/ZagreusField_3109" },
		-- Victory!
		{ Cue = "/VO/ZagreusField_3110" },
		-- A sea-creature!
		{ Cue = "/VO/ZagreusField_3111" },
		-- I caught one!
		{ Cue = "/VO/ZagreusField_3112" },
		-- A fine catch!
		{ Cue = "/VO/ZagreusField_3113" },
		-- That's one more fish for me!
		{ Cue = "/VO/ZagreusField_3114" },
		-- I am victorious.
		{ Cue = "/VO/ZagreusField_3115" },
		-- I win this round, Fish.
		{ Cue = "/VO/ZagreusField_3116" },
	},
}
OlympusGlobalVoiceLines.GrowIdentifiedVoiceLines =
{
	{
		RandomRemaining = true,
		PreLineWait = 1.0,
		--[[Cooldowns =
		{
			{ Name = "ZagreusGlobalFishCaughtVoiceLinesPlayed", Time = 30 },
		},]]

		-- Huzzah!
		{ Cue = "/VO/ZagreusField_3109" },
		-- Victory!
		{ Cue = "/VO/ZagreusField_3110" },
		-- A sea-creature!
		{ Cue = "/VO/ZagreusField_3111" },
		-- I caught one!
		{ Cue = "/VO/ZagreusField_3112" },
		-- A fine catch!
		{ Cue = "/VO/ZagreusField_3113" },
		-- That's one more fish for me!
		{ Cue = "/VO/ZagreusField_3114" },
		-- I am victorious.
		{ Cue = "/VO/ZagreusField_3115" },
		-- I win this round, Fish.
		{ Cue = "/VO/ZagreusField_3116" },
	},
}
GrowData =
{
	BiomeSeed =
	{
		Defaults =
		{
			Basic =
			{
				Common = { Num = 1, Weight = 1.0, Name = "Seed_Vegetable_Tartarus_Common_01" },
			},
		},
		Tartarus =
		{
			Basic =
			{
				Common = { Num = 2, Weight = 0.3, Name = "Seed_Vegetable_Tartarus_Common_01" },
			},
			Special =
			{
				Common = { Num = 2, Weight = 0.3, Name = "Seed_Vegetable_Tartarus_Common_01" },
				Rare = { Num = 2, Weight = 0.1, Name = "Seed_Fruit_Tartarus_Rare_01" },
			},
		},
		Asphodel =
		{
			Basic =
			{
				Common = { Num = 2, Weight = 0.3, Name = "Seed_Herb_Asphodel_Common_01" },
			},
			Special =
			{
				Common = { Num = 2, Weight = 0.3, Name = "Seed_Herb_Asphodel_Common_01" },
				Rare = { Num = 2, Weight = 0.1, Name = "Seed_Vegetable_Asphodel_Rare_01" },
			},
		},
		Elysium =
		{
			Basic =
			{
				Common = { Num = 2, Weight = 0.3, Name = "Seed_Fruit_Elysium_Common_01" },
			},
			Special =
			{
				Common = { Num = 2, Weight = 0.3, Name = "Seed_Fruit_Elysium_Common_01" },
				Rare = { Num = 2, Weight = 0.1, Name = "Seed_Herb_Elysium_Rare_01" },
			},
		},
		Styx =
		{
			Basic =
			{
				Common = { Num = 3, Weight = 0.2, Name = "Seed_Vegetable_Styx_Common_01" },
				Rare = { Num = 3, Weight = 0.1, Name = "Seed_Herb_Styx_Rare_01" },
			},
		},
		Secrets =
		{
			Basic =
			{
				Common = { Num = 3, Weight = 0.3, Name = "Seed_Herb_Chaos_Common_01" },
				Rare = { Num = 3, Weight = 0.1, Name = "Seed_Vegetable_Chaos_Rare_01" },
				Legendary = { Num = 3, Weight = 0.03, Name = "Seed_Vegetable_Chaos_Legendary_01" },
			},
		},
		Secrets_G = {
			Basic =
			{
				Common = { Num = 5, Weight = 0.2, Name = "Seed_Herb_Gaia_Common_01" },
				Rare = { Num = 5, Weight = 0.1, Name = "Seed_Fruit_Gaia_Rare_01" },
				Legendary = { Num = 5, Weight = 0.05, Name = "Seed_Fruit_Gaia_Legendary_01" },
			},
		},
		Surface =
		{
			Basic =
			{
				Common = { Num = 5, Weight = 0.2, Name = "Seed_Fruit_Surface_Common_01" },
				Legendary = { Num = 5, Weight = 0.05, Name = "Seed_Herb_Surface_Legendary_01" },
			},
		},
		DeathArea =
		{
			Basic =
			{
				Common = { Num = 3, Weight = 0.05, Name = "Seed_Fruit_Home_Common_01" },
			},
		},
		Erebus =
		{
			Basic =
			{
				Common = { Num = 3, Weight = 0.15, Name = "Seed_Vegetable_Erebus_Common_01" },
			},
		},
	},

	SeedValues =
	{
		SeedDefaultCommon =
		{
			GrowTime = 6,
			SeedCaughtVoiceLines =
			{
				[1] = GlobalVoiceLines.FishCaughtVoiceLines,
			},
			SeedIdentifiedVoiceLines =
			{
				[1] = GlobalVoiceLines.FishIdentifiedVoiceLines,
			},
		},

		SeedDefaultRare =
		{
			GrowTime = 12,
			SeedCaughtVoiceLines =
			{
				[1] = GlobalVoiceLines.FishCaughtVoiceLines
			},
			SeedIdentifiedVoiceLines =
			{
				[1] = GlobalVoiceLines.FishIdentifiedVoiceLines
			},
		},

		SeedDefaultLegendary =
		{
			GrowTime = 18,
			SeedCaughtVoiceLines =
			{
				[1] = GlobalVoiceLines.FishCaughtVoiceLines
			},
			SeedIdentifiedVoiceLines =
			{
				[1] = GlobalVoiceLines.FishIdentifiedVoiceLines
			},
		},

		Seed_Vegetable_Tartarus_Common_01 =
		{
			InheritFrom = { "SeedDefaultCommon" },
			GrowValue = "Vegetable_Tartarus_Common_01",
			GrowTime = 8,
			--[[FishIdentifiedVoiceLines =
			{
				{
					BreakIfPlayed = true,
					RandomRemaining = true,
					PreLineWait = 1.0,
					SuccessiveChanceToPlayAll = 0.66,
					TriggerCooldowns = { "ZagreusGlobalFishCaughtVoiceLinesPlayed" },

					-- I caught a Hellfish!
					{ Cue = "/VO/ZagreusField_3059" },
					-- Another Hellfish.
					{ Cue = "/VO/ZagreusField_3060", RequiredPlayed = { "/VO/ZagreusField_3059" } },
					-- Hellfish.
					{ Cue = "/VO/ZagreusField_3061", RequiredPlayed = { "/VO/ZagreusField_3059" } },
					-- A Hellfish!
					{ Cue = "/VO/ZagreusField_3062", RequiredPlayed = { "/VO/ZagreusField_3059" } },
					-- What do you know, a Hellfish.
					{ Cue = "/VO/ZagreusField_3063", RequiredPlayed = { "/VO/ZagreusField_3059" } },
				},
				[2] = GlobalVoiceLines.FishIdentifiedVoiceLines,
			},]]
		},
		Seed_Vegetable_Styx_Common_01 =
		{
			InheritFrom = { "SeedDefaultCommon" },
			GrowValue = "Vegetable_Styx_Common_01",
			GrowTime = 8
		},
		Seed_Vegetable_Erebus_Common_01 =
		{
			InheritFrom = { "SeedDefaultCommon" },
			GrowValue = "Vegetable_Erebus_Common_01",
			GrowTime = 8
		},
		Seed_Vegetable_Asphodel_Rare_01 =
		{
			InheritFrom = { "SeedDefaultRare" },
			GrowValue = "Vegetable_Asphodel_Rare_01",
			GrowTime = 8
		},
		Seed_Vegetable_Chaos_Rare_01 =
		{
			InheritFrom = { "SeedDefaultRare" },
			GrowValue = "Vegetable_Chaos_Rare_01",
			GrowTime = 8
		},
		Seed_Vegetable_Chaos_Legendary_01 =
		{
			InheritFrom = { "SeedDefaultLegendary" },
			GrowValue = "Vegetable_Chaos_Legendary_01",
			GrowTime = 8
		},
		Seed_Fruit_Elysium_Common_01 =
		{
			InheritFrom = { "SeedDefaultCommon" },
			GrowValue = "Fruit_Elysium_Common_01",
			GrowTime = 8
		},
		Seed_Fruit_Surface_Common_01 =
		{
			InheritFrom = { "SeedDefaultCommon" },
			GrowValue = "Fruit_Surface_Common_01",
			GrowTime = 8
		},
		Seed_Fruit_Home_Common_01 =
		{
			InheritFrom = { "SeedDefaultCommon" },
			GrowValue = "Fruit_Home_Common_01",
			GrowTime = 8
		},
		Seed_Fruit_Gaia_Rare_01 =
		{
			InheritFrom = { "SeedDefaultRare" },
			GrowValue = "Fruit_Gaia_Rare_01",
			GrowTime = 8
		},
		Seed_Fruit_Tartarus_Rare_01 =
		{
			InheritFrom = { "SeedDefaultRare" },
			GrowValue = "Fruit_Tartarus_Rare_01",
			GrowTime = 8
		},
		Seed_Fruit_Gaia_Legendary_01 =
		{
			InheritFrom = { "SeedDefaultLegendary" },
			GrowValue = "Fruit_Gaia_Legendary_01",
			GrowTime = 8
		},
		Seed_Herb_Asphodel_Common_01 =
		{
			InheritFrom = { "SeedDefaultCommon" },
			GrowValue = "Herb_Asphodel_Common_01",
			GrowTime = 8
		},
		Seed_Herb_Chaos_Common_01 =
		{
			InheritFrom = { "SeedDefaultCommon" },
			GrowValue = "Herb_Chaos_Common_01",
			GrowTime = 8
		},
		Seed_Herb_Gaia_Common_01 =
		{
			InheritFrom = { "SeedDefaultCommon" },
			GrowValue = "Herb_Gaia_Common_01",
			GrowTime = 8
		},
		Seed_Herb_Elysium_Rare_01 =
		{
			InheritFrom = { "SeedDefaultRare" },
			GrowValue = "Herb_Elysium_Rare_01",
			GrowTime = 8
		},
		Seed_Herb_Styx_Rare_01 =
		{
			InheritFrom = { "SeedDefaultRare" },
			GrowValue = "Herb_Styx_Rare_01",
			GrowTime = 8
		},
		Seed_Herb_Surface_Legendary_01 =
		{
			InheritFrom = { "SeedDefaultLegendary" },
			GrowValue = "Herb_Surface_Legendary_01",
			GrowTime = 8
		},

	},

	GrowValues = {
		GrowDefaultCommon =
		{
			Award = {
				{ Gems = 5 },
			},
			GrowFinishVoiceLines =
			{
				[1] = GlobalVoiceLines.SeedFinishVoiceLines,
			},
			GrowIdentifiedVoiceLines =
			{
				[1] = GlobalVoiceLines.GrowIdentifiedVoiceLines,
			},
		},

		GrowDefaultRare =
		{
			Award = {
				{ Gems = 10 },
			},
			FishCaughtVoiceLines =
			{
				[1] = GlobalVoiceLines.FishCaughtVoiceLines
			},
			FishIdentifiedVoiceLines =
			{
				[1] = GlobalVoiceLines.FishIdentifiedVoiceLines
			},
		},

		GrowDefaultLegendary =
		{
			Award = {
				{ Gems = 100 },
			},
			FishCaughtVoiceLines =
			{
				[1] = GlobalVoiceLines.FishCaughtVoiceLines
			},
			FishIdentifiedVoiceLines =
			{
				[1] = GlobalVoiceLines.FishIdentifiedVoiceLines
			},
		},

		Vegetable_Tartarus_Common_01 =
		{
			InheritFrom = { "GrowDefaultCommon" },
			Rarity = "Common",
			Type = "Vegetable",
			Award = {
				{ LockKeys = 1 },
			},

			--[[FishIdentifiedVoiceLines =
			{
				{
					BreakIfPlayed = true,
					RandomRemaining = true,
					PreLineWait = 1.0,
					SuccessiveChanceToPlayAll = 0.66,
					TriggerCooldowns = { "ZagreusGlobalFishCaughtVoiceLinesPlayed" },

					-- I caught a Hellfish!
					{ Cue = "/VO/ZagreusField_3059" },
					-- Another Hellfish.
					{ Cue = "/VO/ZagreusField_3060", RequiredPlayed = { "/VO/ZagreusField_3059" } },
					-- Hellfish.
					{ Cue = "/VO/ZagreusField_3061", RequiredPlayed = { "/VO/ZagreusField_3059" } },
					-- A Hellfish!
					{ Cue = "/VO/ZagreusField_3062", RequiredPlayed = { "/VO/ZagreusField_3059" } },
					-- What do you know, a Hellfish.
					{ Cue = "/VO/ZagreusField_3063", RequiredPlayed = { "/VO/ZagreusField_3059" } },
				},
				[2] = GlobalVoiceLines.FishIdentifiedVoiceLines,
			},]]
		},
		Vegetable_Styx_Common_01 =
		{
			InheritFrom = { "GrowDefaultCommon" },
			Rarity = "Common",
			Type = "Vegetable",
			Award = {
				{ LockKeys = 1 },
			},
		},
		Vegetable_Erebus_Common_01 =
		{
			InheritFrom = { "GrowDefaultCommon" },
			Rarity = "Common",
			Type = "Vegetable",
			Award = {
				{ LockKeys = 1 },
			},
		},
		Vegetable_Asphodel_Rare_01 =
		{
			InheritFrom = { "GrowDefaultRare" },
			Rarity = "Rare",
			Type = "Vegetable",
			Award = {
				{ MetaPoints = 150 },
			},
		},
		Vegetable_Chaos_Rare_01 =
		{
			InheritFrom = { "GrowDefaultRare" },
			Rarity = "Rare",
			Type = "Vegetable",
			Award = {
				{ MetaPoints = 150 },
			},
		},
		Vegetable_Chaos_Legendary_01 =
		{
			InheritFrom = { "GrowDefaultLegendary" },
			Rarity = "Legendary",
			Type = "Vegetable",
			Award = {
				{ SuperLockKey = 1 },
			},
		},
		Fruit_Elysium_Common_01 =
		{
			InheritFrom = { "GrowDefaultCommon" },
			Rarity = "Common",
			Type = "Fruit",
			Award = {
				{ GiftPoints = 1 },
			},
		},
		Fruit_Surface_Common_01 =
		{
			InheritFrom = { "GrowDefaultCommon" },
			Rarity = "Common",
			Type = "Fruit",
			Award = {
				{ GiftPoints = 1 },
			},
		},
		Fruit_Home_Common_01 =
		{
			InheritFrom = { "GrowDefaultCommon" },
			Rarity = "Common",
			Type = "Fruit",
			Award = {
				{ GiftPoints = 1 },
			},
		},
		Fruit_Gaia_Rare_01 =
		{
			InheritFrom = { "GrowDefaultRare" },
			Rarity = "Rare",
			Type = "Fruit",
			Award = {
				{ GiftPoints = 2 },
			},
		},
		Fruit_Tartarus_Rare_01 =
		{
			InheritFrom = { "GrowDefaultRare" },
			Rarity = "Rare",
			Type = "Fruit",
			Award = {
				{ GiftPoints = 2 },
			},
		},
		Fruit_Gaia_Legendary_01 =
		{
			InheritFrom = { "GrowDefaultLegendary" },
			Rarity = "Legendary",
			Type = "Fruit",
			Award = {
				{ SuperGiftPoints = 1 },
			},
		},
		Herb_Asphodel_Common_01 =
		{
			InheritFrom = { "GrowDefaultCommon" },
			Rarity = "Common",
			Type = "Herb",
			Award = {
				{ Gems = 10 },
			},
		},
		Herb_Chaos_Common_01 =
		{
			InheritFrom = { "GrowDefaultCommon" },
			Rarity = "Common",
			Type = "Herb",
			Award = {
				{ Gems = 10 },
			},
		},
		Herb_Gaia_Common_01 =
		{
			InheritFrom = { "GrowDefaultCommon" },
			Rarity = "Common",
			Type = "Herb",
			Award = {
				{ Gems = 10 },
			},
		},
		Herb_Elysium_Rare_01 =
		{
			InheritFrom = { "GrowDefaultRare" },
			Rarity = "Rare",
			Type = "Herb",
			Award = {
				{ Gems = 25 },
			},
		},
		Herb_Styx_Rare_01 =
		{
			InheritFrom = { "GrowDefaultRare" },
			Rarity = "Rare",
			Type = "Herb",
			Award = {
				{ Gems = 25 },
			},
		},
		Herb_Surface_Legendary_01 =
		{
			InheritFrom = { "GrowDefaultLegendary" },
			Rarity = "Legendary",
			Type = "Herb",
			Award = {
				{ SuperGems = 1 },
			},
		},
	}
}
OlympusCodexUnlockTypes.Grow = "Grow"
OlympusCodex.Grow = {
	UnlockType = CodexUnlockTypes.Grow,
	TitleText = "Codex_GrowChapter",
	Entries =
	{
		Seed_Vegetable_Tartarus_Common_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_SeedVegetableTartarusCommon01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_SeedVegetableTartarusCommon01_02",
				},
			},
			Image = "Codex_Portrait_Seed_Vegetable_Tartarus_Common_01",
		},
		Vegetable_Tartarus_Common_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_VegetableTartarusCommon01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_VegetableTartarusCommon01_02",
				},
			},
			Image = "Codex_Portrait_Vegetable_Tartarus_Common_01",
		},
		Seed_Vegetable_Styx_Common_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_SeedVegetableStyxCommon01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_SeedVegetableStyxCommon01_02",
				},
			},
			Image = "Codex_Portrait_Seed_Vegetable_Styx_Common_01",
		},
		Vegetable_Styx_Common_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_VegetableStyxCommon01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_VegetableStyxCommon01_02",
				},
			},
			Image = "Codex_Portrait_Vegetable_Styx_Common_01",
		},
		Seed_Vegetable_Erebus_Common_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_SeedVegetableErebusCommon01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_SeedVegetableErebusCommon01_02",
				},
			},
			Image = "Codex_Portrait_Vegetable_Erebus_Common_01",
		},
		Vegetable_Erebus_Common_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_VegetableErebusCommon01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_VegetableErebusCommon01_02",
				},
			},
			Image = "Codex_Portrait_Vegetable_Erebus_Common_01",
		},
		Seed_Vegetable_Asphodel_Rare_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_SeedVegetableAsphodelRare01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_SeedVegetableAsphodelRare01_02",
				},
			},
			Image = "Codex_Portrait_Seed_Vegetable_Asphodel_Rare_01",
		},
		Vegetable_Asphodel_Rare_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_VegetableAsphodelRare01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_VegetableAsphodelRare01_02",
				},
			},
			Image = "Codex_Portrait_Vegetable_Asphodel_Rare_01",
		},
		Seed_Vegetable_Chaos_Rare_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_SeedVegetableChaosRare01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_SeedVegetableChaosRare01_02",
				},
			},
			Image = "Codex_Portrait_Seed_Vegetable_Chaos_Rare_01",
		},
		Vegetable_Chaos_Rare_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_VegetableChaosRare01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_VegetableChaosRare01_02",
				},
			},
			Image = "Codex_Portrait_Vegetable_Chaos_Rare_01",
		},
		Seed_Vegetable_Chaos_Legendary_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_SeedVegetableChaosLegendary01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_SeedVegetableChaosLegendary01_02",
				},
			},
			Image = "Codex_Portrait_Seed_Vegetable_Chaos_Legendary_01",
		},
		Vegetable_Chaos_Legendary_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_VegetableChaosLegendary01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_VegetableChaosLegendary01_02",
				},
			},
			Image = "Codex_Portrait_Vegetable_Chaos_Legendary_01",
		},
		Seed_Fruit_Elysium_Common_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_SeedFruitElysiumCommon01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_SeedFruitElysiumCommon01_02",
				},
			},
			Image = "Codex_Portrait_Seed_Fruit_Elysium_Common_01",
		},
		Fruit_Elysium_Common_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_FruitElysiumCommon01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_FruitElysiumCommon01_02",
				},
			},
			Image = "Codex_Portrait_Fruit_Elysium_Common_01",
		},
		Seed_Fruit_Surface_Common_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_SeedFruitSurfaceCommon01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_SeedFruitSurfaceCommon01_02",
				},
			},
			Image = "Codex_Portrait_Seed_Fruit_Surface_Common_01",
		},
		Fruit_Surface_Common_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_FruitSurfaceCommon01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_FruitSurfaceCommon01_02",
				},
			},
			Image = "Codex_Portrait_Fruit_Surface_Common_01",
		},
		Seed_Fruit_Home_Common_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_SeedFruitHomeCommon01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_SeedFruitHomeCommon01_02",
				},
			},
			Image = "Codex_Portrait_Seed_Fruit_Home_Common_01",
		},
		Fruit_Home_Common_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_FruitHomeCommon01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_FruitHomeCommon01_02",
				},
			},
			Image = "Codex_Portrait_Fruit_Home_Common_01",
		},
		Seed_Fruit_Gaia_Rare_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_SeedFruitGaiaRare01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_SeedFruitGaiaRare01_02",
				},
			},
			Image = "Codex_Portrait_Seed_Fruit_Gaia_Rare_01",
		},
		Fruit_Gaia_Rare_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_FruitGaiaRare01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_FruitGaiaRare01_02",
				},
			},
			Image = "Codex_Portrait_Fruit_Gaia_Rare_01",
		},
		Seed_Fruit_Tartarus_Rare_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_SeedFruitTartarusRare01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_SeedFruitTartarusRare01_02",
				},
			},
			Image = "Codex_Portrait_Seed_Fruit_Tartarus_Rare_01",
		},
		Fruit_Tartarus_Rare_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_FruitTartarusRare01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_FruitTartarusRare01_02",
				},
			},
			Image = "Codex_Portrait_Fruit_Tartarus_Rare_01",
		},
		Seed_Fruit_Gaia_Legendary_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_SeedFruitGaiaLegendary01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_SeedFruitGaiaLegendary01_02",
				},
			},
			Image = "Codex_Portrait_Seed_Fruit_Gaia_Legendary_01",
		},
		Fruit_Gaia_Legendary_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_FruitGaiaLegendary01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_FruitGaiaLegendary01_02",
				},
			},
			Image = "Codex_Portrait_Fruit_Gaia_Legendary_01",
		},
		Seed_Herb_Asphodel_Common_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_SeedHerbAsphodelCommon01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_SeedHerbAsphodelCommon01_02",
				},
			},
			Image = "Codex_Portrait_Seed_Herb_Asphodel_Common_01",
		},
		Herb_Asphodel_Common_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_HerbAsphodelCommon01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_HerbAsphodelCommon01_02",
				},
			},
			Image = "Codex_Portrait_Herb_Asphodel_Common_01",
		},
		Seed_Herb_Chaos_Common_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_SeedHerbChaosCommon01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_SeedHerbChaosCommon01_02",
				},
			},
			Image = "Codex_Portrait_Seed_Herb_Chaos_Common_01",
		},
		Herb_Chaos_Common_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_HerbChaosCommon01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_HerbChaosCommon01_02",
				},
			},
			Image = "Codex_Portrait_Herb_Chaos_Common_01",
		},
		Seed_Herb_Gaia_Common_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_SeedHerbGaiaCommon01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_SeedHerbGaiaCommon01_02",
				},
			},
			Image = "Codex_Portrait_Seed_Herb_Gaia_Common_01",
		},
		Herb_Gaia_Common_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_HerbGaiaCommon01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_HerbGaiaCommon01_02",
				},
			},
			Image = "Codex_Portrait_Herb_Gaia_Common_01",
		},
		Seed_Herb_Elysium_Rare_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_SeedHerbElysiumRare01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_SeedHerbElysiumRare01_02",
				},
			},
			Image = "Codex_Portrait_Seed_Herb_Elysium_Rare_01",
		},
		Herb_Elysium_Rare_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_HerbElysiumRare01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_HerbElysiumRare01_02",
				},
			},
			Image = "Codex_Portrait_Herb_Elysium_Rare_01",
		},
		Seed_Herb_Styx_Rare_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_SeedHerbStyxRare01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_SeedHerbStyxRare01_02",
				},
			},
			Image = "Codex_Portrait_Seed_Herb_Styx_Rare_01",
		},
		Herb_Styx_Rare_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_HerbStyxRare01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_HerbStyxRare01_02",
				},
			},
			Image = "Codex_Portrait_Herb_Styx_Rare_01",
		},
		Seed_Herb_Surface_Legendary_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_SeedHerbSurfaceLegendary01_01",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_SeedHerbSurfaceLegendary01_02",
				},
			},
			Image = "Codex_Portrait_Seed_Herb_Surface_Legendary_01",
		},
		Herb_Surface_Legendary_01 =
		{
			Entries =
			{
				{
					UnlockThreshold = 1,
					Text = "CodexData_HerbSurfaceLegendary01_02",
				},
				{
					UnlockThreshold = 2,
					Text = "CodexData_HerbSurfaceLegendary01_02",
				},
			},
			Image = "Codex_Portrait_Herb_Surface_Legendary_01",
		},
	}
}
OlympusCodexOrdering.Grow = {
	Order = {
		"Seed_Vegetable_Tartarus_Common_01", "Vegetable_Tartarus_Common_01",
		"Seed_Vegetable_Styx_Common_01", "Vegetable_Styx_Common_01",
		"Seed_Vegetable_Erebus_Common_01", "Vegetable_Erebus_Common_01",
		"Seed_Vegetable_Asphodel_Rare_01", "Vegetable_Asphodel_Rare_01",
		"Seed_Vegetable_Chaos_Rare_01", "Vegetable_Chaos_Rare_01",
		"Seed_Vegetable_Chaos_Legendary_01", "Vegetable_Chaos_Legendary_01",
		"Seed_Fruit_Elysium_Common_01", "Fruit_Elysium_Common_01",
		"Seed_Fruit_Surface_Common_01", "Fruit_Surface_Common_01",
		"Seed_Fruit_Home_Common_01", "Fruit_Home_Common_01",
		"Seed_Fruit_Gaia_Rare_01", "Fruit_Gaia_Rare_01",
		"Seed_Fruit_Tartarus_Rare_01", "Fruit_Tartarus_Rare_01",
		"Seed_Fruit_Gaia_Legendary_01", "Fruit_Gaia_Legendary_01",
		"Seed_Herb_Asphodel_Common_01", "Herb_Asphodel_Common_01",
		"Seed_Herb_Chaos_Common_01", "Herb_Chaos_Common_01",
		"Seed_Herb_Gaia_Common_01", "Herb_Gaia_Common_01",
		"Seed_Herb_Elysium_Rare_01", "Herb_Elysium_Rare_01",
		"Seed_Herb_Styx_Rare_01", "Herb_Styx_Rare_01",
		"Seed_Herb_Surface_Legendary_01", "Herb_Surface_Legendary_01",
	},
}
table.insert(OlympusCodexOrdering.Order, 10, "Grow")

OlympusObstacleData.SeedPoint =
	{
		UseText = "UseSeedPointLocked",
		FishUnlockedUseText = "UseSeedPoint",

		DistanceTrigger =
		{
			GameStateRequirements =
			{
				-- RequiredCosmetics = { "FishingUnlockItem", },
			},
			WithinDistance = 500,
			VoiceLines =
			{
				TriggerCooldowns = { "ZagreusStartedFishingSpeech", },
				{
					BreakIfPlayed = true,
					RandomRemaining = true,
					SuccessiveChanceToPlayAll = 0.25,
					RequiredKillEnemiesNotFound = true,
					CooldownTime = 600,
					RequiresNotFishing = true,
					AreIdsNotAlive = { 554419, 554420, 554421 },
					RequiredBiome = "Secrets",
					PreLineWait = 1.0,

					-- That a fishing point?
					{ Cue = "/VO/ZagreusField_3410" },
					-- A fishing point, here?
					{ Cue = "/VO/ZagreusField_3411" },
				},
				{
					BreakIfPlayed = true,
					RandomRemaining = true,
					SuccessiveChanceToPlayAll = 0.25,
					RequiredKillEnemiesNotFound = true,
					CooldownTime = 600,
					RequiresNotFishing = true,
					AreIdsNotAlive = { 554419, 554420, 554421 },

					-- Could use the Rod of Fishing there.
					{ Cue = "/VO/ZagreusField_3212" },
					-- A fishing point.
					{ Cue = "/VO/ZagreusField_3213", RequiredPlayed = { "/VO/ZagreusField_3212" } },
					-- Hey think I see a fish.
					{ Cue = "/VO/ZagreusField_3214", RequiredPlayed = { "/VO/ZagreusField_3212" } },
					-- Fishing point there.
					{ Cue = "/VO/ZagreusField_3215", RequiredPlayed = { "/VO/ZagreusField_3212" } },
					-- Fishing time...?
					{ Cue = "/VO/ZagreusField_3216", RequiredPlayed = { "/VO/ZagreusField_3212" } },
				},
			}
		},
	}

-- UI Stuff
KitchenUI =
{
	SpacerX = 68,
	BaseIconOffsetX = 60,
	MaxEntries = 11,
	MaxChapters = 5,
	EntryX = 510,
	StartingEntryY = 210,
	EntryYSpacer = 50,
	EntryY = 120,
	ArrowLeftSpacerX = 120,
	ArrowRightSpacerX = 240,
}

ModUtil.Path.Wrap("TurnInFish",
	function(baseFunc, usee, args)
		if not GameState.CaughtFish then
			return
		end
		if args and args.OriginalCall then
			baseFunc(usee, args)
		else
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Open Fish Selection Screen"))
			OpenKitchenScreen(usee)
		end
	end
)
function OpenKitchenScreen(usee)
	KitchenUI.Screen = { Name = "Kitchen", Components = {} }
	local screen = KitchenUI.Screen
	screen.GiveToChef = {}
	screen.CurrentTab = "Fish"
	local components = screen.Components
	screen.TabIds = {}
	OnScreenOpened({ Flag = screen.Name, PersistCombatUI = true })
	SetConfigOption({ Name = "UseOcclusion", Value = false })
	FreezePlayerUnit()
	EnableShopGamepadCursor()
	--Background
	components.Background = CreateScreenComponent({ Name = "KitchenBackground", X = ScreenCenterX, Y = ScreenCenterY, Group =
	"Combat_Menu_Overlay" })
	--Title	
	CreateTextBox({
		Id = components.Background.Id,
		Text = "KitchenMenu_Title",
		FontSize = 34,
		OffsetX = 0,
		OffsetY = -470,
		Color = Color.White,
		Font = "SpectralSCLight",
		ShadowBlur = 0,
		ShadowColor = { 0, 0, 0, 1 },
		ShadowOffset = { 0, 1 },
		Justification = "Center"
	})
	CreateTextBox({
		Id = components.Background.Id,
		Text = "KitchenMenu_Subtitle",
		FontSize = 19,
		OffsetX = 0,
		OffsetY = -440,
		Width = 840,
		Color = Color.SubTitle,
		Font = "CrimsonTextItalic",
		ShadowBlur = 0,
		ShadowColor = { 0, 0, 0, 1 },
		ShadowOffset = { 0, 1 },
		Justification = "Center"
	})
	-- Tabs
	components.FishTab = CreateScreenComponent({ Name = "ShrineUpgradeMenuConfirm", Scale = 1, Group =
	"Combat_Menu_Overlay" })
	Attach({ Id = components.FishTab.Id, DestinationId = components.Background.Id, OffsetX = -420, OffsetY = -390 })
	components.FishTab.OnPressedFunctionName = "MoveToFishTab"
	CreateTextBox({ Id = components.FishTab.Id, Text = "KitchenMenu_FishTab", FontSize = 32, Color = Color.White, Font =
	"AlegreyaSansSCBold", ShadowBlur = 0, ShadowColor = { 68, 68, 68, 255 }, ShadowOffset = { 0, 1 }, Justification =
	"Center", TextSymbolScale = 0.8, })
	components.FishTab.Usee = usee
	components.FishTab.ControlHotkeys = { "MenuRight", "Right" }
	components.GrowTab = CreateScreenComponent({ Name = "ShrineUpgradeMenuConfirm", Scale = 1, Group =
	"Combat_Menu_Overlay" })
	Attach({ Id = components.GrowTab.Id, DestinationId = components.Background.Id, OffsetX = 420, OffsetY = -390 })
	components.GrowTab.OnPressedFunctionName = "MoveToGrowTab"
	CreateTextBox({ Id = components.GrowTab.Id, Text = "KitchenMenu_GrowTab", FontSize = 32, Color = Color.White, Font =
	"AlegreyaSansSCBold", ShadowBlur = 0, ShadowColor = { 68, 68, 68, 255 }, ShadowOffset = { 0, 1 }, Justification =
	"Center", TextSymbolScale = 0.8, })
	components.GrowTab.Usee = usee
	components.GrowTab.ControlHotkeys = { "MenuLeft", "Left" }
	-- Close button
	components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "Combat_Menu_Overlay" })
	Attach({ Id = components.CloseButton.Id, DestinationId = components.Background.Id, OffsetX = 0, OffsetY = 456 })
	components.CloseButton.OnPressedFunctionName = "CloseKitchenScreen"
	components.CloseButton.ControlHotkey = "Cancel"

	DisplayItems(screen, usee)
	wait(0.25, RoomThreadName)
	screen.KeepOpen = true
	thread(HandleWASDInput, screen)
	HandleScreenInput(screen)
end

function DisplayItems(screen, usee)
	local components = screen.Components
	local offsetX = 240
	local offsetY = 290
	local x, y
	local fishCount
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(TableLength(GameState.CaughtFish)))
	if screen.CurrentTab == "Fish" then
		for i, fishName in ipairs(GameData.FishOrder) do
			x = ((i - 1) % 6) * 190
			y = math.floor((i - 1) / 6) * 190
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(fishName..":"..x..";"..y))
			components[fishName .. "_Icon"] = {}
			components[fishName .. "_Icon"].Id = CreateScreenObstacle({ Name = "BlankObstacle", X = offsetX + x, Y =
			offsetY + y, Group = "Combat_Menu_Overlay" })
			if FishIsUnlock(fishName) then
				SetAnimation({ Name = fishName, DestinationId = components[fishName .. "_Icon"].Id, OffsetY = 0, OffsetX = 0 })
				SetScale({ Id = components[fishName .. "_Icon"].Id, Fraction = 0.30 })
				fishCount = GetFishCount(fishName)
				table.insert(screen.TabIds, components[fishName .. "_Icon"].Id)
				components[fishName .. "_Name"] = CreateScreenComponent({ Name = "BlankObstacle", X = offsetX + x, Y =
				offsetY + y - 75, Group = "Combat_Menu_Overlay" })
				CreateTextBox({
					Id = components[fishName .. "_Name"].Id,
					Text = fishName,
					FontSize = 22,
					Color = Color.White,
					Font = "AlegreyaSansSCExtraBold",
					ShadowBlur = 0,
					ShadowColor = { 0, 0, 0, 1 },
					ShadowOffset = { 3, 3 },
				})
				table.insert(screen.TabIds, components[fishName .. "_Name"].Id)
				if fishCount > 0 then
					screen.GiveToChef[fishName] = 0
					local reward = GetFishReward(fishName)
					components[fishName .. "_Count"] = CreateScreenComponent({ Name = "BlankObstacle", X = offsetX + x, Y =
					offsetY + y + 75, Group = "Combat_Menu_Overlay" })
					CreateTextBox({
						Id = components[fishName .. "_Count"].Id,
						Text = ResourceData[reward.ResourceName].GainedText,
						LuaKey = "TempTextData",
						LuaValue = { Amount = 0 },
						FontSize = 22,
						Color = Color.Red,
						Font = "AlegreyaSansSCExtraBold",
						ShadowBlur = 0,
						ShadowColor = { 0, 0, 0, 1 },
						ShadowOffset = { 3, 3 },
					})
					table.insert(screen.TabIds, components[fishName .. "_Count"].Id)
					components[fishName .. "_Left"] = CreateScreenComponent({ Name = "ArrowLeft", X = offsetX + x - 60, Y =
					offsetY + y + 75, Scale = 0.5, Group = "Combat_Menu_Overlay" })
					components[fishName .. "_Left"].OnPressedFunctionName = "DecreaseCount"
					components[fishName .. "_Left"].ItemName = fishName
					table.insert(screen.TabIds, components[fishName .. "_Left"].Id)
					components[fishName .. "_Right"] = CreateScreenComponent({ Name = "ArrowRight", X = offsetX + x + 60, Y =
					offsetY + y + 75, Scale = 0.5, Group = "Combat_Menu_Overlay" })
					components[fishName .. "_Right"].OnPressedFunctionName = "IncreaseCount"
					components[fishName .. "_Right"].ItemName = fishName
					table.insert(screen.TabIds, components[fishName .. "_Right"].Id)
				else
					SetThingProperty({ Property = "AddColor", Value = true, DestinationId = components
					[fishName .. "_Icon"].Id })
					SetColor({ Id = components[fishName .. "_Icon"].Id, Color = { 200, 200, 200, 255 } })
				end
			else

			end
			--local iconBackingId = CreateScreenObstacle({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY - 315, Group = layer })

			--[[if highlightIcon then
				SetThingProperty({ Property = "AddColor", Value = true, DestinationId = iconId })
				SetColor({ Id = iconId, Color = { 255,200,196,0 } })
				SetColor({ Id = iconId, Color = { 0,0,0,255 }, Duration = 1.5 })
				SetAlpha({ Id = iconId, Fraction = 0 })
				SetAlpha({ Id = iconId, Fraction = 1, Duration = 0.125 })
				SetScale({ Id = iconId, Fraction = 0.5 * iconScale })
				SetScale({ Id = iconId, Fraction = 0.6 * iconScale, Duration = 3.5, EaseIn = 0, EaseOut = 1.0})
			end]]
			--Move({ Id = iconId, Speed = iconMoveSpeed * 2, Angle = 0, Duration = 6, EaseOut = 1 })
		end
		-- Reward List
		components.RewardTitle = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_Overlay" })
		Attach({ Id = components.RewardTitle.Id, DestinationId = components.Background.Id, OffsetX = 530, OffsetY = -310 })
		CreateTextBox({ Id = components.RewardTitle.Id, Text = "KitchenMenu_RewardTitle", FontSize = 30, Color = Color.White, Font =
		"AlegreyaSansSCBold", ShadowBlur = 0, ShadowColor = { 68, 68, 68, 255 }, ShadowOffset = { 0, 1 }, Justification =
		"Center", TextSymbolScale = 0.8, })
		table.insert(screen.TabIds, components.RewardTitle.Id)
		for rewardlist = 1, 7 do
			components["RewardList" .. rewardlist] = CreateScreenComponent({ Name = "BlankObstacle", Group =
			"Combat_Menu_Overlay" })
			Attach({ Id = components["RewardList" .. rewardlist].Id, DestinationId = components.Background.Id, OffsetX = 530, OffsetY = -290 +
			(rewardlist * 40) })
			CreateTextBox({ Id = components["RewardList" .. rewardlist].Id, Text = "", FontSize = 28, Color = Color.White, Font =
			"AlegreyaSansSCBold", ShadowBlur = 0, ShadowColor = { 68, 68, 68, 255 }, ShadowOffset = { 0, 1 }, Justification =
			"Center", TextSymbolScale = 0.8, })
			table.insert(screen.TabIds, components["RewardList" .. rewardlist].Id)
		end
		-- Give Catches
		components.TradeButton = CreateScreenComponent({ Name = "ShrineUpgradeMenuConfirm", Scale = 1, Group =
		"Combat_Menu_Overlay" })
		Attach({ Id = components.TradeButton.Id, DestinationId = components.Background.Id, OffsetX = 530, OffsetY = 456 })
		components.TradeButton.OnPressedFunctionName = "OETurnInFish"
		components.TradeButton.Usee = usee
		CreateTextBox({ Id = components.TradeButton.Id, Text = "KitchenMenu_FishConfirm", FontSize = 26, Color = Color.White, Font =
		"AlegreyaSansSCBold", ShadowBlur = 0, ShadowColor = { 68, 68, 68, 255 }, ShadowOffset = { 0, 1 }, Justification =
		"Center", TextSymbolScale = 0.8, })
		components.TradeButton.ControlHotkey = "Confirm"
		table.insert(screen.TabIds, components.TradeButton.Id)
		-- Add All resources
		components.AddAll = CreateScreenComponent({ Name = "ArrowRight", Scale = 1.0, Group = "Combat_Menu_Overlay" })
		Attach({ Id = components.AddAll.Id, DestinationId = components.Background.Id, OffsetX = 350, OffsetY = -20 })
		components.AddAll.OnPressedFunctionName = "AddAllFish"
		table.insert(screen.TabIds, components.AddAll.Id)
		components.RemoveAll = CreateScreenComponent({ Name = "ArrowLeft", Scale = 1.0, Group = "Combat_Menu_Overlay" })
		Attach({ Id = components.RemoveAll.Id, DestinationId = components.Background.Id, OffsetX = 350, OffsetY = 80 })
		components.RemoveAll.OnPressedFunctionName = "RemoveAllFish"
		table.insert(screen.TabIds, components.RemoveAll.Id)
	else
		-- GROW GOODS
		local offsetX2 = 190
		for i, growName in ipairs(GameData.GrowOrder) do			
			x = ((i - 1) % 6) * 190
			y = math.floor((i - 1) / 6) * 190
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(fishName..":"..x..";"..y))
			components[growName .. "_Icon"] = {}
			components[growName .. "_Icon"].Id = CreateScreenObstacle({ Name = "BlankObstacle", X = offsetX + offsetX2 + x, Y =
			offsetY + y, Group = "Combat_Menu_Overlay" })
			if GrowIsUnlock(growName) then
				SetAnimation({ Name = growName, DestinationId = components[growName .. "_Icon"].Id, OffsetY = 0, OffsetX = 0 })
				SetScale({ Id = components[growName .. "_Icon"].Id, Fraction = 0.30 })
				fishCount = GetGrowCount(growName)
				table.insert(screen.TabIds, components[growName .. "_Icon"].Id)
				components[growName .. "_Name"] = CreateScreenComponent({ Name = "BlankObstacle", X = offsetX + x, Y =
				offsetY + y - 75, Group = "Combat_Menu_Overlay" })
				CreateTextBox({
					Id = components[growName .. "_Name"].Id,
					Text = growName,
					FontSize = 22,
					Color = Color.White,
					Font = "AlegreyaSansSCExtraBold",
					ShadowBlur = 0,
					ShadowColor = { 0, 0, 0, 1 },
					ShadowOffset = { 3, 3 },
				})
				table.insert(screen.TabIds, components[growName .. "_Name"].Id)
				if fishCount > 0 then
					screen.GiveToChef[growName] = 0
					local reward = GetGoodsReward(growName)
					components[growName .. "_Count"] = CreateScreenComponent({ Name = "BlankObstacle", X = offsetX + x, Y =
					offsetY + y + 75, Group = "Combat_Menu_Overlay" })
					CreateTextBox({
						Id = components[growName .. "_Count"].Id,
						Text = ResourceData[reward.ResourceName].GainedText,
						LuaKey = "TempTextData",
						LuaValue = { Amount = 0 },
						FontSize = 22,
						Color = Color.Red,
						Font = "AlegreyaSansSCExtraBold",
						ShadowBlur = 0,
						ShadowColor = { 0, 0, 0, 1 },
						ShadowOffset = { 3, 3 },
					})
					table.insert(screen.TabIds, components[growName .. "_Count"].Id)
					components[growName .. "_Left"] = CreateScreenComponent({ Name = "ArrowLeft", X = offsetX + x - 60, Y =
					offsetY + y + 75, Scale = 0.5, Group = "Combat_Menu_Overlay" })
					components[growName .. "_Left"].OnPressedFunctionName = "DecreaseCount"
					components[growName .. "_Left"].ItemName = growName
					table.insert(screen.TabIds, components[growName .. "_Left"].Id)
					components[growName .. "_Right"] = CreateScreenComponent({ Name = "ArrowRight", X = offsetX + x + 60, Y =
					offsetY + y + 75, Scale = 0.5, Group = "Combat_Menu_Overlay" })
					components[growName .. "_Right"].OnPressedFunctionName = "IncreaseCount"
					components[growName .. "_Right"].ItemName = growName
					table.insert(screen.TabIds, components[growName .. "_Right"].Id)
				else
					SetThingProperty({ Property = "AddColor", Value = true, DestinationId = components
					[growName .. "_Icon"].Id })
					SetColor({ Id = components[growName .. "_Icon"].Id, Color = { 200, 200, 200, 255 } })
				end
			else

			end
			--local iconBackingId = CreateScreenObstacle({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY - 315, Group = layer })

			--[[if highlightIcon then
				SetThingProperty({ Property = "AddColor", Value = true, DestinationId = iconId })
				SetColor({ Id = iconId, Color = { 255,200,196,0 } })
				SetColor({ Id = iconId, Color = { 0,0,0,255 }, Duration = 1.5 })
				SetAlpha({ Id = iconId, Fraction = 0 })
				SetAlpha({ Id = iconId, Fraction = 1, Duration = 0.125 })
				SetScale({ Id = iconId, Fraction = 0.5 * iconScale })
				SetScale({ Id = iconId, Fraction = 0.6 * iconScale, Duration = 3.5, EaseIn = 0, EaseOut = 1.0})
			end]]
			--Move({ Id = iconId, Speed = iconMoveSpeed * 2, Angle = 0, Duration = 6, EaseOut = 1 })
		end
		-- Reward List
		components.RewardTitle = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_Overlay" })
		Attach({ Id = components.RewardTitle.Id, DestinationId = components.Background.Id, OffsetX = -530, OffsetY = -310 })
		CreateTextBox({ Id = components.RewardTitle.Id, Text = "KitchenMenu_RewardTitle", FontSize = 30, Color = Color.White, Font =
		"AlegreyaSansSCBold", ShadowBlur = 0, ShadowColor = { 68, 68, 68, 255 }, ShadowOffset = { 0, 1 }, Justification =
		"Center", TextSymbolScale = 0.8, })
		table.insert(screen.TabIds, components.RewardTitle.Id)
		for rewardlist = 1, 7 do
			components["RewardList" .. rewardlist] = CreateScreenComponent({ Name = "BlankObstacle", Group =
			"Combat_Menu_Overlay" })
			Attach({ Id = components["RewardList" .. rewardlist].Id, DestinationId = components.Background.Id, OffsetX = 530, OffsetY = -290 +
			(rewardlist * 40) })
			CreateTextBox({ Id = components["RewardList" .. rewardlist].Id, Text = "", FontSize = 28, Color = Color.White, Font =
			"AlegreyaSansSCBold", ShadowBlur = 0, ShadowColor = { 68, 68, 68, 255 }, ShadowOffset = { 0, 1 }, Justification =
			"Center", TextSymbolScale = 0.8, })
			table.insert(screen.TabIds, components["RewardList" .. rewardlist].Id)
		end
		-- Give Goods
		components.TradeButton = CreateScreenComponent({ Name = "ShrineUpgradeMenuConfirm", Scale = 1, Group =
		"Combat_Menu_Overlay" })
		Attach({ Id = components.TradeButton.Id, DestinationId = components.Background.Id, OffsetX = -530, OffsetY = 456 })
		components.TradeButton.OnPressedFunctionName = "OETurnInFish"
		components.TradeButton.Usee = usee
		CreateTextBox({ Id = components.TradeButton.Id, Text = "KitchenMenu_FishConfirm", FontSize = 26, Color = Color.White, Font =
		"AlegreyaSansSCBold", ShadowBlur = 0, ShadowColor = { 68, 68, 68, 255 }, ShadowOffset = { 0, 1 }, Justification =
		"Center", TextSymbolScale = 0.8, })
		components.TradeButton.ControlHotkey = "Confirm"
		table.insert(screen.TabIds, components.TradeButton.Id)
		-- Add All resources
		components.AddAll = CreateScreenComponent({ Name = "ArrowLeft", Scale = 1.0, Group = "Combat_Menu_Overlay" })
		Attach({ Id = components.AddAll.Id, DestinationId = components.Background.Id, OffsetX = -350, OffsetY = -20 })
		components.AddAll.OnPressedFunctionName = "AddAllGrow"
		table.insert(screen.TabIds, components.AddAll.Id)
		components.RemoveAll = CreateScreenComponent({ Name = "ArrowRight", Scale = 1.0, Group = "Combat_Menu_Overlay" })
		Attach({ Id = components.RemoveAll.Id, DestinationId = components.Background.Id, OffsetX = -350, OffsetY = 80 })
		components.RemoveAll.OnPressedFunctionName = "RemoveAllGrow"
		table.insert(screen.TabIds, components.RemoveAll.Id)
	end
end

function IncreaseCount(screen, button)
	if screen.GiveToChef[button.ItemName] >= GetFishCount(button.ItemName) then
		return
	end
	screen.GiveToChef[button.ItemName] = screen.GiveToChef[button.ItemName] + 1
	ChangeNumberTextBox(screen, button.ItemName)
end

function DecreaseCount(screen, button)
	if screen.GiveToChef[button.ItemName] <= 0 then
		return
	end
	screen.GiveToChef[button.ItemName] = screen.GiveToChef[button.ItemName] - 1
	ChangeNumberTextBox(screen, button.ItemName)
end

function ChangeNumberTextBox(screen, fishName)
	local id = screen.Components[fishName .. "_Count"].Id
	local newCount = screen.GiveToChef[fishName]
	local reward = GetFishReward(fishName)

	local color = reward.Color or Color.White
	if screen.GiveToChef[fishName] == GetFishCount(fishName) then
		color = Color.Green
	end
	if screen.GiveToChef[fishName] == 0 then
		color = Color.Red
	end
	ModifyTextBox({ Id = id, LuaKey = "TempTextData", LuaValue = { Amount = newCount * reward.ResourceAmount }, Color =
	color })
	local earnedResources = GetTotalReward(screen.GiveToChef)
	local index = 1
	for resourceName, resourceAmount in pairs(earnedResources) do
		--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(index))
		ModifyTextBox({ Id = screen.Components["RewardList" .. index].Id, Text = ResourceData[resourceName].GainedText, LuaKey =
		"TempTextData", LuaValue = { Amount = resourceAmount } })
		index = index + 1
	end
	for i = 0, (7 - index) do
		--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(index+i))
		ModifyTextBox({ Id = screen.Components["RewardList" .. (index + i)].Id, Text = " " })
	end
end

function FishIsUnlock(fishName)
	return GameState.TotalCaughtFish and GameState.TotalCaughtFish[fishName] and GameState.TotalCaughtFish[fishName] > 0
end
function GrowIsUnlock(growName)
	return GameState.TotalGrownGoods and GameState.TotalGrownGoods[growName] and GameState.TotalGrownGoods[growName] > 0
end

function GetFishCount(fishName)
	if GameState.CaughtFish[fishName] then
		return GameState.CaughtFish[fishName]
	end
	return 0
end
function GetGrowCount(growName)
	if GameState.GrownGoods[growName] then
		return GameState.GrownGoods[growName]
	end
	return 0
end
function RecordGoods( growName )
	GameState.TotalGrownGoods = GameState.TotalGrownGoods or {}
	IncrementTableValue( GameState.TotalGrownGoods, growName )

	GameState.GrownGoods = GameState.GrownGoods or {}
	IncrementTableValue( GameState.GrownGoods, growName )

	CurrentRun.GrownGoods = CurrentRun.GrownGoods or {}
	IncrementTableValue( CurrentRun.GrownGoods, growName )
end

function CloseKitchenScreen(screen, button)
	CloseScreen(GetAllIds(screen.Components))
	PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENU" })
	UnfreezePlayerUnit()
	screen.KeepOpen = false
	OnScreenClosed({ Flag = screen.Name })
end

function CheckTradeNotEmpty(screen)
	for fishName, fishNum in pairs(screen.GiveToChef) do
		if fishNum > 0 then
			return true
		end
	end
	return false
end

function MoveToFishTab(screen, button)
	if not (screen.CurrentTab == "Fish") then
		screen.CurrentTab = "Fish"
		Destroy({ Ids = screen.TabIds })
		screen.TabIds = {}
		screen.GiveToChef = {}
		DisplayItems(screen, button.Usee)
	end
	ModUtil.Hades.PrintStackChunks(ModUtil.ToString("FishTab"))
end

function MoveToGrowTab(screen, button)
	if not (screen.CurrentTab == "Grow") then
		screen.CurrentTab = "Grow"
		Destroy({ Ids = screen.TabIds })
		screen.TabIds = {}
		screen.GiveToChef = {}
		DisplayItems(screen, button.Usee)
	end
	ModUtil.Hades.PrintStackChunks(ModUtil.ToString(screen.CurrentTab))
end

function OETurnInFish(screen, button)
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("TurnIn"))
	if not CheckTradeNotEmpty(screen) then
		return
	end
	local fishes = screen.GiveToChef
	CloseKitchenScreen(screen, nil)
	AnimateTurnInFish(button.Usee, fishes)
end

function GetTotalReward(fishes)
	local earnedResources = {}
	for fishName, fishNum in pairs(fishes) do
		if fishNum > 0 then
			for i = 1, fishNum do
				local fishData = FishingData.FishValues[fishName]
				if fishData and fishData.Award then
					local reward = GetRandomValue(fishData.Award)
					for resourceName, resourceAmount in pairs(reward) do
						IncrementTableValue(earnedResources, resourceName, resourceAmount)
					end
				end
			end
		end
	end
	return earnedResources
end

function AnimateTurnInFish(usee, fishes)
	--UseableOff({ Id = usee.ObjectId })

	FreezePlayerUnit("Fishing")
	thread(MarkObjectiveComplete, "FishPrompt")

	PlayInteractAnimation(usee.ObjectId)

	StopStatusAnimation(usee)

	thread(PlayVoiceLines, HeroVoiceLines.FishTransactionStartVoiceLines, true)
	SetAnimation({ DestinationId = usee.ObjectId, Name = "ChefGhostChopOnion2_Start" })

	local earnedResources = GetTotalReward(fishes)
	local offsetY = 0
	for fishName, fishNum in pairs(fishes) do
		if fishNum > 0 then
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(fishName..";"..fishNum))
			if fishNum > 1 then
				thread(InCombatTextArgs,
					{ TargetId = CurrentRun.Hero.ObjectId, Text = "Fishing_TurnIn_Plural", SkipRise = false, SkipFlash = false, Duration = 1.5, OffsetY =
					offsetY, LuaKey = "TempTextData", LuaValue = { Name = fishName, Amount = fishNum } })
			else
				thread(InCombatTextArgs,
					{ TargetId = CurrentRun.Hero.ObjectId, Text = "Fishing_TurnIn", SkipRise = false, SkipFlash = false, Duration = 1.5, OffsetY =
					offsetY, LuaKey = "TempTextData", LuaValue = { Name = fishName, Amount = fishNum } })
			end
			offsetY = offsetY - 60
			PlaySound({ Name = "/Leftovers/SFX/BallLandWet" })
			wait(0.75)
			if GameState.CaughtFish[fishName] <= fishNum then
				GameState.CaughtFish[fishName] = nil
			else
				GameState.CaughtFish[fishName] = GameState.CaughtFish[fishName] - fishNum
			end
		end
	end
	wait(0.75)
	for resourceName, resourceAmount in pairs(earnedResources) do
		AddResource(resourceName, resourceAmount, "Fishing")
		PlaySound({ Name = "/SFX/Menu Sounds/SellTraitShopConfirm" })
		wait(0.75)
	end

	thread(PlayVoiceLines, HeroVoiceLines.FishTransactionEndVoiceLines, true)

	--GameState.CaughtFish = {}
	UnfreezePlayerUnit("Fishing")
end

function AddAllFish(screen, button)
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("AddAll"))
	for fishName, fishNum in pairs(GameState.CaughtFish) do
		screen.GiveToChef[fishName] = fishNum
		ChangeNumberTextBox(screen, fishName)
	end
end

function RemoveAllFish(screen, button)
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("AddAll"))
	for fishName, fishNum in pairs(GameState.CaughtFish) do
		screen.GiveToChef[fishName] = 0
		ChangeNumberTextBox(screen, fishName)
	end
end

function AddAllGoods(screen, button)
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("AddAll"))
	for growName, growNum in pairs(GameState.GrownGoods) do
		screen.GiveToChef[growName] = growNum
		ChangeNumberTextBox(screen, growName)
	end
end

function RemoveAllGoods(screen, button)
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("AddAll"))
	for growName, growNum in pairs(GameState.GrownGoods) do
		screen.GiveToChef[growName] = 0
		ChangeNumberTextBox(screen, growName)
	end
end

function GetFishReward(fishName)
	local ResourceName
	local ResourceAmount
	--local reward = GetRandomValue( fishData.Award )
	for resourceName, resourceAmount in pairs(FishingData.FishValues[fishName].Award[1]) do
		ResourceName = resourceName
		ResourceAmount = resourceAmount
		break
	end
	return { ResourceName = ResourceName, ResourceAmount = ResourceAmount, Color = ResourceData[ResourceName].Color }
end
function GetGoodsReward(growName)
	local ResourceName
	local ResourceAmount
	--local reward = GetRandomValue( fishData.Award )
	for resourceName, resourceAmount in pairs(GrowData.GrowValues[growName].Award[1]) do
		ResourceName = resourceName
		ResourceAmount = resourceAmount
		break
	end
	return { ResourceName = ResourceName, ResourceAmount = ResourceAmount, Color = ResourceData[ResourceName].Color }
end
-- Place the seeds
ModUtil.Path.Wrap("HandleSecretSpawns",
	function(baseFunc, currentRun)
		baseFunc(currentRun)
		local currentRoom = currentRun.CurrentRoom
		local seedPoints = GetInactiveIdsByType({ Name = "SeedPoint" })
		ModUtil.Hades.PrintStackChunks(ModUtil.ToString(not IsEmpty( seedPoints )))
		ModUtil.Hades.PrintStackChunks(ModUtil.ToString(IsSeedEligible( currentRun, currentRoom )))
		if not IsEmpty( seedPoints ) and IsSeedEligible( currentRun, currentRoom ) then
			currentRoom.ForceSeed = true
			UseHeroTraitsWithValue("ForceSeedPoint", true)
			CurrentRun.CurrentRoom.SeedPointId = GetRandomValue(seedPoints)
			Activate({ Id = CurrentRun.CurrentRoom.SeedPointId })
			--currentRun.LastFishingPointDepth = GetRunDepth( currentRun )
		end
	end
)
table.insert(OlympusDeathLoopData.DeathArea.StartUnthreadedEvents, 2, {
	FunctionName = "SpawnSeedsDeathArea",
})
function SpawnSeedsDeathArea(eventSource, args)
	args = args or {}
	ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Testing Seeds"))
	local seedPoints = GetInactiveIds({ Name = "SeedPoint" })
	ModUtil.Hades.PrintStackChunks(ModUtil.ToString(not IsEmpty( seedPoints )))
	ModUtil.Hades.PrintStackChunks(ModUtil.ToString(IsSeedEligible( currentRun, currentRoom )))
	if not IsEmpty( seedPoints ) and IsSeedEligible( currentRun, currentRoom ) then
		currentRoom.ForceSeed = true
		UseHeroTraitsWithValue("ForceSeedPoint", true)
		CurrentRun.CurrentRoom.SeedPointId = GetRandomValue(seedPoints)
		Activate({ Id = CurrentRun.CurrentRoom.SeedPointId })
		--currentRun.LastFishingPointDepth = GetRunDepth( currentRun )
	end
end
ModUtil.Path.Wrap("DoUnlockRoomExits",
	function(baseFunc, run, room)
		baseFunc(run, room)
		if CurrentRun.CurrentRoom.ForceSeed and CurrentRun.CurrentRoom.SeedPointId and IsUseable({ Id = CurrentRun.CurrentRoom.SeedPointId }) then
			thread( SeedPointAvailablePresentation, CurrentRun.CurrentRoom )
		end
	end
)
ModUtil.Path.Wrap("CreateRoom",
	function(baseFunc, roomData, args)
		local room = baseFunc(roomData, args)
		local seedPointChance = room.SeedPointChance or RoomData.BaseRoom.SeedPointChance
		for k, mutator in pairs( GameState.ActiveMutators ) do
			if mutator.SeedPointChanceMultiplier ~= nil then
				seedPointChance = seedPointChance * mutator.SeedPointChanceMultiplier
			end
		end
		room.SeedPointChanceSuccess =  RandomChance( seedPointChance + GetTotalHeroTraitValue("SeedPointChanceBonus") )
		return room
	end
)
function SeedPointAvailablePresentation( currentRoom )
	SetAnimation({ Name = "FishingPointActive", DestinationId = currentRoom.SeedPointId })
	wait( 0.25, RoomThreadName )
	PlaySound({ Name = "/Leftovers/SFX/AnnouncementPing7", Id = currentRoom.SeedPointId })
end
function GetSeed( biome, type )
	local fishName = nil
	local biomeData = GrowData.BiomeSeed.Defaults
	if GrowData.BiomeSeed[biome] then
		biomeData = FishingData.BiomeFish[biome]
	end

	if biomeData[type] then
		local fishingTable = {}
		for _, fishData in ipairs(biomeData[type]) do
			fishingTable[fishData.Name] = fishingTable.Weight or 1
		end

		fishName = GetRandomValueFromWeightedList( fishingTable )
	end

	return fishName
end
function IsSeedEligible( currentRun, currentRoom )
	if true then
		return true
	end
	if currentRoom.PersistentFishing and CurrentRun.RoomCreations[currentRoom.Name] then
		for roomIndex = #CurrentRun.RoomHistory, 1, -1 do
			local room = CurrentRun.RoomHistory[roomIndex]
			if room.Name == currentRoom.Name and room.CompletedFishing then
				return false
			end
		end
	end

	if currentRoom.ForceFishing then
		return true
	end

	if currentRoom.FishingPointForceRequirements ~= nil then 
		for k, requirements in pairs(currentRoom.FishingPointForceRequirements) do
			if IsGameStateEligible( currentRun, currentRoom.FishingPointForceRequirements ) then
				return true
			end
		end
	end

	if HasHeroTraitValue( "ForceFishingPoint" ) then
		return true
	end

	if not currentRoom.FishingPointChanceSuccess then
		return false
	end

	if not IsGameStateEligible( currentRun, currentRoom.FishingPointRequirements ) and not HeroHasTrait("FishingTrait") then
		return false
	end

	return true
end
OnUsed{ "SeedPoint",
	function( triggerArgs )
		ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Clicked a seed"))
		--[[if CheckCooldown( "UsedFishingPoint", 0.75 ) then
			local canFishInEncounter = true
			if CurrentRun.CurrentRoom.Encounter and CurrentRun.CurrentRoom.Encounter.BlockFishingBeforeStart and not CurrentRun.CurrentRoom.Encounter.Completed then
				canFishInEncounter = false
			end
			if IsCombatEncounterActive( CurrentRun ) or not canFishInEncounter then
				thread( InCombatText, CurrentRun.Hero.ObjectId, "UseBlockedByEnemies", 1.0, { ShadowScale = 0.6 } )
				thread( PlayVoiceLines, HeroVoiceLines.InteractionBlockedVoiceLines, true )
				PlaySound({ Name = "/Leftovers/SFX/OutOfAmmo", Id = triggerArgs.triggeredById })
			elseif CurrentRun.Hero.OnLava then
				thread( InCombatText, CurrentRun.Hero.ObjectId, "UseBlockedByLava", 1.0, { ShadowScale = 0.6 } )
				thread( PlayVoiceLines, HeroVoiceLines.InteractionBlockedVoiceLines, true )
				PlaySound({ Name = "/Leftovers/SFX/OutOfAmmo", Id = triggerArgs.triggeredById })
			else
				CurrentRun.Hero.FishingStarted = true
				FreezePlayerUnit( "FishingStartUp", { DisableTray = true, DisableCodex = true } )
				AddTimerBlock( CurrentRun, "Fishing" )
				wait( 0.25, "FishingStartDelay" )
				UnfreezePlayerUnit("FishingStartUp")
				if CurrentRun.Hero.FishingStarted and not CurrentRun.Hero.OnLava then
					UseableOff({ Id = triggerArgs.triggeredById })
					SetAlpha({ Id = triggerArgs.triggeredById, Fraction = 0.0, Duration = 0.25 })
					BlockVfx({ DestinationId = triggerArgs.triggeredById })
					StartFishing( triggerArgs.triggeredById )
				else
					RemoveTimerBlock( CurrentRun, "Fishing" )
				end
 			end
 		end]]
	end
}
-- Room Data
local OlympusRoomSetData = ModUtil.Entangled.ModData(RoomSetData)
OlympusRoomSetData.Base.BaseRoom.SeedPointChance = 1.00;
OlympusRoomSetData.Base.BaseRoom.SeedPointRequirements =	{
	RequiredCosmetics = { "FishingUnlockItem" },
	RequiredMinRoomsSinceFishingPoint = 10,
};
OverwriteTableKeys( RoomData, OlympusRoomSetData.Base )
	table.insert(OlympusRoomSetData.Tartarus.RoomOpening.ForcedRewards, {
		Name = "Boon",
		LootName = "ApolloUpgrade",
		GameStateRequirements =
		{
			RequiredTextLines = { "ZeusFirstPickUp", "ArtemisFirstPickUp" },
			RequiredOnlyNotPickedUp = "ApolloUpgrade",
			RequiredOnlyNotPickedUpIgnoreName = "DemeterUpgrade",
		}
	})