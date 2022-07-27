texture_packing_wheel pk -s PackMe/Apollo -b OEApollo
deppth pk -s OEApollo -t OEApollo.pkg

Remove-Item 'OEApollo' -Recurse

texture_packing_wheel pk -s PackMe/Hestia -b OEHestia
deppth pk -s OEHestia -t OEHestia.pkg

Remove-Item 'OEHestia' -Recurse