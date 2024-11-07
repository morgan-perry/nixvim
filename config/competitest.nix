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
      received_problems_path = "$(HOME)/doc/cp/$(JUDGE)/$(CONTEST)/$(PROBLEM)/main.$(FEXT)";
      template_file = "$(HOME)/doc/cp/templates/template.$(FEXT)";
    };
  };
}
