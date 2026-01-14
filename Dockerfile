# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# Could not resolve the following unknown-registry custom nodes from the workflow (no aux_id provided):
RUN apt-get update && apt-get install -y git
RUN cd /comfyui/custom_nodes && git clone https://github.com/iSuneast/ComfyUI-WebhookNotifier.git

# --- FIX: Redirect output to Network Volume ---
# Usuwamy domyślny folder output w kontenerze
RUN rm -rf /comfyui/output

# Tworzymy skrót (symlink) kierujący do wolumenu
RUN ln -s /runpod-volume/outputs /comfyui/output
# - CheckpointLoaderSimple (no aux_id; skipped)
# - WebhookNotifierNode (no aux_id; skipped)

# download models into comfyui

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
