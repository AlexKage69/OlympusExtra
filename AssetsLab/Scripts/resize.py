import os
from PIL import Image, ImageOps, ImageEnhance
from PIL.ImageColor import getcolor, getrgb
from PIL.ImageOps import grayscale


input_folder = "Tinted"
output_folder = "Resized"

def save_img(src, output_path):
    # src.show()
    src.save(output_path)


for filename in os.listdir(output_folder):
    f = os.path.join(output_folder, filename)
    # checking if it is a file
    if os.path.isfile(f):
        os.remove(f)

animation = []
new_animation = [] 
filenames = []
for filename in os.listdir(input_folder):
    f = os.path.join(input_folder, filename)
    # checking if it is a file
    if os.path.isfile(f):
        img = Image.open(f)
        animation.append(img)
        filenames.append(filename)

widths = [img.size[0] for img in animation]
heights = [img.size[1] for img in animation]
max_width = max(widths)
max_height = max(heights)
# print(widths)
# print(heights)
# print(max_width)
# print(max_height)

for img in animation:
    new_image = Image.new('RGBA', (max_width, max_height), (0, 0, 0, 0))
    left = (max_width - img.size[0]) // 2
    upper = (max_height - img.size[1]) // 2
    new_image.paste(img, (left, upper))
    new_animation.append(new_image)

for i in range(len(new_animation)):
    img = new_animation[i]
    filename = filenames[i]
    output_path = os.path.join(output_folder, filename)
    save_img(img, output_path)



