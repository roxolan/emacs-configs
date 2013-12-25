(req-package scala-mode2
             :ensure
             scala-mode2
             :init
             (setq scala-indent:align-parameters t))

(req-package ensime
             :require
             scala-mode2
             :ensure
             ensime
             :init
             (add-hook 'scala-mode-hook 'ensime-scala-mode-hook))

(req-package sbt-mode
             :require
             scala-mode2
             :ensure
             sbt-mode)

(provide 'init-scala)
