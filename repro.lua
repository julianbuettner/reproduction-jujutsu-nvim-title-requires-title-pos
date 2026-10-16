-- Run with: nvim --clean -u repro.lua
local root = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h") .. "/.repro"
local plugin = root .. "/jujutsu.nvim"
local repo = root .. "/repo"

if vim.fn.isdirectory(plugin) == 0 then
	vim.fn.system({ "git", "clone", "https://github.com/mistweaverco/jujutsu.nvim", plugin })
	vim.fn.system({ "git", "-C", plugin, "checkout", "0fb33eaf6cd8adf85f6e53581ab58ffc25b0087d" })
end

if vim.fn.isdirectory(repo) == 0 then
	vim.fn.system({ "jj", "git", "init", repo })
end

vim.opt.runtimepath:prepend(plugin)
vim.cmd.cd(repo)
require("jujutsu").setup({})
