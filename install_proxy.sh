#!/bin/zsh

echo "添加代理设置到 ~/.zshrc"

cat << 'EOL' >> ~/.zshrc

# proxy
alias setproxy='export ALL_PROXY=socks5h://127.0.0.1:7890'
alias unsetproxy='unset ALL_PROXY'
EOL

echo "代理设置已添加到 ~/.zshrc"
source ~/.zshrc 
