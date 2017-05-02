(require 'imenu)
; あいまいマッチ
(setq ido-enable-flex-matching t)
(global-set-key (kbd "C-.") 'ido-imenu-anywhere)


(defun semargle-clear ()
  "Clear semargle overlays in current buffer."
  (interactive)
  (dolist (ov (overlays-in (point-min) (point-max)))
    (when (overlay-get ov 'smeargle)
      (delete-overlay ov))))

