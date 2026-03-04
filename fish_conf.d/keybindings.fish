# Binds option-up
bind \e\[1\;5A history-token-search-backward

# Binds super-up (for emacs vterm integration, where there is no "option"
bind \e\[1\;2A history-token-search-backward

# option-down
bind \e\[1\;5B history-token-search-forward

# super-down
bind \e\[1\;2B history-token-search-forward

# Make C-t transpose characters :)
bind \ct transpose-chars

# Make C-s accept autocompletion and submit :))
bind \cs accept-autosuggestion execute

bind \cc cancel-commandline

# Make A-bksp delete a word up to a special char
# TODO maybe make this clear the bigword
# bind alt-w backward-kill-bigword

function _paste-avoiding-double-git-clone
    set command (commandline | string trim)
    set clipboard (fish_clipboard_paste | string collect -N)
    if string match -qr '(clone-cd|clone-shallow-cd|git clone)' "$command"
        set clipboard (echo $clipboard | string replace 'git clone ' '')
    end
    commandline -i -- $clipboard
end

# Bind paste using function to avoid 'clone-cd git clone'
bind \cv _paste-avoiding-double-git-clone
bind \ev _paste-avoiding-double-git-clone

# kitty keyboard protocol alt+v
bind \u00F6 _paste-avoiding-double-git-clone
