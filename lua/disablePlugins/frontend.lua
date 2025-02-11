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

  -- 文件搜索和预览
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
      require("telescope").setup({
        extensions = {
          file_browser = {
            -- 自定义文件浏览器配置
            hidden = true,
            respect_gitignore = true,
          },
        },
      })
      require("telescope").load_extension("file_browser")
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

  -- 文件树
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },

  -- 代码格式化
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        vue = { "prettier" },
        typescript = { "prettier" },
        javascript = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
      },
    },
  },

  -- 代码调试
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "mxsdev/nvim-dap-vscode-js", -- 用于 JavaScript/TypeScript 调试
    },
    config = function()
      local dap = require("dap")
      require("dap-vscode-js").setup({
        debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
        adapters = { "pwa-node", "pwa-chrome" },
      })
    end,
  },

  -- 项目管理
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        detection_methods = { "pattern", "lsp" },
        patterns = { ".git", "package.json", "vue.config.js", "vite.config.ts" },
        show_hidden = true,
      })
      -- 可选：集成到 telescope
      require('telescope').load_extension('projects')
    end,
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    event = "VeryLazy",
  },

  -- 颜色预览 
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        css = true,
        css_fn = true,
        tailwind = true,
      },
    },
  },
  -- Incremental rename
    {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },

  -- 导入路径提示
  {
    "ludovicchabant/vim-gutentags",
    config = function()
      vim.g.gutentags_add_default_project_roots = false
      vim.g.gutentags_project_root = { 'package.json', '.git' }
      vim.g.gutentags_cache_dir = vim.fn.expand('~/.cache/nvim/ctags/')
      vim.g.gutentags_generate_on_new = true
      vim.g.gutentags_generate_on_write = true
      vim.g.gutentags_generate_on_missing = true
      vim.g.gutentags_generate_on_empty_buffer = true
      vim.g.gutentags_ctags_extra_args = { '--tag-relative=yes', '--fields=+ailmnS' }
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        filetypes = {
          "html", "xml", "javascript", "typescript", "vue", "jsx", "tsx",
          "markdown"
        },
      })
    end,
  },

  -- 智能路径别名提示
  {
    "davidosomething/format-ts-errors.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
  },

  -- 修改 LSP 配置，增强路径提示
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        volar = {
          filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
          init_options = {
            typescript = {
              tsdk = vim.fn.expand('$HOME/node_modules/typescript/lib')
              -- 或者使用全局安装的 TypeScript
              -- tsdk = '/usr/local/lib/node_modules/typescript/lib'
            }
          }
        },
        tsserver = {
          init_options = {
            preferences = {
              importModuleSpecifierPreference = 'relative',
              importModuleSpecifierEnding = 'minimal',
            }
          },
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              }
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              }
            }
          }
        },
      },
    },
  },
} 