#!/bin/bash
# Terminal Stack Installation Script for Fedora 43
# JaKooLit-inspired animated terminal setup

set -e

echo "╔═══════════════════════════════════════════════════╗"
echo "║   Installing Modern Terminal Stack               ║"
echo "║   Kitty + Zellij + Starship + Rust Tools         ║"
echo "╚═══════════════════════════════════════════════════╝"
echo ""

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

install_package() {
    if command -v "$1" &> /dev/null; then
        echo -e "${GREEN}✓${NC} $1 already installed"
    else
        echo -e "${YELLOW}→${NC} Installing $1..."
        sudo dnf install -y "$2"
    fi
}

install_cargo_package() {
    if command -v "$1" &> /dev/null; then
        echo -e "${GREEN}✓${NC} $1 already installed"
    else
        echo -e "${YELLOW}→${NC} Installing $1 via cargo..."
        cargo install "$2"
    fi
}

echo "📦 Installing DNF packages..."
echo ""

# Core tools via DNF (only ones available in Fedora repos)
install_package "bat" "bat"
install_package "lolcat" "lolcat"
install_package "figlet" "figlet"
install_package "fastfetch" "fastfetch"

# Install Rust if not present (needed for cargo packages)
if ! command -v cargo &> /dev/null; then
    echo ""
    echo -e "${YELLOW}→${NC} Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
fi

# Source cargo env if it exists
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

echo ""
echo "🦀 Installing Rust-based tools..."
echo ""

# Core tools via Cargo (not in Fedora repos)
install_cargo_package "zellij" "zellij"
install_cargo_package "starship" "starship"
install_cargo_package "fd" "fd-find"
install_cargo_package "eza" "eza"
install_cargo_package "rg" "ripgrep"

# Additional Rust tools
install_cargo_package "zoxide" "zoxide"
install_cargo_package "dust" "du-dust"
install_cargo_package "btm" "bottom"
install_cargo_package "procs" "procs"

# Install no-more-secrets (nms)
echo ""
echo "🔐 Installing no-more-secrets..."
if command -v nms &> /dev/null; then
    echo -e "${GREEN}✓${NC} nms already installed"
else
    cd /tmp
    git clone https://github.com/bartobri/no-more-secrets.git
    cd no-more-secrets
    make nms
    sudo make install
    cd ..
    rm -rf no-more-secrets
fi

# Install pokemon-colorscripts
echo ""
echo "⚡ Installing pokemon-colorscripts..."
if command -v pokemon-colorscripts &> /dev/null; then
    echo -e "${GREEN}✓${NC} pokemon-colorscripts already installed"
else
    cd /tmp
    git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git
    cd pokemon-colorscripts
    sudo ./install.sh
    cd ..
    rm -rf pokemon-colorscripts
fi

# Install Ubuntu Mono Nerd Font if not present
echo ""
echo "🔤 Installing Ubuntu Mono Nerd Font..."
FONT_DIR="$HOME/.local/share/fonts"
if fc-list | grep -q "UbuntuMono Nerd Font"; then
    echo -e "${GREEN}✓${NC} Ubuntu Mono Nerd Font already installed"
else
    mkdir -p "$FONT_DIR/UbuntuMono-NerdFont"
    cd /tmp
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/UbuntuMono.zip
    unzip -q UbuntuMono.zip -d UbuntuMono-NerdFont
    cp UbuntuMono-NerdFont/*.ttf "$FONT_DIR/UbuntuMono-NerdFont/"
    rm -rf UbuntuMono.zip UbuntuMono-NerdFont
    fc-cache -fv "$FONT_DIR/UbuntuMono-NerdFont"
fi

echo ""
echo -e "${GREEN}✓ Installation complete!${NC}"
echo ""
echo "Next steps:"
echo "1. Run: source ~/.bashrc  (to reload shell config)"
echo "2. Open a new Kitty terminal to see the changes"
echo ""
