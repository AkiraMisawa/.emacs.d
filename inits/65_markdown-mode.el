(require 'markdown-mode)
;; MacでのMarkdownビューワの指定
;;(setq markdown-open-command "marked2.sh")
(defun markdown-preview-file ()
  "run Marked on the current file and revert the buffer"
  (interactive)
  (shell-command 
   (format "open -a /Applications/Marked2.app %s" 
       (shell-quote-argument (buffer-file-name))))
  )
(global-set-key "\C-cm" 'markdown-preview-file)
