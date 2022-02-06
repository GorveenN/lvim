local M = {}

M.config = function()
  -- keymappings lvim.leader = "space"
  -- overwrite the key-mappings provided by LunarVim for any mode, or leave it empty to keep them
  -- lvim.keys.normal_mode = {
  --   Page down/up
  --   {'[d', '<PageUp>'},
  --   {']d', '<PageDown>'},
  --
  --   Navigate buffers
  --   {'<Tab>', ':bnext<CR>'},
  --   {'<S-Tab>', ':bprevious<CR>'},
  -- }
  -- if you just want to augment the existing ones then use the utility function
  -- require("utils").add_keymap_insert_mode({ silent = true }, {
  -- { "<C-s>", ":w<cr>" },
  -- { "<C-c>", "<ESC>" },
  -- })
  -- you can also use the native vim way directly
  -- vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", { noremap = true, silent = true, expr = true })

  -- vim.api.nvim_set_keymap(
  --   "n",
  --   "<F5>",
  --   ":let _s=@/<Bar>:%s/s+$//e<Bar>:let @/=_s<Bar><CR>",
  --   { noremap = true, silent = true }
  -- )
  -- lvim.builtin.which_key.mappings["f"] = { "<cmd>Files<cr>", "Files" }
  -- lvim.builtin.which_key.mappings["s"].t = { "<cmd>Rg<cr>", "Text" }

  lvim.builtin.which_key.mappings["g"].g = { "<cmd>Git<cr>", "Status" }
  lvim.builtin.which_key.mappings["g"].f = { "<cmd>diffget //2<cr>", "Get left side" }
  lvim.builtin.which_key.mappings["g"].h = { "<cmd>diffget //3<cr>", "Get right side" }

  lvim.builtin.which_key.mappings["t"] = {
    name = "Trouble",
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
  }
  lvim.builtin.which_key.mappings["S"] = {
    name = "Session",
    c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
    l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
    Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
  }
end

return M
