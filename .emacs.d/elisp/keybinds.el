(define-key evil-motion-state-map ";" 'smex)
(define-key evil-normal-state-map (kbd "C-i") 'evil-indent-line)
(define-key evil-visual-state-map (kbd "C-i") 'evil-indent-line)

(evil-leader/set-key "xc" 'save-buffers-kill-terminal)
(evil-leader/set-key "`" 'query-replace)

;; ace-jump
(evil-leader/set-key ",s" 'ace-jump-mode)

;; buffer management
(evil-leader/set-key
  "b" 'ido-switch-buffer
  "q" 'delete-window
  ",k" 'kill-this-buffer
  "k" 'kill-buffer
  "w" 'bury-buffer
  "." 'ace-window
  ",." 'ace-swap-window
  "h" 'split-window-below
  "v" 'split-window-right)

;; calculate-region
(evil-leader/set-key "?" 'fc-calculate-region)

;; emmet
(evil-leader/set-key "e" 'emmet-expand-line)

;; file management
(evil-leader/set-key
  "f" 'find-file
  "o" 'projectile-find-file
  "s" 'save-buffer)

;; imenu-anywhere
(evil-leader/set-key "n" 'imenu-anywhere)

;; inf-ruby
;; TODO

;; magit
(evil-leader/set-key
  "gt" 'git-timemachine
  "gs" 'magit-status)

;; move-lines
(global-set-key (kbd "M-<up>") 'move-lines-up)
(global-set-key (kbd "M-<down>") 'move-lines-down)

;; rcodetools
(evil-leader/set-key ",c" 'xmp)

;; ruby-tools
(evil-leader/set-key
  "'" 'ruby-tools-to-single-quote-string
  "\"" 'ruby-tools-to-double-quote-string
  ":" 'ruby-tools-to-symbol
  "#" 'ruby-tools-interpolate)

;; reset mode line color (guard changes it)
(global-set-key (kbd "<f13>") 'kdt-reset-mode-line-color)

;; toggle line/region comment
(evil-leader/set-key "/" 'comment-or-uncomment-region-or-line)
