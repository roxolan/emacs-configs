;; batch mode

(req-package batch-mode
  :config (add-to-list 'auto-mode-alist '("\\.bat\\'" . batch-mode)))

(provide 'init-batch)
