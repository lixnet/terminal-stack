# ⚡ Quick Start Guide

## 🏃 Run This First:

```bash
cd ~/Ai
chmod +x install-terminal-stack.sh
./install-terminal-stack.sh
```

Wait for installation (5-10 min), then:

```bash
# Copy configs
mkdir -p ~/.config/{kitty,zellij}
cp kitty.conf ~/.config/kitty/
cp zellij-config.kdl ~/.config/zellij/config.kdl
cp starship.toml ~/.config/starship.toml

# Backup and update bashrc
cp ~/.bashrc ~/.bashrc.backup
echo "" >> ~/.bashrc
echo "source ~/Ai/terminal-startup.sh" >> ~/.bashrc

# Reload
source ~/.bashrc
```

**Close terminal and open new Kitty window!** 🎉

---

## 🎮 Keyboard Shortcuts

### Kitty:
- `Ctrl+Shift+Enter` - New window
- `Ctrl+Shift+T` - New tab
- `Ctrl+Shift+W` - Close window
- `Ctrl+Shift+]` - Next window
- `Ctrl+Shift+[` - Previous window
- `Ctrl+Shift+=` - Increase font
- `Ctrl+Shift+-` - Decrease font

### Zellij:
- `Ctrl+G` - Lock/unlock
- `Ctrl+P` - Pane mode
- `Ctrl+T` - Tab mode
- `Alt+N` - New pane
- `Alt+H/J/K/L` - Navigate

---

## 🛠️ New Commands:

```bash
ls, ll, la       # Pretty ls with icons
cat file         # Syntax highlighting
poke             # Random pokemon
decrypt "text"   # Decryption effect
bigtext "text"   # Big ASCII art
rainbow "text"   # Rainbow colors
zj               # Start zellij
```

---

## 📖 Full docs:
See `SETUP-INSTRUCTIONS.md` for detailed info!
