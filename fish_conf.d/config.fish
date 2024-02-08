set -U fish_features ampersand-nobg-in-token,qmark-noglob

test -e ~/.profile && source ~/.profile

function postexec-source-profile --on-event fish_postexec
    set command_line (echo $argv | string collect)

    if string match -qr "^$EDITOR " "$command_line"
        set file (echo $command_line | coln 2 | string replace '~' $HOME)
        set fish_config_files ~/.profile ~/.config/fish/conf.d/config.fish

        if contains -- $file $fish_config_files
            echo -n "Sourcing "(echo $file | unexpand-home-tilde)"... "
            source $file
            echo done.
        end
    end
end

function save-edited-file --on-event fish_postexec
    set command_line (echo $argv | string collect | string trim)
    if string match -qr "^($EDITOR|edit) " "$command_line"
        set -g editor_command $argv
    end
end

if test -n "$VIM_TERMINAL"
    function _vim_sync_PWD --on-variable=PWD
        printf '\033]7;file://%s\033\\' "$PWD"
    end
end
