;; elpa

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("sunrise" . "http://joseito.republika.pl/sunrise-commander/"))

(if (not (has-emacs-version 24 0))
    (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(eval-when-compile (package-initialize))

(defun require-package (package)
  "refresh package archives, check package presence and install if it's not installed"
  (if (null (require package nil t))
      (progn (let* ((ARCHIVES (if (null package-archive-contents)
                                  (progn (package-refresh-contents)
                                         package-archive-contents)
                                package-archive-contents))
                    (AVAIL (assoc package ARCHIVES)))
               (if AVAIL
                   (package-install package)))
             (require package))))

;; el-get

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require-package 'el-get)
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/el-get/recipes")
(el-get 'sync)

;; req-package

(require-package 'req-package)

;; init.d

(defconst my-init-dir "~/.emacs.d/init.d")
(byte-recompile-directory my-init-dir 0 t)
(req-package-force load-dir :config (load-dir-one my-init-dir))

;; finish loading packages

(req-package-finish)
(setq debug-on-error t)

;; start emacs server

(unless (server-running-p)
  (server-start))

(setq emacs-shell-buffer "*emacs-shell*")
(shell-command "touch ~/.emacs.d/server.lock")
(add-hook 'kill-emacs-hook
          (lambda () (shell-command "rm -f ~/.emacs.d/server.lock")))
