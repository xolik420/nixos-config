# pwas/3cx.nix
# 3CX PWA desktop entry
{ pkgs, ... }:

{
  xdg.desktopEntries.tcx = {
    name = "3CX";
    exec = "${pkgs.chromium}/bin/chromium --app=https://creativetech.il.3cx.us/webclient";
    icon = "phone";
    terminal = false;
    type = "Application";
    categories = [
      "Network"
      "Telephony"
    ];
    startupNotify = true;
  };
}
