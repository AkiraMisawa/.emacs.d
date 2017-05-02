;; (when (require 'auto-complete-config nil t)
;;   (add-to-list 'ac-dictionary-directories 
;;     "~/.emacs.d/elisp/ac-dict")
;;   (setq ac-use-menu-map t)
;;   ;; デフォルトで設定済み
;;   (define-key ac-completing-map "\C-m" 'ac-complete)
;;   (define-key ac-completing-map "\r" nil)
;;   (define-key ac-menu-map "\C-n" 'ac-next)
;;   (define-key ac-menu-map "\C-p" 'ac-previous)
;;   (add-to-list 'ac-sources 'ac-source-yasnippet) ;; 常にYASnippetを補完候補に
;;   (setq ac-auto-start 2)
;;   (setq ac-dictionary-directories "~/.emacs.d/elisp/ac-dict") ;; 辞書ファイルのディレクトリ
;;   (setq ac-comphist-file "~/.emacs.d/elisp/auto-complete/ac-comphist.dat") ;; 補完履歴のキャッシュ先
;;   (ac-config-default))

;; (require 'auto-complete-config)
;; (ac-config-default)
;; (add-to-list 'ac-modes 'text-mode)
;; (add-to-list 'ac-modes 'yatex-mode)
;; (ac-set-trigger-key "TAB")
;; (setq ac-use-menu-map t)
