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
    }
    {
      action = "<C-W>";
      key = "<leader>w";
      mode = "n";
    }
    {
      action = "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>";
      key = "<leader>u";
      mode = "n";
    }
    {
      action = ":w<CR>";
      key = "<C-x><C-s>";
    }
  ];
}
