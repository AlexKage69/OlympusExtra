
function SpawnExtraNPCs(eventSource, args)
	--ModUtil.Hades.PrintStackChunks(ModUtil.ToString("SpawnExtraNPCs")) 	
	local obstacleId = GetFirstValue(GetInactiveIdsByType({ Name = args.Name }))
	if args.Name == nil or obstacleId == nil or args.SpawnPointId == nil then
		ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Fail loading character - No Ids")) 	
        ModUtil.Hades.PrintStackChunks(ModUtil.ToString(args.Name))
        ModUtil.Hades.PrintStackChunks(ModUtil.ToString(obstacleId))
        ModUtil.Hades.PrintStackChunks(ModUtil.ToString(args.SpawnPointId))			
		return
	end
	local newUnit = DeepCopyTable( EnemyData[args.Name] )
	if newUnit.LocationsById ~= nil and newUnit.LocationsById[args.SpawnPointId] ~= nil then
		args.ObjectId = SpawnObstacle({ Name = "InvisibleTarget", LocationX = newUnit.LocationsById[args.SpawnPointId].LocationX, LocationY = newUnit.LocationsById[args.SpawnPointId].LocationY })
    else
		ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Fail loading character - No Location")) 	
        ModUtil.Hades.PrintStackChunks(ModUtil.ToString(args.SpawnPointId))
        ModUtil.Hades.PrintStackChunks(ModUtil.ToString(newUnit.LocationsById))
        return
	end
	
	if IsActivationEligible( obstacleId, newUnit ) then
		newUnit.ObjectId = SpawnUnit({ Name = args.Name, Group = "Standing", DestinationId = args.ObjectId })

		SetupEnemyObject( newUnit, CurrentRun, { IgnoreAI = true, PreLoadBinks = true, } )
		UseableOn({ Ids = newUnit.ObjectId })
		SetupAI( CurrentRun, newUnit )		
		if GameState.Gift[args.Name] == nil or GameState.Gift[args.Name].Value == nil then
			GameState.Gift[args.Name] = {
				Value =  0,
				--NewTraits = GameState.BefriendPersistentVals["TheseusGiftNewTraits"],
			}
		end

		local enemyData = DeepCopyTable( EnemyData.NPC_Moros_01 )
		if IsActivationEligible( newUnit.ObjectId, enemyData ) then
			Activate({ Ids = newUnit.ObjectId })
		end
		CheckConversations()	
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
            ModUtil.Hades.PrintStackChunks(ModUtil.ToString("Move to Office")) 	
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
		--ActivateRotatingNPCs({},{Types={"NPC_Moros_01"}})
		--ForceNextRoomFunc("A_Makaria01")
		--local challengeBaseIds = GetIdsByType({ Name = "NPC_Makaria_01" })
		--GameState.Gift["NPC_Moros_01"] = nil
		ModUtil.Hades.PrintStackChunks(ModUtil.ToString(GetFirstValue(GetInactiveIdsByType({ Name = "NPC_Moros_01" })))) 
        ModUtil.Hades.PrintStackChunks(ModUtil.ToString(GetFirstValue(GetInactiveIdsByType({ Name = "NPC_Makaria_01" })))) 
		baseFunc()
	end
)
