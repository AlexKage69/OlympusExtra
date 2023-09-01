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
        if attacker ~= nil and attacker.OutgoingDamageModifiers ~= nil and (weaponData ~= nil and weaponData.IgnoreOutgoingDamageModifiers) then
            local appliedEffectTable = {}
            for i, modifierData in pairs(attacker.OutgoingDamageModifiers) do
                local validEffect = modifierData.ValidEffects == nil or
                (triggerArgs.EffectName ~= nil and Contains(modifierData.ValidEffects, triggerArgs.EffectName))
                local validWeapon = modifierData.ValidWeaponsLookup == nil or
                (modifierData.ValidWeaponsLookup[triggerArgs.SourceWeapon] ~= nil and triggerArgs.EffectName == nil)
                local validTrait = modifierData.RequiredTrait == nil or
                (attacker == CurrentRun.Hero and HeroHasTrait(modifierData.RequiredTrait))
                local validUniqueness = modifierData.Unique == nil or not modifierData.Name or
                not appliedEffectTable[modifierData.Name]
                local validEnchantment = true

                if validUniqueness and validWeapon and validEffect and validTrait and validEnchantment and modifierData.BypassIgnore then
                    if modifierData.Name then
                        appliedEffectTable[modifierData.Name] = true
                    end
                    if modifierData.ValidWeaponMultiplier then
                        addDamageMultiplier(modifierData, modifierData.ValidWeaponMultiplier)
                    end
                end
            end
        end
        local vanillaMultiplier = baseFunc(attacker, victim, weaponData, triggerArgs)
        return vanillaMultiplier * damageMultipliers * damageReductionMultipliers
    end
)
ModUtil.Path.Wrap("DamageEnemy",
    function(baseFunc, victim, triggerArgs)
        local sourceWeaponData = triggerArgs.AttackerWeaponData
        if sourceWeaponData and sourceWeaponData.MultipleProjectileMultiplier and victim then
            triggerArgs.DamageAmount = TrackDamageWithTime(triggerArgs, victim, sourceWeaponData.Name, sourceWeaponData
            .MultipleProjectileMultiplier)
        elseif victim and triggerArgs.SourceProjectile then
            local sourceProjectileData = ProjectileData[triggerArgs.SourceProjectile]
            if sourceProjectileData and sourceProjectileData.MultipleProjectileMultiplier then
                triggerArgs.DamageAmount = TrackDamageWithTime(triggerArgs, victim, sourceProjectileData.Name, sourceProjectileData
                .MultipleProjectileMultiplier)
            end
        end
        baseFunc(victim, triggerArgs)
        -- Jealousy Stuff
        if sourceWeaponData ~= nil and not triggerArgs.PureDamage and not IsEmpty(ActiveEnemies) and victim and
            not victim.IsDead and IsEmpty(victim.InvulnerableFlags) and IsEmpty(victim.PersistentInvulnerableFlags)
            and victim.ActiveEffects and victim.ActiveEffects.JealousyCurse and victim.JealousyModifier and
            Contains(WeaponSets.AllJealousyWeapons, sourceWeaponData.Name) and triggerArgs.EffectName == nil then
            local damageAmount = triggerArgs.DamageAmount * victim.JealousyModifier *
            TableLength(victim.VulnerabilityEffects)
            if HeroData.DefaultHero.HeroAlliedUnits[victim.Name] then
                damageAmount = 0
            end
            Damage(victim,
                { EffectName = "JealousyCurse", DamageAmount = damageAmount, Silent = false, PureDamage = false })
            --ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Jealousy Damage"))
        end
        if (HeroHasTrait("ExplosionTrait") and triggerArgs.IsCrit) then
            FireWeaponFromUnit({
                Weapon = "ArtemisHestiaExplosion",
                Id = CurrentRun.Hero.ObjectId,
                DestinationId = victim.ObjectId,
                ClearAllFireRequests = true,
                FireFromTarget = true
            })
        end
    end
)
function TrackDamageWithTime(triggerArgs, victim, name, mutliplier)
    if victim.TimeOfLastDamage and victim.TimeOfLastDamage[name] and
        _worldTime - victim.TimeOfLastDamage[name] < 0.05 then
        return triggerArgs.DamageAmount * mutliplier
    else
        if not victim.TimeOfLastDamage then
            victim.TimeOfLastDamage = {}
        end
        victim.TimeOfLastDamage[name] = _worldTime
        return triggerArgs.DamageAmount
    end
