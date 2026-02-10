{ config, ... }:

{
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
}
