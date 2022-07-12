texture_packing_wheel pk -s PackMe/Temp -b OETemp
deppth pk -s OETemp -t OETemp.pkg

texture_packing_wheel pk -s PackMe/Apollo -b OEApollo
deppth pk -s OEApollo -t OEApollo.pkg 

texture_packing_wheel pk -s PackMe/Hestia -b OEHestia
deppth pk -s OEHestia -t OEHestia.pkg

Remove-Item 'OEApollo' -Recurse
Remove-Item 'OEHestia' -Recurse
Remove-Item 'OETemp' -Recurse