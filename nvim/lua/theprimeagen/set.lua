vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.breakindent = true
vim.opt.showbreak = "↳ "


vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.conceallevel = 2

vim.opt.spell = true
vim.opt.spelllang = 'en_us'

vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.api.nvim_set_hl(0, "Comment", { italic = true })
vim.api.nvim_set_hl(0, "Keyword", { italic = true })

vim.opt.laststatus = 3

vim.opt.cursorline = true
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2E2E2E" })

