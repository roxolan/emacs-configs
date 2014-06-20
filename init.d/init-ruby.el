;; ruby mode for rakefile

(req-package ruby-mode
  :mode (("Rakefile\\'" . ruby-mode)
		 ("rb\\'" . ruby-mode)))

(provide 'init-ruby)
