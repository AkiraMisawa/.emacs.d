;;;; ロードパスや .emacs を書くのに利用する関数定義・ロード
(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "~/.emacs.d/elisp/auto-install")
(add-to-list 'load-path "~/.emacs.d/etc")

;;; 自前のプレフィックスキー
(global-unset-key (kbd "C-l"))

;;; dwim 用の入力関数
;;; - リージョンが指定されていないときはミニバッファから入力を求める
;;; - 指定されているときはリージョンの文字列を得る
;;; - ミニバッファの入力のデフォルト値は現在位置のシンボル(単語)
(defun region-or-prompt (prompt)
  (if (region-active-p)
      (prog1
          (buffer-substring (region-beginning) (region-end))
        (deactivate-mark)
        (message ""))
    (read-string (format "%s (default:%s): " prompt (thing-at-point 'symbol))
                 nil nil (thing-at-point 'symbol))))

;;; 前置引数で動作を変える関数作成用
;;; (auto-install-from-url "https://github.com/tm8st/emacs-prefix-arg-commands/raw/master/prefix-arg-commands.el")
(require 'prefix-arg-commands)

;;; 前置引数で C-u を叩いた回数を数える
(defun count-c-u (prefix)
  (cond ((= prefix 1)
         0)
        ((< prefix 16)
         1)
        (t
         (+ 1 (count-c-u (/ prefix 4))))))
