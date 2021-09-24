--NewOrder = { "ChthonicGods", "OlympianGods", "OlympianGoddess", "OtherDenizens", "Biomes", "Weapons", "Enemies", "Items", "Fish", "Keepsakes" }
NewOrder = { "ChthonicGods", "OlympianGods", "OlympianGoddess", "Biomes", "Weapons", "Enemies", "Items", "Fish", "Keepsakes" }
CodexOrderingOlympianGoddess =
{
    Order = { "AthenaUpgrade", "AphroditeUpgrade", "ArtemisUpgrade", "AresUpgrade", "DionysusUpgrade", "HermesUpgrade", "DemeterUpgrade" },
}
--CodexOrdering["OlympianGods"] = { "AthenaUpgrade", "AphroditeUpgrade", "ArtemisUpgrade"}
CodexOlympianGoddess =
	{
		UnlockType = CodexUnlockTypes.Boon,
		TitleText = "Codex_OlympianGoddessChapter",
		Entries =
		{
			AthenaUpgrade =
			{
				Entries =
				{
					{
						UnlockThreshold = 1,
						Text = "CodexData_0134",
					},
					{
						UnlockThreshold = 5,
						Text = "CodexData_0135",
					},
					{
						UnlockThreshold = 15,
						Text = "CodexData_0136",
					},
				},
				Image = "Codex_Portrait_Athena",
			},
        },
	}