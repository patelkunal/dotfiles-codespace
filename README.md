# dotfiles-codespace

Dotfiles for syncing development environment across GitHub Codespaces.

## Overview

This repository contains configuration files and setup scripts to automatically configure your GitHub Codespaces environment with your preferred tools and settings.

## What's Included

- **Git Configuration** (`.gitconfig`): Comprehensive git aliases and settings
- **Vim Configuration** (`.vimrc`): Optimized vim settings for development
- **Automated Setup** (`install.sh`): Script that installs and configures everything

## Features

### Git Aliases

The `.gitconfig` includes numerous useful aliases:

- `git st` - status
- `git co` - checkout
- `git br` - branch
- `git ci` - commit
- `git lg` - pretty log with graph
- `git lga` - pretty log with graph (all branches)
- `git last` - show last commit
- `git amend` - amend last commit without editing message
- `git undo` - undo last commit but keep changes
- `git cleanup` - delete merged branches
- `git aliases` - list all available aliases

### Tools Installed

- Latest **vim**
- Latest **git**
- Additional utilities: curl, wget, htop, tree, jq, unzip

## Setup

### Automatic Setup (Recommended)

1. Go to your [GitHub Settings > Codespaces](https://github.com/settings/codespaces)
2. Under "Dotfiles", select this repository (`patelkunal/dotfiles-codespace`)
3. Create a new Codespace - your dotfiles will be automatically installed!

### Manual Setup

If you want to test locally or install manually:

```bash
git clone https://github.com/patelkunal/dotfiles-codespace.git
cd dotfiles-codespace
./install.sh
```

## How It Works

When you create a new Codespace with this dotfiles repository configured:

1. GitHub Codespaces clones this repository to `~/dotfiles`
2. It automatically runs `install.sh`
3. The script installs required packages (vim, git, etc.)
4. Symlinks are created from dotfiles to your home directory
5. Your environment is ready to use!

## Customization

Feel free to fork this repository and customize it for your needs:

- Add more aliases to `.gitconfig`
- Customize vim settings in `.vimrc`
- Add additional dotfiles (`.bashrc`, `.zshrc`, etc.)
- Extend `install.sh` to install more tools

## Backup

The `install.sh` script automatically backs up any existing dotfiles before creating symlinks. Backups are saved with a `.backup` extension.

## Testing

To test the setup script without affecting your current configuration:

```bash
# This will show what would be installed without making changes
bash -n install.sh  # Syntax check

# Run in a container or test environment
docker run -it --rm -v $(pwd):/dotfiles ubuntu:latest /dotfiles/install.sh
```

## License

Feel free to use and modify as needed.
