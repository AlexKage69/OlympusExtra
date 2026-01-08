local OlympusObstacleData = ModUtil.Entangled.ModData(ObstacleData)
local OlympusObjectiveData = ModUtil.Entangled.ModData(ObjectiveData)
local OlympusUIData = ModUtil.Entangled.ModData(UIData)
local OlympusGiftData = ModUtil.Entangled.ModData(GiftData)
local OlympusObjectiveSetData = ModUtil.Entangled.ModData(ObjectiveSetData)
local OlympusTraitData = ModUtil.Entangled.ModData(TraitData)
local OlympusDeathLoopData = ModUtil.Entangled.ModData(DeathLoopData)
local OlympusConditionalItemData = ModUtil.Entangled.ModData(ConditionalItemData)

-- God Manager Cosmetics
table.insert(OlympusDeathLoopData.RoomPreRun.StartUnthreadedEvents,
	{
		FunctionName = "SpawnStoneOfBanishment",
		GameStateRequirements =
		{
			RequiredCosmetics = { "StoneOfBanishmentWorkOrder", },
		},
		Args =
		{
			Ids = { "421422" },
		},
	})
OlympusConditionalItemData.StoneOfBanishmentWorkOrder =
{
	Name = "StoneOfBanishmentWorkOrder",
	InheritFrom = { "DefaultCriticalItem" },
	Slot = "Critical",
	PanDuration = 2,
	-- UsePanSound = true,
	DoVerticalPan = true,
	UseUnlockText = true,
	PreActivationHoldDuration = 1.5,
	PostActivationHoldDuration = 1.5,
	SetPlayerAnimation = "ZagreusCosmeticPurchase",
	-- UseReturnPanSound = true,
	SkipFade = true,
	SkipPurchaseGlobalVoiceLines = true,
	-- SkipRevealReactionGlobalVoiceLines = true,

	RevealVoiceLines =
	{
		{
			PreLineWait = 0.35,
			-- I think those columns still could use some sprucing up.
			{ Cue = "/VO/ZagreusHome_1759" },
		},
		{
			PreLineWait = 0.85,
			ObjectType = "NPC_Hades_01",
			RequiredFalseTextLinesThisRoom = { "HadesAboutOlympianReunionQuest01A" },
			RequiredSourceValueFalse = "InPartnerConversation",
			-- The columns were just fine the way they were.
			{ Cue = "/VO/Hades_0676" },
		},
	},
	RevealReactionGlobalVoiceLines = "HadesGhostAdminCriticalItemPurchaseReactionVoiceLines",
	Icon = "RunUpgrade_StoneOfBanishment",
	ResourceName = "SuperGems",
	ResourceCost = 3,
	GameStateRequirements =
	{
		RequiredTextLines = { "AthenaFirstPickUp" }, --{ "MakariaCompletedBanishmentQuest" },
	},

	OfferedVoiceLines =
	{
		PreLineWait = 0.5,
		PlayOnce = true,

		-- Hey that sounds handy, there...
		{ Cue = "/VO/ZagreusHome_3562" },
	},
}
function SpawnStoneOfBanishment(eventSource, args)
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("SpawnStoneOfBanishment"))
	Activate({ Ids = args.Ids })
end

GodOrderingReverseLookup = {} -- Auto Generate on open page ; GodOrdering is in GenerateGodOrderingReverseLookup
OnUsed { "StoneOfBanishment",
	function(triggerArgs)
		--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Open Tablet"))
		if CurrentRun.CurrentRoom.BlockKeepsakeMenu and not CanFreeSwapKeepsakes() then
			CannotUseRackPresentation(triggerArgs.triggeredById)
			return
		end

		PlayInteractAnimation(triggerArgs.triggeredById)
		StartUpGodManagerMenu(triggerArgs.TriggeredByTable)
	end
}
OlympusObstacleData.StoneOfBanishment =
{
	UseText = "UseAwardMenu",
	UsePromptOffsetX = 65,
	UsePromptOffsetY = -50,
}
OlympusUIData.GodManagerMenu = {
	CurrentPage = 0,
	ItemsPerPage = 4,
	BaseIconScale = 0.9,
	HoverIconScale = 1.1,
	AvailableGods = {},
	NormalSelectionFrame = "GodManagerMenuItemEquipped",
}
-- Single God
OlympusGiftData.ZeusUpgrade[4] = { UnlockExiledData = { Name = "ZeusUpgrade", RequiredTextLine = "ZeusGift04" } }
OlympusGiftData.PoseidonUpgrade[4] = { UnlockExiledData = { Name = "PoseidonUpgrade", RequiredTextLine = "PoseidonGift04" } }
OlympusGiftData.ArtemisUpgrade[4] = { UnlockExiledData = { Name = "ArtemisUpgrade", RequiredTextLine = "ArtemisGift04" } }
OlympusGiftData.AphroditeUpgrade[4] = { UnlockExiledData = { Name = "AphroditeUpgrade", RequiredTextLine = "AphroditeGift04" } }
OlympusGiftData.DemeterUpgrade[4] = { UnlockExiledData = { Name = "DemeterUpgrade", RequiredTextLine = "DemeterGift04" } }
OlympusGiftData.AresUpgrade[4] = { UnlockExiledData = { Name = "AresUpgrade", RequiredTextLine = "AresGift04" } }
OlympusGiftData.DionysusUpgrade[4] = { UnlockExiledData = { Name = "DionysusUpgrade", RequiredTextLine = "DionysusGift04" } }
OlympusGiftData.AthenaUpgrade[4] = { UnlockExiledData = { Name = "AthenaUpgrade", RequiredTextLine = "AthenaGift04" } }
if ApolloExtra ~= nil and OlympusGiftData.ApolloUpgrade ~= nil then
	OlympusGiftData.ApolloUpgrade[4] = { UnlockExiledData = { Name = "ApolloUpgrade", RequiredTextLine = "ApolloGift04" } }
end
if HestiaExtra ~= nil and OlympusGiftData.HestiaUpgrade ~= nil then
	OlympusGiftData.HestiaUpgrade[4] = { UnlockExiledData = { Name = "HestiaUpgrade", RequiredTextLine = "HestiaGift04" } }
end
if HeraExtra ~= nil and OlympusGiftData.HeraUpgrade ~= nil then
	OlympusGiftData.HeraUpgrade[4] = { UnlockExiledData = { Name = "HeraUpgrade", RequiredTextLine = "HeraGift04" } }
end
-- Dual Choices
OlympusGiftData.HermesUpgrade[4] = { UnlockExiledData = { Name = "HermesUpgrade", RequiredTextLine = "HermesGift01", Cost = 1, DualGod = { Name = "HephaestusUpgrade", RequiredTextLine = "ZeusGift04", IsDualGodOf = "HermesUpgrade", Cost = 1, } } }
OlympusGiftData.TrialUpgrade[4] = { UnlockExiledData = { Name = "TrialUpgrade", RequiredTextLine = "ChaosGift04", Cost = 2, DualGod = { Name = "QuestUpgrade", RequiredTextLine = "GaiaFirstPickUp", IsDualGodOf = "TrialUpgrade", Cost = 2, } } }
OlympusGiftData.TrialUpgrade[4] = { UnlockExiledData = { Name = "RoomChallenge", RequiredTextLine = "ErebusGift04", Cost = 3, DualGod = { Name = "CauldronRoom", RequiredTextLine = "HecateGift04", IsDualGodOf = "TrialUpgrade", Cost = 3, } } }

OlympusObjectiveData.StoneOfBanishmentPrompt = { Description = "Objective_UseStoneOfBanishment" }
OlympusObjectiveSetData.StoneOfBanishmentPrompt =
{
	AllowRepeat = false,
	PriorityLevel = 2,
	OverrideExistingObjective = false,
	RequiredRoom = "RoomPreRun",
	RequireNewTraits = true,
	IsIdAlive = 421422,
	Objectives =
	{
		{ "StoneOfBanishmentPrompt" }
	},
}
OlympusTraitData.BanishmentTrait = {
	Name = "BanishmentTrait",
	Frame = "MetaUpgrade",
	Icon = "BonusDarkness_01",
}

