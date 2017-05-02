;;; (install-elisp "http://www.rubyist.net/~rubikitch/archive/init-loader-x.el")

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'init-loader-x "~/.emacs.d/elisp/init-loader-x")
(init-loader-load "~/.emacs.d/inits")

;; color theme
(load-theme 'misterioso t)
