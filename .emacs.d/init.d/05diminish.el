(require 'diminish)

(eval-after-load "magit-auto-revert-mode"
  '(diminish 'magit-auto-revert-mode))

(eval-after-load "yasnippet"
  '(diminish 'yas-minor-mode " Y"))

(eval-after-load "git-gutter"
  '(diminish 'git-gutter-mode " GG"))

(eval-after-load "flymake"
  '(diminish 'flymake-mode " FM"))

(eval-after-load "ruby-refactor"
  '(diminish 'ruby-refactor-mode))

(eval-after-load "projectile"
  '(diminish 'projectile-mode " P"))
