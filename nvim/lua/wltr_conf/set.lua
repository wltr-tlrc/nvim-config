-- [[ Setting options ]]
-- See `:help vim.o`
--vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[let g:gruvbox_material_background = 'hard' ]]
vim.cmd [[let g:gruvbox_material_transparent_background = 1]]
vim.cmd [[colorscheme gruvbox-material]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
