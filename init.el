(require 'package)

(defconst emacs-major-version-rad 1000000)

(defun has-emacs-version (major minor)
  "will be broken when emacs marjor version will jump over emacs-major-version-rad"
  (<= (+ (* major emacs-major-version-rad) minor)
      (+ (* emacs-major-version emacs-major-version-rad) emacs-minor-version)))

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("sunrise" . "http://joseito.republika.pl/sunrise-commander/"))

(if (not (has-emacs-version 24 0))
    (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(setq package-enable-at-startup nil)

(defconst my-custom-file "~/.emacs.d/custom.el")
(defconst my-preload-file "~/.emacs.d/init-preload.el")

(setq custom-file my-custom-file)
(load my-custom-file t)
(load my-preload-file t)

(add-hook 'after-init-hook #'(lambda () (load "~/.emacs.d/init-real.el")))
