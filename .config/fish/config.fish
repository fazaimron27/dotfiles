if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

# golang
set -x GOROOT  /usr/local/go
set -x PATH $PATH $GOROOT/bin

set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin
# golang end

# pnpm
set -gx PNPM_HOME "/home/faza/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# jupyter
set -x JUPYTER /home/faza/.local/
set -x PATH $PATH $JUPYTER/bin
# jupyter end

# alias
alias pn=pnpm
# alias end

# abbr
abbr -a docs ~/Documents
abbr -a down ~/Downloads
# abbr end
