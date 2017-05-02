(require 'cmake-mode)
(setq auto-mode-alist
      (append'(("CMakeLists\\.txt\\'" . cmake-mod))
             '(("\\.cmake\\'" . cmake-mod))
             auto-mode-alist))
