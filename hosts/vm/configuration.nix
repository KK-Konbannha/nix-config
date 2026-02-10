{ config, pkgs, username, ...}:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  console.keyMap = "jp106";
  time.timeZone = "Asia/Tokyo";
  i18n.defaultLocale = "ja_JP.UTF-8";

  services.openssh.enable = true;
  virtualisation.docker.enable = true;
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.zsh.enable = true;

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = ["wheel" "docker" "networkmanager"];
    initialPassword = "test";
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    git
    neovim

    (writeShellScriptBin "vim" ''
      exec ${pkgs.neovim}/bin/nvim "$@"
    '')

  ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";

    fcitx5.addons = with pkgs; [
      fcitx5-skk
      fcitx5-gtk
      qt6Packages.fcitx5-configtool
    ];
  };

  system.stateVersion = "24.05";
}
