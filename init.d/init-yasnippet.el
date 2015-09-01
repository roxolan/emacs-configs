(require 'req-package)

(req-package yasnippet
  :config (progn (yas-global-mode 1)
                 (global-set-key (kbd "C-M-y") 'yas/expand)))

(provide 'init-yasnippet)
