set -U fish_features ampersand-nobg-in-token,qmark-noglob

test -e ~/.fish_profile && source ~/.fish_profile

function postexec-source-profile --on-event fish_postexec
    set command_line (echo $argv | string collect)

    if not string match -qr "^$EDITOR " "$command_line"
        return
    end

    set file_arg (echo $command_line | coln 2)
    set file_expanded (echo $file_arg | expand-home-tilde)

    if not file-exists $file_expanded
        return
    end

    set file (realpath $file_expanded)
    set fish_config_files ~/.fish_profile (readlink -f ~/.config/fish/conf.d/config.fish)

    if contains -- $file $fish_config_files
        echo -n "Sourcing "(echo $file | unexpand-home-tilde)"... "
        source $file
        echo done.
    end
end

if test -n "$VIM_TERMINAL"
    function _vim_sync_PWD --on-variable=PWD
        printf '\033]7;file://%s\033\\' "$PWD"
    end
end
