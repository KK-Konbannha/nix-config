{ config, pkgs, ...}:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  console.keyMap = "jp106";
  time.timeZone = "Asia/Tokyo";
  i18n.defaultLocale = "ja_JP.UTF-8";

  services.openssh.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.zsh.enable = true;

  users.users.alice = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    initialPassword = "test";
  };
  users.users.alice.shell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    git
  ];

  system.stateVersion = "24.05";
}
