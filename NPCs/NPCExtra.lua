function SpawnExtraNPCs(eventSource, args)
	if GameState.Gift[args.Name] == nil or GameState.Gift[args.Name].Value == nil then
		GameState.Gift[args.Name] = {
			Value =  0,
			--NewTraits = GameState.BefriendPersistentVals["TheseusGiftNewTraits"],
		}
	end
	if CurrentRun.CustomNPC == nil then
		CurrentRun.CustomNPC = {}
	end
	local obstacleId = GetFirstValue(GetInactiveIdsByType({ Name = args.Name }))
	if args.Name == nil or obstacleId == nil or args.SpawnPointId == nil then
		--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Fail loading character - No Ids")) 	
       -- ModUtil.Hades.PrintStackChunks(ModUtil.ToString(args.Name))
        --ModUtil.Hades.PrintStackChunks(ModUtil.ToString(args.SpawnPointId))			
		return
	end
	local newUnit = DeepCopyTable( EnemyData[args.Name] )
	if newUnit.LocationsById ~= nil and newUnit.LocationsById[args.SpawnPointId] ~= nil then
		args.ObjectId = SpawnObstacle({ Name = "InvisibleTarget", LocationX = newUnit.LocationsById[args.SpawnPointId].LocationX, LocationY = newUnit.LocationsById[args.SpawnPointId].LocationY })
    else
		--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Fail loading character - No Location")) 	
        --ModUtil.Hades.PrintStackChunks(ModUtil.ToString(args.SpawnPointId))
        --ModUtil.Hades.PrintStackChunks(ModUtil.ToString(newUnit.LocationsById))
        return
	end
	local chanceToSpawn = args.SpawnChance or 1.0
	if GameState.NPCInteractions[args.Name] == nil or GameState.NPCInteractions[args.Name] <= 0 then
		chanceToSpawn = 1.0
	end
	if IsActivationEligible( obstacleId, newUnit ) then
		ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Chance:"..args.Name))
		if CurrentRun.CustomNPC[args.Name] == nil then
			CurrentRun.CustomNPC[args.Name] = RandomChance( chanceToSpawn )
			ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Chance:"..args.Name))
		end
		if CurrentRun.CustomNPC[args.Name] then
			newUnit.ObjectId = SpawnUnit({ Name = args.Name, Group = "Standing", DestinationId = args.ObjectId })
			
			SetupEnemyObject( newUnit, CurrentRun, { IgnoreAI = true, PreLoadBinks = true, } )
			UseableOn({ Ids = newUnit.ObjectId })
			if args.Angle ~= nil then
				SetGoalAngle({ Id = newUnit.ObjectId, Angle = args.Angle })
			end
			SetupAI( CurrentRun, newUnit )
			
			local enemyData = DeepCopyTable( EnemyData.NPC_Moros_01 )
			if IsActivationEligible( newUnit.ObjectId, enemyData ) then
				Activate({ Ids = newUnit.ObjectId })
			end
			CheckConversations()	
		else	
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Start Missing Trigger:"..args.Name)) 
			if newUnit.MissingDistanceTrigger ~= nil then
				local missingUnit = {}
				missingUnit.Name = args.Name
				missingUnit.ObjectId = SpawnObstacle({ Name = "BlankObstacle" })
				local location = GetLocation({ Id = obstacleId, CheckInactive = true })
				Teleport({ Id = missingUnit.ObjectId, OffsetX = location.X, OffsetY = location.Y })
				thread( CheckDistanceTrigger, newUnit.MissingDistanceTrigger, missingUnit )
			end
		end
		--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(args.Name.." Spawned:"..newUnit.ObjectId.."; GiftVal:"..GameState.Gift[args.Name].Value)) 	
	end
	--[[if IsActivationEligible( id, unitData ) then
			if ShouldRotatorActivate( id, unitData, numActivations, activationCap ) then

				if unitData.Binks ~= nil then
					PreLoadBinks({ Names = unitData.Binks })
				end
				Activate({ Ids = id, DoPresentation = doPresentation })

				local newUnit = DeepCopyTable( unitData )
				newUnit.ObjectId = id
				SetupEnemyObject( newUnit, CurrentRun, args )
				if CurrentRun.AnimationState[newUnit.ObjectId] ~= nil then
					SetAnimation({ DestinationId = newUnit.ObjectId, Name = CurrentRun.AnimationState[newUnit.ObjectId] })
				end
				if CurrentRun.EventState ~= nil then
					local eventState = CurrentRun.EventState[newUnit.ObjectId]
					if eventState ~= nil then
						local eventFunction = _G[eventState.FunctionName]
						if eventFunction ~= nil then
							thread( eventFunction, newUnit, eventState.Args )
						end
					end
				end

				CurrentRun.ActivationRecord[id] = true
				numActivations = numActivations + 1
			else
				if unitData.MissingDistanceTrigger ~= nil then
					local missingUnit = {}
					missingUnit.Name = name
					missingUnit.ObjectId = SpawnObstacle({ Name = "BlankObstacle" })
					local location = GetLocation({ Id = id, CheckInactive = true })
					Teleport({ Id = missingUnit.ObjectId, OffsetX = location.X, OffsetY = location.Y })
					thread( CheckDistanceTrigger, unitData.MissingDistanceTrigger, missingUnit )
				end
			end
		else
			if unitData.ActivationFailedDistanceTrigger ~= nil then
				local missingUnit = {}
				missingUnit.Name = name
				missingUnit.ObjectId = SpawnObstacle({ Name = "BlankObstacle" })
				local location = GetLocation({ Id = id, CheckInactive = true })
				Teleport({ Id = missingUnit.ObjectId, OffsetX = location.X, OffsetY = location.Y })
				thread( CheckDistanceTrigger, unitData.ActivationFailedDistanceTrigger, missingUnit )
			end
		end]]
