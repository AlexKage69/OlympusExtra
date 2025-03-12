-- Bugs from the Base Game.
-- Updated Vanilla Data
local OlympusTraitData = ModUtil.Entangled.ModData(TraitData)
OlympusTraitData.FastClearDodgeBonusTrait.LootSource = "HermesUpgrade"
OlympusTraitData.AmmoReloadTrait.LootSource = "HermesUpgrade"

-- Add new Keywords
local OlympusKeywordList = ModUtil.Entangled.ModData(KeywordList)
ModUtil.Table.Merge(OlympusKeywordList, { 
    "LavaSplash", "CentaurHeart", "CentaurSoul", "MiniBoss", 
    "JealousyCurse", "EnvyCurse", "HeraTrap", "Aura", 
    "SpecialDiscount", "ApolloBlind", "FlashBomb", "DamageResist",
    "Repair", "IgneousArmor", "TemporaryAmmo", "HephWeapon",
    "ArmorIcon", "ZagreusArmor", "HephSword", "HephBow",
    "HephShield", "HephSpear", "EpicBonus_InRun" })
ResetKeywords()

local OlympusEnemySets = ModUtil.Entangled.ModData(EnemySets)
OlympusEnemySets.FriendlyEnemies = {
    "DefaultHero",
    "HeraMine",
    "HephaestusChariotSuicide",
    "HephaestusChariotSuicideElite"
}
--UIData
local OlympusTextFormats = ModUtil.Entangled.ModData(TextFormats)
OlympusTextFormats.HiddenFormat =
{
    Font = "AlegreyaSansExtraBold",
    FontSize = 0,
    Color = { 0, 0, 0, 0 },
    VerticalJustification = "Top",
    TextSymbolScale = 0.85,
    Graft = true,
}
-- WeaponSets
local OlympusWeaponSets = ModUtil.Entangled.ModData(WeaponSets)
OlympusWeaponSets.AllPrimaryWeapons = { "SwordWeapon",
	"SwordWeapon2", "SwordWeapon3", "SwordWeaponDash", "SwordWeaponWave", "SpearWeapon", "SpearWeapon2", "SpearWeapon3",
	"SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3",
	"SpearWeaponDash",  "ShieldWeapon", "ShieldWeaponRush",
	"ShieldWeaponDash", "BowWeapon", "BowWeaponDash", "ChargeBowWeapon1",
	"MaxChargeBowWeapon", "BowWeapon2", "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5",
	"FistWeaponDash", "GunWeapon",
	"GunWeaponDash", "SniperGunWeapon", "SniperGunWeaponDash"
}
OlympusWeaponSets.AllSecondaryWeapons = { "SwordParry", "SpearWeaponThrow", "SpearThrowImmolation",
	"SpearWeaponThrowReturn", "SpearWeaponThrowInvisibleReturn", "ShieldThrow",
	"ChaosShieldThrow", "ShieldThrowDash", "BowSplitShot", "FistWeaponSpecial",
	"FistWeaponSpecialDash", "FistWeaponLandAreaAttack", "GunGrenadeToss", "GunBombWeapon",
}
OlympusWeaponSets.AllJealousyWeapons = { "SwordWeapon",
	"SwordWeapon2", "SwordWeapon3", "SwordParry", "SwordWeaponDash", "SwordWeaponWave", "SpearWeapon", "SpearWeapon2", "SpearWeapon3",
	"SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3", "SpearWeaponThrow", "SpearThrowImmolation",
	"SpearWeaponDash", "SpearWeaponThrow", "SpearWeaponThrowReturn", "SpearWeaponThrowInvisibleReturn", "ShieldWeapon", "ShieldWeaponRush", "ShieldThrow",
	"ShieldWeaponDash", "ChaosShieldThrow", "ShieldThrow", "ShieldThrowDash", "BowWeapon", "BowSplitShot", "BowWeaponDash", "ChargeBowWeapon1",
	"MaxChargeBowWeapon", "BowWeapon2", "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5", "FistWeaponSpecial",
	"FistWeaponDash", "FistWeaponSpecialDash", "FistWeaponLandAreaAttack", "GunGrenadeToss", "GunBombWeapon", "GunWeapon",
	"GunWeaponDash", "SniperGunWeapon", "SniperGunWeaponDash"
}
OlympusWeaponSets.AssistWeapons = {
	"NPC_Thanatos_01_Assist",
	"NPC_FurySister_01_Assist",
	"NPC_Sisyphus_01_Assist",
	"NPC_Achilles_01_Assist",
	"NPC_Patroclus_01_Assist",
	"DusaFreezeShotSpray",
	"DusaFreezeShotSpread",
	"NPC_Goodboy_01_Assist",
}	
-- Verification Function
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

ModUtil.Path.Wrap("GetLootSourceName",
    function(baseFunc, traitName)
        for lootName, god in pairs(LootData) do
            if god == nil or traitName == nil or god.TraitIndex == nil then
                return false
            end
        end
        return baseFunc(traitName)
    end
)

