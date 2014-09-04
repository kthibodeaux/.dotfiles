(setq init-file (or load-file-name buffer-file-name))
(setq emacs-config-dir
      (file-name-directory init-file))
(setq elisp-dir
      (expand-file-name "elisp" emacs-config-dir))
(setq init-dir
      (expand-file-name "init.d" emacs-config-dir))

(add-to-list 'load-path elisp-dir)

(if (file-exists-p init-dir)
    (dolist (file (directory-files init-dir t "\\.el$"))
      (load file)))

(server-start)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(send-mail-function (quote smtpmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
