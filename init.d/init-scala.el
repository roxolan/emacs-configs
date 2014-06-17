(req-package scala-mode2
  :require key-chord
  :config
  (progn (setq scala-indent:align-parameters t)
		 (key-chord-define scala-mode-map ";;"  "\C-e;")
		 (key-chord-define scala-mode-map "//"  "\C-e //")
		 (key-chord-define scala-mode-map "{}"  "{\n\n}\C-p\t")
		 (key-chord-define scala-mode-map "(}"  "() {\n\n}\C-p\t"))

  :mode "\\.scala\\'")

(req-package sbt-mode
  :commands sbt-start)

(req-package ensime
  :require scala-mode2
  :config (add-hook 'scala-mode-hook 'ensime-scala-mode-hook))

(provide 'init-scala)
