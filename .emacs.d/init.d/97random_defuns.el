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

;; buffer management
(defun kill-other-buffers ()
  "Prompt and kill all other buffers."
  (interactive)
  (if (y-or-n-p "Kill all buffers but current?")
      (mapc 'kill-buffer (delq (current-buffer) (buffer-list)))
    )
  )

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
