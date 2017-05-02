;;; ff++-mode.el --- Major mode for the FreeFem++ language

;; Copyright © 2014 holomorph

;; Created: 25 Jan 2014
;; Keywords: languages

;; This file is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published
;; by the Free Software Foundation, either version 3 of the License,
;; or (at your option) any later version.

;; This file is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with file.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Inspired by `freefem++-mode.el' by J. Rafael Rodríguez Galván
;; <https://github.com/cucharro/emacs/blob/master/freefem++-mode.el>

;; FreeFem++ <http://www.freefem.org/ff++/> is a partial differential
;; equation solver. It has its own language. Freefem scripts can solve
;; multiphysics nonlinear systems in 2D and 3D.

;;; Code:

(require 'cc-mode)
(require 'compile)

(eval-when-compile
  (require 'cc-langs)
  (require 'cc-fonts))

(eval-and-compile
  (c-add-language 'ff++-mode 'c++-mode))


;; Program invocation

(defvar ff++-program "FreeFem++"
  "Command used to execute FreeFem++. Possible values: FreeFem++,
FreeFem++-nw, FreeFem++-mpi.  See also `ff++-program-options'.")

(defvar ff++-program-options "-ne"
  "Options applied to `ff++-program'.

Options:
 -v <level>,      level of freefem output (0--1000000)
 -fglut <path>,   the file name of save all plots (replot with ffglut command )
 -glut <command>, change <command> compatible with ffglut
 -gff <command>,  change <command> compatible with ffglut (with space quoting)
 -nowait,         nowait at the end on window
 -wait,           wait at the end on window
 -nw,             no ffglut, ffmedit  (=> no graphics windows)
 -ne,             no edp script output
 -cd,             Change dir to script dir")

(defvar ff++-process
  "Process currently executing `ff++-program'")

(defun ff++-interrupt-process()
  "Send interrupt signal to FreeFem++ process."
  (interactive)
  (interrupt-process ff++-process))

(defun ff++-kill-process()
  "Send kill signal to FreeFem++ process."
  (interactive)
  (kill-process ff++-process))

(defun ff++-run-buffer()
  "Send current buffer to FreeFem++."
  (interactive)
  (save-some-buffers)
  (let
      ((ff++-code-buffer (file-name-nondirectory buffer-file-name))
       (compile-command (concat ff++-program " " ff++-program-options)))
    (setq ff++-process
          (compile (concat compile-command " " ff++-code-buffer)))))

;; Tell compilation mode how to recognize errors in FreeFem++ output
(add-to-list 'compilation-error-regexp-alist 'ff++)
(add-to-list 'compilation-error-regexp-alist-alist
  '(ff++ "^\s*Error line number \\([0-9]+\\), in file \\([[:alpha:]][-[:alnum:].]+\\)," 2 1))


;; Easy menu

(c-lang-defconst c-mode-menu
  ;; The definition for the mode menu. The menu title is prepended to
  ;; this before it's fed to `easy-menu-define'.
  t `(["Process this buffer" ff++-run-buffer t]
      ["Interrupt FreeFem++ process" ff++-interrupt-process t]
      ["Kill FreeFem++ process" ff++-kill-process t]
      "---"
      ["Comment Out Region" comment-dwim
       (c-fn-region-is-active-p)]
      ["Uncomment Region" comment-dwim
       (c-fn-region-is-active-p)]
      ["Indent Expression" c-indent-exp
       (memq (char-after) '(?\( ?\[ ?\{))]
      ["Indent Line or Region" c-indent-line-or-region t]
      ["Fill Comment Paragraph" c-fill-paragraph t]
      "----"
      ["Backward Statement" c-beginning-of-statement t]
      ["Forward Statement" c-end-of-statement t]
      "----"
      ("Toggle..."
       ["Syntactic indentation" c-toggle-syntactic-indentation
        :style toggle :selected c-syntactic-indentation]
       ["Electric mode" c-toggle-electric-state
        :style toggle :selected c-electric-flag]
       ["Auto newline" c-toggle-auto-newline
        :style toggle :selected c-auto-newline]
       ["Hungry delete" c-toggle-hungry-state
        :style toggle :selected c-hungry-delete-key]
       ["Subword mode" c-subword-mode
        :style toggle :selected (and (boundp 'c-subword-mode)
                                     c-subword-mode)])))


;; Support for FreeFem++

;;;###autoload
(defvar ff++-mode-syntax-table nil
  "Syntax table used in ff++-mode buffers.")
(if (or ff++-mode-syntax-table
        (setq ff++-mode-syntax-table
              (funcall (c-lang-const c-make-mode-syntax-table c))))
    (modify-syntax-entry ?' "_" ff++-mode-syntax-table))

(defvar ff++-mode-abbrev-table nil
  "Abbreviation table used in ff++-mode buffers.")
(c-define-abbrev-table 'ff++-mode-abbrev-table
  '(("else" "else" c-electric-continued-statement 0)
    ("while" "while" c-electric-continued-statement 0)
    ("catch" "catch" c-electric-continued-statement 0)
    ("finally" "finally" c-electric-continued-statement 0)))

(defvar ff++-mode-map ()
  "Keymap used in ff++-mode buffers.")
(if ff++-mode-map nil
  (setq ff++-mode-map (c-make-inherited-keymap))
  ;; add bindings which are only useful for FreeFem++
  (define-key ff++-mode-map "\C-c\C-c" 'ff++-run-buffer)
  (define-key ff++-mode-map "\C-c\C-i" 'ff++-interrupt-process)
  (define-key ff++-mode-map "\C-c\C-k" 'ff++-kill-process)
  )

(easy-menu-define ff++-menu ff++-mode-map "FreeFem++ Mode Commands"
  (cons "FreeFem++" (c-lang-const c-mode-menu ff++)))

;;;###autoload (add-to-list 'auto-mode-alist '("\\.[ei]dp\\'" . ff++-mode))

;;;###autoload
(define-derived-mode ff++-mode c++-mode "FreeFem++"
  "Major mode for editing code written in the FreeFem++ programming language.
See http://www.freefem.org/ff++/ for more information about the FreeFem++
language.  The hook `c-mode-common-hook' is run with no args at mode
initialization, then `ff++-mode-hook'.

Key bindings:
\\{ff++-mode-map}"
  (c-initialize-cc-mode t)
  (set-syntax-table ff++-mode-syntax-table)
  (setq local-abbrev-table ff++-mode-abbrev-table
        abbrev-mode t)
  (use-local-map ff++-mode-map)
  (c-init-language-vars-for 'c++-mode)
  (c-common-init 'c++-mode)
  (easy-menu-add ff++-menu)
  (c-run-mode-hooks 'c-mode-common-hook 'ff++-mode-hook)
  (c-update-modeline))

;;; ff++-mode.el ends here
