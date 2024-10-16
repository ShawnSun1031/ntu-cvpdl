import argparse
import json
import os
from glob import glob

import cv2
import supervision as sv
import torch
from transformers import DetrForObjectDetection, DetrImageProcessor

from utils.config import id_mapping_table


def load_trained_model(model_path):
    # load trained-model
    global DEVICE, IMAGE_PROCESSOR, MODEL
    DEVICE = torch.device("cuda:0" if torch.cuda.is_available() else "cpu")
    checkpoint = model_path
    IMAGE_PROCESSOR = DetrImageProcessor.from_pretrained("facebook/detr-resnet-50")
    MODEL = DetrForObjectDetection.from_pretrained(checkpoint)
    MODEL.to(DEVICE)


def get_infer_results(image_path, confience_threshold, iou_threshold):
    # load images
    image = cv2.imread(image_path)

    # inference
    with torch.no_grad():
        # load image and predict
        inputs = IMAGE_PROCESSOR(images=image, return_tensors="pt").to(DEVICE)
        outputs = MODEL(**inputs)

        # post-process

        target_sizes = torch.tensor([image.shape[0:2]]).to(DEVICE)
        results = IMAGE_PROCESSOR.post_process_object_detection(
            outputs=outputs, threshold=confience_threshold, target_sizes=target_sizes
        )[0]

    # annotate
    detections = sv.Detections.from_transformers(transformers_results=results).with_nms(
        threshold=iou_threshold
    )

    # labels = [f"{ori_id2label[class_id]} {confidence:.2f}" for _, confidence, class_id, _ in detections]
    # frame = box_annotator.annotate(scene=image.copy(), detections=detections, labels=labels)
    # sv.show_frame_in_notebook(frame, (16, 16))
    return detections


def output_json(
    model_path,
    output_json_path,
    image_path,
    confience_threshold,
    iou_threshold,
):
    # load trained-model
    load_trained_model(model_path)

    # output to hw1 json format
    infer_anwser: dict = {}
    image_paths = glob(
        os.path.join("dataset", "origin_dataset", "valid", "images", "*")
    )

    for idx, single_image_path in enumerate(image_paths):
        print(f"[{idx}] Now infer at {image_path}...")
        try:
            detections = get_infer_results(
                single_image_path,
                confience_threshold,
                iou_threshold,
            )
            image_name = single_image_path.split("/")[-1]
            infer_anwser[f"{image_name}"] = {
                "boxes": detections.xyxy.tolist(),
                "labels": [
                    id_mapping_table[class_id]
                    for class_id in detections.class_id.tolist()
                ],
            }
        except Exception:
            print("pass")
            pass
    with open(output_json_path, "w") as f:
        json.dump(infer_anwser, f, indent=4)


if __name__ == "__main__":
    # Parse command line arguments
    parser = argparse.ArgumentParser(
        description="Produces predictions by the pre-trained model."
    )
    parser.add_argument(
        "-p", "--image_path", type=str, help="Path to the inference image."
    )
    parser.add_argument("--model_path", type=str, help="Path to the model path.")
    parser.add_argument(
        "-o", "--output_json_path", type=str, help="Path to the inference image."
    )

    parser.add_argument(
        "-r",
        "--root",
        type=str,
        default=os.getcwd(),
        help="Path to the root directory.",
    )
    parser.add_argument(
        "-c",
        "--confience_threshold",
        type=float,
        default=0.5,
        help="Path to the ground truth JSON file.",
    )
    parser.add_argument(
        "-i",
        "--iou_threshold",
        type=float,
        default=0.5,
        help="Path to the ground truth JSON file.",
    )

    args = parser.parse_args()

    root = args.root
    image_path = os.path.join(root, args.image_path)
    model_path = os.path.join(root, args.model_path)
    confience_threshold = args.confience_threshold
    iou_threshold = args.iou_threshold
    output_json_path = os.path.join(args.output_json_path)
    output_json(
        model_path, output_json_path, image_path, confience_threshold, iou_threshold
    )
