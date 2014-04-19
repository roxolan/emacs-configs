(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
						 ("marmalade" . "http://marmalade-repo.org/packages/")
						 ("elpa" . "http://tromey.com/elpa/")
						 ("org" . "http://orgmode.org/elpa/")
						 ("melpa" . "http://melpa.milkbox.net/packages/")
						 ("sunrise" . "http://joseito.republika.pl/sunrise-commander/")))

(add-to-list 'load-path "~/.emacs.d/")

(setq custom-file "~/.emacs.d/custom.el")

(add-hook 'after-init-hook #'(lambda () (load "~/.emacs.d/init-real.el")))
