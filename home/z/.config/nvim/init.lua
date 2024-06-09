--credit to typecraft From 0 to IDE playlist(https://www.youtube.com/watch?v=zHTeCSVAFNY) 

--vim cmd is used to execute/set vim configuation in lua
vim.cmd("set expandtab") --tells nvim to use spaces instead of tab => useful for consistent indentation
vim.cmd("set shiftwidth=2") --autoindenting or using >> and << will insert 2 spaces
vim.cmd("set softtabstop=2") --code written in nvim will use two spaces as tab when pressing on tab
vim.cmd("set tabstop=2") --incoming code with tabs will display it as two spaces
vim.g.mapleader = " "

--lazyvim bootstrap from github
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

require("lazy").setup("plugins") --using a modular setup where my plugins a lua files inside the plugin folder
