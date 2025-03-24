{ pkgs, ... }:
let
  org-roam-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "org-roam-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "chipsenkbeil";
      repo = "org-roam.nvim";
      rev = "main"; # Or specify a specific commit/tag hash
      sha256 = ""; # You'll need to calculate this or let Nix error and tell you
    };
  };
in
{
  extraPlugins = [
    org-roam-nvim
  ];
}
