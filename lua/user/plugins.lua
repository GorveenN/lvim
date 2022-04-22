local M = {}

M.config = function()
  lvim.plugins = {
    { "tpope/vim-dispatch" },
    { "rust-lang/rust.vim" },
    { "folke/tokyonight.nvim" },
    {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- -- settings without a patched font or icons
          -- {
          --     fold_open = "v", -- icon used for open folds
          --     fold_closed = ">", -- icon used for closed folds
          --     indent_lines = false, -- add an indent guide below the fold icons
          --     signs = {
          --         -- icons / text used for a diagnostic
          --         error = "error",
          --         warning = "warn",
          --         hint = "hint",
          --         information = "info"
          --     },
          --     use_lsp_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
          -- }
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
      run = "cd app && npm install",
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
    {
      "shumphrey/fugitive-gitlab.vim",
      requires = { "tpope/vim-fugitive" },
      config = function()
        vim.g.fugitive_gitlab_domains = { "https://gitlab-master.nvidia.com" }
      end,
    },
    { "tpope/vim-rhubarb", requires = { "tpope/vim-fugitive" } },
    {
      "folke/zen-mode.nvim",
      config = function()
        require("zen-mode").setup {}
      end,
    },
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
    {
      "rcarriga/nvim-dap-ui",
      config = function()
        require("dapui").setup()
      end,
      ft = { "python", "rust", "go" },
      requires = { "mfussenegger/nvim-dap" },
      disable = not lvim.builtin.dap.active,
    },
    {
      "junegunn/fzf.vim",
      requires = "junegunn/fzf",
      -- cmd = { "Files" },
    },
    {
      "simrat39/rust-tools.nvim",
      config = function()
        local lsp_installer_servers = require "nvim-lsp-installer.servers"
        local _, requested_server = lsp_installer_servers.get_server "rust_analyzer"
        local opts = {
          tools = { -- rust-tools options
            autoSetHints = true, -- it doesn't work for some reason
            hover_with_actions = true,
            runnables = {
              use_telescope = true,
            },
            inlay_hints = {
              show_parameter_hints = true,
              parameter_hints_prefix = "<-",
              other_hints_prefix = "=>",
              max_len_align = false,
              max_len_align_padding = 1,
              right_align = false,
              right_align_padding = 7,
            },
            hover_actions = {
              border = {
                { "╭", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╮", "FloatBorder" },
                { "│", "FloatBorder" },
                { "╯", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╰", "FloatBorder" },
                { "│", "FloatBorder" },
              },
            },
          },
          server = {
            cmd = requested_server._default_options.cmd,
            on_attach = require("lvim.lsp").common_on_attach,
            on_init = require("lvim.lsp").common_on_init,
          },
        }
        require("rust-tools").setup(opts)
      end,
      ft = { "rust", "rs" },
      requires = {
        "neovim/nvim-lspconfig",
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "mfussenegger/nvim-dap",
        "mattn/webapi-vim",
      },
    },
    { "lervag/vimtex" },
    {
      "folke/persistence.nvim",
      event = "BufReadPre", -- this will only start session saving when an actual file was opened
      module = "persistence",
      config = function()
        require("persistence").setup {
          dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
          options = { "buffers", "curdir", "tabpages", "winsize" },
        }
      end,
    },
  }
end

return M
