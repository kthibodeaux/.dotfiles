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
(put 'upcase-region 'disabled nil)

(kdt-setup-evil)
(kdt-setup-defaults)
(kdt-setup-ace)
(kdt-setup-anzu)
(kdt-setup-autocomplete)
(kdt-setup-column-indicator)
(kdt-setup-flymake)
(kdt-setup-linum)
(kdt-setup-move-lines)
(kdt-setup-projectile)
(kdt-setup-rcodetools)
(kdt-setup-rhtml)
(kdt-setup-rspec)
(kdt-setup-ruby-end)
(kdt-setup-ruby-refactor)
(kdt-setup-ruby-tools)
(kdt-setup-rvm)
(kdt-setup-smex)
(kdt-setup-web-mode)
(kdt-setup-whitespace)
(kdt-setup-yasnippet)

(setq ido-ignore-buffers '("\\` "
			   "*Messages*"
			   "*Help*"
			   "*Completions*"
			   "*fsm-debug*"
			   "*-jabber-roster-*"
			   "^*-jabber-groupchat-\.*"
			   "^*epc\.*"))

(add-to-list 'auto-mode-alist '("\\.html.erb$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.erubis$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml$" . rhtml-mode))

(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.cap$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Guardfile$" . ruby-mode))

(add-to-list 'auto-mode-alist '("\\.hbs$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.htm$" . web-mode))
