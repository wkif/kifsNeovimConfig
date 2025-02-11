return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        eslint = {
          settings = {
            -- ESLint 服务器配置
            workingDirectory = { mode = "auto" },
            format = { enable = true }, -- 启用 ESLint 格式化
            lint = { enable = true }, -- 启用 ESLint 检查
            run = "onType", -- 在输入时运行 ESLint
            -- 自动修复配置
            codeAction = {
              disableRuleComment = {
                enable = true,
                location = "separateLine",
              },
              showDocumentation = {
                enable = true,
              },
            },
          },
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "eslint-lsp" })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      vim.list_extend(opts.sources, {
        nls.builtins.diagnostics.eslint_d,
        nls.builtins.code_actions.eslint_d,
        nls.builtins.formatting.eslint_d,
      })
    end,
  },
} 