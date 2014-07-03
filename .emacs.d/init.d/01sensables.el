(setq inhibit-startup-message t)
(tool-bar-mode -1)
(setq initial-scratch-message nil)
(delete-selection-mode 1)
(scroll-bar-mode -1)
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))
(setq-default major-mode 'org-mode)
(column-number-mode)
(put 'dired-find-alternate-file 'disabled nil)

;; allow 60MB of memory (instead of 0.76MB) before calling GC
(setq gc-cons-threshold 60000000)

;; backup files
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; electric
(electric-indent-mode 1)
(electric-pair-mode 1)

;; ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; highlight current line
(global-hl-line-mode 1)

;; line numbers
(global-linum-mode 1)

;; prompts
(defun my-y-or-nil-p (prompt)
  "PROMPT user with a yes-or-no question, but only test for y."
  (if (string= "y"
               (downcase
                (read-from-minibuffer
                 (concat prompt "(y or n) "))))
      t
    nil))
(defalias 'yes-or-no-p 'my-y-or-nil-p)
(setq confirm-kill-emacs 'yes-or-no-p)

(defadvice yes-or-no-p (around prevent-dialog activate)
  "Prevent yes-or-no-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))

(defadvice y-or-n-p (around prevent-dialog-yorn activate)
  "Prevent y-or-n-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))

;; visual bell
(setq visible-bell 1)
