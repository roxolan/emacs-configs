(if (eq system-type 'darwin)
	(progn (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))))

(provide 'init-darwin)