ModUtil.Path.Wrap("SpecialHitPresentation",
    function(baseFunc, triggerArgs)
        --local attacker = triggerArgs.AttackerTable
        local unitId = triggerArgs.triggeredById
        local unit = triggerArgs.TriggeredByTable
        local offsetY = unit.HealthBarOffsetY or -155
        baseFunc(triggerArgs)
            local hasFinisherVulnerability = GetNumMetaUpgrades("LowHealthDamageMetaUpgrade") > 0
            if hasFinisherVulnerability and unit.Health/unit.MaxHealth < 0.25 then
                if CheckCooldown( "FinisherMessagePlayed", 0.1 ) then
                    thread( InCombatText, unitId, "FinisherHit", 0.3, {OffsetY = offsetY + 36, FontSize = 17, SkipFlash = true, SkipRise = true, SkipShadow = true, FadeDuration = 0.1 })
                end
            end
    end
)
-- Common Function for OE
ModUtil.Path.Wrap("CreateBoonLootButtons",
    function(baseFunc, lootData, reroll)
        if HeroHasTrait("ForceWeaponUpgradeTrait") then
            RerollCosts.Hammer = 1;
        else
            RerollCosts.Hammer = -1;
        end
        baseFunc(lootData, reroll)
		local components = ScreenAnchors.ChoiceScreen.Components
        local upgradeOptions = lootData.UpgradeOptions
		if upgradeOptions == nil then
			SetTraitsOnLoot( lootData )
			upgradeOptions = lootData.UpgradeOptions
		end
        if IsEmpty( upgradeOptions ) then
			table.insert(upgradeOptions, { ItemName = "FallbackMoneyDrop", Type = "Consumable", Rarity = "Common" })
		end
        local itemLocationY = 370
		local itemLocationX = ScreenCenterX - 355
		for itemIndex, itemData in ipairs( upgradeOptions ) do
			local purchaseButtonKey = "PurchaseButton"..itemIndex -- Doesnt work because eligible is not there yet...
            if  IsGameStateEligible(CurrentRun, TraitData[itemData.ItemName]) and CanReceivePomFirstTrait(CurrentRun.Hero, itemData.ItemName) then           
                CreateTextBox({ Id = components[purchaseButtonKey].Id,
                    Text = "UI_TraitLevel",
                    FontSize = 27,
                    OffsetX = 260, OffsetY = -55,
                    Color = Color.UpgradeGreen,
                    Font = "AlegreyaSansSCBold",
                    ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
                    Justification = "Left",
                    LuaKey = "TempTextData", LuaValue = { Amount = 2 }
                })
            end
            itemLocationY = itemLocationY + 220
        end
        if IsMetaUpgradeSelected( "RerollMetaUpgrade" ) and HeroHasTrait("ForceWeaponUpgradeTrait") and lootData.Name == "WeaponUpgrade" then
            local cost = -1
            if lootData.BlockReroll then
                cost = -1
            elseif lootData.Name == "WeaponUpgrade" then
                cost = RerollCosts.Hammer
            else
                cost = RerollCosts.Boon
            end
            local baseCost = cost
    
            local name = "RerollPanelMetaUpgrade_ShortTotal"
            local tooltip = "MetaUpgradeRerollHint"
            if cost >= 0 then
    
                local increment = 0
                if CurrentRun.CurrentRoom.SpentRerolls then
                    increment = CurrentRun.CurrentRoom.SpentRerolls[lootData.ObjectId] or 0
                end
                cost = cost + increment
            else
                name = "RerollPanel_Blocked"
                tooltip = "MetaUpgradeRerollBlockedHint"
            end
            local color = Color.White
            if CurrentRun.NumRerolls < cost or cost < 0 then
                color = Color.CostUnaffordable
            end
    
            if baseCost > 0 then
                components["RerollPanel"] = CreateScreenComponent({ Name = "ShopRerollButton", Scale = 1.0, Group = "Combat_Menu" })
                Attach({ Id = components["RerollPanel"].Id, DestinationId = components.ShopBackground.Id, OffsetX = 0, OffsetY = 410 })
                components["RerollPanel"].OnPressedFunctionName = "AttemptPanelReroll"
                components["RerollPanel"].RerollFunctionName = "RerollBoonLoot"
                components["RerollPanel"].RerollColor = lootData.LootColor
                components["RerollPanel"].RerollId = lootData.ObjectId
    
                components["RerollPanel"].Cost = cost
    
                CreateTextBox({ Id = components["RerollPanel"].Id, Text = name, OffsetX = 28, OffsetY = -5,
                ShadowColor = {0,0,0,1}, ShadowOffset={0,3}, OutlineThickness = 3, OutlineColor = {0,0,0,1},
                FontSize = 28, Color = color, Font = "AlegreyaSansSCExtraBold", LuaKey = "TempTextData", LuaValue = { Amount = cost }})
                SetInteractProperty({ DestinationId = components["RerollPanel"].Id, Property = "TooltipOffsetX", Value = 350 })
                CreateTextBox({ Id = components["RerollPanel"].Id, Text = tooltip, FontSize = 1, Color = Color.Transparent, Font = "AlegreyaSansSCExtraBold", LuaKey = "TempTextData", LuaValue = { Amount = cost }})
            end
        end
    end
)
ModUtil.Path.Wrap("UpdateHeroTraitDictionary",
		function(baseFunc)
			baseFunc()
			for k, traitData in pairs(CurrentRun.Hero.Traits) do
				if traitData.GodDamageBonus then
					traitData.AccumulatedGodDamageBonus = 1 + GetHeroSameGodCount(CurrentRun.Hero) * (traitData.GodDamageBonus - 1)
					--traitData.FromGod = name
					ExtractValues( CurrentRun.Hero, traitData, traitData )
				end
				if traitData.AccumulatedMaxArmor then
                    if CurrentRun.Hero.Armor ~= nil and CurrentRun.Hero.Armor.Max > 0 then
                        traitData.AccumulatedMaxArmor = CurrentRun.Hero.Armor.Max
                    end
					--traitData.FromGod = name
					ExtractValues( CurrentRun.Hero, traitData, traitData )
				end
			end
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
        -- This is for IgnoreOutgoingDamageModifiers to be boosted
        if attacker ~= nil and attacker.OutgoingDamageModifiers ~= nil and (weaponData ~= nil and weaponData.IgnoreOutgoingDamageModifiers) then
            local appliedEffectTable = {}
            for i, modifierData in pairs(attacker.OutgoingDamageModifiers) do
                if modifierData.GlobalMultiplier ~= nil then
                    addDamageMultiplier(modifierData, modifierData.GlobalMultiplier)
                end

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
        -- This is for additionnal damage modifier to be applied
        if attacker ~= nil and attacker.OutgoingDamageModifiers ~= nil and ( not weaponData or not weaponData.IgnoreOutgoingDamageModifiers ) then
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

                if validUniqueness and validWeapon and validEffect and validTrait and validEnchantment then
                    if modifierData.Name then
                        appliedEffectTable[modifierData.Name] = true
                    end
                    if modifierData.PerUniqueEpicMultiplier and attacker == CurrentRun.Hero then
                        addDamageMultiplier( modifierData, 1 + ( modifierData.PerUniqueEpicMultiplier - 1 ) * GetHeroEpicTraitCount( attacker ))
                    end
                    if modifierData.DistanceMultiplierWithSelfEffect and not IsEmpty(attacker.ActiveEffects) then
                        local hasAllEffects = true
                        for _, effectName in pairs( modifierData.DistanceEffects ) do
                            if not attacker.ActiveEffects[ effectName ] then
                                hasAllEffects = false
                            end
                        end
                        if hasAllEffects then
                            if modifierData.DistanceMultiplierWithSelfEffect and triggerArgs.DistanceSquared ~= nil and triggerArgs.DistanceSquared ~= -1 and ( modifierData.DistanceThreshold * modifierData.DistanceThreshold ) <= triggerArgs.DistanceSquared then
                                addDamageMultiplier( modifierData, modifierData.DistanceMultiplierWithSelfEffect)
                            end
                        end
                    end
                    if modifierData.ProximityMultiplierWithSelfEffect and not IsEmpty(attacker.ActiveEffects) then
                        local hasAllEffects = true
                        for _, effectName in pairs( modifierData.ProximityEffects ) do
                            if not attacker.ActiveEffects[ effectName ] then
                                hasAllEffects = false
                            end
                        end
                        if hasAllEffects then
                            if modifierData.ProximityMultiplierWithSelfEffect and triggerArgs.DistanceSquared ~= nil and triggerArgs.DistanceSquared ~= -1 and ( modifierData.ProximityThreshold * modifierData.ProximityThreshold ) >= triggerArgs.DistanceSquared then
                                addDamageMultiplier( modifierData, modifierData.ProximityMultiplierWithSelfEffect)
                            end
                        end
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
                triggerArgs.DamageAmount = TrackDamageWithTime(triggerArgs, victim, sourceProjectileData.Name,
                    sourceProjectileData
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
        if sourceWeaponData ~= nil and victim ~= nil and victim.DamageType == "Enemy" then            
            if ((HeroHasTrait("HephaestusWeaponTrait") or HeroHasTrait("HephaestusSecondaryTrait")) and (Contains(WeaponSets.AllPrimaryWeapons, sourceWeaponData.Name) or Contains(WeaponSets.AllSecondaryWeapons, sourceWeaponData.Name)) and CurrentRun.Hero.IgneousArmor ~= nil and CurrentRun.Hero.IgneousArmor.Charging and CurrentRun.Hero.IgneousArmor.DamageTransfer ~= nil) then           
                CurrentRun.Hero.IgneousArmor.Damage = CurrentRun.Hero.IgneousArmor.Damage + math.floor(triggerArgs.DamageAmount * CurrentRun.Hero.IgneousArmor.DamageTransfer)
                CreateAnimation({ Name = "HitSparkArmorFlash", DestinationId = victim.ObjectId, Group = "FX_Standing_Top" })      
            end
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
ModUtil.Path.Wrap("CheckOnHitPowers",
		function(baseFunc, victim, attacker, args)
            --Apollo Stuff
			local missRate = 0.4
			if HeroHasTrait("MissChanceTrait") then
				missRate = 0.6
			end
			-- Enemies misses
			if args and args.EffectName ~= "StyxPoison" and attacker and
				HasEffect({ Id = attacker.ObjectId, EffectName = "ApolloBlind" }) and victim.ObjectId == CurrentRun.Hero.ObjectId and
				attacker.ObjectId ~= CurrentRun.Hero.ObjectId and RandomFloat(0, 1) <= missRate then
				thread(InCombatText, CurrentRun.Hero.ObjectId, "Combat_Miss", 0.4, { SkipShadow = true })
				PlaySound({ Name = "/SFX/Player Sounds/HermesWhooshDodgeSFX", Id = CurrentRun.Hero.ObjectId })
				PlaySound({ Name = "/VO/ZagreusEmotes/EmoteDodgingAlt", Id = CurrentRun.Hero.ObjectId, Delay = 0.2 })
				if not HeroHasTrait("BlindDurationTrait") then
					ClearEffect({ Id = attacker.ObjectId, Name = "ApolloBlind" })
					BlockEffect({ Id = attacker.ObjectId, Name = "ApolloBlind", Duration = 4.0 })
					if HeroHasTrait("MasterBoltTrait") then
						ClearEffect({ Id = attacker.ObjectId, Name = "BlindLightning" })
					end
				end

				args.DamageAmount = nil
				args.AttackerWeaponData = nil
				args.IsInvulnerable = true
				-- Zagreus misses
			elseif attacker and HasEffect({ Id = attacker.ObjectId, EffectName = "ZagreusApolloBlind" }) and
				attacker.ObjectId == CurrentRun.Hero.ObjectId then
				thread(InCombatText, CurrentRun.Hero.ObjectId, "Combat_Blinded", 1.0, { SkipShadow = true, Cooldown = 0.7 })
				args.DamageAmount = nil
				args.AttackerWeaponData = nil
				--args.IsInvulnerable = true
			else
                -- Hephaestus RevengeBoostTrait
                if attacker ~= nil and not Contains(OlympusEnemySets.FriendlyEnemies, attacker.Name) and victim == CurrentRun.Hero and HeroHasTrait("RevengeBoostTrait") then
                    ApplyEffectFromWeapon({ Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId,
						WeaponName = "RevengeBoostApplicator", EffectName = "RevengeBoostSpeed" })
                    ApplyEffectFromWeapon({ Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId,
						WeaponName = "RevengeBoostApplicator", EffectName = "RevengeBoostDamage" })
                end
				baseFunc(victim, attacker, args)
			end
		end
	)
ModUtil.Path.Wrap("HandleDeath",
    function(baseFunc, currentRun, killer, killingUnitWeapon)
        if currentRun.Hero.Armor ~= nil then
            currentRun.Hero.Armor = nil
        end
        baseFunc(currentRun, killer, killingUnitWeapon)
    end
)
ModUtil.Path.Wrap("Kill",
    function(baseFunc, victim, triggerArgs)
        -- Apollo Drop Healing
        if HeroHasTrait("ApolloHealTrait") and HasEffect({ Id = victim.ObjectId, EffectName = "ApolloBlind" }) then
            victim.HealDropOnDeath = {
                Name = "HealDropMinor",
                Radius = 50,
                Chance = GetTotalHeroTraitValue("ApolloHealDropChance")
            }
        end
        baseFunc(victim, triggerArgs)
        if victim.IsDead then
            -- Already killed
            return
        end
    
        if CurrentRun.Hero.HandlingDeath then
            -- No one can be killed after the hero dies, they can only be cleaned up directly
            return
        end
    end
)
ModUtil.Path.Wrap("KillEnemy",
function(baseFunc, victim, triggerArgs)
    if HeroHasTrait("SpawnWeaponsTrait") and victim ~= nil and victim.DamageType == "Enemy" then
        local chance = GetTotalHeroTraitValue("SpawnHephWeaponOnDeath")
        if RandomChance(chance) then
            DropHephWeapon(victim.ObjectId, 130, 0, false)
        end
    end
    baseFunc(victim, triggerArgs)
    local killer = triggerArgs.AttackerTable
    local killingWeapon = triggerArgs.SourceWeapon
    if not victim.SkipModifiers and killer ~= nil and killer == CurrentRun.Hero then
        for i, data in pairs(GetHeroTraitValues("OnEnemyDeathFunctionArgs")) do
            if data.Name and _G[data.Name] then
                _G[data.Name](triggerArgs, data.Args)
            end
        end
    end
end)
OnEffectDelayedKnockbackForce{
	function( triggerArgs )
		if triggerArgs.EffectName == "SecondDelayedKnockback" then
			PoseidonLegendaryPresentation( triggerArgs )
		end
	end
}
function DropHephWeapon(targetId, radius, angle, dropTowardHero)
	if targetId == nil then
		targetId = CurrentRun.Hero.ObjectId
	end
    local HephChoices = {
        "SwordHephWeaponDrop",
        "BowHephWeaponDrop",
        "ShieldHephWeaponDrop",
        "SpearHephWeaponDrop"
    }
    local objectName = GetRandomValue(HephChoices)
    if targetId == nil then
        targetId = CurrentRun.Hero.ObjectId
    end
    if CurrentRun.CurrentRoom.HephWeapons == nil then
        CurrentRun.CurrentRoom.HephWeapons = {}
    end
    local offset = CalcOffset( angle or RandomFloat( 0, 360 ), radius or 5 )
    local healDropId = SpawnObstacle({ Name = objectName, DestinationId = targetId, OffsetX = offset.X, OffsetY = offset.Y, Group = "Standing" })
    local consumableData = ConsumableData[objectName]
    local consumable = GetRampedConsumableData( consumableData )
    consumable.ObjectId = healDropId
    table.insert(CurrentRun.CurrentRoom.HephWeapons, consumable)
    consumable.Cost = 0
    AddToGroup({ Id = healDropId, Name = "ConsumableItems" })
    AttachLua({ Id = healDropId, Table = consumable })
    ApplyUpwardForce({ Id = healDropId, Speed = RandomFloat( 500, 700 ) })
    if not dropTowardHero then
        ApplyForce({ Id = healDropId, Speed = RandomFloat( 75, 260 ), Angle = RandomFloat( 0, 360 ) })
    else
        local forceAngle = GetAngleBetween({ Id = healDropId, DestinationId = CurrentRun.Hero.ObjectId })
        ApplyForce({ Id = healDropId, Speed = 100, Angle = forceAngle, SelfApplied = true })
    end
    --PlaySound({ Name = "/Leftovers/Menu Sounds/CoinFlash", Id = healDropId })
	--PlaySound({ Name = "/Leftovers/Menu Sounds/CoinFlash", Id = targetId })
end
ModUtil.Path.Wrap("CheckLastStand",
    function(baseFunc, victim, triggerArgs)
        local hasLastStand = baseFunc(victim, triggerArgs)
        -- LastStand Hestia functions
        if HeroHasTrait("HealthDefianceTrait") and hasLastStand then
            AddMaxHealth(GetTotalHeroTraitValue("DefianceExtraHealth"), "HealthDefianceTrait",
                { Delay = 0.01, NoHealing = true, Thread = true })
        end
        if HeroHasTrait("ArmorDefianceTrait") and CurrentRun.Hero.Armor ~= nil and hasLastStand then
            local armorToAdd = CurrentRun.Hero.Armor.Max*GetTotalHeroTraitValue("RepairArmorOnDeathDefiancePercent")
            RepairArmor(armorToAdd)
            thread(RepairArmorPresentation)
        end
        return hasLastStand
    end
)

ModUtil.Path.Wrap("CheckOnDamagedPowers",
    function(baseFunc, victim, attacker, args)
        baseFunc(victim, attacker, args)
        --Apollo-Zeus Duo extra function
        local weaponName = args.SourceWeapon
        if args ~= nil and attacker ~= nil and attacker.ObjectId == CurrentRun.Hero.ObjectId and
            HeroHasTrait("ZeusChargedBoltTrait") and args.FirstInVolley then
            if Contains({ "BlindLightningEffector" }, weaponName) then
                FireWeaponFromUnit({ Weapon = "ZeusLegendaryWeapon", AutoEquip = true, Id = attacker.ObjectId,
                    DestinationId = victim.ObjectId, FireFromTarget = true })
            end
        end
        if args ~= nil and attacker ~= nil and attacker.ObjectId == CurrentRun.Hero.ObjectId and HeroHasTrait("HephaestusImproveZeus") and args.FirstInVolley then
            if Contains({ "ZeusShieldLoadAmmoStrike", "LightningStrikeRetaliate", "ChainLightning", "LightningStrikeX", "LightningDash", "LightningStrikeSecondary", "ZeusAmmoWeapon", "ZeusDionysusCloudStrike", "LightningStrikeImpact", "BlindLightningEffector" }, weaponName ) or ( weaponName == "RangedWeapon" and HeroHasTrait("ZeusRangedTrait")) then
                FireWeaponFromUnit({ Weapon = "ZeusLegendaryWeapon", AutoEquip = true, Id = attacker.ObjectId, DestinationId = victim.ObjectId, FireFromTarget = true })
            end
        end
    end
)
ModUtil.Path.Wrap("ChooseRoomReward",
		function(baseFunc, run, room, rewardStoreName, previouslyChosenRewards, args )
            if args == nil then
                args = {}
            end
            if room.ForcedReward == nil then
                for k, trait in pairs( CurrentRun.Hero.Traits ) do -- Missing if eligible.
                    if trait.ForceRewardName and trait.Uses > 0 then
                        trait.Uses = trait.Uses - 1
                        room.ForcedReward = trait.ForceRewardName
                    end
                end
            end
			return baseFunc(run, room, rewardStoreName, previouslyChosenRewards, args )            
		end
	)
-- Rejection / Forgiveness Functions
ModUtil.Path.Wrap("SpawnRoomReward",
    function(baseFunc, eventSource, args) 
        local currentRun = CurrentRun
        local currentRoom = CurrentRun.CurrentRoom
        local currentEncounter = CurrentRun.CurrentRoom.Encounter
        if currentRoom.ChangeReward == "HephaestusUpgrade" or currentRoom.ChosenRewardType == "HephaestusUpgrade" then
            --currentRoom.ChosenRewardType = "HermesUpgrade"
            local rewardType = "HephaestusUpgrade"

            if rewardType == nil or rewardType == "Story" or currentRoom.DeferReward then
                if args ~= nil and args.VoiceLines ~= nil then
                    thread( PlayVoiceLines, args.VoiceLines, true )
                end
                return
            end

            if currentRoom.SpawnRewardGlobalVoiceLines ~= nil then
                thread( PlayVoiceLines, GlobalVoiceLines[currentRoom.SpawnRewardGlobalVoiceLines], true )
            end

            local offsetTowardId = SelectRoomRewardSpawnPoint( CurrentRun.CurrentRoom )
            local lootPointId = currentRoom.SpawnRewardOnId or currentRun.Hero.ObjectId
            local angle = 0
            local lootOffset = {X=0, Y=0}

            local reward = nil

            if currentRoom.SpawnRewardOnId == nil then
                angle = GetAngleBetween({ Id = currentRun.Hero.ObjectId, DestinationId = offsetTowardId })
                lootOffset = CalcOffset( math.rad(angle), 110 )
            end

            wait( currentRoom.SpawnRewardDelay, RoomThreadName )

            reward = GiveLoot({ ForceLootName = "HephaestusUpgrade", SpawnPoint = lootPointId, OffsetX = lootOffset.X, OffsetY = lootOffset.Y, SuppressSpawnSounds = currentRoom.SuppressRewardSpawnSounds })

            local rewardOverrides = currentRoom.BoonRaritiesOverride or currentRoom.RewardConsumableOverrides or currentRoom.RewardOverrides or {}
            local rewardBoostedAnimation = rewardOverrides.RewardBoostedAnimation or currentEncounter.RewardBoostedAnimation or currentRoom.RewardBoostedAnimation
            if currentRoom.ChangeReward == nil and rewardBoostedAnimation ~= nil then
                CreateAnimation({ DestinationId = reward.ObjectId, Name = rewardBoostedAnimation })
            end

            if currentRoom.DisableRewardMagnetisim then
                SetObstacleProperty({ Property = "MagnetismWhileBlocked", Value = 0, DestinationId = reward.ObjectId })
            end

            if args ~= nil and args.VoiceLines ~= nil then
                thread( PlayVoiceLines, args.VoiceLines, true )
            end

            if args ~= nil and args.WaitUntilPickup then
                if reward.MenuNotify ~= nil then
                    waitUntil( UIData.BoonMenuId )
                else
                    reward.NotifyName = "OnUsed"..reward.ObjectId
                    waitUntil( reward.NotifyName )
                end
            end
            currentRoom.RewardSkip = true

        end
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
-- Aura Functions
function SetupAura(args)
    thread( AuraThread, args )
end
function AuraThread(args)
    --local PreviousCloseEnemiesList = {}
    if HeroHasTrait("AuraRuptureTrait") then
        StopAnimation({ Name = "AuraFx-Rupture", DestinationId = CurrentRun.Hero.ObjectId })
        CreateAnimation({ Name = "AuraFx-Rupture", DestinationId = CurrentRun.Hero.ObjectId })			
    end
    if HeroHasTrait("StatusOverTimeTrait") then
        StopAnimation({ Name = "AuraFx-Legendary", DestinationId = CurrentRun.Hero.ObjectId })
        CreateAnimation({ Name = "AuraFx-Legendary", DestinationId = CurrentRun.Hero.ObjectId })			
    end
    if HeroHasTrait("AuraExposedTrait") then
        StopAnimation({ Name = "AuraFx-Exposed", DestinationId = CurrentRun.Hero.ObjectId })
        CreateAnimation({ Name = "AuraFx-Exposed", DestinationId = CurrentRun.Hero.ObjectId })			
    end
    if HeroHasTrait("AuraBlindTrait") then
        StopAnimation({ Name = "AuraFx-Blind", DestinationId = CurrentRun.Hero.ObjectId })
        CreateAnimation({ Name = "AuraFx-Blind", DestinationId = CurrentRun.Hero.ObjectId })			
    end
    while CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead do
        wait(0.2, "RoomThread") -- 0.2
        if CurrentRun and CurrentRun.Hero and not CurrentRun.Hero.IsDead and IsCombatEncounterActive( CurrentRun ) and not IsEmpty( RequiredKillEnemies ) then
            local enemyLocation = { 0, 0 }
            local heroLocation = GetLocation({ Id = CurrentRun.Hero.ObjectId })
            for enemyId, enemy in pairs(RequiredKillEnemies) do
                enemyLocation = GetLocation({ Id = enemy.ObjectId })
                local distanceSquared = math.sqrt((enemyLocation.X - heroLocation.X) ^ 2 +
                    (enemyLocation.Y - heroLocation.Y) ^ 2)
                if distanceSquared <= 200 and HeroHasTrait("AuraRuptureTrait") then
                    ApplyEffectFromWeapon({ WeaponName = "RuptureCurseApplicator", EffectName = "DamageOverDistance", Id = CurrentRun.Hero.ObjectId, DestinationId = enemy.ObjectId })
                end
                if distanceSquared <= 300 and HeroHasTrait("StatusOverTimeTrait") and enemy.VulnerabilityEffects and (enemy.VulnerabilityEffects["EnvyCurseAttack"] or enemy.VulnerabilityEffects["EnvyCurseSecondary"] or enemy.VulnerabilityEffects["JealousyCurse"]) then
                    ApplyEffectFromWeapon({ WeaponName = "DecayCurseApplicator", EffectName = "HeraDecay", Id = CurrentRun.Hero.ObjectId, DestinationId = enemy.ObjectId })
                end
                if distanceSquared <= 400 and HeroHasTrait("AuraExposedTrait") then
                    ApplyEffectFromWeapon({ WeaponName = "ExposedCurseApplicator", EffectName = "AthenaBackstabVulnerability", Id = CurrentRun.Hero.ObjectId, DestinationId = enemy.ObjectId })
                end
                if distanceSquared <= 500 and HeroHasTrait("AuraBlindTrait") then
                    ApplyEffectFromWeapon({ WeaponName = "BlindCurseApplicator", EffectName = "ApolloBlind", Id = CurrentRun.Hero.ObjectId, DestinationId = enemy.ObjectId })
                end
            end	
        end
    end
end
-- HealthAsObolTrait Mechanic
OnControlPressed{ "Gift",
function( triggerArgs )
    local target = triggerArgs.UseTarget
    if target == nil then
        return
    end
    if target.FountainReroll and IsMetaUpgradeSelected( "RerollPomMetaUpgrade" ) then
        ModUtil.Hades.PrintStackChunks(ModUtil.ToString("FountainReroll"))
        AttemptPomReroll( CurrentRun, target )
    end
    if target.SacrificeCost then
        if target.Rarity then
            local interactionBlocked = false
            if not CurrentRun.CurrentRoom.AlwaysAllowLootInteraction then
                for enemyId, enemy in pairs( ActiveEnemies ) do
                    if enemy.BlocksLootInteraction then
                        interactionBlocked = true
                        break
                        --DebugPrint({ Text = "blockedByEnemy = "..GetTableString( nil, enemy ) })
                    end
                end
            end

            if interactionBlocked then
                local userTable = triggerArgs.TriggeredByTable
                thread( CannotUseLootPresentation, triggerArgs.triggeredById, userTable )
                CreateAnimation({ Name = "ShoutFlare", DestinationId = triggerArgs.triggeredById })
            elseif not AreScreensActive() then		
                if target.SacrificeCost ~= nil and CurrentRun.Hero.Health < target.SacrificeCost then
                    CantAffordPresentation( target )
                    return
                end
                if target.SacrificeCost ~= nil and target.SacrificeCost > 0 then
                    target.Purchased = true
                    SacrificeHealth({ SacrificeHealth = target.SacrificeCost, MinHealth = 1 })
                    RemoveStoreItem({Name = target.Name, IsBoon = true, BoonRaritiesOverride = target.BoonRaritiesOverride, StackNum = target.StackNum })
                    PlaySound({ Name = "/Leftovers/Menu Sounds/StoreBuyingItem" })
                    thread( PlayVoiceLines, GlobalVoiceLines.PurchasedConsumableVoiceLines, true )
                end

                if target.RarityBoosted then
                    UseHeroTraitsWithValue("RarityBonus", true )
                end
                
                SetPlayerInvulnerable( "HandleLootPickupAnimation" )
                PlayInteractAnimation( triggerArgs.triggeredById )
                HandleLootPickup( CurrentRun, target )
                SetPlayerVulnerable( "HandleLootPickupAnimation" )
            end
        else
            if CurrentRun.Hero.HandlingDeath then
                return
            end
    
            if target.SacrificeCost ~= nil and CurrentRun.Hero.Health < (target.SacrificeCost+1) then
                CantAffordPresentation( target )
                return
            end
            if target.SacrificeCost ~= nil and target.SacrificeCost > 0 and target.PurchaseRequirements ~= nil and not IsGameStateEligible( CurrentRun, target.PurchaseRequirements ) then
                CantPurchaseWorldItemPresentation( target )
                return
            end
            target.UseSacrifice = true
            PurchaseConsumableItem( CurrentRun, target, triggerArgs )
        end
    end
end
}
ModUtil.Path.Wrap("HandleLootPickup",
    function(baseFunc, currentRun, loot)
        local times = 0
		if not (loot.Name == "StackUpgrade") and not (loot.Name == "WeaponUpgrade") and HeroHasTrait("RerollBoonTrait") then
			CurrentRun.RerollBoonTracker = CurrentRun.RerollBoonTracker + 1
			local count = GetTotalHeroTraitValue("BoonCount")
			times = math.floor(CurrentRun.RerollBoonTracker / count);
			if (times > 0) then
				CurrentRun.RerollBoonTracker = CurrentRun.RerollBoonTracker - (times * count)
			end
		end
        local hasImproveBoon = false
        if loot.UpgradeOptions ~= nil then
            for i, itemData in pairs(loot.UpgradeOptions) do
                if itemData.Type == "Trait" and TraitData[itemData.ItemName] and TraitData[itemData.ItemName].IsImproveBoon then
                    hasImproveBoon = true
                    loot.Skip = true
                end
            end
        end
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

            -- SKIP TALKING Unless it's HadImproveConversation
            if hasImproveBoon and not currentRun.HadImproveConversation then
                currentRun.HadImproveConversation = PlayRandomRemainingTextLinesOnceThisRun( loot, loot.ImprovePickupTextLineSets )
            end

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
            if loot.SacrificeId then
				Destroy({ Id = loot.SacrificeId })
			end
            baseFunc(currentRun, loot)
        end
        if (times > 0) then
            AddRerolls(times, "RerollTrait", { Thread = false, Delay = 0.5 })
        end
    end
)
ModUtil.Path.Wrap( "Damage", 
	function (baseFunc, victim, triggerArgs )
		if victim == nil or victim.Health == nil or ( victim.IsDead and not triggerArgs.PureDamage ) then
			return
		end
        if triggerArgs ~= nil and triggerArgs.AttackerTable ~= nil and triggerArgs.SourceWeapon ~= nil then
            local sourceWeaponData = GetWeaponData( triggerArgs.AttackerTable, triggerArgs.SourceWeapon )
            if sourceWeaponData ~= nil and sourceWeaponData.PureDamage and not triggerArgs.PureDamage then
                triggerArgs.PureDamage = true
            end				
        end
        local attacker = triggerArgs.AttackerTable
		if victim == CurrentRun.Hero and victim.Armor ~= nil and victim.Armor.Amount > 0 and not triggerArgs.SkipArmor and not triggerArgs.PureDamage then
            -- Start Damage Calculation     
            if not triggerArgs.PureDamage then
                if triggerArgs.IsInvulnerable or (victim.InvulnerableFlags ~= nil and not IsEmpty( victim.InvulnerableFlags )) or (victim.PersistentInvulnerableFlags ~= nil and not IsEmpty( victim.PersistentInvulnerableFlags )) then
                    if not triggerArgs.Silent then
                        thread( BlockedDamageInvulnerablePresentation, victim, triggerArgs )
                    end
                    return
                end
        
                local attacker = triggerArgs.AttackerTable
                local sourceProjectileData = nil
                local sourceEffectData = nil
                local sourceWeaponData = GetWeaponData( attacker, triggerArgs.SourceWeapon )
                if triggerArgs.SourceProjectile ~= nil then
                    sourceProjectileData = ProjectileData[triggerArgs.SourceProjectile]
                end
                if triggerArgs.EffectName ~= nil then
                    sourceEffectData = EffectData[triggerArgs.EffectName]
                end
                local baseDamage = triggerArgs.DamageAmount
                local multipliers = CalculateDamageMultipliers( attacker, victim, sourceWeaponData, triggerArgs )
                local additive = CalculateDamageAdditions( attacker, victim, triggerArgs )
                triggerArgs.DamageAmount = round(triggerArgs.DamageAmount * multipliers) + additive
                CalculateLifestealModifiers( attacker, victim, sourceWeaponData, triggerArgs )
        
                if victim.AIEndHealthThreshold ~= nil then
                    local healthThreshold = victim.MaxHealth * victim.AIEndHealthThreshold
                    local remainingThresholdHealth = (victim.Health - healthThreshold) + 1
                    if triggerArgs.DamageAmount > remainingThresholdHealth then
                        triggerArgs.DamageAmount = remainingThresholdHealth
                    end
                end
        
                if ConfigOptionCache.EasyMode and victim == CurrentRun.Hero then
                    triggerArgs.DamageAmount = math.ceil( triggerArgs.DamageAmount * CalcEasyModeMultiplier() )
                    if CurrentRun.EasyModeLevel == nil then
                        CurrentRun.EasyModeLevel = GameState.EasyModeLevel
                    end
                end
        
                if triggerArgs.DamageAmount > 0 and not triggerArgs.Silent and (sourceEffectData == nil or not sourceEffectData.RapidDamageType ) and ( sourceWeaponData == nil or not sourceWeaponData.RapidDamageType ) then
                    if victim.DamagedAnimation ~= nil then
                        local damagedAnimBlocked = false
                        if victim.ActiveEffects ~= nil then
                            for effectName, v in pairs( victim.ActiveEffects ) do
                                local effectData = EffectData[effectName]
                                if effectData ~= nil and effectData.BlockDamageAnimation then
                                    damagedAnimBlocked = true
                                end
                            end
                        end
                        if not damagedAnimBlocked then
                            SetAnimation({ DestinationId = victim.ObjectId, Name = victim.DamagedAnimation })
                        end
                    end
                    --thread( GenericDamagePresentation, victim, triggerArgs )
                    CreateAnimation({ DestinationId = victim.ObjectId, Name = "IgneousHitSparkArmorA", OffsetZ = triggerArgs.ImpactLocationZ })
                
                end
            end
            -- Custom Damage for Armor          
			victim.Armor.Amount = victim.Armor.Amount - triggerArgs.DamageAmount
			if victim.Armor.Amount < 0 then
				victim.Armor.Amount = 0
			end
			triggerArgs.DamageAmount = 0
			DamageHero( victim, triggerArgs )
			InvalidateCheckpoint()
			if victim.Armor.Amount <= 0 then
				ArmorDepletedPresentation()
			end
            -- Continue Damage            
            if BlockHeroDeath and victim == CurrentRun.Hero then
                victim.CannotDieFromDamage = true
            end

            if victim.Health <= 0 and not victim.CannotDieFromDamage then
                if victim.ClearChillOnDeath then
                    ClearEffect({ Id = victim.ObjectId, Name = "DemeterSlow" })
                end
                if victim.Phases ~= nil and victim.CurrentPhase < victim.Phases then
                    SetUnitInvulnerable( victim )
                    ClearEffect({ Id = victim.ObjectId, All = true, ExcludeNames = { "BeamRotation" } })
                    return
                end
                triggerArgs.Killed = true
                if victim.DeathAnimation ~= nil and not victim.ManualDeathAnimation then
                    SetAnimation({ Name = victim.DeathAnimation, DestinationId = victim.ObjectId })
                    -- @todo Notify on death animation finish
                end

                if victim.PreDeathFunctionName ~= nil then
                    local onDeathFunction = _G[victim.PreDeathFunctionName]
                    onDeathFunction( victim, victim.PreDeathFunctionArgs )
                end
                Kill( victim, triggerArgs )
            end
		else
			baseFunc(victim, triggerArgs)
			if victim == CurrentRun.Hero and HeroHasTrait("HealthAsObolTrait") then
				UpdateHealthCostTexts()
				if CurrentRun.CurrentRoom.Store ~= nil and CurrentRun.CurrentRoom.Store.Buttons then
					for i, button in pairs(CurrentRun.CurrentRoom.Store.Buttons) do
						UpdateSacrificeCostButton( button )
					end
				end
			end
		end
        if HeroHasTrait("DamageReturnTrait") and victim == CurrentRun.Hero and attacker ~= nil and triggerArgs.DamageAmount > 0 then
            local revengeDamage = GetTotalHeroTraitValue("RevengeDamage")
            if revengeDamage > 0 then
                Damage( attacker, { EffectName = "DamageBackEffect", DamageAmount = triggerArgs.DamageAmount*revengeDamage, Silent = false, PureDamage = false } )
            end           
        end
        if HeroHasTrait("HephaestusTrapTrait") and (( attacker ~= nil and attacker.DamageType == "Neutral" ) or (attacker == nil and triggerArgs.AttackerName ~= nil and EnemyData[triggerArgs.AttackerName] ~= nil and EnemyData[triggerArgs.AttackerName].DamageType == "Neutral" )) then
            FireWeaponFromUnit({
                Weapon = "IgneousTrapExplosion",
                Id = CurrentRun.Hero.ObjectId,
                DestinationId = victim.ObjectId,
                ClearAllFireRequests = true,
                FireFromTarget = true
            })
        end
	end
)

ModUtil.Path.Override("HarvestBoons",
	function(args)
        numTraits = args.NumTraits
        local traitRarity = "Common"
        local traitDictionary = {}
        local upgradableTraits = {}
        local upgradedTraits = {}
        for i, traitData in pairs( CurrentRun.Hero.Traits ) do
            if not traitDictionary[traitData.Name] and IsGodTrait(traitData.Name) and TraitData[traitData.Name] and traitData.Rarity ~= nil and GetUpgradedRarity(traitData.Rarity) ~= nil and traitData.RarityLevels[GetUpgradedRarity(traitData.Rarity)] ~= nil then
                table.insert(upgradableTraits, traitData )
                traitDictionary[traitData.Name] = true
            end
        end
        
        local harvestTraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = "HarvestBoonTrait", Rarity = traitRarity })

        harvestTraitData.HarvestBoons = {}

        while numTraits > 0 and not IsEmpty( upgradableTraits ) do
            local traitData = RemoveRandomValue( upgradableTraits )
            local persistentKeys = { "AccumulatedFountainDamageBonus", "AccumulatedFountainDefenseBonus", "AccumulatedHealthDamageBonus" }
            local persistentValues = {}
            for i, key in pairs( persistentKeys ) do
                persistentValues[key] = traitData[key]
            end

            upgradedTraits[traitData.Name] = true
            table.insert( harvestTraitData.HarvestBoons, traitData.Name )
            local numOldTrait = GetTraitNameCount( CurrentRun.Hero, traitData.Name )
            RemoveWeaponTrait( traitData.Name )

            local processedData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitData.Name, Rarity = "Common" }) 
            for i, key in pairs( persistentKeys ) do
                processedData[key] = persistentValues[key]
            end
            AddTraitToHero({ TraitData = processedData })

            for i=1, numOldTrait-1 do
                AddTraitToHero({ TraitName = traitData.Name })
            end
            numTraits = numTraits - 1
        end

        
        harvestTraitData.TraitListTextString = "HarvestBoonTraitList"..tostring(TableLength(harvestTraitData.HarvestBoons))
        thread( HarvestBoonTraitPresentation, upgradedTraits, 2.0 )
        AddTraitToHero({TraitData = harvestTraitData })
    end
)
ModUtil.Path.Override("UpgradeHarvestBoon",
	function()
        local upgradableTraitNames = {}
        local upgradableTraits = {}
        local upgradedTraits = {}
        for i, trait in pairs( CurrentRun.Hero.Traits ) do
            if trait.HarvestBoons then
                if trait.CurrentRoom then
                    trait.CurrentRoom = trait.CurrentRoom + 1
                end
                if trait.RoomsPerUpgrade and trait.CurrentRoom < trait.RoomsPerUpgrade then
                    return
                else
                    trait.CurrentRoom = 0
                end
            end
        end

        for i, value in pairs(GetHeroTraitValues("HarvestBoons")) do
            for s, boonName in pairs(value) do
                upgradableTraitNames[boonName] = true
            end
        end
        
        for i, traitData in pairs( CurrentRun.Hero.Traits ) do
            if upgradableTraitNames[traitData.Name] and TraitData[traitData.Name] and traitData.Rarity ~= nil and GetUpgradedRarity(traitData.Rarity) ~= nil and traitData.RarityLevels[GetUpgradedRarity(traitData.Rarity)] ~= nil then
                table.insert(upgradableTraits, traitData )
            end
        end
        if not IsEmpty(upgradableTraits) then
            while not IsEmpty( upgradableTraits ) do
                local traitData = RemoveRandomValue( upgradableTraits )
                local persistentKeys = { "AccumulatedFountainDamageBonus", "AccumulatedFountainDefenseBonus", "AccumulatedHealthDamageBonus" }
                local persistentValues = {}
                for i, key in pairs( persistentKeys ) do
                    persistentValues[key] = traitData[key]
                end

                upgradedTraits[GetTraitTooltipTitle(traitData)] = true
                local numOldTrait = GetTraitNameCount( CurrentRun.Hero, traitData.Name )
                RemoveWeaponTrait( traitData.Name )
                
                local processedData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitData.Name, Rarity = GetUpgradedRarity(traitData.Rarity) }) 
                for i, key in pairs( persistentKeys ) do
                    processedData[key] = persistentValues[key]
                end
                AddTraitToHero({ TraitData = processedData })

                for i=1, numOldTrait-1 do
                    AddTraitToHero({ TraitName = traitData.Name })
                end
            end

            thread( IncreasedTraitRarityPresentation, upgradedTraits, 2.0 )
        end
        
        for itemId, item in pairs( LootObjects ) do
            item.UpgradeOptions = nil
        end
    end
)
ModUtil.Path.Override("AddRarityToTraits",
	function(source, args)
        local numTraits = args.NumTraits
        local upgradableTraits = {}
        local upgradedTraits = {}
        for i, traitData in pairs( CurrentRun.Hero.Traits ) do
            if IsGodTrait(traitData.Name, { ForShop = true }) and TraitData[traitData.Name] and traitData.Rarity ~= nil and GetUpgradedRarity(traitData.Rarity) ~= nil and traitData.RarityLevels[GetUpgradedRarity(traitData.Rarity)] ~= nil then
                table.insert(upgradableTraits, traitData )
            end
        end

        while numTraits > 0 and not IsEmpty( upgradableTraits ) do
            local traitData = RemoveRandomValue( upgradableTraits )
            local persistentKeys = { "AccumulatedFountainDamageBonus", "AccumulatedFountainDefenseBonus", "AccumulatedHealthDamageBonus" }
            local persistentValues = {}
            for i, key in pairs( persistentKeys ) do
                persistentValues[key] = traitData[key]
            end

            upgradedTraits[GetTraitTooltipTitle(traitData)] = true
            local numOldTrait = GetTraitNameCount( CurrentRun.Hero, traitData.Name )
            RemoveWeaponTrait( traitData.Name )
            local processedData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitData.Name, Rarity = GetUpgradedRarity(traitData.Rarity) }) 
            for i, key in pairs( persistentKeys ) do
                processedData[key] = persistentValues[key]
            end
            AddTraitToHero({ TraitData = processedData })
            for i=1, numOldTrait-1 do
                AddTraitToHero({ TraitName = traitData.Name })
            end
            numTraits = numTraits - 1
        end

        thread( IncreasedTraitRarityPresentation, upgradedTraits )
    end
)
ModUtil.Path.Override("SpawnStoreItemInWorld",
		function(itemData, kitId)
			local spawnedItem = nil
			if itemData.Name == "StackUpgradeDrop" then
				spawnedItem = CreateStackLoot({ SpawnPoint = kitId, Cost = GetProcessedValue( ConsumableData.StackUpgradeDrop.Cost ), DoesNotBlockExit = true, SuppressSpawnSounds = true, } )
			elseif itemData.Name == "WeaponUpgradeDrop" then
				spawnedItem = CreateWeaponLoot({ SpawnPoint = kitId, Cost = itemData.Cost or GetProcessedValue( ConsumableData.WeaponUpgradeDrop.Cost ), DoesNotBlockExit = true, SuppressSpawnSounds = true, } )
			elseif itemData.Name =="HermesUpgradeDrop" then
                
				spawnedItem = CreateHermesLoot({ SpawnPoint = kitId, Cost = itemData.Cost or GetProcessedValue( ConsumableData.HermesUpgradeDrop.Cost ), DoesNotBlockExit = true, SuppressSpawnSounds = true, BoughtFromShop = true, AddBoostedAnimation = itemData.AddBoostedAnimation, BoonRaritiesOverride = itemData.BoonRaritiesOverride })
				spawnedItem.CanReceiveGift = false
				SetThingProperty({ Property = "SortBoundsScale", Value = 1.0, DestinationId = spawnedItem.ObjectId })
            elseif itemData.Name =="HephaestusUpgradeDrop" then
				spawnedItem = CreateHephaestusLoot({ SpawnPoint = kitId, Cost = itemData.Cost or GetProcessedValue( ConsumableData.HephaestusUpgradeDrop.Cost ), DoesNotBlockExit = true, SuppressSpawnSounds = true, BoughtFromShop = true, AddBoostedAnimation = itemData.AddBoostedAnimation, BoonRaritiesOverride = itemData.BoonRaritiesOverride })
				spawnedItem.CanReceiveGift = false
				SetThingProperty({ Property = "SortBoundsScale", Value = 1.0, DestinationId = spawnedItem.ObjectId })
			elseif itemData.Name == "StoreTrialUpgradeDrop" then
				local args  = { BoughtFromShop = true, DoesNotBlockExit = true, Cost = GetProcessedValue( ConsumableData.StoreTrialUpgradeDrop.Cost ) }
				args.SpawnPoint = kitId
				args.DoesNotBlockExit = true
				args.SuppressSpawnSounds = true
				args.Name = "TrialUpgrade"
				spawnedItem = GiveLoot( args )
				spawnedItem.CanReceiveGift = false
				SetThingProperty({ Property = "SortBoundsScale", Value = 1.0, DestinationId = spawnedItem.ObjectId })
			elseif itemData.Name == "StackUpgradeDropRare" then
				spawnedItem = CreateStackLoot({ SpawnPoint = kitId, Cost = GetProcessedValue( ConsumableData.StackUpgradeDropRare.Cost ), DoesNotBlockExit = true, SuppressSpawnSounds = true, StackNum = 2, AddBoostedAnimation = true, })
			elseif itemData.Type == "Consumable" then
				local consumablePoint = SpawnObstacle({ Name = itemData.Name, DestinationId = kitId, Group = "Standing" })
                if ConsumableData[itemData.Name] ~= nil then
                    local upgradeData =  GetRampedConsumableData( ConsumableData[itemData.Name] )
                    spawnedItem = CreateConsumableItemFromData( consumablePoint, upgradeData )
                    ApplyConsumableItemResourceMultiplier( CurrentRun.CurrentRoom, spawnedItem )
				    ExtractValues( CurrentRun.Hero, spawnedItem, spawnedItem )
                end
			elseif itemData.Type == "Boon" then
				itemData.Args.SpawnPoint = kitId
				itemData.Args.DoesNotBlockExit = true
				itemData.Args.SuppressSpawnSounds = true
				itemData.Args.SuppressFlares = true
				spawnedItem = GiveLoot( itemData.Args )
				spawnedItem.CanReceiveGift = false
				SetThingProperty({ Property = "SortBoundsScale", Value = 1.0, DestinationId = spawnedItem.ObjectId })
			end			
			if spawnedItem ~= nil then
				SetObstacleProperty({ Property = "MagnetismWhileBlocked", Value = 0, DestinationId = spawnedItem.ObjectId })
				spawnedItem.SpawnPointId = kitId
				spawnedItem.UseText = spawnedItem.PurchaseText or "Shop_UseText"
				table.insert( CurrentRun.CurrentRoom.Store.SpawnedStoreItems, spawnedItem )
			end						
			if RefreshStoreItems ~= nil then
                RefreshStoreItems()
            end
		end
	)
