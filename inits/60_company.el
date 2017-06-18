;; 全バッファで有効にする
(global-company-mode +1)

;; 自動補完をoffにしたい場合，company-ide-delayをnilに設定する
(setq company-idle-delay 0)

(set-face-attribute 'company-tooltip nil
                    :foreground "black" :background "lightgrey")
(set-face-attribute 'company-tooltip-common nil
                    :foreground "black" :background "lightgrey")
(set-face-attribute 'company-tooltip-common-selection nil
                    :foreground "white" :background "steelblue")
(set-face-attribute 'company-tooltip-selection nil
                    :foreground "black" :background "steelblue")
(set-face-attribute 'company-preview-common nil
                    :background nil :foreground "lightgrey" :underline t)
(set-face-attribute 'company-scrollbar-fg nil
                    :background "orange")
(set-face-attribute 'company-scrollbar-bg nil
                    :background "gray40")

(global-set-key (kbd "C-i") 'company-complete)

;; C-n, C-pで補完候補を次/前の候補を選択
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-search-map (kbd "C-n") 'company-select-next)
(define-key company-search-map (kbd "C-p") 'company-select-previous)

;; C-sで絞り込む
(define-key company-active-map (kbd "C-s") 'company-filter-candidates)

;; TABで候補を設定
;;(define-key company-active-map (kbd "<tab>") 'company-complete)

;; TABキーの挙動をいい感じにする
;; 候補が1つ => それを選択
;; 候補が複数 => 挿入可能なprefixがあれば挿入し，なければcompany-select-nextする
(defun company--insert-candidate2 (candidate)
  (when (> (length candidate) 0)
    (setq candidate (substring-no-properties candidate))
    (if (eq (company-call-backend 'ignore-case) 'keep-prefix)
        (insert (company-strip-prefix candidate))
      (if (equal company-prefix candidate)
          (company-select-next)
          (delete-region (- (point) (length company-prefix)) (point))
        (insert candidate))
      )))

(defun company-complete-common2 ()
  (interactive)
  (when (company-manual-begin)
    (if (and (not (cdr company-candidates))
             (equal company-common (car company-candidates)))
        (company-complete-selection)
      (company--insert-candidate2 company-common))))

(define-key company-active-map (kbd "<tab>") 'company-complete-common2)
;;(global-set-key (kbd "<tab>") 'company-complete)

;; 各種メジャーモードでも C-iで company-modeの補完を使う
(define-key emacs-lisp-mode-map (kbd "C-i") 'company-complete)


;; quick-help
(company-quickhelp-mode +1)

;; company for haskell
(add-to-list 'company-backends 'company-ghc)
