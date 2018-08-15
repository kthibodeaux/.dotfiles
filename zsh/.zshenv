export DOTFILES=$HOME/.dotfiles
export PATH="$DOTFILES/bin:$HOME/opt/bin:$HOME/opt/dasht/bin:$PATH"
export MANPATH="$HOME/opt/dasht/man:$MANPATH"

export BROWSER=/usr/bin/firefox
export VISUAL=nvim
export EDITOR=$VISUAL
export PAGER=less

export FILTHY_SHOW_EXIT_CODE=1

# enable colored output from ls, etc
export CLICOLOR=1

# fzf to use ag
export FZF_DEFAULT_COMMAND='ag -g "" --hidden --ignore .git'
export FZF_COMPLETION_TRIGGER=',,'

[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local ]]
