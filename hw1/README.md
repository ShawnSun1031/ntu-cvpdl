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
pip install uv
```
```sh=
uv sync
```
- activate venv
```sh=
source .venv/bin/activate
```

## Steps
1. Train DETR model by using 4070Ti for 80 epochs. Detailed training setting, please see [train/train_huggingface_detr_on_custom_data.ipynb](https://github.com/ShawnSun1031/ntu-cvpdl/blob/main/hw1/train/train_huggingface_detr_on_custom_dataset.ipynb).
    - the original data set can be downloaded [here](https://drive.google.com/file/d/1lWdAdjRvQHULW2AbDeZiR-S4Qw5SQ3nE/view)
    - however, according to the [roboflow colab](https://colab.research.google.com/github/roboflow-ai/notebooks/blob/main/notebooks/train-huggingface-detr-on-custom-dataset.ipynb), uploading my custom data set to roboflow universe. 
        - preprocess: stretch resize to 1024*1024
        - augmentation: flip(horizontal), blur (1.5px)
        - processed dataset can be downloaded by
            - Jupyter
                ```
                !pip install roboflow

                from roboflow import Roboflow
                rf = Roboflow(api_key="T0BjMN6ZWjFYYXId6oOe")
                project = rf.workspace("chsunpcvpdlproject").project("cvpdl-hw1-g9ehq")
                version = project.version(7)
                dataset = version.download("coco")
                ```
            - Terminal
                ```
                curl -L "https://app.roboflow.com/ds/bV0U8ErUYL?key=S4jyQnD4xr" > roboflow.zip;
                unzip roboflow.zip;
                rm roboflow.zip     
                ```
    - the pre-trained model can be downloaded [here](https://drive.google.com/drive/folders/1dkIy2tJewcqIJGWV4-sxqnNmCPvQgK4d?usp=sharing)
2. Use `inference.py` to produce the prediction of each dataset.
    - produce valid.json & test.json 
    ```sh=
    python inference.py \
    --image_path {your_valid_images_path} \
    --model_path {your_model_path} \
    -o valid.json \
    --confience_threshold 0.95 \
    --iou_threshold 0.5
    ```
3. Calculate mAP by `eval.py`
    ```sh=
    python inference/eval.py \
    valid.json  \
    inference/valid_target.json
    ```


## Results

currently, `valid_r10945004.json` got 0.4659 mAP