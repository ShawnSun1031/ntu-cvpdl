cd src/gligen
.venv/bin/python gligen_inference.py \
--ckpt gligen_checkpoints/checkpoint_generation_text.bin \
--label_json ../../generation/visualiztion_200_filled_blip2-flan-t5-xl.json \
--selected_prompt prompt_w_suffix \
--folder generation_visualiztion_200_filled_blip2-flan-t5-xl_prompt_w_suffix 
cd ../..

# ## template one (text-only)
# cd src/gligen
# .venv/bin/python gligen_inference.py \
# --ckpt gligen_checkpoints/checkpoint_generation_text.bin \
# --label_json ../label_filled_blip2-opt-6.7b-coco.json \
# --selected_prompt generated_text \
# --folder generation_samples_blip2_opt_6_7b_coco_generated_text \
# --text_only
# cd ../..

# # ## template one (text-only)
# cd src/gligen
# .venv/bin/python gligen_inference.py \
# --ckpt gligen_checkpoints/checkpoint_generation_text.bin \
# --label_json ../label_filled_blip2-opt-6.7b-coco.json \
# --selected_prompt prompt_w_suffix \
# --folder generation_samples_blip2_opt_6_7b_coco_prompt_w_suffix \
# --text_only
# cd ../..

# ## template one (text+layout)
# cd src/gligen
# .venv/bin/python gligen_inference.py \
# --ckpt gligen_checkpoints/checkpoint_generation_text.bin \
# --label_json ../label_filled_blip2-opt-6.7b-coco.json \
# --selected_prompt prompt_w_suffix \
# --folder generation_samples_blip2_opt_6_7b_coco_layout
# cd ../..


# ## template one (text-only)
# cd src/gligen
# .venv/bin/python gligen_inference.py \
# --ckpt gligen_checkpoints/checkpoint_generation_text.bin \
# --label_json ../label_filled_blip2-flan-t5-xl.json \
# --selected_prompt generated_text \
# --folder generation_samples_blip2-flan-t5-xl_generated_text \
# --text_only
# cd ../..

# ## template one (text-only)
# cd src/gligen
# .venv/bin/python gligen_inference.py \
# --ckpt gligen_checkpoints/checkpoint_generation_text.bin \
# --label_json ../label_filled_blip2-flan-t5-xl.json \
# --selected_prompt prompt_w_suffix \
# --folder generation_samples_blip2-flan-t5-xl_prompt_w_suffix \
# --text_only
# cd ../..

# ## template one (text+layout)
# cd src/gligen
# .venv/bin/python gligen_inference.py \
# --ckpt gligen_checkpoints/checkpoint_generation_text.bin \
# --label_json ../label_filled_blip2-flan-t5-xl.json \
# --selected_prompt prompt_w_suffix \
# --folder generation_samples_blip2-flan-t5-xl_layout
# cd ../..