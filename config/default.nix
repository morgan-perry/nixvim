{pkgs, ...}: {
  # Import all your configuration modules here
  imports = [./lsp.nix ./fzf-lua.nix ./opts.nix ./keymaps.nix ./mini.nix ./harpoon.nix ./ufo.nix ./conform.nix ./git.nix];
  plugins = {
    flash.enable = true;
    nix.enable = true;
    friendly-snippets.enable = true;
    which-key.enable = true;
    undotree.enable = true;
  };
}
