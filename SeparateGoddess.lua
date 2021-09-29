-- Separate Gods from Goddess to add more gods

ModUtil.RegisterMod("SeparateGoddess")

--local mod = "SeparateGoddess"
--local package = "HeroesIcons"

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

function AddGodToSubCodex(category, god)
    --table.insert(CodexOrdering[category].Order, god)
    Codex[category].Entries[god] = Codex.OlympianGods.Entries[god]
    return true
end

function AddNewOlympians()
    for modName, section in pairs(CodexExtra) do
        Codex[modName] = ModUtil.Table.Copy(section.Codex)
        CodexOrdering[modName] = {Order = ModUtil.Table.Copy(section.Order)}
        local added = false
        for i, value in ipairs(section.Order) do
                for j, god in ipairs(CodexOrdering.OlympianGods.Order) do
                    -- Already exists
                    if(god == value) then
                        added = MoveGodToSubCodex(modName, j, god) or added
                    else -- New God ValueOptions
                        --added = AddGodToSubCodex(modName, god) or added
                    end
                end
        end    
        if(added) then
            table.insert(CodexOrdering.Order, section.Index, modName)
        end
    end
end

OnAnyLoad{ function() 
    CodexUI.MaxChapters = 4
    AddNewOlympians()
end}

ModUtil.WrapBaseFunction( "SetupMap", function(baseFunc)
    --DebugPrint({Text = "@"..mod.." Trying to load package "..package..".pkg"})
    --LoadPackages({Name = package})
    return baseFunc()
end)

ModUtil.WrapBaseFunction( "HandleUpgradeChoiceSelection", function(baseFunc, screen, button)
    baseFunc(screen, button)
	CheckCodexUnlock( "OlympianGoddess", button.UpgradeName )
end)

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

ModUtil.WrapBaseFunction( "OpenCodexScreen", function(baseFunc)
    if(CodexStatus) then
        ModUtil.Hades.PrintStackChunks("------Check Codex Status-----")    
        ModUtil.Hades.PrintStackChunks(ModUtil.ToString.Deep(CodexStatus.OlympianGods))
        ModUtil.Hades.PrintStackChunks("-----------")    
        ModUtil.Hades.PrintStackChunks(ModUtil.ToString.Deep(CodexStatus.OlympianGoddess))
    end
    baseFunc()
end)

-- Run OnLoad

--New Data
CodexExtra = {
	OlympianGoddess = {
		Index = 3,
		Order = { "AthenaUpgrade", "AphroditeUpgrade", "ArtemisUpgrade", "DemeterUpgrade" },
		Codex = {
			UnlockType = CodexUnlockTypes.Boon,
			TitleText = "Codex_OlympianGoddessChapter",
			Entries = {}
		}
    }
}