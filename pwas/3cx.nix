# pwas/3cx.nix
# 3CX PWA desktop entry
{ pkgs, ... }:
let
  urls = import ../secrets/urls.nix;
in
{
  xdg.desktopEntries.tcx = {
    name = "3CX";
    exec = "${pkgs.chromium}/bin/chromium --app=${urls.threecx}";
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
