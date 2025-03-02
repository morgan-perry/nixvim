{
  # Append all your configuration modules here
  imports = [
    ./opts.nix
    ./keymaps.nix
    ./lsp.nix
    ./git.nix
    ./fzf-lua.nix
    ./mini.nix
    ./ufo.nix
    ./conform.nix
    ./yazi.nix
    ./todo-comment.nix
    ./competitest.nix
  ];

  plugins = {
    undotree.enable = true;
    friendly-snippets.enable = true;
    which-key.enable = true;
    trouble.enable = true;
    nix.enable = true;
    zig.enable = true;
    haskell-scope-highlighting.enable = true;
  };
}
