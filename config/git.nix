{
  plugins = {
    neogit.enable = true;
    gitsigns = {
      enable = true;

      settings = {
        current_line_blame = false;

        current_line_blame_opts = {
          delay = 500;

          ignore_blank_lines = true;
          ignore_whitespace = true;
          virt_text = true;
          virt_text_pos = "eol";
        };

        signcolumn = true;
      };
    };
  };
}
