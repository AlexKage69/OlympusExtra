texture_packing_wheel pk -s PackMe/Minor -b OEMinor
deppth pk -s OEMinor -t OEMinor.pkg

Remove-Item 'OEMinor' -Recurse

texture_packing_wheel pk -s PackMe/Hera -b OEHera
deppth pk -s OEHera -t OEHera.pkg

Remove-Item 'OEHera' -Recurse