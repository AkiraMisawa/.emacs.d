;; google c++ style
;; (require 'google-c-style)
;; (add-hook 'c-mode-common-hook 'google-set-c-style)
;; (add-hook 'c++-mode-common-hook 'google-set-c-style)
;; (add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; cmake-ide
(use-package cmake-ide
  :bind (
         ("<f7>" . cmake-ide-compile)
         )
  :config
  (progn
    (setq 
     ;; rdm & rcコマンドへのパス。コマンドはRTagsのインストール・ディレクトリ下。
     cmake-ide-rdm-executable "/usr/local/bin/rdm"
     cmake-ide-rc-executable  "/usr/local/bin/rc"
     )
    )
  )

;; RTags
(use-package rtags
  :bind (
         ;; TODO: いちいちキーバインド覚えられないのでhelmで統一的なインターフェースを用意する
         ("M-." . rtags-find-symbol-at-point)
         ("M-," . rtags-location-stack-back)
         ;;("M-;" . rtags-find-symbol)
         ;;("M-@" . rtags-find-references)
         )
  :config
  (progn
    (rtags-enable-standard-keybindings c-mode-base-map)
    ; 関数cmake-ide-setupを呼ぶのはrtagsをrequireしてから。
    (cmake-ide-setup)
    )
  )

;; helm-rtags
(require 'helm-rtags)
(setq rtags-use-helm t)

;; semantic refactoring
(require 'srefactor)
(define-key c-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
(define-key c++-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
