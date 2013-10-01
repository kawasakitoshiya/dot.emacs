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
(define-key global-map (kbd "C-i") 'indent-region)

;; I never use C-x C-c
(global-set-key (kbd "C-x C-c") '(message "cant exit")) 
(defalias 'exit 'save-buffers-kill-emacs)

