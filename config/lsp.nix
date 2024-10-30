{
  lib,
  config,
  ...
}: {
  plugins = {
    lsp-format.enable = lib.mkIf (!config.plugins.conform-nvim.enable) true;

    lspsaga = {
      enable = true;
      lightbulb.enable = false;
    };

    treesitter = {
      enable = true;

      # Breaks with combine plugins, this is experimental so may change in future
      # Even with hmts.nvim it breaks
      nixvimInjections = false;

      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
    };
    lspkind = {
      enable = true;
      cmp = {
        enable = true;
        menu = {
          nvim_lsp = "[LSP]";
          nvim_lua = "[api]";
          path = "[path]";
          luasnip = "[snip]";
          buffer = "[buffer]";
        };
      };
      extraOptions = {
        maxwidth = 50;
        ellipsis_char = "...";
      };
    };

    blink-cmp = {
      enable = true;
      settings = {
        accept = {
          auto_brackets = {
            enabled = false;
          };
        };
        documentation = {
          auto_show = false;
        };
        highlight = {
          use_nvim_cmp_as_default = true;
        };
        keymap = {
          accept = "<Tab>";
          hide = "<C-e>";
          hide_documentation = "<C-space>";
          scroll_documentation_down = "<C-f>";
          scroll_documentation_up = "<C-b>";
          select_next = "<C-n>";
          select_prev = "<C-p>";
          show = "<C-space>";
          show_documentation = "<C-space>";
          snippet_backward = "<S-Tab>";
          snippet_forward = "<Tab>";
        };
        trigger = {
          signature_help = {
            enabled = true;
          };
        };
      };
    };

    lsp = {
      enable = true;
      servers = {
        nixd = {
          enable = true;
          filetypes = ["nix"];
          autostart = true;
          settings = {
            nixpkgs.expr = "import <nixpkgs> { }";
            #formatting.command = ["nixfmt"];
          };
        };
        pyright.enable = true;
        clangd.enable = true;
        html.enable = true;
        ts_ls.enable = true;
        tailwindcss.enable = true;
      };
      keymaps.extra = [
        {
          action = "<CMD>LspStop<Enter>";
          key = "<leader>Lx";
        }
        {
          action = "<CMD>LspStart<Enter>";
          key = "<leader>Ls";
        }
        {
          action = "<CMD>LspRestart<Enter>";
          key = "<leader>Lr";
        }
        {
          # action = "Telescope lsp_definitions";
          action = "<CMD>Lspsaga goto_definition<Enter>";
          key = "gd";
        }
        {
          action = "<CMD>Lspsaga hover_doc<Enter>";
          key = "K";
        }
        {
          action = "<CMD>Lspsaga peek_definition<Enter>";
          key = "<leader>K";
        }
        {
          action = "<CMD>Lspsaga rename<Enter>";
          key = "<leader>cr";
        }
        {
          action = "<CMD>Lspsaga finder<Enter>";
          key = "<leader>cf";
        }
        {
          action = "<CMD>Lspsaga outline<Enter>";
          key = "<leader>co";
        }
        {
          action = "<CMD>Lspsaga outline<Enter>";
          key = "<leader>cf";
        }
      ];
    };
  };
}
