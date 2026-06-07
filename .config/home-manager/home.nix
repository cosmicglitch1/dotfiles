{ inputs, pkgs, ... }: {
  home.username = "decompile";
  home.homeDirectory = "/Users/decompile";
  home.stateVersion = "24.05";

  home.file = {
    "Pictures/Wallpapers/Gruvbox" = {
      source = inputs.gruvbox-wallpapers.packages."${pkgs.stdenv.hostPlatform.system}".default;
      recursive = true;
    };
  };

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}