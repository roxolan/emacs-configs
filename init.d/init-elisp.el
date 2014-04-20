;; use emr

(req-package emr
  :init
  (progn (emr-initialize)
         (define-key emacs-lisp-mode-map
           (kbd "M-RET")
           'emr-show-refactor-menu)))

;; use litable

(req-package litable
  :init (add-hook 'emacs-lisp-mode-hook (lambda () (litable-mode 1))))

(provide 'init-elisp)
