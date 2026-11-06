NVIM :=  nvim

.PHONY: treesitter-install nvim-check check

check: nvim-check

treesitter-install:
	$(NVIM) --headless '+lua require("nvim-treesitter").install({"lua", "markdown", "json", "jsonc", "markdown_inline", "nix", "vim", "vimdoc", "query"}):wait(300000)' '+qa'

nvim-check:
	$(NVIM) --headless '+qa'

