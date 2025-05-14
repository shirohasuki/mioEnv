#!/bin/zsh

# 颜色设置
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 显示菜单
show_menu() {
    echo -e "${BLUE}=== Mio 环境安装工具 ===${NC}"
    echo -e "${GREEN}1.${NC} 标准安装 (推荐)"
    echo -e "${GREEN}2.${NC} 安装 ZSH"
    echo -e "${GREEN}3.${NC} 安装 VIM 插件"
    echo -e "${GREEN}4.${NC} 安装 Anaconda"
    echo -e "${GREEN}5.${NC} 安装 代理配置"
    echo -e "${GREEN}6.${NC} 安装 1Panel"
    echo -e "${GREEN}7.${NC} 全部安装"
    echo -e "${GREEN}0.${NC} 退出"
    echo
    echo -n -e "${YELLOW}请选择操作 [0-7]: ${NC}"
}

# 执行安装
run_install() {
    case $1 in
        "zsh")
            echo -e "${BLUE}正在安装 ZSH...${NC}"
            zsh ./install_ohmyzsh.sh
            ;;
        "vim")
            echo -e "${BLUE}正在安装 VIM 插件...${NC}"
            zsh ./install_vim.sh
            ;;
        "conda")
            echo -e "${BLUE}正在安装 Anaconda...${NC}"
            zsh ./install_conda.sh
            ;;
        "proxy")
            echo -e "${BLUE}正在安装 代理配置...${NC}"
            zsh ./install_proxy.sh
            ;;
        "1panel")
            echo -e "${BLUE}正在安装 1Panel...${NC}"
            sudo zsh ./install_1panel.sh
            ;;
        *)
            echo -e "${RED}未知的安装选项${NC}"
            ;;
    esac
}

# 标准安装
standard_install() {
    echo -e "${BLUE}开始标准安装...${NC}"
    run_install "zsh"
    run_install "vim"
    run_install "conda"
    run_install "proxy"
    echo -e "${GREEN}标准安装完成！${NC}"
}

# 全部安装
full_install() {
    echo -e "${BLUE}开始全部安装...${NC}"
    standard_install
    run_install "1panel"
    echo -e "${GREEN}全部安装完成！${NC}"
}

# 检查脚本是否存在
check_scripts() {
    local missing=0
    if [ ! -f "./install_zsh.sh" ]; then
        echo -e "${RED}错误: 未找到 install_zsh.sh${NC}"
        missing=1
    fi
    if [ ! -f "./install_vim.sh" ]; then
        echo -e "${RED}错误: 未找到 install_vim.sh${NC}"
        missing=1
    fi
    if [ ! -f "./install_conda.sh" ]; then
        echo -e "${RED}错误: 未找到 install_conda.sh${NC}"
        missing=1
    fi
    if [ ! -f "./install_proxy.sh" ]; then
        echo -e "${RED}错误: 未找到 install_proxy.sh${NC}"
        missing=1
    fi
    if [ ! -f "./install_1panel.sh" ]; then
        echo -e "${RED}错误: 未找到 install_1panel.sh${NC}"
        missing=1
    fi
    
    if [ $missing -eq 1 ]; then
        echo -e "${RED}缺少必要的安装脚本，请确保所有脚本都在当前目录中。${NC}"
        exit 1
    fi
}

# 主函数
main() {
    # 检查sudo权限
    check_sudo
    
    # 检查脚本是否存在
    check_scripts
    
    if [ $# -eq 0 ]; then
        # 交互模式
        while true; do
            show_menu
            read choice
            echo
            
            case $choice in
                1)
                    standard_install
                    ;;
                2)
                    run_install "zsh"
                    ;;
                3)
                    run_install "vim"
                    ;;
                4)
                    run_install "conda"
                    ;;
                5)
                    run_install "proxy"
                    ;;
                6)
                    run_install "1panel"
                    ;;
                7)
                    full_install
                    ;;
                0)
                    echo -e "${GREEN}感谢使用！${NC}"
                    exit 0
                    ;;
                *)
                    echo -e "${RED}无效的选择，请重试${NC}"
                    ;;
            esac
            echo
        done
    else
        # 命令行参数模式
        for arg in "$@"; do
            case $arg in
                "standard")
                    standard_install
                    ;;
                "zsh")
                    run_install "zsh"
                    ;;
                "vim")
                    run_install "vim"
                    ;;
                "conda")
                    run_install "conda"
                    ;;
                "proxy")
                    run_install "proxy"
                    ;;
                "1panel")
                    run_install "1panel"
                    ;;
                "full")
                    full_install
                    ;;
                *)
                    echo -e "${RED}未知参数: $arg${NC}"
                    ;;
            esac
        done
    fi
}

# 执行主函数
main "$@"