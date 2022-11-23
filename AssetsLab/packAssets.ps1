texture_packing_wheel pk -s PackMe/Minor -b OEMinor
deppth pk -s OEMinor -t OEMinor.pkg

Remove-Item 'OEMinor' -Recurse

texture_packing_wheel pk -s PackMe/Hestia -b OEHestia
deppth pk -s OEHestia -t OEHestia.pkg

Remove-Item 'OEHestia' -Recurse