function UpdateStoneOfBanishmentShineStatus()
	if ScreenAnchors.GodManagerMenuSparkleId ~= nil then
		Destroy({ Id = ScreenAnchors.GodManagerMenuSparkleId })
	end
	local id = GetIdsByType({ Name = "StoneOfBanishment" })[1]
	if id ~= nil and HasNewTraits() and not CurrentRun.CurrentRoom.BlockKeepsakeMenu then
		ScreenAnchors.GodManagerMenuSparkleId = SpawnObstacle({ Name = "BlankObstacle", Group = "FX_Standing" })
		SetThingProperty({ Property = "SortMode", Value = "Id", DestinationId = ScreenAnchors.GodManagerMenuSparkleId })
		Attach({ Id = ScreenAnchors.GodManagerMenuSparkleId, DestinationId = id })
		SetAnimation({ Name = "StoneOfBanishmentGlean", DestinationId = ScreenAnchors.GodManagerMenuSparkleId })
	end
	local exilData = GetExilData()
	if HeroHasTrait("BanishmentTrait") then
		RemoveTrait(CurrentRun.Hero, "BanishmentTrait")
	end
	if TableLength(exilData.CurrentExiledGods) > 0 then
		AddTrait(CurrentRun.Hero, "BanishmentTrait")
		local GodsText = ""
		for name, exiled in pairs(exilData.CurrentExiledGods) do
			local godName = ParseRealGodName(name)
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(godName))
			if GodsText ~= "" then
				GodsText = GodsText .. ", "
			end
			GodsText = GodsText .. godName
		end
		for i, trait in pairs(CurrentRun.Hero.Traits) do
			if trait.Name == "BanishmentTrait" then
				trait.Gods = GodsText
			end
		end
	end
end

function ParseRealGodName(id)
	return string.sub(id, 0, string.len(id) - 7)
end

function CreateExiledGodsData()
	return {
		CurrentExiledGods = {},
		ExiledGodUnlocks = {},
		ExiledDualGodUnlocks = {},
	}
end

function GetExilData()
	if GameState.ExilData == nil or GameState.ExilData.CurrentExiledGods == nil or GameState.ExilData.ExiledGodUnlocks == nil or GameState.ExilData.ExiledDualGodUnlocks == nil then
		GameState.ExilData = CreateExiledGodsData()
	end
	return GameState.ExilData
end

LockAt = 3
CostButtonTable = {}
function GetMaxLock()
	return math.floor(TableLength(UIData.GodManagerMenu.AvailableExiledGods.Single) / LockAt)
end

function GetCurrentCost()
	local exilData = GetExilData()
	return math.floor((TableLength(exilData.ExiledGodUnlocks)) / LockAt)
end

function EquipLastExiledGods(eventSource, hero)
	local existingHero = CurrentRun.Hero or hero
	if GameState.ExiledGods ~= nil then
		--EquipAssist(existingHero, GameState.LastAssistTrait)
	end
end

function RemoveLastExiledGods(eventSource)
	if GameState.LastAssistTrait ~= nil then
		--UnequipAssist(CurrentRun.Hero, GameState.LastAssistTrait)
	end
end

function HasNewGods()
	for _, npcName in ipairs(ValidGods) do
		for s = 1, GetMaxGiftLevel(npcName) do
			local data = GetGiftLevelData(npcName, s)
			if data ~= nil and data.HeartDividerAfter then
				local new = Contains(GameState.Gift[npcName].NewTraits, data.Gift)
				if new then
					return true
				end
			end
		end
	end
	return false
end

function GetAvailableExiledGods()
	local exiledGods = { Single = {}, Dual = {} }
	for npcName, giftData in pairs(GameState.Gift) do
		for s = 1, GetMaxGiftLevel(npcName) do
			local data = GetGiftLevelData(npcName, s)
			if data ~= nil and data.UnlockExiledData then
				--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Found"..npcName))
				if data.UnlockExiledData.DualGod ~= nil then
					table.insert(exiledGods.Dual, data.UnlockExiledData)
				else
					table.insert(exiledGods.Single, data.UnlockExiledData)
				end
			end
		end
	end
	--[[for i = 1, 10, 1 do
		table.insert(exiledGods.Single,
						{ Known = false, Available = false, NPC = "TestUpgrade", Unlocked = false, Selected = false })
	end]]
	table.insert(exiledGods.Dual,
		{ Name = "TestUpgrade01", RequiredTextLine = "TestUpgrade01", DualGod = { Name = "TestUpgrade02", RequiredTextLine = "TestUpgrade02", IsDualGodOf = "TrialUpgrade" } })
	GenerateGodOrderingReverseLookup()
	table.sort(exiledGods.Single, ExiledGodsSort)
	table.sort(exiledGods.Dual, ExiledGodsSort)
	return exiledGods
end

function ExiledGodsSort(itemA, itemB)
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(itemA))
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Sorting:"..itemA.Name..","..GodOrderingReverseLookup[itemA.Name]..";"..itemB.Name..","..GodOrderingReverseLookup[itemB.Name]))

	if GodOrderingReverseLookup[itemA.Name] and GodOrderingReverseLookup[itemB.Name] then
		return GodOrderingReverseLookup[itemA.Name] < GodOrderingReverseLookup[itemB.Name]
	end
	if itemA ~= nil and itemA.Name ~= nil and itemB ~= nil and itemB.Name ~= nil then
		return itemA.Name < itemB.Name
	end
	return itemA == itemB
end

function GenerateGodOrderingReverseLookup()
	GodOrdering =
	{
		--Single
		"ZeusUpgrade",
		"PoseidonUpgrade",
		"AthenaUpgrade",
		"AphroditeUpgrade",
		"AresUpgrade",
		"ArtemisUpgrade",
		"DionysusUpgrade",
		"DemeterUpgrade",
		"ApolloUpgrade",
		"HestiaUpgrade",
		"HeraUpgrade",
		--Dual
		"HermesUpgrade",
		"HephaestusUpgrade",
		"TrialUpgrade",
		"TestUpgrade01",
	}
	GodOrderingReverseLookup = {}
	for i, key in ipairs(GodOrdering) do
		GodOrderingReverseLookup[key] = i
	end
end

function StartUpGodManagerMenu(GodManagerMenuObject)
	UIData.GodManagerMenu.AvailableExiledGods = GetAvailableExiledGods()
	CurrentRun.CurrentRoom.GodManagerMenuObject = GodManagerMenuObject
	ShowGodManagerMenu()

	if GameState.LastAwardTrait ~= nil then
		thread(MarkObjectiveComplete, "StoneOfBanishmentPrompt")
	end
end

