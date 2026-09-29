# dotfiles

このリポジトリには、開発環境の設定ファイルが格納されています。

## 構成要素

### Shell
- **bash**: `.bashrc` で設定（fzf による補完、色付きコマンド出力）
- **fish**: `~/.config/fish/` に設定（エイリアス、関数定義、zoxide + fzf 連携）

### エディタ
- **Neovim**: Lua スクリプトでカスタマイズ
  - fzf-lua: ファイル検索・ダイアログ
  - oil.nvim: ファイルマネージャー
  - skkeleton: SKK 日本語入力（denops.vim 使用）
  - lazy.nvim: プラグイン管理

### Terminal Multiplexer
- **tmux**: `.tmux.conf` で設定
  - tmux-plugin-manager (tpm) によるプラグイン管理
  - tmux-sensible, tmux-resurrect 対応
  - vim キーバインド、pane 移動（hjkl）

### Git ツール
- **tig**: `.tigrc` でカスタマイズ（コミット履歴表示、差分確認）

### パッケージ (Homebrew)
```
bat, cowsay, deno, difftastic, fd, fish, fzf, gh, git-delta, git-lfs,
gron, htop, jq, lazygit, lolcat, neovim, nyancat, podman, ripgrep, sl,
sqlite, tcl-tk, toilet, tree, uv, vivid, zoxide, colordiff
```

## インストール方法

```bash
./install.sh
```

- Homebrew がない場合は自動インストール
- Brewfile に基づいてパッケージをインストール
- fisher で fish プラグインを同期
- Neovim と tmux の設定を `~/.config/` にリンク

## 主な機能

### Shell 機能
- fzf による fuzzy finder（コマンド履歴・ファイル検索）
- zoxide による高速ディレクトリ移動
- fish でのエイリアス定義（ll, .., docker→podman など）
- cd 時に自動で ls 表示

### Neovim 機能
- `<Leader>ff`: ファイル検索
- `<Leader>fg`: グローバル grep
- `<C-n><C-n>`: oil.nvim でファイルツリー表示
- `<C-j>`: SKK 入力 ON / `<C-g>`: OFF

### tmux 機能
- `C-k`: プレフィックスキー
- `hjkl`: pane 移動
- `/` と `\`: pane 分割
- 自動保存・復元（tmux-resurrect）

### Git 機能
- `tig`: 履歴視覚化
- `git-delta`: 色付き差分表示
- lazygit: ターミナル用 git クライアント
