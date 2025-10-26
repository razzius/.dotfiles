# A wrapper to make git run compact git status when invoked alone.
# This is dangerous for multiple reasons: it's at risk of being an infinite
# loop, and it disables the default git help (git by itself would show help).
# Git help is still available via `git -h`.
# So I put it in my fish config rather than my fish functions, which other people use.

function git --wraps git
    if string-empty $argv
        command git status -sb
    else
        command git $argv
    end
end
