(if (eq system-type 'gnu/linux)

	(progn (req-package battery
             :init
             (progn (setq battery-mode-line-format " %p%%")
                    (display-battery-mode)))

           ;; open links with xdg

           (req-package browse-url
             :init (setq browse-url-browser-function
                         (lambda (url &rest args)
                           (call-process-shell-command "xdg-open" nil 0 nil url))))

           ;; aur interface
           (req-package aurel)))

(provide 'init-linux)
