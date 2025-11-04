# 🚀 Modern Terminal Stack

**JaKooLit-inspired animated terminal experience for Fedora/RHEL**

A complete, ready-to-use terminal setup featuring Kitty, Zellij, Starship, and modern Rust-based CLI tools with cyberpunk-style animations.

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Platform](https://img.shields.io/badge/platform-Fedora%20%7C%20RHEL-red.svg)

---

## ✨ Features

### 🎨 Beautiful & Fast
- **Kitty Terminal** - GPU-accelerated with Catppuccin Mocha theme
- **95% opacity** with blur effects
- **Ubuntu Mono Nerd Font** - With full icon support for eza, starship, etc.
- Smooth animations and transitions

### 🛠️ Modern CLI Tools
All the latest Rust-based replacements for classic Unix tools:
- `eza` - Modern `ls` with icons and git integration
- `bat` - `cat` with syntax highlighting
- `ripgrep` - Blazing fast `grep`
- `fd` - Simple, fast `find`
- `zoxide` - Smarter `cd` that learns your habits
- `dust` - Better `du`
- `bottom` - Beautiful system monitor
- `procs` - Modern `ps`

### 🎮 Terminal Multiplexer
- **Zellij** - Modern alternative to tmux with sane defaults
- Intuitive keybindings
- Beautiful UI with tabs and panes
- Session management

### ⚡ Smart Prompt
- **Starship** - Fast, customizable prompt showing:
  - Git branch and status
  - Language versions (Python, Node, Rust, Go, etc.)
  - Docker context
  - Command duration
  - And much more!

### 🎭 Cyberpunk Animations
- **pokemon-colorscripts** - Random Pokemon on startup
- **no-more-secrets (nms)** - Movie-style decryption effects
- **lolcat** - Rainbow text
- **figlet** - ASCII art text
- **neofetch** - System info with style

---

## 📸 Preview

```
╔═══════════════════════════════════════════════════╗
║   TERMINAL ONLINE                                 ║
╚═══════════════════════════════════════════════════╝

[Random Pokemon appears here]

ACCESS GRANTED. WELCOME TO THE SYSTEM.

╭─lixnet @hostname ~/Projects
╰─➜
```

---

## 🚀 Quick Install

### One-liner install:
```bash
git clone https://github.com/YOUR-USERNAME/terminal-stack.git
cd terminal-stack
./setup.sh
```

### Or manual install:
```bash
# 1. Install all packages and tools
./scripts/install-packages.sh

# 2. Copy configurations
mkdir -p ~/.config/{kitty,zellij}
cp configs/kitty.conf ~/.config/kitty/
cp configs/zellij-config.kdl ~/.config/zellij/config.kdl
cp configs/starship.toml ~/.config/starship.toml

# 3. Add startup script to bashrc
cp ~/.bashrc ~/.bashrc.backup
echo "" >> ~/.bashrc
echo "source $(pwd)/scripts/terminal-startup.sh" >> ~/.bashrc

# 4. Reload shell
source ~/.bashrc
```

**Open a new Kitty terminal and enjoy!** 🎉

---

## 📋 Requirements

- **OS**: Fedora 33+ or RHEL 8+
- **Terminal**: Kitty (will be installed if not present)
- **Shell**: Bash (zsh support coming soon)
- **Internet**: Required for downloading packages and fonts

---

## 📖 Documentation

- [Quick Start Guide](docs/QUICK-START.md) - Get up and running fast
- [Detailed Setup Instructions](docs/SETUP-INSTRUCTIONS.md) - Complete walkthrough
- [Customization Guide](docs/CUSTOMIZATION.md) - Make it your own (coming soon)

---

## 🎯 What's Included

### Configuration Files
- `configs/kitty.conf` - Kitty terminal configuration
- `configs/zellij-config.kdl` - Zellij multiplexer configuration
- `configs/starship.toml` - Starship prompt configuration

### Scripts
- `scripts/install-packages.sh` - Installs all required packages
- `scripts/terminal-startup.sh` - Startup animations and aliases
- `setup.sh` - Master installation script (does everything)

---

## ⌨️ Key Bindings

### Kitty
| Key | Action |
|-----|--------|
| `Ctrl+Shift+Enter` | New window |
| `Ctrl+Shift+T` | New tab |
| `Ctrl+Shift+W` | Close window |
| `Ctrl+Shift+]` | Next window |
| `Ctrl+Shift+[` | Previous window |
| `Ctrl+Shift+=` | Increase font size |
| `Ctrl+Shift+-` | Decrease font size |

### Zellij
| Key | Action |
|-----|--------|
| `Ctrl+G` | Lock/unlock |
| `Ctrl+P` | Pane mode |
| `Ctrl+T` | Tab mode |
| `Alt+N` | New pane |
| `Alt+H/J/K/L` | Navigate panes (Vim-style) |

---

## 🛠️ Customization

### Change Theme
Edit `configs/kitty.conf` and replace the color scheme section. Popular alternatives:
- [Nord](https://www.nordtheme.com/)
- [Dracula](https://draculatheme.com/)
- [Tokyo Night](https://github.com/tokyo-night/tokyo-night-vscode-theme)
- [Gruvbox](https://github.com/morhetz/gruvbox)

### Change Font
Edit `configs/kitty.conf`:
```conf
font_family      Your Font Here Nerd Font Mono
font_size 12.0
```

### Disable Animations
Comment out the startup section in `scripts/terminal-startup.sh`

---

## 🐛 Troubleshooting

### Icons not showing?
Make sure the font is installed:
```bash
fc-list | grep UbuntuMono
```

### Starship not appearing?
Check if it's initialized in your shell config:
```bash
grep starship ~/.bashrc
```

### Permission denied on scripts?
Make scripts executable:
```bash
chmod +x setup.sh scripts/*.sh
```

---

## 🤝 Contributing

Contributions welcome! Feel free to:
- Report bugs
- Suggest new features
- Submit pull requests
- Share your customizations

---

## 📝 License

MIT License - feel free to use and modify!

---

## 🙏 Credits

- Inspired by [JaKooLit's Hyprland Dotfiles](https://github.com/JaKooLit)
- [Catppuccin](https://catppuccin.com/) color scheme
- [Nerd Fonts](https://www.nerdfonts.com/) for icon support
- All the amazing tool creators in the Rust ecosystem

---

## ⭐ Show Your Support

If you found this helpful, please give it a star! ⭐

---

**Made with ❤️ for the terminal enthusiasts**
