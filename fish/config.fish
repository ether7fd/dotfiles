set -g fish_greeting

# カラーテーマ
set -gx LS_COLORS (vivid generate molokai)

set -gx EDITOR nvim

if status is-interactive
    # --- 初期設定 (fzf / zoxide) ---
    fzf --fish | source
    zoxide init fish | source

    # --- キーバインド ---

    # --- 略称 (Abbreviation) ---
    # 表示系
    abbr -a -g ll "ls --color --group-directories-first -AlhFX"
    abbr -a -g ls "ls --color"

    # 移動系
    abbr -a -g -- - 'cd -'
    abbr -a -g .. 'cd ..'
    abbr -a -g ... 'cd ../..'
    abbr -a -g .... 'cd ../../..'

    # ツール系
    abbr -a studio "nohup ~/bin/android-studio/bin/studio > /dev/null 2>&1 &"
    abbr -a clip "iconv -c -f UTF-8 -t CP932 | clip.exe"
    function catclip
        cat $argv | iconv -c -f UTF-8 -t CP932 | clip.exe
    end
    if type -q nvim
        abbr -a -g n "nvim"
    end

    if type -q tig
        abbr -a -g t "tig"
        abbr -a -g ti "tig"
    end

    if type -q podman
        abbr -a -g docker "podman"
    end
    if type -q uv
        abbr -a ur "uv run"
    end
end

# --- 関数定義 ---
function fish_user_key_bindings
    # Alt + z で zoxide + fzf を起動
    bind \ez zi
end

# cd した後に自動で ls
function cd
    builtin cd $argv
    ls -aF
end

# 詳しく表示して移動する関数
function cl
    builtin cd $argv
    ls --color --group-directories-first -AlhFX
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

function gitsync
    git pull origin --prune
    and git add .
    and git commit -m (date "+%Y-%m-%d %H:%M:%S")
    and git push origin HEAD
end

set -gx PATH $HOME/.local/bin $PATH
