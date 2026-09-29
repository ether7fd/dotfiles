# 改善案・追加プラグイン提案

## Neovim 用追加プラグイン

### コード補完系
- **nvim-cmp** + **cmp_luasnippet**: 高度なコード補完（現在 fzf-lua のみ）
- **luasnip**: スニペット管理
- **vsnip**: Vim 互換スニペット

### テキストオブジェクト・編集支援
- **nvim-surround**: 括弧・引用符の挿入・削除
- **triple-sentences**: 文単位での操作
- **vim-tmux-navigator**: tmux pane 移動（tmux 内でも使える）

### LSP 関連
- **mason.nvim**: LSP サーバー管理
- **mason-lspconfig.nvim**: LSP 設定自動化
- **nvim-lspconfig**: LSP クライアント設定
- **none-ls.nvim**: 静的解析・フォーマター統合

### 検索・grep
- **telescope.nvim**: fzf-lua の代替（Lua 製、高速）
- **ripgrep**: 既に Brewfile にあるため利用可能

### 日本語入力強化
- **skkeleton** は現在実装済みだが：
  - **skk-dict**: より多くの辞書追加
  - **denops-skk**: 別 SKK 実装（denops 非依存）

### UI・見た目
- **harpoon2**: 素早くファイル間移動
- **indent-blankline**: インデント可視化
- **bufferline.nvim**: バッターバー改善
- **notify.nvim**: 通知システム
- **which-key.nvim**: キーマップ表示

### 言語サポート
- **treesitter**: 構文解析（現在未実装）
- **rust-tools**, **gopls**, **pyright** など各言語用 LSP

## fish シェル用追加プラグイン

### 既に実装済み
- **tide**: パーフェクトなプロンプト（fish_plugins にあるが設定なし）

### 追加提案
- **zsh-autosuggestions** 相当: `fish-terminals`
- **syntax-highlighting**: コマンド構文ハイライト
- **colored-man-pages**: man ページの色付け
- **git.fish**: fish 用 git 補完強化

## tmux プラグイン追加

### 既に実装済み
- tpm, sensible, resurrect

### 追加提案
- **tmux-yank**: クリップボード連携（yank 機能）
- **tmux-resurrect** 強化: 設定保存
- **dark-mode-tmux**: 時間帯でテーマ切り替え
- **quick-sync**: tmux 設定高速適用

## パッケージ追加提案 (Brewfile)

### 開発ツール
- **just**: タスクランナー（Make 代替）
- **ripgrep** は既にあるが：
  - **fd**: 既にある
  - **atuin**: コマンド履歴保存・検索
  - **eza**: ls 強化版（git 情報表示）

### 言語別ツール
- **nodejs** / **nvm**: JavaScript 管理
- **ruby**: 既存か確認
- **golang**: Go 開発用
- **java**: JDK 管理

### 便利パッケージ
- **exa**: ls 強化（git 情報表示）
- **trash-cli**: ごみ箱に移動
- **bat** は既にあるが：
  - **moreutils**: 追加ユーティリティ
  - **pipe-view**: パイプ可視化

## 設定改善案

### Neovim
1. **LSP 設定**: 現在未実装のため優先度高
2. **treesitter**: 構文解析によるハイライト強化
3. **マクロ機能**: `macro-recording` 系プラグイン
4. **git 連携**: `gitsigns.nvim` で行単位差分表示

### fish シェル
1. **tide プロンプト設定**: 現在インストールのみ
2. **git.fish**: fish 用 git 補完強化
3. **aliases.fish**: bash のエイリアスを移設

### tmux
1. **pane 保存**: 複数セッション管理
2. **ウィンドウ自動作成**: 作業ディレクトリ連動
3. **status-bar 改善**: プラグイン情報表示

## 優先順位

### 高優先度（開発効率に直結）
1. LSP 設定 + nvim-cmp
2. treesitter ハイライト
3. git signs 表示
4. tide プロンプト設定

### 中優先度（利便性向上）
5. telescope.nvim
6. harpoon2
7. atuin コマンド履歴
8. eza / bat 強化

### 低優先度（見た目・趣味）
9. notify.nvim
10. which-key.nvim
11. tmux-yank
12. 各種 UI プラグイン

## 実装順序提案

```bash
# 1. LSP 基盤
brew install mason-lspconfig nvim-cmp luasnip

# 2. 検索強化
brew install ripgrep fd

# 3. 開発ツール
brew install just atuin eza

# 4. fish 補完
fisher install marshallparker/fish-git
```

## 参考リポジトリ

- **nvim**: [neovim.io](https://neovim.io)
- **fish**: [fishshell.com](https://fishshell.com)
- **tmux**: [github.com/tmux/tmux](https://github.com/tmux/tmux)
