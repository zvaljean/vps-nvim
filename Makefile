NVIM :=  nvim

.PHONY: treesitter-install formatters-check nvim-check check

check: nvim-check

treesitter-install:
	$(NVIM) --headless '+lua require("nvim-treesitter").install({"bash", "lua", "markdown", "json", "jsonc", "markdown_inline", "nix", "vim", "vimdoc", "query"}):wait(300000)' '+qa'

	devenv shell -- sh -c 'command -v shfmt && command -v alejandra && command -v prettier && command -v stylua'

nvim-check:
	$(NVIM) --headless '+qa'

