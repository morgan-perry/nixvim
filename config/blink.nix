{
  plugins.blink-cmp = {
    enable = true;
    settings = {
      completion = {
        accept = {
          auto_brackets = {
            enabled = false;
            semantic_token_resolution = {
              enabled = false;
            };
          };
        };
        documentation = {
          auto_show = false;
        };
      };
      keymap = {
        "<C-e>" = [ "hide" ];
        "<C-n>" = [
          "select_next"
          "fallback"
        ];
        "<C-p>" = [
          "select_prev"
          "fallback"
        ];
        "<C-space>" = [
          "show"
          "show_documentation"
          "hide_documentation"
        ];
        "<C-y>" = [ "select_and_accept" ];
        "<S-Tab>" = [
          "snippet_backward"
          "fallback"
        ];
        "<Tab>" = [
          "select_and_accept"
          "snippet_forward"
          "fallback"
        ];
      };
      signature = {
        enabled = true;
      };
      sources = {
        # Disables blink in commandline
        cmdline = [ ];
        default = [
          "lsp"
          "path"
          "snippets"
        ];
        providers = {
          lsp = {
            fallbacks = [ ];
          };
        };
      };
    };
  };
}
