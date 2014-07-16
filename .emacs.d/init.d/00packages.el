(setq jpk-packages
      '(
        ace-jump-mode
        ace-window
        auto-complete
        dash
        emmet-mode
	expand-region
        fill-column-indicator
        floobits
        flymake-ruby
        git-gutter-fringe
        highlight
	imenu-anywhere
	inf-ruby
        magit
	markdown-mode
	multi-term
        pallet
	powerline
        projectile
	rainbow-mode
	rhtml-mode
        rspec-mode
	ruby-tools
        rvm
        shut-up
        smartparens
        yasnippet
        ))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
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
