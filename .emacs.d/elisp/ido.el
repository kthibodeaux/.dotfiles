;; ido
(setq ido-enable-flex-matching t)
(setq ido-show-dot-for-dired t)
(setq ido-everywhere t)
(ido-mode 1)

(setq ido-ignore-buffers '("\\` "
			   "*Messages*"
			   "*Help*"
			   "*Completions*"
			   "*fsm-debug*"
			   "*-jabber-roster-*"
			   "^*-jabber-groupchat-\.*"
			   "^*epc\.*"))
