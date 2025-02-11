return {{
    "hrsh7th/nvim-cmp",
    event = {"InsertEnter", "CmdlineEnter"},
    dependencies = {"dimfeld/cmp-async-path"},
    config = function()
        local cmp = require("cmp")

        cmp.setup({
            -- 保持原有的其他配置
            sources = cmp.config.sources({{
                name = "nvim_lsp"
            }, {
                name = "async_path",
                option = {
                    trailing_slash = true,
                    label_trailing_slash = true,
                    show_hidden_files_by_default = true
                }
            }, {
                name = "buffer"
            }}),

            -- 为特定文件类型配置补全源
            filetype = {
                ["javascript"] = {
                    sources = cmp.config.sources({{
                        name = "nvim_lsp"
                    }, {
                        name = "async_path"
                    }, {
                        name = "buffer"
                    }})
                },
                ["typescript"] = {
                    sources = cmp.config.sources({{
                        name = "nvim_lsp"
                    }, {
                        name = "async_path"
                    }, {
                        name = "buffer"
                    }})
                },
                ["vue"] = {
                    sources = cmp.config.sources({{
                        name = "nvim_lsp"
                    }, {
                        name = "async_path"
                    }, {
                        name = "buffer"
                    }})
                }
            }
        })

        -- 命令行补全配置
        cmp.setup.cmdline(":", {
            sources = cmp.config.sources({{
                name = "async_path"
            }})
        })

        -- 搜索补全配置
        cmp.setup.cmdline("/", {
            sources = cmp.config.sources({{
                name = "buffer"
            }})
        })
    end
}}
