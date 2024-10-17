#!/bin/bash

declare -a conf_thresholds=("0.95" "0.9" "0.85" "0.8" "0.75" "0.7")
declare -a iou_thresholds=("0.5" "0.5" "0.5" "0.5" "0.5" "0.5")


for i in "${!conf_thresholds[@]}"; do
    conf_threshold=${conf_thresholds[$i]}
    iou_threshold=${iou_thresholds[$i]}
    model_path="train/best-model2"
    output_file="infere_test_$((i+1)).json"
    result_file="test_$((i+1)).txt"

    python inference.py --image_path dataset/origin_dataset/valid/images/ --model_path "$model_path" -o "$output_file" --confience_threshold "$conf_threshold" --iou_threshold "$iou_threshold"
    python inference/eval_new.py "$output_file" inference/valid_target.json > "$result_file"
done
