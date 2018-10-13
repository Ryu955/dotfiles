(package-initialize)

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; option to meta
(if window-system (progn
    (when (equal system-type 'darwin)
      (setq mac-option-modifier 'meta))
))

;;フォントサイズ
(if window-system (progn
    (when (equal system-type 'darwin) ;; Macでは16pt
      (add-to-list 'default-frame-alist '(font . "ricty-16")))
))

;; タイトルパーにファイルのフルパスを表示する
(setq frame-title-format "%f")

;; 行番号を表示する
(global-linum-mode t)

;; カラム番号も表示する
(column-number-mode t)

;; 空白文字を強制表示
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b14770")

;; 対応する括弧を表示
(show-paren-mode t)
(setq show-paren-delay 0)

;; 行間
(setq-default line-spacing 0)

;; 全角スペースを強制表示する
(require 'whitespace)
(global-whitespace-mode 1)
(setq whitespace-style '(face
                         trailing
                         tabs
                         spaces
                         empty
                         space-mark
                         tab-mark
                         ))
(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))
(setq whitespace-space-regexp "\\(\u3000+\\)")

;; タブ文字ではなくスペースを使う
(setq-default indent-tabs-mode nil)

;; タブ幅をスペース2つ分にする
(setq-default tab-width 2)

;; 1行ずつスクロールさせる
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)

;; フレーム(ウィンドウ)の透明度を設定する
(set-frame-parameter (selected-frame) 'alpha '(0.90))

;; カーソルのある行をハイライトする
(global-hl-line-mode t)

;; バックアップとオートセーブファイルを~/.emacs.d/backups/へ集める
(add-to-list 'backup-directory-alist
             (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))

(load-theme 'misterioso t)

;; Org Mode LaTeX Export
(require 'ox-latex)
(require 'ox-bibtex)
(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))

;; pdf process = latexmk
(setq org-latex-pdf-process '("latexmk %f"))
;; default class = jsarticle
;;(setq org-latex-default-class "jsarticle")

;;; \hypersetup{...} を出力しない
(setq org-latex-with-hyperref nil)

(add-to-list 'org-latex-classes
             '("thesis"
               "\\documentclass{jarticle}
                [NO-PACKAGES]
                [NO-DEFAULT-PACKAGES]
                \\usepackage[dvipdfmx]{graphicx}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (org-plus-contrib))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
