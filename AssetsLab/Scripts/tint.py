from PIL import Image, ImageOps, ImageEnhance
from PIL.ImageColor import getcolor, getrgb
from PIL.ImageOps import grayscale
import os

color = '#cb5987' #'#d01480'
#directory = '../OGAssets/MineExplosion'
directory = 'Aligned'
output_dir = 'Tinted'
saturation_degree = 1 # 1
contrast_degree = 3 # 5
 
# iterate over files in
# that directory

def image_tint(src, tint='#ffffff'):
    src.load()
    r, g, b, alpha = src.split()
    gray = ImageOps.grayscale(src)
    # gray = ImageOps.autocontrast(gray)
    result = ImageOps.colorize(gray, (0, 0, 0, 0), tint) 
    result.putalpha(alpha)
    return result


def saturate(src, saturate=1):
    converter = ImageEnhance.Color(img)
    return converter.enhance(saturate)


def contrast(src, contrast=1):
    enhancer = ImageEnhance.Contrast(src)
    return enhancer.enhance(contrast)


def save_img(src, output_path):
    # src.show()
    src.save(output_path)


for filename in os.listdir(directory):
    f = os.path.join(directory, filename)
    # checking if it is a file
    if os.path.isfile(f):
        img = Image.open(f)
        
        img = image_tint(img, color)
        img =  saturate(img, saturation_degree)
        img = contrast(img, contrast_degree)
        # img =  saturate(img, saturation_degree)
        
        filename = filename.replace("Mine", "Artemis")
        output_path = os.path.join(output_dir, filename)
        save_img(img, output_path)
        # img.show()
