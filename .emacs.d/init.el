(setq init-file (or load-file-name buffer-file-name))

(setq emacs-config-dir
      (file-name-directory init-file))
(setq autoload-dir
      (expand-file-name "autoload" emacs-config-dir))
(setq elisp-config-dir
      (expand-file-name "elisp" emacs-config-dir))
(setq modes-dir
      (expand-file-name "modes" emacs-config-dir))
(setq location-specific-dir
      (expand-file-name "location_specific" emacs-config-dir))

(if (file-exists-p autoload-dir)
    (dolist (file (directory-files autoload-dir t "\\.el$"))
      (load file)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(send-mail-function (quote smtpmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(powerline-evil-normal-face ((t (:inherit powerline-evil-base-face :background "darkgreen")))))

(setq elisp-config-files
	'("evil"
	  "random"
	  "ido"
	  "powerline"
	  "prompts"
	  "unkeybinds"
	  "keybinds"
	))

(if (file-exists-p elisp-config-dir)
	(dolist (file (directory-files elisp-config-dir t "\\.el$"))
      (load file)))

(if (file-exists-p modes-dir)
	(dolist (file (directory-files modes-dir t "\\.el$"))
      (load file)))

(if (file-exists-p location-specific-dir)
	(dolist (file (directory-files location-specific-dir t "\\.el$"))
      (load file)))
