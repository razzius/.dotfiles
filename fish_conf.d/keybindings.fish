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

# Make C-w delete a whole word including special chars
bind \cw backward-kill-word

# Make A-bksp delete a whole word including special chars
bind \u00FF backward-kill-bigword
bind \e\x7F backward-kill-bigword # option-delete on mac

# Bind paste using function to avoid 'clone-cd git clone'
bind \cv _paste-avoiding-double-git-clone
bind \ev _paste-avoiding-double-git-clone

# kitty keyboard protocol alt+v
bind \u00F6 _paste-avoiding-double-git-clone
