#!/bin/bash

# Check if Xcode command line tools are installed
if ! xcode-select -p &> /dev/null; then
    echo "Xcode Command Line Tools not found, installing..."
    xcode-select --install

    # Wait until the Xcode installation is completed
    until xcode-select -p &> /dev/null; do
        echo "Waiting for Xcode Command Line Tools installation to complete..."
        sleep 5
    done

    echo "Xcode Command Line Tools installed."
else
    echo "Xcode Command Line Tools are already installed."
fi

echo "Installing zap..."
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
echo "Zap installed."

echo "Installing TPM..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "TPM Installed."

# Check if Homebrew is installed, install if not
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found, installing..."

    # Request sudo upfront for Homebrew installation
    sudo -v

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Homebrew installed."

    # Add Homebrew to PATH
    if [[ "$SHELL" == "/bin/bash" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.bash_profile
        eval "$(/opt/homebrew/bin/brew shellenv)"
        echo "Homebrew path added to ~/.bash_profile"
    elif [[ "$SHELL" == "/bin/zsh" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
        echo "Homebrew path added to ~/.zprofile"
    fi
else
    echo "Homebrew is already installed."
fi

if [ -f Brewfile ]; then
    echo "Fetching BrewFile"
    curl -s -O https://raw.githubusercontent.com/xaaha/dev-env/refs/heads/main/BrewFile 
    brew bundle --file=Brewfile
else
    echo "Could not fetch githubusercontent, try providing local brew file \n"
    exit 1
fi

# Check if fzf is already installed
echo "Enable Fzf Commands"
if command -v fzf >/dev/null 2>&1; then
  echo "fzf already installed."
else
  echo "Installing fzf..."
  yes | "$(brew --prefix)/opt/fzf/install"
  echo "fzf installed."
fi

echo "Installation complete."
