{pkgs, ...}: {
  # Append all your configuration modules here
  imports = [
    ./opts.nix
    ./keymaps.nix
    ./lsp.nix
    ./git.nix
    ./fzf-lua.nix
    ./mini.nix
    ./harpoon.nix
    ./ufo.nix
    ./conform.nix
    ./yazi.nix
    ./toggleterm.nix
    ./todo-comment.nix
    ./competitest.nix
  ];
  plugins = {
    flash.enable = true;
    nix.enable = true;
    undotree.enable = true;
    friendly-snippets.enable = true;
    which-key.enable = true;
    zig = {
      enable = true;
      settings.fmt_autosave = 0; # Does this work with nvim-conform? nope
    };
  };
}
