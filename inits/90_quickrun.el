(require 'quickrun)
(global-set-key (kbd "<f5>") 'quickrun)
(global-set-key (kbd "C-<f5>") 'quickrun-with-arg)
(global-set-key (kbd "M-<f5>") 'quickrun-compile-only)

;; c++のコンパイラをclang++に設定する
(quickrun-add-command "c++/c1z"
  '((:command . "g++")
    (:exec . ("%c -std=c++11 %o -o %e %s"
              "%e %a"))
    (:remove . ("%e")))
  :default "c++")