end
--OverwriteTableKeys( EnemyData, OlympusUnitSetData.NPCs )(  )
ModUtil.Path.Wrap( "SetNextInteractLines", 
	function(baseFunc, source, textLines)		
        baseFunc(source, textLines)
        if textLines.InOffice then
            --ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Move to Office")) 	
            CurrentRun.NPCExtra = {
                MorosInOffice = true
            }
            --Destroy({ Id = source.ObjectId })
        end
	end
)
ModUtil.Path.Wrap( "BeginOpeningCodex", 
	function(baseFunc)		
		if (not CanOpenCodex()) and IsSuperValid() then
			BuildSuperMeter(CurrentRun, 50)
		end
		--AddTraitToHero({ TraitName = "TemporaryForcedChallengeSwitchTrait" })
		--[[CurrentRun.Hero.Bounce = {
			LastId = nil,
			Num = 0,
            Max = GetNumMetaUpgrades( "BounceAmmoMetaUpgrade" )
		}]]
		--FireBounceAmmo(CurrentRun.Hero.ObjectId)
		--ActivateRotatingNPCs({},{Types={"NPC_Moros_01"}})
		--ForceNextRoomFunc("A_Makaria01")
		--local challengeBaseIds = GetIdsByType({ Name = "NPC_Makaria_01" })
		--GameState.Gift["NPC_Moros_01"] = nil
		--ModUtil.Hades.PrintStackChunks(ModUtil.ToString(GetFirstValue(GetInactiveIdsByType({ Name = "NPC_Moros_01" })))) 
        --ModUtil.Hades.PrintStackChunks(ModUtil.ToString(GetFirstValue(GetInactiveIdsByType({ Name = "NPC_Makaria_01" })))) 
		--SpawnUnit({ Name = "NPC_Melinoe_01", Group = "Standing", DestinationId = CurrentRun.Hero.ObjectId })
        --ModUtil.Hades.PrintStackChunks(ModUtil.ToString(GetFirstValue(GetInactiveIdsByType({ Name = "NPC_Melinoe_01" })))) 
        --ModUtil.Hades.PrintStackChunks(ModUtil.ToString(GetFirstValue(GetInactiveIdsByType({ Name = "NPC_Nemesis_01" })))) 
        --ModUtil.Hades.PrintStackChunks(ModUtil.ToString(GetFirstValue(GetInactiveIdsByType({ Name = "NPC_Eris_01" })))) 
		baseFunc()
	end
)