-- should get 3 free gods. then you can pay nectar and ambrosia to unlock the rest. only gods with gift04 can be
function ShowGodManagerMenu()
	if IsScreenOpen("GodManagerMenu") then
		return
	end
	for name, exiled in pairs(GetExilData().CurrentExiledGods) do
		--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(name))
	end
	local exilData = GetExilData()
	OnScreenOpened({ Flag = "GodManagerMenu", PersistCombatUI = true })
	FreezePlayerUnit()
	EnableShopGamepadCursor()
	HideCombatUI("GodManagerMenu")
	SetConfigOption({ Name = "FreeFormSelecSearchFromId", Value = 0 })
	SetConfigOption({ Name = "FreeFormSelectRepeatDelay", Value = 0.6 })
	SetConfigOption({ Name = "FreeFormSelectRepeatInterval", Value = 0.1 })

	ScreenAnchors.GodManagerMenuScreen = { Components = {}, UpgradeButtons = {} }
	local components = ScreenAnchors.GodManagerMenuScreen.Components

	components.BackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu" })
	SetScale({ Id = components.BackgroundDim.Id, Fraction = 4 })
	SetColor({ Id = components.BackgroundDim.Id, Color = { 0.15, 0.15, 0.15, 0.85 } })

	components.Background = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
	SetAnimation({ DestinationId = components.Background.Id, Name = "StoneOfBanishmentBackground" })
	SetScale({ Id = components.Background.Id, Fraction = 1.15 })

	components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "Combat_Menu" })
	Attach({
		Id = components.CloseButton.Id,
		DestinationId = components.Background.Id,
		OffsetX = 100,
		OffsetY =
			ScreenCenterY - 70
	})
	components.CloseButton.OnPressedFunctionName = "CloseGodMenuScreen"
	components.CloseButton.ControlHotkey = "Cancel"

	PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENU" })
	PlaySound({ Name = "/Leftovers/World Sounds/Caravan Interior/ChestOpen" })

	-- Nectar and Ambrosia Available
	local FreeExilMessageText = " "
	local CurrentGiftText = " "
	local CurrentSuperGiftText = " "
	if GetCurrentCost() == 0 then
		FreeExilMessageText = "FreeExilMessage"
	elseif GameState.LifetimeResourcesGained.GiftPoints ~= nil and GameState.LifetimeResourcesGained.GiftPoints > 0 then
		CurrentGiftText = "Available_GiftPoints"
	end
	if GameState.LifetimeResourcesGained.SuperGiftPoints ~= nil and GameState.LifetimeResourcesGained.SuperGiftPoints > 0 then
		CurrentSuperGiftText = "Available_SuperGiftPoints"
	end
	local exilData = GetExilData()
	components.FreeExilMessage = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
	CreateTextBox({
		Id = components.FreeExilMessage.Id,
		Text = FreeExilMessageText,
		FontSize = 24,
		OffsetX = -550,
		OffsetY = -388,
		Color = Color.White,
		Font = "SpectralSCLight",
		ShadowBlur = 0,
		ShadowColor = { 0, 0, 0, 1 },
		ShadowOffset = { 0, 1 },
		Justification = "Left",
		LuaKey = "TempTextData",
		LuaValue = { NumExil = LockAt - TableLength(exilData.ExiledGodUnlocks) }
	})

	components.CurrentGift = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
	CreateTextBox({
		Id = components.CurrentGift.Id,
		Text = CurrentGiftText,
		FontSize = 24,
		OffsetX = -550,
		OffsetY = -388,
		Color = Color.White,
		Font = "AlegreyaSansSCRegular",
		ShadowBlur = 0,
		ShadowColor = { 0, 0, 0, 1 },
		ShadowOffset = { 0, 2 },
		Justification = "Left",
		LuaKey = "TempTextData",
		LuaValue = { Amount = tostring(GameState.Resources.GiftPoints) }
	})
	components.CurrentSuperGift = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
	CreateTextBox({
		Id = components.CurrentSuperGift.Id,
		Text = CurrentSuperGiftText,
		FontSize = 24,
		OffsetX = -550,
		OffsetY = -345,
		Color = Color.White,
		Font = "AlegreyaSansSCRegular",
		ShadowBlur = 0,
		ShadowColor = { 0, 0, 0, 1 },
		ShadowOffset = { 0, 2 },
		Justification = "Left",
		LuaKey = "TempTextData",
		LuaValue = { Amount = tostring(GameState.Resources.SuperGiftPoints) }
	})
	--Title
	components.Title = CreateTextBox({
		Id = components.Background.Id,
		Text = "GodManagerMenu_Title",
		FontSize = 34,
		OffsetX = 0,
		OffsetY = -380,
		Color = Color.White,
		Font = "SpectralSCLight",
		ShadowBlur = 0,
		ShadowColor = { 0, 0, 0, 1 },
		ShadowOffset = { 0, 1 },
		Justification = "Center"
	})
	--SubTitle
	components.Subtitle = CreateTextBox({
		Id = components.Background.Id,
		Text = "GodManagerMenu_Subtitle",
		FontSize = 19,
		OffsetX = 0,
		OffsetY = -335,
		Width = 840,
		Color = Color.White,
		Font = "CrimsonTextItalic",
		ShadowBlur = 0,
		ShadowColor = { 0, 0, 0, 1 },
		ShadowOffset = { 0, 1 },
		Justification = "Center"
	})
	--Exiled Left
	for i = 1, GetMaxLock() do
		components["ExilIcon" .. i] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
		Attach({
			Id = components["ExilIcon" .. i].Id,
			DestinationId = components.Background.Id,
			OffsetX = 375 -
				(GetMaxLock() * 25) + (i * 50),
			OffsetY = -355
		})
		SetScale({ Id = components["ExilIcon" .. i].Id, Fraction = 2.0 })
		SetAnimation({ DestinationId = components["ExilIcon" .. i].Id, Name = "LockedIcon" })
	end
	RefreshLockIcons(components)
	--Start Table
	local spacerX = 160
	local spacerY = 160
	local startX = 716
	local startY = 310
	local rowMax = 6
	local rowMin = math.ceil(rowMax / 2)
	local maxIndex = 0
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(TableLength(UIData.GodManagerMenu.AvailableExiledGods.Single)))
	for itemIndex, exiledGod in ipairs(UIData.GodManagerMenu.AvailableExiledGods.Single) do
		local localx = startX - spacerX * rowMin / 2 + ((itemIndex - 1) % rowMax + 0.5) * spacerX
		local localy = startY + math.floor((itemIndex - 1) / rowMax) * 2 * (spacerY / 2)
		--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(exiledGod.Name))
		CreateExiledGodIcon(components, { Index = itemIndex, God = exiledGod, X = localx, Y = localy })
		maxIndex = itemIndex
	end
	-- Dual Table
	startY = 810
	startX = 956
	spacerX = 366
	rowMax = 6
	rowMin = math.ceil(rowMax / 2)

	for itemIndex, exiledGod in ipairs(UIData.GodManagerMenu.AvailableExiledGods.Dual) do
		local localx = startX - spacerX * rowMin / 2 + ((itemIndex - 1) % rowMax + 0.5) * spacerX
		local localy = startY + math.floor((itemIndex - 1) / rowMax) * 2 * (spacerY / 2)
		CreateDualExiledGodIcon(components,
				{ Index = itemIndex + maxIndex, FirstGod = exiledGod, SecondGod = exiledGod.DualGod, X = localx, Y =
				localy, Temp = itemIndex > 1 })
	end
	-- CreateTextBox({ Id = components.ShopBackground.Id, Text = "GodManagerMenu_Hint", FontSize = 14, OffsetX = 0, OffsetY = 420, Width = 840, Color = Color.Gray, Font = "CrimsonTextBoldItalic", ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center" })

	ScreenAnchors.GodManagerMenuScreen.KeepOpen = true
	thread(HandleWASDInput, ScreenAnchors.GodManagerMenuScreen)
	HandleScreenInput(ScreenAnchors.GodManagerMenuScreen)
end

function CreateExiledGodIcon(components, args)
	args = args or {}
	local localx = args.X
	local localy = args.Y
	local xOffset = args.xOffset or 0
	local yOffset = args.yOffset or 0
	local itemIndex = args.Index
	local god = args.God
	local keyAppend = args.KeyAppend or ""

	local buttonKey = "UpgradeToggle" .. itemIndex .. keyAppend
	components[buttonKey .. "Frame"] = CreateScreenComponent({
		Name = "BlankObstacle",
		X = localx + xOffset,
		Y = localy + yOffset,
		Group =
		"Combat_Menu"
	})
	SetAnimation({ DestinationId = components[buttonKey .. "Frame"].Id, Name = "ButtonDefault" })
	SetScaleX({ Id = components[buttonKey .. "Frame"].Id, Fraction = 0.5 })
	SetScaleY({ Id = components[buttonKey .. "Frame"].Id, Fraction = 2.0 })
	--SetColor({ Id = components[buttonKey .. "Frame"].Id, Color = { 1.0, 1.0, 1.0, 0.95 } })
	--[[if not IsGodAvailableForExil(god) then -- Unknown
		--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(buttonKey..";Unknown"..god.Name))
		components[buttonKey] = CreateScreenComponent({ Name = "RadioButton", Scale = UIData.GodManagerMenu
		.BaseIconScale, X = localx, Y = localy, Group = "Combat_Menu" })
		components[buttonKey].Data = god
		components[buttonKey].ButtonKey = buttonKey
		components[buttonKey].FrameId = components[buttonKey .. "Frame"].Id
		components[buttonKey].OnPressedFunctionName = "HandleExiledToggle"
		components[buttonKey].Blocked = true
		SetAnimation({ DestinationId = components[buttonKey].Id, Name = "Single_Locked_Banishment" })	
		
	else -- Known god]]
	components[buttonKey .. "BackIcon"] = CreateScreenComponent({
		Name = "BlankObstacle",
		Group = "Combat_Menu",
		X =
			xOffset,
		Y = yOffset
	})
	SetAnimation({ DestinationId = components[buttonKey .. "BackIcon"].Id, Name = "Keepsake_BackingMenu" })
	components[buttonKey] = CreateScreenComponent({
		Name = "RadioButton",
		Scale = UIData.GodManagerMenu
			.BaseIconScale,
		X = localx,
		Y = localy,
		Group = "Combat_Menu"
	})
	Attach({
		Id = components[buttonKey .. "BackIcon"].Id,
		DestinationId = components[buttonKey].Id,
		OffsetX =
			xOffset,
		OffsetY = yOffset
	})
	components[buttonKey].Data = god
	components[buttonKey].ButtonKey = buttonKey
	components[buttonKey].FrameId = components[buttonKey .. "Frame"].Id
	components[buttonKey].OnPressedFunctionName = "HandleExiledToggle"

	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(ScreenAnchors.GodManagerMenuScreen))
	ScreenAnchors.GodManagerMenuScreen[components[buttonKey].Id] = components[buttonKey]
	local lootData = LootData[god.Name]
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(";God"..god.Name))
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(";God"..god.Name..";"..lootData.BoonInfoIcon..";"..lootData.Name))

	if not IsGodAvailableForExil(god) then
		SetAnimation({ DestinationId = components[buttonKey].Id, Name = "Single_Locked_Banishment" })
		components[buttonKey].Blocked = true
	elseif IsLootDataIconAvailable(lootData) then
		--[[components[buttonKey .. "Icon"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
			Attach({ Id = components[buttonKey .. "Icon"].Id, DestinationId = components[buttonKey].Id, OffsetX = xOffset, OffsetY =
			yOffset })]]

		local icon = lootData.BoonInfoIcon
		SetAnimation({ DestinationId = components[buttonKey].Id, Name = icon })
		SetScale({ Id = components[buttonKey].Id, Fraction = 0.9 })

		components[buttonKey .. "Lock"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
		Attach({
			Id = components[buttonKey .. "Lock"].Id,
			DestinationId = components[buttonKey].Id,
			OffsetX = xOffset,
			OffsetY =
				yOffset
		})
		SetAnimation({ DestinationId = components[buttonKey .. "Lock"].Id, Name = "LockedKeepsakeIcon" })
		SetAlpha({ Id = components[buttonKey .. "Lock"].Id, Fraction = 0.0 })
		if not IsGodUnlockedForExil(god.Name) then -- God is still locked
			SetColor({ Id = components[buttonKey].Id, Color = { 0.15, 0.15, 0.15, 1.0 } })
			components[buttonKey .. "Cost"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
			Attach({
				Id = components[buttonKey .. "Cost"].Id,
				DestinationId = components[buttonKey].Id,
				OffsetX = 31 +
					xOffset,
				OffsetY = 48 + yOffset
			})
			CreateTextBox({
				Id = components[buttonKey .. "Cost"].Id,
				Text = "GiftPointCost",
				FontSize = 24,
				OffsetX = 0,
				OffsetY = 0,
				Color = Color.White,
				Font = "AlegreyaSansSCRegular",
				ShadowBlur = 0,
				ShadowColor = { 0, 0, 0, 1 },
				ShadowOffset = { 0, 2 },
				Justification = "Right",
				LuaKey = "TempTextData",
				LuaValue = { Amount = tostring(GetCurrentCost()) }
			})
			table.insert(CostButtonTable, components[buttonKey .. "Cost"].Id)
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(buttonKey..";Unpaid God:"..god.Name..":"..localx..";"..localy))
		elseif IsGodExiled(god.Name) then -- God Unlocked and Selected
			--SetAlpha({ Id = iconId, Fraction = 1.0 })
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(buttonKey..";Selected ban:"..god.Name))
			components[buttonKey .. "Lock"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
			Attach({
				Id = components[buttonKey .. "Lock"].Id,
				DestinationId = components[buttonKey].Id,
				OffsetX =
					xOffset,
				OffsetY = yOffset
			})
			SetAnimation({ DestinationId = components[buttonKey .. "Lock"].Id, Name = "LockedKeepsakeIcon" })
		else -- God Unlocked and Not Selected
		end
	else
		--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(buttonKey..";Error Assets:"..god.Name))
	end
	--end

	--[[if args.AddUpgradeButton and upgradeData.Unlocked then
		components[buttonKey .. "Upgrade"] = CreateScreenComponent({ Name = "AssistUpgradeButton", Group =
		"Combat_Menu_TraitTray", X = ScreenCenterX + 40, Y = 220, Scale = 0.5 })
		Attach({ Id = components[buttonKey .. "Upgrade"].Id, DestinationId = components[buttonKey].Id, OffsetX = 0, OffsetY = 160 })
		components[buttonKey .. "Upgrade"].OnPressedFunctionName = "UpgradeAssistKeepsake"
		components[buttonKey .. "Upgrade"].GiftName = traitData.Name
		components[buttonKey .. "Upgrade"].Data = traitData
		components[buttonKey .. "Upgrade"].ParentButton = components[buttonKey]

		table.insert(ScreenAnchors.GodManagerMenuScreen.UpgradeButtons, components[buttonKey .. "Upgrade"])

		local text = ResourceData.SuperGiftPoints.RequirementText
		local fontSize = 32
		if IsKeepsakeMaxed(traitData.Name) then
			UseableOff({ Id = components[buttonKey .. "Upgrade"].Id })
		else
			local color = Color.White
			if not HasResource("SuperGiftPoints", GetAssistKeepsakeUpgradeCost(traitData.Name)) then
				color = Color.Red
			end

			CreateTextBox({ Id = components[buttonKey .. "Upgrade"].Id, Text = text, TextSymbolScale = 0.7, FontSize =
			fontSize, Font = "AlegreyaSansSCBold", OffsetX = 35, OffsetY = 0, Color = color, LuaKey = "TempTextData", LuaValue = { Amount = GetAssistKeepsakeUpgradeCost(traitData.Name) } })
		end
		ScreenAnchors.GodManagerMenuScreen[components[buttonKey .. "Upgrade"].Id] = components[buttonKey .. "Upgrade"]
	end]]
end

function CreateDualExiledGodIcon(components, args)
	args = args or {}
	local localx = args.X - 80
	local localxSecond = args.X + 80
	local localy = args.Y
	local xOffset = args.xOffset or 0
	local yOffset = args.yOffset or 0
	local xOffsetSecond = xOffset
	local itemIndex = args.Index
	local firstGod = args.FirstGod
	local secondGod = args.SecondGod
	local keyAppend = args.KeyAppend or ""

	local buttonKey = "UpgradeToggle" .. itemIndex .. keyAppend
	components[buttonKey .. "Frame"] = CreateScreenComponent({
		Name = "BlankObstacle",
		X = localx + xOffset,
		Y = localy + yOffset,
		Group =
		"Combat_Menu"
	})
	SetAnimation({ DestinationId = components[buttonKey .. "Frame"].Id, Name = "ButtonDefault" })
	SetScaleX({ Id = components[buttonKey .. "Frame"].Id, Fraction = 0.5 })
	SetScaleY({ Id = components[buttonKey .. "Frame"].Id, Fraction = 2.0 })
	--SetColor({ Id = components[buttonKey .. "Frame"].Id, Color = { 1.0, 1.0, 1.0, 0.95 } })
	-- First God Button
	components[buttonKey .. "FirstBackIcon"] = CreateScreenComponent({
		Name = "BlankObstacle",
		Group = "Combat_Menu",
		X = xOffset,
		Y = yOffset
	})	
	components[buttonKey .. "First"] = CreateScreenComponent({
		Name = "RadioButton",
		Scale = UIData.GodManagerMenu
			.BaseIconScale,
		X = localx,
		Y = localy,
		Group = "Combat_Menu"
	})
	Attach({
		Id = components[buttonKey .. "FirstBackIcon"].Id,
		DestinationId = components[buttonKey .. "First"].Id,
		OffsetX =
			xOffset,
		OffsetY = yOffset
	})
	components[buttonKey .. "SecondBackIcon"] = CreateScreenComponent({
		Name = "BlankObstacle",
		Group = "Combat_Menu",
		X = xOffsetSecond,
		Y = yOffset
	})
	components[buttonKey .. "Second"] = CreateScreenComponent({
		Name = "RadioButton",
		Scale = UIData.GodManagerMenu
			.BaseIconScale,
		X = localxSecond,
		Y = localy,
		Group = "Combat_Menu"
	})
	Attach({
		Id = components[buttonKey .. "SecondBackIcon"].Id,
		DestinationId = components[buttonKey .. "Second"].Id,
		OffsetX =
			xOffsetSecond,
		OffsetY = yOffset
	})	
	
	components[buttonKey .. "First"].Data = firstGod
	components[buttonKey .. "First"].ButtonKey = buttonKey .. "First"
	components[buttonKey .. "First"].FrameId = components[buttonKey .. "Frame"].Id
	components[buttonKey .. "First"].OnPressedFunctionName = "HandleDualExiledToggle"
	components[buttonKey .. "Second"].Data = secondGod
	components[buttonKey .. "Second"].ButtonKey = buttonKey .. "Second"
	components[buttonKey .. "Second"].FrameId = components[buttonKey .. "Frame"].Id
	components[buttonKey .. "Second"].OnPressedFunctionName = "HandleDualExiledToggle"
	
	components[buttonKey .. "First"].OtherButton = components[buttonKey .. "Second"]
	components[buttonKey .. "Second"].OtherButton = components[buttonKey .. "First"]	

	ScreenAnchors.GodManagerMenuScreen[components[buttonKey .. "First"].Id] = components[buttonKey .. "First"]
	ScreenAnchors.GodManagerMenuScreen[components[buttonKey .. "Second"].Id] = components[buttonKey .. "Second"]

	local firstLootData = LootData[firstGod.Name]
	local secondLootData = LootData[secondGod.Name]
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(";God"..god.Name))
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(";God"..god.Name..";"..lootData.BoonInfoIcon..";"..lootData.Name))

	
	if not IsGodAvailableForExil(firstGod) then 
		SetAnimation({ DestinationId = components[buttonKey .. "First"].Id, Name = "Single_Locked_Banishment" })
		components[buttonKey .. "First"].Blocked = true
	elseif IsLootDataIconAvailable(secondLootData) then
		SetAnimation({ DestinationId = components[buttonKey .. "FirstBackIcon"].Id, Name = "Keepsake_BackingMenu" })

		SetAnimation({ DestinationId = components[buttonKey .. "First"].Id, Name = firstLootData.BoonInfoIcon })

		SetScale({ Id = components[buttonKey .. "First"].Id, Fraction = 0.9 })

		components[buttonKey .. "FirstLock"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
		Attach({
			Id = components[buttonKey .. "FirstLock"].Id,
			DestinationId = components[buttonKey .. "First"].Id,
			OffsetX = xOffset,
			OffsetY =
				yOffset
		})
		SetAnimation({ DestinationId = components[buttonKey .. "FirstLock"].Id, Name = "LockedKeepsakeIcon" })
		SetAlpha({ Id = components[buttonKey .. "FirstLock"].Id, Fraction = 0.0 })

		if not IsGodUnlockedForExil(firstGod.Name) then -- God is still locked
			SetColor({ Id = components[buttonKey.. "First"].Id, Color = { 0.15, 0.15, 0.15, 1.0 } })
			components[buttonKey .. "FirstCost"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
			Attach({
				Id = components[buttonKey .. "FirstCost"].Id,
				DestinationId = components[buttonKey.. "First"].Id,
				OffsetX = 31 +
					xOffset,
				OffsetY = 48 + yOffset
			})
			CreateTextBox({
				Id = components[buttonKey .. "FirstCost"].Id,
				Text = "SuperGiftPointCost",
				FontSize = 24,
				OffsetX = 0,
				OffsetY = 0,
				Color = Color.White,
				Font = "AlegreyaSansSCRegular",
				ShadowBlur = 0,
				ShadowColor = { 0, 0, 0, 1 },
				ShadowOffset = { 0, 2 },
				Justification = "Right",
				LuaKey = "TempTextData",
				LuaValue = { Amount = tostring(firstGod.Cost) }
			})
		elseif IsGodExiled(firstGod.Name) then -- God Unlocked and Selected
			--SetAlpha({ Id = iconId, Fraction = 1.0 })
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(buttonKey..";Selected ban:"..god.Name))
			components[buttonKey .. "FirstLock"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
			Attach({
				Id = components[buttonKey .. "FirstLock"].Id,
				DestinationId = components[buttonKey.. "First"].Id,
				OffsetX = xOffset,
				OffsetY = yOffset
			})
			SetAnimation({ DestinationId = components[buttonKey .. "FirstLock"].Id, Name = "LockedKeepsakeIcon" })
		end
	end
	if not IsGodAvailableForExil(secondGod) then 
		SetAnimation({ DestinationId = components[buttonKey .. "Second"].Id, Name = "Single_Locked_Banishment" })
		components[buttonKey .. "Second"].Blocked = true
	elseif IsLootDataIconAvailable(secondLootData) then
		SetAnimation({ DestinationId = components[buttonKey .. "SecondBackIcon"].Id, Name = "Keepsake_BackingMenu" })

		SetAnimation({ DestinationId = components[buttonKey .. "Second"].Id, Name = secondLootData.BoonInfoIcon })

		SetScale({ Id = components[buttonKey .. "Second"].Id, Fraction = 0.9 })

		components[buttonKey .. "SecondLock"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
		Attach({
			Id = components[buttonKey .. "SecondLock"].Id,
			DestinationId = components[buttonKey .. "Second"].Id,
			OffsetX = xOffset,
			OffsetY =
				yOffset
		})
		SetAnimation({ DestinationId = components[buttonKey .. "SecondLock"].Id, Name = "LockedKeepsakeIcon" })
		SetAlpha({ Id = components[buttonKey .. "SecondLock"].Id, Fraction = 0.0 })

		if not IsGodUnlockedForExil(secondGod.Name) then -- God is still locked
			SetColor({ Id = components[buttonKey.. "Second"].Id, Color = { 0.15, 0.15, 0.15, 1.0 } })
			components[buttonKey .. "SecondCost"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
			Attach({
				Id = components[buttonKey .. "SecondCost"].Id,
				DestinationId = components[buttonKey.. "Second"].Id,
				OffsetX = 31 +
					xOffset,
				OffsetY = 48 + yOffset
			})
			CreateTextBox({
				Id = components[buttonKey .. "SecondCost"].Id,
				Text = "SuperGiftPointCost",
				FontSize = 24,
				OffsetX = 0,
				OffsetY = 0,
				Color = Color.White,
				Font = "AlegreyaSansSCRegular",
				ShadowBlur = 0,
				ShadowColor = { 0, 0, 0, 1 },
				ShadowOffset = { 0, 2 },
				Justification = "Right",
				LuaKey = "TempTextData",
				LuaValue = { Amount =  tostring(secondGod.Cost) }
			})
		elseif IsGodExiled(secondGod.Name) then -- God Unlocked and Selected
			--SetAlpha({ Id = iconId, Fraction = 1.0 })
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(buttonKey..";Selected ban:"..god.Name))
			components[buttonKey .. "SecondLock"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
			Attach({
				Id = components[buttonKey .. "SecondLock"].Id,
				DestinationId = components[buttonKey.. "Second"].Id,
				OffsetX = xOffset,
				OffsetY = yOffset
			})
			SetAnimation({ DestinationId = components[buttonKey .. "SecondLock"].Id, Name = "LockedKeepsakeIcon" })
		end
	end
	if args.Temp then
		components[buttonKey .. "TempBlock"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
			Attach({
				Id = components[buttonKey .. "TempBlock"].Id,
				DestinationId = components[buttonKey.. "Frame"].Id,
				OffsetX = 80 + xOffset,
				OffsetY = yOffset
			})
			CreateTextBox({
				Id = components[buttonKey .. "TempBlock"].Id,
				Text = "Coming Soon",
				FontSize = 38,
				OffsetX = 0,
				OffsetY = 0,
				Color = Color.Black,
				Font = "AlegreyaSansSCBold",
				ShadowBlur = 0,
				ShadowColor = { 0, 0, 0, 1 },
				ShadowOffset = { 0, 2 },
				Justification = "Center",
			})
	end
	--end

	--[[if args.AddUpgradeButton and upgradeData.Unlocked then
		components[buttonKey .. "Upgrade"] = CreateScreenComponent({ Name = "AssistUpgradeButton", Group =
		"Combat_Menu_TraitTray", X = ScreenCenterX + 40, Y = 220, Scale = 0.5 })
		Attach({ Id = components[buttonKey .. "Upgrade"].Id, DestinationId = components[buttonKey].Id, OffsetX = 0, OffsetY = 160 })
		components[buttonKey .. "Upgrade"].OnPressedFunctionName = "UpgradeAssistKeepsake"
		components[buttonKey .. "Upgrade"].GiftName = traitData.Name
		components[buttonKey .. "Upgrade"].Data = traitData
		components[buttonKey .. "Upgrade"].ParentButton = components[buttonKey]

		table.insert(ScreenAnchors.GodManagerMenuScreen.UpgradeButtons, components[buttonKey .. "Upgrade"])

		local text = ResourceData.SuperGiftPoints.RequirementText
		local fontSize = 32
		if IsKeepsakeMaxed(traitData.Name) then
			UseableOff({ Id = components[buttonKey .. "Upgrade"].Id })
		else
			local color = Color.White
			if not HasResource("SuperGiftPoints", GetAssistKeepsakeUpgradeCost(traitData.Name)) then
				color = Color.Red
			end

			CreateTextBox({ Id = components[buttonKey .. "Upgrade"].Id, Text = text, TextSymbolScale = 0.7, FontSize =
			fontSize, Font = "AlegreyaSansSCBold", OffsetX = 35, OffsetY = 0, Color = color, LuaKey = "TempTextData", LuaValue = { Amount = GetAssistKeepsakeUpgradeCost(traitData.Name) } })
		end
		ScreenAnchors.GodManagerMenuScreen[components[buttonKey .. "Upgrade"].Id] = components[buttonKey .. "Upgrade"]
	end]]
end

OnMouseOver { "RadioButton",
	function(triggerArgs)
		if triggerArgs.triggeredById == nil or not IsScreenOpen("GodManagerMenu") or ScreenAnchors.GodManagerMenuScreen == nil or ScreenAnchors.GodManagerMenuScreen[triggerArgs.triggeredById] == nil then
			return
		end
		local button = ScreenAnchors.GodManagerMenuScreen[triggerArgs.triggeredById]
		--PlaySound({ Name = "/SFX/Menu Sounds/MirrorMenuToggleKeepsakes", Id = button.TitleTextBoxId })
		SetCursorFrameGodMenu(button)
	end
}

OnMouseOff { "RadioButton",
	function(triggerArgs)
		if IsScreenOpen("GodManagerMenu") then
			local components = ScreenAnchors.GodManagerMenuScreen.Components
			local button = ScreenAnchors.GodManagerMenuScreen[triggerArgs.triggeredById]
			if not button.Blocked then
				DestroyCursorFrameGodMenu()
				SetScale({ Id = button.Id, Fraction = UIData.GodManagerMenu.BaseIconScale, Duration = 0.1, EaseIn = 0, EaseOut = 1 })
			end
		end
	end
}

function SetCursorFrameGodMenu(button)
	local components = ScreenAnchors.GodManagerMenuScreen.Components
	if ScreenAnchors.GodManagerMenuScreen.HoverFrame == nil then
		ScreenAnchors.GodManagerMenuScreen.HoverFrame = CreateScreenObstacle({
			Name = "BlankObstacle",
			Group =
			"Combat_Menu_Additive"
		})
	end
	if button.IsDualLocked then
		SetScaleX({ Id = ScreenAnchors.GodManagerMenuScreen.HoverFrame, Fraction = 2.0 })
		SetScaleY({ Id = ScreenAnchors.GodManagerMenuScreen.HoverFrame, Fraction = 1.0 })
	else
		SetScaleX({ Id = ScreenAnchors.GodManagerMenuScreen.HoverFrame, Fraction = 1.0 })
		SetScaleY({ Id = ScreenAnchors.GodManagerMenuScreen.HoverFrame, Fraction = 1.0 })
	end

	Teleport({ Id = ScreenAnchors.GodManagerMenuScreen.HoverFrame, DestinationId = button.Id })
	SetAnimation({ Name = "GodManagerMenuCursorHighlight", DestinationId = ScreenAnchors.GodManagerMenuScreen.HoverFrame })
	if not button.Blocked then
		SetScale({ Id = button.Id, Fraction = UIData.GodManagerMenu.HoverIconScale, Duration = 0.1, EaseIn = 0, EaseOut = 1 })
	end
end

function DestroyCursorFrameGodMenu()
	if ScreenAnchors.GodManagerMenuScreen ~= nil then
		Destroy({ Id = ScreenAnchors.GodManagerMenuScreen.HoverFrame })
		ScreenAnchors.GodManagerMenuScreen.HoverFrame = nil
	end
end

function SetSelectedFrameGodMenu(button)
	local frameKey = "SelectedFrame"
	local selectedFramedAnimation = UIData.GodManagerMenu.NormalSelectionFrame
	if TraitData[button.Data.Gift].Slot == "Assist" then
		frameKey = "SelectedAssistFrame"
		selectedFramedAnimation = UIData.GodManagerMenu.LegendarySelectionFrame
	end

	if ScreenAnchors.GodManagerMenuScreen[frameKey] == nil then
		ScreenAnchors.GodManagerMenuScreen[frameKey] = CreateScreenObstacle({
			Name = "BlankObstacle",
			Group =
			"Combat_Menu"
		})
	end
	SetAnimation({ Name = selectedFramedAnimation, DestinationId = ScreenAnchors.GodManagerMenuScreen[frameKey] })
	Teleport({ Id = ScreenAnchors.GodManagerMenuScreen[frameKey], DestinationId = button.Id })
end

function DestroySelectedFrameGodMenu()
	Destroy({ Id = ScreenAnchors.GodManagerMenuScreen.SelectedFrame })
	Destroy({ Id = ScreenAnchors.GodManagerMenuScreen.SelectedAssistFrame })
	ScreenAnchors.GodManagerMenuScreen.SelectedFrame = nil
	ScreenAnchors.GodManagerMenuScreen.SelectedAssistFrame = nil
end

function CloseGodMenuScreen(screen, button)
	SetConfigOption({ Name = "FreeFormSelectRepeatDelay", Value = 0.0 })
	PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENULoudLow" })
	PlaySound({ Name = "/Leftovers/World Sounds/Caravan Interior/CabinetClose" })

	DestroySelectedFrameGodMenu()
	DestroyCursorFrameGodMenu()
	DisableShopGamepadCursor()
	OnScreenClosed({ Flag = "GodManagerMenu" })

	CloseScreen(GetAllIds(screen.Components), 0.15)
	ScreenAnchors.GodManagerMenuScreen = nil

	UnfreezePlayerUnit()
	screen.KeepOpen = false
	ShowCombatUI("GodManagerMenu")
	UpdateStoneOfBanishmentShineStatus()
end

function HandleExiledToggle(screen, button, textOverride)
	local god = button.Data
	local buttonKey = button.ButtonKey
	local components = screen.Components
	local lootData = LootData[god.Name]
	local exilData = GetExilData()
	if IsLootDataIconAvailable(lootData) then
		if not IsGodAvailableForExil(god) then -- Unknown
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(buttonKey..";Click Unknown:"..god.Name))
			return
		else                                            -- Known god
			if not IsGodUnlockedForExil(god.Name) then  -- God is still locked
				if HasResource("GiftPoints", GetCurrentCost()) then -- Can pay
					UnlockExiledGod(screen, button)
				else                                    --Can't pay
					thread(PlayVoiceLines, ResourceData["GiftPoints"].BrokerCannotSpendVoiceLines, true)
				end
			elseif IsGodExiled(god.Name) then -- God Unlocked and Selected
				--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Click Unselect:"..god.Name))
				RemoveExiledGod(screen, button)
			else                                                       -- God Unlocked and Not Selected
				if GetCurrentCost() > TableLength(exilData.CurrentExiledGods) then -- Can add god
					--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Click Add:"..god.Name))
					AddExiledGod(screen, button)
				else -- Already full
					--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Shake the locks"))
					thread(PlayVoiceLines, GlobalVoiceLines.CombatResolvedLowHealthVoiceLines, true)
				end
			end
		end
	end
end

function HandleDualExiledToggle(screen, button, textOverride)
	local god = button.Data
	local otherButton = button.OtherButton
	local lootData = LootData[god.Name]
	if IsLootDataIconAvailable(lootData)  then
		if not IsGodAvailableForExil(god) then -- Unknown
			return
		else                                   -- Known god
			if not (IsDualGodUnlockedForExil(god.Name)) then -- God is still locked
				if HasResource("SuperGiftPoints", 1) then                              -- Can pay
					UnlockDualExiledGod(screen, button)
				else                                                                   --Can't pay
					thread(PlayVoiceLines, ResourceData["SuperGiftPoints"].BrokerCannotSpendVoiceLines, true)
				end
			elseif IsGodExiled(god.Name) then -- God Unlocked and Selected
				--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Click Unselect:"..god.Name))
				RemoveExiledGod(screen, button)
			else                       -- God Unlocked and Not Selected
				if IsGodExiled(otherButton.Data.Name) then -- Can add god
					RemoveExiledGod(screen, otherButton)
				end
				AddExiledGod(screen, button)
			end
		end
	end
end

function IsLootDataIconAvailable(lootData)
	return lootData ~= nil and lootData.BoonInfoIcon
end

function IsGodAvailableForExil(god)
	return TextLinesRecord[god.RequiredTextLine] ~= nil
end

function IsGodUnlockedForExil(godName)
	local exilData = GetExilData()
	return exilData.ExiledGodUnlocks[godName] ~= nil and exilData.ExiledGodUnlocks[godName]
end

function IsDualGodUnlockedForExil(godName)
	local exilData = GetExilData()
	return exilData.ExiledDualGodUnlocks[godName] ~= nil and exilData.ExiledDualGodUnlocks[godName]
end

function IsGodExiled(godName)
	local exilData = GetExilData()
	return (IsGodUnlockedForExil(godName) and exilData.CurrentExiledGods[godName] ~= nil and
		exilData.CurrentExiledGods[godName]) or (IsDualGodUnlockedForExil(godName) and exilData.ExiledDualGodUnlocks[godName] ~= nil and
		exilData.ExiledDualGodUnlocks[godName])
end

function UnlockExiledGod(screen, button)
	local exilData = GetExilData()
	local cost = GetCurrentCost()
	exilData.ExiledGodUnlocks[button.Data.Name] = true

	--wait(0.1)
	local components = screen.Components
	-- To all buttons....
	if GetCurrentCost() == 0 then
		ModifyTextBox({ Id = components.FreeExilMessage.Id, Text = "FreeExilMessage", LuaKey = "TempTextData", LuaValue = { NumExil = LockAt - TableLength(exilData.ExiledGodUnlocks) } })
		Destroy({ Id = components[button.ButtonKey .. "Cost"].Id })
	else
		if cost ~= 0 then
			SpendResource("GiftPoints", cost, "ExiledGodUnlock")
		end
		ModifyTextBox({ Id = components.FreeExilMessage.Id, Text = " " })
		if GameState.LifetimeResourcesGained.GiftPoints ~= nil and GameState.LifetimeResourcesGained.GiftPoints > 0 then
			ModifyTextBox({ Id = components.CurrentGift.Id, Text = "Available_GiftPoints", LuaKey = "TempTextData", LuaValue = { Amount = tostring(GameState.Resources.GiftPoints) } })
		end
		if GameState.LifetimeResourcesGained.SuperGiftPoints ~= nil and GameState.LifetimeResourcesGained.SuperGiftPoints > 0 then
			ModifyTextBox({
				Id = components.CurrentSuperGift.Id,
				Text = "Available_SuperGiftPoints",
				LuaKey =
				"TempTextData",
				LuaValue = { Amount = tostring(GameState.Resources.SuperGiftPoints) }
			})
		end
		if components[button.ButtonKey .. "Cost"].Id ~= nil then
			local indexToRemove = -1
			for index, id in ipairs(CostButtonTable) do
				if id == components[button.ButtonKey .. "Cost"].Id then
					indexToRemove = index
					Destroy({ Id = components[button.ButtonKey .. "Cost"].Id })
				else
					ModifyTextBox({ Id = id, Text = "GiftPointCost", LuaKey = "TempTextData", LuaValue = { Amount = tostring(GetCurrentCost()) } })
				end
			end
			if indexToRemove >= 0 then
				table.remove(CostButtonTable, indexToRemove)
			end
		end
	end
	RefreshLockIcons(components)
	SetColor({ Id = components[button.ButtonKey].Id, Color = { 1.0, 1.0, 1.0, 1.0 } })
end

function UnlockDualExiledGod(screen, button)
	local exilData = GetExilData()
	exilData.ExiledDualGodUnlocks[button.Data.Name] = true

	--wait(0.1)
	local components = screen.Components
	-- To all buttons....
	if components[button.ButtonKey .. "Cost"] ~= nil then
		Destroy({ Id = components[button.ButtonKey .. "Cost"].Id })		
	end
	SpendResource("SuperGiftPoints", 1, "ExiledGodUnlock")
	if GameState.LifetimeResourcesGained.SuperGiftPoints ~= nil and GameState.LifetimeResourcesGained.SuperGiftPoints > 0 then
		ModifyTextBox({
			Id = components.CurrentSuperGift.Id,
			Text = "Available_SuperGiftPoints",
			LuaKey =
			"TempTextData",
			LuaValue = { Amount = tostring(GameState.Resources.SuperGiftPoints) }
		})
	end
	SetColor({ Id = components[button.ButtonKey].Id, Color = { 1.0, 1.0, 1.0, 1.0 } })
end

function AddExiledGod(screen, button)
	local exilData = GetExilData()
	exilData.CurrentExiledGods[button.Data.Name] = true
	local components = screen.Components
	RefreshLockIcons(components)
	SetAlpha({ Id = components[button.ButtonKey .. "Lock"].Id, Fraction = 1.0 })
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Selected: "..godName..";"..GameState.ExiledGodUnlocks[godName]))
end

function RemoveExiledGod(screen, button)
	local exilData = GetExilData()
	exilData.CurrentExiledGods[button.Data.Name] = nil
	local components = screen.Components
	RefreshLockIcons(components)
	SetAlpha({ Id = components[button.ButtonKey .. "Lock"].Id, Fraction = 0.0 })
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Selected: "..godName..";"..GameState.ExiledGodUnlocks[godName]))
end

function RefreshLockIcons(components)
	for i = 1, GetMaxLock() do
		if GetCurrentCost() - i - TableLength(GetExilData().CurrentExiledGods) >= 0 then
			SetColor({ Id = components["ExilIcon" .. i].Id, Color = { 1.0, 1.0, 1.0, 1.0 } })
		else
			SetColor({ Id = components["ExilIcon" .. i].Id, Color = { 0.25, 0.25, 0.25, 1.0 } })
		end
	end
end

function UpdateExiledGodButtons(buttonKey, godName)
	local components = ScreenAnchors.GodManagerMenuScreen.Components

	local exilData = GetExilData()
	if exilData.ExiledGodUnlocks[godName] then
		SetColor({ Id = components[buttonKey].Id, Color = { 1.0, 1.0, 1.0, 1.0 } })
		if exilData.CurrentExiledGods[godName] then
			SetAnimation({ DestinationId = components[buttonKey .. "Lock"].Id, Name = "LockedKeepsakeIcon" })
		else
			SetAnimation({ DestinationId = components[buttonKey .. "Lock"].Id, Name = "BlankObstacle" })
		end
	else
		SetColor({ Id = buttonKey.Id, Color = { 0.15, 0.15, 0.15, 0.95 } })
	end

	--[[local components = ScreenAnchors.WeaponUpgradeScreen.Components
	for itemIndex, itemData in pairs( WeaponUpgradeData[weaponName] ) do
		local purchaseButtonKey = "PurchaseButton"..itemIndex

		if not IsUpgradeWeaponUpgradeDisabled( weaponName, itemIndex ) and not IsBuyWeaponUpgradeDisabled( weaponName, itemIndex ) then
			if not CanUpgradeWeaponUpgrade( weaponName, itemIndex ) then
				ModifyTextBox({ Id = components[purchaseButtonKey.."KeyCost"].Id, Text = "Blank" })
				SetColor({ Id = components[purchaseButtonKey.."KeyCost"].Id, Color = Color.DarkSlateGray })
				UseableOff({ Id = components[purchaseButtonKey .. "Upgrade"].Id })
			else
				ModifyTextBox({ Id = components[purchaseButtonKey.."KeyCost"].Id,
					Text = "MetaUpgrade_Locked_SuperKeys",
					LuaKey = "TempTextData",
					LuaValue = { Amount = GetNextWeaponUpgradeKeyCost( weaponName, itemIndex )}})
				if not HasResource("SuperLockKeys", GetNextWeaponUpgradeKeyCost( weaponName, itemIndex )) then
					ModifyTextBox({ Id = components[purchaseButtonKey.."KeyCost"].Id, ColorTarget = Color.CostUnaffordable, ColorDuration = 0.25 })
				end
			end
		end

		local traitData = {}
		if not IsBuyWeaponUpgradeDisabled( weaponName, itemIndex ) then
			if itemData.RequiredInvestmentTraitName then
				itemName = itemData.RequiredInvestmentTraitName
				if GetWeaponUpgradeLevel(weaponName, itemIndex) > 0  then
					traitData =  GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = itemName, Rarity = GetRarityKey(GetWeaponUpgradeLevel( weaponName, itemIndex ))})
					SetTraitTextData( traitData )
				end
			end
			if itemData.TraitName then
				traitData =  GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = itemData.TraitName, Rarity = GetRarityKey(GetWeaponUpgradeLevel( weaponName, itemIndex )) })
				SetTraitTextData( traitData )
			end

			if traitData.Name then
				ModifyTextBox({ Id = components[purchaseButtonKey].Id, UseDescription = true, Text = traitData.Name, LuaKey = "TooltipData", LuaValue = traitData, ExcludeText = "SeasonalItem" })
			end
		end

		if not CanUpgradeWeaponUpgrade( weaponName, itemIndex ) then
			if IsWeaponUpgradeMaxed( weaponName, itemIndex ) then
				ModifyTextBox({ Id = components[purchaseButtonKey.."Level"].Id, Text = "UI_TraitLevel_Max" })
			end
		elseif GetWeaponUpgradeLevel(weaponName, itemIndex ) > 0 then
			ModifyTextBox({ Id = components[purchaseButtonKey.."Level"].Id, Text = "UI_TraitLevel", LuaKey = "TempTextData", LuaValue = { Amount = GetWeaponUpgradeLevel(weaponName, itemIndex )} })
		end

		if IsWeaponUpgradeEquipped( weaponName, itemIndex ) then
			if itemIndex ~= lastEquippedIndex then

				SetAnimation({ Name = "EquippedIcon", DestinationId = components[purchaseButtonKey.."Subtitle"].Id })
				PlaySound({ Name = WeaponUpgradeData[weaponName][itemIndex].EquipSound or "/Leftovers/SFX/PerfectTiming" })
				thread( PlayVoiceLines, GlobalVoiceLines.SwitchedWeaponUpgradeVoiceLines, true )
			end
		else
			SetAnimation({ Name = "Blank", DestinationId = components[purchaseButtonKey.."Subtitle"].Id })
			ModifyTextBox({ Id = components[purchaseButtonKey.."Subtitle"].Id, Text = "Blank" })
		end
	end]]
