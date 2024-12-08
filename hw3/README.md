# ntu-cvpd3
ntu cvpdl project

## Environment

```sh=
conda create -n cvpdl-hw3 python=3.9
```
```sh=
conda activate cvpdl-hw3
```
```sh=
pip install uv
```
**Notice that due to the transformer package contradiction of `blip` and `gligen`**  
We have **two venvs** respectively, thus you need to sync two folder to build two venv
```sh=
uv sync
```
- activate venv
```sh=
source .venv/bin/activate
```

## How to run your code?
1. Image Captioning and Prompt Design  
    please check the [src/blip/blip_image_captioning.ipynb](src/blip/blip_image_captioning.ipynb)
2. Text-to-Image Generation
    ```=sh
    bash script/run_gligen_inference.sh

    # cd src/gligen
    # .venv/bin/python gligen_inference.py \
    # --ckpt gligen_checkpoints/checkpoint_generation_text.bin \
    # --label_json ../label_filled_blip2-flan-t5-xl.json \
    # --selected_prompt generated_text \
    # --folder generation_samples_blip2_opt_6_7b_coco_generated_text \
    # --text_only
    # cd ..
    ```
    Notice that the src/gligen is a hack from https://github.com/gligen/GLIGEN/tree/master

    For more details, please check the script [script/run_gligen_inference.sh](script/run_gligen_inference.sh) and the inference progroam [src/gligen/gligen_inference.py](src/gligen/gligen_inference.py)

## Evaluation
**Should resize all the images to 512*512 in advance**, please see [ref_dataset/resize_to_512.py](ref_dataset/resize_to_512.py)

```
python -m pytorch_fid ref_dataset/resize_images path/to/dataset2 --device cuda:0
```

<table>
    <tr>
        <td>   </td>
        <td colspan="2"> Text grounding </td>
        <td> Layout-to-Image </td>
    </tr>
    <tr>
        <td> prompt </td>
        <td> Template #1 </td>
        <td> Template #2 </td>
        <td> Template #3 </td>
    </tr>
    <tr>
        <td> FID </td>
        <td> 48.28 </td>
        <td>  </td>
        <td>  </td>
    </tr>
</table>