{ config, pkgs, lib, ... }:

{
  home.username = "alice";
  home.homeDirectory = "/home/alice";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
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

    wezterm
  ];

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    videos = null;
    templates = null;
    publicShare = null;
    pictures = "${config.home.homeDirectory}/Pictures";
    music = "${config.home.homeDirectory}/Music";
    download = "${config.home.homeDirectory}/Downloads";
    documents = "${config.home.homeDirectory}/Documents";
    desktop = null;
  };

  xdg.configFile = {
    "nvim" = {
      source = ../../dotfiles/.config/nvim;
      recursive = true;
    };
    "zsh" = {
      source = ../../dotfiles/.config/zsh;
      recursive = true;
    };
    "sheldon" = {
      source = ../../dotfiles/.config/sheldon;
      recursive = true;
    };
    "hypr" = {
      source = ../../dotfiles/.config/hypr;
      recursive = true;
    };
    "waybar" = {
      source = ../../dotfiles/.config/waybar;
      recursive = true;
    };
    "fontconfig" = {
      source = ../../dotfiles/.config/fontconfig;
      recursive = true;
    };
    "libskk" = {
      source = ../../dotfiles/.config/libskk;
      recursive = true;
    };
    "wezterm" = {
      source = ../../dotfiles/.config/wezterm;
      recursive = true;
    };
    "rofi" = {
      source = ../../dotfiles/.config/rofi;
      recursive = true;
    };
  };

  home.file.".zshenv".source = ../../dotfiles/.zshenv;

  wayland.windowManager.hyprland.systemd.enable = false;
}
