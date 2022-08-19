-- Separate Gods from Goddess to add more gods

ModUtil.RegisterMod("SeparateGoddess")

local OlympusCodexUI = ModUtil.Entangled.ModData(CodexUI)
OlympusCodexUI.MaxChapters = 4;

local OlympusCodex = ModUtil.Entangled.ModData(Codex)
OlympusCodex.OlympianGoddess = {
    UnlockType = CodexUnlockTypes.Boon,
    TitleText = "Codex_OlympianGoddessChapter",
    Entries = {
        AthenaUpgrade = Codex.OlympianGods.Entries.AthenaUpgrade,
        AphroditeUpgrade = Codex.OlympianGods.Entries.AphroditeUpgrade,
        ArtemisUpgrade = Codex.OlympianGods.Entries.ArtemisUpgrade,
        DemeterUpgrade = Codex.OlympianGods.Entries.DemeterUpgrade
    }
}
OlympusCodex.OlympianGods.Entries.AthenaUpgrade = nil
OlympusCodex.OlympianGods.Entries.AphroditeUpgrade = nil
OlympusCodex.OlympianGods.Entries.ArtemisUpgrade = nil
OlympusCodex.OlympianGods.Entries.DemeterUpgrade = nil

local OlympusCodexOrdering = ModUtil.Entangled.ModData(CodexOrdering)
table.insert(OlympusCodexOrdering.Order, 3, "OlympianGoddess")
OlympusCodexOrdering.OlympianGoddess = {
    Order = { "AthenaUpgrade", "AphroditeUpgrade", "ArtemisUpgrade", "DemeterUpgrade" }
}
OlympusCodexOrdering.OlympianGods.Order.AthenaUpgrade = nil
OlympusCodexOrdering.OlympianGods.Order.AphroditeUpgrade = nil
OlympusCodexOrdering.OlympianGods.Order.ArtemisUpgrade = nil
OlympusCodexOrdering.OlympianGods.Order.DemeterUpgrade = nil

-- Added check for Goddess being check on upgrade
ModUtil.WrapBaseFunction( "HandleUpgradeChoiceSelection", function(baseFunc, screen, button)
    baseFunc(screen, button)
	CheckCodexUnlock( "OlympianGoddess", button.UpgradeName )
end)

-- Added check for Goddess being check on gift
ModUtil.WrapBaseFunction( "AttemptGift", function(baseFunc, CurrentRun, target)
    baseFunc(CurrentRun, target)
	local name = GetGenusName( target )
	local resourceName = GetNextGiftResource( name )
	local resourceQuantity = GetNextGiftResourceQuantity( name )
    if PlayingTextLines or not IsInputAllowed({ }) or target == nil or not HasResource( resourceName, resourceQuantity ) then
        return
    end
    if CanReceiveGift( target ) then
        CheckCodexUnlock( "OlympianGoddess", name )
    end
end)

-- Overwrite the same function
ModUtil.WrapBaseFunction( "CodexScrollChaptersLeft", function(baseFunc, screen, button)
	if not screen or not CodexUI.Screen or not IsScreenOpen( "Codex" ) or not screen.AllowInput then
		return
	end

	if CodexStatus.ChapterOffset == nil then
		CodexStatus.ChapterOffset = 1
	else
		CodexStatus.ChapterOffset = CodexStatus.ChapterOffset - CodexUI.MaxChapters
		if CodexStatus.ChapterOffset < 1 then
			CodexStatus.ChapterOffset = 9 -- 3 pages instead of 2
		end
	end
	CodexUpdateChapters( screen )
	local chapterIndex = math.min( CodexStatus.ChapterOffset + CodexUI.MaxChapters - 1, #CodexOrdering.Order )
	local chapterName = CodexOrdering.Order[chapterIndex]
	local chapterButton = screen.Components[chapterName]
	CodexOpenChapter( screen, chapterButton, { FirstOpen = true } )
end)

-- Added CodexStatus
ModUtil.Path.Wrap( "UnlockExistingEntries", 
	function(baseFunc)	
		baseFunc()
		if CodexStatus["OlympianGoddess"] == nil then
			CodexStatus["OlympianGoddess"] = {}
			if CodexStatus["OlympianGods"] ~= nil then
				if CodexStatus["OlympianGods"]["ArtemisUpgrade"] ~= nil then
					CodexStatus["OlympianGoddess"]["ArtemisUpgrade"] = CodexStatus["OlympianGods"]["ArtemisUpgrade"]
				end	
				if CodexStatus["OlympianGods"]["DemeterUpgrade"] ~= nil then
					CodexStatus["OlympianGoddess"]["DemeterUpgrade"] = CodexStatus["OlympianGods"]["DemeterUpgrade"]
				end	
				if CodexStatus["OlympianGods"]["AphroditeUpgrade"] ~= nil then
					CodexStatus["OlympianGoddess"]["AphroditeUpgrade"] = CodexStatus["OlympianGods"]["AphroditeUpgrade"]
				end	
				if CodexStatus["OlympianGods"]["AthenaUpgrade"] ~= nil then
					CodexStatus["OlympianGoddess"]["AthenaUpgrade"] = CodexStatus["OlympianGods"]["AthenaUpgrade"]
				end	
			end
		end	
	end
)
