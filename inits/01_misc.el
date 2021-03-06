;;;; 変数の初期設定など

;; mark set
(global-set-key (kbd "C-<return>") 'set-mark-command)

;; 行を保ったまま上下に連続して移動する
(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines 1))
    (forward-line)
    (move-to-column col)))
(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines -1))
    (move-to-column col)))
(global-set-key (kbd "M-n") 'move-line-down)
(global-set-key (kbd "M-p") 'move-line-up)

;; スクロールを鮮やかにする
;;(require 'smooth-scroll)
;;(smooth-scroll-mode t)
(global-set-key (kbd "C-<tab>") 'indent-for-tab-command)

;;; 警告音の代わりにウィンドウの上下1行ずつが反転
(setq visible-bell t)
;;(setq w32-visible-bell-type 'x)
;; 警告音もフラッシュも全て無効(警告音が完全に鳴らなくなるので注意)
;;(setq ring-bell-function 'ignore)


;;; font-lock(色)の設定
(global-font-lock-mode t)

;;; タブ文字ではなくスペースでインデント
(setq-default indent-tabs-mode nil)

;;; スタートアップメッセージを表示しないようにする
(setq inhibit-startup-message t)

;;; window 分割時、画面外に出る文章を折り返す
(setq truncate-partial-width-windows nil)

;;; オートセーブの場所を指定する
(setq backup-directory-alist
      `((".*" . "~/.emacs.cache/auto-save-file")))
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.cache/auto-save-file" t)))
(setq auto-save-list-file-prefix
      "~/.emacs.cache/auto-save-list/.saves-")

;;; ロックファイルを作成しない
(setq create-lockfiles nil)

;;; 規定文字数で自動改行しない
(setq text-mode-hook 'turn-off-auto-fill)

;;; Shift+矢印で画面切り替え
(windmove-default-keybindings)

;;; メニューのBuffersを階層に分ける
(msb-mode 1)

;;; C-↓による段落移動に，"・"などの行を含める
(setq paragraph-start '"^\\([ 　・○<\t\n\f]\\|(?[0-9a-zA-Z]+)\\)")

;;; C-vでスクロールした際，カーソルを一番上(下)に移動しない．
(setq scroll-preserve-screen-position t)

;;; 画面外にカーソルを移動した際，1行ずつ移動．
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)
(setq comint-scroll-show-maximum-output t)

;;; find fileで大文字小文字を区別しない
(setq read-file-name-completion-ignore-case t)

;;; 初回の set-goal-column (C-x C-n) で選択画面を出さない
(put 'set-goal-column 'disabled nil)

;;; ファイル内のカーソル位置を記憶する
(use-package saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs.cache/saved-places")

;;; 括弧を目立たせる
;(show-paren-mode 1)

;;; 対応する括弧を自動入力
(electric-pair-mode 1)

;;; 行番号・桁番号を表示する
(line-number-mode 0)
(column-number-mode 1)

;;; GCを減らして軽くする(デフォルトの10倍)
(setq gc-cons-threshold (* 10 gc-cons-threshold))

;;; ミニバッファを再帰的に呼び出せるようにする
(setq enable-recursive-minibuffers t)

;;; 履歴をたくさん保存する
(setq history-length 1000)

;;; キーストロークをエコーエリアに早く表示する
(setq echo-keystrokes 0.1)

;;; 大きいファイルを開こうとしたときに警告
;;; デフォルトは10MBなので25MBに拡張
(setq large-file-warning-threshold (* 25 1024 1024))

;;; ミニバッファで入力を取り消しても履歴を残す
(defadvice abort-recursive-edit (before minibuffer-save activate)
  (when (eq (selected-window) (active-minibuffer-window))
    (add-to-history minibuffer-history-variable (minibuffer-contents))))

;;; yes or no を y or n に変更
(fset 'yes-or-no-p 'y-or-n-p)

;;; ツールバー、メニューバーを表示しない
(tool-bar-mode 0)
(menu-bar-mode 1)

;;; M-x exitでEmacsを終了する
(defalias 'exit 'save-buffers-kill-emacs)

;;; Lisp nesting exceeds max-lisp-eval-depth の防止
(setq max-lisp-eval-depth 1000)

;;; Variable binding depth exceeds max-specpdl-size の防止
(setq max-specpdl-size 6000)

;;; 補完候補から外す拡張子
(setq completion-ignored-extensions
      (append completion-ignored-extensions
              '(".exe" ".aux" ".log" ".dvi" ".pdf")))

;;; diff モードは最初は read-only にする
(setq diff-default-read-only t)

;;; ediff で新規ウィンドウを表示しない
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;;; 最初から縦分割
(setq ediff-split-window-function 'split-window-horizontally)

;;; narowing 禁止
(put 'narrow-to-region 'disabled nil)

;;; cookies ファイルの保存場所を変更
(setq url-cookie-file "~/.emacs.cache/url/cookies")

;;; カーソル位置に応じた find-file
(ffap-bindings)

;;; fill-paragraph のエラーを防止
(setq kinsoku-limit 4)

;;; 内部での日付/時間表記は英語で行う
(setq system-time-locale "C")

;;; 全角スペースの幅を 1 文字と認識される問題の修正
(set-language-environment "Japanese")

;;; C-i と TAB を別のキーとして扱う
(setq local-function-key-map (delq '(kp-tab . [9]) local-function-key-map))


;;; 長いリストも全て出力する
(setq eval-expression-print-length nil)
(setq eval-expression-print-level nil)

;;; Commands History を永久保存
(setq desktop-dirname "~/.emacs.cache/")
(setq desktop-path (list desktop-dirname))
(setq desktop-globals-to-save '(extended-command-history))
(setq desktop-files-not-to-save "")
(desktop-save-mode 1)

;;; ミニバッファにおいてスペースで補完
(if (boundp 'minibuffer-local-filename-completion-map)
    (define-key minibuffer-local-filename-completion-map
      " " 'minibuffer-complete-word))
(if (boundp 'minibuffer-local-must-match-filename-map)
    (define-key minibuffer-local-must-match-filename-map
      " " 'minibuffer-complete-word))

;;; 内容が0になったファイルを削除
(if (not (memq 'delete-file-if-no-contents after-save-hook))
    (setq after-save-hook
          (cons 'delete-file-if-no-contents after-save-hook)))
(defun delete-file-if-no-contents ()
  (when (and
         (buffer-file-name (current-buffer))
         (= (point-min) (point-max)))
    (sleep-for 0.1)                     ; flycheck 使用時にミニバッファが消えるのを回避
    (when (y-or-n-p "Delete file and kill buffer?")
      (delete-file
        (buffer-file-name (current-buffer)))
      (kill-buffer (current-buffer)))))

;;; 選択範囲を isearch
(defadvice isearch-mode (around isearch-mode-default-string (forward &optional regexp op-fun recursive-edit word-p) activate)
  (if (and transient-mark-mode mark-active (not (eq (mark) (point))))
      (progn
        (isearch-update-ring (buffer-substring-no-properties (mark) (point)))
        (deactivate-mark)
        ad-do-it
        (if (not forward)
            (isearch-repeat-backward)
          (goto-char (mark))
          (isearch-repeat-forward)))
    ad-do-it))

;;; P87-89 モードラインに関する設定
;; カラム番号も表示
(column-number-mode t)
;; ファイルサイズを表示
(size-indication-mode t)
;; 時計を表示（好みに応じてフォーマットを変更可能）
(setq display-time-day-and-date t) ; 曜日・月・日を表示
(setq display-time-24hr-format t) ; 24時表示
(display-time-mode t)
;; バッテリー残量を表示
(display-battery-mode t)
;; リージョン内の行数と文字数をモードラインに表示する（範囲指定時のみ）
;; http://d.hatena.ne.jp/sonota88/20110224/1298557375
(defun count-lines-and-chars ()
  (if mark-active
      (format "%d lines,%d chars "
              (count-lines (region-beginning) (region-end))
              (- (region-end) (region-beginning)))
    ;; これだとエコーエリアがチラつく
    ;;(count-lines-region (region-beginning) (region-end))
    ""))

(add-to-list 'default-mode-line-format
             '(:eval (count-lines-and-chars)))

;;; P90 タイトルバーにファイルのフルパスを表示
(setq frame-title-format "%f")
;; 行番号を常に表示する
(global-linum-mode t)

;; バッファ自動再読み込み
(global-auto-revert-mode 1)

;; ハイライト関係の設定
;; 現在行のハイライト
(require 'hl-line)
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background  "#98FB98"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)

;;; hl-lineを無効にするメジャーモードを指定する
(defvar global-hl-line-timer-exclude-modes '(todotxt-mode))
(defun global-hl-line-timer-function ()
  (unless (memq major-mode global-hl-line-timer-exclude-modes)
    (global-hl-line-unhighlight-all)
    (let ((global-hl-line-mode t))
      (global-hl-line-highlight))))
(setq global-hl-line-timer
      (run-with-idle-timer 0.03 t 'global-hl-line-timer-function))
;; (cancel-timer global-hl-line-timer)

;; 対応する括弧をハイライト
(show-paren-mode t)
;; 括弧のハイライトの設定
(setq show-paren-style 'mixed)
;; 選択範囲をハイライト
(transient-mark-mode t)

;; volatile-highlights
(require 'volatile-highlights)
(volatile-highlights-mode t)


;; 自動でファイル更新
(defun revert-buffer-no-confirm (&optional force-reverting)
  "Interactive call to revert-buffer. Ignoring the auto-save
 file and not requesting for confirmation. When the current buffer
 is modified, the command refuses to revert it, unless you specify
 the optional argument: force-reverting to true."
  (interactive "P")
  ;;(message "force-reverting value is %s" force-reverting)
  (if (or force-reverting (not (buffer-modified-p)))
      (revert-buffer :ignore-auto :noconfirm)
    (error "The buffer has been modified")))
;; reload buffer
(global-set-key (kbd "s-r") 'revert-buffer-no-confirm)
