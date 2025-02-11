return {
    -- Vue 语法高亮和支持
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        if type(opts.ensure_installed) == "table" then
          vim.list_extend(opts.ensure_installed, {
            "vue",
            "typescript",
            "javascript",
            "html",
            "css",
            "scss",
            "json",
            "yaml",
          })
        end
      end,
    },
  
    -- TypeScript 支持
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          volar = {}, -- Vue 3 语言服务器
          tsserver = {}, -- TypeScript 服务器
          cssls = {}, -- CSS 语言服务器
          tailwindcss = {}, -- Tailwind CSS 支持
        },
      },
    },
  
    -- 自动补全核心插件
    {
      "hrsh7th/nvim-cmp",
      event = { "InsertEnter", "CmdlineEnter" },
      dependencies = {
        "hrsh7th/cmp-buffer",           -- buffer 补全源
        "hrsh7th/cmp-path",            -- 路径补全源
        "hrsh7th/cmp-cmdline",         -- 命令行补全源
        "hrsh7th/cmp-nvim-lsp",        -- LSP 补全源
        "L3MON4D3/LuaSnip",           -- 代码片段引擎
        "saadparwaiz1/cmp_luasnip",    -- 代码片段补全源
      },
      config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        
        cmp.setup({
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { "i", "s" }),
          }),
          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "path" },
            { name = "buffer" },
          }),
          formatting = {
            format = function(entry, vim_item)
              -- 设置补全项的图标
              local kind_icons = {
                Text = "",
                Method = "",
                Function = "",
                Constructor = "",
                Field = "",
                Variable = "",
                Class = "ﴯ",
                Interface = "",
                Module = "",
                Property = "ﰠ",
                Unit = "",
                Value = "",
                Enum = "",
                Keyword = "",
                Snippet = "",
                Color = "",
                File = "",
                Reference = "",
                Folder = "",
                EnumMember = "",
                Constant = "",
                Struct = "",
                Event = "",
                Operator = "",
                TypeParameter = ""
              }
              vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
              return vim_item
            end
          },
        })
  
        -- 命令行补全配置
        cmp.setup.cmdline(':', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = 'path' },
            { name = 'cmdline' }
          })
        })
  
        -- 搜索补全配置
        cmp.setup.cmdline('/', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = 'buffer' }
          }
        })
      end,
    },
  
  
    -- Git 集成
    {
      "lewis6991/gitsigns.nvim",
      opts = {
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
      },
    },
  
    -- 终端集成
    {
      "akinsho/toggleterm.nvim",
      opts = {
        open_mapping = [[<C-\>]],
        direction = "float",
        float_opts = {
          border = "curved",
        },
      },
    },
  
}