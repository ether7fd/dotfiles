set -U fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here

    ## abbr

    ### initialize
    # Set up fzf key bindings
    fzf --fish | source

    ### 表示系
    abbr -a -g ll " ls --color --group-directories-first -AlhFX"
    abbr -a -g ls " ls --color"

    ### 移動系
    abbr -a -g -- - 'cd -'
    abbr -a -g .. 'cd ..'
    abbr -a -g ... 'cd ../..'
    abbr -a -g .... 'cd ../../..'

    ### ツール系
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
end

function cd
    builtin cd $argv
    ls -aF
end

function cl
    builtin cd $argv
    ls --color --group-directories-first -AlhFX
end

set -gx PATH $HOME/.local/bin $PATH
