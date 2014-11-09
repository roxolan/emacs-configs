(require 'package)

;; bootstrap utils

(defconst my-custom-file "~/.emacs.d/custom.el")

(setq custom-file my-custom-file)
(load my-custom-file t)
(setq make-backup-files nil)
;; (setq debug-on-error t)

(defconst emacs-major-version-rad 1000000)

(defun has-emacs-version (major minor)
  "Will be broken when emacs major version will jump over emacs-major-version-rad
   I think I will die before the time it happen"
  (<= (+ (* major emacs-major-version-rad) minor)
      (+ (* emacs-major-version emacs-major-version-rad) emacs-minor-version)))

;; load extensions

(add-hook 'after-init-hook (lambda () (load "~/.emacs.d/init-real.el")))
