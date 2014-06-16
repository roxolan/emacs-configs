;; js2 mode

(req-package js2-mode
  :config (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

(provide 'init-js)
