import requests
import shutil
import os 
from sys import exit

r = requests.get("https://github.com/AlexKage69/OlympusExtra/releases/latest")
oe_version = r.url.split("/")[-1][1:]

modimporter = "https://github.com/SGG-Modding/ModImporter/releases/download/1.5.2/modimporter-windows.zip"
modutil = "https://github.com/SGG-Modding/ModUtil/releases/download/v2.7.0/ModUtil.zip"
oe = "https://github.com/AlexKage69/OlympusExtra/archive/refs/tags/v"+oe_version+".zip"
audio = "https://github.com/AlexKage69/OlympusExtra/releases/download/v"+oe_version+"/VO.fsb"

def wget(url, location, zipfile=True):
    fname = url.split("/")[-1]
    r = requests.get(url)
    open(fname , 'wb').write(r.content)
    if zipfile:
        shutil.unpack_archive(fname, location)
        os.remove(fname)
    else:
        shutil.move(fname, location+"/" + fname)

def cleanup():
    input("Press enter to exit")
    exit(0)

# Check if it's in the right location
pwd = os.getcwd()
pwd_split = pwd.split("\\")

if "Content" in os.listdir() and "Content" in pwd_split[-1]:
    print("Micrsoft Store version detected. Please place place the insallter in the Hades\Content\Content folder and run it again.")
    cleanup()
elif "Content" not in pwd_split[-1] or "Hades" not in pwd_split[-2]:
    print("The installer is in the wrong directory. Please ensure that it's in the Content folder of the Hades directory")
    cleanup()

if pwd_split[-2] != "Hades" and  pwd_split[-3] != "Hades": 
    print("You seriously pirated the game? You should buy the game and support the devs :(")

# Check if latest version is installed
oe_name = next((x for x in os.listdir("./Mods") if "OlympusExtra" in x), "")
if oe_version in oe_name:
    print("Latest version has already been installed!")
    cleanup()
    
print("Updating prerequisites for mod...")
print("Forcing modimporter update...")
wget(modimporter, ".")

if not os.path.isdir("./Mods"):
    print("Mods folder is not created. Creating a new folder.")
    os.mkdir("Mods")

print("Forcing ModUtil update...")
if os.path.isdir("./Mods/ModUtil"):
    shutil.rmtree("./Mods/ModUtil")

wget(modutil, "./Mods")

print("Pre-requisites installed.")


if oe_name == "":
    print("Beginning a fresh installation of OlympusExtra...")
else: 
    print("OlympusExtra has been detected in the Mods folder. Updating OlympusExtra...")
    shutil.rmtree("./Mods/" + oe_name)


wget(oe, "./Mods")
oe_name = next(x for x in os.listdir("./Mods") if "OlympusExtra" in x)

print("Adding voicelines... (it's a hefty file, sorry)")
wget(audio, "./Mods/" + oe_name + "/Audio/", zipfile=False)

print("Running modimporter... (This may take some time.)")
os.startfile("modimporter.exe")
print("Installation is finished when the popup window prints (Press ENTER/RETURN to end program)")
cleanup()