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



参考：

https://github.com/qiqiboy/q-vim

https://www.cnblogs.com/cniwoq/p/13272746.html

https://kaiza-hikaru-del.github.io/my_arch_experience/neovim/config/
