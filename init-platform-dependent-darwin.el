(defun init-platform-dependent-start ()
  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
)

(provide 'init-platform-dependent-darwin)
