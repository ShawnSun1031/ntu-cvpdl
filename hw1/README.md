# ntu-cvpdl
ntu cvpdl project

## Environment

```sh=
conda create -n cvpdl-hw1 python=3.9
```
```sh=
conda activate cvpdl-hw1
```
```sh=
uv sync
```

## Steps
1. Train DETR model by using 4070Ti for 80 epochs. Detailed training setting, please see [train/train_huggingface_detr_on_custom_data.ipynb](https://github.com/ShawnSun1031/ntu-cvpdl/blob/main/hw1/train/train_huggingface_detr_on_custom_dataset.ipynb).
    - the data set can be downloaded [here](https://drive.google.com/file/d/1lWdAdjRvQHULW2AbDeZiR-S4Qw5SQ3nE/view)
    - the pre-trained model can be downloaded [here](https://drive.google.com/drive/folders/1bsdKuS4kwab59WVaerjARgv4I6f5tGx2)
2. Use `inference.py` to produce the prediction of each dataset.


## Results

currently, `valid_r10945004.json` got 0.28 mAP