-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- general
vim.o.timeoutlen = 1000
vim.opt.relativenumber = true

vim.g.tokyonight_style = "night"
lvim.colorscheme = "tokyonight"

lvim.format_on_save = false
lvim.lint_on_save = true
lvim.lsp.diagnostics.update_in_insert = false
lvim.lsp.diagnostics.virtual_text = false

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
-- Builtin plugins setup
lvim.builtin.dap.active = true
lvim.builtin.dashboard.active = false
lvim.builtin.project.active = false
lvim.builtin.terminal.active = false
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

require("user.plugins").config()
require("user.remaps").config()
require("user.autocommands").config()

-- haskell grammar, not sure whether this works
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.haskell = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-haskell.git",
    files = { "src/parser.c", "src/scanner.cc" },
  },
}
