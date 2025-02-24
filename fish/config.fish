set -g -x fish_greeting ''

# exit on <c-d>
bind \cd exit

# vi stuff
# <c-c> clears input now
set -g fish_key_bindings fish_vi_key_bindings
bind -M insert \cc kill-whole-line force-repaint

# <a-f> auto complete the suggestion
function fish_user_key_bindings
    for mode in insert default visual
        bind -M $mode \ef forward-char
    end
end

# starship
starship init fish | source

set -U fish_user_paths $HOME/.rvm/bin $fish_user_paths
set -U fish_user_paths /opt/nvim/ $fish_user_paths
set -U fish_user_paths $HOME/.local/bin $fish_user_paths
set -U fish_user_paths /snap/bin $fish_user_paths
set -U fish_user_paths /opt/flutter/bin $fish_user_paths
set -U fish_user_paths $HOME/.pub-cache/bin/ $fish_user_paths

# aliases
alias g="git"
alias k="kubectl"
alias mk="minikube"
alias mkk="minikube kubectl --"
alias d="docker"
alias docker-compose="docker compose"
alias pgo-cd="cd $HOME/ws/github/wholesome-ghoul/playground/go"
alias lazyvim="NVIM_APPNAME=lazyvim nvim"

function dpsql
    set -l host localhost # default host

    # Ensure at least 4 arguments remain: container, user, port, and database
    if test (count $argv) -lt 4
        echo "Usage: dpsql <container_name> <user> <port> <database> [-h <host>]"
        return 1
    end

    # Check if -h flag is provided
    if test (count $argv) -gt 5
        if test $argv[5] = -h
            set host $argv[6]
        end
    end

    # usage: dpsql <container_name> <user> <port> <database> [-h <host>]
    docker exec -it $argv[1] \
        bash -c "echo 'set -o vi'>~/.bashrc && \
	             echo 'set editing-mode vi'>~/.inputrc && \
	             psql -h $host -U $argv[2] -p $argv[3] -d $argv[4] -W"
end

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# ====> fzf
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# fuzzy find directories and cd into it
bind -M insert \cf 'cd (fdfind -t d . --exclude node_modules --exclude target "$HOME/" | fzf); commandline -f repaint'
# fuzzy find directory, cd into it and start tmux session
bind -M insert \ct ct
function ct
    set dirname (fdfind -t d . --exclude node_modules --exclude target "$HOME/" | fzf)
    count $dirname >0 && cd $dirname && read -l -P "Session name: " name && commandline -f repaint && tmux_session.sh $name
end
# fuzzy find wallpaper images and set as bg
bind -M insert \cw 'fdfind --exclude node_modules --exclude target -t f . ~/images/wallpapers/ | fzf --bind "enter:execute(feh --bg-scale {})"'

# fuzzy find file and nvim it
bind -M insert \cn 'fdfind --exclude node_modules --exclude target -t f . "$HOME" | fzf --bind "enter:execute(nvim {})"'

set -x FZF_DEFAULT_OPTS '--cycle --height=50% --border=rounded --margin=1,1,1,1 --pointer="->" --color=16'

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin $HOME/.ghcup/bin $PATH # ghcup-env

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

minikube completion fish | source
kubectl completion fish | source
