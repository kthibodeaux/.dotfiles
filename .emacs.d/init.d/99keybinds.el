;; ace
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-x SPC") 'ace-window)

;; buffer management
(global-set-key (kbd "C-x C-k C-k") 'kill-other-buffers)
(global-set-key (kbd "s-[") 'previous-buffer)
(global-set-key (kbd "s-]") 'next-buffer)

;; line movement
(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)

;; rcodetools
(global-set-key (kbd "C-c C-c") 'xmp)
