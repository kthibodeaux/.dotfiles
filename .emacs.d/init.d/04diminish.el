(require 'diminish)

(eval-after-load "mrev"
  '(diminish 'mrev))

(eval-after-load "yasnippet"
  '(diminish 'yas-minor-mode " Y"))

(eval-after-load "git-gutter"
  '(diminish 'git-gutter-mode " GG"))

(eval-after-load "flymake"
  '(diminish 'flymake-mode " FM"))
