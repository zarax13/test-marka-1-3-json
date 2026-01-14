# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# Could not resolve the following unknown-registry custom nodes from the workflow (no aux_id provided):
RUN cd /comfyui/custom_nodes && git clone https://github.com/iSuneast/ComfyUI-WebhookNotifier.git
# - CheckpointLoaderSimple (no aux_id; skipped)
# - WebhookNotifierNode (no aux_id; skipped)

# download models into comfyui
RUN wget https://civitai.com/api/download/models/1920896?token=267414332a453552c51212744968977f -O "pony-realism.safetensors"

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
