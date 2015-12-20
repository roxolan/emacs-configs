(require 'req-package)

;; haskell mode

(req-package haskell-mode
  :mode (("\\.hs$" . haskell-mode)
         (".xmobarrc$" . haskell-mode))
  :config
  (req-package-hooks-add-execute 'haskell-mode 'turn-on-haskell-doc-mode)
  (req-package-hooks-add-execute 'haskell-mode 'turn-on-haskell-indentation))

(req-package cabal-mode
  :mode ("\\.cabal$" . cabal-mode))

(req-package company-ghc
  :require haskell-mode company
  :config
  (req-package-hooks-add-execute 'haskell-mode (lambda () (ghc-init)))
  (add-to-list 'company-backends 'company-ghc))

(req-package hindent
  :require haskell-mode
  :commands hindent-mode
  :init (req-package-hooks-add-execute 'haskell-mode 'hindent-mode))

(provide 'init-haskell)
