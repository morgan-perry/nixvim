{
  # Import all your configuration modules here
  imports = [ ./lsp.nix ./bufferline.nix ./fzf-lua.nix ./opts.nix ./keymaps.nix ./mini.nix ./harpoon.nix];
  plugins = {
    flash.enable = true;
    nix.enable = true;
    friendly-snippets.enable = true;
    neogit.enable = true;
    which-key.enable = true;
    undotree.enable = true;
  };
}
