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

(global-set-key (kbd "s-`") 'query-replace)
(global-set-key (kbd "s-o") 'projectile-find-file)
(global-set-key (kbd "s-p") 'projectile-switch-project)

(global-set-key (kbd "s-a") 'er/expand-region)
(global-set-key (kbd "s-f") 'projectile-multi-occur)

(global-set-key (kbd "C-z") 'keyboard-quit)

;; ace
(global-set-key (kbd "s-[") 'ace-window)
(global-set-key (kbd "s-]") 'ace-jump-mode)
(global-set-key (kbd "s-\\") 'ace-swap-window)

;; buffer management
(global-set-key (kbd "C-c k") 'bury-buffer)

;; calculate-region
(global-set-key (kbd "C-c m") 'fc-calculate-region)

;; elfeed
(global-set-key (kbd "<f15>") 'elfeed)

;; git-messenger
(global-set-key (kbd "M-<f5>") 'git-messenger:popup-message)

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

;; newline below
(global-set-key (kbd "C-<return>") 'kdt-open-line-below)

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
