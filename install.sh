#!/usr/bin/env bash

# 未定義な変数があったら途中で終了
set -u
# エラーが発生した時点で停止
set -e
set -o pipefail

# スクリプトの場所を絶対パスで取得
DOTFILES_DIR=$(cd "$(dirname "$0")"; pwd)
cd "$DOTFILES_DIR"

echo "Starting dotfiles setup..."

# 1. 必要なディレクトリの作成
mkdir -p ~/.config

# 2. ホームディレクトリ直下のドットファイルのリンク
# .git, .DS_Store, .config などを除外するルール
echo "Linking dotfiles to home directory..."
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".github" ] && continue
    [ "$f" = ".DS_Store" ] && continue

    ln -snfv "$DOTFILES_DIR/$f" ~/
done

# 3. Neovimの設定を ~/.config/nvim にリンク
if [ -d "$DOTFILES_DIR/nvim" ]; then
    echo "Linking Neovim config..."
    ln -snfv "$DOTFILES_DIR/nvim" ~/.config/nvim
fi

# 4. OSごとの処理 (curlの確認など)
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if ! command -v curl &> /dev/null; then
        echo "Installing curl..."
        sudo apt update && sudo apt install -y curl
    fi
fi

# 5. Homebrew のインストール
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Apple Silicon Mac の場合はパスを通す必要がある
    if [ -f /opt/homebrew/bin/brew ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi

# 6. Brewfile の実行
if [ -f "$DOTFILES_DIR/Brewfile" ]; then
    echo "Installing packages from Brewfile..."
    brew bundle --file "$DOTFILES_DIR/Brewfile"
fi

echo "Done"
