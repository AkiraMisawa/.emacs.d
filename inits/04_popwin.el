;; ;;;; 一時表示バッファを C-g で簡単に消す

;; (use-package popwin
;;   :ensure popwin)

;; (popwin-mode 1)
;; ;; ポップアップの大きさ
;; (setq popwin:popup-window-height 0.5)
;; ;;  文字のちらつき防止
;; (setq popwin:close-popup-window-timer-interval 0.5)

;; (when (require 'popwin nil t)
;;   (setq helm-samewindow nil)
;;   (setq display-buffer-function 'popwin:display-buffer)
;;   (push '("helm" :regexp t :height 0.5) popwin:special-display-config)
;;   (push '("*Completions*" :height 0.4) popwin:special-display-config)
;;   (push '("*compilation*" :height 0.4 :noselect t :stick t) popwin:special-display-config)
;;   )
