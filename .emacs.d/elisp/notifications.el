(require 'request)
(require 'json)

;; disabled by default
;; is enabled on work iMac via location_specific/ file
(setq kdt-notify-enabled nil)

(defun kdt-notify-me (sender group title contents)
  (if kdt-notify-enabled
      (request "http://localhost:7123"
	       :type "POST"
	       :data (json-encode-list (list (cons "title" title)
					     (cons "group" group)
					     (cons "sender" sender)
					     (cons "message" contents)))
	       :parser 'json-read)))