ModUtil.Path.Wrap("IsGameStateEligible",
    function(baseFunc, currentRun, source, requirements, args)
        local result = baseFunc(currentRun, source, requirements, args)
        if result == true then
            if IsEmpty(requirements) then
                return true
            end
            if requirements.Force then
                return true
            end
            -- All the new Requirements goes here --
            if requirements.RequiredMaxHephaestusUpgrades ~= nil then
                local numUpgrades = 0
                if currentRun.LootTypeHistory and currentRun.LootTypeHistory.HephaestusUpgrade then
                    if currentRun.LootTypeHistory.HephaestusUpgrade > requirements.RequiredMaxHephaestusUpgrades then
                        return false
                    else
                        numUpgrades = currentRun.LootTypeHistory.HephaestusUpgrade
                    end
                end
                if currentRun.CurrentRoom ~= nil and currentRun.CurrentRoom.ChosenRewardType == "HephaestusUpgrade" and (numUpgrades + 1) > requirements.RequiredMaxHephaestusUpgrades then
                    return false
                end
            end
            if requirements.RequiredNoDamageThisRoom ~= nil then
                if CurrentRun.CurrentRoom.PerfectEncounterCleared ~= nil and not CurrentRun.CurrentRoom.PerfectEncounterCleared then
                    return false
                end
            end
            if requirements.RequiredChallengeSwitchInRoom ~= nil and CurrentRun.CurrentRoom.ChallengeSwitch == nil then
                return false
            end
            --[[if requirements.RequiredDidNoDamageRun ~= nil then
                if CurrentRun.CurrentRoom.PerfectEncounterCleared then
                    return false
                end
            end]]
        else
            return false
        end
        return true
    end
)
ModUtil.Path.Wrap("StartEncounter",
		function(baseFunc, currentRun, currentRoom, currentEncounter)
            -- Apollo/Poseidon Duo
			if HeroHasTrait("SeaChanteyTrait") and currentRun.CurrentRoom.Encounter.EncounterType == "Boss" then
				thread(SeaChanteyAnnouncement)
			end
            -- Hestia/Dionysus Duo
            if HeroHasTrait("FullHealBossTrait") then
                local healAmount = round(CurrentRun.Hero.MaxHealth * CalculateHealingMultiplier())
                if healAmount < 0.05 then
                    healAmount = round(CurrentRun.Hero.MaxHealth * 0.05)
                end
                if (currentRun.CurrentRoom.Encounter.EncounterType == "Boss" or
                    currentRun.CurrentRoom.Encounter.EncounterType == "OptionalBoss") and
                    currentRun.CurrentRoom.Encounter.CurrentWaveNum == nil then
                    thread(FullHealBossAnnouncement)
                    Heal(CurrentRun.Hero, { HealAmount = healAmount, SourceName = "FullHealBossTrait" })
                elseif currentRun.CurrentRoom.IsMiniBossRoom then
                    thread(FullHealBossAnnouncement)
                    Heal(CurrentRun.Hero, { HealAmount = (healAmount / 2), SourceName = "FullHealBossTrait" })
                end
            end
            -- Hephaestus Armor Boss
            if HeroHasTrait("ArmorBossTrait") then
                if ((currentRun.CurrentRoom.Encounter.EncounterType == "Boss" or
                    currentRun.CurrentRoom.Encounter.EncounterType == "OptionalBoss") and
                    currentRun.CurrentRoom.Encounter.CurrentWaveNum == nil) or
                    currentRun.CurrentRoom.IsMiniBossRoom then		
                        local armorAmount = GetTotalHeroTraitValue("RepairArmorOnBoss", { IsMultiplier = false })			
                        RepairArmor(armorAmount)
                        thread(RepairArmorPresentation)
                end
            end
            -- Mirror Dashless Shield
            if GetNumMetaUpgrades("DashlessMetaUpgrade") > 0 and CurrentRun and CurrentRun.Hero then
                CurrentRun.Hero.DashlessCooldown = 1			
			    thread( AddDashlessBuff, 4 )
            end
			baseFunc(currentRun, currentRoom, currentEncounter)
		end
	)