end

--[[ModUtil.Path.Wrap( "AddRerolls",
	function(baseFunc, amount, source, args )
        if type(amount) == "number" then
		    baseFunc(amount, source, args)
        end
	end
)]]
function ForceNextRoomFunc(value)
    ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Click Forced:" .. value))

    -- Stomp any rooms already assigned to doors
    for doorId, door in pairs(OfferedExitDoors) do
        local room = door.Room
        if room ~= nil then
            --ForceNextEncounter = "MiniBossSpreadShot"

            local forcedRoomData = RoomData[value]
            local forcedRoom = CreateRoom(forcedRoomData)
            AssignRoomToExitDoor(door, forcedRoom)
        end
    end
end

--[[ModUtil.Path.Wrap("BeginOpeningCodex",
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
)]]
-- Rejection Functions
ModUtil.Path.Wrap("SpawnRoomReward",
    function(baseFunc, eventSource, args)
        local currentRoom = CurrentRun.CurrentRoom
        if currentRoom.RewardSkip == nil then
            baseFunc(eventSource, args)
        end
    end)
ModUtil.Path.Wrap("StartDevotionTest",
    function(baseFunc, currentRun, currentRoom, currentEncounter)
        currentRun = currentRun or CurrentRun
        currentRoom = currentRoom or CurrentRun.CurrentRoom
        currentEncounter = currentEncounter or CurrentRun.CurrentRoom.Encounter

        thread(PlayVoiceLines, GlobalVoiceLines.DevotionLootGrantedVoiceLines)

        local lootA = GiveLoot({
            OffsetX = -85,
            OffsetY = 35,
            ForceLootName = currentEncounter.LootAName,
            SuppressSpawnSounds = true
        })
        lootA.CanReceiveGift = false
        SetThingProperty({ Property = "SortBoundsScale", Value = 1, DestinationId = lootA.ObjectId })
        SetObstacleProperty({ Property = "MagnetismWhileBlocked", Value = 0, DestinationId = lootA.ObjectId })

        local lootB = GiveLoot({
            OffsetX = 85,
            OffsetY = -35,
            ForceLootName = currentEncounter.LootBName,
            SuppressSpawnSounds = true
        })
        lootB.CanReceiveGift = false
        SetThingProperty({ Property = "SortBoundsScale", Value = 1, DestinationId = lootB.ObjectId })
        SetObstacleProperty({ Property = "MagnetismWhileBlocked", Value = 0, DestinationId = lootB.ObjectId })

        waitUntil(UIData.BoonMenuId)

        local lootAId = lootA.ObjectId
        local lootBId = lootB.ObjectId
        local newLoots = { lootAId, lootBId }
        -- upgrade enemies with alternate upgrade
        local chosenLootName = NotifyResultsTable[UIData.BoonMenuId]
        local alternateLootId = nil
        local alternateLootData = nil
        if lootA.Name == chosenLootName then
            alternateLootId = lootBId
            alternateLootData = lootB
        else
            alternateLootId = lootAId
            alternateLootData = lootA
        end
        currentEncounter.ChosenGodName = chosenLootName
        currentEncounter.SpurnedGodName = alternateLootData.Name

        -- wait until slot upgrade is done
        DebugPrint({ Text = "Apply " .. alternateLootData.Name .. " to Enemies" })
        AddEnemyUpgrade(alternateLootData.Name, CurrentRun)
        currentEncounter.RemoveUpgradeOnEnd = alternateLootData.Name
        if EnemyData[alternateLootData.Name .. "RoomWeapon"] ~= nil then
            currentEncounter.SpawnPassiveRoomWeapons = currentEncounter.SpawnPassiveRoomWeapons or {}
            table.insert(currentEncounter.SpawnPassiveRoomWeapons, alternateLootData.Name .. "RoomWeapon")
        end
        if CanPlayFreePass(chosenLootName, alternateLootData) then
            StartDevotionTestPresentationFreePass(CurrentRun.CurrentRoom, alternateLootData, alternateLootId)
            alternateLootData.Skip = true
            CurrentRun.CurrentRoom.RewardSkip = true
            currentEncounter.Completed = true
            currentEncounter.StartTime = _worldTime
            currentEncounter.ClearTime = 0
            DisplayUnlockText({
                --SupertitleText = "EasyModeUpgradedSupertitle",

                TitleText = "FreePassTextBanner",
                SubtitleText = alternateLootData.Name .. "FreePass",
                TextRevealSound = "/Leftovers/Menu Sounds/EmoteExcitement",
                Color = Color.DarkSalmon,
                --SupertitleTextColor = {190, 190, 190, 255},
                --SupertitleTextDelay = 1.0,
                TextColor = Color.White,
                SubTextColor = alternateLootData.LootColor,
                -- Icon = EasyModeIcon,
                -- Duration = 4.35,
                -- IconMoveSpeed = 0.00001,
                TextOffsetY = 15,
                --TitleFont = "SpectralSCLightTitling",
                --SubtitleFont = "SpectralSCLightTitling",
                --SupertitleFont = "AlegreyaSansSCRegular",
                Layer = "Overlay",
                AdditionalAnimation = "GodHoodRays",
            })
        else
            CurrentRun.CurrentRoom.RejectedLootData = alternateLootData
            UseableOff({ Ids = newLoots })
            StartDevotionTestPresentation(CurrentRun.CurrentRoom, alternateLootData, alternateLootId)
            Destroy({ Ids = newLoots })
            EnableRoomTraps()
            ActivatedObjects[alternateLootId] = nil
            RemoveInputBlock({ Name = "DevotionTest" })
            StartEncounterEffects(CurrentRun)
        end
    end)
