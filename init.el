(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("elpa" . "http://tromey.com/elpa/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("sunrise" . "http://joseito.republika.pl/sunrise-commander/")))

(defconst my-custom-file "~/.emacs.d/custom.el")
(defconst my-preload-file "~/.emacs.d/init-preload.el")

(setq custom-file my-custom-file)
(load my-custom-file t)
(load my-preload-file t)

(add-hook 'after-init-hook #'(lambda () (load "~/.emacs.d/init-real.el")))
