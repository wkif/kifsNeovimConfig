# 🏳️‍🌈 **kifsNeovimConfig 🏳️‍🌈**

个人的neovim配置文件,使用Vim-Plug管理，适用于windows和archlinux

## 功能

- 广泛支持前端开发，支持`html`、`javascript`、`typescript`、`react(jsx)`, `scss`、`css`等高亮、关键词补全、语法补全； 也支持其它语言，例如`python`、`php`等
- 内置了 `gruvbox` `paperColor` 等优秀主题
- Completion 代码补全（由`coc.nvim`支持）
- Lint 代码检查
- Format 代码格式化
- NERDTree 支持，目录树
  - `F5` 打开 NERDTree 面板，或者刷新基于当前文件刷新目录树
- UndoTree 支持，文件变动历史
  - `F4` 打开或者关闭 UndoTree 面板
- LeaderF 支持，项目全局文件模糊查找
  - `<Space>`空格键 或 `<C-p>` 触发查找面板
  - `<leader>pm` 触发最近访问文件列表面板
  - `<leader>pb` 触发当前 buffers 列表查找
- Ctrlsf.vim 支持，全局跨文件内容搜索
  - `<leader>sf` 打开搜索面板
- Ultisnips 支持
  - 支持 react-snippets、vim-snippets 等
- 对 git 支持更好
  - 文件变动左侧标记，状态栏提示等
  - vim-fugitive 支持，可以不离开 vim 进行 git 操作
- markdown 编辑实时预览
- 快速注释代码
  - `<c-c>` 添加注释
  - `<c-x>` 取消注释
- easymotion 更快速的文件内跳转
  - 对 `f` `F` `t` `T` 做了新的映射
  - 对 `/` `?` 搜索做了映射
  - `<leader><leader>j` `<leader><leader>k` `<leader><leader>h` `<leader><leader>l` 上下左右移动
- 更快速的移动、交换代码行
  - `<leader>j` 向下，`<leader>k` 向上 （由 vim-move 提供）
  - `<leader>h` 向左，`<leader>l` 向右（由 vim-sideways 提供）
  - `cx` `cxx` 快速交换词组、行、块等（由 vim-exchange 提供）

## 安装

### archLinux:

#### node安装

#### 安装neovim

```bash
sudo pacman -S --noconfirm neovim
```

