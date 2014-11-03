(setq jpk-packages
      '(
        ace-jump-mode
        ace-window
        ag
        anzu
        auto-complete
        coffee-mode
        dash
        elfeed
        emmet-mode
        evil
        evil-leader
        fill-column-indicator
        flymake-ruby
        git-timemachine
        haml-mode
        highlight
        imenu-anywhere
        inf-ruby
        linum-relative
        magit
        markdown-mode
        pallet
        powerline
        powerline-evil
        projectile
        rainbow-mode
        rhtml-mode
        request
        rspec-mode
        ruby-end
        ruby-tools
        rvm
        shut-up
        smartparens
        smex
        web-mode
        yasnippet
        ))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/"))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(dolist (pkg jpk-packages)
  (when (and (not (package-installed-p pkg))
           (assoc pkg package-archive-contents))
    (package-install pkg)))

(defun package-list-unaccounted-packages ()
  "Like `package-list-packages', but shows only the packages that
  are installed and are not in `jpk-packages'.  Useful for
  cleaning out unwanted packages."
  (interactive)
  (package-show-package-list
   (remove-if-not (lambda (x) (and (not (memq x jpk-packages))
                            (not (package-built-in-p x))
                            (package-installed-p x)))
                  (mapcar 'car package-archive-contents))))