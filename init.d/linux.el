(if (eq system-type 'gnu/linux)
	(progn 	(setq battery-mode-line-format " %p%%")
			(display-battery-mode)))
