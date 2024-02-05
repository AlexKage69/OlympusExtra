-- OlympusExtraMeasures

if ModUtil ~= nil then

	ModUtil.Mod.Register("ExtraMeasures")
	local mod = "ExtraMeasures"
    local package = "OEMPackage"

	-- TODO
	--[[
		local shrineLevel = GetNumMetaUpgrades( enemy.ShrineMetaUpgradeName )

		RoomManager.lua
		if CurrentRun.CurrentRoom.Encounter.Name == "A_Boss01" then
			CurrentRun.CurrentRoom.Encounter.SpawnWaves = EncounterData.A_Boss01.SpawnWaves
		end
	--]]

	-- 
	-- Screenshot: Hades_73.png saved in C:\Users\phypo\Documents\Saved Games\Hades\Screenshots
	-- Script Crash: RunManager.lua:811 attempt to index local 'encounterData' (a nil value)

	MetaUpgradeData.BossDifficultyShrineUpgrade.CostTable = {1, 2, 3, 4, 1, 2, 3, 4}
	-- EncounterData.BossHarpy1.EnemySet
	-- RoomSetData.Tartarus.A_Boss01.LegalEncounters = { "BossHarpy1", "BossHarpyTriumvirate"}
	-- RoomSetData.Tartarus.A_Boss02.LegalEncounters = { "BossHarpy2", "BossHarpyTriumvirate"}
	-- RoomSetData.Tartarus.A_Boss03.LegalEncounters = { "BossHarpy3", "BossHarpyTriumvirate"}
	-- RoomSetData.Tartarus.A_Boss01.LegalEncounters = { "BossHarpy1"}
	RoomSetData.Tartarus.A_Boss02.LegalEncounters = { "BossHarpy3"}
	-- RoomSetData.Tartarus.A_Boss03.LegalEncounters = { "BossHarpy1"}

	ModUtil.Path.Wrap( "ChooseEncounter", 
		function(baseFunc, currentRun, room)	
			local encounterData = nil
			if ForceNextEncounter ~= nil then
				DebugPrint({ Text = "ForceNextEncounter = "..tostring(ForceNextEncounter) })
				encounterData = EncounterData[ForceNextEncounter]
				encounterData.SkipIntroEncounterCheck = true
				ForceNextEncounter = nil
			elseif currentRun.ForceNextEncounterData ~= nil then
				encounterData = currentRun.ForceNextEncounterData
			elseif HasHeroTraitValue( "ForceThanatosEncounter" ) then
				local legalEncounters = {}
				for i, encounterName in pairs( EncounterSets.ThanatosEncounters ) do
					if IsEncounterEligible( currentRun, room, EncounterData[encounterName] ) then
						table.insert(legalEncounters, encounterName )
					end
				end
				if not IsEmpty( legalEncounters ) then
					UseHeroTraitsWithValue( "ForceThanatosEncounter", true )
					encounterData = EncounterData[legalEncounters[1]]
				end
			end

			if not encounterData then
				local eligibleEncounters = {}
				local forcedEncounters = {}
				if room.LegalEncounters ~= nil then
					for k, encounterName in pairs( room.LegalEncounters ) do
						local encounterData = EncounterData[encounterName]
						if IsEncounterEligible( currentRun, room, encounterData ) then
							table.insert( eligibleEncounters, encounterData )
							if IsEncounterForced( currentRun, room, encounterData ) then
								table.insert( forcedEncounters, encounterData )
							end
						end
					end
				else
					for encounterName, encounterData in pairs( EncounterData ) do
						if IsEncounterEligible( currentRun, room, encounterData ) then
							table.insert( eligibleEncounters, encounterData )
							if IsEncounterForced( currentRun, room, encounterData ) then
								table.insert( forcedEncounters, encounterData )
							end
						end
					end
				end

				local roomName = room.Name
				if roomName == nil then
					roomName = GetKey(RoomData, room)
				end

				if roomName == nil then
					roomName = tostring(room.HelpTextId)..":"..tostring(room.Type)..":"..tostring(room.LegalEncounters[1])
				end

				DebugAssert({ Condition = not IsEmpty( eligibleEncounters ) or not IsEmpty(forcedEncounters), Text = "No encounters available for "..tostring(roomName).."!" })

				if not IsEmpty( forcedEncounters ) then
					encounterData = GetRandomValue( forcedEncounters )
				else
					encounterData = GetRandomValue( eligibleEncounters )
				end
				print(encounterData.EnemySet) --..enemy.Name)
				if encounterData.EnemySet ~= nil then
					for k, enemyName in pairs(encounterData.EnemySet) do
						if EnemyData[enemyName].ForceIntroduction and not HasEncounterBeenCompleted(EnemyData[enemyName].RequiredIntroEncounter) then
							encounterData = EncounterData[EnemyData[enemyName].RequiredIntroEncounter]
						end
					end
				end
			end

			local encounter = SetupEncounter(encounterData, room)

			return encounter	

			--return baseFunc(currentRun, room)
		end
	)

	-- Limit HarpySupportAIs to normal Extreme Measures
	ModUtil.Path.Context.Env( "SelectHarpySupportAIs", function( )
		ModUtil.Path.Wrap( "SelectHarpySupportAIs", function( base, enemy, currentRun)
			local shrineLevel = GetNumMetaUpgrades( enemy.ShrineMetaUpgradeName )
			enemy.SupportAINames = enemy.SupportAINames or {}
			if shrineLevel > 0 and shrineLevel < 11 then
				local supportCount = RandomInt(1, 2)
				if TextLinesRecord.FurySistersUnion01 == nil then
					supportCount = 2
				end
				for i=1, supportCount, 1 do
					local supportAIName = RemoveRandomValue(enemy.SupportAIWeaponSetOptions)
					table.insert(enemy.SupportAINames, supportAIName)
					currentRun.SupportAINames[supportAIName] = true
				end
			end

		  	return base( enemy, currentRun )
		end, mod )  
	end) 

	-- BossTheseusAndMinotaur
	-- BossHarpyTriumvirate
end
