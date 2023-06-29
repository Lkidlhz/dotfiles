-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.tex_flavor = "latex"


local opt = vim.opt
local indent = 4

-- 自动保存
opt.autowrite = true
-- 备份
opt.backup = false
-- 剪切板共用
opt.clipboard = "unnamedplus"
-- 行号
opt.number = true
-- 相对行号
opt.relativenumber = true
-- deadcolomn
opt.colorcolumn = {80}

opt.cursorline = true
-- 自动换行
opt.wrap = true
-- 智能搜索大小写
opt.smartcase = true

-- tab 长度
opt.tabstop = indent
opt.softtabstop = indent
opt.shiftwidth = indent
-- 智能缩进
opt.smartindent = true

-- jk移动时,上下方保留8行
opt.scrolloff = 8
opt.sidescrolloff = 8

-- 显示空白字符
opt.list = true

-- spell check
opt.spell = false
opt.spelllang = {"en", "cjk"}


-- terminal true color
opt.termguicolors = true
opt.background = "dark"

-- mouse 
opt.mouse = "a"

-- show mode
opt.showmode = true

-- transparent
-- opt.winblend = 50
vim.api.nvim_exec([[
    highlight Normal guibg=NONE ctermbg=NONE
]], true)

-- encoding
opt.encoding = "utf-8"

