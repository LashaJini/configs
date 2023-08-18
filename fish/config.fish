set -g -x fish_greeting ''
# set -g -x fish_greeting ''

# exit on <c-d>
bind \cd 'exit'

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

set -x DENO_INSTALL ~/.deno
set -x GOPATH ~/go
set -x PATH $DENO_INSTALL/bin:$GOPATH/bin:$PATH

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# ====> fzf
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# fuzzy search on <c-f> (-M cuz vi binding is enabled)
# --preview="less {}"
# --bind "enter:execute(less {})"

# fuzzy find directories and cd into it
bind -M insert \cf 'cd (fdfind -t d . --exclude node_modules --exclude target "/home/$USER/" | fzf); commandline -f repaint'
# fuzzy find directory, cd into it and start tmux session
# bind -M insert \ct 'cd (fdfind -t d . --exclude node_modules --exclude target "/home/$USER/" | fzf) && tmux_session.sh'
# bind -M insert \ct 'cd (fdfind -t d . --exclude node_modules --exclude target "/home/$USER/" | fzf) && yes "" | tmux_session.sh; commandline -f repaint'
bind -M insert \ct ct
function ct 
  set dirname (fdfind -t d . --exclude node_modules --exclude target "/home/$USER/" | fzf)
  count $dirname > 0 && \
  cd $dirname && \
  read -l -P "Session name: " name && \
  commandline -f repaint && \
  tmux_session.sh $name
end
# fuzzy find wallpaper images and set as bg
bind -M insert \cw 'fdfind --exclude node_modules --exclude target -t f . ~/images/wallpapers/ | fzf --bind "enter:execute(feh --bg-scale {})"'

# fuzzy find file and nvim it
bind -M insert \cn 'fdfind --exclude node_modules --exclude target -t f . "/home/$USER" | fzf --bind "enter:execute(nvim {})"'

# bind -M insert "ç" fzf-cd-widget

set -x FZF_DEFAULT_OPTS '--cycle --height=50% --border=rounded --margin=1,1,1,1 --pointer="->" --color=16'
# set -x FZF_ALT_C_COMMAND 'fd -t d . "/home/$USER/mit"'

# if not set --query FZF_ALT_C_COMMAND
#   set --global --export FZF_ALT_C_COMMAND 'fd -t d . "/home/$USER/mit"'
# end

# if not set --query FZF_DEFAULT_OPTS
#   set --global --export FZF_DEFAULT_OPTS '--cycle --height=50% --border=rounded --margin=1,1,1,1 --pointer="->" --color=16'
# end

# rbenv
status --is-interactive; and source (rbenv init -|psub)
