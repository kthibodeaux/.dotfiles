(defun kdt-y-or-nil-p (prompt)
  "PROMPT user with a yes-or-no question, but only test for y."
  (if (string= "y"
	       (downcase
		(read-from-minibuffer
		 (concat prompt "(y or n) "))))
      t
    nil))

(defalias 'yes-or-no-p 'kdt-y-or-nil-p)
(setq confirm-kill-emacs 'yes-or-no-p)

(defadvice yes-or-no-p (around prevent-dialog activate)
  "Prevent yes-or-no-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))

(defadvice y-or-n-p (around prevent-dialog-yorn activate)
  "Prevent y-or-n-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))
