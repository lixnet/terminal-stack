# 📤 How to Publish to GitHub

Follow these steps to push your terminal-stack to GitHub:

---

## 🔧 Step 1: Configure Git (if not already done)

```bash
# Set your git identity (use your GitHub email and name)
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"
```

---

## 🎯 Step 2: Create Initial Commit

```bash
cd ~/Ai/terminal-stack

# Create the initial commit
git commit -m "Initial commit: Modern Terminal Stack

- Kitty terminal configuration with Catppuccin Mocha theme
- Zellij multiplexer setup with custom keybindings
- Starship prompt with cyberpunk aesthetic
- Ubuntu Mono Nerd Font integration
- Rust CLI tools (eza, bat, ripgrep, fd, zoxide, etc.)
- Animation tools (pokemon-colorscripts, nms, lolcat, figlet)
- Automated setup script
- Complete documentation"
```

---

## 🌐 Step 3: Create Repository on GitHub

### Option A: Using GitHub CLI (gh)
```bash
# Install gh if not present
sudo dnf install gh

# Login to GitHub
gh auth login

# Create the repository
gh repo create terminal-stack --public --source=. --remote=origin --push

# Done! 🎉
```

### Option B: Using GitHub Website

1. Go to https://github.com/new
2. Repository name: `terminal-stack`
3. Description: "Modern terminal setup with Kitty, Zellij, Starship, and cyberpunk animations"
4. Choose **Public** (or Private if you prefer)
5. **DO NOT** initialize with README (we already have one)
6. Click "Create repository"

---

## 📤 Step 4: Push to GitHub (Option B only)

```bash
cd ~/Ai/terminal-stack

# Add the remote (replace YOUR-USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR-USERNAME/terminal-stack.git

# Rename branch to main (optional, but recommended)
git branch -M main

# Push to GitHub
git push -u origin main
```

---

## ✅ Step 5: Verify

Visit your repository at:
```
https://github.com/YOUR-USERNAME/terminal-stack
```

You should see:
- ✅ Beautiful README with instructions
- ✅ All config files organized
- ✅ Installation scripts
- ✅ Documentation

---

## 🔄 Future Updates

When you make changes:

```bash
cd ~/Ai/terminal-stack

# Stage changes
git add .

# Commit with message
git commit -m "Description of your changes"

# Push to GitHub
git push
```

---

## 📝 Optional: Add Topics to Your Repo

On GitHub, add these topics to make it discoverable:
- `terminal`
- `kitty`
- `zellij`
- `starship`
- `rust`
- `fedora`
- `dotfiles`
- `cyberpunk`
- `nerd-fonts`

---

## 🎨 Optional: Add a Screenshot

1. Take a screenshot of your terminal with the setup
2. Save it as `screenshot.png` in the repo
3. Add to README:
   ```markdown
   ![Screenshot](screenshot.png)
   ```
4. Commit and push:
   ```bash
   git add screenshot.png README.md
   git commit -m "Add screenshot"
   git push
   ```

---

## 🌟 Share Your Work!

Once published, you can:
- Share the link with friends
- Add it to your portfolio
- Clone it on other machines with:
  ```bash
  git clone https://github.com/YOUR-USERNAME/terminal-stack.git
  cd terminal-stack
  ./setup.sh
  ```

**Happy sharing! 🚀**
