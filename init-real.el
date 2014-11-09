;; req-package

(eval-when-compile (package-initialize))

(require 'cl)

;; bootstrap

(defun require-package (package)
  "refresh package archives, check package presence and install if it's not installed"
  (if (null (require package nil t))
      (progn (let* ((ARCHIVES (if (null package-archive-contents)
				  (progn (package-refresh-contents)
					 package-archive-contents)
				package-archive-contents))
		    (AVAIL (some (lambda (elem)
				   (eq (car elem) package))
				 ARCHIVES)))
	       (if AVAIL
		   (package-install package)))
	     (require package))))

(require-package 'req-package)

;; bootstrap -^

;; init.d

(req-package-force el-get
  :init (progn (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/el-get/recipes")
               (el-get 'sync)))
(req-package-force load-dir :init (load-dir-one "~/.emacs.d/init.d"))

;; finish loading packages

(req-package-finish)

;; start emacs server

(server-start)

(setq emacs-shell-buffer "*emacs-shell*")
(shell-command "touch ~/.emacs.d/server.lock")
(add-hook 'kill-emacs-hook
          (lambda () (shell-command "rm -f ~/.emacs.d/server.lock")))
