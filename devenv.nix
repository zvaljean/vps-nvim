{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  packages = builtins.attrValues {
    inherit
      (pkgs)
      tree-sitter
      gcc
      # curl
      gnutar
      shfmt
      alejandra
      prettier
      stylua
      ;
  };

  env.NVIM_APPNAME = "nvim-lab";

  languages.lua.enable = true;

  scripts.fmt.exec = ''
    treefmt "$@";
  '';

  scripts.nck.exec = ''
    nvim --headless "+qa";
  '';

  scripts.nvim-install.exec = ''
    nvim --headless '+lua require("nvim-treesitter").install({"lua",
    "markdown",
    "json",
    "jsonc",
    "markdown_inline",
    "nix",
    "vim",
    "vimdoc",
    "query"}):wait(300000)'  '+qa'
  '';

  treefmt = {
    enable = true;
    # config.settings.excludes = [
    #   "context-org/*"
    #   "deveops/*"
    #   "old/*"
    # ];
    config.programs = {
      alejandra = {
        enable = true;
        includes = [
          "devenv.nix"
          "devops/**/*.nix"
        ];
      };
      stylua = {
        enable = true;
        includes = [
          "init.lua"
          "lua/**/*.lua"
        ];
      };
    };
  };
}
