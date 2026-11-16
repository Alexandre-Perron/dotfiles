nvm use 24 --silent

# Docker
set -gx DOCKER_DEFAULT_PLATFORM linux/amd64
# Docker end

# TGF
set -gx TGF_PATH "/Users/aperron/.tgf_path"
# TGF end

# python
alias python=/opt/homebrew/bin/python3.10
alias pip="python -m pip"
# python end

# pnpm
set -gx PNPM_HOME '/Users/aperron/Library/pnpm'
if not string match -q -- "$PNPM_HOME/bin" $PATH
  set -gx PATH "$PNPM_HOME/bin" $PATH
end
# pnpm end

# Golang
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
# Golang end

# Cargo
export PATH="$HOME/.cargo/bin:$PATH"
# end Cargo

alias assume="source (brew --prefix)/bin/assume.fish"

pyenv init - | source

# Created by `pipx` on 2024-09-17 16:04:09
set PATH $PATH /Users/aperron/.local/bin

zoxide init fish | source

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/aperron/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
