(require 'req-package)

;; haskell mode

(req-package haskell-mode
  :mode "\\.hs$"
  :config (progn (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
                 (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)))

(provide 'init-haskell)
