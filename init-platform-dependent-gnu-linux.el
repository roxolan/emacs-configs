(defun init-platform-dependent-start ()
	(setq battery-mode-line-format " %p%%")
	(display-battery-mode)
)

(provide 'init-platform-dependent-gnu-linux)
