;; ace
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-x SPC") 'ace-window)

;; buffer management
(global-set-key (kbd "C-x C-k C-k") 'kill-other-buffers)
(global-set-key (kbd "s-[") 'previous-buffer)
(global-set-key (kbd "s-]") 'next-buffer)

;; magit
(global-set-key (kbd "<f6>") 'magit-status)

;; move-lines
(move-lines-binding)

;; rcodetools
(global-set-key (kbd "C-c C-c") 'xmp)
