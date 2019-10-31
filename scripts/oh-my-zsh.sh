#!/bin/bash

# install git zsh
sudo yum install -y git zsh curl wget

# install on my zsh
sudo sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install zplug
sudo curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# add Docker Aliases
cat >> /root/.zshrc <<EOF
export LC_ALL=C
source ~/.zplug/init.zsh
# Supports oh-my-zsh plugins and the like
zplug "akarzim/zsh-docker-aliases"
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
# Then, source plugins and add commands to \$PATH
zplug load --verbose
EOF

source /root/.zshrc
