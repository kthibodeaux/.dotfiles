(require 'ruby-end)

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
           (not (and
                 (looking-at ".*)$")
                 (looking-back "(.*"))))
      (insert "_")
    (insert " ")))

(eval-after-load 'ruby-mode
  '(progn
     (define-key ruby-mode-map (kbd "#") 'senny-ruby-interpolate)
     (define-key ruby-mode-map (kbd "SPC") 'kdt-ruby-method-space-replace)))
