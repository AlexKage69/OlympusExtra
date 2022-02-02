-- Going to combine all mods

--[[ModUtil.RegisterMod("OlympusExtra")

-- Add new LootData and more
ModUtil.LoadOnce(function ()
    for lootName, section in pairs(OlympusExtra.LootData) do
        LootData[lootName] = OlympusExtra.LootData[lootName]
    end
    for achivementName, section in pairs(OlympusExtra.AchievementData) do
        GameData.AchievementData[achivementName] = section
    end
    for enemyName, section in pairs(OlympusExtra.EnemiesData) do
        UnitSetData.Enemies[enemyName] = section
    end
    for giftName, section in pairs(OlympusExtra.GiftData) do
        table.insert(GiftOrdering, 13, section.GiftOrdering);
        GiftData[giftName] = section.GiftData;
    end
    for traitName, section in pairs(OlympusExtra.TraitData) do
        TraitData[traitName] = section;
    end
end)

function AddGodToSubCodex(category, god)
    table.insert(CodexOrdering[category].Order, god)
    Codex[category].Entries[god] = OlympusExtra.Codex[category].Codex.Entries[god]
    table.insert(BoonInfoScreenData.Ordering, god)
    return true
end--]]