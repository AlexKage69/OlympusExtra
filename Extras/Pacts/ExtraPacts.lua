local OlympusMetaUpgradeData = ModUtil.Entangled.ModData(MetaUpgradeData)
local OlympusShrineUpgradeOrder = ModUtil.Entangled.ModData(ShrineUpgradeOrder)

OlympusMetaUpgradeData.SelfExplosionFoeShrineUpgrade =
{
    InheritFrom = { "BaseMetaUpgrade", },
    Icon = "ShrineIcon_ShieldHealth",
    Starting = true,
    CostTable = { 2 },
    ShortTotal = "SelfExplosionFoeShrineUpgrade_ShortTotal",
    ChangeValue = 1,
}
OlympusMetaUpgradeData.GodWrathRoomShrineUpgrade =
{
    InheritFrom = { "BaseMetaUpgrade", },
    Icon = "ShrineIcon_ShieldHealth",
    Starting = true,
    CostTable = { 1, 1, 1, 1, 1 },
    ShortTotal = "SelfExplosionFoeShrineUpgrade_ShortTotal",
    ChangeValue = 1,
}
OlympusMetaUpgradeData.EnemyLifestealShrineUpgrade =
{
    InheritFrom = { "BaseMetaUpgrade", },
    Icon = "ShrineIcon_ShieldHealth",
    Starting = true,
    CostTable = { 1, 1 },
    ShortTotal = "SelfExplosionFoeShrineUpgrade_ShortTotal",
    ChangeValue = 1,
}
OlympusMetaUpgradeData.BoonDuoLegendDebuffShrineUpgrade =
{
    InheritFrom = { "BaseMetaUpgrade", },
    Icon = "ShrineIcon_ShieldHealth",
    Starting = true,
    CostTable = { 1 },
    ShortTotal = "SelfExplosionFoeShrineUpgrade_ShortTotal",
    ShortTotalNoIcon = "SelfExplosionFoeShrineUpgrade_ShortTotalNoIcon",
    ChangeValue = 1.10,
}
OlympusMetaUpgradeData.BoonRarityDebuffShrineUpgrade =
{
    InheritFrom = { "BaseMetaUpgrade", },
    Icon = "ShrineIcon_ShieldHealth",
    Starting = true,
    CostTable = { 1, 1 },
    ShortTotal = "SelfExplosionFoeShrineUpgrade_ShortTotal",
    ShortTotalNoIcon = "SelfExplosionFoeShrineUpgrade_ShortTotalNoIcon",
    ChangeValue = 1.10,
}
--[[ModUtil.Table.Merge(OlympusShrineUpgradeOrder, {
            "SelfExplosionFoeShrineUpgrade",
            "GodWrathRoomShrineUpgrade",
            "EnemyLifestealShrineUpgrade",
            "BoonRarityDebuffShrineUpgrade"
        }
	)]]
table.insert(OlympusShrineUpgradeOrder, "SelfExplosionFoeShrineUpgrade")
table.insert(OlympusShrineUpgradeOrder, "GodWrathRoomShrineUpgrade")
table.insert(OlympusShrineUpgradeOrder, "EnemyLifestealShrineUpgrade")
table.insert(OlympusShrineUpgradeOrder, "BoonDuoLegendDebuffShrineUpgrade")
table.insert(OlympusShrineUpgradeOrder, "BoonRarityDebuffShrineUpgrade")

