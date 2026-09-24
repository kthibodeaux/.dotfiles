export DOTFILES=$HOME/.dotfiles
export PATH="$DOTFILES/bin:$HOME/go/bin:$HOME/.local/bin:$HOME/opt/bin:$HOME/.local/share/bob/nvim-bin:/home/linuxbrew/.linuxbrew/bin:$PATH"

export GTK_THEME=Fluent-grey-Dark
export BROWSER=/usr/bin/firefox
export VISUAL=nvim
export EDITOR=$VISUAL
export PAGER=less

export OLLAMA_API_BASE=http://127.0.0.1:11434

export FILTHY_SHOW_EXIT_CODE=1

# enable colored output from ls, etc
export CLICOLOR=1

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS='--preview-window=down:70%'
export FZF_COMPLETION_TRIGGER=',,'

export RSPEC_CORES=12
export NODE_OPTIONS="--max-old-space-size=8192"

export TIMEFMT=$'user\t%U\nsys\t%S\nreal\t%E\nmax mem\t%Mkb\ncpu\t%P\n'

export COMPOSE_PROFILES="*"

if command -v colima > /dev/null 2>&1; then
  export DOCKER_HOST="unix://${HOME}/.config/colima/default/docker.sock"

  # testcontainers/ryuk bind-mount the docker socket by literally reusing
  # DOCKER_HOST's path - but that's the *client-side* forwarded path, and the
  # daemon actually creating the bind mount runs inside the colima VM, where
  # that path means nothing. this tells it to use the real in-VM socket path
  # instead, which is what actually needs to land inside the container.
  export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
fi

export WORK_DIR="$HOME/dev/prizepicks"

[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
