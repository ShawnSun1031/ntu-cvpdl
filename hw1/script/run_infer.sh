# python inference.py --image_path dataset/origin_dataset/valid/images/ --model_path train/custom-model -o infere_test_1.json --confience_threshold 0.7 --iou_threshold 0.7
# python inference/eval_new.py infere_test_1.json  inference/valid_target.json > test_1.txt
# python inference.py --image_path dataset/origin_dataset/valid/images/ --model_path train/custom-model -o infere_test_2.json --confience_threshold 0.6 --iou_threshold 0.3
# python inference/eval_new.py infere_test_2.json  inference/valid_target.json > test_2.txt
# python inference.py --image_path dataset/origin_dataset/valid/images/ --model_path train/custom-model -o infere_test_3.json --confience_threshold 0.5 --iou_threshold 0.3
# python inference/eval_new.py infere_test_3.json  inference/valid_target.json > test_3.txt
# python inference.py --image_path dataset/origin_dataset/valid/images/ --model_path train/custom-model -o infere_test_4.json --confience_threshold 0.4 --iou_threshold 0.3
# python inference/eval_new.py infere_test_4.json  inference/valid_target.json > test_4.txt
# python inference.py --image_path dataset/origin_dataset/valid/images/ --model_path train/custom-model -o infere_test_5.json --confience_threshold 0.3 --iou_threshold 0.3
# python inference/eval_new.py infere_test_5.json  inference/valid_target.json > test_5.txt
# python inference.py --image_path dataset/origin_dataset/valid/images/ --model_path train/custom-model -o infere_test_6.json --confience_threshold 0.5 --iou_threshold 0.6
# python inference/eval_new.py infere_test_6.json  inference/valid_target.json > test_6.txt
# python inference.py --image_path dataset/origin_dataset/valid/images/ --model_path train/custom-model -o infere_test_7.json --confience_threshold 0.5 --iou_threshold 0.5
# python inference/eval_new.py infere_test_7.json  inference/valid_target.json > test_7.txt
# python inference.py --image_path dataset/origin_dataset/valid/images/ --model_path train/custom-model -o infere_test_8.json --confience_threshold 0.5 --iou_threshold 0.4
# python inference/eval_new.py infere_test_8.json  inference/valid_target.json > test_8.txt
# python inference.py --image_path dataset/origin_dataset/valid/images/ --model_path train/custom-model -o infere_test_9.json --confience_threshold 0.8 --iou_threshold 0.7
# python inference/eval_new.py infere_test_9.json  inference/valid_target.json > test_9.txt
# python inference.py --image_path dataset/origin_dataset/valid/images/ --model_path train/custom-model -o infere_test_10.json --confience_threshold 0.85 --iou_threshold 0.7
# python inference/eval_new.py infere_test_10.json  inference/valid_target.json > test_10.txt
# python inference.py --image_path dataset/origin_dataset/valid/images/ --model_path train/custom-model -o infere_test_11.json --confience_threshold 0.9 --iou_threshold 0.7
# python inference/eval_new.py infere_test_11.json  inference/valid_target.json > test_11.txt
# python inference.py --image_path dataset/origin_dataset/valid/images/ --model_path train/custom-model -o infere_test_12.json --confience_threshold 0.95 --iou_threshold 0.7
# python inference/eval_new.py infere_test_12.json  inference/valid_target.json > test_12.txt
# python inference.py --image_path dataset/origin_dataset/valid/images/ --model_path train/custom-model -o infere_test_13.json --confience_threshold 0.95 --iou_threshold 0.3
# python inference/eval_new.py infere_test_13.json  inference/valid_target.json > test_13.txt
# python inference.py --image_path dataset/origin_dataset/valid/images/ --model_path train/lightning_logs/version_17/checkpoints -o infere_test_14.json --confience_threshold 0.5 --iou_threshold 0.5
# python inference/eval_new.py infere_test_14.json  inference/valid_target.json > test_14.txt
# python inference.py --image_path dataset/origin_dataset/valid/images/ --model_path train/best-model -o infere_test_17.json --confience_threshold 0.8 --iou_threshold 0.5
# python inference/eval_new.py infere_test_17.json  inference/valid_target.json > test_17.txt
python inference.py --image_path dataset/origin_dataset/valid/images/ --model_path train/best-model -o infere_test_21.json --confience_threshold 0.9 --iou_threshold 0.5
python inference/eval_new.py infere_test_21.json  inference/valid_target.json > test_21.txt
python inference.py --image_path dataset/origin_dataset/valid/images/ --model_path train/best-model -o infere_test_22.json --confience_threshold 0.95 --iou_threshold 0.5
python inference/eval_new.py infere_test_22.json  inference/valid_target.json > test_22.txt
python inference.py --image_path dataset/origin_dataset/valid/images/ --model_path train/best-model -o infere_test_23.json --confience_threshold 0.99 --iou_threshold 0.5
python inference/eval_new.py infere_test_23.json  inference/valid_target.json > test_23.txt
python inference.py --image_path dataset/origin_dataset/valid/images/ --model_path train/best-model -o infere_test_24.json --confience_threshold 0.95 --iou_threshold 0.3
python inference/eval_new.py infere_test_24.json  inference/valid_target.json > test_24.txt
python inference.py --image_path dataset/origin_dataset/valid/images/ --model_path train/best-model -o infere_test_25.json --confience_threshold 0.95 --iou_threshold 0.7
python inference/eval_new.py infere_test_25.json  inference/valid_target.json > test_25.txt