{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    neovim

    (writeShellScriptBin "vim" ''
      exec ${pkgs.neovim}/bin/nvim "$@"
    '')

  ];
}
