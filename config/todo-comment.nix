{
  lib,
  config,
  ...
}:
{
  # NOTE: No todoFzfLua in nixvim atm
  keymaps = lib.mkIf config.plugins.todo-comments.enable [
    {
      mode = "n";
      key = "<leader>tf";
      action = "<cmd>TodoFzfLua<CR>";
      options = {
        desc = "Todo FzfLua";
      };
    }
    {
      mode = "n";
      key = "<leader>tl";
      action = "<cmd>TodoLocList<CR>";
      options = {
        desc = "Todo Location List";
      };
    }
  ];

  plugins.todo-comments = {
    enable = true;

    keymaps = {
      # TODO: Look at trouble for diagnostics
      # todoTrouble.key = "<leader>xq";
    };
    settings = {
      # Taken from nixvim example
      keywords = {
        FIX = {
          alt = [
            "FIXME"
            "BUG"
            "FIXIT"
            "ISSUE"
          ];
          color = "error";
          icon = " ";
        };
        HACK = {
          color = "warning";
          icon = " ";
        };
        NOTE = {
          alt = [
            "INFO"
          ];
          color = "hint";
          icon = " ";
        };
        PERF = {
          alt = [
            "OPTIM"
            "PERFORMANCE"
            "OPTIMIZE"
          ];
          icon = " ";
        };
        TEST = {
          alt = [
            "TESTING"
            "PASSED"
            "FAILED"
          ];
          color = "test";
          icon = "⏲ ";
        };
        TODO = {
          icon = " ";
        };
        WARN = {
          alt = [
            "WARNING"
            "XXX"
          ];
          color = "warning";
          icon = " ";
        };
      };
    };
  };
}
