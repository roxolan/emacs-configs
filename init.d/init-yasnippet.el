(require 'req-package)

(req-package yasnippet
  :commands yas-minor-mode
  :init (add-hook 'prog-mode-hook #'yas-minor-mode)
  :config (yas-reload-all))

(provide 'init-yasnippet)
