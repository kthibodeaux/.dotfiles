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