ModUtil.Path.Wrap( "EndEncounterEffects", 
	function(baseFunc, currentRun, currentRoom, currentEncounter)
		baseFunc(currentRun, currentRoom, currentEncounter)
		if currentEncounter == nil or currentEncounter.EncounterType == "NonCombat" then
			return
		end
		if HeroHasTrait("SpawnWeaponsTrait") and CurrentRun.CurrentRoom.HephWeapons ~= nil then
			for index, obstacle in ipairs( CurrentRun.CurrentRoom.HephWeapons ) do
				if obstacle ~= nil then
					Destroy({ Id = obstacle.ObjectId })				
				end
			end
		end
		if HeroHasTrait("HephaestusShoutSummon") then
			for index, enemy in ipairs( ActiveEnemies ) do                
				if enemy ~= nil and enemy.Name == "HephaestusChariotSuicide" then
                    Kill( enemy )		
				end
			end
		end
		if currentEncounter == currentRoom.Encounter and not currentRoom.BlockClearRewards then
			for k, traitData in pairs(currentRun.Hero.Traits) do
				if not currentEncounter.PlayerTookDamage and traitData.RepairArmorOnPerfectEncounter then
					RepairArmor(traitData.RepairArmorOnPerfectEncounter)
					thread(RepairArmorPresentation)
				end
			end
		end
	end
)
OnHit {
    function(triggerArgs)
        local attacker = triggerArgs.AttackerTable
        local attackerWeaponName = triggerArgs.SourceWeapon
        triggerArgs.AttackerWeaponData = GetWeaponData(attacker, attackerWeaponName)
		local attackerWeaponData = triggerArgs.AttackerWeaponData
        local victim = triggerArgs.TriggeredByTable
        if victim ~= nil then
            if (victim.CanBeAggroed or victim.Name == "TrainingMelee") and victim ~= CurrentRun.Hero then
                for i, traitData in pairs(GetHeroTraitValues("OnWeaponHitFunctions")) do
                    if (traitData.ValidWeapons == nil or Contains(traitData.ValidWeapons, attackerWeaponName)) and
                        traitData.FunctionName and _G[traitData.FunctionName] then
                        thread(_G[traitData.FunctionName], triggerArgs.AttackerWeaponData, victim.ObjectId, traitData.FunctionArgs)
                    end
                end
            end
            if victim == CurrentRun.Hero and not triggerArgs.InvulnerableFromCoverage then
				if HeroHasTrait("HephaestusImproveAthena") and triggerArgs.DealsDamageOrControlEffect and not ( victim == attacker and ( not attackerWeaponData or attackerWeaponData.SelfMultiplier == 0 )) then
					-- Player hit
					local tempInvulnerabilityTrait = nil
					for k, currentTrait in pairs( CurrentRun.Hero.Traits ) do
						if currentTrait.Name == "HephaestusImproveAthena" and IsOnlyInvulnerableSource("TraitInvulnerability") then
							tempInvulnerabilityTrait = currentTrait
						end
					end

					if tempInvulnerabilityTrait ~= nil and IsTraitActive( tempInvulnerabilityTrait ) then
						triggerArgs.IsInvulnerable = true
						PutTraitOnCooldown( tempInvulnerabilityTrait )
						thread( VulnerableAfterDelay, 1 )
					end
				end
            end
        end
    end
}
--[[ModUtil.Path.Wrap("StartNewRunPresentation",
    function(baseFunc, currentRun)
        if GetNumMetaUpgrades("PomFirstGodMetaUpgrade") > 0 then            
            currentRun.Hero.PomFirstList = {
                "ZeusUpgrade",
                "PoseidonUpgrade",
                "AresUpgrade",
                "DionysusUpgrade",
                "ArtemisUpgrade",
                "AthenaUpgrade",
                "AphroditeUpgrade",
                "DemeterUpgrade",
                "ApolloUpgrade",
                "HestiaUpgrade",
                "HeraUpgrade"
            }
        end
        baseFunc(currentRun)
    end
)]]
ModUtil.Path.Wrap("DropStoredAmmo",
    function(baseFunc, enemy, weaponData, id )   
        if IsMetaUpgradeActive("CastDamageOverTimeMetaUpgrade") and enemy then
            FireWeaponFromUnit({ Weapon = "StoredAmmoDOTApplicator", Id = CurrentRun.Hero.ObjectId, DestinationId = enemy.ObjectId, FireFromTarget = true })
        end
        baseFunc(enemy, weaponData, id)
        if IsEmpty( EnemyHealthDisplayAnchors[enemy.ObjectId.."storedAmmo"] ) and enemy then
            ClearEffect({ Id = enemy.ObjectId, Name = "CastDamageOverTime" })
        end
    end
)
ModUtil.Path.Wrap("AddTraitToHero",
    function(baseFunc, args)     
        baseFunc(args)
        local traitData = args.TraitData        
        if traitData == nil then
            traitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = args.TraitName, Rarity = args.Rarity })
        end
        if CanReceivePomFirstTrait(CurrentRun.Hero, traitData.Name) and IsGameStateEligible(CurrentRun, TraitData[traitData.Name]) then            
            --ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Got here"))
            baseFunc(args)
        end
        if traitData ~= nil and traitData.Name ~= nil and traitData.ReplaceTrait ~= nil and HeroHasTrait(traitData.ReplaceTrait) then
            RemoveTrait(CurrentRun.Hero, traitData.ReplaceTrait)
        end
        if traitData ~= nil and traitData.Name ~= nil and traitData.ReplaceTrait ~= nil and HeroHasTrait(traitData.ReplaceTrait) then
            RemoveTrait(CurrentRun.Hero, traitData.ReplaceTrait)
        end
    end
)

