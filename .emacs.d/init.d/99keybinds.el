;; ace
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-x SPC") 'ace-window)

;; buffer management
(global-set-key (kbd "C-x C-k C-k") 'kill-other-buffers)
(global-set-key (kbd "s-[") 'previous-buffer)
(global-set-key (kbd "s-]") 'next-buffer)
(global-set-key (kbd "C-c k") 'bury-buffer)

;; calculate-region
(global-set-key (kbd "C-c m") 'fc-calculate-region)

;; google-this
(global-set-key (kbd "C-x g") 'google-this-mode-submap)

;; imenu-anywhere
(global-set-key (kbd "C-x n") 'imenu-anywhere)

;; join lines
(global-set-key (kbd "M-j")
            (lambda ()
                  (interactive)
                  (join-line -1)))

;; magit
(global-set-key (kbd "<f5>") 'git-timemachine)
(global-set-key (kbd "<f6>") 'magit-status)

;; move-lines
(global-set-key (kbd "M-<up>") 'move-lines-up)
(global-set-key (kbd "M-<down>") 'move-lines-down)

;; rcodetools
(global-set-key (kbd "C-c C-c") 'xmp)

;; reset mode line color (guard changes it)
(global-set-key (kbd "<f13>") 'kdt-reset-mode-line-color)

;; smex
(global-unset-key (kbd "M-x"))
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-s m") 'smex-major-mode-commands)
(global-set-key (kbd "M-s x") 'execute-extended-command) ;; old M-x

;; toggle line/region comment
(global-set-key (kbd "s-/") 'comment-or-uncomment-region-or-line)
