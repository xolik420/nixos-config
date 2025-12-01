# modules/home-manager/programs/neovim.nix
# Neovim config via nixvim
{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    # ===================
    # General Settings
    # ===================
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      smartindent = true;
      wrap = false;
      ignorecase = true;
      smartcase = true;
      termguicolors = true;
      signcolumn = "yes";
      cursorline = true;
      scrolloff = 8;
      updatetime = 250;
      timeoutlen = 300;
      splitright = true;
      splitbelow = true;
      clipboard = "unnamedplus";
      undofile = true;
      mouse = "a";
    };

    # ===================
    # Theme
    # ===================
    colorschemes.tokyonight = {
      enable = true;
      settings = {
        style = "night";
      };
    };

    # ===================
    # Statusline
    # ===================
    plugins.lualine = {
      enable = true;
    };

    # ===================
    # Icons
    # ===================

    plugins.web-devicons.enable = true;

    # ===================
    # File Tree
    # ===================
    plugins.neo-tree = {
      enable = true;
      settings = {
        closeIfLastWindow = true;
        window = {
          width = 30;
          position = "left";
        };
        filesystem = {
          followCurrentFile = {
            enabled = true;
          };
          filteredItems = {
            visible = true;
            hideDotfiles = false;
            hideGitignored = false;
          };
        };
      };
    };

    # ===================
    # Fuzzy Finder
    # ===================
    plugins.telescope = {
      enable = true;
      keymaps = {
        "<leader>ff" = {
          action = "find_files";
          options.desc = "Find files";
        };
        "<leader>fg" = {
          action = "live_grep";
          options.desc = "Live grep";
        };
        "<leader>fb" = {
          action = "buffers";
          options.desc = "Find buffers";
        };
        "<leader>fh" = {
          action = "help_tags";
          options.desc = "Help tags";
        };
        "<leader>fr" = {
          action = "oldfiles";
          options.desc = "Recent files";
        };
      };
    };

    # ===================
    # Syntax Highlighting
    # ===================
    plugins.treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
        ensure_installed = [
          "nix"
          "python"
          "bash"
          "hcl"
          "lua"
          "json"
          "yaml"
          "toml"
          "markdown"
          "vim"
          "vimdoc"
        ];
      };
    };

    # ===================
    # Git Integration
    # ===================
    plugins.gitsigns = {
      enable = true;
      settings = {
        signs = {
          add = {
            text = "│";
          };
          change = {
            text = "│";
          };
          delete = {
            text = "_";
          };
          topdelete = {
            text = "‾";
          };
          changedelete = {
            text = "~";
          };
        };
      };
    };

    # ===================
    # Completion
    # ===================
    plugins.cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.close()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = "cmp.mapping.select_next_item()";
          "<S-Tab>" = "cmp.mapping.select_prev_item()";
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
        };
      };
    };

    # ===================
    # LSP
    # ===================
    plugins.lsp = {
      enable = true;
      servers = {
        # Nix
        nixd = {
          enable = true;
        };
        # Python
        pyright = {
          enable = true;
        };
        # Bash
        bashls = {
          enable = true;
        };
        # HCL / Packer / Terraform
        terraformls = {
          enable = true;
        };
      };
      keymaps = {
        lspBuf = {
          "gd" = "definition";
          "gD" = "declaration";
          "gr" = "references";
          "gI" = "implementation";
          "K" = "hover";
          "<leader>rn" = "rename";
          "<leader>ca" = "code_action";
        };
        diagnostic = {
          "<leader>d" = "open_float";
          "[d" = "goto_prev";
          "]d" = "goto_next";
        };
      };
    };

    # ===================
    # Linting
    # ===================
    plugins.lint = {
      enable = true;
      lintersByFt = {
        nix = [ "statix" ];
        bash = [ "shellcheck" ];
        python = [ "ruff" ];
      };
    };

    # ===================
    # Formatting
    # ===================
    plugins.conform-nvim = {
      enable = true;
      settings = {
        format_on_save = {
          timeout_ms = 500;
          lsp_fallback = true;
        };
        formatters_by_ft = {
          nix = [ "nixfmt" ];
          python = [ "ruff_format" ];
          bash = [ "shfmt" ];
          hcl = [ "terraform_fmt" ];
          terraform = [ "terraform_fmt" ];
        };
      };
    };

    # ===================
    # Extra Packages
    # ===================
    extraPackages = with pkgs; [
      #Compiler (for treesitter)
      gcc

      # Formatters
      nixfmt-rfc-style
      shfmt
      ruff

      # Linters
      statix
      shellcheck

      # LSP deps
      terraform

      # PowerShell
      powershell

      # Tools
      ripgrep
      fd
    ];

    # ===================
    # Keymaps
    # ===================
    keymaps = [
      # Neo-tree
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Neotree toggle<cr>";
        options.desc = "Toggle file tree";
      }
      # Save
      {
        mode = "n";
        key = "<leader>w";
        action = "<cmd>w<cr>";
        options.desc = "Save file";
      }
      # Quit
      {
        mode = "n";
        key = "<leader>q";
        action = "<cmd>q<cr>";
        options.desc = "Quit";
      }
      # Clear search highlight
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<cr>";
        options.desc = "Clear search highlight";
      }
      # Window navigation
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options.desc = "Go to left window";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options.desc = "Go to lower window";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options.desc = "Go to upper window";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options.desc = "Go to right window";
      }
      # Better indenting in visual mode
      {
        mode = "v";
        key = "<";
        action = "<gv";
      }
      {
        mode = "v";
        key = ">";
        action = ">gv";
      }
    ];
  };
}