function CanPlayFreePass(chosenLootName, alternateLootData)
    if alternateLootData.FreePassVoiceLines == nil or
        (chosenLootName ~= "HestiaUpgrade" and alternateLootData.Name ~= "HestiaUpgrade") then
        return false
    end
    local allEligibleLines = {}
    for textLinesName, textLines in pairs(alternateLootData.FreePassVoiceLines) do
        if IsTextLineEligible(CurrentRun, textLines) then
            table.insert(allEligibleLines, textLines)
        end
    end

    if IsEmpty(allEligibleLines) then
        return false
    end
    if GameState.ForgivenessEncounteredCount == nil then
        GameState.ForgivenessEncounteredCount = {}
    end
    if GameState.ForgivenessEncounteredCount[alternateLootData.Name] == nil then
        GameState.ForgivenessEncounteredCount[alternateLootData.Name] = 1
    else
        GameState.ForgivenessEncounteredCount[alternateLootData.Name] = GameState.ForgivenessEncounteredCount[
        alternateLootData.Name] + 1
    end
    local number = RandomFloat(0, 1)
    return number <= (0.20 * GameState.ForgivenessEncounteredCount[alternateLootData.Name])
end

function StartDevotionTestPresentationFreePass(currentRoom, alternateLootData, alternateLootId)
    AddInputBlock({ Name = "DevotionTest" })
    wait(1.0)
    --Shake({ Id = alternateLootData.ObjectId, Distance = 2, Speed = 250, Duration = 1.0  })
    PanCamera({ Ids = alternateLootData.ObjectId, Duration = 3.5, EaseIn = 0.05, EaseOut = 0.3 })
    --thread( DoRumble, { { ScreenPreWait = 0.15, LeftFraction = 0.17, Duration = 1.0 }, } )
    -- thread( InCombatText, alternateLootId, "Player_GodDispleased_"..alternateLootData.Name, 2.5 )
    -- AngleTowardTarget({ Id = CurrentRun.Hero.ObjectId, DestinationId = alternateLootId })

    --PlaySound({ Name = "/Leftovers/Menu Sounds/TextReveal3", Id = alternateLootId })
    --wait(0.5)
    --PlaySound({ Name = "/SFX/Menu Sounds/PortraitEmoteAngerSFX" })

    PlayRandomRemainingTextLines(alternateLootData, alternateLootData.FreePassVoiceLines)
    PanCamera({ Ids = CurrentRun.Hero.ObjectId, Duration = 1.0, EaseIn = 0.05, EaseOut = 0.3 })
    alternateLootData.Skip = true
    RemoveInputBlock({ Name = "DevotionTest" })
    --[[if alternateLootData.RejectionVoiceLines ~= nil then
    thread( PlayVoiceLines, alternateLootData.RejectionVoiceLines )
else
    thread( PlayVoiceLines, GlobalVoiceLines.GodRejectedVoiceLines, true )
end]]
    --wait(1.0)
    --[[if alternateLootData.LootRejectionAnimation then
    CreateAnimation({ Name = alternateLootData.LootRejectionAnimation, DestinationId = alternateLootId })
else
    CreateAnimation({ Name = "BoonOrbDissipate", DestinationId = alternateLootId, Color = Color.Red })
end]]
    --PlaySound({ Name = "/SFX/GodFavorBattleStart" })
    PlaySound({ Name = "/Leftovers/Menu Sounds/TextReveal2" })
