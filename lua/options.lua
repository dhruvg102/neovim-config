vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

local opt = vim.opt -- for conciseness

--line numbers
opt.number = true
opt.relativenumber = true

-- tabs and indentation
opt.tabstop = 4 -- 2 spaces for tabs
opt.shiftwidth = 4 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting a new one

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if mixed case while searching, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- colorscheme option
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes" -- show sign columns so that text doesnt shift

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

--clipboard
opt.clipboard = "unnamedplus" -- use system clipboard as default register
-- if vim.fn.has("wsl") == 1 then
--   vim.api.nvim_create_autocmd("TextYankPost", {
--     group = vim.api.nvim_create_augroup("Yank", { clear = true }),
--     callback = function()
--       vim.fn.system("clip.exe", vim.fn.getreg('"'))
--     end,
--   })
-- end

-- Save Undo History
opt.undofile = true

-- Decrease update time
opt.updatetime = 250

-- Decrease mapped sequence wait time
opt.timeoutlen = 300

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
