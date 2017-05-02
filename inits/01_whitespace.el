;; ;; whitespaceの可視化
;; (require 'whitespace)
;; (setq whitespace-style '(face
;;                          trailing
;;                          tabs
;;                          empty
;;                          space-mark
;;                          tab-mark))
;; (setq whitespace-display-mappings
;;       '(
;;         ;; space
;;         (space-mark ?\ ?\u3000 [?\u25a1])
;;         ;; hard space
;;         (space-mark ?\xA0 [?\xA4] [?_])
;;         ;; end-of-line
;;         (newline-mark ?\n [?\xB6 ?\n] [?$ ?\n])
;;         ;; tab
;;         (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t])
;;         ))

;; (setq whitespace-trailing-regexp "\\([ \u00A0]+\\)$")
;; (setq whitespace-space-regexp "\\(\u3000+\\)")

;; ;; 保存前に自動でクリーンアップ
;; ;;(setq whitespace-action '(auto-clean))

;; (set-face-attribute 'whitespace-trailing nil
;;                     :foreground "RoyalBlue4"
;;                     :background "RoyalBlue4"
;;                     :underline nil)
;; (set-face-attribute 'whitespace-tab nil
;;                     :foreground "yellow4"
;;                     :background "yellow4"
;;                     :underline nil)
;; (set-face-attribute 'whitespace-space nil
;;                     :foreground "gray40"
;;                     :background "gray20"
;;                     :underline nil)
;; (global-whitespace-mode t)
