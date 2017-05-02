;; インデントカラー追加
(require 'highlight-indentation)
(add-hook 'python-mode-hook 'highlight-indentation-current-column-mode)
(set-face-background 'highlight-indentation-face "#40483e")

;; 自動インデントの設定
;; python-modeの時にReturnキーでいい感じにインデントしてくれるように設定
(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map (kbd "C-m") 'newline-and-indent)
            (define-key python-mode-map (kbd "RET") 'newline-and-indent)))


;; py-autopep8の設定
;; Pythonプログラムを保存する時に自動的にPEP8準拠の形式に変換してくれるよう設定
(require 'py-autopep8)
;; 保存時にバッファ全体を自動整形
(add-hook 'before-save-hook 'py-autopep8-before-save)


;; company-jediの設定
;; Pythonの補完用ツール
;; company-modeでjediの補完を使うためのbackend
;; 初回実行時のみ M-x jedi:install-server RET でjediサーバをインストールする
;; インストールされる場所は jedi:environment-rootで指定可能
(add-to-list 'company-backends 'company-jedi)


;; flymake関連の設定
(require 'flymake-python-pyflakes)
(setq flymake-python-pyflakes-executable "flake8")
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
