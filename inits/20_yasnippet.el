;;;; YASnippet の設定

;; (use-package yasnippet
;;   :ensure t
;;   :diminish yas-minor-mode
;;   :bind (:map yas-minor-mode-map
;;               ("C-x i i" . yas-insert-snippet)
;;               ("C-x i n" . yas-new-snippet)
;;               ("C-x i v" . yas-visit-snippet-file)
;;               ("C-x i l" . yas-describe-tables)
;;               ("C-x i g" . yas-reload-all))
;;   :config
;;   (yas-global-mode 1)
;;   (setq yas-propt-functions '(yas-ido-prompt)))

(require 'yasnippet)
(setq yas-snippet-dirs
      '(;; 自作スニペット
        ;; yas-new-snippetで作成したスニペットが保存される
        "~/.emacs.d/mysnippets"
        ;; packageに最初から含まれるスニペット
        yas-installed-snippets-dir))


(require 'helm-c-yasnippet)
(setq helm-yas-space-match-any-greedy t)
(global-set-key (kbd "C-c y") 'helm-yas-complete)
(yas-global-mode 1)
(yas-load-directory "~/.emacs.d/elpa/yasnippet-20170418.351/snippets")

;; (setq yas-prompt-functions '(yas-no-prompt))
;; (define-key yas-minor-mode-map (kbd "C-i") nil)


;; ;;; フィールドの編集で smartchr が効かなくなる問題の修正
;; (remove-hook 'c-mode-common-hook
;;              '(lambda ()
;;                 (dolist (k '(":" ">" ";" "<" "{" "}"))
;;                   (define-key (symbol-value (make-local-variable 'yas-keymap))
;;                     k 'self-insert-command))))

;; ;;; キーが重複したときに yas-snippet-dirs のリストで先頭に近い
;; ;;; ディレクトリのスニペットが挿入されるように修正
;; (defun yas--prompt-for-template (templates &optional prompt)
;;   (when templates
;;     (some #'(lambda (fn)
;;               (funcall fn (or prompt "Choose a snippet: ")
;;                        templates
;;                        #'yas--template-name))
;;           yas-prompt-functions)))
