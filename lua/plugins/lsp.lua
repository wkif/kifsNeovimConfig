return {{
    "neovim/nvim-lspconfig",
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {"mason.nvim", "williamboman/mason-lspconfig.nvim"},
    config = function()
        -- 设置悬浮窗口边框
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded",
            width = 60
        })

        -- 设置诊断图标
        local signs = {{
            name = "DiagnosticSignError",
            text = "󰅚"
        }, {
            name = "DiagnosticSignWarn",
            text = "󰀪"
        }, {
            name = "DiagnosticSignHint",
            text = "󰌶"
        }, {
            name = "DiagnosticSignInfo",
            text = ""
        }}
        for _, sign in ipairs(signs) do
            vim.fn.sign_define(sign.name, {
                texthl = sign.name,
                text = sign.text,
                numhl = ""
            })
        end

        -- 配置诊断显示
        vim.diagnostic.config({
            virtual_text = true, -- 在行尾显示诊断信息
            signs = true, -- 在行号列显示诊断图标
            update_in_insert = false, -- 不在插入模式更新诊断
            underline = true, -- 对问题代码添加下划线
            severity_sort = true, -- 按严重程度排序
            float = {
                focusable = true,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = ""
            }
        })

        -- 自动显示诊断悬浮窗
        vim.o.updatetime = 250
        vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

        -- LSP 配置回调
        local on_attach = function(client, bufnr)
            -- 启用自动补全
            vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

            -- 快捷键映射
            local opts = {
                noremap = true,
                silent = true,
                buffer = bufnr
            }
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
            vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
            vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
            vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
            vim.keymap.set("n", "<space>wl", function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, opts)
            vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
            vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        end

        -- 配置 TypeScript/JavaScript LSP
        require("lspconfig").tsserver.setup({
            on_attach = on_attach,
            flags = {
                debounce_text_changes = 150
            },
            settings = {
                typescript = {
                    inlayHints = {
                        includeInlayParameterNameHints = "all",
                        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true
                    }
                },
                javascript = {
                    inlayHints = {
                        includeInlayParameterNameHints = "all",
                        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true
                    }
                }
            }
        })
    end
}, {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {
        ensure_installed = {"typescript-language-server" -- TypeScript/JavaScript LSP
        }
    }
}}
