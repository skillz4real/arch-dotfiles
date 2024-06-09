return {
  --Client
  {
    'nvim-java/nvim-java',
    dependencies = {
      'nvim-java/lua-async-await',
      'nvim-java/nvim-java-refactor',
      'nvim-java/nvim-java-core',
      'nvim-java/nvim-java-test',
      'nvim-java/nvim-java-dap',
      'MunifTanjim/nui.nvim',
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      {
        'williamboman/mason.nvim',
        opts = {
          registries = {
            'github:nvim-java/mason-registry',
            'github:mason-org/mason-registry',
          },
        },  
      }, 
      config = function()
        require("mason").setup()
      end
    },
  },

  --lsp servers
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "intelephense",
          "quick_lint_js",
          "clangd",
          "cssls",
          "emmet_ls",
          "grammarly",
          "jdtls",
          "sqlls",
          "html",
        }
      })
    end
  },
  --communication between client and servers
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.pyright.setup({ capabilities = capabilities })
      lspconfig.intelephense.setup({ capabilities = capabilities })
      lspconfig.quick_lint_js.setup({ capabilities = capabilities })
      lspconfig.clangd.setup({ capabilities = capabilities })
      lspconfig.cssls.setup({ capabilities = capabilities })
      lspconfig.emmet_ls.setup({ capabilities = capabilities })
      lspconfig.grammarly.setup({ capabilities = capabilities })
      lspconfig.jdtls.setup({ capabilities = capabilities })
      lspconfig.sqlls.setup({ capabilities = capabilities })
      lspconfig.html.setup({ capabilities = capabilities })
      vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, {})
    end
  }
}
