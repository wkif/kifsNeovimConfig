return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    
    -- 自定义图案 - "kifs neovim"
    dashboard.section.header.val = {
      [[                                                                       ]],
      [[ ██╗  ██╗██╗███████╗███████╗    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗]],
      [[ ██║ ██╔╝██║██╔════╝██╔════╝    ████╗  ██║██╔════╝██╔═══██╗██║   ██║]],
      [[ █████╔╝ ██║█████╗  ███████╗    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║]],
      [[ ██╔═██╗ ██║██╔══╝  ╚════██║    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝]],
      [[ ██║  ██╗██║██║     ███████║    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ]],
      [[ ╚═╝  ╚═╝╚═╝╚═╝     ╚══════╝    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ]],
      [[                                                                       ]],
      [[                    ██╗   ██╗██╗███╗   ███╗                          ]],
      [[                    ██║   ██║██║████╗ ████║                          ]],
      [[                    ██║   ██║██║██╔████╔██║                          ]],
      [[                    ╚██╗ ██╔╝██║██║╚██╔╝██║                          ]],
      [[                     ╚████╔╝ ██║██║ ╚═╝ ██║                          ]],
      [[                      ╚═══╝  ╚═╝╚═╝     ╚═╝                          ]],
      [[                                                                       ]],
    }

    -- 自定义菜单
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
      dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }

    -- 页脚
    local function footer()
      local datetime = os.date(" %Y-%m-%d   %H:%M:%S")
      local version = vim.version()
      local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
      return datetime .. "   " .. nvim_version_info
    end

    dashboard.section.footer.val = footer()

    -- 布局
    dashboard.config.layout = {
      { type = "padding", val = 2 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    -- 高亮
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"

    return dashboard
  end,
  config = function(_, dashboard)
    -- 关闭文件浏览器
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    require("alpha").setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
} 