;; req-package

(eval-when-compile (package-initialize))

(require 'cl)

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
    (progn (package-try-install 'req-package)
           (require 'req-package)))

;; auto complete

(req-package auto-complete
             :init (progn (require 'auto-complete-config)
                          (global-auto-complete-mode t)
                          (setq ac-auto-start 1)
                          (setq ac-quick-help-delay 0.1)
                          (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)))

;; flymake

(req-package flymake
             :init (progn (add-hook 'find-file-hook 'flymake-find-file-hook)
                          (global-set-key (kbd "<f2>") 'flymake-goto-prev-error)
                          (global-set-key (kbd "<f3>") 'flymake-goto-next-error)
                          (setq flymake-gui-warnings-enabled nil)
                          (setq flymake-log-level 0)))

(req-package flymake-cursor
             :require flymake)

;; yasnippet

(req-package yasnippet
             :init (yas-global-mode 1))

;; init.d

(use-package load-dir
  :ensure load-dir
  :init (load-dir-one "~/.emacs.d/init.d"))

;; finish loading packages

(req-package-finish)

;; start emacs server

(server-start)
