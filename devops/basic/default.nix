{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  packages = [
    pkgs.tree-sitter
    pkgs.gcc
    pkgs.curl
    pkgs.gnutar
  ];

  env.NVIM_APPNAME = "nvim-lab";

  languages.lua.enable = true;

  scripts.fmt.exec = ''
    treefmt "$@";
  '';

  scripts.nck.exec = ''
    nvim --headless "+qa";
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
