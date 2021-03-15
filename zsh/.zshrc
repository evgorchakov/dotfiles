source ~/.zinit/bin/zinit.zsh

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit light zdharma/history-search-multi-word
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure
zinit light changyuheng/zsh-interactive-cd
zinit light zsh-users/zsh-history-substring-search
zinit ice wait lucid blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions
zinit light agkozak/zsh-z
zinit light esc/conda-zsh-completion
zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

BASE16_SHELL=$HOME/.config/base16-shell/
[ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"


HISTFILE=~/.zhistory
HISTSIZE=1000000
SAVEHIST=1000000

setopt auto_cd
setopt extended_glob
setopt extended_history
setopt glob_complete
setopt hist_beep
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt inc_append_history
setopt multios
setopt no_case_glob
setopt numeric_glob_sort
setopt rc_expand_param
setopt share_history
setopt zle

alias ipy='ipython3'
alias vim='nvim'
alias ls='exa'
alias g='guild'

export KEYTIMEOUT=1
export IPYTHONDIR=~/.config/ipython

f(){
    if [ -z "$RANGER_LEVEL" ] 
    then
        ranger
    else
        exit
    fi
}


_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

export FZF_DEFAULT_OPTS='--height 30% --reverse --black'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_COMPLETION_TRIGGER='~~'
export FZF_COMPLETION_OPTS='+c -x'

# Don't bind these keys until ready
bindkey -v '^K' history-substring-search-up
bindkey -v '^J' history-substring-search-down
bindkey -v '^R' fzf-history-widget
bindkey "" autosuggest-accept

zstyle ':completion:*'  matcher-list 'm:{a-z}={A-Z}'

export XDG_CONFIG_HOME=/home/evgenii.gorchakov/.config
export EDITOR="nvim"

path=(
  /usr/local/{bin,sbin}
  /home/evgenii.gorchakov/.cargo/bin
  /usr/local/cuda/bin
  $path
  )

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/evgenii.gorchakov/.miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/evgenii.gorchakov/.miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/evgenii.gorchakov/.miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/evgenii.gorchakov/.miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

