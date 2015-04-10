(req-package flycheck
  :config (global-flycheck-mode 1))

(req-package flycheck-pos-tip
  :comments flycheck-pos-tip-error-messages
  :require flycheck
  :init (setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))

(provide 'init-flycheck)
