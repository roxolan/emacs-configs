;; json reformatter

(req-package json-reformat
  :commands json-reformat-region
  :init (progn (setq json-reformat:indent-width 2)
			   (setq json-reformat:pretty-string? t)))

(req-package flymake-json
  :require flymake)

(req-package json-mode
  :require flymake-json
  :mode ("\\.json$" . json-mode)
  :init (add-hook 'json-mode-hook
                  (lambda ()
                    (flymake-json-load)
                    (make-local-variable 'js-indent-level)
                    (setq js-indent-level 2))))

(provide 'init-json)
