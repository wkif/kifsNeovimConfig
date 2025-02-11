# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## 🚀 快捷键说明

### 自定义快捷键

#### LSP 相关 (lua/plugins/lsp.lua)

| 快捷键 | 功能 | 配置文件 |
|--------|------|----------|
| `K` | 显示悬浮文档 | lua/plugins/lsp.lua |
| `gd` | 跳转到定义 | lua/plugins/lsp.lua |
| `gD` | 跳转到声明 | lua/plugins/lsp.lua |
| `gi` | 跳转到实现 | lua/plugins/lsp.lua |
| `gr` | 查看引用 | lua/plugins/lsp.lua |
| `<C-k>` | 显示签名帮助 | lua/plugins/lsp.lua |
| `<space>wa` | 添加工作区文件夹 | lua/plugins/lsp.lua |
| `<space>wr` | 删除工作区文件夹 | lua/plugins/lsp.lua |
| `<space>wl` | 列出工作区文件夹 | lua/plugins/lsp.lua |
| `<space>D` | 跳转到类型定义 | lua/plugins/lsp.lua |
| `<space>rn` | 重命名 | lua/plugins/lsp.lua |
| `<space>ca` | 代码操作 | lua/plugins/lsp.lua |

#### 代码补全 (lua/plugins/cmp.lua)

| 快捷键 | 功能 | 配置文件 |
|--------|------|----------|
| `<C-b>` | 向上滚动文档 | lua/plugins/cmp.lua |
| `<C-f>` | 向下滚动文档 | lua/plugins/cmp.lua |
| `<C-Space>` | 触发补全 | lua/plugins/cmp.lua |
| `<C-e>` | 关闭补全 | lua/plugins/cmp.lua |
| `<CR>` | 确认选择 | lua/plugins/cmp.lua |
| `<Tab>` | 下一个补全项 | lua/plugins/cmp.lua |
| `<S-Tab>` | 上一个补全项 | lua/plugins/cmp.lua |

#### 终端集成 (lua/plugins/other.lua)

| 快捷键 | 功能 | 配置文件 |
|--------|------|----------|
| `<C-\>` | 打开/关闭浮动终端 | lua/plugins/other.lua |

#### 文件导航 (lua/plugins/alpha.lua)

| 快捷键 | 功能 | 配置文件 |
|--------|------|----------|
| `<leader>f` | 查找文件 | lua/plugins/alpha.lua |
| `<leader>e` | 新建文件 | lua/plugins/alpha.lua |
| `<leader>r` | 最近文件 | lua/plugins/alpha.lua |
| `<leader>t` | 查找文本 | lua/plugins/alpha.lua |
| `<leader>c` | 打开配置 | lua/plugins/alpha.lua |

#### ESLint 集成 (lua/plugins/eslint.lua)

| 快捷键 | 功能 | 配置文件 |
|--------|------|----------|
| `<space>cl` | 显示诊断信息 | lua/plugins/eslint.lua |
| `<space>cf` | 格式化代码 | lua/plugins/eslint.lua |

### LazyVim 默认快捷键

#### 基础操作

| 快捷键 | 功能 | 模式 |
|--------|------|------|
| `<C-h>` | 切换到左窗口 | **n** |
| `<C-j>` | 切换到下窗口 | **n** |
| `<C-k>` | 切换到上窗口 | **n** |
| `<C-l>` | 切换到右窗口 | **n** |
| `<C-Up>` | 增加窗口高度 | **n** |
| `<C-Down>` | 减少窗口高度 | **n** |
| `<C-Left>` | 减少窗口宽度 | **n** |
| `<C-Right>` | 增加窗口宽度 | **n** |
| `<S-h>` | 上一个缓冲区 | **n** |
| `<S-l>` | 下一个缓冲区 | **n** |
| `<leader>bb` | 切换到其他缓冲区 | **n** |
| `<leader>bd` | 删除缓冲区 | **n** |
| `<C-s>` | 保存文件 | **n**, **i** |

#### 搜索和导航

| 快捷键 | 功能 | 模式 |
|--------|------|------|
| `<leader>sg` | 搜索文本(根目录) | **n** |
| `<leader>sG` | 搜索文本(当前目录) | **n** |
| `<leader>sb` | 搜索当前缓冲区 | **n** |
| `<leader>sh` | 搜索帮助文档 | **n** |
| `<leader>sk` | 搜索快捷键 | **n** |
| `<leader>sm` | 搜索标记 | **n** |

#### 代码操作

| 快捷键 | 功能 | 模式 |
|--------|------|------|
| `<leader>cf` | 格式化代码 | **n**, **v** |
| `<leader>cd` | 行诊断信息 | **n** |
| `]d` | 下一个诊断 | **n** |
| `[d` | 上一个诊断 | **n** |
| `]e` | 下一个错误 | **n** |
| `[e` | 上一个错误 | **n** |
| `]w` | 下一个警告 | **n** |
| `[w` | 上一个警告 | **n** |

#### UI 切换

| 快捷键 | 功能 | 模式 |
|--------|------|------|
| `<leader>uf` | 切换自动格式化(全局) | **n** |
| `<leader>us` | 切换拼写检查 | **n** |
| `<leader>uw` | 切换自动换行 | **n** |
| `<leader>ul` | 切换行号 | **n** |
| `<leader>ud` | 切换诊断 | **n** |
| `<leader>uc` | 切换代码隐藏级别 | **n** |
| `<leader>uh` | 切换内联提示 | **n** |

#### Git 操作

| 快捷键 | 功能 | 模式 |
|--------|------|------|
| `<leader>gb` | Git 行内注释 | **n** |
| `<leader>gB` | Git 浏览(打开) | **n**, **v** |
| `<leader>gg` | 打开 GitUI(根目录) | **n** |
| `<leader>gG` | 打开 GitUI(当前目录) | **n** |

## 📝 注意事项

1. 大多数快捷键在普通模式（Normal Mode）下使用
2. `<leader>` 键默认为空格键
3. `<C-x>` 表示 Ctrl+x
4. `<S-x>` 表示 Shift+x
5. `<space>` 表示空格键
6. 模式说明：
   - **n**: 普通模式
   - **i**: 插入模式
   - **v**: 可视模式
   - **t**: 终端模式

## 🔧 自定义配置

如需修改快捷键，可以在对应的配置文件中进行更改。例如，要修改 LSP 相关的快捷键，编辑 `lua/plugins/lsp.lua` 文件中的 `on_attach` 函数。

## 📚 更多信息

完整的快捷键列表请参考 [LazyVim 官方文档](https://www.lazyvim.org/keymaps)
