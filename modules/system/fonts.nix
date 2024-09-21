{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    material-design-icons
    (nerdfonts.override { fonts = [
      "JetBrainsMono"
      "Mononoki"
      "SpaceMono"
    ]; })
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    corefonts
    vistafonts
    cascadia-code
    maple-mono-NF
    font-awesome
    twemoji-color-font
  ];
}
