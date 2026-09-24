unsetopt nomatch
setopt extendedglob

# completion
fpath=(~/.zsh/filthy $fpath)

# completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''

# load custom functions
for function in ~/.zsh/functions/*; do
  source $function
done

if type "dircolors" > /dev/null; then
  eval `dircolors ~/.zsh/dircolors.ansi-dark`
fi

# syntax highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# history settings
HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000
setopt share_history
setopt inc_append_history
setopt extended_history

# vi mode
bindkey -v
bindkey "^R" history-incremental-search-backward

# provide zmv command for easy bulk renaming
# example for changing extension of all matching files in a heirarchy:
# zmv '(**/)(*).css.scss' '$1/$2.scss'
autoload -U zmv

# prompt
autoload -U promptinit && promptinit
prompt filthy

[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

for fzf_shell_dir in /home/linuxbrew/.linuxbrew/opt/fzf/shell /usr/share/fzf/shell /usr/share/fzf /usr/share/doc/fzf/examples; do
  if [ -d "$fzf_shell_dir" ]; then
    [[ -f "$fzf_shell_dir/key-bindings.zsh" ]] && source "$fzf_shell_dir/key-bindings.zsh"
    [[ -f "$fzf_shell_dir/completion.zsh" ]] && source "$fzf_shell_dir/completion.zsh"
    break
  fi
done

source ~/.zsh/functions/chruby_auto.sh
eval "$(direnv hook zsh)"

opentmux
