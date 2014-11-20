(if (eq system-type 'darwin)
    (progn (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
           (add-to-list 'exec-path "/usr/local/bin")))

(provide 'init-darwin)
