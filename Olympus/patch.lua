-- Bugs from the Base Game.

ModUtil.Path.Wrap( "Heal", 
	function(baseFunc, victim, triggerArgs )
        if triggerArgs.HealAmount == nil then
            triggerArgs.HealAmount = 0
        end
        baseFunc(victim, triggerArgs)
    end
)

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
--[[ModUtil.Path.Wrap( "AddRerolls", 
	function(baseFunc, amount, source, args )
        if type(amount) == "number" then
		    baseFunc(amount, source, args)
        end
	end
)]]