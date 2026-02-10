{ config, pkgs, username, ...}:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;

  boot.kernelParams = [
    "quiet"
    "splash"
    "loglevel=0"
    "systemd.show_status=auto"
    "rd.udev.log_level=3"
    "vt.global_cursor_default=0"
  ];

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

  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

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

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    ubuntu-classic
    font-awesome
  ];


  system.stateVersion = "24.05";
}