function CanReceivePomFirstTrait( unit, traitName )
    if GetNumMetaUpgrades("PomFirstGodMetaUpgrade") <= 0 or not IsGodTrait(traitName) then
        return false
    end
	if unit == nil or unit.Traits == nil then
		return false
	end
    local sourceName = GetLootSourceName(traitName) 
	local num = 0
	for k, currentTrait in pairs( unit.Traits ) do
		if IsGameStateEligible(CurrentRun, TraitData[currentTrait.Name]) and GetLootSourceName(currentTrait.Name) == sourceName then
			num = num + 1
		end
	end
	return num <= 1
end

-- Test / Utility
--[[ModUtil.Path.Wrap("BeginOpeningCodex",
    function(baseFunc)
        --PresentationNewSameGodIncrease()
        if (not CanOpenCodex()) and IsSuperValid() then
            BuildSuperMeter(CurrentRun, 50)
        end
        --thread(RunAudio01)
        --CreateHephaestusLoot()
        --CreateAnimation({ Name = "HeraWings", DestinationId = CurrentRun.Hero.ObjectId })
        --ForceNextRoomFunc("B_Shop01")
        --ModUtil.Hades.PrintStackChunks(ModUtil.ToString.TableKeys(CurrentRun.Hero.Traits))
        --CreateHephaestusLoot({ OffsetX = 100, SpawnPoint = CurrentRun.Hero.ObjectId })

        --LoadMap({ Name ="E_Story01", ResetBinks = true, ResetWeaponBinks = true })
        --LoadMap({ Name ="A_Shop01", ResetBinks = true, ResetWeaponBinks = true })
        ModUtil.Hades.PrintStackChunks(ModUtil.ToString(GameState.ActiveMutators))    
        if GameState.ActiveMutators ~= nil then
            for activeMutator in pairs( GameState.ActiveMutators ) do
                ModUtil.Hades.PrintStackChunks(ModUtil.ToString.TableKeys(activeMutator))            
            end
        end
        --UseLoungeTelescope()
        baseFunc()
    end
)
function ForceNextRoomFunc(value)

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

function GetLootSourceNameFromGod(traitName)
    for lootName, god in pairs(LootData) do
        if god == nil then
            --ModUtil.Hades.PrintStackChunks(ModUtil.ToString(lootName))
            return false
        end
    end
    return GetLootSourceName(traitName)
end]]