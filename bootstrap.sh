#!/bin/bash
set -e

# Install Homebrew if missing
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install chezmoi if missing
if ! command -v chezmoi &>/dev/null; then
  brew install chezmoi
fi

# Apply dotfiles
chezmoi init --apply --force https://github.com/meparry/mac-setup.git

# Install all brew packages.
# --adopt lets Homebrew take over apps already present in /Applications
# (e.g. a manually-installed Zed.app) instead of aborting with
# "It seems there is already an App at ...".
export HOMEBREW_CASK_OPTS="--adopt"
brew bundle --file="$(chezmoi source-path)/Brewfile"

# Doom Emacs install/sync
if [ ! -d "$HOME/.config/emacs" ]; then
  git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
fi
~/.config/emacs/bin/doom sync

# macOS settings
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo "Done. Log out and back in for key repeat to take effect."
