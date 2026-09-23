# vi: set ft=sh :

if ! command -v brew > /dev/null 2>&1; then
  echo "homebrew not installed - run host/homebrew.sh first"
  exit 1
fi

if brew list pipx > /dev/null 2>&1; then
  echo "skipping install pipx: already installed"
else
  brew install pipx
fi

# i3a calls asyncio.get_event_loop() outside a running loop, which
# homebrew's default python (3.14+) now raises RuntimeError for instead of
# implicitly creating one - pin the venv to 3.12 to avoid it crashing on
# startup.
if brew list python@3.12 > /dev/null 2>&1; then
  echo "skipping install python@3.12: already installed"
else
  brew install python@3.12
fi

if command -v i3a-master-stack > /dev/null 2>&1; then
  echo "skipping install i3a: already installed"
else
  pipx install i3a --python "$(brew --prefix)/bin/python3.12"
fi
