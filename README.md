# dotfiles

My macOS configs, managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level folder is a package that mirrors `$HOME`.

| Package | What |
| --- | --- |
| `fish` | fish shell config, plugins list, functions |
| `git` | `.gitconfig` (identity in `~/.gitconfig.local`), global ignore |
| `nvim` | Neovim (lazy.nvim) |
| `vim` | `.vimrc` |
| `zed` | Zed settings and keymap |
| `tmux` | tmux config and popup script |
| `zellij` | Zellij config, layouts, plugins |
| `ghostty` | Ghostty terminal |
| `lazygit` | lazygit |
| `btop` | btop |
| `linearmouse` | LinearMouse |

## Install on a new Mac

```bash
# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Tools
brew install stow git git-lfs fish neovim tmux zellij lazygit btop zoxide pyenv
brew install --cask ghostty zed linearmouse font-caskaydia-cove-nerd-font

# Clone
git clone git@github.com:alexandre-perron/dotfiles.git ~/dotfiles
```

## Apply

```bash
cd ~/dotfiles
stow fish git vim zed btop ghostty lazygit linearmouse nvim tmux zellij
```

Stow refuses to overwrite existing files. Delete or move any default config first, or run `stow --adopt <pkg>` to pull the existing file into the repo (then `git diff` to review).

Then finish setup:

```bash
# Git identity (not committed)
cat > ~/.gitconfig.local <<'EOF'
[user]
	name = Your Name
	email = you@example.com
	signingkey = <gpg key id>
EOF

# fish as login shell + plugins
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update'

# tmux plugins (then press prefix + I inside tmux)
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
git clone https://github.com/catppuccin/tmux ~/.config/tmux/plugins/catppuccin/tmux
```

Neovim installs its plugins on first launch.

## Save changes

Stowed files are symlinks into this repo, so editing a config edits the repo directly:

```bash
cd ~/dotfiles
git add -A && git commit -m "sync" && git push
```

To track a new config, move it into a package and stow it:

```bash
mkdir -p ~/dotfiles/<pkg>/.config
mv ~/.config/<app> ~/dotfiles/<pkg>/.config/
cd ~/dotfiles && stow <pkg>
```

## Keep out of this repo

This repo is public. Never commit tokens or keys. `fish_variables` (fish universal vars, may hold tokens) and `.gitconfig.local` are gitignored. Put secrets in fish with `set -U` or in 1Password, not in `config.fish`.
