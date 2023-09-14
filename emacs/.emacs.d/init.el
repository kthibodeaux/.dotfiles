; remove gui elements
(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

; theme
(load-theme 'wombat)

; make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
