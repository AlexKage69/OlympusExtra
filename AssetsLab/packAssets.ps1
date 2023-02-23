texture_packing_wheel pk -s PackMe/Apollo -b OEApollo
deppth pk -s OEApollo -t OEApollo.pkg

Remove-Item 'OEApollo' -Recurse

texture_packing_wheel pk -s PackMe/Hera -b OEHera
deppth pk -s OEHera -t OEHera.pkg

Remove-Item 'OEHera' -Recurse