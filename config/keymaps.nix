{
  keymaps = [
    {
        action = ":";
        key = "  ";
    }  
    {
        action = ":b#<CR>";
        key = "<leader>`";
    }
    {
        action = "<C-W>";
        key = "<leader>w";
    }
    {
        action = "<cmd>lua MiniFiles.open()<CR>";
        key = "<leader>o";
    }
    {
        action = "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>";
        key = "<leader>u";
    }
    {
        action = "<cmd>Neogit<CR>";
        key = "<leader>gg";
    }
    {
        action = ":w<CR>";
        key = "<C-x><C-s>";
    }
    {
      action = "<CMD>lua vim.lsp.buf.format()<CR>";
      key = "<C-x><C-f>";
    }
  ];
}
