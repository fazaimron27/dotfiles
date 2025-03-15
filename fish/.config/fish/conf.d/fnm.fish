#fnm
set FNM_PATH "$HOME/.local/share/fnm"
if test -d $FNM_PATH
    set -x PATH $FNM_PATH $PATH
    source (fnm env | psub)
end