-- Functions
ModUtil.Path.Wrap("GetMaximumPossibleShrinePoints",
    function(baseFunc)
        local value = baseFunc()
        -- Hack my way into the UI
        local screen = ScreenAnchors.ShrineScreen
        local components = screen.Components
        if GetShrinePageMax() >= 1 then
            components.PageIndex = CreateScreenComponent({
                Name = "BlankObstacle",
                X = ScreenCenterX + 510,
                Y =
                    ScreenCenterY - 350,
                Group = "Combat_Menu_Additive"
            })
            components.PageIndex.CurrentPage = 0
            CreateTextBox({
                Id = components.PageIndex.Id,
                Text = tostring(components.PageIndex.CurrentPage + 1),
                FontSize = 21,
                Color = Color.ShrineAttribute,
                Font = "AlegreyaSansSCExtraBold",
                ShadowBlur = 0,
                ShadowColor = { 0, 0, 0, 0 },
                ShadowOffset = { 0, 1 },
                Justification = "Center",
            })
            UpdateArrowsButtons(screen)
        end
        return value
    end
)
function UpdateArrowsButtons(screen)
    local components = screen.Components
    local maxPage = GetShrinePageMax()
    if components.AssistLeftPageButton ~= nil then
        Destroy({ Id = components.AssistLeftPageButton.Id })
    end
    if components.AssistRightPageButton ~= nil then
        Destroy({ Id = components.AssistRightPageButton.Id })
    end
    if components.PageIndex.CurrentPage ~= 0 then
        --components.AssistRightPageButton = CreateScreenComponent({ Name = "NoneRight", Scale = 0.0, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "BoonManager" })
        components.AssistLeftPageButton = CreateScreenComponent({
            Name = "ButtonCodexLeft",
            Scale = 0.7,
            Group =
            "Combat_Menu_Additive",
            X = ScreenCenterX + 470,
            Y = ScreenCenterY - 350
        })
        --Attach({ Id = components.AssistRightPageButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = 350, OffsetY = 0 })
        components.AssistLeftPageButton.OnPressedFunctionName = "ShrineChangePage"
        components.AssistLeftPageButton.Direction = "Left"
        components.AssistLeftPageButton.ControlHotkeys = { "MenuLeft", "Left" }
    end
    if components.PageIndex.CurrentPage ~= maxPage then
        components.AssistRightPageButton = CreateScreenComponent({
            Name = "ButtonCodexRight",
            Scale = 0.7,
            Group =
            "Combat_Menu_Additive",
            X = ScreenCenterX + 550,
            Y = ScreenCenterY - 350
        })
        components.AssistRightPageButton.OnPressedFunctionName = "ShrineChangePage"
        components.AssistRightPageButton.Direction = "Right"
        components.AssistRightPageButton.ControlHotkeys = { "MenuRight", "Right" }
    end
    ModifyTextBox({ Id = components.PageIndex.Id, Text = tostring(components.PageIndex.CurrentPage + 1) })
end

ModUtil.Path.Wrap("UpdateButtonStates",
    function(baseFunc, screen)
        if screen.Name == "ShrineUpgrade" and GetShrinePageMax() >= 1 then
            local itemLocationX = ScreenCenterX + 280 - 68
            local yStart = -475
            local itemLocationY = yStart + 765
            for k, upgradeName in ipairs(ShrineUpgradeOrder) do
                DestroyMetaUpgradeRow(screen, k)
                if math.floor((k-1) / 16) ~= screen.Components.PageIndex.CurrentPage then
                    ModUtil.Hades.PrintStackChunks("Destroy:"..ModUtil.ToString(k))
                    CreateMetaUpgradeRow(screen, upgradeName, k, itemLocationX, itemLocationY)
                end
                itemLocationY = itemLocationY + LevelUpUI.MetaUpgradeSpacer
            end
        end
        baseFunc(screen)
    end
)
function DestroyMetaUpgradeRow(screen, k)
    local components = screen.Components
    local itemBackingKey = "Backing" .. k
    if components[itemBackingKey] ~= nil then
        Destroy({ Id = components[itemBackingKey].Id })
    end
    local graphicKey = "Graphic" .. k
    if components[graphicKey] ~= nil then
        Destroy({ Id = components[graphicKey].Id })
    end
    local metaUpgradeNextCostKey = "UpgradeCost" .. k
    if components[metaUpgradeNextCostKey] ~= nil then
        Destroy({ Id = components[metaUpgradeNextCostKey].Id })
    end
    local lockIconKey = "LockIcon" .. k
    if components[lockIconKey] ~= nil then
        Destroy({ Id = components[lockIconKey].Id })
    end
    local metaUpgradeNumKey = "UpgradeTotal" .. k
    if components[metaUpgradeNumKey] ~= nil then
        Destroy({ Id = components[metaUpgradeNumKey].Id })
    end
    local iconKey = "Icon" .. k
    if components[iconKey] ~= nil then
        Destroy({ Id = components[iconKey].Id })
    end
    local metaUpgradeTotalKey = "UpgradeValueTotal" .. k
    if components[metaUpgradeTotalKey] ~= nil then
        Destroy({ Id = components[metaUpgradeTotalKey].Id })
    end
    local metaUpgradeNextCostKey = "UpgradeCost" .. k
    if components[metaUpgradeNextCostKey] ~= nil then
        Destroy({ Id = components[metaUpgradeNextCostKey].Id })
    end
    local unlockId = "Locked" .. k
    if components[unlockId] ~= nil then
        Destroy({ Id = components[unlockId].Id })
    end
    local rightKey = "RightArrowButton" .. k
    if components[rightKey] ~= nil then
        Destroy({ Id = components[rightKey].Id })
    end
    local leftKey = "LeftArrowButton" .. k
    if components[leftKey] ~= nil then
        Destroy({ Id = components[leftKey].Id })
    end
