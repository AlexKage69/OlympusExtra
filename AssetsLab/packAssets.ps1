 texture_packing_wheel pk -s PackMe -b OEAssets
 deppth pk -s OEAssets -t OEAssets.pkg 
 Move-Item OEAssets.pkg ../Packages/OEAssets.pkg -Force
 Move-Item OEAssets.pkg_manifest ../Packages/OEAssets.pkg_manifest -Force