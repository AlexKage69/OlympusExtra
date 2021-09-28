-- Separate Gods from Goddess to add more gods

ModUtil.RegisterMod("SeparateGoddess")
--New Data
CodexOrderingExtra = {
	OlympianGoddess = {
		Index = 3,
		Order = { "AthenaUpgrade", "AphroditeUpgrade", "ArtemisUpgrade" },
		Codex = {
			UnlockType = CodexUnlockTypes.Boon,
			TitleText = "Codex_OlympianGoddessChapter",
			Entries = {}
		}
    }
}

OnAnyLoad{ function()
    CodexUI.MaxChapters = 3
    for key, section in pairs(CodexOrderingExtra) do
        Codex[key] = section.Codex
        CodexOrdering[key] = { Order = {}}
        local added = false
        for i, value in ipairs(section.Order) do
                for j, god in ipairs(CodexOrdering.OlympianGods.Order) do
                    if(god == value) then
                        for godtoremove, godinfo in pairs(Codex.OlympianGods.Entries) do
                            if(godtoremove == god) then
                                table.insert(CodexOrdering[key].Order, god)
                                Codex[key].Entries[god] = Codex.OlympianGods.Entries[value]
                                table.remove(CodexOrdering.OlympianGods.Order, j)
                                Codex.OlympianGods.Entries[value] = nil
                                added = true
                            end
                        end
                    else
                        Codex[key].Entries[value] = section[value]
                        added = true
                    end
                end
        end    
        if(added) then
            table.insert(CodexOrdering.Order, section.Index, key)
        end
    end
end}

ModUtil.WrapBaseFunction( "OpenCodexScreen", function(baseFunc)
    baseFunc()
end)

ModUtil.WrapBaseFunction( "CodexOpenChapter", function(baseFunc,  screen, button, args)
    --ModUtil.Hades.PrintStackChunks(ModUtil.ToString.Deep(button.ChapterData.Entries.DemeterUpgrade))
    if(button.ChapterData ~= nil) then
        baseFunc(screen, button, args)
    end
end)
