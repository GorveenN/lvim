local M = {}

M.config = function()
  lvim.autocommands = {
    -- { "CursorHold", "*", "lua vim.lsp.diagnostic.show_line_diagnostics()" },
    {
      "FileType",
      { pattern = { "*.rs" }, command = "compiler cargo" },
    },
    {
      "FileType",
      { pattern = { "markdown" }, command = "setlocal spelllang=pl,en" },
    },
  }
end

return M
