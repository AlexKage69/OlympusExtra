--Utils
function CheckIfAlreadyInCodex(name)
    for key, value in pairs(Codex) do
        for key, value in pairs(value.Entries) do
            return name == key
        end
    end
end


-- Main function
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
                                Codex[key].Entries[god] = section[god]
                                table.remove(CodexOrdering.OlympianGods.Order, j)
                                Codex.OlympianGods.Entries[value] = nil                                
                                added = true
                            end
                        end
                    else
                        Codex.OlympianGoddess.Entries[value] = section[value]
                        added = true
                    end
                end
        end    
        if(added) then
            table.insert(CodexOrdering.Order, section.Index, key)
        end
    end
--Codex