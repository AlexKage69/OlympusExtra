ModUtil.Path.Wrap( "BeginOpeningCodex", 
		function(baseFunc)
			-- if (not CanOpenCodex()) and IsSuperValid() then
			-- 	BuildSuperMeter(CurrentRun, 50)
			-- end
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString.Deep(GiftOrdering)) 
			--CreateLoot({ Name = "HephaestusUpgrade", SpawnPoint = CurrentRun.Hero.ObjectId } )
			--baseFunc()
			StartUpGodManagerMenu({})
		end
	)

OnUsed { "OlympianTablet",
	function(triggerArgs)
		ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Open Tablet"))
		if CurrentRun.CurrentRoom.BlockKeepsakeMenu and not CanFreeSwapKeepsakes() then
			CannotUseRackPresentation(triggerArgs.triggeredById)
			return
		end

		PlayInteractAnimation(triggerArgs.triggeredById)
		StartUpGodManagerMenu(triggerArgs.TriggeredByTable)
	end
}
local OlympusObstacleData = ModUtil.Entangled.ModData(ObstacleData)
ObstacleData.OlympianTablet =
	{
		UseText = "UseAwardMenu",
		UsePromptOffsetX = 65,
		UsePromptOffsetY = -50,
	}
local OlympusUIData = ModUtil.Entangled.ModData(UIData)
OlympusUIData.GodManagerMenu = {
	CurrentPage = 0,
	ItemsPerPage = 4,
	BaseIconScale = 0.3,
	HoverIconScale = 0.5,
	AvailableGods = {},
	NormalSelectionFrame = "GodManagerMenuItemEquipped",
}
local OlympusGiftData = ModUtil.Entangled.ModData(GiftData)
OlympusGiftData.ZeusUpgrade[4] = { UnlockExiled = true }
OlympusGiftData.PoseidonUpgrade[4] = { UnlockExiled = true }
OlympusGiftData.ArtemisUpgrade[4] = { UnlockExiled = true }
OlympusGiftData.AphroditeUpgrade[4] = { UnlockExiled = true }
OlympusGiftData.DemeterUpgrade[4] = { UnlockExiled = true }
OlympusGiftData.AresUpgrade[4] = { UnlockExiled = true }
OlympusGiftData.DionysusUpgrade[4] = { UnlockExiled = true }
OlympusGiftData.AthenaUpgrade[4] = { UnlockExiled = true }
OlympusGiftData.DionysusUpgrade[4] = { UnlockExiled = true }
OlympusGiftData.HermesUpgrade[4] = { UnlockExiled = true, DualGod = "HephaestusUpgrade" }
OlympusGiftData.TrialUpgrade[4] = { UnlockExiled = true, DualGod = "QuestUpgrade" }

local OlympusObjectiveSetData = ModUtil.Entangled.ModData(ObjectiveSetData)
OlympusObjectiveSetData.OlympianTabletPrompt =
{
	AllowRepeat = false,
	PriorityLevel = 2,
	OverrideExistingObjective = false,
	RequiredRoom = "RoomPreRun",
	RequireNewTraits = true,
	Objectives =
	{
		{ "OlympianTabletPrompt" }
	},
}
local OlympusObjectiveData = ModUtil.Entangled.ModData(ObjectiveData)
OlympusObjectiveData.OlympianTabletPrompt = { Description = "Objective_UseOlympianTablet" }

function UpdateOlympianTabletShineStatus()
	if ScreenAnchors.GodManagerMenuSparkleId ~= nil then
		Destroy({ Id = ScreenAnchors.GodManagerMenuSparkleId })
	end
	local id = GetIdsByType({ Name = "OlympianTablet" })[1]
	if id ~= nil and HasNewTraits() and not CurrentRun.CurrentRoom.BlockKeepsakeMenu then
		ScreenAnchors.GodManagerMenuSparkleId = SpawnObstacle({ Name = "BlankObstacle", Group = "FX_Standing" })
		SetThingProperty({ Property = "SortMode", Value = "Id", DestinationId = ScreenAnchors.GodManagerMenuSparkleId })
		Attach({ Id = ScreenAnchors.GodManagerMenuSparkleId, DestinationId = id })
		SetAnimation({ Name = "OlympianTabletGlean", DestinationId = ScreenAnchors.GodManagerMenuSparkleId })
	end
end

ModUtil.Path.Wrap("CheckRunStartFlags",
	function(baseFunc, currentRun)
		EquipLastExiledGods()
		baseFunc(currentRun)
	end
)

function CreateExiledGodsData()
	return {
		Gods = {},
		Hermes = nil,
		Chaos = nil,
	}
end

function EquipLastExiledGods(eventSource, hero)
	local existingHero = CurrentRun.Hero or hero
	if GameState.ExiledGods == nil then
		GameState.ExiledGods = CreateExiledGodsData()
	end
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
	if GameState.ExiledGodUnlocks == nil then
		GameState.ExiledGodUnlocks = {}
	end
	if GameState.CurrentExiledGods == nil then
		GameState.CurrentExiledGods = {}
	end
	local exiledGods = {Single = {}, Dual = {}}
	for npcName, giftData in pairs(GameState.Gift) do
		for s = 1, GetMaxGiftLevel(npcName) do
			local data = GetGiftLevelData(npcName, s)
			if data ~= nil and data.UnlockExiled then
				local available = false
				local broughtIt = false
				local selected = false
				if (s >= 4) then
					available = true
					broughtIt = GameState.ExiledGodUnlocks[npcName]
					selected = GameState.CurrentExiledGods[npcName]
				end
				if data.DualGod == nil then
					table.insert(exiledGods.Single,
						{ Known = (s <= GetGiftLevel(npcName)), Available = available, NPC = npcName, Unlocked = broughtIt, Selected = selected })
				else
					table.insert(exiledGods.Dual,
						{ Known = (s <= GetGiftLevel(npcName) and s <= GetGiftLevel(data.DualGod)), Available = available, NPC = npcName, Unlocked = broughtIt, Selected = selected, DualGod = data.DualGod })
				end
			end
		end
	end
	for i = 1, 10, 1 do
		table.insert(exiledGods.Single,
						{ Known = false, Available = false, NPC = "TestUpgrade", Unlocked = false, Selected = false })
	end
	table.insert(exiledGods.Dual,
					{ Known = false, Available = false, NPC = "TestUpgrade", Unlocked = false, Selected = false, DualGod = "TestUpgrade2" })
	return exiledGods
