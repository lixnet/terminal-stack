#!/bin/bash
# ╔═══════════════════════════════════════════════════╗
# ║   Terminal Stack - Master Setup Script           ║
# ║   One-command installation for everything         ║
# ╚═══════════════════════════════════════════════════╝

set -e

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Banner
clear
echo -e "${PURPLE}"
cat << "EOF"
╔═══════════════════════════════════════════════════╗
║                                                   ║
║   🚀 MODERN TERMINAL STACK INSTALLER 🚀          ║
║                                                   ║
║   Kitty + Zellij + Starship + Rust Tools         ║
║   + Cyberpunk Animations                         ║
║                                                   ║
╚═══════════════════════════════════════════════════╝
EOF
echo -e "${NC}"
echo ""

# Confirmation
echo -e "${YELLOW}This script will:${NC}"
echo "  1. Install terminal tools and Rust CLI utilities"
echo "  2. Install animation tools (pokemon, nms, lolcat, etc.)"
echo "  3. Download and install Ubuntu Mono Nerd Font"
echo "  4. Copy configuration files to ~/.config/"
echo "  5. Update your ~/.bashrc with startup script"
echo ""
echo -e "${YELLOW}Your current .bashrc will be backed up to ~/.bashrc.backup${NC}"
echo ""
read -p "Continue? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Installation cancelled."
    exit 1
fi

echo ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}Step 1/5:${NC} Installing packages and tools..."
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Run package installation script
cd "$SCRIPT_DIR"
chmod +x scripts/install-packages.sh
./scripts/install-packages.sh

echo ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}Step 2/5:${NC} Creating config directories..."
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

mkdir -p ~/.config/{kitty,zellij}
echo -e "${GREEN}✓${NC} Created ~/.config/kitty"
echo -e "${GREEN}✓${NC} Created ~/.config/zellij"

echo ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}Step 3/5:${NC} Copying configuration files..."
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Backup existing configs
if [ -f ~/.config/kitty/kitty.conf ]; then
    cp ~/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf.backup
    echo -e "${YELLOW}→${NC} Backed up existing kitty.conf"
fi

if [ -f ~/.config/zellij/config.kdl ]; then
    cp ~/.config/zellij/config.kdl ~/.config/zellij/config.kdl.backup
    echo -e "${YELLOW}→${NC} Backed up existing zellij config"
fi

if [ -f ~/.config/starship.toml ]; then
    cp ~/.config/starship.toml ~/.config/starship.toml.backup
    echo -e "${YELLOW}→${NC} Backed up existing starship.toml"
fi

# Copy new configs
cp "$SCRIPT_DIR/configs/kitty.conf" ~/.config/kitty/kitty.conf
echo -e "${GREEN}✓${NC} Installed kitty.conf"

cp "$SCRIPT_DIR/configs/zellij-config.kdl" ~/.config/zellij/config.kdl
echo -e "${GREEN}✓${NC} Installed zellij config"

cp "$SCRIPT_DIR/configs/starship.toml" ~/.config/starship.toml
echo -e "${GREEN}✓${NC} Installed starship.toml"

echo ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}Step 4/5:${NC} Updating shell configuration..."
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Backup bashrc
cp ~/.bashrc ~/.bashrc.backup
echo -e "${GREEN}✓${NC} Backed up ~/.bashrc to ~/.bashrc.backup"

# Check if startup script is already sourced
if grep -q "terminal-startup.sh" ~/.bashrc; then
    echo -e "${YELLOW}→${NC} Startup script already in .bashrc, skipping..."
else
    # Add startup script to bashrc
    cat >> ~/.bashrc << EOF

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Modern Terminal Stack - Added by setup.sh
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
source "$SCRIPT_DIR/scripts/terminal-startup.sh"
EOF
    echo -e "${GREEN}✓${NC} Added startup script to ~/.bashrc"
fi

echo ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}Step 5/5:${NC} Final setup..."
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Source cargo if it exists
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
    echo -e "${GREEN}✓${NC} Loaded Rust environment"
fi

echo ""
echo -e "${GREEN}"
cat << "EOF"
╔═══════════════════════════════════════════════════╗
║                                                   ║
║   ✅  INSTALLATION COMPLETE!  ✅                 ║
║                                                   ║
╚═══════════════════════════════════════════════════╝
EOF
echo -e "${NC}"
echo ""
echo -e "${YELLOW}📌 Next Steps:${NC}"
echo ""
echo "  1. Close this terminal"
echo "  2. Open a new Kitty terminal"
echo "  3. Enjoy your new setup! 🎉"
echo ""
echo -e "${CYAN}💡 Useful Commands:${NC}"
echo "  ls, ll, la    - Pretty file listings with icons"
echo "  cat           - Syntax highlighting (bat)"
echo "  poke          - Show random Pokemon"
echo "  bigtext TEXT  - ASCII art with rainbow colors"
echo "  decrypt TEXT  - Movie-style decryption effect"
echo "  zj            - Start Zellij multiplexer"
echo ""
echo -e "${CYAN}📖 Documentation:${NC}"
echo "  Quick Start:  $SCRIPT_DIR/docs/QUICK-START.md"
echo "  Full Docs:    $SCRIPT_DIR/docs/SETUP-INSTRUCTIONS.md"
echo ""
echo -e "${GREEN}Happy hacking! 🚀${NC}"
echo ""
