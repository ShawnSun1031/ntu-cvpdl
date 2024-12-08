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
```sh=
uv sync
```
- activate venv
```sh=
source .venv/bin/activate
```

## How to run your code?
1. Image Captioning and Prompt Design  
    please check the [src/blip_image_captioning.ipynb](src/blip_image_captioning.ipynb)
2. Text-to-Image Generation
    ```=sh
    bash script/run_gligen_inference.sh
    ```
    Notice that the src/gligen is a hack from https://github.com/gligen/GLIGEN/tree/master

    For more details, please check the script [script/run_gligen_inference.sh](script/run_gligen_inference.sh) and the inference progroam [gligen/gligen_inference.py](gligen/gligen_inference.py)

## Evaluation
**Should resize all the images to 512*512 in advance**, please see [ref_dataset/resize_to_512.py](ref_dataset/resize_to_512.py)

### FID

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