{pkgs, ...}: {
  # Append all your configuration modules here
  imports = [./opts.nix ./keymaps.nix ./lsp.nix ./git.nix ./fzf-lua.nix ./mini.nix ./harpoon.nix ./ufo.nix ./conform.nix ./yazi.nix ./toggleterm.nix ./todo-comment.nix];
  plugins = {
    flash.enable = true;
    nix.enable = true;
    friendly-snippets.enable = true;
    which-key.enable = true;
    undotree.enable = true;
  };
}
