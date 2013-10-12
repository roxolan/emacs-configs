(defun init-platform-dependent-start ()
  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
  (use-package pbcopy
	:ensure pbcopy
	:init (turn-on-pbcopy))
  )

(provide 'init-platform-dependent-darwin)
