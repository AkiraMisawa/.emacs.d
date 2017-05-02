;;;; 標準コマンドのキー割り当て
;;; electric-newline は ] のインデント位置を間違えるので newline-and-indent を使用
(global-set-key (kbd "C-j") 'newline-and-indent)

;;; サスペンドしない
(global-unset-key (kbd "C-x C-z"))

;;; C-h にバックスペース
(keyboard-translate ?\C-h ?\C-?)

;;; C-x C-rでファイル再読み込み
(global-set-key (kbd "C-x C-r") 'revert-buffer)

;;; C-l をプレフィックスキーとしたため元のコマンドを C-l C-l に変更
(global-set-key (kbd "C-l C-l") 'recenter-top-bottom)

;;; 置換のコマンドを C-l プレフィックスキーを使ったキーに変更
(global-set-key (kbd "C-l R") 'query-replace-regexp)
(global-set-key (kbd "C-l C-r") 'query-replace)

;;; C-x C-cをEmacs終了ではなくクライアントの終了に割り当てる
(global-set-key (kbd "C-x C-c") 'server-edit)

;;; ミニバッファで C-w で区切りまで削除
(define-key minibuffer-local-completion-map (kbd "C-w") 'backward-kill-word)

;;; CUA モードの矩形選択
(global-set-key (kbd "C-x SPC") 'cua-rectangle-mark-mode)

;;; M-SPC を just-one-space から cycle-spacing に置き換える
(global-set-key (kbd "C-SPC") 'cycle-spacing)

;;; 連続的にプレフィックスキーを有効にする
;;; 2画面分割時の画面移動
(require 'smartrep)
(smartrep-define-key
    global-map "C-l" '(("n" . (lambda () (scroll-other-window 1)))
                       ("p" . (lambda () (scroll-other-window -1)))
                       ("N" . 'scroll-other-window)
                       ("P" . (lambda () (scroll-other-window '-)))
                       ("a" . (lambda () (beginning-of-buffer-other-window 0)))
                       ("e" . (lambda () (end-of-buffer-other-window 0)))))

;;; コマンド連続実行時の挙動設定
(require 'sequential-command-config)
(sequential-command-setup-keys)

;;; メニュー選択でプレフィックスキーを使いやすくする
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4"))
(guide-key-mode 1)
