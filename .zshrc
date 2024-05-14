# Sway on startup
if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
	exec sway --unsupported-gpu
fi

# Zsh history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.histfile

# vi mode
bindkey -v
KEYTIMEOUT=1
# Fix bug of backspace getting stuck
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Basic auto/tab complete:
autoload -U compinit  # Enable Zsh completion system
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Powershell customization
PS1='[%n@%m %~]$ '

alias ls='ls --color=auto'
alias ll='ls -lva --color=auto'
alias vim=nvim
alias vi=nvim
alias ff=fastfetch

# Download Znap, if it's not there yet.
[[ -r ~/.zsh-plugins/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.zsh-plugins/znap
source ~/.zsh-plugins/znap/znap.zsh  # Start Znap

# Download plugins
znap install zsh-users/zsh-syntax-highlighting 

# Source folders of each plugin you want to use
znap source zsh-users/zsh-syntax-highlighting

# Make `tab` and `Shift Tab` cycle completions on the command line
bindkey              '^I'         menu-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete

# Alias config which we will use instead of the regular git when we want to interact with our configuration repository.
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
