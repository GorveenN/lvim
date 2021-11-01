local M = {}

M.config = function()
  lvim.autocommands.custom_groups = {
    -- { "CursorHold", "*", "lua vim.lsp.diagnostic.show_line_diagnostics()" },
    { "FileType", "*.rs", "compiler cargo" },
  }
end

return M