end

function CreateMetaUpgradeRow(screen, upgradeName, k, x, y)
    local components = screen.Components
    local upgradeData = MetaUpgradeData[upgradeName]
    local itemBackingKey = "Backing" .. k
    components[itemBackingKey] = CreateScreenComponent({ Name = "BlankObstacle", X = x, Y = y, Group =
    "Combat_Menu" })

    local graphicKey = "Graphic" .. k
    components[graphicKey] = CreateScreenComponent({ Name = "BlankObstacle", X = x, Y = y, Scale = 0.7, Group =
    "Combat_Menu" })
    Attach({ Id = components[graphicKey].Id, DestinationId = components[itemBackingKey].Id, OffsetX = -265 - 30, OffsetY = -30 })

    if (upgradeData.GameStateRequirements ~= nil and not IsGameStateEligible(CurrentRun, upgradeData.GameStateRequirements) and not screen.IgnoreRequirements) then
        -- Leave blank
    elseif GetNumMetaUpgrades(upgradeName) > 0 or not upgradeData.RequiredHeatThreshold or GetHighestRunClearShrinePointThreshold() >= upgradeData.RequiredHeatThreshold or (upgradeData.RequiredPreUpdateSevenHeatThreshold and GetPreUpdateSevenHighestShrinePointRunClear() > upgradeData.RequiredPreUpdateSevenHeatThreshold) then
        if not GameState.MetaUpgradesUnlocked[upgradeName] and not screen.ReadOnly then
            CreateTextBox({
                Id = components[itemBackingKey].Id,
                Text = upgradeData.Name,
                FontSize = 21,
                OffsetX = LevelUpUI.TextInfoBaseX,
                OffsetY = -30,
                Color = Color.ShrineAttributeLocked,
                Font = "AlegreyaSansSCExtraBold",
                ShadowBlur = 0,
                ShadowColor = { 0, 0, 0, 255 },
                ShadowOffset = { 0, 2 },
                Justification = "Left"
            })

            local unlockId = "Locked" .. k
            local metaUpgradeNextCostKey = "UpgradeCost" .. k

            local button = CreateUnlockButton(upgradeData,
                { Screen = screen, OffsetX = x, OffsetY = y, Index = k, IsEnabled = HasResource(
                upgradeData.ResourceName, upgradeData.UnlockCost), KeyCostKey = metaUpgradeNextCostKey })
            button.ResourceName = screen.ResourceName

            components[metaUpgradeNextCostKey] = CreateScreenComponent({ Name = "BlankObstacle", X = ScreenCenterX, Y =
            y, Group = "Combat_Menu" })
            Attach({ Id = components[metaUpgradeNextCostKey].Id, DestinationId = components[unlockId].Id })

            local color = Color.White
            if not HasResource(upgradeData.ResourceName, upgradeData.UnlockCost) then
                color = Color.MetaUpgradePointsInvalid
            end

            local text = "Blank"
            if ResourceData[upgradeData.ResourceName] and ResourceData[upgradeData.ResourceName].RequirementText then
                text = ResourceData[upgradeData.ResourceName].RequirementText
            end
            CreateTextBox({
                Id = components[metaUpgradeNextCostKey].Id,
                Text = text,
                LuaKey = "TempTextData",
                LuaValue = { Amount = tostring(upgradeData.UnlockCost) },
                FontSize = 26,
                OffsetX = 160,
                OffsetY = 0,
                TextSymbolScale = 0.85,
                Color = color,
                Font = "AlegreyaSansSCRegular",
                ShadowBlur = 0,
                ShadowColor = { 96, 96, 96, 255 },
                ShadowOffset = { 0, 1 },
                Justification = "Right"
            })

            local lockIconKey = "LockIcon" .. k
            components[lockIconKey] = CreateScreenComponent({ Name = "BlankObstacle", X = ScreenCenterX, Y =
            y, Group = "Combat_Menu" })
            Attach({ Id = components[lockIconKey].Id, DestinationId = components[unlockId].Id, OffsetX = -530, OffsetY = -2 })
            SetAnimation({ Name = "LockedIcon", DestinationId = components[lockIconKey].Id, Scale = 1.0 })
        else
            CreateMetaUpgradeEntry({ Screen = screen, Components = components, Data = upgradeData, Index = k, OffsetY = y })
        end
    elseif upgradeData.RequiredHeatThreshold and not screen.ReadOnly then
        CreateTextBox({
            Id = components[itemBackingKey].Id,
            Text = "UnknownShrineUpgrade",
            FontSize = 21,
            OffsetX = LevelUpUI.TextInfoBaseX,
            OffsetY = -30,
            Color = Color.ShrineAttribute,
            Font = "AlegreyaSansSCExtraBold",
            ShadowBlur = 0,
            ShadowColor = { 0, 0, 0, 0 },
            ShadowOffset = { 0, 1 },
            Justification = "Left",
            LuaKey = "TempTextData",
            LuaValue = { Amount = tostring(upgradeData.RequiredHeatThreshold) },
        })
    end
