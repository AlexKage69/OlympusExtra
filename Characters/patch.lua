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

--[[ModUtil.Path.Wrap( "AddRerolls", 
	function(baseFunc, amount, source, args )
        if type(amount) == "number" then
		    baseFunc(amount, source, args)
        end
	end
)]]
