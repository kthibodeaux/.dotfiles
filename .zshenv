export DOTFILES=$HOME/.dotfiles
export PATH="$DOTFILES/bin:$PATH"

export VISUAL=nvim
export EDITOR=$VISUAL
export CTAGS_COMMAND="/usr/local/bin/ctags -a -e -f TAGS --tag-relative -R --exclude=.git --exclude=log --exclude=tmp ."

[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local ]]
