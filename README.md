# Mio Env
My one-click development environment installation script.

## 安装内容
- ZSH (standard)
- VIM 插件 (standard)
- Anaconda (standard)
- 代理配置 (standard)
- 1Panel (full)

## 快速开始

1. 克隆仓库到本地：

```zsh
git clone https://github.com/yourusername/mioEnv.git
cd mioEnv
```

2. 运行安装脚本：

```zsh
./mioEnv-setup.sh
```

## 使用方法

### 交互式菜单

运行脚本后会显示交互式菜单：

```zsh
./mioEnv-setup.sh
```

### 命令行参数

也可以通过命令行参数指定要安装的组件：

```zsh
# 标准安装 (ZSH + VIM插件 + Anaconda + 代理配置)
./mioEnv-setup.sh standard

# 安装单个组件
./mioEnv-setup.sh zsh
./mioEnv-setup.sh vim
./mioEnv-setup.sh conda
./mioEnv-setup.sh proxy
./mioEnv-setup.sh 1panel

# 全部安装
./mioEnv-setup.sh full

# 组合安装
./mioEnv-setup.sh zsh vim proxy
```

## 安装组件说明

- **标准安装**：包含 ZSH、VIM 插件、Anaconda 和代理配置
- **ZSH**：安装并配置 ZSH 和 Oh-My-ZSH
- **VIM 插件**：配置 VIM 编辑器和常用插件
- **Anaconda**：安装 Python 科学计算环境
- **代理配置**：设置系统代理
- **1Panel**：安装服务器管理面板
- **全部安装**：包含标准安装及 1Panel

## 要求

- 需要root权限
- Linux 
- Bash 或兼容的 Shell
- 网络连接
