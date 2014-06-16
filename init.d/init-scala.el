(req-package scala-mode2
  :config
  (setq scala-indent:align-parameters t))

(req-package sbt-mode
  :require
  scala-mode2)

(req-package ensime
  :require
  (scala-mode2 sbt-mode)
  :config
  (add-hook 'scala-mode-hook 'ensime-scala-mode-hook))

(provide 'init-scala)
