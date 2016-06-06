export DOTFILES=$HOME/.dotfiles
export PATH="$DOTFILES/bin:$PATH"

export VISUAL=nvim
export EDITOR=$VISUAL
export CTAGS_COMMAND="/usr/local/bin/ctags --extra=+f -R --exclude=.git --exclude=log --exclude=tmp *"

export FILTHY_SHOW_EXIT_CODE=1

# enable colored output from ls, etc
export CLICOLOR=1

# fzf to use ag
export FZF_DEFAULT_COMMAND='ag -g "" --hidden --ignore .git'
export FZF_COMPLETION_TRIGGER=',,'

[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local ]]
