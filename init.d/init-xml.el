;; xml

(req-package auto-complete-nxml
  :disabled t
  :require auto-complete
  :config (progn (setq-default nxml-child-indent 4)
                 (setq nxml-child-indent 4)))

(provide 'init-xml)
