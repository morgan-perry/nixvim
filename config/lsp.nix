{
  pkgs,
  lib,
  config,
  ...
}:
{
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
          # buffer = "[buffer]";
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
        windows.documentation = {
          auto_show = false;
        };
        highlight = {
          use_nvim_cmp_as_default = true;
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
        trigger = {
          signature_help = {
            enabled = true;
          };
        };
        sources = {
          completion = {
            enabled_providers = [
              "lsp"
              "path"
              "snippets"
              # enable to have text completion
              # "buffer"
            ];
          };
        };
      };
    };

    lsp = {
      enable = true;
      servers = {
        # TODO: Investigate why this won't use home-manager options
        nixd = {
          enable = true;
          settings =
            let
              # NOTE: Customize with your nixos flake path
              flake = ''(builtins.getFlake \"/home/moogly/.dot/flake.nix\")'';
              system = "\${builtins.currentSystem}";
            in
            {
              # A backup for conform
              formatting.command = [ (lib.getExe pkgs.nixfmt-rfc-style) ];
              nixpkgs.expr = "import ${flake}.inputs.nixpkgs { }";
              options = {
                nixos.expr = "${flake}.nixosConfigurations.lit.options";
                nixvim.expr = "${flake}.packages.${pkgs.system}.nvim.options";
                home-manager.expr = "${flake}.homeConfigurations.lit.options";
              };
            };
        };
        zls.enable = true;
        gopls.enable = true;
        pyright.enable = true;
        clangd.enable = true;
        html.enable = true;
        ts_ls.enable = true;
        tailwindcss.enable = true;
        racket_langserver.enable = true;
        racket_langserver.package = null;
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
