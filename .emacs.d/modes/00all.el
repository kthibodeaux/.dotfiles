(require 'ace-jump-mode)
(require 'ace-window)
(require 'anzu)
(require 'auto-complete-config)
(require 'fill-column-indicator)
(require 'move-lines)
(require 'smex)
(require 'whitespace)
(require 'yasnippet)
(require 'linum-relative)

(setq inhibit-startup-message t)
(tool-bar-mode -1)
(setq initial-scratch-message nil)
(setq initial-major-mode 'ruby-mode)
(delete-selection-mode 1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(put 'dired-find-alternate-file 'disabled nil)

(setq gc-cons-threshold 60000000)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(electric-indent-mode 1)
(electric-pair-mode 1)

(global-hl-line-mode 1)

(setq visible-bell 1)

(setq linum-relative-current-symbol "")

(setq aw-keys '(?a ?s ?d ?f ?z ?x ?c ?v))

(global-anzu-mode +1)

(ac-config-default)
(setq ac-ignore-case nil)

(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)

(projectile-global-mode)

(smex-initialize)

(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-global-modes '(ruby-mode))
(global-whitespace-mode t)
(setq require-final-newline t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(yas-global-mode 1)
