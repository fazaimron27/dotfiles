function bye --wraps='sudo dnf remove' --description 'alias bye=sudo dnf remove'
  sudo dnf remove $argv
end
