set -g -x fish_greeting ''
set -g -x fish_greeting ''

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
set -x PATH $DENO_INSTALL/bin:$PATH
