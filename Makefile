target := ollama
dc := docker compose


.PHONY: up
up:
	$(dc) up -d

.PHONY: watch-nvidia-smi
watch-nvidia-smi: up
	$(dc) exec $(target) watch -n1 nvidia-smi

.PHONY: ollama-pull
ollama-pull: up
	$(dc) exec -it ollama ollama pull $(MODEL)


ollama-chat: up
	$(dc) exec -it $(target) ollama run $(MODEL)