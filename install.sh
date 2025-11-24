#!/bin/bash

set -e

echo "========================================="
echo "Setting up dotfiles for GitHub Codespaces"
echo "========================================="

# Update package lists
echo "Updating package lists..."
sudo apt-get update -qq

# Install latest vim
echo "Installing latest vim..."
if ! command -v vim &> /dev/null; then
    sudo apt-get install -y vim
else
    echo "vim is already installed: $(vim --version | head -n 1)"
fi

# Install latest git
echo "Installing latest git..."
if ! command -v git &> /dev/null; then
    sudo apt-get install -y git
else
    echo "git is already installed: $(git --version)"
fi

# Install additional useful tools
echo "Installing additional tools..."
sudo apt-get install -y \
    curl \
    wget \
    htop \
    tree \
    jq \
    unzip

# Create symlinks for dotfiles
echo "Creating symlinks for dotfiles..."

# Get the directory where this script is located
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Backup existing dotfiles if they exist
backup_and_link() {
    local source="$1"
    local target="$2"
    
    if [ -f "$target" ] || [ -L "$target" ]; then
        if [ ! -L "$target" ] || [ "$(readlink "$target")" != "$source" ]; then
            echo "  Backing up existing $target to ${target}.backup"
            mv "$target" "${target}.backup"
        fi
    fi
    
    if [ ! -L "$target" ]; then
        echo "  Linking $source -> $target"
        ln -sf "$source" "$target"
    fi
}

# Link .gitconfig
if [ -f "$DOTFILES_DIR/.gitconfig" ]; then
    backup_and_link "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
fi

# Link .vimrc
if [ -f "$DOTFILES_DIR/.vimrc" ]; then
    backup_and_link "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
fi

echo ""
echo "========================================="
echo "Setup complete!"
echo "========================================="
echo ""
echo "Installed versions:"
echo "  vim: $(vim --version | head -n 1)"
echo "  git: $(git --version)"
echo ""
echo "Git aliases available:"
git aliases 2>/dev/null || git config --get-regexp alias
echo ""
echo "========================================="
