;; ruby ide

(req-package rinari
  :require (ruby-compilation inf-ruby))

;;

(req-package ruby-mode
  :init (add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode)))

(provide 'init-ruby)
