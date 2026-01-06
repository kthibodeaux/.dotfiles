unset RUBY_AUTO_VERSION

function chruby_auto() {
  # Source chruby if not already loaded
  if ! type chruby >/dev/null 2>&1; then
    if [[ -f /home/linuxbrew/.linuxbrew/opt/chruby/share/chruby/chruby.sh ]]; then
      source /home/linuxbrew/.linuxbrew/opt/chruby/share/chruby/chruby.sh
    elif [[ -f /usr/share/chruby/chruby.sh ]]; then
      source /usr/share/chruby/chruby.sh
    fi
  fi

  local dir="$PWD/" version

  until [[ -z "$dir" ]]; do
    dir="${dir%/*}"

    if { read -r version <"$dir/.ruby-version"; } 2>/dev/null || [[ -n "$version" ]]; then
      if [[ "$version" == "$RUBY_AUTO_VERSION" ]]; then return
      else
        RUBY_AUTO_VERSION="$version"
      fi
    else
      # latest ruby
      RUBY_AUTO_VERSION=`chruby | tail -n 1 | cut -d'-' -f2`
    fi

    chruby $RUBY_AUTO_VERSION
    return $?
  done
}

if [[ -n "$ZSH_VERSION" ]]; then
  if [[ ! "$preexec_functions" == *chruby_auto* ]]; then
    preexec_functions+=("chruby_auto")
  fi
elif [[ -n "$BASH_VERSION" ]]; then
  trap '[[ "$BASH_COMMAND" != "$PROMPT_COMMAND" ]] && chruby_auto' DEBUG
fi
