-- Bugs from the Base Game.

ModUtil.Path.Wrap("Heal",
    function(baseFunc, victim, triggerArgs)
        if triggerArgs.HealAmount == nil then
            triggerArgs.HealAmount = 0
        end
        baseFunc(victim, triggerArgs)
    end
)

-- Common functions between sub-mod
function AuraAddEffectThread(args)
    local PreviousCloseEnemiesList = {}
    while CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead do
        wait(0.2, "RoomThread")
        if CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead
            and IsCombatEncounterActive(CurrentRun) and not IsEmpty(RequiredKillEnemies) then
            local enemiesNumberThreshold = args.EnemiesNumberThreshold or 0
            --ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Tick"))
            local closeEnemiesList = {}
            local closeEnemiesListCount = 0
            local enemyLocation = { 0, 0 }
            local heroLocation = GetLocation({ Id = CurrentRun.Hero.ObjectId })
            local ProximityThreshold = 400
            local DistanceSquared = 0
            for enemyId, enemy in pairs(RequiredKillEnemies) do
                enemyLocation = GetLocation({ Id = enemy.ObjectId })
                local distanceSquared = math.sqrt((enemyLocation.X - heroLocation.X) ^ 2 +
                    (enemyLocation.Y - heroLocation.Y) ^ 2)
                ModUtil.Hades.PrintStackChunks(ModUtil.ToString(enemy.Name))
                ModUtil.Hades.PrintStackChunks(ModUtil.ToString(distanceSquared))


                ApplyEffectFromWeapon({ Id = CurrentRun.Hero.ObjectId, DestinationIds = CurrentRun.Hero.ObjectId,
                    WeaponName = "FoesNumberDamageBuff", EffectName = "FoesNumberDamageBuff" })

                ClearEffect({ Ids = CurrentRun.Hero.ObjectId, Name = "FoesNumberDamageBuff" })

            end

        end
    end
end

