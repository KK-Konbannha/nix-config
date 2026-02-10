{ config, pkgs, username, ...}:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  imports = [
    ../../modules/base.nix
    ../../modules/bootconf.nix
    ../../modules/docker.nix
    ../../modules/networking.nix
    ../../modules/pkgs.nix
    ../../modules/users.nix
    ../../modules/gui/fcitx5.nix
    ../../modules/gui/fonts.nix
    ../../modules/gui/hyprland.nix
    ../../modules/gui/sddm.nix
  ];
}
