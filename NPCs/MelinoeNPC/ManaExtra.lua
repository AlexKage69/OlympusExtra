local OlympusTraitData = ModUtil.Entangled.ModData(TraitData)
OlympusTraitData.ManaTraits = {
	Frame = "Hammer"
}

OlympusTraitData.ManaTier1Shield = {
	InheritFrom = { "ManaTraits" },
	Name = "ManaTier1Shield",
	Icon = "Mana_T1_Shield",
	RestoreMana = {
		OnDamage = 0.2
	},
	GainMana = {
		Value = 50,
	}
}