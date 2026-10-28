function display_bpm
    if test (count $beats) -lt 4
        return
    end

    set avg (math "($beats[1] - $beats[4]) / 3")

    set bps (math 1 / $avg)
    set bpm (math "$bps * 60")

    printf "%.0f " $bpm
end


function fish_prompt --description 'Write out the prompt'
    set -l last_status $status

    display_bpm

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
