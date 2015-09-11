(require 'req-package)

;; haskell mode

(req-package haskell-mode
  :mode "\\.hs$"
  :config (progn (req-package-add-hook-execute 'haskell-mode 'turn-on-haskell-doc-mode)
                 (req-package-add-hook-execute 'haskell-mode 'turn-on-haskell-indent)))

(provide 'init-haskell)
