;; ace
(require 'ace-jump-mode)
(require 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?z ?x ?c ?v))

;; anzu
(require 'anzu)
(global-anzu-mode +1)

;; auto complete
(require 'auto-complete-config)
(ac-config-default)
(setq ac-ignore-case nil)
(add-to-list 'ac-modes 'ruby-mode)
(add-to-list 'ac-modes 'web-mode)

;; expand-region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; fill column indicator
(require 'fill-column-indicator)
(add-hook 'ruby-mode-hook
          (lambda ()
            (set-fill-column 80)))
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)

;; flymake
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

;; git gutter
(require 'fringe-helper)
(require 'git-gutter-fringe)
(global-git-gutter-mode +1)
(setq git-gutter-fr:side 'right-fringe)

;; google-this
(require 'google-this)
(google-this-mode 1)

;; move-lines
(require 'move-lines)

;; multi-term
(setq multi-term-program "/bin/bash")
(setq multi-term-program-switches "--login")

;; projectile
(projectile-global-mode)

;; rcodetools
(require 'rcodetools)

;; rhtml-mode
(require 'rhtml-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.erubis\\'" . rhtml-mode))

;; rspec-mode
(require 'rspec-mode)
(setq rspec-use-rvm t)
(add-hook 'dired-mode-hook 'rspec-dired-mode)

;; ruby-end
(require 'ruby-end)
(setq ruby-end-insert-newline nil)

;; ruby-refactor
(require 'ruby-refactor)
(setq ruby-refactor-add-parens t)
(add-hook 'ruby-mode-hook 'ruby-refactor-mode-launch)

;; ruby-tools
(require 'ruby-tools)

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
