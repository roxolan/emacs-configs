(require 'req-package)

; use emr

(req-package emr
  :commands
  emr-show-refactor-menu
  :init
  (define-key emacs-lisp-mode-map (kbd "M-RET") 'emr-show-refactor-menu)
  :config
  (emr-initialize))

; use litable

(req-package litable :commands litable-mode)

; use eldoc

(req-package eldoc
  :commands eldoc-mode
  :init (progn (add-hook 'emacs-lisp-mode-hook (lambda () (eldoc-mode 1)))
			   (add-hook 'lisp-interaction-mode-hook (lambda () (eldoc-mode 1)))))

; flycheck

(req-package lisp-mode
  :require flycheck
  :commands lisp-mode
  :config (add-hook 'emacs-lisp-mode-hook
                    (lambda () (setq flycheck-disabled-checkers '(emacs-lisp-checkdoc)))))

(req-package elisp-slime-nav
  :commands elisp-slime-nav-mode
  :init (dolist (hook '(emacs-lisp-mode-hook lisp-interaction-mode-hook))
          (add-hook hook 'elisp-slime-nav-mode)))

(req-package nameless
  :commands nameless-mode-from-hook
  :init (add-hook 'emacs-lisp-mode-hook 'nameless-mode-from-hook))

(provide 'init-elisp)
