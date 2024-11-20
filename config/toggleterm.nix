{
  lib,
  config,
  ...
}:
{
  plugins.toggleterm = {
    enable = true;

    settings = {
      direction = "float";
    };
  };

  keymaps = lib.mkIf config.plugins.toggleterm.enable [
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>ToggleTerm<CR>";
      options = {
        desc = "Open Terminal";
      };
    }
  ];
}