end

ModUtil.Path.Wrap("HandleLootPickup",
    function(baseFunc, currentRun, loot)
        if loot.Skip then
            local checkingMeterUnlock = GiftData[loot.Name] and
                not IsGameStateEligible(CurrentRun, GiftData[loot.Name].UnlockGameStateRequirements)
            SetPlayerInvulnerable("HandleLootPickup")
            AddTimerBlock(currentRun, "HandleLootPickup")

            local lootId = loot.ObjectId

            CurrentLootData = loot
            SetLightBarColor({ PlayerIndex = 1, Color = loot.LootColor });

            local hasDuoBoon = false
            if loot.UpgradeOptions ~= nil then
                for i, itemData in pairs(loot.UpgradeOptions) do
                    if itemData.Type == "Trait" and TraitData[itemData.ItemName] and TraitData[itemData.ItemName].IsDuoBoon then
                        hasDuoBoon = true
                    end
                end
            end

            PlaySound({ Name = loot.PickupSound or "/SFX/Menu Sounds/GodBoonInteract" })
            thread(PlayVoiceLines, loot.PickupVoiceLines, true)

            -- SKIP TALKING

            AddInputBlock({ Name = "HandleLootPickup" })

            if CurrentRun.LootTypeHistory[loot.Name] == nil then
                CurrentRun.LootTypeHistory[loot.Name] = 0
            end
            currentRun.LootTypeHistory[loot.Name] = currentRun.LootTypeHistory[loot.Name] + 1

            if loot.RespawnAfterUse then
                local newLoot = CreateLoot({ Name = loot.Name, LootData = loot, SpawnPoint = lootId })
                newLoot.UpgradeOptions = loot.UpgradeOptions
            end
            if loot.WipeRecordsAfterUse then
                TextLinesRecord = {}
                CurrentRun.TextLinesRecord = {}
            end
            Destroy({ Id = lootId })
            ActivatedObjects[lootId] = nil

            RemoveInputBlock({ Name = "HandleLootPickup" })
            RemoveTimerBlock(currentRun, "HandleLootPickup")

            if HasExchangeOnLoot(loot) and GetNumMetaUpgrades("ReducedLootChoicesShrineUpgrade") == 0 then
                thread(PlayVoiceLines, HeroVoiceLines.UpgradeMenuOpenVoiceLines, true)
            else
                thread(PlayVoiceLines, loot.UpgradeMenuOpenVoiceLines, true)
            end

            if not GameData.MissingPackages[loot.Name] then
                LoadPackages({ Name = loot.Name })
            end
            OpenUpgradeChoiceMenu(loot)

            if loot.PostPickupFunction ~= nil then
                local postPickupFunction = _G[loot.PostPickupFunction]
                postPickupFunction(loot, loot.PostPickupFunctionArgs)
            end

            SetPlayerVulnerable("HandleLootPickup")
            if checkingMeterUnlock and IsGameStateEligible(CurrentRun, GiftData[loot.Name].UnlockGameStateRequirements) then
                thread(GiftTrackUnlockedPresentation, loot.Name)
            end
        else
            baseFunc(currentRun, loot)
        end
    end)