end

function ExiledGodsSort(itemA, itemB)
	if GiftOrderingReverseLookup[itemA.Gift] and GiftOrderingReverseLookup[itemB.Gift] then
		return GiftOrderingReverseLookup[itemA.Gift] < GiftOrderingReverseLookup[itemB.Gift]
	end

	if itemA.NPC ~= itemB.NPC then
		return itemA.NPC < itemB.NPC
	end

	return itemA.Level < itemB.Level
end

function StartUpGodManagerMenu(GodManagerMenuObject)
	UIData.GodManagerMenu.AvailableExiledGods = GetAvailableExiledGods()
	CurrentRun.CurrentRoom.GodManagerMenuObject = GodManagerMenuObject
	ShowGodManagerMenu()

	if GameState.LastAwardTrait ~= nil then
		thread(MarkObjectiveComplete, "OlympianTabletPrompt")
	end
end

function ShowGodManagerMenu()
	if IsScreenOpen("GodManagerMenu") then
		return
	end
	for name, exiled in pairs( GameState.CurrentExiledGods) do
		ModUtil.Hades.PrintStackChunks(ModUtil.ToString(name))
	end
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
	SetAnimation({ DestinationId = components.Background.Id, Name = "GenericLetter" })
	SetScale({ Id = components.Background.Id, Fraction = 1.2 })
	
	components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "Combat_Menu" })
	Attach({ Id = components.CloseButton.Id, DestinationId = components.Background.Id, OffsetX = 100, OffsetY = ScreenCenterY - 70 })
	components.CloseButton.OnPressedFunctionName = "CloseGodMenuScreen"
	components.CloseButton.ControlHotkey = "Cancel"

	PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENU" })
	PlaySound({ Name = "/Leftovers/World Sounds/Caravan Interior/ChestOpen" })

	--Title
	local title = "Olympian Tablet"
	local subtitle = "Exil gods and goddesses."
	components.Title = CreateTextBox({ Id = components.Background.Id, Text = title, FontSize = 34,
	OffsetX = 0, OffsetY = -380, Color = Color.White, Font = "SpectralSCLight",
	ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
	--SubTitle
	components.Subtitle = CreateTextBox({ Id = components.Background.Id, Text = subtitle, FontSize = 19,
	OffsetX = 0, OffsetY = -335, Width = 840, Color = Color.SubTitle, Font = "CrimsonTextItalic",
	ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
	--Exiled Left
	components.ExilText = CreateTextBox({ Id = components.Background.Id, Text = "Available ", FontSize = 19,
	OffsetX = 400, OffsetY = -365, Width = 840, Color = Color.SubTitle, Font = "CrimsonTextItalic",
	ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })

	components.ExilNum = CreateTextBox({ Id = components.Background.Id, Text = "0", FontSize = 19,
	OffsetX = 400, OffsetY = -345, Width = 840, Color = Color.SubTitle, Font = "CrimsonTextItalic",
	ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
	local spacerX = 150
	local spacerY = 150
	local startX = 700
	local startY = 300
	local rowMax = 6
	local rowMin = math.ceil(rowMax / 2)
	local maxIndex = 0
	for itemIndex, exiledGod in ipairs(UIData.GodManagerMenu.AvailableExiledGods.Single) do
		local localx = startX - spacerX * rowMin/2 + ((itemIndex - 1) % rowMax + 0.5) * spacerX
		local localy = startY + math.floor( (itemIndex - 1) / rowMax)* 2 * (spacerY / 2)
		CreateExiledGodIcon( components, { Index = itemIndex, God = exiledGod, X = localx, Y = localy })
		maxIndex = itemIndex
	end
	startY = 750
	startX = 870
	spacerX = 320
	rowMax = 6
	rowMin = math.ceil(rowMax / 2)
	local extraIndex = 0

	for itemIndex, exiledGod in ipairs(UIData.GodManagerMenu.AvailableExiledGods.Dual) do
		local localx = startX - spacerX * rowMin/2 + ((itemIndex - 1) % rowMax + 0.5) * spacerX
		local localy = startY + math.floor( (itemIndex - 1) / rowMax)* 2 * (spacerY / 2)
		CreateExiledGodIcon( components, { Index = itemIndex+maxIndex+extraIndex, God = exiledGod, X = localx, Y = localy })
		extraIndex = extraIndex + 1
		-- Other God
		local otherGod = { Known = exiledGod.Known, Available = exiledGod.Available, NPC = exiledGod.DualGod, Unlocked = exiledGod.Unlocked, Selected = exiledGod.Selected, DualGod = exiledGod.NPC }
		CreateExiledGodIcon( components, { Index = itemIndex+maxIndex+extraIndex, God = otherGod, X = localx + 135, Y = localy })
	end
	-- CreateTextBox({ Id = components.ShopBackground.Id, Text = "GodManagerMenu_Hint", FontSize = 14, OffsetX = 0, OffsetY = 420, Width = 840, Color = Color.Gray, Font = "CrimsonTextBoldItalic", ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center" })

	--[[components.EquipSubtitle = CreateScreenComponent({ Name = "BlankObstacle", X = ScreenCenterX, Y = 850, Group =
	"Combat_Menu" })
	CreateTextBox({ Id = components.EquipSubtitle.Id, Text = "OemQuestion", FontSize = 24, OffsetX = 600, OffsetY = 100, Width = 840, Color =
	Color.LightSlateGray, Font = "AlegreyaSansRegular", ShadowBlur = 0, ShadowColor = { 0, 0, 0, 1 }, ShadowOffset = { 0, 2 }, Justification =
	"Center" })

	-- Description box
	local descriptionStartX = 1325
	local descriptionStartY = 75
	local descriptionTextOffsetX = 0
	local descriptionTextOffsetY = 185
	components.CurrentLevel = CreateScreenComponent({ Name = "BlankObstacle", X = descriptionStartX, Y =
	descriptionStartY + 340, Group = "Combat_Menu" })
	CreateTextBox({
		Id = components.CurrentLevel.Id,
		OffsetX = descriptionTextOffsetX,
		OffsetY = descriptionTextOffsetY,
		FontSize = 24,
		Width = 450,
		Justification = "Left",
		VerticalJustification = "Top",
		LineSpacingBottom = 8,
		Font = "AlegreyaSansSCBold",
		Format = "BaseFormat",
		VariableAutoFormat = "BoldFormatGraft",
	})
	local levelProgressYOffset = 380

	local lang = GetLanguage({})
	if lang == "ja" then
		levelProgressYOffset = levelProgressYOffset + 18
	end
	components.LevelProgress = CreateScreenComponent({ Name = "BlankObstacle", X = descriptionStartX, Y =
	descriptionStartY + levelProgressYOffset, Group = "Combat_Menu" })
	CreateTextBox({
		Id = components.LevelProgress.Id,
		OffsetX = descriptionTextOffsetX,
		OffsetY = descriptionTextOffsetY,
		Width = 450,
		FontSize = 18,
		Justification = "Left",
		VerticalJustification = "Top",
		LineSpacingBottom = 8,
		Font = "AlegreyaSansRegular",
		Format = "BaseFormat",
		VariableAutoFormat = "BoldFormatGraft",
	})
	components.InfoBackground = CreateScreenComponent({ Name = "BlankObstacle", X = descriptionStartX, Y =
	descriptionStartY, Group = "Combat_Menu" })
	SetScaleY({ Id = components.InfoBackground.Id, Fraction = 1.4 })
	CreateTextBox({
		Id = components.InfoBackground.Id,
		OffsetX = descriptionTextOffsetX,
		OffsetY = descriptionTextOffsetY,
		FontSize = 36,
		Color = Color.Title2,
		Font = "AlegreyaSansSCBold",
		ShadowBlur = 0,
		ShadowColor = { 0, 0, 0, 1 },
		ShadowOffset = { 0, 4 },
		Justification = "Left",
		LangFrScaleModifier = 0.8,
		LangItScaleModifier = 0.8,
		LangDeScaleModifier = 0.8,
		LangEsScaleModifier = 0.8,
		LangPtBrScaleModifier = 0.8,
		LangKoScaleModifier = 0.8,
		LangRuScaleModifier = 0.65,
		LangPlScaleModifier = 0.75,
	})
	components.Sticker = CreateScreenComponent({ Name = "BlankObstacle", X = descriptionStartX + 230, Y =
	descriptionStartY + GetLocalizedValue(720, { { Code = "ja", Value = 740 }, }), Group = "Combat_Menu_Additive" })

	components.InfoBackgroundDescription = CreateScreenComponent({ Name = "BlankObstacle", X = descriptionStartX, Y =
	descriptionStartY, Group = "Combat_Menu" })
	CreateTextBox({
		Id = components.InfoBackgroundDescription.Id,
		FontSize = 18,
		OffsetX = descriptionTextOffsetX,
		OffsetY = descriptionTextOffsetY + 40,
		Color = Color.DefaultText,
		Width = 485,
		Justification = "Left",
		VerticalJustification = "Top",
		LineSpacingBottom = 6,
		UseDescription = true,
		Font = "AlegreyaSansRegular",
		Format = "BaseFormat",
		VariableAutoFormat = "BoldFormatGraft",
		UseDescription = true,
		LangKoScaleModifier = 0.875,
	})

	ScreenAnchors.GodManagerMenuScreen.LastTrait = GameState.LastAwardTrait
	ScreenAnchors.GodManagerMenuScreen.LastAssist = GameState.LastAssistTrait

	local spacerX = 118
	local spacerY = 165
	local startX = 405
	local startY = 280
	local rowMax = 10
	local rowMin = math.ceil(rowMax / 2)
	UIData.GodManagerMenu.HasUnlocked = false
	UIData.GodManagerMenu.HasNew = false
	UIData.GodManagerMenu.FirstUsable = false
	UIData.GodManagerMenu.NewLegendary = false
	UIData.GodManagerMenu.FirstNewLegendary = true
	for itemIndex, upgradeData in ipairs(UIData.GodManagerMenu.AvailableKeepsakeTraits) do
		local localx = 0
		local localy = 0
		localx = startX - spacerX * rowMin / 2 + ((itemIndex - 1) % rowMax + 0.5) * spacerX
		localy = startY + math.floor((itemIndex - 1) / rowMax) * 2 * (spacerY / 2)

		if TraitData[upgradeData.Gift].Slot == "Assist" then
			localy = localy + 180
		end
		CreateKeepsakeIcon(components, { Index = itemIndex, UpgradeData = upgradeData, X = localx, Y = localy })
	end
	for itemIndex, upgradeData in ipairs(UIData.GodManagerMenu.AvailableAssistTraits) do
		if not upgradeData.New or GameState.Flags.FirstNewLegendary then
			UIData.GodManagerMenu.FirstNewLegendary = false
		elseif upgradeData.New then
			UIData.GodManagerMenu.NewLegendary = true
		end
	end
	-- Assist trait modifications
	spacerX = 198
	startX = 0
	startY = startY + 2 * spacerY + 230
	local createdKeepsakes = 0
	local hasUnlockedKeepsakes = false
	for itemIndex, upgradeData in ipairs(UIData.GodManagerMenu.AvailableAssistTraits) do
		local localx = 0
		local localy = 0
		localx = startX + itemIndex * spacerX
		localy = startY
		createdKeepsakes = createdKeepsakes + 1
		if upgradeData.Unlocked then
			CreateKeepsakeIcon(components,
				{ Index = itemIndex, UpgradeData = upgradeData, X = localx, Y = localy - 20, RankOffsetY = 100, AddUpgradeButton = true, KeyAppend =
				"Legendary" })
			hasUnlockedKeepsakes = true
		else
			components["Locked" .. itemIndex] = CreateScreenComponent({ Name = "LegendaryKeepsakeLockedButton", X =
			localx, Y = localy + 10, Group = "Combat_Menu" })
			components["Locked" .. itemIndex].TitleTextBoxId = components.InfoBackground.Id
			components["Locked" .. itemIndex].DescriptionTextBoxId = components.InfoBackgroundDescription.Id
			components["Locked" .. itemIndex].CurrentLevelId = components.CurrentLevel.Id
			components["Locked" .. itemIndex].LevelProgressId = components.LevelProgress.Id
			ScreenAnchors.GodManagerMenuScreen[components["Locked" .. itemIndex].Id] = components["Locked" .. itemIndex]
		end
	end
	for itemIndex = createdKeepsakes + 1, 6 do
		local localx = 0
		local localy = 0
		localx = startX + itemIndex * spacerX
		localy = startY
		components["Locked" .. itemIndex] = CreateScreenComponent({ Name = "LegendaryKeepsakeLockedButton", X = localx, Y =
		localy + 10, Group = "Combat_Menu" })
		components["Locked" .. itemIndex].TitleTextBoxId = components.InfoBackground.Id
		components["Locked" .. itemIndex].DescriptionTextBoxId = components.InfoBackgroundDescription.Id
		components["Locked" .. itemIndex].CurrentLevelId = components.CurrentLevel.Id
		components["Locked" .. itemIndex].LevelProgressId = components.LevelProgress.Id
		components["Locked" .. itemIndex].Unavailable = true
		ScreenAnchors.GodManagerMenuScreen[components["Locked" .. itemIndex].Id] = components["Locked" .. itemIndex]
	end

	if GameState.LifetimeResourcesGained.SuperGiftPoints ~= nil and GameState.LifetimeResourcesGained.SuperGiftPoints > 0 and hasUnlockedKeepsakes then
		components.CurrentKeys = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray" })
		CreateTextBox({
			Id = components.CurrentKeys.Id,
			Text = "Available_SuperGiftPoints",
			FontSize = 24,
			OffsetX = 330,
			OffsetY = 135,
			Color = Color.White,
			Font = "AlegreyaSansSCRegular",
			ShadowBlur = 0,
			ShadowColor = { 0, 0, 0, 1 },
			ShadowOffset = { 0, 2 },
			Justification = "Right",
			LuaKey = "TempTextData",
			LuaValue = { Amount = tostring(GameState.Resources.SuperGiftPoints) }
		})
	end

	if not UIData.GodManagerMenu.HasUnlocked then
		if components["UpgradeToggle1"] ~= nil then
			SetCursorFrameGodMenu(components["UpgradeToggle1"])
			TeleportCursor({ OffsetX = startX - spacerX * rowMin / 2, OffsetY = startY })
		end
		thread(PlayVoiceLines, GlobalVoiceLines.GodManagerMenuEmptyVoiceLines, false)
	elseif UIData.GodManagerMenu.FirstNewLegendary then
		thread(PlayVoiceLines, GlobalVoiceLines.GodManagerMenuNewLegendaryVoiceLines, false)
		GameState.Flags.FirstNewLegendary = true
	elseif UIData.GodManagerMenu.NewLegendary then
		thread(PlayVoiceLines, GlobalVoiceLines.GodManagerMenuNewAvailableVoiceLines, false)
	elseif UIData.GodManagerMenu.HasNew then
		thread(PlayVoiceLines, GlobalVoiceLines.GodManagerMenuNewAvailableVoiceLines, false)
	else
		thread(PlayVoiceLines, GlobalVoiceLines.OpenedGodManagerMenuVoiceLines, false)
	end]]

	ScreenAnchors.GodManagerMenuScreen.KeepOpen = true
	thread(HandleWASDInput, ScreenAnchors.GodManagerMenuScreen)
	HandleScreenInput(ScreenAnchors.GodManagerMenuScreen)
end

function CreateExiledGodIcon(components, args)
	args = args or {}
	local screen = args.Screen
	local localx = args.X
	local localy = args.Y
	local rankOffsetY = args.RankOffsetY or 70
	local itemIndex = args.Index
	local god = args.God
	local keyAppend = args.KeyAppend or ""
	local scale = args.Scale or 0.75

	local buttonKey = "UpgradeToggle" .. itemIndex .. keyAppend
	components[buttonKey .. "Frame"] = CreateScreenComponent({ Name = "BlankObstacle", X = localx, Y = localy + 10, Group =
	"Combat_Menu" })
	SetAnimation({ DestinationId = components[buttonKey .. "Frame"].Id, Name = "TraitTray_DetailsBacking" })
	SetScaleY({Id = components[buttonKey .. "Frame"].Id, Fraction = 0.41})
	SetScaleX({Id = components[buttonKey .. "Frame"].Id, Fraction = 0.075})
	SetColor({ Id = components[buttonKey .. "Frame"].Id, Color = { 0.15, 0.15, 0.15, 0.95 } })

	components[buttonKey] = CreateScreenComponent({ Name = "RadioButton", Scale = UIData.GodManagerMenu.BaseIconScale, X = localx, Y = localy, Group = "Combat_Menu" })
	components[buttonKey].Data = god
	components[buttonKey].ButtonKey = buttonKey
	components[buttonKey].FrameId = components[buttonKey.."Frame"].Id

	components[buttonKey].OnPressedFunctionName = "HandleExiledToggle"
	
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(ScreenAnchors.GodManagerMenuScreen))
	ScreenAnchors.GodManagerMenuScreen[components[buttonKey].Id] = components[buttonKey]
	local lootData = LootData[god.NPC]
	if lootData ~= nil and lootData.BoonInfoIcon then
		if god.Known then -- lock
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(buttonKey..";"..god.NPC))
			local icon = lootData.BoonInfoIcon
			SetAnimation({ DestinationId = components[buttonKey].Id, Name = icon })
			SetScale({Id = components[buttonKey].Id, Fraction = 0.9})
			components[buttonKey .. "Lock"] = CreateScreenComponent({ Name = "BlankObstacle", X = localx, Y = localy+25, Group =
				"Combat_Menu" })
			components[buttonKey].LockId = components[buttonKey .. "Lock"].Id
			if (not god.Unlocked) then
				SetColor({ Id = components[buttonKey].Id, Color = { 0.15, 0.15, 0.15, 1.0 } })
			end
			if (god.Selected) then
				
				SetAnimation({ DestinationId = components[buttonKey].LockId, Name = "LockedKeepsakeIcon" })
			end
		else
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(buttonKey..";Out:"..god.NPC))
			SetAnimation({ DestinationId = components[buttonKey].Id, Name = "Keepsake_Unknown" })			
		end
	else
		SetAnimation({ DestinationId = components[buttonKey].Id, Name = "Keepsake_Unknown" })
	end

	--[[if upgradeData.New then
		UIData.GodManagerMenu.HasNew = true
		CreateTextBox({
			Id = components[buttonKey].Id,
			Text = "NewGiftPrefix",
			OffsetX = 0,
			OffsetY = -50,
			FontSize = 18,
			Color = { 255, 235, 128, 255 },
			Font = "AlegreyaSansSCBold",
			ShadowBlur = 0,
			ShadowColor = { 0, 0, 0, 1 },
			ShadowOffset = { 0, 3 },
			OutlineThickness = 12,
			OutlineColor = { 0, 0, 0, 1 },
			Justification = "Center",
		})
	end]]

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

--[[OnMouseOver { "AssistUpgradeButton",
	function(triggerArgs)
		if triggerArgs.triggeredById == nil or not IsScreenOpen("GodManagerMenu") or ScreenAnchors.GodManagerMenuScreen == nil then
			return
		end
		local button = ScreenAnchors.GodManagerMenuScreen[triggerArgs.triggeredById]
		SetCursorFrameGodMenu(button.ParentButton)

		local traitName = button.ParentButton.TraitData
		if traitName then
			local traitData = button.ParentButton.TraitData
			local traitName = traitData.Name
			local newTraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitName, Rarity =
			GetRarityKey(GetKeepsakeLevel(traitData.Name) + 1) })
			SetTraitTextData(traitData, { ReplacementTraitData = newTraitData })
			ModifyTextBox({ Id = button.ParentButton.DescriptionTextBoxId, Text = traitData.Name .. "_Delta", UseDescription = true, LuaKey =
			"TooltipData", LuaValue = traitData })
			local text = "UnEquipped_Subtitle"
			if GameState.LastAssistTrait == traitName then
				text = "AssistTraitUpgrade_Subtitle"
			end
			ModifyTextBox({ Id = ScreenAnchors.GodManagerMenuScreen.Components.EquipSubtitle.Id, Text = text, ColorTarget =
			Color.White, ColorDuration = 0 })
		end
	end
}

OnMouseOff { "AssistUpgradeButton",
	function(triggerArgs)
		DestroyCursorFrameGodMenu()
	end
}

OnMouseOver { "LegendaryKeepsakeLockedButton",
	function(triggerArgs)
		if triggerArgs.triggeredById == nil or not IsScreenOpen("GodManagerMenu") or ScreenAnchors.GodManagerMenuScreen == nil then
			return
		end
		if ScreenAnchors.GodManagerMenuScreen.Components and ScreenAnchors.GodManagerMenuScreen.Components.Sticker then
			SetAnimation({ Name = "Blank", DestinationId = ScreenAnchors.GodManagerMenuScreen.Components.Sticker.Id })
		end
		SetLegendaryFrame(triggerArgs.triggeredById)
	end
}

OnMouseOff { "LegendaryKeepsakeLockedButton",
	function(triggerArgs)
		DestroyCursorFrameGodMenu()
	end
}
OnMouseOver { "RadioButton",
	function(triggerArgs)
		if triggerArgs.triggeredById == nil or not IsScreenOpen("GodManagerMenu") or ScreenAnchors.GodManagerMenuScreen == nil or ScreenAnchors.GodManagerMenuScreen[triggerArgs.triggeredById] == nil then
			return
		end
		local button = ScreenAnchors.GodManagerMenuScreen[triggerArgs.triggeredById]
		PlaySound({ Name = "/SFX/Menu Sounds/MirrorMenuToggleKeepsakes", Id = button.TitleTextBoxId })
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
			if button.Data.Unlocked then
				SetAlpha({ Id = components[button.ButtonKey .. "Bar"].Id, Fraction = 0, Duration = 0.3 })
				SetAlpha({ Id = components[button.ButtonKey .. "BarFill"].Id, Fraction = 0, Duration = 0.1 })
			end
		end
	end
}]]

function SetCursorFrameGodMenu(button)
	local components = ScreenAnchors.GodManagerMenuScreen.Components
	if ScreenAnchors.GodManagerMenuScreen.HoverFrame == nil then
		ScreenAnchors.GodManagerMenuScreen.HoverFrame = CreateScreenObstacle({ Name = "BlankObstacle", Group =
		"Combat_Menu_Additive" })
		-- SetScale({ Id = ScreenAnchors.GodManagerMenuScreen.HoverFrame, Fraction = 1.4})
	end

	Teleport({ Id = ScreenAnchors.GodManagerMenuScreen.HoverFrame, DestinationId = button.Id })
	--[[if TraitData[button.Data.Gift].Slot == "Assist" then
		SetAnimation({ Name = "LegendaryGodManagerMenuCursorHighlight", DestinationId = ScreenAnchors
		.GodManagerMenuScreen.HoverFrame })
		SetAnimation({ Name = "Blank", DestinationId = components.Sticker.Id })
	else
		SetAnimation({ Name = "GodManagerMenuCursorHighlight", DestinationId = ScreenAnchors.GodManagerMenuScreen
		.HoverFrame })
		if IsGameStateEligible(CurrentRun, GiftData[button.Data.NPC].MaxedRequirement) then
			SetAnimation({ Name = GiftData[button.Data.NPC].MaxedSticker, DestinationId = components.Sticker.Id })
		else
			SetAnimation({ Name = "Blank", DestinationId = components.Sticker.Id })
		end
	end]]
	--[[if not button.Data.Unlocked then
		ModifyTextBox({ Id = button.TitleTextBoxId, Text = "UnknownAward" })
		ModifyTextBox({ Id = button.DescriptionTextBoxId, Text = "UnknownAward", UseDescription = true })
		-- This should call Textbox.Clear instead of setting to a blank string
		ModifyTextBox({ Id = components.EquipSubtitle.Id, Text = " " })
		ModifyTextBox({ Id = button.CurrentLevelId, Text = " " })
		ModifyTextBox({ Id = button.LevelProgressId, Text = " " })
	else
		local traitData = button.TraitData
		local showKeepsakePreview = true

		local traitTooltip = GetTraitTooltip(traitData,
			{ UnequippedKeepsakePreview = showKeepsakePreview, InKeepsakePreview = true })
		ModifyTextBox({ Id = button.TitleTextBoxId, Text = traitTooltip })

		ModifyTextBox({ Id = button.DescriptionTextBoxId, Text = traitTooltip, UseDescription = true, LuaKey =
		"TooltipData", LuaValue = traitData })
		if traitData.Slot == "Assist" then
			ModifyTextBox({ Id = button.CurrentLevelId, Text = "LegendaryKeepsake_Level_" ..
			GetKeepsakeLevel(button.TraitData.Name), LuaKey = "TempTextData", LuaValue = { Level = GetKeepsakeLevel(button.TraitData.Name) } })
		else
			ModifyTextBox({ Id = button.CurrentLevelId, Text = "Keepsake_Level_" ..
			GetKeepsakeLevel(button.TraitData.Name), LuaKey = "TempTextData", LuaValue = { Level = GetKeepsakeLevel(button.TraitData.Name) } })
		end
		if IsKeepsakeMaxed(button.TraitData.Name) then
			ModifyTextBox({ Id = button.LevelProgressId, Text = "Keepsake_Level_Progress_Max" })
		else
			if button.TraitData.KeepsakeRarityGameStateRequirements then
				if not IsKeepsakeMaxed(button.TraitData.Name) then
					ModifyTextBox({ Id = button.LevelProgressId, Text = "Legendary_Keepsake_Level_Progress", LuaKey =
					"TempTextData", LuaValue = { NPCName = button.Data.NPC } })
				else
					ModifyTextBox({ Id = button.LevelProgressId, Text = "Keepsake_Level_Progress_Max" })
				end
			else
				ModifyTextBox({ Id = button.LevelProgressId, Text = "Keepsake_Level_Progress", LuaKey = "TempTextData", LuaValue = { Chambers = GetKeepsakeChambersToNextLevel(button.TraitData.Name) } })
			end
		end

		if button.Blocked then
			if (HeroSlotFilled("Shout") and not HeroHasTrait("HadesShoutTrait") and traitData.Name == "HadesShoutKeepsake") then
				ModifyTextBox({ Id = components.EquipSubtitle.Id, Text = "Hades_Keepsake_Blocked_Subtitle", Color = Color
				.LightSlateGray })
			else
				ModifyTextBox({ Id = components.EquipSubtitle.Id, Text = "Keepsake_Blocked_Subtitle", Color = Color
				.LightSlateGray })
			end
		else
			SetScale({ Id = button.Id, Fraction = UIData.GodManagerMenu.HoverIconScale, Duration = 0.1, EaseIn = 0, EaseOut = 1 })
			local upgradeName = button.Data.Gift
			if GameState.LastAwardTrait ~= upgradeName and GameState.LastAssistTrait ~= upgradeName then
				ModifyTextBox({ Id = components.EquipSubtitle.Id, Text = "UnEquipped_Subtitle", ColorTarget = Color
				.White, ColorDuration = 0 })
			else
				ModifyTextBox({ Id = components.EquipSubtitle.Id, Text = "Equipped_Subtitle", ColorTarget = Color.Gold, ColorDuration = 0 })
			end
			DestroyTextBox({ Id = button.Id })

			RemoveValue(GameState.Gift[button.Data.NPC].NewTraits, upgradeName)
		end
		if button and button.ButtonKey and components[button.ButtonKey .. "Bar"] and TraitData[button.Data.Gift].Slot ~= "Assist" then
			SetAlpha({ Id = components[button.ButtonKey .. "Bar"].Id, Fraction = 1, Duration = 0.1 })
			SetAlpha({ Id = components[button.ButtonKey .. "BarFill"].Id, Fraction = 1, Duration = 0.3 })
		end
	end]]

	--[[if ScreenAnchors.GodManagerMenuScreen.OpenedToButtonKey
		and ScreenAnchors.GodManagerMenuScreen.OpenedToButtonKey ~= button.ButtonKey
		and TraitData[button.Data.Gift].Slot ~= "Assist"
		and components[ScreenAnchors.GodManagerMenuScreen.OpenedToButtonKey .. "Bar"]
		and components[ScreenAnchors.GodManagerMenuScreen.OpenedToButtonKey .. "BarFill"] then
		SetAlpha({ Id = components[ScreenAnchors.GodManagerMenuScreen.OpenedToButtonKey .. "Bar"].Id, Fraction = 0, Duration = 0.1 })
		SetAlpha({ Id = components[ScreenAnchors.GodManagerMenuScreen.OpenedToButtonKey .. "BarFill"].Id, Fraction = 0, Duration = 0.3 })
	end
	if TraitData[button.Data.Gift].Slot ~= "Assist" then
		ScreenAnchors.GodManagerMenuScreen.OpenedToButtonKey = button.ButtonKey
	end]]
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
		ScreenAnchors.GodManagerMenuScreen[frameKey] = CreateScreenObstacle({ Name = "BlankObstacle", Group =
		"Combat_Menu" })
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
	if ScreenAnchors.GodManagerMenuScreen.LastAssist ~= GameState.LastAssistTrait then
		UnequipAssist(CurrentRun.Hero, ScreenAnchors.GodManagerMenuScreen.LastAssist)
		EquipAssist(CurrentRun.Hero, GameState.LastAssistTrait)
	end

	if ScreenAnchors.GodManagerMenuScreen.LastTrait ~= GameState.LastAwardTrait then
		UnequipKeepsake(CurrentRun.Hero, ScreenAnchors.GodManagerMenuScreen.LastTrait)
		EquipKeepsake(CurrentRun.Hero, GameState.LastAwardTrait)

		--[[if not CanFreeSwapKeepsakes() then
			if CurrentRun.BlockedKeepsakes == nil then
				CurrentRun.BlockedKeepsakes = {}
			end
			CurrentRun.CurrentRoom.BlockKeepsakeMenu = true
			table.insert(CurrentRun.BlockedKeepsakes, ScreenAnchors.GodManagerMenuScreen.LastTrait)

			if GameState.LastAwardTrait == "BonusMoneyTrait" then
				AddMoney(GetTotalHeroTraitValue("BonusMoney"), "Bonus Money Keepsake")
			end

			if CurrentRun.CurrentRoom.GodManagerMenuObject then
				CurrentRun.CurrentRoom.GodManagerMenuObject.UseText = "UseLockedOlympianTablet"
				SetAnimation({ Name = "OlympianTabletClosed", DestinationId = CurrentRun.CurrentRoom
				.GodManagerMenuObject.ObjectId })
				PlaySound({ Name = RoomData.BaseRoom.LockedUseSound, Id = CurrentRun.CurrentRoom.GodManagerMenuObject
				.ObjectId })
			end
		end]]
		thread(PlayVoiceLines, GlobalVoiceLines.AwardSelectedVoiceLines, false)
	end

	DestroySelectedFrameGodMenu()
	DestroyCursorFrameGodMenu()
	DisableShopGamepadCursor()
	OnScreenClosed({ Flag = "GodManagerMenu" })

	CloseScreen(GetAllIds(screen.Components), 0.15)
	ScreenAnchors.GodManagerMenuScreen = nil

	UnfreezePlayerUnit()
	screen.KeepOpen = false
	ShowCombatUI("GodManagerMenu")
	UpdateOlympianTabletShineStatus()
end

function HandleExiledToggle(screen, button, textOverride)
	local godName = button.Data.NPC
	local buttonKey = button.ButtonKey
	local components = screen.Components
	ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Click"))
	if IsExiledGodUnlocked( godName ) then -- Toggle if unlocked
		-- equip weapon upgrade
		--if itemIndex ~= lastEquippedIndex then
			SelectExiledGod( screen, godName)
			UpdateExiledGodButtons( buttonKey, godName )
		--end
	elseif HasResource( "GiftPoints", 1 ) then -- Buy out
		SpendResource( "GiftPoints", 1, "ExiledGodsUnlock" )
		--UnlockOrIncreaseWeaponUpgrade( screen, weaponName, itemIndex )

		Flash({ Id = button.Id, Speed = 1, MinFraction = 1, MaxFraction = 0.0, Color = Color.White, ExpireAfterCycle = true })
		CreateAnimation({ Name = "BoonGet", DestinationId = button.Id, Scale = 1.0, GroupName = "Combat_Menu_TraitTray_Additive", Color = Color.Red, OffsetX = -500 })
		PlaySound({ Name = "/Leftovers/Menu Sounds/TeamWipe2" })
		PlaySound({ Name = "/Leftovers/SFX/AnnouncementThunder" })
		thread( PlayVoiceLines, GlobalVoiceLines.UpgradedWeaponUpgradePurchasedVoiceLines, true )
		--SetColor({ Id = ScreenAnchors.WeaponUpgradeScreen.Components["PurchaseButton" ..itemIndex.."Icon"].Id, Color = Color.White })
		--SetAnimation({ DestinationId = ScreenAnchors.WeaponUpgradeScreen.Components["LockIcon" .. itemIndex].Id, Name = "LockedIconReleaseWeapon" })
		--UpdateWeaponUpgradeButtons( weaponName, lastEquippedIndex )
		--ShowNextUpgrade( button )
		UnlockExiledGod(screen, godName)
		UpdateExiledGodButtons( buttonKey, godName )
	--[[elseif not IsExiledGodUnlocked(weaponName, itemIndex) and HasResource( "SuperLockKeys", GetNextWeaponUpgradeKeyCost( weaponName, itemIndex ) ) and not IsBuyWeaponUpgradeDisabled( weaponName, itemIndex ) then
		local components = ScreenAnchors.WeaponUpgradeScreen.Components
		Flash({ Id = components[button.UpgradeButtonKey].Id, Speed = 2, MinFraction = 1, MaxFraction = 0.0, Color = Color.CostCantPurchase, ExpireAfterCycle = true })
		PlaySound({ Name = "/Leftovers/SFX/OutOfAmmo" })
	else
		Flash({ Id = button.Id, Speed = 2, MinFraction = 1, MaxFraction = 0.0, Color = Color.CostUnaffordable, ExpireAfterCycle = true })
		PlaySound({ Name = "/Leftovers/SFX/OutOfAmmo" })
		if CheckCountInWindow( "TriedUnlock", 1.0, 3 ) then
			thread( PlayVoiceLines, HeroVoiceLines.WeaponUpgradeLockedVoiceLines, true )
		end]]
	end
end
function IsExiledGodUnlocked( godName )
	if GameState.ExiledGodUnlocks == nil then
		return false
	end
	return GameState.ExiledGodUnlocks[godName]
end

function UnlockExiledGod( screen, godName )
	if GameState.ExiledGodUnlocks == nil then
		GameState.ExiledGodUnlocks = {}
	end
	if GameState.CurrentExiledGods == nil then
		GameState.CurrentExiledGods = {}
	end
	GameState.ExiledGodUnlocks[godName] = true
	ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Unlocked: "..godName))
end
function SelectExiledGod( screen, godName )
	if GameState.ExiledGodUnlocks == nil then
		GameState.ExiledGodUnlocks = {}
	end
	if GameState.CurrentExiledGods == nil then
		GameState.CurrentExiledGods = {}
	end	
	if GameState.CurrentExiledGods[godName] then
		GameState.CurrentExiledGods[godName] = false
	else
		GameState.CurrentExiledGods[godName] = true
	end
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Selected: "..godName..";"..GameState.ExiledGodUnlocks[godName]))
end
function UpdateExiledGodButtons( buttonKey, godName )
	local components = ScreenAnchors.GodManagerMenuScreen.Components
	
	if GameState.ExiledGodUnlocks[godName] then
		SetColor({ Id = components[buttonKey].Id, Color = { 1.0, 1.0, 1.0, 1.0 } })
		if GameState.CurrentExiledGods[godName] then
			SetAnimation({ DestinationId = components[buttonKey].LockId, Name = "LockedKeepsakeIcon" })
		else
			SetAnimation({ DestinationId = components[buttonKey].LockId, Name = "BlankObstacle" })			
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
ModUtil.Path.Wrap( "SetupRoomReward", 
	function(baseFunc, currentRun, room, previouslyChosenRewards, args )
		args = args or {}
		local excludeLootNames = {}
		for god, exiled in pairs( GameState.CurrentExiledGods ) do
			if exiled then
				table.insert( excludeLootNames, god )
			end
		end
		if not args.IgnoreForceLootName then
			for k, trait in pairs( CurrentRun.Hero.Traits ) do
				if trait ~= nil and trait.ForceBoonName ~= nil and trait.Uses > 0 and not Contains(excludeLootNames, trait.ForceBoonName) then
					args.IgnoreForceLootName = true
				end
			end
		end
		baseFunc(currentRun, room, previouslyChosenRewards, args)
	end
)
ModUtil.Path.Wrap( "GetEligibleLootNames", 
	function(baseFunc, excludeLootNames )
		local output = baseFunc(excludeLootNames)
		if GameState.CurrentExiledGods ~= nil then
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("CurrentExiledGods"))
			for _, lootName in ipairs( output ) do
				if TableLength(output) <= 1 then
					break
				end
				if GameState.CurrentExiledGods[lootName] ~= nil and GameState.CurrentExiledGods[lootName] then
					RemoveValue( output, lootName )
				end
			end
		end
		return output
	end
)
--[[ModUtil.Path.Wrap( "StartOver", 
	function(baseFunc)
		
	AddInputBlock({ Name = "StartOver" })

	local currentRun = CurrentRun
	EndRun( currentRun )
	CurrentDeathAreaRoom = nil
	PreviousDeathAreaRoom = nil
	currentRun = StartNewRun( currentRun )
	StopSound({ Id = AmbientMusicId, Duration = 1.0 })
	AmbientMusicId = nil
	AmbientTrackName = nil
	ResetObjectives()
	killTaggedThreads( RoomThreadName )

	SetConfigOption({ Name = "FlipMapThings", Value = false })

	AddTimerBlock( currentRun, "StartOver" )
	SetPersephoneAwayAtRunStart()
	--StartNewRunPresentation( currentRun )
	RemoveInputBlock({ Name = "StartOver" })
	RemoveTimerBlock( currentRun, "StartOver" )
	killTaggedThreads( RoomThreadName )

	end
)]]