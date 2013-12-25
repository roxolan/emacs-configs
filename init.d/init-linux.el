(if (eq system-type 'gnu/linux)

	(req-package battery
                 :init
                 (progn (setq battery-mode-line-format " %p%%")
                        (display-battery-mode))))

(provide 'init-linux)
