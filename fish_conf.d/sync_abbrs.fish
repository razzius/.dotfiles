set -U abbrs_version 0

function sync-abbrs --on-variable abbrs_version
    for abbr in (abbr --list)
        abbr --erase -- $abbr
    end
    source ~/.config/fish/conf.d/abbrs.fish
end

function postexec-signal-abbrs --on-event fish_postexec
    set command_line $argv

    if string match -qr "^(abbr-add|abbr-erase) " $command_line
        set -U abbrs_version (math "$abbrs_version + 1")
    end
end
