#!/bin/sh

cd ~/
sudo apt update && sudo apt install -y git stow vim neovim neofetch zsh tmux ripgrep unzip

NERD_FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip"
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p $FONT_DIR
curl -fLo "$FONT_DIR/JetBrainsMono.zip" $NERD_FONT_URL
unzip "$FONT_DIR/JetBrainsMono.zip" -d $FONT_DIR
fc-cache -fv

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s $(which zsh)

FORCE=y sh -c "$(curl -fsSL https://starship.rs/install.sh)"

ZSH_PLUGINS=~/.oh-my-zsh/custom/plugins
install_plugin() {
    local repo=$1
    local plugin_name=$(basename $repo)
    local plugin_path=$ZSH_PLUGINS/$plugin_name
    
    if [ -d "$plugin_path" ]; then
        git -C $plugin_path pull
    else
        git clone $repo $plugin_path
    fi
}

install_plugin https://github.com/zsh-users/zsh-autosuggestions
install_plugin https://github.com/zsh-users/zsh-syntax-highlighting

git clone --recurse-submodules https://github.com/Aidenable/server-dotfiles.git _
rm -rf ~/.zshrc
cd ~/_ && stow --restow */ && cd ~/
