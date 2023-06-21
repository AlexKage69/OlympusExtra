-- Bugs from the Base Game.

ModUtil.Path.Wrap("Heal",
    function(baseFunc, victim, triggerArgs)
        if triggerArgs.HealAmount == nil then
            triggerArgs.HealAmount = 0
        end
        baseFunc(victim, triggerArgs)
    end
)

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
        local addDamageMultiplier = function(data, multiplier)
            if multiplier >= 1.0 then
                if data.Multiplicative then
                    damageReductionMultipliers = damageReductionMultipliers * multiplier
                else
                    damageMultipliers = damageMultipliers + multiplier - 1
                end                
            else
                if data.Additive then
                    damageMultipliers = damageMultipliers + multiplier - 1
                else
                    damageReductionMultipliers = damageReductionMultipliers * multiplier
                end
            end
        end
        if attacker ~= nil and attacker.OutgoingDamageModifiers ~= nil and ( weaponData ~= nil and weaponData.IgnoreOutgoingDamageModifiers ) then
            local appliedEffectTable = {}
            for i, modifierData in pairs(attacker.OutgoingDamageModifiers) do
                local validEffect = modifierData.ValidEffects == nil or ( triggerArgs.EffectName ~= nil and Contains(modifierData.ValidEffects, triggerArgs.EffectName ))
                local validWeapon = modifierData.ValidWeaponsLookup == nil or ( modifierData.ValidWeaponsLookup[ triggerArgs.SourceWeapon ] ~= nil and triggerArgs.EffectName == nil )
                local validTrait = modifierData.RequiredTrait == nil or ( attacker == CurrentRun.Hero and HeroHasTrait( modifierData.RequiredTrait ) )
                local validUniqueness = modifierData.Unique == nil or not modifierData.Name or not appliedEffectTable[modifierData.Name]
                local validEnchantment = true     
    
                if validUniqueness and validWeapon and validEffect and validTrait and validEnchantment and modifierData.BypassIgnore then
                    if modifierData.Name then
                        appliedEffectTable[ modifierData.Name] = true
                    end                   
                    if modifierData.ValidWeaponMultiplier then
                        addDamageMultiplier( modifierData, modifierData.ValidWeaponMultiplier)
                    end                    
                end
            end
        end
        local vanillaMultiplier = baseFunc(attacker, victim, weaponData, triggerArgs)
        return vanillaMultiplier * damageMultipliers * damageReductionMultipliers
    end
)

--[[ModUtil.Path.Wrap( "AddRerolls", 
	function(baseFunc, amount, source, args )
        if type(amount) == "number" then
		    baseFunc(amount, source, args)
        end
	end
)]]
function ForceNextRoomFunc(value)
    ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Click Forced:"..value))

    -- Stomp any rooms already assigned to doors
    for doorId, door in pairs( OfferedExitDoors ) do
        local room = door.Room
        if room ~= nil then
            --ForceNextEncounter = "MiniBossSpreadShot"

            local forcedRoomData = RoomData[value]
            local forcedRoom = CreateRoom( forcedRoomData )
            AssignRoomToExitDoor( door, forcedRoom )
        end
    end
end
ModUtil.Path.Wrap( "BeginOpeningCodex", 
		function(baseFunc)		
            --PresentationNewSameGodIncrease()
			if (not CanOpenCodex()) and IsSuperValid() then
				BuildSuperMeter(CurrentRun, 50)
			end
            --CreateAnimation({ Name = "HeraWings", DestinationId = CurrentRun.Hero.ObjectId })            
            --ForceNextRoomFunc("B_Shop01")
                --ModUtil.Hades.PrintStackChunks(ModUtil.ToString.TableKeys(CurrentRun.Hero.Traits))
            
			--LoadMap({ Name ="E_Story01", ResetBinks = true, ResetWeaponBinks = true })
            --LoadMap({ Name ="A_Shop01", ResetBinks = true, ResetWeaponBinks = true })
			baseFunc()
		end
	)
