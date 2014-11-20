;; json reformatter

(req-package json-reformat :commands json-reformat-region)

(req-package flymake-json
  :require flymake)

(req-package json-mode
  :require flymake-json
  :mode ("\\.json$" . json-mode)
  :init (add-hook 'json-mode-hook (lambda () (flymake-json-load))))

(provide 'init-json)
