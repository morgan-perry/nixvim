{
  plugins.fzf-lua = {
    enable = true;
    profile = "telescope";
    keymaps = {
      "<leader>/" = "live_grep";
      "<C-s>" = "grep_curbuf";
      "<leader>pf" = "git_files";
      "<leader>f" = "files";
      "<leader>ps" = "lsp_workspace_symbols";
      "<leader>si" = "lsp_document_symbols";
      "<leader>ca" = "lsp_code_actions";
      "gr" = "lsp_references";
      "<leader>b" = "buffers";
    };
  };
}
