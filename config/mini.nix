{
  lib,
  config,
  ...
}:
{
  plugins = {
    mini = {
      enable = true;
      mockDevIcons = true; # NOTE: Fixes web-devicons.enable warning
      modules = {
        pairs = { };
        surround = { };
        ai = { };
        move = { };
        comment = { };
        files = { };
        hipatterns = { };
        jump = { };
        jump2d = { };
        statusline = { };
        icons = { };
        sessions = {
          autoread = true;
          autowrite = true;
        };
      };
    };
  };

  keymaps = lib.mkIf config.plugins.mini.enable [
    {
      action = "<cmd>lua MiniFiles.open()<CR>";
      key = "<leader>o";
      mode = "n";
    }
  ];
}
