# pwas/wvd.nix
# Windows Virtual Desktop PWA desktop entry
{ pkgs, ... }:

{
  xdg.desktopEntries.wvd = {
    name = "Windows Virtual Desktop";
    exec = "${pkgs.chromium}/bin/chromium --app=https://client.wvd.microsoft.com";
    icon = "remote-desktop";
    terminal = false;
    type = "Application";
    categories = [ "Network" "RemoteAccess" ];
    startupNotify = true;
  };
}
