;; ace
(require 'ace-jump-mode)
(require 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?z ?x ?c ?v))

;; auto complete
(require 'auto-complete-config)
(ac-config-default)
(setq ac-ignore-case nil)
(add-to-list 'ac-modes 'ruby-mode)
(add-to-list 'ac-modes 'web-mode)

;; fill column indicator
(require 'fill-column-indicator)
(add-hook 'ruby-mode-hook
          (lambda ()
            (set-fill-column 80)))
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)

;; diminish
;; see 04diminish.el

;; flymake
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

;; git gutter
(require 'fringe-helper)
(require 'git-gutter-fringe)
(global-git-gutter-mode +1)
(setq git-gutter-fr:side 'right-fringe)

;; move-lines
(require 'move-lines)

;; multi-term
(setq multi-term-program "/bin/bash")
(setq multi-term-program-switches "--login")

;; projectile
(projectile-global-mode)

;; rcodetools
(require 'rcodetools)

;; rspec-mode
(require 'rspec-mode)
(add-hook 'dired-mode-hook 'rspec-dired-mode)

;; ruby-refactor
(require 'ruby-refactor)
(setq ruby-refactor-add-parens t)
(add-hook 'ruby-mode-hook 'ruby-refactor-mode-launch)

;; rvm
(require 'rvm)
(rvm-use-default)

;; whitespace
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-global-modes '(ruby-mode))
(global-whitespace-mode t)
(setq require-final-newline t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)
