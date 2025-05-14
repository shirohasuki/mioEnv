#!/bin/sh

sudo apt install zsh
chsh -s /bin/zsh

bash ./install_ohmyzsh.sh

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

##命令自动补全插件
mkdir ~/.oh-my-zsh/plugins/incr
wget http://mimosa-pudica.net/src/incr-0.2.zsh -O ~/.oh-my-zsh/plugins/incr/incr.plugin.zsh
##命令自动推荐，根据历史记录
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
##目录自动跳转插件
sudo apt install autojump

##配置zshrc文件，添加插件
sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting)/' ~/.zshrc

##添加终端配置到zshrc文件末尾
cat >> ~/.zshrc << 'EOF'
#设置终端颜色，提示符，及上一条指令返回码提示
autoload -U colors && colors
PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%1~ %{$reset_color%}%# "
RPROMPT="[%{$fg[yellow]%}%?%{$reset_color%}]"
# Useful support for interacting with Terminal.app or other terminal programs
[ -r "/etc/zshrc_$TERM_PROGRAM" ] && . "/etc/zshrc_$TERM_PROGRAM"
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/autojump/autojump.sh
source ~/.oh-my-zsh/plugins/incr/incr*.zsh
EOF

echo "ZSH配置完成，请重启终端或执行 source ~/.zshrc 使配置生效"