# 🚀 Neovim 配置

<div align="center">

![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)

基于 [LazyVim](https://github.com/LazyVim/LazyVim) 的个性化配置，专为 TypeScript/JavaScript 开发优化。

[安装教程](https://lazyvim.github.io/installation) · [问题反馈](https://github.com/LazyVim/LazyVim/issues) · [功能建议](https://github.com/LazyVim/LazyVim/discussions)

</div>

## ✨ 特性

- 🎨 现代化界面，支持多种主题
- 🔍 强大的文件搜索和代码搜索
- 📝 智能代码补全（TypeScript/JavaScript）
- 🐛 内置代码诊断和 LSP 支持
- 🔧 ESLint 集成
- 🌳 文件树和符号大纲
- 🔌 终端集成
- 🎮 直观的快捷键系统

## ⌨️ 快捷键指南

> 💡 提示：按下 `空格` 键可以打开快捷键提示窗口

### 🛠️ 自定义快捷键

#### 🔍 LSP 功能 (lua/plugins/lsp.lua)

| 快捷键 | 功能 | 配置文件 |
|:--------:|:------:|:----------:|
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

#### 💡 智能补全 (lua/plugins/cmp.lua)

| 快捷键 | 功能 | 配置文件 |
|:--------:|:------:|:----------:|
| `<C-b>` | 向上滚动文档 | lua/plugins/cmp.lua |
| `<C-f>` | 向下滚动文档 | lua/plugins/cmp.lua |
| `<C-Space>` | 触发补全 | lua/plugins/cmp.lua |
| `<C-e>` | 关闭补全 | lua/plugins/cmp.lua |
| `<CR>` | 确认选择 | lua/plugins/cmp.lua |
| `<Tab>` | 下一个补全项 | lua/plugins/cmp.lua |
| `<S-Tab>` | 上一个补全项 | lua/plugins/cmp.lua |

#### 🔌 终端集成 (lua/plugins/other.lua)

| 快捷键 | 功能 | 配置文件 |
|:--------:|:------:|:----------:|
| `<C-\>` | 打开/关闭浮动终端 | lua/plugins/other.lua |

#### 📁 文件导航 (lua/plugins/alpha.lua)

| 快捷键 | 功能 | 配置文件 |
|:--------:|:------:|:----------:|
| `<leader>f` | 查找文件 | lua/plugins/alpha.lua |
| `<leader>e` | 新建文件 | lua/plugins/alpha.lua |
| `<leader>r` | 最近文件 | lua/plugins/alpha.lua |
| `<leader>t` | 查找文本 | lua/plugins/alpha.lua |
| `<leader>c` | 打开配置 | lua/plugins/alpha.lua |

#### 🔧 ESLint 集成 (lua/plugins/eslint.lua)

| 快捷键 | 功能 | 配置文件 |
|:--------:|:------:|:----------:|
| `<space>cl` | 显示诊断信息 | lua/plugins/eslint.lua |
| `<space>cf` | 格式化代码 | lua/plugins/eslint.lua |

### ⚡ LazyVim 默认快捷键

#### 🪟 窗口操作

| 快捷键 | 功能 | 模式 |
|:--------:|:------:|:------:|
| `<C-h>` | 切换到左窗口 | **n** |
| `<C-j>` | 切换到下窗口 | **n** |
| `<C-k>` | 切换到上窗口 | **n** |
| `<C-l>` | 切换到右窗口 | **n** |
| `<C-Up>` | 增加窗口高度 | **n** |
| `<C-Down>` | 减少窗口高度 | **n** |
| `<C-Left>` | 减少窗口宽度 | **n** |
| `<C-Right>` | 增加窗口宽度 | **n** |

#### 📑 缓冲区管理

| 快捷键 | 功能 | 模式 |
|:--------:|:------:|:------:|
| `<S-h>` | 上一个缓冲区 | **n** |
| `<S-l>` | 下一个缓冲区 | **n** |
| `<leader>bb` | 切换到其他缓冲区 | **n** |
| `<leader>bd` | 删除缓冲区 | **n** |
| `<C-s>` | 保存文件 | **n**, **i** |

#### 🔍 搜索功能

| 快捷键 | 功能 | 模式 |
|:--------:|:------:|:------:|
| `<leader>sg` | 搜索文本(根目录) | **n** |
| `<leader>sG` | 搜索文本(当前目录) | **n** |
| `<leader>sb` | 搜索当前缓冲区 | **n** |
| `<leader>sh` | 搜索帮助文档 | **n** |
| `<leader>sk` | 搜索快捷键 | **n** |
| `<leader>sm` | 搜索标记 | **n** |

#### 🛠️ 代码操作

| 快捷键 | 功能 | 模式 |
|:--------:|:------:|:------:|
| `<leader>cf` | 格式化代码 | **n**, **v** |
| `<leader>cd` | 行诊断信息 | **n** |
| `]d` | 下一个诊断 | **n** |
| `[d` | 上一个诊断 | **n** |
| `]e` | 下一个错误 | **n** |
| `[e` | 上一个错误 | **n** |
| `]w` | 下一个警告 | **n** |
| `[w` | 上一个警告 | **n** |

#### 🎨 界面调整

| 快捷键 | 功能 | 模式 |
|:--------:|:------:|:------:|
| `<leader>uf` | 切换自动格式化(全局) | **n** |
| `<leader>us` | 切换拼写检查 | **n** |
| `<leader>uw` | 切换自动换行 | **n** |
| `<leader>ul` | 切换行号 | **n** |
| `<leader>ud` | 切换诊断 | **n** |
| `<leader>uc` | 切换代码隐藏级别 | **n** |
| `<leader>uh` | 切换内联提示 | **n** |

#### 🌳 Git 操作

| 快捷键 | 功能 | 模式 |
|:--------:|:------:|:------:|
| `<leader>gb` | Git 行内注释 | **n** |
| `<leader>gB` | Git 浏览(打开) | **n**, **v** |
| `<leader>gg` | 打开 GitUI(根目录) | **n** |
| `<leader>gG` | 打开 GitUI(当前目录) | **n** |

## 📝 使用说明

### 模式说明
- **n**: 普通模式 (Normal)
- **i**: 插入模式 (Insert)
- **v**: 可视模式 (Visual)
- **t**: 终端模式 (Terminal)

### 特殊按键说明
- `<leader>`: 空格键
- `<C-x>`: Ctrl + x
- `<S-x>`: Shift + x
- `<A-x>`: Alt + x
- `<CR>`: 回车键
- `<Tab>`: Tab 键
- `<BS>`: 退格键

## 🔧 配置修改

如需自定义配置，可以编辑以下文件：
- LSP 配置: `lua/plugins/lsp.lua`
- 补全配置: `lua/plugins/cmp.lua`
- 主题配置: `lua/plugins/colorscheme.lua`
- 按键映射: `lua/config/keymaps.lua`
- 基础选项: `lua/config/options.lua`

## 📚 相关资源

- [LazyVim 官方文档](https://www.lazyvim.org)
- [Neovim 官方文档](https://neovim.io/doc)
- [Lua 语言教程](https://www.lua.org/manual/5.4)
- [Vim 实用技巧](https://github.com/wsdjeg/vim-galore-zh_cn)

## 🤝 贡献指南

欢迎提交 Issue 和 Pull Request 来改进这个配置！

## 📄 开源协议

MIT License © 2024
