export DOTFILES=$HOME/.dotfiles
export PATH="$DOTFILES/bin:$HOME/opt/bin:$HOME/.local/share/bob/nvim-bin:/home/linuxbrew/.linuxbrew/bin:$PATH"

export BROWSER=/usr/bin/firefox
export VISUAL=nvim
export EDITOR=$VISUAL
export PAGER=less

export FILTHY_SHOW_EXIT_CODE=1

# enable colored output from ls, etc
export CLICOLOR=1

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_COMPLETION_TRIGGER=',,'
if [ -n "$TMUX" ]; then
  if [[ "$TMUX" != *"tmate"* ]]; then
    export FZF_DEFAULT_OPTS='--tmux 80%'
  fi
fi

export RSPEC_CORES=12
export NODE_OPTIONS="--max-old-space-size=8192"

export TIMEFMT=$'user\t%U\nsys\t%S\nreal\t%E\nmax mem\t%Mkb\ncpu\t%P\n'

export COMPOSE_PROFILES="*"

export WORK_DIR="$HOME/dev/prizepicks"

[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
