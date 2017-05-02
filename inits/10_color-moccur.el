;;;; バッファ・ディレクトリ内検索

(use-package color-moccur
  :ensure color-moccur)
(setq moccur-split-word t)
(setq guide-key/popup-window-position 'bottom)
(setq moccur-use-migemo t)


(defun dmoccur-alternate (dir regexp)
  "`dmoccur-list' を用いた検索を行う"
  (interactive (list (dmoccur-read-from-minibuf t)
                     (moccur-regexp-read-from-minibuf)))
  (dmoccur dir regexp t))


;;; M-u M-x dmoccur で検索するディレクトリ
;; (setq dmoccur-list
;;       '(("elisp" "~/Dropbox/dotfiles/.emacs.d/inits/" (".el") nil)))


(global-set-key (kbd "C-l o") 'dmoccur)
(global-set-key (kbd "C-l k") 'clean-dmoccur-buffers)
