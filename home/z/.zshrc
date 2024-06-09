### FANCY PROMPT
eval "$(starship init zsh)"

fastfetch -l /home/z/.config/fastfetch/ascii_grim
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

setopt autocd
setopt correct


bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[5~' beginning-of-buffer-or-history       # page up
bindkey '^[[6~' end-of-buffer-or-history            # page up
## autocomplete scripts before loading compinit
fpath=($fpath ~/.config/zsh/.zsh.d)

# enable completion features
autoload -Uz compinit
compinit -i

# compinit -d ~/.config/zsh/zcompdump
_comp_options+=(globdots) # With hidden files

# setopt GLOB_COMPLETE      # Show autocompletion menu with globs
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.


zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case insensitive tab completion

zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.config/zsh/.zcompcache"

# Define completers
zstyle ':completion:*' completer _extensions _complete _approximate

zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'

zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Only display some tags for the command cd
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories


# History configurations
HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=10000
SAVEHIST=20000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# force zsh to show the complete history
alias history="history 0"

# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'
fi

# from bashrc
alias trinity="ssh z@$TRINITY"
alias ftp="sftp ftpuser@$TRINITY"
alias JBL="bluetoothctl connect F8:5C:7D:34:1A:89"
alias vim="nvim"
alias monero="monerod --config-file /home/z/xdd1/xmr/monerod.conf --detach"
alias xterm="mullvad-exclude xterm"
alias localb="mullvad-exclude falkon"
alias feh="feh -."
alias spectrum="spectrum -d /home/z/Music"
alias stealth-scan="sudo nmap -vv -n -f -T 4 -D 192.168.1.1,192.168.1.0 --randomize-hosts --data-length 200"
alias icat="kitty +kitten icat"
alias refresh="source /etc/X11/xinit/xinitrc"
alias kbd="brightnessctl -d asus::kbd_backlight s "
#alias startx= "startx -- -keeptty >> ~/.local/share/xorg/betterXorg.log"

eval $(thefuck --alias)

export PATH=/opt/cuda/bin:$HOME/usr/bin:$PATH
export LD_LIBRARY_PATH=/opt/cuda/lib64:$LD_LIBRARY_PATH

alias nu="sudo -u neo4j"
alias pu="sudo -u postgres"
