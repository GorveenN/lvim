local M = {}

M.config = function()
  -- dockerfile

  lvim.lang.dockerfile.linters = {
    {
      exe = "hadolint",
      -- args = {},
    },
  }

  -- go

  if lvim.builtin.dap.active then
    local dap_install = require "dap-install"
    dap_install.config("go_delve_dbg", {})
  end

  -- html

  lvim.lang.html.formatters = {
    {
      exe = "prettierd",
      -- args = {},
    },
  }

  -- json

  lvim.lang.json.formatters = {
    {
      exe = "prettierd",
      -- args = {},
    },
  }

  -- lua

  lvim.lang.lua.formatters = {
    {
      exe = "stylua",
      -- args = {},
    },
  }
  lvim.lang.lua.linters = {
    {
      exe = "luacheck",
      -- args = {},
    },
  }

  -- markdown

  -- lvim.lang.markdown.formatters = {
  --   {
  --     exe = "prettierd",
  --     -- args = {},
  --   },
  -- }

  -- lvim.lang.markdown.linters = {
  --   {
  --     -- @usage can be write_good or vale or markdownlint
  --     exe = "markdownlint",
  --     -- args = {},
  --   },
  --   {
  --     -- @usage can be write_good or vale or markdownlint
  --     exe = "vale",
  --     -- args = {},
  --   },
  -- }

  -- python

  lvim.lang.python.formatters = {
    { exe = "black", args = { "--fast" } },
    { exe = "isort", args = { "--profile", "black" } },
  }

  lvim.lang.python.linters = {
    {
      exe = "flake8",
      -- args = {}
    },
  }

  if lvim.builtin.dap.active then
    local dap_install = require "dap-install"
    dap_install.config("python_dbg", {})

    local dap = require "dap"
    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
          return "/usr/bin/python"
        end,
      },
    }
  end

  -- sh

  lvim.lang.sh.formatters = {
    {
      exe = "shfmt",
      args = { "-i", "2", "-ci" },
    },
  }
  lvim.lang.sh.linters = {
    {
      exe = "shellcheck",
    },
  }

  -- vim

  lvim.lang.vim.linters = {
    {
      exe = "vint",
      -- args = {},
    },
  }

  -- yaml

  lvim.lang.yaml.formatters = {
    {
      exe = "prettierd",
      args = { "-w" },
    },
  }
end

return M
