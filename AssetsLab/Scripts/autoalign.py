import json
from PIL import Image
import os 

files = ["Fx_MineExplosion145.atlas.json", "Fx_MineExplosion146.atlas.json", "Fx_MineExplosion147.atlas.json"]
input_dir = directory = '../OGAssets/MineExplosion'
output_dir = "Aligned"

def save_img(src, output_path):
    # src.show()
    src.save(output_path)

for file in files: 
    f = open(file)
    data = json.load(f)

    for entry in data['subAtlases']:
        #print(entry)

        name = entry['name'].split("\\")[-1] + ".png"
        #print(name)

        img = Image.open(os.path.join(input_dir, name))

        max_width = entry['originalSize']['x']
        max_height = entry['originalSize']['y']
        left = entry['topLeft']['x']
        upper = entry['topLeft']['y']

        new_image = Image.new('RGBA', (max_width, max_height), (0, 0, 0, 0))
        new_image.paste(img, (left, upper))
        output_path = os.path.join(output_dir, name)
        save_img(new_image, output_path)

