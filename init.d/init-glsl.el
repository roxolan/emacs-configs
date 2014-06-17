;; glsl

(req-package glsl-mode
  :mode "\\.vs\\'"
  :mode "\\.fs\\'"
  :mode "\\.gs\\'"
  :config (setq glsl-other-file-alist '(("\\.fs$" (".vs"))
                                        ("\\.vs$" (".fs")))))

(provide 'init-glsl)
