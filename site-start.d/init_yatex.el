;; yatex-mode
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq YaTeX-use-hilit19 nil
        YaTeX-use-font-lock t)
(setq YaTeX-kanji-code 4)
(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode) ("\\.sty$" . yatex-mode)) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq YaTeX-use-AMS-LaTeX t)
(setq YaTeX-template-file "~/.emacs.d/share/yatextemplate.tex")
;(setq tex-command "/Applications/TeXLive/Library/texlive/2013/bin/x86_64-darwin/ptex2pdf -e -ot '-synctex=1'")
(setq tex-command "platex")
(setq dvi2-command "open -a Skim")
(setq bibtex-command "/Applications/TeXLive/Library/texlive/2013/bin/x86_64-darwin/pbibtex")
(add-hook 'yatex-mode-hook '(lambda () (reftex-mode t)))
;;RefTeXにおいて数式の引用を\eqrefにする
(setq reftex-label-alist '((nil ?e nil "~\\eqref{%s}" nil nil)))

(defun skim-forward-search ()
  (interactive)
  (progn
    (process-kill-without-query
     (start-process  
      "displayline"
      nil
      "/Applications/Skim.app/Contents/SharedSupport/displayline"
      (number-to-string (save-restriction
                          (widen)
                          (count-lines (point-min) (point))))
      (expand-file-name
       (concat (file-name-sans-extension (or YaTeX-parent-file
                                             (save-excursion
                                               (YaTeX-visit-main t)
                                               buffer-file-name)))
               ".pdf"))
      buffer-file-name))))

(add-hook 'yatex-mode-hook
          '(lambda ()
             (define-key YaTeX-mode-map (kbd "C-c C-s") 'skim-forward-search)))

(add-hook 'yatex-mode-hook
          '(lambda ()
             (auto-fill-mode -1)))


;;数式モードの";"補間の強化
(setq YaTeX-math-sign-alist-private
      '(("q"         "quad"          "__")
        ("qq"        "qquad"         "____")
        ("ls"        "varlimsup"     "___\nlim")
        ("li"        "varliminf"     "lim\n---")
        ("il"        "varinjlim"     "lim\n-->")
        ("st"        "text{ s.~t. }" "s.t.")
        ("bigop"     "bigoplus"      "_\n(+)~")
        ("bigot"     "bigotimes"     "_\n(x)\n ~")
        ("pl"        "varprojlim"    "lim\n<--")
        ("T" "top" "T")
        ("Q" "mathbb{Q}" "(Q)")
        ("Z" "mathbb{Z}" "ZZ")
        ("R" "mathbb{R}" "R")
        ("C" "mathbb{C}" "R")
        ("Z" "mathbb{N}" "N")
        ("st" "text{s.t.}" "s.t.")
        ("op" "^{\\text{op}}" "op")
        ("{/" "notin" "∉")
        ("..." "dots" "...")
        ("()" "concat" "⌢")
        ("|`" "restr" "|`")
        (">->" "rightarrowtail" ">->")
        ("->>" "twoheadrightarrow" "->>")
        ("~>" "leadsto" "~>")
        ("<>" "diamondsuit" "<>")
        ("<|" "lhd" "<|")
        ("|>" "rhd" "|>")
        ("<(" "preccurlyeq" "<(")
        (">(" "succcurlyeq" ">(")
        ("|v" "downarrow" "↓")
        ("|^" "uparrow" "↑")
        ("||v" "Downarrow" "⇓")
        ("||^" "Uparrow" "⇑")
        ))

(setq YaTeX-math-funcs-list
      '(("s"	"sin"           "sin")
        ("c"    "cos"           "cos") 
        ("t"    "tan"           "tan")
        ("hs"	"sinh"          "sinh")
        ("hc"   "cosh"          "cosh")
        ("ht"   "tanh"          "tanh")
        ("S"	"arcsin"        "arcsin")
        ("C"    "arccos"        "arccos")
        ("T"    "arctan"        "arctan")
        ("se"   "sec"           "sec")
        ("cs"   "csc"           "csc")
        ("cot"  "cot"           "cot")
        ("l"    "ln"            "ln")
        ("L"    "log"           "log")
        ("e"    "exp"           "exp")
        ("M"    "max"           "max")
        ("m"    "min"           "min")
        ("su"   "sup"           "sup")
        ("in"   "inf"           "inf")
        ("di"   "dim"           "dim")
        ("de"   "det"           "det")
        ("i"    "imath"         "i")
        ("j"    "jmath"         "j")
        ("I"    "Im"            "Im")
        ("R"    "Re"            "Re")
        ))
(setq YaTeX-math-key-list-private
      '(("," . YaTeX-math-funcs-list)
        ))

;; 数式モードの"@"補完の強化
(setq
 YaTeX-font-list-private
 '(("c"  "mathcal")
   ("f"  "mathfrak")
   ("bb" "mathbb")
   ("bf" "mathbf")
   ("r"  "mathrm")
   ("s"  "mathscr")
   )
 )

(setq
 YaTeX-math-key-list-private
 '(("@" . YaTeX-font-list-private)
   )
 )


(provide 'init_yatex)
