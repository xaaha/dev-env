#!/bin/bash

# Check if Xcode command line tools are installed
if ! xcode-select -p &> /dev/null
then
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

# Check if Homebrew is installed, install if not
if ! command -v brew &> /dev/null
then
    echo "Homebrew not found, installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Homebrew installed."

    # Add Homebrew to PATH
    if [[ "$SHELL" == "/bin/bash" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.bash_profile
        eval "$(/opt/homebrew/bin/brew shellenv)"
        echo "Homebrew path added to ~/.bash_profile"
    elif [[ "$SHELL" == "/bin/zsh" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)" >> ~/.zprofile
        # echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrkc
        eval "$(/opt/homebrew/bin/brew shellenv)"
        echo "Homebrew path added to ~/.zprofile"
    fi
else
    echo "Homebrew is already installed."
fi

# Read the install.txt file and install each item
if [ -f install.txt ]; then
    while IFS= read -r item
    do
        # Skip empty lines or lines starting with a comment (#)
        if [[ -z "$item" || "$item" == \#* ]]; then
            continue
        fi
        
        # If the line contains --cask, install it as a cask
        if [[ "$item" == *"--cask"* ]]; then
            brew install --cask "${item/--cask /}"
        else
            brew install "$item"
        fi
    done < install.txt
else
    echo "install.txt not found."
fi

echo "Installation complete."
