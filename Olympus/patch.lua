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
                local distanceSquared = math.sqrt((enemyLocation.X - heroLocation.X) ^ 2 + (enemyLocation.Y - heroLocation.Y) ^ 2)
                ModUtil.Hades.PrintStackChunks(ModUtil.ToString(enemy.Name))
				ModUtil.Hades.PrintStackChunks(ModUtil.ToString(distanceSquared))

                                    
                ApplyEffectFromWeapon({ Id = CurrentRun.Hero.ObjectId, DestinationIds = CurrentRun.Hero.ObjectId,
                    WeaponName = "FoesNumberDamageBuff", EffectName = "FoesNumberDamageBuff" })

                ClearEffect({ Ids = CurrentRun.Hero.ObjectId, Name = "FoesNumberDamageBuff" })

			end

        end
    end
end

ModUtil.Path.Wrap( "GetKeepsakeLevel", 
	function(baseFunc, traitName )
        if TraitData[traitName] == nil then
            return 1
        else
            return baseFunc(traitName)
        end
    end
)
ModUtil.Path.Wrap( "EquipKeepsake", 
	function(baseFunc, heroUnit, traitName, args )
        if traitName == nil or TraitData[traitName] == nil then
            return
        end
        baseFunc( heroUnit, traitName, args)
    end
)
ModUtil.Path.Wrap( "EquipAssist", 
	function(baseFunc,  heroUnit, traitName, args )
        if traitName == nil or TraitData[traitName] == nil then
            return
        end
        baseFunc( heroUnit, traitName, args)
    end
)
--[[ModUtil.Path.Wrap( "ShowQuestProgress", 
	function(baseFunc, questData )
        baseFunc(questData)
        local requirements = questData.CompleteGameStateRequirements
        ModUtil.Hades.PrintStackChunks(ModUtil.ToString.Deep(questData.CompleteGameStateRequirements))
        if requirements.RequiredCosmetics ~= nil then
            --Basics
            local index = 1
            local baseOffsetY = 200
            local spacing = questData.Spacing or 30

            local maxEntriesPerColumn = questData.MaxEntriesPerColumn or 12
            local currentColumn = 1
            local columnWidth = 350

            local completeColor = {223,223,223,255}
            local incompleteColor = {94,94,94,255}
            local fontSize = questData.FontSize or 20
            local font = "AlegreyaSansSCRegular"

            local textSymbolScale = 1.0
            local width = 700
            -- Specifics
            for k, name in pairs( requirements.RequiredCosmetics ) do
                local color = completeColor
                local text = "QuestLog_QuestProgressComplete"
                
                if not GameState.Cosmetics[name] then
                    color = incompleteColor
                    text = questData.IncompleteName or "QuestLog_QuestProgressIncomplete"
                end
                CreateTextBox({ Id = ScreenAnchors.QuestLogScreen.Components.DescriptionBox.Id,
                    Text = text,
                    LuaKey = "TempTextData",
                    LuaValue = { Requirement = name },
                    OffsetX = ( currentColumn - 1 ) * columnWidth, OffsetY = baseOffsetY + ( ( index - ( maxEntriesPerColumn * (currentColumn - 1) ) ) * spacing),
                    FontSize = fontSize,
                    Color = color,
                    Font = font,
                    Width = width,
                    ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 2},
                    TextSymbolScale = textSymbolScale,
                    Justification = "Left" })
                index = index + 1
                if( index > maxEntriesPerColumn * currentColumn ) then
                    currentColumn = currentColumn + 1
                end
            end
        end

        
    end
)]]
--[[ModUtil.Path.Wrap( "AddRerolls", 
	function(baseFunc, amount, source, args )
        if type(amount) == "number" then
		    baseFunc(amount, source, args)
        end
	end
)]]
