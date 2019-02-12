function _run_fasd --on-event fish_preexec
	fasd --proc (fasd --sanitize $argv | tr -s ' ' \n) > /dev/null 2>&1
end

function j
    set -l dir (fasd -de "printf %s" "$argv")
    if test "$dir" = ""
        echo "no matching directory"
        return 1
    end
    cd $dir
end

function e
    fasd -fe "$EDITOR" "$argv"
end
