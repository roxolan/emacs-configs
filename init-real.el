;; req-package

(eval-when-compile (package-initialize))

(require 'cl)

;; bootstrap
;;   this code block is just a bootstrapping helper
;; for clean emacs installation with copy of this configs repo.
;;   i noticed, that clean emacs installation has empty
;; package-archive-contents variable.
;;   it happening because you have not any packages descriptions into
;; ~/.emacs.d/elpa/archives directory. so there is no information
;; about req-package at first emacs launch.
;;   that's why i check package-archive-contents and fetch descriptions
;; in case this variable is empty and then i'm tring to install it
;; using package-install function.
(defun package-try-install (package)
  "installs package if not installed"
  (let* ((ARCHIVES (if (null package-archive-contents)
                       (progn (package-refresh-contents)
                              package-archive-contents)
                     package-archive-contents))
         (AVAIL (some (lambda (elem)
                        (eq (car elem) package))
                      ARCHIVES)))
    (if AVAIL
        (package-install package))))

(if (null (require 'req-package "req-package" t))
    ;; requre failed, it might be first start.
    ;; try to fetch archives and install req-package.
    ;; then require again.
    (progn (package-try-install 'req-package)
           (require 'req-package)))
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
