local bopt = vim.bo

bopt.expandtab = true
bopt.shiftwidth = 4
bopt.tabstop = 4
bopt.softtabstop = 4

require("lsp.lua")
-- 取消自动注释，当前行是注释时，按下回车键会默认添加一行注释，这里取消这一行为
-- vim.opt_local.formatoptions = vim.opt_local.formatoptions - {"r", "c", "o"}
