import os
from glob import glob
from PIL import Image
from tqdm import tqdm


images = glob("images/*")
for image in tqdm(images):
    im = Image.open(image).resize((512,512))
    name = image.split("images/")[-1]
    im.save(os.path.join("resize_images", name))