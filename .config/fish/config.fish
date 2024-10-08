if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

# golang
set -x GOROOT /usr/local/go
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
alias start_lamp=.script/start_lamp.sh
alias stop_lamp=.script/stop_lamp.sh
alias upref="sudo dnf upgrade --refresh"
alias dmov="sudo dnf autoremove"
alias dcpkg="sudo dnf clean packages"
alias sn="sudo shutdown now"
alias rn="sudo reboot now"
alias ff=fastfetch
alias cat=bat
alias ls=eza
alias please=sudo
# alias end

# abbr
abbr -a docs ~/Documents
abbr -a down ~/Downloads
abbr -a sta start_lamp
abbr -a sto stop_lamp
abbr -a gsts git status
abbr -a gf git fetch
abbr -a gpl git pull
abbr -a gcm git commit
abbr -a gco git checkout
abbr -a gbr git branch
abbr -a gcl git clone
# abbr end

starship init fish | source

zoxide init fish | source
alias cd=z

set -gx ATUIN_NOBIND true
atuin init fish | source

# bind to ctrl-r in normal and insert mode, add any other bindings you want here too
bind \cr _atuin_search
bind -M insert \cr _atuin_search

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

set -x RUBYGEMS /usr/local/share/gems
set -x PATH $PATH $RUBYGEMS/gems

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

set -x GPG_TTY (tty)
