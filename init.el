;;; (install-elisp "http://www.rubyist.net/~rubikitch/archive/init-loader-x.el")

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'init-loader-x "~/.emacs.d/elisp/init-loader-x")
(init-loader-load "~/.emacs.d/inits")

;; 文字コード
(prefer-coding-system 'utf-8)

;; color themeq
(load-theme 'misterioso t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (magit srefactor haskell-mode realgud ein aggressive-indent racket-mode helm-rtags weblogger volatile-highlights use-package smooth-scroll smartrep smartparens sequential-command rtags rainbow-delimiters quickrun py-autopep8 point-undo php-mode omnisharp neotree monokai-theme minimap markdown-mode imenu-anywhere iedit helm-swoop helm-projectile helm-orgcard helm-migemo helm-dired-recent-dirs helm-descbinds helm-c-yasnippet helm-bm helm-ag guide-key google-c-style gnuplot-mode gnuplot fold-dwim flymake-python-pyflakes flymake-google-cpplint flymake-cursor flymake flycheck-irony flycheck-google-cpplint exec-path-from-shell emamux elpy cython-mode company-statistics company-quickhelp company-jedi color-moccur cmake-mode cmake-ide cedit auto-install auto-highlight-symbol auto-complete-c-headers all-the-icons))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-constant-face ((t (:foreground "medium aquamarine"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1")))))
