#!/usr/bin/env bash
set -veuo pipefail

SCRIPT_DIR=$(perl -MCwd=realpath -le 'print realpath shift' "$0/..")
# スクリプト中で使われるPATHを予め通しておく
PATH="$PATH:/opt/homebrew/bin"
PATH="$PATH:$HOME/.local/share/mise/installs/python/latest/bin"
PATH="$PATH:$HOME/.local/share/mise/installs/node/latest/bin"

# ディレクトリのsymlinkを作る
function symlink_dir() {
    src=$1
    dst=$2
    [[ -L "$dst" ]] && rm -fr "$dst"
    ln -sf "$src" "$dst"
}


#
# Homebrew
#
if ! which brew; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

#
# Git
#
mkdir -p $HOME/.config/
symlink_dir $SCRIPT_DIR/git $HOME/.config/git
brew install difftastic

#
# mise
#
if [[ ! -e "$HOME/.local/bin/mise" ]]; then
    curl https://mise.run | sh
fi

#
# Node
#
if ! which node; then
    $HOME/.local/bin/mise use --global node
fi

#
# Python
#
brew install xz
if ! which python; then
    $HOME/.local/bin/mise use --global python
fi

#
# Rust
#
sh <(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs) -y

#
# zsh
#
mkdir -p $HOME/.config/zsh
ln -sf $SCRIPT_DIR/zsh/zprofile $HOME/.zprofile
ln -sf $SCRIPT_DIR/zsh/zshenv $HOME/.zshenv
ln -sf $SCRIPT_DIR/zsh/zshrc $HOME/.zshrc
ln -sf $SCRIPT_DIR/zsh/p10k.zsh $HOME/.config/zsh/p10k.zsh
brew install coreutils gnu-sed
