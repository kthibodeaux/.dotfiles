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

export FZF_DEFAULT_COMMAND='ag -g "" --hidden --ignore .git'
export FZF_COMPLETION_TRIGGER=',,'
export FZF_DEFAULT_OPTS='--color dark,hl:33,hl+:37,fg+:235,bg+:0,fg+:254'

export RSPEC_CORES=8

[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local ]]
