if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

# golang
#set -x GOROOT /usr/local/go
#set -x PATH $PATH $GOROOT/bin

#set -x GOPATH $HOME/go
#set -x PATH $PATH $GOPATH/bin
# golang end

# pnpm
set -gx PNPM_HOME "/home/faza/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# jupyter
#set -x JUPYTER /home/faza/.local/
#set -x PATH $PATH $JUPYTER/bin
# jupyter end

# alias
alias pn=pnpm
#alias start_lamp=.script/start_lamp.sh
#alias stop_lamp=.script/stop_lamp.sh
alias upref="sudo dnf upgrade --refresh"
alias sysup="sudo dnf upgrade --refresh"
alias dmov="sudo dnf autoremove"
alias cleanup="sudo dnf autoremove"
alias dcpkg="sudo dnf clean packages"
alias cleanpkg="sudo dnf clean packages"
alias sn="sudo shutdown now"
alias adios="sudo shutdown now"
alias rn="sudo reboot now"
alias reiniciar="sudo reboot now"
alias ff=fastfetch
alias sysinfo=fastfetch
alias cat=bat
#alias ls="eza --icons" -s
alias please=sudo
alias astronvim="NVIM_APPNAME=astronvim nvim"
# alias end

# abbr
abbr -a docs ~/Documents
abbr -a down ~/Downloads
#abbr -a sta start_lamp
#abbr -a sto stop_lamp
abbr -a gsts git status
abbr -a gf git fetch
abbr -a gpl git pull
abbr -a gcm git commit
abbr -a gco git checkout
abbr -a gbr git branch
abbr -a gcl git clone
abbr web-start "sudo ~/.script/start_web_stack.sh"
abbr web-stop "sudo ~/.script/stop_web_stack.sh"
abbr web-restart "sudo ~/.script/restart_web_stack.sh"
# abbr end

starship init fish | source

zoxide init fish | source
alias cd=z

set -gx ATUIN_NOBIND true
atuin init fish | source

# bind to ctrl-r in normal and insert mode, add any other bindings you want here too
bind \ct _atuin_search
bind -M insert \ct _atuin_search

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

#set -x RUBYGEMS /usr/local/share/gems
#set -x PATH $PATH $RUBYGEMS/gems

set -x PATH $PATH ~/bin

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#set -x GPG_TTY (tty)

#set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/faza/.ghcup/bin # ghcup-env

set -g Z_CMD j

# test -f ~/.inshellisense/fish/init.fish && source ~/.inshellisense/fish/init.fish

function peek
    fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"
end

function bgrep
    rg --color=always --line-number $argv | bat --color=always --style=grid
end

function ffind
    fd --hidden --follow --exclude .git | fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# set -x NIX_CONFIG "experimental-features = nix-command flakes ca-derivations"
devbox global shellenv --init-hook | source
set -U devbox_no_prompt true