end

-- Change God Pool Mechanic
--[[ModUtil.Path.Wrap( "IsRoomRewardEligible",
	function(baseFunc, run, room, reward, previouslyChosenRewards, args)
		if GameState.CurrentExiledGods ~= nil and Contains( GameState.CurrentExiledGods, reward.LootName ) then
			ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Denied"))
			return false
		end
		return baseFunc(run, room, reward, previouslyChosenRewards, args)
	end
)]]

ModUtil.Path.Wrap("CheckRunStartFlags",
	function(baseFunc, currentRun)
		EquipLastExiledGods()
		baseFunc(currentRun)
	end
)
ModUtil.Path.Wrap("SetupRoomReward",
	function(baseFunc, currentRun, room, previouslyChosenRewards, args)
		args = args or {}
		local excludeLootNames = {}
		local exilData = GetExilData()
		for god, exiled in pairs(exilData.CurrentExiledGods) do
			if exiled then
				table.insert(excludeLootNames, god)
			end
		end
		for k, trait in pairs(CurrentRun.Hero.Traits) do
			if trait ~= nil and trait.ForceBoonName ~= nil and trait.Uses > 0 then
				ModUtil.Hades.PrintStackChunks(ModUtil.ToString(trait.ForceBoonName))
				trait.Uses = 0
			end
		end
		if not args.IgnoreForceLootName then
			for k, trait in pairs(CurrentRun.Hero.Traits) do
				if trait ~= nil and trait.ForceBoonName ~= nil and trait.Uses > 0 and Contains(excludeLootNames, trait.ForceBoonName) then
					args.IgnoreForceLootName = true
				end
			end
		end
		baseFunc(currentRun, room, previouslyChosenRewards, args)
	end
)
ModUtil.Path.Wrap("GetEligibleLootNames",
	function(baseFunc, excludeLootNames)
		local output = baseFunc(excludeLootNames)
		local exilData = GetExilData()
		if TableLength(exilData.CurrentExiledGods) > 0 then
			ModUtil.Hades.PrintStackChunks(ModUtil.ToString("CurrentExiledGods"))
			for _, lootName in ipairs(output) do
				if TableLength(output) <= 1 then
					break
				end
				if exilData.CurrentExiledGods[lootName] ~= nil and exilData.CurrentExiledGods[lootName] then
					ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Removing from Eligible:" .. lootName))
					RemoveValue(output, lootName)
				end
			end
		end
		return output
	end
)