ModUtil.Path.Wrap("GetKeepsakeLevel",
    function(baseFunc, traitName)
        if TraitData[traitName] == nil then
            return 1
        else
            return baseFunc(traitName)
        end
    end
)
ModUtil.Path.Wrap("EquipKeepsake",
    function(baseFunc, heroUnit, traitName, args)
        if traitName == nil or TraitData[traitName] == nil then
            return
        end
        baseFunc(heroUnit, traitName, args)
    end
)
ModUtil.Path.Wrap("EquipAssist",
    function(baseFunc, heroUnit, traitName, args)
        if traitName == nil or TraitData[traitName] == nil then
            return
        end
        baseFunc(heroUnit, traitName, args)
    end
)
ModUtil.Path.Wrap("CalculateDamageMultipliers",
    function(baseFunc, attacker, victim, weaponData, triggerArgs)
        local damageReductionMultipliers = 1
        local damageMultipliers = 1.0
        local lastAddedMultiplierName = ""
        local addDamageMultiplier = function(data, multiplier)
            if multiplier >= 1.0 then
                if data.Multiplicative then
                    damageReductionMultipliers = damageReductionMultipliers * multiplier
                else
                    damageMultipliers = damageMultipliers + multiplier - 1
                end
                if ConfigOptionCache.LogCombatMultipliers then
                    lastAddedMultiplierName = data.Name or "Unknown"
                    DebugPrint({ Text = " Additive Damage Multiplier (" .. lastAddedMultiplierName .. "):" .. multiplier })
                end
            else
                if data.Additive then
                    damageMultipliers = damageMultipliers + multiplier - 1
                else
                    damageReductionMultipliers = damageReductionMultipliers * multiplier
                end
                if ConfigOptionCache.LogCombatMultipliers then
                    lastAddedMultiplierName = data.Name or "Unknown"
                    DebugPrint({ Text = " Multiplicative Damage Reduction (" ..
                        lastAddedMultiplierName .. "):" .. multiplier })
                end
            end
        end
        if attacker ~= nil and attacker.OutgoingDamageModifiers ~= nil and ( not weaponData or not weaponData.IgnoreOutgoingDamageModifiers ) then
            local appliedEffectTable = {}
            for i, modifierData in pairs(attacker.OutgoingDamageModifiers) do
                local validEffect = modifierData.ValidEffects == nil or ( triggerArgs.EffectName ~= nil and Contains(modifierData.ValidEffects, triggerArgs.EffectName ))
                local validWeapon = modifierData.ValidWeaponsLookup == nil or ( modifierData.ValidWeaponsLookup[ triggerArgs.SourceWeapon ] ~= nil and triggerArgs.EffectName == nil )
                local validTrait = modifierData.RequiredTrait == nil or ( attacker == CurrentRun.Hero and HeroHasTrait( modifierData.RequiredTrait ) )
                local validUniqueness = modifierData.Unique == nil or not modifierData.Name or not appliedEffectTable[modifierData.Name]
                local validEnchantment = true
                if modifierData.ValidEnchantments and attacker == CurrentRun.Hero then
                    validEnchantment = false
                    if modifierData.ValidEnchantments.TraitDependentWeapons then
                        for traitName, validWeapons in pairs( modifierData.ValidEnchantments.TraitDependentWeapons ) do
                            if Contains( validWeapons, triggerArgs.SourceWeapon) and HeroHasTrait( traitName ) then
                                validEnchantment = true
                                break
                            end
                        end
                    end

                    if not validEnchantment and modifierData.ValidEnchantments.ValidWeapons and Contains( modifierData.ValidEnchantments.ValidWeapons, triggerArgs.SourceWeapon ) then
                        validEnchantment = true
                    end
                end
                if validUniqueness and validWeapon and validEffect and validTrait and validEnchantment then
                    if modifierData.PerSameGodMultiplier and attacker == CurrentRun.Hero then
                        addDamageMultiplier( modifierData, 1 + ( modifierData.PerSameGodMultiplier  * GetHeroSameGodCount( attacker )))
                    end
                end
            end
        end
        local vanillaMultiplier = baseFunc(attacker, victim, weaponData, triggerArgs)
        return vanillaMultiplier * damageMultipliers * damageReductionMultipliers
    end
)
ModUtil.Path.Wrap("UpdateHeroTraitDictionary",
    function(baseFunc)
        baseFunc()
        local godDictionary = {}
        local highestCount = 0
        for i, trait in pairs(CurrentRun.Hero.Traits) do
            if GetLootSourceName( trait.Name ) then
                godDictionary[GetLootSourceName( trait.Name )] = (godDictionary[GetLootSourceName( trait.Name )]  or 0) + 1
                if highestCount < godDictionary[GetLootSourceName( trait.Name )] then
                    highestCount = godDictionary[GetLootSourceName( trait.Name )]
                end
            end
        end
        CurrentRun.Hero.SameGodCount = highestCount
    end
)

function GetHeroSameGodCount( hero )
	if not hero then
		return 0
	end

	if hero.SameGodCount then
		return hero.SameGodCount
	end

	local godDictionary = {}
    local highestCount = 0
	for traitName in pairs( hero.TraitDictionary ) do
		if GetLootSourceName( traitName ) then
			godDictionary[GetLootSourceName( traitName )] = (godDictionary[GetLootSourceName( traitName )]  or 0) + 1
            if highestCount < godDictionary[GetLootSourceName( traitName )] then
                highestCount = godDictionary[GetLootSourceName( traitName )]
            end
        end
	end
	
	hero.SameGodCount = highestCount
	return hero.SameGodCount
end

ModUtil.Path.Wrap( "BeginOpeningCodex", 
	function(baseFunc)		
		if (not CanOpenCodex()) and IsSuperValid() then
			BuildSuperMeter(CurrentRun, 50)
		end
		ModUtil.Hades.PrintStackChunks(ModUtil.ToString(CurrentRun.Hero.SameGodCount)) 
		baseFunc()
	end
)
--[[ModUtil.Path.Wrap( "AddRerolls", 
	function(baseFunc, amount, source, args )
        if type(amount) == "number" then
		    baseFunc(amount, source, args)
        end
	end
)]]
