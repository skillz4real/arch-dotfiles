--[[
Mason is the nvim plugin that allow user to manage LSP, DAP (Debug Adapter Protocole) Servers
linters and formatters. 
:h mason-how-to-use-packages <- little tutorial on how
:h standard-path <- neovim data directory

! ChatGpt generated
* Linters
 - They find potential error in ur code syntax and style also logic errors

* Formatters
 - Adjust code foramtting for consistent style

* LSP
 - language specific operations

* DAP 
 - Handles communication between debuggers and dev tools 
 - Do stuff like set breakpoints, view calling stack, inspect variables, stepping through code etc...
--]]
return {
  --mason core functionality
  {
    'williamboman/mason.nvim',
    config = function ()
      require("mason").setup()
    end
  },

  --mason helper to talk to lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", --lua
          "jdtls", --Java
          "pyright", --python
          "intelephense", --php
          "quick_lint_js", --js 
          "clangd", --C 
          "cssls", --css
          "emmet_ls", --emmet
          "grammarly", --grammarly
          "sqlls", --sql
          "html", --html
        }
      })
    end
  }
}
