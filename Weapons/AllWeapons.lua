
	ModUtil.Path.Wrap("AssignWeaponKits",
    function(baseFunc, eventSource, args)
        local kitBinks = {}
        local weaponPrefixes = { "WeaponHammer", "WeaponStaff" }
        for k, weaponPrefix in ipairs( weaponPrefixes ) do
            local weaponPostFixes = { "", "01", "02", "03" }
            for j, weaponPostFix in ipairs( weaponPostFixes ) do
                local kitBink = weaponPrefix..weaponPostFix
                table.insert( kitBinks, kitBink.."FloatingIdle" )
                table.insert( kitBinks, kitBink.."FloatingIdleOff" )
            end
        end
        PreLoadBinks({ Names = kitBinks })
        baseFunc(eventSource, args)
    end)