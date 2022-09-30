-- Bugs from the Base Game.

ModUtil.Path.Wrap( "Heal", 
	function(baseFunc, victim, triggerArgs )
        if triggerArgs.HealAmount == nil then
            triggerArgs.HealAmount = 0
        end
        baseFunc(victim, triggerArgs)
    end
)

--[[ModUtil.Path.Wrap( "AddRerolls", 
	function(baseFunc, amount, source, args )
        if type(amount) == "number" then
		    baseFunc(amount, source, args)
        end
	end
)]]