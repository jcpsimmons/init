#!/bin/zsh

# Check if Homebrew is installed (by checking if `brew` command is available)
echo "Checking for Homebrew installation..."
if ! command -v brew &>/dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Set up Homebrew in your shell.
    echo -e "\n# Set up Homebrew environment variables" >>/Users/simsies/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>/Users/simsies/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo "Homebrew installation completed."
else
    echo "Homebrew is already installed."
fi

echo "Starting to install applications and packages..."

# Batch install applications with Homebrew Cask
apps=("rectangle" "iterm2" "bitwarden" "google-chrome" "obsidian" "gpg-suite" "insomnia" "visual-studio-code" "raycast" "spotify")
for app in "${apps[@]}"; do
    echo "Installing $app..."
    brew install --cask $app || echo "Failed to install $app, continuing..."
done

# Install command line tools and packages
packages=("wget" "yarn" "node" "rbenv" "nmap" "pidof" "btop" "nvm" "ripgrep" "fzf" "neovim" "tmux" "jq" "tree" "rename" "gh" "ffmpeg" "go" "watch" "httrack" "switchaudio-osx" "deno" "bun")
for package in "${packages[@]}"; do
    echo "Installing $package..."
    brew install $package || echo "Failed to install $package, continuing..."
done

echo "Applications and packages installation completed."

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Oh My Zsh installation completed."

# Git Prefs
echo "Setting up Git preferences..."
git config --global init.defaultBranch master
git config --global user.name "Simsies"
git config --global user.email "joshsimmons@hey.com"
echo "Git preferences set up."
