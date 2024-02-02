local set = vim.keymap.set

-- Telescope
local builtin = require("telescope.builtin")
set("n", "<leader>ff", builtin.find_files, {})
set("n", "<leader>fg", builtin.live_grep, {})
set("n", "<leader>fh", builtin.help_tags, {})

-- Harpoon
local harpoon = require("harpoon")
set("n", "<leader>a", function() harpoon:list():append() end)
set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
set("n", "<leader>1", function() harpoon:list():select(1) end)
set("n", "<leader>2", function() harpoon:list():select(2) end)
set("n", "<leader>3", function() harpoon:list():select(3) end)
set("n", "<leader>4", function() harpoon:list():select(4) end)

-- Trouble
local trouble = require("trouble")
set("n", "<leader>tt", function() trouble.toggle("document_diagnostics") end)
set("n", "<leader>tp", function() trouble.toggle("workspace_diagnostics") end)

-- Treesitter context


-- Move around text selected in visual mode
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- let cursor stay inplace when appending the line below to the current line
set("n", "J", "mzJ`z")

-- keep cursor in place when moving half a screen
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")

-- keep cursor in place when searching for a word
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- copy to system clipboard
set("n", "<leader>y", "\"+y")
set("v", "<leader>y", "\"+y")
set("n", "<leader>Y", "\"+Y")

-- paste from system clipboard
set("n", "<leader>p", "\"+p")
set("v", "<leader>p", "\"+p")
set("n", "<leader>P", "\"+P")

-- delete into the void
set("n", "<leader>d", "\"_d")
set("v", "<leader>d", "\"_d")

-- Dont press Q
set("n", "Q", "")

-- replace word under cursor
set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make bash script executable
set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- open netrw
set("n", "<leader>.", vim.cmd.Explore, {})

-- code actions
set("n", "<leader>ca", vim.lsp.buf.code_action, {})
