(req-package company
  :config (progn (global-company-mode 1)
                 (setq company-idle-delay 0.1)
                 (setq company-show-numbers t)
                 (setq company-minimum-prefix-length 2)
                 (setq company-dabbrev-downcase nil)
                 (setq company-dabbrev-other-buffers t)
                 (setq company-auto-complete t)
                 (global-set-key (kbd "C-<tab>") 'company-dabbrev)
                 (global-set-key (kbd "M-<tab>") 'company-complete)))

(provide 'init-company)
