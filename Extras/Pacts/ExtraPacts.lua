	
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

    -- Functions
--[[ModUtil.Path.Wrap("OpenShrineUpgradeMenu",
    function(baseFunc, args)
        baseFunc(args)
        local screen = ScreenAnchors.ShrineScreen
        local components = screen.Components
        local yStart = -475
        CreateTextBox({ Id = components.ShopBackground.Id, Text = "ShrineMenu_SubHead", FontSize = 24, OffsetX = -620, OffsetY = yStart + 130, Width = 1080, Color = Color.White, Font = "AlegreyaSansSCExtraBold", ShadowBlur = 0, ShadowColor = {0,0,0,255}, ShadowOffset={0, 1}, Justification = "Left", VerticalJustification = "CENTER", TextSymbolScale = 1.0 })

        thread( HandleWASDInput, screen )
        HandleScreenInput( screen )
    end
)]]