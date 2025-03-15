function hunt --wraps='sudo dnf search' --description 'alias hunt=sudo dnf search'
  sudo dnf search $argv
end
