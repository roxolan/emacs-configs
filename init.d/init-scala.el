(req-package scala-mode2
  :config (progn (setq scala-indent:align-parameters t))
  :mode (("\\.scala\\'" . scala-mode)
         ("\\.sc\\'" . scala-mode)))

(req-package sbt-mode
  :commands sbt-start)

;; (req-package ensime
;;   :require (scala-mode2 auto-complete)
;;   :config (add-hook 'scala-mode-hook 'ensime-scala-mode-hook))

(provide 'init-scala)
