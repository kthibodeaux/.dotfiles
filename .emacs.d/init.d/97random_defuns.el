;; beautify json
(defun beautify-json-region (beg end)
  "Beautify JSON in region between beg and end."
  (interactive "r")
  (save-excursion
    (shell-command-on-region beg end "python -m json.tool" nil t)))

(defun beautify-json ()
  "Beautify JSON in buffer."
  (interactive)
  (beautify-json-region (point-min) (point-max)))

;; beautify sql
(defun beautify-sql-region (beg end)
  "Beautify SQL in region between beg and end."
  (interactive "r")
  (save-excursion
    (shell-command-on-region beg end "anbt-sql-formatter" nil t)))

(defun beautify-sql ()
  "Beautify SQL in buffer."
  (interactive)
  (beautify-sql-region (point-min) (point-max)))

;; new line below current
(defun kdt-open-line-below()
  "Insert a new line below the current line and move pointer to it"
  (interactive)
  (unless (eolp)
    (end-of-line))
  (newline-and-indent))

;; reset mode line color
(defun kdt-reset-mode-line-color()
  (interactive)
  (set-face-attribute 'mode-line nil :background "#aaaaaa" :foreground "#292929"))

;; toggle line/region comment
(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))

;; untabify-buffer
(defun untabify-buffer ()
  "Run untabify on the buffer"
  (interactive)
  (untabify (point-min) (point-max)))

;; Taken from Jorgen's Weblog
;; http://blog.jorgenschaefer.de/2012/03/emacs-snippets-calculation-helpers.html

(defun fc-calculate-region (start end &optional prefix)
  "Evaluate the mathematical expression within the region, and
replace it with its result.

With a prefix arg, do not replace the region, but instead put the
result into the kill ring."
  (interactive "r\nP")
  (let* ((expr (buffer-substring start end))
         (result (fc-bc-calculate-expression expr))
         (ends-with-newline (string-match "\n$" expr)))
    (if prefix
        (progn
          (kill-new result)
          (message "%s" result))
      (delete-region start end)
      (insert result)
      (when ends-with-newline
        (insert "\n")))))

(defun fc-bc-calculate-expression (expr)
  "Evaluate `expr' as a mathematical expression, and return its result.

This actually pipes `expr' through bc(1), replacing newlines with
spaces first. If bc(1) encounters an error, an error is
signalled."
  (with-temp-buffer
    (insert expr)
    (goto-char (point-min))
    (while (search-forward "\n" nil t)
      (replace-match " " nil t))
    (goto-char (point-max))
    (insert "\n")
    (call-process-region (point-min)
			 (point-max)
                         "bc" t t nil "-lq")
    (goto-char (point-min))
    (when (search-forward "error" nil t)
      (error "Bad expression"))
    (while (search-forward "\n" nil t)
      (replace-match "" nil t))
    (buffer-string)))
