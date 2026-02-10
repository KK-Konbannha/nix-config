{ config, pkgs, ... }:

{
  home.username = "alice";
  home.homeDirectory = "/home/alice";
  home.stateVersion = "25.11";

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
    sheldon
  ];

  home.file.".config/nvim".source = ../dotfiles/.config/nvim;
  home.file.".config/zsh".source = ../../dotfiles/.config/zsh;
  home.file.".config/sheldon".source = ../../dotfiles/.config/sheldon;

  home.file.".zshenv".source = ../../dotfiles/.zshenv;
}