end

function ShrineChangePage(screen, button)
    local components = screen.Components
    local maxPage = GetShrinePageMax()
    if button.Direction == "Left" then
        if components.PageIndex.CurrentPage == 0 then
            return
        end
        components.PageIndex.CurrentPage = components.PageIndex.CurrentPage - 1        
    end
    if button.Direction == "Right" then
        if components.PageIndex.CurrentPage == maxPage then
            return
        end
        components.PageIndex.CurrentPage = components.PageIndex.CurrentPage + 1
    end
    UpdateMetaUpgradeRows(screen)
    UpdateArrowsButtons(screen)
end
function UpdateMetaUpgradeRows(screen)
    local components = screen.Components
    local itemLocationX = ScreenCenterX + 280 - 68
    local yStart = -475
	local itemLocationY = yStart + 765
    for k, upgradeName in ipairs(ShrineUpgradeOrder) do
        if math.floor((k-1) / 16) == components.PageIndex.CurrentPage then
            --ModUtil.Hades.PrintStackChunks("Create:"..ModUtil.ToString(k))
            CreateMetaUpgradeRow(screen, upgradeName, k, itemLocationX, itemLocationY)
            itemLocationY = itemLocationY + LevelUpUI.MetaUpgradeSpacer
        else
            --ModUtil.Hades.PrintStackChunks("Destroy:"..ModUtil.ToString(k))
            DestroyMetaUpgradeRow(screen, k)
        end
    end
end

function GetShrinePageMax()
    return math.floor(TableLength(ShrineUpgradeOrder) / 16)
end
