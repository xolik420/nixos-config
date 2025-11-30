# pwas/teams.nix
# Microsoft Teams PWA desktop entry
{ pkgs, ... }:

{
  xdg.desktopEntries.teams-pwa = {
    name = "Microsoft Teams";
    exec = "${pkgs.chromium}/bin/chromium --app=https://teams.microsoft.com/v2";
    icon = "teams";
    terminal = false;
    type = "Application";
    categories = [ "Network" "InstantMessaging" ];
    startupNotify = true;
  };
}
