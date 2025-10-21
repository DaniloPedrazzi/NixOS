{ pkgs, lib, config, ... }:

let
  # Wallpaper Dim Settings
  inputImage = ../../wallpapers/wallpaper.png;
  brightness = -30;
  contrast = 0;
  fillColor = "black";
in
{
  stylix.enable = true;

  # Cursor
  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Classic";
  stylix.cursor.size = 24;

  # Fonts
  stylix.fonts = {
    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font Mono";
    };
    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };
  };

  # Wallpaper Color Picker
  stylix.image = pkgs.runCommand "dimmed-background.png" { } ''
    ${lib.getExe' pkgs.imagemagick "convert"} "${inputImage}" -brightness-contrast ${toString brightness},${toString contrast} -fill ${fillColor} $out
  '';
}