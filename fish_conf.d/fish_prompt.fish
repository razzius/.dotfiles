function clear_bpm_on_normal_command --on-event fish_postexec
    set -e beats
end

bind ctrl-l 'set -e beats && clear && fish_prompt'
# bind ctrl-l 'set -e beats && clear'

function display_bpm
    if equals $beats START
        set -e beats
        return
    end

    set -U beats (gdate +%s.%3N) $beats[1..3]

    if test (count $beats) -lt 4
        return
    end

    set diffs \
        (math $beats[1] - $beats[2]) \
        (math $beats[2] - $beats[3]) \
        (math $beats[3] - $beats[4])

    set avg (math "($diffs[1] + $diffs[2] + $diffs[3]) / 3")
    set bps (math 1 / $avg)
    set bpm (math "$bps * 60")

    if test $bpm -gt 55
        printf "%.0f " $bpm
    end
end

function fish_prompt --description 'Write out the prompt'
    display_bpm

    set -l last_status $status

    if not test $PWD = $HOME
        set_color $fish_color_cwd
        echo -n (basename $PWD)' '
        set_color normal
    end

    if in-git-repo
        set stashes (git stash list | line-count)
        if test $stashes -gt 0
            printf '%s ' $stashes
        end
    end

    if jobs -q
        echo -s -n (set_color -b purple) '.' (set_color normal)
    end

    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    if set -q VIRTUAL_ENV
        echo -s -n (set_color -b blue) '$' (set_color normal)
    else
        echo -s -n '$'
        set_color normal
    end

    echo -n ' '
end
