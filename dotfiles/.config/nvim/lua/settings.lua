local o = vim.opt
o.guicursor = ""
o.mouse = ""
o.runtimepath:append(os.getenv("HOME") .. "/.vim/parsers")
o.nu = true
o.relativenumber = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.wrap = false
o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.incsearch = true
o.termguicolors = true
o.scrolloff = 10
o.signcolumn = "yes"
o.isfname:append("@-@")
o.updatetime = 50
o.completeopt = "noselect,noinsert"
o.colorcolumn = "80"
o.showmode = false
o.cmdheight = 0

-- Highlight text when its yanked
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
