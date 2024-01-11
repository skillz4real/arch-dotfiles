### FANCY PROMPT
eval "$(starship init zsh)"


### PERL 
PATH="/home/z/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/z/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/z/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/z/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/z/perl5"; export PERL_MM_OPT;

fastfetch -l /home/z/.config/fastfetch/ascii_grim
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

setopt autocd
setopt correct


bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + tab undo last action

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
alias ftp="lftp -u ftpuser,t^169B4Z $TRINITY"
alias JBL="bluetoothctl connect F8:5C:7D:34:1A:89"
alias vim=nvim
alias monero="monerod --config-file /home/z/xdd/xmr/monerod.conf --detach"
alias xterm="mullvad-exclude xterm"
alias localb="mullvad-exclude falkon"
