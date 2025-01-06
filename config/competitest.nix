{
  config,
  lib,
  ...
}:
{
  plugins.competitest = {
    enable = true;
    settings = {
      compile_command = {
        cpp = {
          args = [
            "-DLOCAL"
            "$(FNAME)"
            "-o"
            "$(FNOEXT)"
            "-Wall"
            "-Wextra"
          ];
          exec = "g++";
        };
      };
      run_command = {
        cpp = {
          exec = "./$(FNOEXT)";
        };
      };
      evaluate_template_modifiers = true;
      received_problems_path = "$(HOME)/doc/pgrm/cp/$(JUDGE)/$(CONTEST)/$(PROBLEM)/main.$(FEXT)";
      template_file = "$(HOME)/doc/pgrm/cp/templates/template.$(FEXT)";
    };
  };
  keymaps = lib.optionals config.plugins.competitest.enable [
    {
      mode = "n";
      key = "<leader>pr";
      action = ":CompetiTest run<CR>";
      options = {
        desc = "Comp run";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>pe";
      action = ":CompetiTest edit_testcase<CR>";
      options = {
        desc = "Comp edit testcase";
        # silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>pa";
      action = ":CompetiTest add_testcase<CR>";
      options = {
        desc = "Comp add testcase";
        # silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>pp";
      action = ":CompetiTest receive problem<CR>";
      options = {
        desc = "Comp delete testcase";
        # silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>pd";
      action = ":CompetiTest delete_testcase<CR>";
      options = {
        desc = "Comp delete testcase";
        # silent = true;
      };
    }
  ];
}
