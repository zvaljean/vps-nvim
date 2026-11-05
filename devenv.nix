{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  imports = [
    ./devops/basic
  ];
}
