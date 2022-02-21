from PIL import Image
import PIL.ImageOps    
import os

path = 'Source/Apollo/ProjectileFire/'
newpath = 'Source/Apollo/ApolloFire/'

for filename in os.listdir(path):
    img = Image.open(path+filename)    
    r,g,b,a = img.split()
    rgb_image = Image.merge('RGB', (r,g,b))
    inverted_image = PIL.ImageOps.invert(rgb_image)
    r2,g2,b2 = inverted_image.split()
    img = Image.merge('RGBA', (r2,g2,b2,a))
    img.save(newpath+filename)