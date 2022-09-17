from PIL import Image, ImageOps, ImageEnhance
from PIL.ImageColor import getcolor, getrgb
from PIL.ImageOps import grayscale
import os

directory = 'Tinted'
output_dir = 'Tinted'



def save_img(src, output_path):
    # src.show()
    src.save(output_path)


for filename in os.listdir(directory):
    f = os.path.join(directory, filename)
    # checking if it is a file
    if os.path.isfile(f):
        img = Image.open(f)
        
        filename = filename.replace("Picture", "ArtemisExplosion00")
        output_path = os.path.join(output_dir, filename)
        save_img(img, output_path)
        # img.show()
