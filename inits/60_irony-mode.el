; 初回起動時のみ，
; M-x irony-install-server RET
; でirony-serverをインストールする．irony-serverがインストールされる場所は
; irony-server-install-prefixで指定できる．あとは適当にprefixを打てばcompanyが補完候補を表示してくれるはず．

(require 'irony)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
; irony-cdb-autosetup-compile-optionsは，complile_commands.jsonから
; コンパイルオプションを取得するためのもの．
;(add-to-list 'company-backend 'company-irony)

; 常に使用するコンパイルオプションを設定する．
;; 連想リストの中身を文字列のリストに変更せず、変数そのままの構造を利用。
;; 複数のコンパイルオプションはスペースで区切る
(setq irony-lang-compile-option-alist
      (quote ((c++-mode . "c++ -std=c++11")
              (c-mode . "c"))))

;; アドバイスによって関数を再定義。
;; split-string によって文字列をスペース区切りでリストに変換
;; (24.4以降 新アドバイス使用)
(defun ad-irony--lang-compile-option ()
  (defvar irony-lang-compile-option-alist)
  (let ((it (cdr-safe (assq major-mode irony-lang-compile-option-alist))))
    (when it (append '("-x") (split-string it "\s")))))
(advice-add 'irony--lang-compile-option :override #'ad-irony--lang-compile-option)
