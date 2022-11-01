vim.o.timeoutlen = 1000
vim.opt.relativenumber = true

-- vim.g.tokyonight_style = "night"
-- vim.g.gruvbox_material_background = "hard"
-- lvim.colorscheme = "gruvbox-material"
lvim.colorscheme = "tokyonight-night"
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
lvim.builtin.nvimtree.setup.disable_netrw = false

lvim.builtin.treesitter.ensure_installed = "all"
lvim.builtin.treesitter.highlight.enabled = true

require("user.plugins").config()
require("user.remaps").config()
require("user.autocommands").config()
require("user.null_ls").config()

-- varia
-- lvim.lsp.installer.setup.automatic_installation = true
-- lvim.lang.rust.rust_tools = true

-- disable completion menu border
lvim.builtin.cmp.window.completion = {}

vim.cmd [[
  set wrap
]]

vim.cmd [[
set breakindent
set breakindentopt=shift:2,min:40,sbr
]]
