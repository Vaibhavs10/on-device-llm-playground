# Clone llama.cpp
# Copied with minimal changes from https://gist.github.com/adrienbrault/b76631c56c736def9bc1bc2167b5d129

git clone https://github.com/ggerganov/llama.cpp.git
cd llama.cpp

# Build it
LLAMA_METAL=1 make

# Download model
export MODEL=llama-2-13b-chat.ggmlv3.q4_0.bin
wget "https://huggingface.co/TheBloke/Llama-2-13B-chat-GGML/resolve/main/${MODEL}"

# Run
echo "Prompt: " \
    && read PROMPT \
    && ./main \
        -t 8 \
        -ngl 1 \
        -m ${MODEL} \
        --color \
        -c 4096 \
        --temp 0.7 \
        --repeat_penalty 1.1 \
        -n -1 \
        -p "### Instruction: ${PROMPT} \n### Response:"
