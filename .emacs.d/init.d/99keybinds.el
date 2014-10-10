(define-key evil-motion-state-map ";" 'smex)
(define-key evil-normal-state-map (kbd "C-i") 'evil-indent-line)
(define-key evil-visual-state-map (kbd "C-i") 'evil-indent-line)

;; osx command key
;; anything in here should also be bound to something using C or X
(global-unset-key (kbd "s-`"))
(global-unset-key (kbd "s-q"))
(global-unset-key (kbd "s-w"))
(global-unset-key (kbd "s-o"))
(global-unset-key (kbd "s-p"))

(global-unset-key (kbd "s-a"))
(global-unset-key (kbd "s-d"))
(global-unset-key (kbd "s-f"))
(global-unset-key (kbd "s-g"))
(global-unset-key (kbd "s-h"))

(global-unset-key (kbd "s-z"))
(global-unset-key (kbd "s-x"))
(global-unset-key (kbd "s-c"))
(global-unset-key (kbd "s-v"))

(evil-leader/set-key "xc" 'save-buffers-kill-terminal)

(evil-leader/set-key "`" 'query-replace)

;; ace
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

;; file management
(evil-leader/set-key
  "f" 'find-file
  "o" 'projectile-find-file
  "s" 'save-buffer)

;; imenu-anywhere
(evil-leader/set-key "n" 'imenu-anywhere)

;; magit
(evil-leader/set-key
  "gt" 'git-timemachine
  "gs" 'magit-status)

;; move-lines
(global-set-key (kbd "M-<up>") 'move-lines-up)
(global-set-key (kbd "M-<down>") 'move-lines-down)

;; rcodetools
(evil-leader/set-key ",c" 'xmp)

;; reset mode line color (guard changes it)
(global-set-key (kbd "<f13>") 'kdt-reset-mode-line-color)

;; toggle line/region comment
(evil-leader/set-key "/" 'comment-or-uncomment-region-or-line)
