ModUtil.RegisterMod("ContentExtender")

--AspectExtender = {}

ModUtil.BaseOverride("ShowAwardMenu", function ()
    if IsScreenOpen("AwardMenu") then
		return
	end

	OnScreenOpened({Flag = "AwardMenu", PersistCombatUI = true })
	FreezePlayerUnit()
	EnableShopGamepadCursor()
	HideCombatUI("AwardMenu")
	SetConfigOption({ Name = "FreeFormSelecSearchFromId", Value = 0 })
	SetConfigOption({ Name = "FreeFormSelectRepeatDelay", Value = 0.6 })
	SetConfigOption({ Name = "FreeFormSelectRepeatInterval", Value = 0.1 })

	ScreenAnchors.AwardMenuScreen = { Components = {}, UpgradeButtons = {} }
    
	local components = ScreenAnchors.AwardMenuScreen.Components
    ScreenAnchors.AwardMenuScreen.KeepsakeFirstPage = 0
	ScreenAnchors.AwardMenuScreen.KeepsakeLastPage = 0
	ScreenAnchors.AwardMenuScreen.KeepsakeCurrentPage = 0
    ScreenAnchors.AwardMenuScreen.AssistFirstPage = 0
	ScreenAnchors.AwardMenuScreen.AssistLastPage = 0
	ScreenAnchors.AwardMenuScreen.AssistCurrentPage = 0
	ScreenAnchors.AwardMenuScreen.CurrentIndex = 0
	ScreenAnchors.AwardMenuScreen.KeepsakeBoolean = false
	ScreenAnchors.AwardMenuScreen.AssistBoolean = false

	components.ShopBackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu" })
	SetScale({ Id = components.ShopBackgroundDim.Id, Fraction = 4 })
	SetColor({ Id = components.ShopBackgroundDim.Id, Color = {0.15, 0.15, 0.15, 0.85} })

	components.ShopBackground = CreateScreenComponent({ Name = "AwardMenuBackground", Group = "Combat_Menu", OffsetX = 0, OffsetY = 190 })

	components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "Combat_Menu" })
	Attach({ Id = components.CloseButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = 0, OffsetY = 500 })
	components.CloseButton.OnPressedFunctionName = "CloseUpgradeScreen"
	components.CloseButton.ControlHotkey = "Cancel"

	PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENU" })
	PlaySound({ Name = "/Leftovers/World Sounds/Caravan Interior/ChestOpen" })

	-- Title
	CreateTextBox({ Id = components.ShopBackground.Id, Text = "AwardMenu_Title", FontSize = 40, OffsetX = 0, OffsetY = -460, Color = Color.White, Font = "SpectralSCLightTitling", ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center" })
	CreateTextBox({ Id = components.ShopBackground.Id, Text = "AwardMenu_SubTitle", FontSize = 18, OffsetX = 0, OffsetY = -410, Width = 840, Color = Color.SubTitle, Font = "CrimsonTextItalic", ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center" })
	-- CreateTextBox({ Id = components.ShopBackground.Id, Text = "AwardMenu_Hint", FontSize = 14, OffsetX = 0, OffsetY = 420, Width = 840, Color = Color.Gray, Font = "CrimsonTextBoldItalic", ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center" })

	components.EquipSubtitle = CreateScreenComponent({ Name = "BlankObstacle", X = ScreenCenterX, Y = 850, Group = "Combat_Menu" })
	CreateTextBox({ Id = components.EquipSubtitle.Id, Text = "OemQuestion", FontSize = 24, OffsetX = 600, OffsetY = 100, Width = 840, Color = Color.LightSlateGray, Font = "AlegreyaSansRegular", ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center" })

	-- Description box
	local descriptionStartX = 1325
	local descriptionStartY = 75
	local descriptionTextOffsetX = 0
	local descriptionTextOffsetY = 185
	components.CurrentLevel = CreateScreenComponent({ Name = "BlankObstacle", X = descriptionStartX, Y = descriptionStartY + 340, Group = "Combat_Menu" })
	CreateTextBox({ Id = components.CurrentLevel.Id, OffsetX = descriptionTextOffsetX, OffsetY = descriptionTextOffsetY,
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
	components.LevelProgress = CreateScreenComponent({ Name = "BlankObstacle", X = descriptionStartX, Y = descriptionStartY + levelProgressYOffset, Group = "Combat_Menu" })
	CreateTextBox({ Id = components.LevelProgress.Id, OffsetX = descriptionTextOffsetX, OffsetY = descriptionTextOffsetY,
		Width = 450,
		FontSize = 18,
		Justification = "Left",
		VerticalJustification = "Top",
		LineSpacingBottom = 8,
		Font = "AlegreyaSansRegular",
		Format = "BaseFormat",
		VariableAutoFormat = "BoldFormatGraft",
	})
	components.InfoBackground = CreateScreenComponent({ Name = "BlankObstacle", X = descriptionStartX, Y = descriptionStartY, Group = "Combat_Menu" })
	SetScaleY({ Id = components.InfoBackground.Id, Fraction = 1.4 })
	CreateTextBox({ Id = components.InfoBackground.Id, OffsetX = descriptionTextOffsetX, OffsetY = descriptionTextOffsetY,
		FontSize = 36,
		Color = Color.Title2,
		Font = "AlegreyaSansSCBold",
		ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 4},
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
	components.Sticker = CreateScreenComponent({ Name = "BlankObstacle", X = descriptionStartX + 230, Y = descriptionStartY + GetLocalizedValue(720, { { Code = "ja", Value = 740 }, }), Group = "Combat_Menu_Additive" })
	
	components.InfoBackgroundDescription = CreateScreenComponent({ Name = "BlankObstacle", X = descriptionStartX, Y = descriptionStartY, Group = "Combat_Menu" })
	CreateTextBox({ Id = components.InfoBackgroundDescription.Id, FontSize = 18, OffsetX = descriptionTextOffsetX, OffsetY = descriptionTextOffsetY + 40, Color = Color.DefaultText,
		Width = 485,
		Justification = "Left",
		VerticalJustification = "Top",
		LineSpacingBottom = 6,
		UseDescription = true,
		Font = "AlegreyaSansRegular",
		Format = "BaseFormat",
		VariableAutoFormat = "BoldFormatGraft", UseDescription = true,
		LangKoScaleModifier = 0.875, 
	})

	ScreenAnchors.AwardMenuScreen.LastTrait = GameState.LastAwardTrait
	ScreenAnchors.AwardMenuScreen.LastAssist = GameState.LastAssistTrait

	local spacerX = 118
	local spacerY = 165
	local startX = 405
	local startY = 280
	local rowMax = 10
	local rowMin = math.ceil(rowMax/2)
	UIData.AwardMenu.HasUnlocked = false
	UIData.AwardMenu.HasNew = false
	UIData.AwardMenu.FirstUsable = false
	UIData.AwardMenu.NewLegendary = false
	UIData.AwardMenu.FirstNewLegendary = true
	ScreenAnchors.AwardMenuScreen.KeepsakesList = {}
	for index, upgradeData in ipairs(UIData.AwardMenu.AvailableKeepsakeTraits) do
		local localx = 0
		local localy = 0

		--[[if TraitData[upgradeData.Gift].Slot == "Assist" then
			localy = localy + 180
		end]]
        local indexPerPage = 30
        local pageIndex = math.floor((index-1) / indexPerPage)
        local itemIndex = math.floor((index-1) % indexPerPage)
		localx = startX - spacerX * rowMin/2 + ((itemIndex) % rowMax + 0.5) * spacerX
		localy = startY + math.floor( (itemIndex) / rowMax)* 2 * (spacerY / 2)
        if ScreenAnchors.AwardMenuScreen.KeepsakesList[pageIndex] == nil then
            ScreenAnchors.AwardMenuScreen.KeepsakesList[pageIndex] = {}
         end
         ScreenAnchors.AwardMenuScreen.KeepsakeLastPage = pageIndex
		 if ScreenAnchors.AwardMenuScreen.LastTrait ~= nil and upgradeData.Gift == ScreenAnchors.AwardMenuScreen.LastTrait then
			ScreenAnchors.AwardMenuScreen.KeepsakeCurrentPage = pageIndex
			ScreenAnchors.AwardMenuScreen.CurrentIndex = itemIndex
		end
		 --ScreenAnchors.AwardMenuScreen.LastAssist == upgradeData
         table.insert(ScreenAnchors.AwardMenuScreen.KeepsakesList[pageIndex],{
             itemIndex = itemIndex,
             upgradeData = upgradeData,
             pageIndex = pageIndex,
             localx = localx,
             localy = localy,
         })
		--CreateKeepsakeIcon( components, { Index = itemIndex, UpgradeData = upgradeData, X = localx, Y = localy })
	end
	for itemIndex, upgradeData in ipairs(UIData.AwardMenu.AvailableAssistTraits) do
		if not upgradeData.New or GameState.Flags.FirstNewLegendary then
			UIData.AwardMenu.FirstNewLegendary = false
		elseif upgradeData.New then
			UIData.AwardMenu.NewLegendary = true
		end
	end
	-- Assist trait modifications
	spacerX = 198
	startX = 0
	startY = startY + 2 * spacerY + 230
	ScreenAnchors.AwardMenuScreen.AssistsList = {}
	local hasUnlockedKeepsakes = false
	for index, upgradeData in ipairs(UIData.AwardMenu.AvailableAssistTraits) do
		local localx = 0
		local localy = 0
        local indexPerPage = 6
        local pageIndex = math.floor((index-1) / indexPerPage)
        local itemIndex = math.floor((index-1) % indexPerPage)
		localx = startX + (itemIndex+1)  * spacerX
		localy = startY
        if upgradeData.Unlocked then
             hasUnlockedKeepsakes = true
        end
        if ScreenAnchors.AwardMenuScreen.AssistsList[pageIndex] == nil then
            ScreenAnchors.AwardMenuScreen.AssistsList[pageIndex] = {}
         end
         ScreenAnchors.AwardMenuScreen.AssistLastPage = pageIndex
		 if ScreenAnchors.AwardMenuScreen.LastAssist ~= nil and upgradeData.Gift == ScreenAnchors.AwardMenuScreen.LastAssist then
			ScreenAnchors.AwardMenuScreen.AssistCurrentPage = pageIndex
			ScreenAnchors.AwardMenuScreen.CurrentIndex = itemIndex
		end
         table.insert(ScreenAnchors.AwardMenuScreen.AssistsList[pageIndex],{
             itemIndex = itemIndex,
             upgradeData = upgradeData,
             pageIndex = pageIndex,
             localx = localx,
             localy = localy,
         })
    end
    AssistManagerLoadPage(ScreenAnchors.AwardMenuScreen)
    KeepsakeManagerLoadPage(ScreenAnchors.AwardMenuScreen)
	HandleKeyboardManagerLoadPage(ScreenAnchors.AwardMenuScreen)

	if GameState.LifetimeResourcesGained.SuperGiftPoints ~= nil and GameState.LifetimeResourcesGained.SuperGiftPoints > 0 and hasUnlockedKeepsakes then
		components.CurrentKeys = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray" })
		CreateTextBox({ Id = components.CurrentKeys.Id,
			Text = "Available_SuperGiftPoints",
			FontSize = 24,
			OffsetX = 330,
			OffsetY = 135,
			Color = Color.White,
			Font = "AlegreyaSansSCRegular",
			ShadowBlur = 0,
			ShadowColor = {0,0,0,1},
			ShadowOffset={0, 2},
			Justification = "Right",
			LuaKey = "TempTextData",
			LuaValue = { Amount = tostring(GameState.Resources.SuperGiftPoints)}
		})
	end

	if not 	UIData.AwardMenu.HasUnlocked then
		if components["UpgradeToggle1"] ~= nil then
			SetCursorFrame( components["UpgradeToggle1"] )
			TeleportCursor({ OffsetX = startX - spacerX * rowMin/2, OffsetY = startY})
		end
		thread( PlayVoiceLines, GlobalVoiceLines.AwardMenuEmptyVoiceLines, false )
	elseif UIData.AwardMenu.FirstNewLegendary then
		thread( PlayVoiceLines, GlobalVoiceLines.AwardMenuNewLegendaryVoiceLines, false )
		GameState.Flags.FirstNewLegendary = true
	elseif UIData.AwardMenu.NewLegendary then
		thread( PlayVoiceLines, GlobalVoiceLines.AwardMenuNewAvailableVoiceLines, false )
	elseif UIData.AwardMenu.HasNew then
		thread( PlayVoiceLines, GlobalVoiceLines.AwardMenuNewAvailableVoiceLines, false )
	else
		thread( PlayVoiceLines, GlobalVoiceLines.OpenedAwardMenuVoiceLines, false )
	end

	ScreenAnchors.AwardMenuScreen.KeepOpen = true
	thread( HandleWASDInput, ScreenAnchors.AwardMenuScreen )
	HandleScreenInput( ScreenAnchors.AwardMenuScreen )
end)

ModUtil.Path.Wrap( "SetCursorFrame", 
function(baseFunc, button)	
	ScreenAnchors.AwardMenuScreen.CurrentIndex = button.Index
	if string.find(button.ButtonKey, "AssistItem") then
		ScreenAnchors.AwardMenuScreen.LastTableSelected = "Assist"
	else
		ScreenAnchors.AwardMenuScreen.LastTableSelected = "Keepsake"
	end	
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Keepsake")) 
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString.TableKeys(button)) 
	baseFunc(button)
end)

--[[ModUtil.Path.Wrap( "SetLegendaryFrame", 
function(baseFunc, id)	
	local button = ScreenAnchors.AwardMenuScreen[id]	
	ScreenAnchors.AwardMenuScreen.CurrentIndex = button.Index
	ScreenAnchors.AwardMenuScreen.LastTableSelected = "Assist"
	ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Assist")) 
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(ScreenAnchors.AwardMenuScreen.CurrentIndex)) 
	baseFunc(id)
end)]]
--[[ModUtil.Path.Wrap( "HandleUpgradeToggle", 
	function(baseFunc, screen, button, textOverride)	
        baseFunc(screen, button, textOverride)      
        local upgradeName = button.Data.Gift
        local upgradeData = TraitData[upgradeName]
        if upgradeData.Slot == "Keepsake" then
            screen.LastTrait= upgradeName
            GameState.LastAwardTrait = upgradeName
        end
    end
)]]
--[[ModUtil.Path.Wrap( "GetComponentByHotkey", 
	function(baseFunc, components, hotkey)	
		baseFunc(components,hotkey)
		ModUtil.Hades.PrintStackChunks(ModUtil.ToString.Deep(hotkey)) 
	end
)]]
function HandleKeyboardManagerLoadPage(screen)
	local components = screen.Components
	--Left
	components.AssistLeftPageButton = CreateScreenComponent({ Name = "NoneLeft", Scale = 0.8, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "BoonManager" })
	Attach({ Id = components.AssistLeftPageButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = -880, OffsetY = 0 })
	components.AssistLeftPageButton.OnPressedFunctionName = "HandleKeyboardManagerChangePage"
	components.AssistLeftPageButton.Direction = "Left"
	components.AssistLeftPageButton.ControlHotkeys = { "MenuLeft", "Left" }
	--Right
	components.AssistRightPageButton = CreateScreenComponent({ Name = "NoneRight", Scale = 0.0, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "BoonManager" })
	Attach({ Id = components.AssistRightPageButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = 350, OffsetY = 0 })
	components.AssistRightPageButton.OnPressedFunctionName = "HandleKeyboardManagerChangePage"
	components.AssistRightPageButton.Direction = "Right"
	components.AssistRightPageButton.ControlHotkeys = { "MenuRight", "Right" }

end
function HandleKeyboardManagerChangePage(screen, button)
	if ScreenAnchors.AwardMenuScreen.CurrentIndex ~= nil and (ScreenAnchors.AwardMenuScreen.CurrentIndex % 6 == 0 or ScreenAnchors.AwardMenuScreen.CurrentIndex % 6 == 5) then
		if ScreenAnchors.AwardMenuScreen.AssistBoolean then
			AssistChangePage(screen, button.Direction)
		else
			ScreenAnchors.AwardMenuScreen.AssistBoolean = true
		end
	else
		ScreenAnchors.AwardMenuScreen.AssistBoolean = false
	end	
	if ScreenAnchors.AwardMenuScreen.CurrentIndex ~= nil and (ScreenAnchors.AwardMenuScreen.CurrentIndex % 10 == 0 or ScreenAnchors.AwardMenuScreen.CurrentIndex % 10 == 9) then
		if ScreenAnchors.AwardMenuScreen.KeepsakeBoolean then
			KeepsakeChangePage(screen, button.Direction)
		else
			ScreenAnchors.AwardMenuScreen.KeepsakeBoolean = true
		end
	else
		ScreenAnchors.AwardMenuScreen.KeepsakeBoolean = false
	end
end
function AssistManagerPageButtons(screen)
	local components = screen.Components
	if screen.AssistCurrentPage ~= screen.AssistFirstPage then
		components.AssistLeftClickPageButton = CreateScreenComponent({ Name = "ButtonCodexLeft", Scale = 0.8, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "BoonManager" })
		Attach({ Id = components.AssistLeftClickPageButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = -880, OffsetY = 300 })
		components.AssistLeftClickPageButton.OnPressedFunctionName = "AssistManagerChangePageClick"
		components.AssistLeftClickPageButton.Direction = "Left"
	end
	if screen.AssistCurrentPage ~= screen.AssistLastPage then
		components.AssistRightClickPageButton = CreateScreenComponent({ Name = "ButtonCodexRight", Scale = 0.8, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "BoonManager" })
		Attach({ Id = components.AssistRightClickPageButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = 350, OffsetY = 300 })
		components.AssistRightClickPageButton.OnPressedFunctionName = "AssistManagerChangePageClick"
		components.AssistRightClickPageButton.Direction = "Right"
	end
end
function AssistManagerChangePageClick(screen, button)
	screen.LastTableSelected = "Assist"
	AssistChangePage(screen, button.Direction)
end
function AssistChangePage(screen, direction)
	if screen.LastTableSelected ~= "Assist" then
		return
	end	
	if direction == "Left" and screen.AssistCurrentPage > screen.AssistFirstPage then
		screen.AssistCurrentPage = screen.AssistCurrentPage - 1
	elseif direction == "Right" and screen.AssistCurrentPage < screen.AssistLastPage  then
		screen.AssistCurrentPage = screen.AssistCurrentPage + 1
	else
		return
	end
	local ids = {}
	for i, component in pairs(screen.Components) do
        if string.find(i, "AssistItem") then
			table.insert(ids, component.Id)
		end
	end 
	Destroy({ Id = ScreenAnchors.AwardMenuScreen.SelectedAssistFrame})
	ScreenAnchors.AwardMenuScreen.SelectedAssistFrame = nil
	if ScreenAnchors.AwardMenuScreen ~= nil then
		Destroy({ Id = ScreenAnchors.AwardMenuScreen.HoverFrame })
		ScreenAnchors.AwardMenuScreen.HoverFrame = nil
	end	
	if screen.Components.AssistLeftPageButton then
		Destroy({ Ids = {screen.Components.AssistLeftPageButton.Id}})
	end
	if screen.Components.AssistRightPageButton then
		Destroy({ Ids = {screen.Components.AssistRightPageButton.Id}})
	end
	if screen.Components.AssistLeftClickPageButton then
		Destroy({ Ids = {screen.Components.AssistLeftClickPageButton.Id}})
	end
	if screen.Components.AssistRightClickPageButton then
		Destroy({ Ids = {screen.Components.AssistRightClickPageButton.Id}})
	end
	Destroy({ Ids = ids})
	AssistManagerLoadPage(screen)
end

function AssistManagerLoadPage(screen)
	local components = ScreenAnchors.AwardMenuScreen.Components
    --local displayedTraits = {}
	local spacerY = 165
    local spacerX = 198
	local startX = 0
	local startY = 165 + 2 * spacerY + 230
	local createdKeepsakes = 0
	AssistManagerPageButtons(screen)
    local pageAssists = screen.AssistsList[screen.AssistCurrentPage]
    if pageAssists then
        for i, assistData in pairs(pageAssists) do
            if assistData.upgradeData.Unlocked then
                CreateKeepsakeIcon( components, { Index = assistData.itemIndex, UpgradeData = assistData.upgradeData, X = assistData.localx, Y = assistData.localy - 20, RankOffsetY = 100, AddUpgradeButton = true, KeyAppend = "LegendaryAssistItem" })
				local buttonKey = "UpgradeToggle"..assistData.itemIndex.."LegendaryAssistItem"
				components[buttonKey].Index = assistData.itemIndex
			else
                components["Locked"..assistData.itemIndex.."AssistItem"] = CreateScreenComponent({ Name = "LegendaryKeepsakeLockedButton", X = assistData.localx, Y = assistData.localy + 10, Group = "Combat_Menu" })
                components["Locked"..assistData.itemIndex.."AssistItem"].TitleTextBoxId = components.InfoBackground.Id
                components["Locked"..assistData.itemIndex.."AssistItem"].DescriptionTextBoxId = components.InfoBackgroundDescription.Id
                components["Locked"..assistData.itemIndex.."AssistItem"].CurrentLevelId = components.CurrentLevel.Id
                components["Locked"..assistData.itemIndex.."AssistItem"].LevelProgressId = components.LevelProgress.Id
                components["Locked"..assistData.itemIndex.."AssistItem"].Index = assistData.itemIndex
                ScreenAnchors.AwardMenuScreen[components["Locked"..assistData.itemIndex.."AssistItem"].Id] = components["Locked"..assistData.itemIndex.."AssistItem"]
            end
            --[[local keepsakeId = createdKeepsakes + 1
            components["Locked"..keepsakeId.."AssistItem"] = CreateScreenComponent({ Name = "LegendaryKeepsakeLockedButton", X = assistData.localx, Y = assistData.localy + 10, Group = "Combat_Menu" })
            components["Locked"..keepsakeId.."AssistItem"].TitleTextBoxId = components.InfoBackground.Id
            components["Locked"..keepsakeId.."AssistItem"].DescriptionTextBoxId = components.InfoBackgroundDescription.Id
            components["Locked"..keepsakeId.."AssistItem"].CurrentLevelId = components.CurrentLevel.Id
            components["Locked"..keepsakeId.."AssistItem"].LevelProgressId = components.LevelProgress.Id
            components["Locked"..keepsakeId.."AssistItem"].Unavailable = true
            ScreenAnchors.AwardMenuScreen[components["Locked"..keepsakeId.."AssistItem"].Id] = components["Locked"..keepsakeId.."AssistItem"]]
        end
    end
end
function KeepsakeManagerPageButtons(screen)
	local components = screen.Components
	if screen.KeepsakeCurrentPage ~= screen.KeepsakeFirstPage then
		components.KeepsakeLeftClickPageButton = CreateScreenComponent({ Name = "ButtonCodexLeft", Scale = 0.8, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "KeepsakeManager" })
		Attach({ Id = components.KeepsakeLeftClickPageButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = -880, OffsetY = -80 })
		components.KeepsakeLeftClickPageButton.OnPressedFunctionName = "KeepsakeManagerChangePageClick"
		components.KeepsakeLeftClickPageButton.Direction = "Left"
	end
	if screen.KeepsakeCurrentPage ~= screen.KeepsakeLastPage then
		components.KeepsakeRightClickPageButton = CreateScreenComponent({ Name = "ButtonCodexRight", Scale = 0.8, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "KeepsakeManager" })
		Attach({ Id = components.KeepsakeRightClickPageButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = 350, OffsetY = -80 })
		components.KeepsakeRightClickPageButton.OnPressedFunctionName = "KeepsakeManagerChangePageClick"
		components.KeepsakeRightClickPageButton.Direction = "Right"
	end
end
function KeepsakeManagerChangePageClick(screen, button)
	screen.LastTableSelected = "Keepsake"
	KeepsakeChangePage(screen, button.Direction)
end
function KeepsakeChangePage(screen, direction)
	if screen.LastTableSelected ~= "Keepsake" then
		return
	end	
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(screen.CurrentIndex % 10))
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString.TableKeys(button))
	if direction == "Left" and screen.KeepsakeCurrentPage > screen.KeepsakeFirstPage then
		screen.KeepsakeCurrentPage = screen.KeepsakeCurrentPage - 1
	elseif direction == "Right" and screen.KeepsakeCurrentPage < screen.KeepsakeLastPage then
		screen.KeepsakeCurrentPage = screen.KeepsakeCurrentPage + 1
	else
		return
	end
	local ids = {}
	for i, component in pairs(screen.Components) do
        if string.find(i, "KeepsakeItem") then
			table.insert(ids, component.Id)
		end
	end        
	Destroy({ Id = ScreenAnchors.AwardMenuScreen.SelectedFrame })
	ScreenAnchors.AwardMenuScreen.SelectedFrame = nil
	if ScreenAnchors.AwardMenuScreen ~= nil then
		Destroy({ Id = ScreenAnchors.AwardMenuScreen.HoverFrame })
		ScreenAnchors.AwardMenuScreen.HoverFrame = nil
	end
	if screen.Components.KeepsakeLeftPageButton then
		Destroy({ Ids = {screen.Components.KeepsakeLeftPageButton.Id}})
	end
	if screen.Components.KeepsakeRightPageButton then
		Destroy({ Ids = {screen.Components.KeepsakeRightPageButton.Id}})
	end
	if screen.Components.KeepsakeLeftClickPageButton then
		Destroy({ Ids = {screen.Components.KeepsakeLeftClickPageButton.Id}})
	end
	if screen.Components.KeepsakeRightClickPageButton then
		Destroy({ Ids = {screen.Components.KeepsakeRightClickPageButton.Id}})
	end
	Destroy({ Ids = ids})
	KeepsakeManagerLoadPage(screen)
end

function KeepsakeManagerLoadPage(screen)
	local components = ScreenAnchors.AwardMenuScreen.Components
	KeepsakeManagerPageButtons(screen)
    --local displayedTraits = {}
    local pageKeepsakes = screen.KeepsakesList[screen.KeepsakeCurrentPage]
    if pageKeepsakes then
        for i, keepsakeData in pairs(pageKeepsakes) do
            CreateKeepsakeIcon( components, { Index = keepsakeData.itemIndex, UpgradeData = keepsakeData.upgradeData, X = keepsakeData.localx, Y = keepsakeData.localy, KeyAppend = "KeepsakeItem" }) 
			local buttonKey = "UpgradeToggle"..keepsakeData.itemIndex.."KeepsakeItem"
			components[buttonKey].Index = keepsakeData.itemIndex
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString.TableKeys(components[buttonKey])) 
			--components[keepsakeData.itemIndex]--.Index = keepsakeData.itemIndex
		end
    end
end