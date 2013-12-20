(if (eq system-type 'darwin)
	(progn   (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
			 (use-package pbcopy
			   :ensure pbcopy
			   :init (turn-on-pbcopy))
			 (use-package exec-path-from-shell
			   :ensure exec-path-from-shell
			   :init (progn (exec-path-from-shell-initialize)))))
