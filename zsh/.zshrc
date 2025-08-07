# Disable bell
setopt NO_BEEP

# Ctrl+Left/Right Arrow for word movement
bindkey '\e[1;5C' forward-word
bindkey '\e[1;5D' backward-word
bindkey '\e[5C' forward-word
bindkey '\e[5D' backward-word
bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word

# Ctrl+Delete: delete next word
bindkey '\e[3;5~' kill-word

# Ctrl+Backspace: delete previous word
bindkey '^H' backward-kill-word