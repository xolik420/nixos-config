# modules/home-manager/desktop/wofi.nix
# User Wofi config
{ pkgs, ... }:

{
  programs.wofi = {
    enable = true;

    settings = {
      # Layout
      width = 600;
      height = 400;
      location = "center";
      show = "drun";
      prompt = "Search...";
      filter_rate = 100;
      allow_markup = true;
      no_actions = true;
      halign = "fill";
      orientation = "vertical";
      content_halign = "fill";
      insensitive = true;
      allow_images = true;
      image_size = 40;
      gtk_dark = true;

      # Behavior
      term = "kitty";
      hide_scroll = true;
      matching = "contains";
      key_expand = "Tab";

      # Columns
      columns = 1;
    };

    style = ''
      window {
        margin: 0px;
        border: 2px solid #1e1e2e;
        background-color: #1e1e2e;
        border-radius: 10px;
      }
 
      #input {
        margin: 5px;
        border: none;
        color: #cdd6f4;
        background-color: #313244;
        border-radius: 5px;
        padding: 10px;
      }
 
      #inner-box {
        margin: 5px;
        border: none;
        background-color: #1e1e2e;
      }
 
      #outer-box {
        margin: 5px;
        border: none;
        background-color: #1e1e2e;
      }
 
      #scroll {
        margin: 0px;
        border: none;
      }
 
      #text {
        margin: 5px;
        border: none;
        color: #cdd6f4;
      }
 
      #entry:selected {
        background-color: #45475a;
        border-radius: 5px;
      }
 
      #text:selected {
        color: #89b4fa;
      }
    '';
  };
}
