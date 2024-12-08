## template one (text-only)
python ./GLIGEN-master/gligen_inference.py \
--ckpt ./GLIGEN-master/gligen_checkpoints/checkpoint_generation_text.bin \
--label_json ./label_filled_blip2-opt-6.7b-coco.json \
--selected_prompt generated_text \
--output_folder GLIGEN-master/generation_samples_blip2_opt_6_7b_coco_generated_text \
--text_only \

## template one (text-only)
python ./GLIGEN-master/gligen_inference.py \
--ckpt ./GLIGEN-master/gligen_checkpoints/checkpoint_generation_text.bin \
--label_json ./label_filled_blip2-opt-6.7b-coco.json \
--selected_prompt prompt_w_suffix\
--output_folder GLIGEN-master/generation_samples_blip2_opt_6_7b_coco_prompt_w_suffix \
--text_only \

## template one (text+layout)
python ./GLIGEN-master/gligen_inference.py \
--ckpt ./GLIGEN-master/gligen_checkpoints/checkpoint_generation_text.bin \
--label_json ./label_filled_blip2-opt-6.7b-coco.json \
--selected_prompt prompt_w_suffix\
--output_folder GLIGEN-master/generation_samples_blip2_opt_6_7b_coco_layout \