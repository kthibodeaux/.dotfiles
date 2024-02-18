export DOTFILES=$HOME/.dotfiles
export PATH="$DOTFILES/bin:$HOME/opt/bin:$PATH"

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

export RSPEC_CORES=12
export NODE_OPTIONS="--max-old-space-size=8192"

export TIMEFMT=$'user\t%U\nsys\t%S\nreal\t%E\nmax mem\t%Mkb\ncpu\t%P\n'

[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
