from PIL import Image
import os
from transforms import RGBTransform

# path = 'Source/Apollo/DionysusProjectile/'
# newpath = 'Source/Apollo/ApolloProjectile/'

# for filename in os.listdir(path):
#     new_filename = 'Apollo' + filename[8:]
#     img = Image.open(path+filename)
#     img = img.convert('LA')
#     img = img.convert('RGBA')
#     img = RGBTransform().mix_with((255, 165, 0),factor=.30).applied_to(img)  

#     img.save(newpath + new_filename)

path = 'Source/Apollo/ApolloFire/'
newpath = 'Source/Apollo/ApolloFire/'

for filename in os.listdir(path):
    img = Image.open(path+filename)
    img = img.convert('LA')
    img = img.convert('RGBA')
    img = RGBTransform().mix_with((255, 255, 0),factor=.30).applied_to(img)  

    img.save(newpath + filename)