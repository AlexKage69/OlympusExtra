pip install pyinstaller
pyinstaller --onefile 'olympusextra_installer.py'
Move-Item -Path '.\dist\olympusextra_installer.exe' -Destination '.\olympusextra_installer.exe'
Remove-Item '.\build' -Recurse
Remove-Item '.\olympusextra_installer.spec'
Remove-Item '.\dist' -Recurse