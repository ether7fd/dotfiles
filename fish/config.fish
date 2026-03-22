set -U fish_greeting

# カラーテーマ
set -gx LS_COLORS (vivid generate molokai)

if status is-interactive
    # Commands to run in interactive sessions can go here
end

abbr -a ll " ls --color --group-directories-first -AlhFX"
abbr -a ls " ls --color"

abbr -a clip "iconv -c -f UTF-8 -t CP932 | clip.exe"
function catclip
    cat $argv | iconv -c -f UTF-8 -t CP932 | clip.exe
end

# 移動系
## ディレクトリ移動の略語設定
abbr -a ..    cd ..
abbr -a ...   cd ../..
abbr -a ....  cd ../../..
abbr -a ..... cd ../../../..

# ツール系
## android studio
abbr -a studio "nohup ~/bin/android-studio/bin/studio > /dev/null 2>&1 &"

abbr -a n "nvim"
abbr -a h "history"
abbr -a t "tig"
abbr -a ti "tig"
abbr -a ur "uv run"
abbr -a docker "podman"

zoxide init fish | source

# Set up fzf key bindings
fzf --fish | source

# 関数
function cd
    builtin cd $argv
    ls -aF
end

function cl
    builtin cd $argv
    ls --color --group-directories-first -AlhFX
end

function gitsync
    git pull origin --prune
    and git add .
    and git commit -m (date "+%Y-%m-%d %H:%M:%S")
    and git push origin HEAD
end

set -gx PATH $HOME/.local/bin $PATH
