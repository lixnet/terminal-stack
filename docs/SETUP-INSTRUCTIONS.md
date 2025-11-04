# 🚀 Terminal Stack Setup Instructions

**JaKooLit-inspired Animated Terminal Experience**
- Kitty + Zellij + Starship + Rust Tools + Animations

---

## 📋 What You're Getting

### Core Stack:
- **Kitty** - GPU-accelerated terminal (already installed ✓)
- **Zellij** - Modern terminal multiplexer
- **Starship** - Beautiful cross-shell prompt

### Rust Tools (Modern CLI Replacements):
- **eza** - Pretty `ls` with icons
- **bat** - `cat` with syntax highlighting
- **ripgrep (rg)** - Fast grep (already installed ✓)
- **fd** - Simple, fast `find`
- **zoxide** - Smarter `cd` that learns
- **dust** - Better `du`
- **bottom** - System monitor
- **procs** - Modern `ps`

### Animation Tools:
- **pokemon-colorscripts** - Random Pokemon on startup
- **no-more-secrets (nms)** - Decryption effect like in movies
- **lolcat** - Rainbow text
- **figlet** - ASCII art text
- **neofetch** - System info display

---

## 🛠️ Step 1: Install Everything

Run the installation script (this will take 5-10 minutes):

```bash
cd ~/Ai
chmod +x install-terminal-stack.sh
./install-terminal-stack.sh
```

**What this does:**
- Installs all packages via DNF
- Installs Rust (if needed) and Rust-based tools
- Clones and builds no-more-secrets from source
- Clones and installs pokemon-colorscripts
- Downloads and installs Ubuntu Mono Nerd Font (with icon glyphs)

**You may be prompted for your sudo password.**

---

## ⚙️ Step 2: Copy Configuration Files

After installation completes, copy the config files to their proper locations:

### 1. Kitty Configuration:
```bash
mkdir -p ~/.config/kitty
cp ~/Ai/kitty.conf ~/.config/kitty/kitty.conf
```

### 2. Zellij Configuration:
```bash
mkdir -p ~/.config/zellij
cp ~/Ai/zellij-config.kdl ~/.config/zellij/config.kdl
```

### 3. Starship Configuration:
```bash
mkdir -p ~/.config
cp ~/Ai/starship.toml ~/.config/starship.toml
```

### 4. Shell Startup Script:
```bash
# Backup your existing bashrc
cp ~/.bashrc ~/.bashrc.backup

# Add startup script to bashrc
echo "" >> ~/.bashrc
echo "# Terminal animations and modern tools" >> ~/.bashrc
echo "source ~/Ai/terminal-startup.sh" >> ~/.bashrc
```

---

## 🎨 Step 3: Reload and Test

### Reload your shell configuration:
```bash
source ~/.bashrc
```

### Test the new tools:
```bash
# Test eza (modern ls)
ls
ll
la

# Test bat (modern cat)
cat ~/.bashrc

# Test fd (modern find)
fd config

# Test zoxide (smart cd) - needs to learn your directories first
z ~

# Test starship (should already be showing)
# You should see a fancy prompt!

# Test animations
poke             # Random pokemon
bigtext HELLO    # Big ASCII text with rainbow
decrypt "Secret" # Decryption effect
```

---

## 🪟 Step 4: Open New Kitty Terminal

Close your current terminal and open a fresh Kitty terminal to see:
- Beautiful Catppuccin Mocha theme
- Smooth transparency (95% opacity with blur)
- Ubuntu Mono Nerd Font with full icon support
- Animated startup with Pokemon

---

## 🎮 Step 5: Start Zellij (Optional)

Zellij is a terminal multiplexer (like tmux but easier):

```bash
zellij
```

**Zellij Quick Keys:**
- `Ctrl + g` - Lock/unlock (when locked, all keys pass through)
- `Ctrl + p` - Pane mode (split, navigate)
- `Ctrl + t` - Tab mode (new tabs, switch)
- `Ctrl + n` - Resize mode
- `Alt + n` - New pane (quick)
- `Alt + h/j/k/l` - Navigate panes (vim-style)

---

## 🎯 Cool Features & Tips

### Kitty Features:
- **Transparency** - 95% opacity with blur
- **Tab bar** - Top bar with powerline style
- **Splits** - Use `Ctrl+Shift+Enter` for new window
- **Font control** - `Ctrl+Shift+=` to increase, `Ctrl+Shift+-` to decrease

### Starship Prompt Shows:
- Current directory with icons
- Git branch and status
- Language versions (Python, Node, Rust, Go)
- Docker context
- Command duration (if > 500ms)
- Username and hostname

### Useful Aliases Added:
```bash
ls, ll, la       # Pretty eza commands with icons
cat              # Now uses bat with syntax highlighting
grep             # Now uses ripgrep (faster)
htop/top         # Now uses bottom (btm)
cd               # Now uses zoxide (learns your habits)
gs, ga, gc, gp   # Quick git commands
zj, zja, zjl     # Zellij shortcuts
```

### Custom Functions:
```bash
poke             # Show random pokemon
poke -n pikachu  # Show specific pokemon
matrix           # Matrix effect (need to install cmatrix)
decrypt "text"   # Decryption animation
rainbow "text"   # Rainbow text
bigtext "text"   # Big ASCII art with rainbow
```

---

## 🔧 Customization

### Change Kitty Theme:
Edit `~/.config/kitty/kitty.conf` and change the colors section.
Popular themes: Nord, Dracula, Tokyo Night, Gruvbox

### Change Starship Prompt:
Edit `~/.config/starship.toml`
Check https://starship.rs/config/ for more options

### Change Zellij Theme:
Edit `~/.config/zellij/config.kdl`
See available themes: https://github.com/zellij-org/zellij/tree/main/zellij-utils/assets/themes

---

## 🐛 Troubleshooting

### Icons not showing?
```bash
# Check if Nerd Font is installed
fc-list | grep "UbuntuMono Nerd Font"

# If not found, manually install:
cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/UbuntuMono.zip
unzip -q UbuntuMono.zip -d UbuntuMono-NerdFont
mkdir -p ~/.local/share/fonts/UbuntuMono-NerdFont
cp UbuntuMono-NerdFont/*.ttf ~/.local/share/fonts/UbuntuMono-NerdFont/
fc-cache -fv ~/.local/share/fonts/UbuntuMono-NerdFont
```

### Starship not showing?
```bash
# Make sure it's initialized
starship init bash

# Check if it's in bashrc
grep starship ~/.bashrc
```

### Animations not working?
```bash
# Check if tools are installed
which pokemon-colorscripts
which nms
which lolcat
which figlet

# If missing, re-run install script
```

### Kitty config not loading?
```bash
# Check config file location
ls -la ~/.config/kitty/kitty.conf

# Test kitty config
kitty --config ~/.config/kitty/kitty.conf
```

---

## 📚 Further Reading

- Kitty: https://sw.kovidgoyal.net/kitty/
- Zellij: https://zellij.dev/
- Starship: https://starship.rs/
- JaKooLit Dotfiles: https://github.com/JaKooLit/
- Catppuccin Theme: https://catppuccin.com/

---

## 🎉 You're Done!

Your terminal should now look amazing with:
- Pokemon appearing on startup
- Decryption effects
- Beautiful prompt with git info
- Modern CLI tools with icons
- Smooth transparency and blur

**Enjoy your cyberpunk terminal setup! 🚀**
