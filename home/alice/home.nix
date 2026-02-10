{ config, pkgs, ... }:

{
  home.username = "alice";
  home.homeDirectory = "/home/alice";
  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    git
    neovim
    curl
    tree
    ripgrep
    fd
    bat
    fzf
    yazi
    btop
    lsd
    zoxide
    unzip
    fastfetch
    jq
    termshark
  ];
}
