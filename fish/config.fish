set -g fish_greeting

set -gx LANG ja_JP.UTF-8
set -gx LC_ALL ja_JP.UTF-8

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
    abbr -a l " ls --color --group-directories-first -AlhFX"
    abbr -a ll " eza -laF --icons --group-directories-first --sort=ext"
    abbr -a lt " eza -lTaF --icons --group-directories-first --sort=ext"
    abbr -a ls " ls --color"

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
        abbr -a -g ns "nvim ." # session復元用
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

    if type -q bat
        abbr -a cat "bat"
    end
end

# --- 関数定義 ---
function fish_user_key_bindings
    # Alt + z で zoxide + fzf を起動
    bind \ez zi
end

# cd した後に自動で ls
function __auto_ls --on-variable PWD
    if status is-interactive; and isatty stdout
        ls -aF
    end
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

# fzfを使ってNeovimでファイルを開く関数
function v
    # fdでファイルとディレクトリを検索し、fzfに渡す
    set -l target (fd --hidden --exclude .git 2>/dev/null | fzf \
        --height=80% \
        --layout=reverse \
        --separator="─" \
        --border=rounded \
        --prompt="Directory> " \
        --preview 'if [ -d {} ]; then ls -1A --color=always {}; else bat -n --color=always {}; fi' \
        --preview-window="right:50%:border-rounded")

    # 選択が確定(Enter)された場合の処理
    if test $status -eq 0
        # 選んだのがディレクトリならそこに移動(cd)、ファイルならNeovimで開く
        if test -d "$target"
            cd "$target"
            # プロンプトの表示を更新する
            commandline -f repaint
        else
            nvim "$target"
        end
    end
end

function gitsync
    # 変更がある場合のみ実行
    if not git diff --quiet HEAD
        git pull origin --prune
        and git add .
        and git commit -m (date "+%Y-%m-%d %H:%M:%S")
        and git push origin HEAD
    else
        echo "No changes to sync."
    end
end

fish_add_path $HOME/.local/bin

# for ghostty
set -gx LD_LIBRARY_PATH "/home/linuxbrew/.linuxbrew/lib:$HOME/.local/lib:$LD_LIBRARY_PATH"
if grep -q "microsoft" /proc/version
    set -gx GALLIUM_DRIVER d3d12
    set -gx MESA_GL_VERSION_OVERRIDE 4.6
    set -gx MESA_GLSL_VERSION_OVERRIDE 460
end
