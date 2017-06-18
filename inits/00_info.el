;; ;;; info
;; (add-to-list 'Info-default-directory-list "~/.emacs.d/share/info/")
;; ;; For adding .info to the entry, run the following in your shell.
;; ;; % sudo install-info /path/to/foo.info /path/to/dir
;; (let ((my-info-dir "~/.emacs.d/share/info")
;;       (info-path (getenv "INFOPATH")))
;;   (unless (string-match (concat "\\`" (regexp-quote my-info-dir)) info-path)
;;     (setenv "INFOPATH"
;;             (concat my-info-dir ":" info-path))))

;; (defun open-sicp (&optional other-window)
;;   (interactive "P")
;;   (info "sicp.info" (and other-window "*SICP*")))
