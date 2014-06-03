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