#### 安装vim-plug

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
12
```

#### 创建配置文件：

```bash
mkdir ~/.config/nvim/
nvim ~/.config/nvim/init.vim
```

init.vim文件内容为仓库init.vim

#### 安装插件

进入控制台打开nvim，输入命令

```
:PlugInstall
```

等待安装完毕：

<img src="https://kifimg.oss-cn-beijing.aliyuncs.com/img/202302170049604.png" alt="image-20230217004912502" style="zoom:50%;" />



### win

#### node安装

### ripgrep

Scoop来安装ripgrep，

在 PowerShell 中输入下面内容，保证允许本地脚本的执行：

```
set-executionpolicy remotesigned -scope currentuser
```

然后执行下面的命令安装 Scoop：

```
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
```

静待脚本执行完成就可以了，安装成功后，让我们尝试一下：

```
scoop help
```

<img src="https://kifimg.oss-cn-beijing.aliyuncs.com/img/202302170054999.png" alt="image-20230217005429961" style="zoom:67%;" />



然后 `scoop install ripgrep` 就可以了



init.vim文件为库里init，安装同上





## Neovim的常见快捷键和命令 



### normal模式下

#### 移动/编辑相关

| 快捷键     | 作用                     |
| ---------- | ------------------------ |
| h          | 左                       |
| j          | 下                       |
| k          | 上                       |
| l          | 右                       |
| ctrl + j/k | 上下跳4行                |
| ctrl + u/d | 上下9行                  |
| i          | 在光标前插入             |
| a          | 在光标后插入             |
| A          | 到末尾插入               |
| I          | 到首插入                 |
| s          | 删当前字符并进入插入模式 |
| zc         | 折叠代码                 |
| zo         | 打开折叠                 |
| u          | 撤销上一次代码修改/undo  |
| ctrl + r   | 与u相反/redo             |

#### tab/buffer/标签相关（按vim的用法来说应该叫buffer）

| 快捷键       | 作用            |
| ------------ | --------------- |
| ctrl + h/l   | 左右切换tab     |
| ctrl + w     | 关闭当前tab     |
| `<leader>`bl | 关闭右边所有tab |
| `<leader>`bh | 关闭左边所有tab |
| `<leader>`bc | 选择关闭tab     |

#### 窗口相关

| 快捷键           | 作用                 |
| ---------------- | -------------------- |
| option + h/j/k/l | 左下上右切换窗口     |
| sv               | 左右分屏             |
| sh               | 上下分屏             |
| sc               | 关闭当前窗口         |
| `<leader>` + t   | 底部打开terminal     |
| `<leader>` + vt  | 侧边打开terminal     |
| s,               | 当前窗口左右比例缩小 |
| s.               | 当前窗口左右比例放大 |
| sj               | 当前窗口上下比例放大 |
| sk               | 当前窗口上下比例缩小 |

#### tree（侧边栏）相关

| 快捷键   | 作用                 |
| -------- | -------------------- |
| ctrl + m | 隐藏与显示tree       |
| Enter    | 打开tree中选中的文件 |
| v        | 左右分屏打开         |
| h        | 上下分屏             |
| i        | 忽略node_modules     |
| .        | 显示与隐藏隐藏文件   |
| F5       | refresh file         |
| a        | create file          |
| d        | remove file          |
| r        | rename file          |
| x        | cut file             |
| c        | copy file            |
| p        | paste file           |
| s        | system_open file     |
| o        | open file            |

#### telescope搜索相关

| 快捷键                      | 作用             |
| --------------------------- | ---------------- |
| ctrl + p                    | 搜索文件         |
| ctrl + f                    | 全局搜索         |
| # 以下命令是在👆的命令后使用 |                  |
| ctrl + j                    | 向下移动选择文件 |
| ctrl + k                    | 向上移动选择文件 |
| ctrl + n                    | 历史搜索下一个   |
| ctrl + p                    | 历史搜索上一个   |
| ctrl + c                    | 关闭搜索页面     |
| ctrl + u                    | 预览上滚         |
| ctrl + d                    | 预览下滚         |

#### LSP相关

| 快捷键          | 作用                         |
| --------------- | ---------------------------- |
| gd              | 跳到变量的定义处             |
| gh              | 悬浮显示当前变量的信息       |
| gp              | 显示当前文件的错误的代码信息 |
| gj              | 跳到下一个错误代码的地方     |
| gk              | 跳到上一个错误代码的地方     |
| `<leader>` + f  | 格式化代码                   |
| ctrl + j/n      | 选择下一个提示               |
| ctrl + k/p      | 选择上一个提示               |
| Enter           | 确认选择                     |
| `<leader>` + rn | 重命名变量名                 |

#### 退出

| 快捷键 | 作用 |
| ------ | ---- |
| q      | :q   |
| qq     | :q!  |
| Q      | :qa! |

------

### Inser模式下

#### 移动/编辑相关

| 快捷键           | 作用         |
| ---------------- | ------------ |
| option + h/j/k/l | 左下上右移动 |
| ctrl + b         | 到末尾       |
| ctrl + e         | 到首         |
| ctrl + j         | 开辟新行     |

------

### Visual模式下

#### 移动相关

| 快捷键     | 作用                 |
| ---------- | -------------------- |
| j          | 向下移动代码         |
| k          | 向上移动选中的代码   |
| <          | 左缩进代码           |
| 右缩进代码 |                      |
| =          | 选中代码后格式化代码 |

------

### 常用命令

| 命令                                        | 作用                                                         |
| ------------------------------------------- | ------------------------------------------------------------ |
| :q                                          | 退出                                                         |
| :q!                                         | 强制退出                                                     |
| :w                                          | 保存                                                         |
| :qa                                         | 退出并关闭                                                   |
| :qa!                                        | 强制退出并关闭                                               |
| :wq                                         | 保存并退出                                                   |
| :PackerCompile                              | 每次改变插件配置时，必须运行此命令或 `PackerSync`, 重新生成编译的加载文件 |
| :PackerClean                                | 清除所有不用的插件                                           |
| :PackerInstall                              | 清除，然后安装缺失的插件                                     |
| :PackerUpdate                               | 清除，然后更新并安装插件                                     |
| :PackerSync（最常使用）                     | 执行 `PackerUpdate` 后，再执行 `PackerCompile`               |
| :h base-directories                         | 查看详细文档                                                 |
| :echo stdpath("data")                       | 查看你系统下Neovim的数据存储在标准数据目录的实际路径         |
| :colorscheme Tab键                          | 查看内置主题色                                               |
| :echo $VIMRUNTIME                           | 查看$VIMRUNTIME` 具体的路径                                  |
| :h nvim-tree.setup                          | 查看nvim-tree的帮助文档                                      |
| :NvimTreeToggle                             | 再按Enter即可打开或关闭侧边栏                                |
| :checkhealth telescope                      | 检查telescope依赖情况                                        |
| :Telescope find_files                       | 打开搜索文件窗口，快速打开文件                               |
| :Telescope live_grep                        | 可以打开搜索窗口，输入内容后，结果会实时显示                 |
| :Telescope buffers                          | 命令可以列出打开的 buffers                                   |
| :Telescope git_files                        | 列出 git 文件                                                |
| :Telescope man_pages                        | 列出帮助                                                     |
| :Telescope env                              | 打开环境变量列表                                             |
| Telescope colorscheme                       | 换肤功能                                                     |
|                                             |                                                              |
| :TSInstallInfo                              | 命令查看 language parsers 列表与安装状态                     |
| :TSInstall <language_to_install>            | 安装指定的 `Language parser` 例如:TSInstall javascript       |
| :TSModuleInfo                               | 查看你的模块是否开启成功                                     |
|                                             |                                                              |
| LSP相关命令                                 |                                                              |
| :h lsp                                      | 查看 LSP 文档                                                |
| :LspInstallInfo                             | 安装 LSP Servers的图形化界面                                 |
| j/k                                         | 移动光标到你要安装的 server                                  |
| i                                           | 安装server                                                   |
| X                                           | 卸载该 server                                                |
| u                                           | 更新 server                                                  |
| U                                           | 更新所有 servers                                             |
| c                                           | 检查 server 新版本                                           |
| C                                           | 检查所有 servers 的新版本                                    |
| Esc                                         | 关闭窗口                                                     |
| ?                                           | 显示其他帮助信息                                             |
|                                             |                                                              |
| :LspInfo                                    | 查看绑定的 Language Server 信息                              |
| :NullLsInfo                                 | 查看源的激活情况                                             |
| :lua vim.lsp.buf.formatting_sync()          | 格式化代码                                                   |
| :lua vim.lsp.buf.formatting_sync(nil, 9999) | 不加参数可能会报Time out                                     |
| echo executable('xxx')                      | 查看某个命令是否可用 例如echo executable('rubocop')查看rubocop是否可用，一般用来排查格式化代码时需要的命令是否已安装 |





参考：

https://github.com/qiqiboy/q-vim

https://www.cnblogs.com/cniwoq/p/13272746.html

https://kaiza-hikaru-del.github.io/my_arch_experience/neovim/config/

https://juejin.cn/post/7084462939595341831
