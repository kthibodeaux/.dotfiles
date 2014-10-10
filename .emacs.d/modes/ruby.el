(require 'flymake-ruby)
(require 'rcodetools)
(require 'rhtml-mode)
(require 'rspec-mode)
(require 'ruby-end)
(require 'ruby-refactor)
(require 'ruby-tools)
(require 'rvm)

(setq ruby-refactor-add-parens t)
(setq rspec-use-rvm t)
(setq ruby-end-insert-newline nil)
(rvm-use-default)

(add-to-list 'auto-mode-alist '("\\.html.erb$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.erubis$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml$" . rhtml-mode))

(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.cap$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Guardfile$" . ruby-mode))

(add-to-list 'ac-modes 'ruby-mode)

(add-hook 'ruby-mode-hook
	  (lambda ()
	    (set-fill-column 80)))

(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(add-hook 'ruby-mode-hook 'linum-mode)
(add-hook 'ruby-mode-hook 'ruby-refactor-mode-launch)

(add-hook 'rhtml-mode-hook 'linum-mode)

(add-hook 'dired-mode-hook 'rspec-dired-mode)

(defun senny-ruby-interpolate ()
  "In a double quoted string, interpolate."
  (interactive)
  (insert "#")
  (when (and
         (looking-back "\".*")
         (looking-at ".*\""))
    (insert "{}")
    (backward-char 1)))

(defun kdt-ruby-method-space-replace ()
  "When pressing space while naming a defined method, insert an underscore"
  (interactive)
  (if (and (looking-back "def .+")
           (not (looking-back ".+(.+")))
      (insert "_")
    (insert " ")))

(eval-after-load 'ruby-mode
  '(progn
     (define-key ruby-mode-map (kbd "#") 'senny-ruby-interpolate)
     (define-key ruby-mode-map (kbd "SPC") 'kdt-ruby-method-space-replace)))
