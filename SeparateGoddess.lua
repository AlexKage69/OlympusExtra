-- Separate Gods from Goddess to add more gods

ModUtil.RegisterMod("SeparateGoddess")

OlympianGoddessExtra = {
    Index = 3,
    Order = { "AthenaUpgrade", "AphroditeUpgrade", "ArtemisUpgrade", "DemeterUpgrade" },
    Codex = {
        UnlockType = CodexUnlockTypes.Boon,
        TitleText = "Codex_OlympianGoddessChapter",
        Entries = {}
    }
}
-- Move and add new gods and goddess
function MoveGodToSubCodex(category, CodexOrderingIndex, god)
    for godtoremove, info in pairs(Codex.OlympianGods.Entries) do
        if(godtoremove == god) then
            --table.insert(CodexOrdering[category].Order, god)
            Codex[category].Entries[god] = Codex.OlympianGods.Entries[god]
            table.remove(CodexOrdering.OlympianGods.Order, CodexOrderingIndex)
            Codex.OlympianGods.Entries[god] = nil
            return true
        end
    end
    return false
end

ModUtil.LoadOnce(function ()    
    CodexUI.MaxChapters = 4
        if(Codex.OlympianGoddess == nil and CodexOrdering.OlympianGoddess == nil ) then
            Codex.OlympianGoddess = {}
            Codex.OlympianGoddess = ModUtil.Table.Copy(OlympianGoddessExtra.Codex)
            CodexOrdering.OlympianGoddess = {Order = ModUtil.Table.Copy(OlympianGoddessExtra.Order)}    
            table.insert(CodexOrdering.Order, OlympianGoddessExtra.Index, "OlympianGoddess")        
        end
        for _, value in ipairs(OlympianGoddessExtra.Order) do
                for j, god in ipairs(CodexOrdering.OlympianGods.Order) do
                    -- Already exists
                    if(god == value) then
                        MoveGodToSubCodex("OlympianGoddess", j, god)
                        ModUtil.Hades.PrintStackChunks(ModUtil.ToString.Deep(god))
                    end
                end
        end 
end)

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
