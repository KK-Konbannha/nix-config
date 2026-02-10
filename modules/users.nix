{ config, pkgs, username, ... }:

{
  programs.zsh.enable = true;

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = ["wheel" "docker" "networkmanager"];
    initialPassword = "test";
    shell = pkgs.zsh;
  };
}
