-- Going to combine all mods

ModUtil.RegisterMod("OlympusExtra")

ModUtil.WrapBaseFunction( "OpenCodexScreen", function(baseFunc, args)
    baseFunc(args)
    
    --ModUtil.Hades.PrintStack(CodexOrdering.OlympianGods.Order[1])
end)