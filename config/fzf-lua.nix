{
  plugins = {
    fzf-lua = {
      enable = true;
      keymaps = {
        "<leader>/" = "live_grep";
        "<leader>pf" = "git_files";
        "<leader>f" = "files";
        "<leader>ps" = "lsp_workspace_symbols";
        "<leader>si" = "lsp_document_symbols";
        "<leader>ca" = "lsp_code_actions";
        "<leader>b" = "buffers";
      };
    };
  };
}
