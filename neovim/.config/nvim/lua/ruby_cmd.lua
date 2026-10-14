-- Wrap a command so it runs under the project's ruby (chruby_auto walks up from
-- $PWD looking for .ruby-version), started from the project root.
return function(root, args)
  local script = 'source ~/.zsh/functions/chruby_auto.sh && chruby_auto && exec "$@"'
  return vim.list_extend({ 'zsh', '-c', script, 'zsh' }, args)
end
