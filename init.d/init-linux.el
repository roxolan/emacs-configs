(if (eq system-type 'gnu/linux)

	(progn ;; open links with xdg

           (req-package browse-url
             :config (setq browse-url-browser-function
                           (lambda (url &rest args)
                             (call-process-shell-command "xdg-open" nil 0 nil url))))

           ;; fonts

           (set-default-font "SourceCodePro-9" t)
           (set-fontset-font "fontset-default" 'cyrillic-iso8859-5 '("Liberation Mono" . "iso10646-1"))

           ;; aur interface
           (req-package aurel :commands aurel-package-search)))

(provide 'init-linux)
