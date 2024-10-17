import argparse
import json
import os
from glob import glob

import cv2
import supervision as sv
import torch
from transformers import DetrForObjectDetection, DetrImageProcessor

from utils.config import id_mapping_table


def mapping_box_coordinate(
    boxes: list,
    image_path: str,
):
    orig_image = cv2.imread(image_path)

    height, width = orig_image.shape[:2]
    resize_width_factor = width / 1024
    resize_height_factor = height / 1024
    mapping_boxes = boxes.copy()
    for i in range(len(boxes)):
        mapping_boxes[i][0] = mapping_boxes[i][0] * resize_width_factor
        mapping_boxes[i][2] = mapping_boxes[i][2] * resize_width_factor
        mapping_boxes[i][1] = mapping_boxes[i][1] * resize_height_factor
        mapping_boxes[i][3] = mapping_boxes[i][3] * resize_height_factor

    return mapping_boxes


def load_trained_model(model_path):
    # load trained-model
    global DEVICE, IMAGE_PROCESSOR, MODEL
    DEVICE = torch.device("cuda:0" if torch.cuda.is_available() else "cpu")
    checkpoint = model_path
    IMAGE_PROCESSOR = DetrImageProcessor.from_pretrained("facebook/detr-resnet-50")
    MODEL = DetrForObjectDetection.from_pretrained(checkpoint)
    MODEL.to(DEVICE)


def get_infer_results(idx, image_path, confience_threshold, iou_threshold):
    print(
        f"[{idx}] Now infer at {image_path}... confience_threshold: {confience_threshold}"
    )
    if confience_threshold < 0.70:
        return None
    # load images
    image = cv2.imread(image_path)
    image = cv2.resize(image, (1024, 1024))

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
    try:
        detections = sv.Detections.from_transformers(
            transformers_results=results
        ).with_nms(threshold=iou_threshold)
    except Exception:
        detections = get_infer_results(
            idx, image_path, confience_threshold - 0.05, iou_threshold
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
    image_paths = glob(os.path.join(image_path, "*"))
    for idx, single_image_path in enumerate(image_paths):
        detections = get_infer_results(
            idx=idx,
            image_path=single_image_path,
            confience_threshold=confience_threshold,
            iou_threshold=iou_threshold,
        )
        image_name = single_image_path.split("/")[-1]
        if detections is None:
            mapping_boxes = []
            labels = []
        else:
            mapping_boxes = mapping_box_coordinate(
                boxes=detections.xyxy.tolist(), image_path=single_image_path
            )
            labels = [
                id_mapping_table[class_id] for class_id in detections.class_id.tolist()
            ]
        infer_anwser[f"{image_name}"] = {
            "boxes": mapping_boxes,
            "labels": labels,
        }
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
