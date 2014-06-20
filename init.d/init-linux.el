(if (eq system-type 'gnu/linux)

	(progn (req-package battery
             :config
             (progn (setq battery-mode-line-format " %p%%")
                    (display-battery-mode)))

           ;; open links with xdg

           (req-package browse-url
             :config (setq browse-url-browser-function
                           (lambda (url &rest args)
                             (call-process-shell-command "xdg-open" nil 0 nil url))))

           ;; aur interface
           (req-package aurel :commands aurel-package-search)))

(provide 'init-linux)
