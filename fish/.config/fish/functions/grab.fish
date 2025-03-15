function grab --wraps='sudo dnf install' --description 'alias grab=sudo dnf install'
  sudo dnf install $argv
end
