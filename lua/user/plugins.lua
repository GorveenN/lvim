local M = {}

M.config = function()
  lvim.plugins = {
    { "tpope/vim-dispatch" },
    { "folke/tokyonight.nvim" },
    {
      "folke/trouble.nvim",
      dependecies = "nvim-tree/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end,
    },
    {
      "ray-x/lsp_signature.nvim",
      config = function()
        require("lsp_signature").on_attach {
          bind = true, -- This is mandatory, otherwise border config won't get registered.
          -- If you want to hook lspsaga or other signature handler, pls set to false
          doc_lines = 2, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
          -- set to 0 if you DO NOT want any API comments be shown
          -- This setting only take effect in insert mode, it does not affect signature help in normal
          -- mode

          floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
          hint_enable = true, -- virtual hint enable
          hint_prefix = "🦀 ", -- Panda for parameter
          hint_scheme = "String",
          use_lspsaga = false, -- set to true if you want to use lspsaga popup
          hi_parameter = "Search", -- how your parameter will be highlight
          handler_opts = {
            border = "single", -- double, single, shadow, none
          },
          toggle_key = "<M-x>",
        }
      end,
      event = "InsertEnter",
    },
    {
      "iamcco/markdown-preview.nvim",
      build = "cd app && npm install",
      ft = "markdown",
      config = function()
        vim.g.mkdp_auto_start = 1
      end,
      cmd = {
        "MarkdownPreview",
        "MarkdownPreviewStop",
        "MarkdownPreviewToggle",
      },
    },
    {
      "tpope/vim-fugitive",
      cmd = {
        "G",
        "Git",
        "Gdiffsplit",
        "Gread",
        "Gwrite",
        "Ggrep",
        "GMove",
        "GDelete",
        "GBrowse",
        "GRemove",
        "GRename",
        "Glgrep",
        "Gedit",
      },
      ft = { "fugitive" },
    },
    { "tpope/vim-rhubarb", dependecies = { "tpope/vim-fugitive" } },
    -- {
    --   "folke/zen-mode.nvim",
    --   config = function()
    --     require("zen-mode").setup {}
    --   end,
    -- },
    {
      "aserowy/tmux.nvim",
      config = function()
        require("tmux").setup {
          -- overwrite default configuration
          -- here, e.g. to enable default bindings
          copy_sync = {
            -- enables copy sync and overwrites all register actions to
            -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
            enable = false,
          },
          navigation = {
            -- enables default keybindings (C-hjkl) for normal mode
            enable_default_keybindings = true,
          },
          resize = {
            -- enables default keybindings (A-hjkl) for normal mode
            enable_default_keybindings = true,
          },
        }
      end,
    },
    { "lervag/vimtex" },
    { "sainnhe/gruvbox-material" },
    { "tpope/vim-surround" },
    {
      "simrat39/symbols-outline.nvim",
      config = function()
        require("symbols-outline").setup()
      end,
    },
  }
end

return M
