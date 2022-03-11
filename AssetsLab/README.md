# Assets

## Installation

```
pip3 install deppth-0.1.0.0-py3-none-any.whl
pip3 install texture_packing_wheel-1.0-py3-none-any.whl
pip3 install PyTexturePacker
pip3 install lz4
```



## Importing Assets
```
texture_packing_wheel pk -s PackMe -b OEAssets
deppth pk -s OEAssets -t OEAssets.pkg
```

Put the `OEAssets` and `OEAssets.pkg` into the Packages folder.  (Alternatively, run `packAssets.ps1`)



Run modimporter as usual.



## Extracting Assets

In the `Content/Win/Packages` directory:

```
deppth ex GUI.pkg -s
```

Replace GUI.pkg with any pkg you want to extract



## Asset Creation

Shamelessly stolen from Hades source files. 
Tinted using https://www6.lunapic.com/editor/?action=tint
Colour tint: #ff914f



## Credits to: 
Reikiix (Apollo Portrait)
Lazy.mano (Apollo Keepsake Badges)