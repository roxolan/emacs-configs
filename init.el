(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")))

;; packages paths

(defun package-update-load-path ()
  "Update the load path for newly installed packages"
  (interactive)
  (let ((package-dir (expand-file-name  package-user-dir)))
	(mapc (lambda (pkg)
			(let ((stem (symbol-name (car pkg)))
				  (mapc (lambda (num)
						  (if first
							  (setq first nil)
							  (setq version (format "%s." version)))
						  (setq version (format "%s%s" version num)))
						(aref (cdr pkg) 0))
				  (setq path (format "%s/%s-%s" package-dir stem version))
				  (add-to-list 'load-path path)))
			package-alist)))
)

(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/glsl-mode")

;; theme

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes (quote ("d1a574d57027c2bfadde6982455dfce8d27ced3ae4747c1c0313f95d23e96713" "f41fd682a3cd1e16796068a2ca96e82cfd274e58b978156da0acce4d56f2b0d5" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; after init

(add-hook 'after-init-hook #'(lambda () (load "~/.emacs.d/init-real.el")))
