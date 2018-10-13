;; confを読み込む
(setq load-path
      (append '(
                "~/.emacs.d"
                ) load-path))

;; Org Mode LaTeX Export
(require 'ox-latex)
(require 'ox-bibtex)
(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))

;; pdf process = latexmk
(setq org-latex-pdf-process '("latexmk %f"))
;; default class = jsarticle
(setq org-latex-default-class "jsarticle")

;; org-latex-classes
(add-to-list 'org-latex-classes
             '("jsarticle"
               "\\documentclass[11pt,a4paper,uplatex]{jsarticle}
                [NO-DEFAULT-PACKAGES] [PACKAGES] [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
               ))


;; org-export-latex-no-toc
(defun org-export-latex-no-toc (depth)
    (when depth
      (format "%% Org-mode is exporting headings to %s levels.\n"
              depth)))
  (setq org-export-latex-format-toc-function 'org-export-latex-no-toc)

;; reftex with org mode
(add-hook 'org-mode-hook 'turn-on-reftex)
(defun org-mode-reftex-setup ()
   (load-library "reftex")
   (and (buffer-file-name)
        (file-exists-p (buffer-file-name))
        (reftex-parse-all))
   (define-key org-mode-map (kbd "C-c [") 'reftex-citation))

(setq org-latex-packages-alist
  '(("AUTO" "inputenc"  nil)
    ("hyperref,x11names" "xcolor"  nil)
    ("colorlinks=true,urlcolor=SteelBlue4,linkcolor=Firebrick4" "hyperref"  nil)
(put 'upcase-region 'disabled nil)
