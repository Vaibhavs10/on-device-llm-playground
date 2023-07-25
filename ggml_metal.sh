#!/bin/bash

# The script should be launched like ./chat.sh models/llama-2-13b-chat.ggmlv3.q4_0.bin system_prompts/translation.txt Hello

# Load system prompt
SYSTEM_PROMPT=$(cat $2)

# Execute model
./main -m $1 -t 8 -ngl 1 --temp 0.7 -c 4096 -n -1 --repeat_penalty 1.1 --in-prefix-bos --in-prefix ' [INST] ' --in-suffix ' [/INST]' -i \
    -p "[INST] <<SYS>>\n$SYSTEM_PROMPT\n<</SYS>>\n\n$3 [/INST]"
