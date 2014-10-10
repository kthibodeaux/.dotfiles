(defun kdt-setup-evil ()
  (require 'evil-leader)
  (evil-leader/set-leader ",")
  (global-evil-leader-mode)
  (require 'evil)
  (evil-mode 1))

(defun kdt-setup-ace ()
  (require 'ace-jump-mode)
  (require 'ace-window)
  (setq aw-keys '(?a ?s ?d ?f ?z ?x ?c ?v)))

(defun kdt-setup-anzu ()
  (require 'anzu)
  (global-anzu-mode +1))

(defun kdt-setup-autocomplete()
  (require 'auto-complete-config)
  (ac-config-default)
  (setq ac-ignore-case nil)
  (add-to-list 'ac-modes 'ruby-mode)
  (add-to-list 'ac-modes 'web-mode))

(defun kdt-setup-column-indicator ()
  (require 'fill-column-indicator)
  (add-hook 'ruby-mode-hook
	    (lambda ()
	      (set-fill-column 80)))
  (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
  (global-fci-mode 1))

(defun kdt-setup-flymake ()
  (require 'flymake-ruby)
  (add-hook 'ruby-mode-hook 'flymake-ruby-load))

(defun kdt-setup-move-lines ()
  (require 'move-lines))

(defun kdt-setup-projectile ()
  (projectile-global-mode))

(defun kdt-setup-rcodetools ()
  (require 'rcodetools))

(defun kdt-setup-rhtml ()
  (require 'rhtml-mode))

(defun kdt-setup-rspec ()
  (require 'rspec-mode)
  (setq rspec-use-rvm t)
  (add-hook 'dired-mode-hook 'rspec-dired-mode))

(defun kdt-setup-ruby-end ()
  (require 'ruby-end)
  (setq ruby-end-insert-newline nil))

(defun kdt-setup-ruby-refactor ()
  (require 'ruby-refactor)
  (setq ruby-refactor-add-parens t)
  (add-hook 'ruby-mode-hook 'ruby-refactor-mode-launch))

(defun kdt-setup-ruby-tools ()
  (require 'ruby-tools))

(defun kdt-setup-rvm ()
  (require 'rvm)
  (rvm-use-default))

(defun kdt-setup-smex ()
  (require 'smex)
  (smex-initialize))

(defun kdt-setup-web-mode ()
  (require 'web-mode))

(defun kdt-setup-whitespace ()
  (require 'whitespace)
  (setq whitespace-style '(face empty tabs lines-tail trailing))
  (setq whitespace-global-modes '(ruby-mode))
  (global-whitespace-mode t)
  (setq require-final-newline t)
  (add-hook 'before-save-hook 'delete-trailing-whitespace))

(defun kdt-setup-yasnippet ()
  (require 'yasnippet)
  (yas-global-mode 1))
