local M = {}

M.config = function()
  local formatters = require "lvim.lsp.null-ls.formatters"
  formatters.setup {
    { exe = "black", args = { "--fast" }, filetypes = { "python" } },
    { exe = "isort", args = { "--profile", "black" }, filetypes = { "python" } },
    { exe = "stylua", filetypes = { "lua" } },
    { exe = "prettierd", filetypes = { "markdown", "yaml" } },
    { exe = "stylua", filetypes = { "lua" } },
    { exe = "sqlformat", filetypes = { "sql" } },
    { exe = "shfmt", args = { "-i", "2", "-ci" } },
  }

  local linters = require "lvim.lsp.null-ls.linters"
  linters.setup {
    { exe = "hadolint", filetypes = { "dockerfile" } },
    { exe = "flake8", filetypes = { "python" } },
    { exe = "luacheck", filetypes = { "lua" } },
    { exe = "shellcheck", args = { "--severity", "warning" } },
    { exe = "codespell", filetypes = { "python" } },
  }
end

return M
