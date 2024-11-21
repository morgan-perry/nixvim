{
  keymaps = [
    {
      action = ":";
      key = "  ";
    }
    {
      action = ":b#<CR>";
      key = "<leader>`";
      mode = "n";
      options.silent = true;
    }
    {
      action = "<C-W>";
      key = "<leader>w";
      mode = "n";
      options.silent = true;
    }
    {
      action = "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>";
      key = "<leader>u";
      mode = "n";
      options.silent = true;
    }
    {
      action = ":w<CR>";
      key = "<C-x><C-s>";
      options.silent = true;
    }
  ];
}
