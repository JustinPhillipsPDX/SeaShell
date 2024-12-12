#!/bin/bash
# Main Bash script for Linux/macOS

# Detect OS and architecture
echo "Detecting system..."
OS=$(uname -s)
ARCH=$(uname -m)

echo "Operating System: $OS"
echo "Architecture: $ARCH"

# Check for required tools
echo "Checking dependencies..."

check_tool() {
    if ! command -v "$1" &>/dev/null; then
        echo "$1 not found. Installing..."
        case "$OS" in
        "Linux")
            if command -v apt-get &>/dev/null; then
                sudo apt-get install -y "$2"
            elif command -v yum &>/dev/null; then
                sudo yum install -y "$2"
            else
                echo "Unsupported package manager. Please install $1 manually."
                exit 1
            fi
            ;;
        "Darwin")
            if command -v brew &>/dev/null; then
                brew install "$2"
            else
                echo "Homebrew not found. Please install Homebrew and rerun the script."
                exit 1
            fi
            ;;
        *)
            echo "Unsupported OS. Please install $1 manually."
            exit 1
            ;;
        esac
    else
        echo "$1 is already installed."
    fi
}

# Ensure CMake and GCC are installed
check_tool cmake cmake
check_tool g++ gcc

# Configure, build, and install the example project
echo "Configuring and building the project..."
mkdir -p build
cd build || exit
cmake ..
make

echo "Installation complete! The binary is in the 'build' directory."
