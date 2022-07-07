from PIL import Image
import numpy as np

depth = Image.open('/media/jianyu/dataset/messy-table-dataset/v12/training/0-0/depthL.png')
depth = np.array(depth)/1000
print(np.min(depth), np.max(depth), np.mean(depth))