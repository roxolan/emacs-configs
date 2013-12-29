(if (eq system-type 'darwin)
	(progn   (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))

			 (req-package pbcopy
                          :init
                          (turn-on-pbcopy))

			 (req-package exec-path-from-shell
                          :init
                          (exec-path-from-shell-initialize))))

(provide 'init-darwin)
