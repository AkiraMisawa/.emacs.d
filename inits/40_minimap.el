;; ; (package-install 'minimap)
;; (require 'minimap)

;; ;; minimapをオンオフ用関数
;; (defun minimap-toggle ()
;;   "Toggle minimap for current buffer."
;;   (interactive)
;;   (if (null minimap-bufname)
;;       (minimap-create)
;;     (minimap-kill)))
;; (global-set-key (kbd "<f6>") 'minimap-toggle)
