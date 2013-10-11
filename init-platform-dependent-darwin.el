(defun init-platform-dependent-start ()
  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
  (require 'pbcopy)
  (turn-on-pbcopy)
)

(provide 'init-platform-dependent-darwin)
