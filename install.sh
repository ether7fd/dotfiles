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

# 4. OSごとの処理 (Linux向け依存パッケージのインストール)
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Checking required packages for Linux..."
    # Homebrewに必要な build-essential や git 等もまとめて確認・インストール
    if ! command -v curl &> /dev/null || ! command -v git &> /dev/null || ! command -v make &> /dev/null; then
        echo "Installing required packages (curl, git, build-essential, procps, file)..."
        sudo apt update && sudo apt install -y curl git build-essential procps file
    fi
fi

# 5. 各ツールのインストール
## Homebrew
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    # NONINTERACTIVE=1 を付与して非対話モードでインストール
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # インストールしたOSに合わせてパスを通す
    if [ -x /opt/homebrew/bin/brew ]; then
        # Mac (Apple Silicon)
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
        # Linux / WSL
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    elif [ -x /usr/local/bin/brew ]; then
        # Mac (Intel)
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi

## fisher
if ! command -v brew &> /dev/null; then
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fi

# 6. Brewfile の実行
if [ -f "$DOTFILES_DIR/Brewfile" ]; then
    echo "Installing packages from Brewfile..."
    brew bundle --file "$DOTFILES_DIR/Brewfile"
fi

## TODO
- [ ] fish config install

echo "Done"
