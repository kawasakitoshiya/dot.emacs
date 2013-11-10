;;package repository
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" .
	       "http://marmalade-repo.org/packages/"))
(package-initialize)

;;anything requirements
(defvar org-directory "")
(require 'anything)
(require 'anything-config)
(require 'anything-match-plugin)
(require 'anything-complete)
(anything-read-string-mode 1)
(require 'anything-show-completion)

;;dont make backup file
(setq make-backup-files nil)
(setq auto-save-default nil)

;;key-bindings
(define-key global-map "\C-h" 'delete-backward-char)
(define-key global-map "\M-?" 'help-for-help)
(define-key global-map (kbd "C-z") 'undo)
(define-key global-map (kbd "M-a") 'anything)
(define-key global-map (kbd "M-i") 'indent-region)


(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; syntax highlight
(set-face-foreground 'font-lock-function-name-face "yellow")

;;dont use tab and use 4 spaces
(setq-default tab-width 4 indent-tabs-mode nil)

;;color Tab and 2 byte space
(defface my-face-b-1 '((t (:background "NavajoWhite4"))) nil) ;2byte space
(defface my-face-b-2 '((t (:background "gray10"))) nil) ;Tab
(defface my-face-u-1 '((t (:background "SteelBlue" :underline t))) nil) ; spaces at end of lien
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)

(defadvice font-lock-mode (before my-font-lock-mode ())
 (font-lock-add-keywords
 major-mode
 '(("\t" 0 my-face-b-2 append)
 ("　" 0 my-face-b-1 append)
 ("[ \t]+$" 0 my-face-u-1 append)
 )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
