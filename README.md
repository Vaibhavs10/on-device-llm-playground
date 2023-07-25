# llama-playground
A repo with scripts to test and play around with Facebook's recent llama models! 🤗

To get started first, make sure to clone the `llama.cpp` repo.
```bash
git clone https://github.com/ggerganov/llama.cpp.git

cd llama.cpp
```

To be able to use Neural Engine on your Apple device make sure to build with `LLAMA_METAL` flag.

```bash
LLAMA_METAL=1 make
```

We'll use a 4-bit quantised model. A high performant is gracefully hosted by [TheBloke](https://huggingface.co/TheBloke).

```bash
export MODEL=llama-2-13b-chat.ggmlv3.q4_0.bin
wget "https://huggingface.co/TheBloke/Llama-2-13B-chat-GGML/resolve/main/${MODEL}"
```

That's it, now we are ready to test the model out! 🚀

```bash
./ggml_metal.sh llama-2-13b-chat.ggmlv3.q4_0.bin system_prompts/good_chatbot.txt Hey!
```

The above command will instantiate a session to chat with llama. It'll initialise with the system prompt provided by you. You can look at the system prompt in the `system_prompts` folder. Feel free to tweak it!
