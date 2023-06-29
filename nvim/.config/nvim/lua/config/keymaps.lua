local util = require("util")

local opt = vim.opt
local keymap = vim.keymap

local nore_opt = {noremap = true}

keymap.set({'n', 'v'}, 'j', 'k')
keymap.set({'n', 'v'}, 'k', 'j')

-- 快速移动
keymap.set({'n', 'v'}, "<s-h>", "h5")
keymap.set({'n', 'v'}, "<s-j>", "k5")
keymap.set({'n', 'v'}, "<s-k>", "j5")
keymap.set({'n', 'v'}, "<s-l>", "l5")

-- 自动换行移动提升
keymap.set("n", "j", "v:count == 0 ? 'gk' : 'k'", {expr = true})
keymap.set("n", "k", "v:count == 0 ? 'gj' : 'j'", {expr = true})

-- 行移动
keymap.set("n", "<C-k>", "<cmd>m .+1<cr>==", { desc = "Move down" })
keymap.set("n", "<C-j>", "<cmd>m .-2<cr>==", { desc = "Move up" })
keymap.set("i", "<C-k>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
keymap.set("i", "<C-j>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
keymap.set("v", "<C-k>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
keymap.set("v", "<C-j>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- 分屏
keymap.set({'n'}, "sh", ":set nosplitright<CR>:vsplit<CR>")
keymap.set({'n'}, "sj", ":set nosplitbelow<CR>:split<CR>")
keymap.set({'n'}, "sk", ":set splitbelow<CR>:split<CR>")
keymap.set({'n'}, "sl", ":set splitright<CR>:vsplit<CR>")

-- 切屏
keymap.set({'n'}, "<LEADER>h", "<C-w>h")
keymap.set({'n'}, "<LEADER>j", "<C-w>k")
keymap.set({'n'}, "<LEADER>k", "<C-w>j")
keymap.set({'n'}, "<LEADER>l", "<C-w>l")

-- 改变分屏大小
keymap.set({'n'}, "<up>", ":res +5<CR>")
keymap.set({'n'}, "<down>", ":res -5<CR>")
keymap.set({'n'}, "<left>", ":vertical resize -5<CR>")
keymap.set({'n'}, "<right>", ":vertical resize +5<CR>")

-- 页面
keymap.set({'n'}, "tb", ":tabe<CR>")
keymap.set({'n'}, "th", ":-tabnext<CR>")
keymap.set({'n'}, "tl", ":+tabnext<CR>")

-- 搜索

keymap.set({'n'}, "=", "nzz", nore_opt)
keymap.set({'n'}, "-", "Nzz", nore_opt)
keymap.set({'n'}, "<LEADER><CR>", ":nohlsearch<CR>", nore_opt)
-- keymap.set({'n'}, "<ESC>", ":nohlsearch<CR>", nore_opt)

-- 保存退出重新加载
keymap.set({'n'}, "Q", ":q<CR>")
keymap.set({'n'}, "s", "<nop>")
keymap.set({'n'}, "S", ":w<CR>")
keymap.set({'n'}, "R", ":so<CR>")

-- 缩进
keymap.set('n', "<", "v<g")
keymap.set('n', ">", "v>g")
keymap.set('v', "<", "<gv")
keymap.set('v', ">", ">gv")

-- toggle options
-- ===
-- map("n", "<leader>uf", require("lazyvim.plugins.lsp.format").toggle, { desc = "Toggle format on Save" })
-- ===
keymap.set("n", "<leader>us", function() util.toggle("spell") end, { desc = "Toggle Spelling" })
keymap.set("n", "<leader>uw", function() util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
keymap.set("n", "<leader>ud", util.toggle_diagnostics, { desc = "Toggle Diagnostics" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
keymap.set("n", "<leader>uc", function() util.toggle("conceallevel", false, {0, conceallevel}) end, { desc = "Toggle Conceal" })

keymap.set("n", "<leader>t", ":highlight Normal guibg=NONE ctermbg=NONE<CR>")
