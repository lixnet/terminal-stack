#!/bin/bash
# ╔═══════════════════════════════════════════════════╗
# ║   Terminal Startup Animation Script               ║
# ║   JaKooLit-inspired terminal effects              ║
# ╚═══════════════════════════════════════════════════╝

# Skip animations if not in interactive shell
[[ $- != *i* ]] && return

# Skip animations for certain terminals or sessions
if [[ "$TERM" == "dumb" ]] || [[ -n "$INSIDE_EMACS" ]]; then
    return
fi

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Animation Functions
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Function to print with nms effect (if available)
print_nms() {
    if command -v nms &> /dev/null; then
        echo "$1" | nms -a
    else
        echo "$1"
    fi
}

# Function to print with lolcat effect (if available)
print_lolcat() {
    if command -v lolcat &> /dev/null; then
        echo "$1" | lolcat
    else
        echo "$1"
    fi
}

# Function to print with typing effect
type_text() {
    local text="$1"
    local delay="${2:-0.03}"

    if command -v pv &> /dev/null; then
        echo "$text" | pv -qL 30
    else
        for (( i=0; i<${#text}; i++ )); do
            echo -n "${text:$i:1}"
            sleep "$delay"
        done
        echo
    fi
}

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Main Animation Sequence
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Only run animations on new terminal (not nested shells)
if [[ -z "$STARTUP_ANIMATED" ]]; then
    export STARTUP_ANIMATED=1

    # Clear screen for clean animation
    clear

    # Random Pokemon (if available)
    if command -v pokemon-colorscripts &> /dev/null; then
        pokemon-colorscripts -r --no-title
        echo
    fi

    # System information with decryption effect
    if command -v figlet &> /dev/null && command -v nms &> /dev/null; then
        WELCOME_MSG="TERMINAL ONLINE"
        figlet -f slant "$WELCOME_MSG" 2>/dev/null | nms -a -f green
    elif command -v figlet &> /dev/null && command -v lolcat &> /dev/null; then
        figlet -f slant "TERMINAL ONLINE" 2>/dev/null | lolcat
    fi

    echo

    # System info with effects
    if command -v neofetch &> /dev/null; then
        if command -v lolcat &> /dev/null; then
            neofetch --config none --disable packages | lolcat
        else
            neofetch --config none --disable packages
        fi
    fi

    echo

    # Random cyberpunk quote with nms effect
    QUOTES=(
        "ACCESS GRANTED. WELCOME TO THE SYSTEM."
        "INITIALIZING NEURAL INTERFACE..."
        "CONNECTING TO THE MATRIX..."
        "BREACH PROTOCOL INITIATED..."
        "SYSTEM COMPROMISED. ACCESS GRANTED."
        "DECRYPTING MAINFRAME..."
        "LOADING CYBER WARFARE SUITE..."
        "HACK THE PLANET!"
    )

    RANDOM_QUOTE="${QUOTES[$RANDOM % ${#QUOTES[@]}]}"

    if command -v nms &> /dev/null; then
        echo "$RANDOM_QUOTE" | nms -a -f cyan
    else
        print_lolcat "$RANDOM_QUOTE"
    fi

    echo
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo
fi

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Shell Aliases for Rust Tools
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Modern replacements
if command -v eza &> /dev/null; then
    alias ls='eza --icons --group-directories-first'
    alias ll='eza -lh --icons --group-directories-first'
    alias la='eza -lah --icons --group-directories-first'
    alias lt='eza --tree --level=2 --icons'
    alias lta='eza --tree --level=2 --icons -a'
fi

if command -v bat &> /dev/null; then
    alias cat='bat --style=auto'
    alias ccat='/bin/cat'  # original cat
fi

if command -v rg &> /dev/null; then
    alias grep='rg'
fi

if command -v fd &> /dev/null; then
    alias find='fd'
fi

if command -v dust &> /dev/null; then
    alias du='dust'
fi

if command -v bottom &> /dev/null; then
    alias htop='btm'
    alias top='btm'
fi

if command -v procs &> /dev/null; then
    alias ps='procs'
fi

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Zoxide (smarter cd)
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

if command -v zoxide &> /dev/null; then
    eval "$(zoxide init bash)"
    alias cd='z'
fi

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Starship Prompt
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Useful Functions
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Pokemon with animation
poke() {
    if command -v pokemon-colorscripts &> /dev/null; then
        pokemon-colorscripts "$@"
    else
        echo "pokemon-colorscripts not installed"
    fi
}

# Matrix effect
matrix() {
    if command -v cmatrix &> /dev/null; then
        cmatrix -ab -C cyan
    else
        echo "cmatrix not installed. Run: sudo dnf install cmatrix"
    fi
}

# Decrypt effect on any text
decrypt() {
    if command -v nms &> /dev/null; then
        echo "$*" | nms -a
    else
        echo "$*"
    fi
}

# Rainbow effect on any text
rainbow() {
    if command -v lolcat &> /dev/null; then
        echo "$*" | lolcat
    else
        echo "$*"
    fi
}

# Big text with effects
bigtext() {
    if command -v figlet &> /dev/null; then
        if command -v lolcat &> /dev/null; then
            figlet "$*" | lolcat
        else
            figlet "$*"
        fi
    else
        echo "$*"
    fi
}

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Additional Useful Aliases
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias c='clear'
alias h='history'
alias ports='netstat -tulanp'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'

# Zellij aliases
alias zj='zellij'
alias zja='zellij attach'
alias zjl='zellij list-sessions'

# System aliases
alias update='sudo dnf update'
alias upgrade='sudo dnf upgrade'
alias install='sudo dnf install'
alias remove='sudo dnf remove'

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Export environment variables
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

export EDITOR="nano"
export VISUAL="nano"
export BAT_THEME="Catppuccin Mocha"

# Add cargo bin to PATH if exists
if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi
